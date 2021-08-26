Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B73F8A45
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 16:40:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwQWT0SL0z2ywr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 00:40:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GwQW43cHLz2xXd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 00:40:32 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17QEb8u8022174;
 Thu, 26 Aug 2021 09:37:08 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17QEb8T2022173;
 Thu, 26 Aug 2021 09:37:08 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 26 Aug 2021 09:37:08 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/bug: Remove specific powerpc BUG_ON() and
 WARN_ON() on PPC32
Message-ID: <20210826143708.GC1583@gate.crashing.org>
References: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618331881.git.christophe.leroy@csgroup.eu>
 <1628834356.pr4zgn1xf1.astroid@bobo.none>
 <20210818150653.GJ1583@gate.crashing.org>
 <1629946707.f6ptz0tgle.astroid@bobo.none>
 <20210826124901.GY1583@gate.crashing.org>
 <1629983260.5jkx2jf0y8.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629983260.5jkx2jf0y8.astroid@bobo.none>
User-Agent: Mutt/1.4.2.3i
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 26, 2021 at 11:57:52PM +1000, Nicholas Piggin wrote:
> Excerpts from Segher Boessenkool's message of August 26, 2021 10:49 pm:
> > On Thu, Aug 26, 2021 at 01:26:14PM +1000, Nicholas Piggin wrote:
> >> Excerpts from Segher Boessenkool's message of August 19, 2021 1:06 am:
> >> > On Fri, Aug 13, 2021 at 04:08:13PM +1000, Nicholas Piggin wrote:
> >> >> This one possibly the branches end up in predictors, whereas conditional 
> >> >> trap is always just speculated not to hit. Branches may also have a
> >> >> throughput limit on execution whereas trap could be more (1 per cycle
> >> >> vs 4 per cycle on POWER9).
> >> > 
> >> > I thought only *taken* branches are just one per cycle?
> >> 
> >> Taken branches are fetched by the front end at one per cycle (assuming 
> >> they hit the BTAC), but all branches have to be executed by BR at one 
> >> per cycle
> > 
> > This is not true.  (Simple) predicted not-taken conditional branches are
> > just folded out, never hit the issue queues.  And they are fetched as
> > many together as fit in a fetch group, can complete without limits as
> > well.
> 
> No, they are all dispatched and issue to the BRU for execution. It's 
> trivial to construct a test of a lot of not taken branches in a row
> and time a loop of it to see it executes at 1 cycle per branch.

(s/dispatched/issued/)

Huh, this was true on p8 already.  Sorry for my confusion.  In my
defence, this doesn't matter for performance on "real code".

> > Correctly predicted simple conditional branches just get their prediction
> > validated (and that is not done in the execution units).  Incorrectly
> > predicted branches the same, but those cause a redirect and refetch.
> 
> How could it validate prediction without issuing? It wouldn't know when
> sources are ready.

In the backend.  But that is just how it worked on older cores :-/

> >> The first problem seems like the show stopper though. AFAIKS it would 
> >> need a special builtin support that does something to create the table
> >> entry, or a guarantee that we could put an inline asm right after the
> >> builtin as a recognized pattern and that would give us the instruction
> >> following the trap.
> > 
> > I'm not quite sure what this means.  Can't you always just put a
> > 
> > bla:	asm("");
> > 
> > in there, and use the address of "bla"?
> 
> Not AFAIKS. Put it where?

After wherever you want to know the address after.  You will have to
make sure they stay together somehow.

It is much easier to get the address of something, not the address after
it.  If you know it is just one insn anyway, that isn't hard to handle
either (even if prefixed insns exist).

> > If not, you need to say a lot
> > more about what you actually want to do :-/
> 
> We need to put the address (or relative offset) of the trap instruction
> into an entry in a different section. Basically this:
> 
>    __builtin_trap();
>    asm ("1:                               \n\t"
>         "    .section __bug_table,\"aw\"  \n\t"
>         "2:  .4byte 1b - 2b - 4           \n\t"
>         "    .previous");
> 
> Where the 1: label must follow immediately after the trap instruction, 
> and where the asm must be emitted even for the case of no-return traps 
> (but anything following the asm could be omitted).

The address *after* the trap insn?  That is much much harder than the
address *of* the trap insn.


Segher
