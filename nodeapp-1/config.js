module.exports = {
  port: process.env.PORT || 3000,
  environment: process.env.NODE_ENV || 'development',
  azure: {
    artifactsFeed: process.env.AZURE_ARTIFACTS_FEED || 'https://pkgs.dev.azure.com/certstarorg/_packaging/az400-npm-feed/npm/registry/'
  }
};