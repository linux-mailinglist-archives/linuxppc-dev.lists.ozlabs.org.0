Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 828FCA6D8C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 18:07:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NBfv4QknzDqlZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 02:07:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NBbz5V5yzDqTY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 02:04:46 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x83G4HnT010981;
 Tue, 3 Sep 2019 11:04:17 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x83G4F0O010980;
 Tue, 3 Sep 2019 11:04:15 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 3 Sep 2019 11:04:15 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 3/6] powerpc: Convert flush_icache_range & friends to C
Message-ID: <20190903160415.GA9749@gate.crashing.org>
References: <20190903052407.16638-1-alastair@au1.ibm.com>
 <20190903052407.16638-4-alastair@au1.ibm.com>
 <20190903130430.GC31406@gate.crashing.org>
 <d268ee78-607e-5eb3-ed89-d5c07f672046@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d268ee78-607e-5eb3-ed89-d5c07f672046@c-s.fr>
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
Cc: Alastair D'Silva <alastair@au1.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, alastair@d-silva.org, Qian Cai <cai@lca.pw>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 03, 2019 at 04:28:09PM +0200, Christophe Leroy wrote:
> Le 03/09/2019 à 15:04, Segher Boessenkool a écrit :
> >On Tue, Sep 03, 2019 at 03:23:57PM +1000, Alastair D'Silva wrote:
> >>+	asm volatile(
> >>+		"   mtctr %2;"
> >>+		"   mtmsr %3;"
> >>+		"   isync;"
> >>+		"0: dcbst   0, %0;"
> >>+		"   addi    %0, %0, %4;"
> >>+		"   bdnz    0b;"
> >>+		"   sync;"
> >>+		"   mtctr %2;"
> >>+		"1: icbi    0, %1;"
> >>+		"   addi    %1, %1, %4;"
> >>+		"   bdnz    1b;"
> >>+		"   sync;"
> >>+		"   mtmsr %5;"
> >>+		"   isync;"
> >>+		: "+r" (loop1), "+r" (loop2)
> >>+		: "r" (nb), "r" (msr), "i" (bytes), "r" (msr0)
> >>+		: "ctr", "memory");
> >
> >This outputs as one huge assembler statement, all on one line.  That's
> >going to be fun to read or debug.
> 
> Do you mean \n has to be added after the ; ?

Something like that.  There is no really satisfying way for doing huge
inline asm, and maybe that is a good thing ;-)

Often people write \n\t at the end of each line of inline asm.  This works
pretty well (but then there are labels, oh joy).

> >loop1 and/or loop2 can be assigned the same register as msr0 or nb.  They
> >need to be made earlyclobbers.  (msr is fine, all of its reads are before
> >any writes to loop1 or loop2; and bytes is fine, it's not a register).
> 
> Can you explicit please ? Doesn't '+r' means that they are input and 
> output at the same time ?

That is what + means, yes -- that this output is an input as well.  It is
the same to write

  asm("mov %1,%0 ; mov %0,42" : "+r"(x), "=r"(y));
or to write
  asm("mov %1,%0 ; mov %0,42" : "=r"(x), "=r"(y) : "0"(x));

(So not "at the same time" as in "in the same machine instruction", but
more loosely, as in "in the same inline asm statement").

> "to be made earlyclobbers", what does this means exactly ? How to do that ?

You write &, like "+&r" in this case.  It means the machine code writes
to this register before it has consumed all asm inputs (remember, GCC
does not understand (or even parse!) the assembler string).

So just

		: "+&r" (loop1), "+&r" (loop2)

will do.  (Why are they separate though?  It could just be one loop var).


Segher
