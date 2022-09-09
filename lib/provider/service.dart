const baseURL = 'http://192.168.1.49:8000/api/';
// const baseURL = 'http://172.20.10.4:8000/api/';
const loginURL = baseURL + 'auth/login';
const registerURL = baseURL + 'auth/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/user';
const entityUrl=baseURL +'/entities';
const postsURL = baseURL + 'posts';
const accountsURL = baseURL + 'getaccount';

const serverError = 'Erreur du serveur';
const unauthorized = 'Non autorisé';
const somethingWentWrong =
    'Quelque chose s\'est mal passé, veuillez réessayer!';
