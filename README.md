# Currency exchange building

## Make commands:
### Deploy application

```bash
make init
```

Wait until tarantool builds (you can check WebUI http://localhost:8888/)

```bash
make deploy
```

After deploying you can use application!

### Down application

```bash
make down
```

### Go into docker containers:

currency-exchange:
```bash
make exec-currency-exchange
```

tarantool:
```bash
make exec-tarantool
```

## Tarantool

WebUI: http://localhost:8888/
