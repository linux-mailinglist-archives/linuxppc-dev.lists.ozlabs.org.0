Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743B3ADA83
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 17:12:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6fRL2XNQz3byT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 01:12:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4G6fR018S6z305x
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 01:12:11 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 15JF26n5018966;
 Sat, 19 Jun 2021 10:02:07 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 15JF2288018951;
 Sat, 19 Jun 2021 10:02:02 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sat, 19 Jun 2021 10:02:02 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH for 4.16 v7 02/11] powerpc: membarrier: Skip memory
 barrier in switch_mm()
Message-ID: <20210619150202.GZ5077@gate.crashing.org>
References: <20180129202020.8515-1-mathieu.desnoyers@efficios.com>
 <20180129202020.8515-3-mathieu.desnoyers@efficios.com>
 <8b200dd5-f37b-b208-82fb-2775df7bcd49@csgroup.eu>
 <2077369633.12794.1624037192994.JavaMail.zimbra@efficios.com>
 <4d2026cc-28e1-7781-fc95-e6160bd8db86@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d2026cc-28e1-7781-fc95-e6160bd8db86@csgroup.eu>
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
Cc: maged michael <maged.michael@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Dave Watson <davejwatson@fb.com>,
 Will Deacon <will.deacon@arm.com>, "Russell King,
 ARM Linux" <linux@armlinux.org.uk>, David Sehr <sehr@google.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-arch <linux-arch@vger.kernel.org>, x86 <x86@kernel.org>,
 Andrew Hunter <ahh@google.com>, Greg Hackmann <ghackmann@google.com>,
 Ingo Molnar <mingo@redhat.com>, Alan Stern <stern@rowland.harvard.edu>,
 Paul <paulmck@linux.vnet.ibm.com>, Andrea Parri <parri.andrea@gmail.com>,
 Avi Kivity <avi@scylladb.com>, Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-api <linux-api@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 19, 2021 at 11:35:34AM +0200, Christophe Leroy wrote:
> 
> 
> Le 18/06/2021 à 19:26, Mathieu Desnoyers a écrit :
> >----- On Jun 18, 2021, at 1:13 PM, Christophe Leroy 
> >christophe.leroy@csgroup.eu wrote:
> >[...]
> >>
> >>I don't understand all that complexity to just replace a simple
> >>'smp_mb__after_unlock_lock()'.
> >>
> >>#define smp_mb__after_unlock_lock()	smp_mb()
> >>#define smp_mb()	barrier()
> >># define barrier() __asm__ __volatile__("": : :"memory")
> >>
> >>
> >>Am I missing some subtility ?
> >
> >On powerpc CONFIG_SMP, smp_mb() is actually defined as:
> >
> >#define smp_mb()        __smp_mb()
> >#define __smp_mb()      mb()
> >#define mb()   __asm__ __volatile__ ("sync" : : : "memory")
> >
> >So the original motivation here was to skip a "sync" instruction whenever
> >switching between threads which are part of the same process. But based on
> >recent discussions, I suspect my implementation may be inaccurately doing
> >so though.
> >
> 
> I see.
> 
> Then, if you think a 'sync' is a concern, shouldn't we try and remove the 
> forest of 'sync' in the I/O accessors ?
> 
> I can't really understand why we need all those 'sync' and 'isync' and 
> 'twi' around the accesses whereas I/O memory is usually mapped as 'Guarded' 
> so memory access ordering is already garantied.
> 
> I'm sure we'll save a lot with that.

The point of the twi in the I/O accessors was to make things easier to
debug if the accesses fail: for the twi insn to complete the load will
have to have completed as well.  On a correctly working system you never
should need this (until something fails ;-) )

Without the twi you might need to enforce ordering in some cases still.
The twi is a very heavy hammer, but some of that that gives us is no
doubt actually needed.


Segher
