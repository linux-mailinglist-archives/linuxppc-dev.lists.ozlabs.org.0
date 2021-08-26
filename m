Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FC43F8B1F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 17:34:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwRjY54z3z30RK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 01:34:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GwRj52jCvz2yKV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 01:34:15 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17QFUnw3025834;
 Thu, 26 Aug 2021 10:30:49 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17QFUmZn025833;
 Thu, 26 Aug 2021 10:30:48 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 26 Aug 2021 10:30:48 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/bug: Remove specific powerpc BUG_ON() and
 WARN_ON() on PPC32
Message-ID: <20210826153048.GD1583@gate.crashing.org>
References: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618331881.git.christophe.leroy@csgroup.eu>
 <1628834356.pr4zgn1xf1.astroid@bobo.none>
 <20210818150653.GJ1583@gate.crashing.org>
 <1629946707.f6ptz0tgle.astroid@bobo.none>
 <20210826124901.GY1583@gate.crashing.org>
 <1629983260.5jkx2jf0y8.astroid@bobo.none>
 <20210826143708.GC1583@gate.crashing.org>
 <1629989540.drlhb24t2w.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629989540.drlhb24t2w.astroid@bobo.none>
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

On Fri, Aug 27, 2021 at 01:04:36AM +1000, Nicholas Piggin wrote:
> Excerpts from Segher Boessenkool's message of August 27, 2021 12:37 am:
> >> No, they are all dispatched and issue to the BRU for execution. It's 
> >> trivial to construct a test of a lot of not taken branches in a row
> >> and time a loop of it to see it executes at 1 cycle per branch.
> > 
> > (s/dispatched/issued/)
> 
> ?

Dispatch is from decode to the issue queues.  Issue is from there to
execution units.  Dispatch is in-order, issue is not.

> >> How could it validate prediction without issuing? It wouldn't know when
> >> sources are ready.
> > 
> > In the backend.  But that is just how it worked on older cores :-/
> 
> Okay. I don't know about older cores than POWER9. Backend would normally 
> include execution though.
> Only other place you could do it if you don't
> issue/exec would be after it goes back in order, like completion.

You do not have to do the verification in-order: the insn cannot finish
until it is no longer speculative, that takes care of all ordering
needed.

> But that would be horrible for mispredict penalty.

See the previous point.  Also, any insn known to be mispredicted can be
flushed immediately anyway.

> >> >> The first problem seems like the show stopper though. AFAIKS it would 
> >> >> need a special builtin support that does something to create the table
> >> >> entry, or a guarantee that we could put an inline asm right after the
> >> >> builtin as a recognized pattern and that would give us the instruction
> >> >> following the trap.
> >> > 
> >> > I'm not quite sure what this means.  Can't you always just put a
> >> > 
> >> > bla:	asm("");
> >> > 
> >> > in there, and use the address of "bla"?
> >> 
> >> Not AFAIKS. Put it where?
> > 
> > After wherever you want to know the address after.  You will have to
> > make sure they stay together somehow.
> 
> I still don't follow.

some_thing_you_want_to_know_the_address_after_let_us_call_it_A;
empty_asm_that_we_can_take_the_address_of_known_as_B;

You have to make sure the compiler keeps A and B together, does not
insert anything between them, does put them in the assembler output in
the same fragment, etc.

> If you could give a built in that put a label at the address of the trap 
> instruction that could be used later by inline asm then that could work
> too:
> 
>     __builtin_labeled_trap("1:");
>     asm ("    .section __bug_table,\"aw\"  \n\t"
>          "2:  .4byte 1b - 2b               \n\t"
>          "    .previous");

How could a compiler do anything like that?!


Segher
