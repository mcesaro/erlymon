%%%-------------------------------------------------------------------
%%% @author Sergey Penkovsky
%%% @copyright (C) 2015, Sergey Penkovsky <sergey.penkovsky@gmail.com>
%%% @doc
%%%    Erlymon is an open source GPS tracking system for various GPS tracking devices.
%%%
%%%    Copyright (C) 2015, Sergey Penkovsky <sergey.penkovsky@gmail.com>.
%%%
%%%    This file is part of Erlymon.
%%%
%%%    Erlymon is free software: you can redistribute it and/or  modify
%%%    it under the terms of the GNU Affero General Public License, version 3,
%%%    as published by the Free Software Foundation.
%%%
%%%    Erlymon is distributed in the hope that it will be useful,
%%%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%%%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%%    GNU Affero General Public License for more details.
%%%
%%%    You should have received a copy of the GNU Affero General Public License
%%%    along with this program.  If not, see <http://www.gnu.org/licenses/>.
%%% @end
%%%-------------------------------------------------------------------

-module(em_password).
-author("Sergey Penkovsky <sergey.penkovsky@gmail.com>").

%% API
-export([
         hash/1
]).

-spec hash(Password :: string()) -> string().
hash(Password) ->
    Bin = crypto:hash(sha512, Password),
    list_to_binary(lists:flatten(list_to_hex(binary_to_list(Bin)))).
    
 
list_to_hex(L) ->
    lists:map(fun(X) ->
                      int_to_hex(X) 
              end, L).
 
int_to_hex(N) when N < 256 ->
    [hex(N div 16), hex(N rem 16)].

 
hex(N) when (N < 10) ->
    $0 + N;
hex(N) when (N >= 10) and (N < 16) ->
    $a + (N-10).
