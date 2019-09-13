-module(shaft_base_prototype).

-behaviour(gen_server).
-behaviour(erlmachine_assembly).
-behaviour(shaft_protorype).

%% API.
-export([start_link/0]).

%% gen_server.
-export([init/1]).
-export([handle_call/3]).
-export([handle_cast/2]).
-export([handle_info/2]).
-export([terminate/2]).
-export([code_change/3]).

-record(state, {}).

%% API.

name(SerialNumber) -> %% I guess registration method and serial number preparation can be provided on gearbox instantination;
     {local, SerialNumber}.

-spec install() -> {ok, pid()}.
install(SerialNumber, DataSheet) ->
    gen_server:start_link(SerialNumber, ?MODULE, DataSheet, []).

mount(SerialNumber, DataSheet) ->
     ok.

pause() ->
    ok.

rotate(SerialNumber, Force, Gears) ->
    erlang:send(SerialNumber, Force),
    Force.

output(SerialNumber, Force) ->
    gen_server:call(SerialNumber, Force).

update(SerialNumber) ->
     ok.

unmount(SerialNumber, ) ->
    ok.

resume() ->
     ok.

-spec uninstall() -> ok.
uninstall(SerialNumber) ->
    gen_server:stop(SerialNumber).

%% gen_server.

init([]) ->
	{ok, #state{}}.

handle_call(_Request, _From, State) ->
	{reply, ignored, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

handle_info(_Info, State) ->
	{noreply, State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.