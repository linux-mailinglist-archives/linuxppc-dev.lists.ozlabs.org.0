Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1081E10504A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 11:18:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jb9k6hKHzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 21:18:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Jb7M04gCzDqCl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 21:16:14 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id xALAFrfK013183;
 Thu, 21 Nov 2019 04:15:53 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id xALAFq0D013181;
 Thu, 21 Nov 2019 04:15:52 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 21 Nov 2019 04:15:52 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 2/2] powerpc/irq: inline call_do_irq() and
 call_do_softirq()
Message-ID: <20191121101552.GR16031@gate.crashing.org>
References: <f12fb9a6cc52d83ee9ddf15a36ee12ac77e6379f.1570684298.git.christophe.leroy@c-s.fr>
 <5ca6639b7c1c21ee4b4138b7cfb31d6245c4195c.1570684298.git.christophe.leroy@c-s.fr>
 <877e3tbvsa.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877e3tbvsa.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 21, 2019 at 05:14:45PM +1100, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> That breaks 64-bit with GCC9:
> 
>   arch/powerpc/kernel/irq.c: In function 'do_IRQ':
>   arch/powerpc/kernel/irq.c:650:2: error: PIC register clobbered by 'r2' in 'asm'
>     650 |  asm volatile(
>         |  ^~~
>   arch/powerpc/kernel/irq.c: In function 'do_softirq_own_stack':
>   arch/powerpc/kernel/irq.c:711:2: error: PIC register clobbered by 'r2' in 'asm'
>     711 |  asm volatile(
>         |  ^~~
> 
> 
> > diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> > index 04204be49577..d62fe18405a0 100644
> > --- a/arch/powerpc/kernel/irq.c
> > +++ b/arch/powerpc/kernel/irq.c
> > @@ -642,6 +642,22 @@ void __do_irq(struct pt_regs *regs)
> >  	irq_exit();
> >  }
> >  
> > +static inline void call_do_irq(struct pt_regs *regs, void *sp)
> > +{
> > +	register unsigned long r3 asm("r3") = (unsigned long)regs;
> > +
> > +	/* Temporarily switch r1 to sp, call __do_irq() then restore r1 */
> > +	asm volatile(
> > +		"	"PPC_STLU"	1, %2(%1);\n"
> > +		"	mr		1, %1;\n"
> > +		"	bl		%3;\n"
> > +		"	"PPC_LL"	1, 0(1);\n" :
> > +		"+r"(r3) :
> > +		"b"(sp), "i"(THREAD_SIZE - STACK_FRAME_OVERHEAD), "i"(__do_irq) :
> > +		"lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6", "cr7",
> > +		"r0", "r2", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12");
> > +}
> 
> If we add a nop after the bl, so the linker could insert a TOC restore,
> then I don't think there's any circumstance under which we expect this
> to actually clobber r2, is there?

That is mostly correct.

If call_do_irq was a no-inline function, there would not be problems.

What TOC does __do_irq require in r2 on entry, and what will be there
when it returns?


Segher
