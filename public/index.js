/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      gameToJoin: ''
    };
  },
  created: function() {},
  methods: {
    createGame: () => {
      axios.post('/api/games',
        {
          current_turn: 0,
          current_has_rolled: false,
          last_roll: null
        }
      ).then((response) => {
        router.push('/games/' + response.data.id);
      });
    },

    joinGame: function() {
      axios.post('/api/players',
        { game_id: this.gameToJoin }
      ).then((response) => {
        router.push('/games/' + this.gameToJoin);
      });
    }
  },
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var GameShowPage = {
  template: "#game-show-page",
  data: function() {
    return {
      game: {
        id: '',
        current_user_turn: false,
        current_has_rolled: false,
        last_roll: null,
        players: [],
        hand: {
          id: '',
          wood_count: 0,
          rock_count: 0,
          wheat_count: 0,
          sheep_count: 0,
          brick_count: 0,
          development_cards: []
        }
      }
    };
  },
  created: function() {
    let game = axios.get('/api/games/' +  + this.$route.params.id).then((response) => {
      this.game = response.data;
    });
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/games/:id", component: GameShowPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
