Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D463005D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 15:46:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMht211dXzDr6Y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jan 2021 01:46:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMhq32RL3zDr5R
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jan 2021 01:44:13 +1100 (AEDT)
Date: Fri, 22 Jan 2021 09:44:05 -0500
From: Rich Felker <dalias@libc.org>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [musl] Re: [PATCH v2] powerpc/64/signal: balance return
 predictor stack in signal trampoline
Message-ID: <20210122144402.GP23432@brightrain.aerifal.cx>
References: <20200511101952.1463138-1-npiggin@gmail.com>
 <87im7pp5yl.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87im7pp5yl.fsf@oldenburg.str.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: musl@lists.openwall.com, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 22, 2021 at 12:27:14PM +0100, Florian Weimer wrote:
> * Nicholas Piggin:
> 
> > diff --git a/arch/powerpc/kernel/vdso64/sigtramp.S b/arch/powerpc/kernel/vdso64/sigtramp.S
> > index a8cc0409d7d2..bbf68cd01088 100644
> > --- a/arch/powerpc/kernel/vdso64/sigtramp.S
> > +++ b/arch/powerpc/kernel/vdso64/sigtramp.S
> > @@ -6,6 +6,7 @@
> >   * Copyright (C) 2004 Benjamin Herrenschmuidt (benh@kernel.crashing.org), IBM Corp.
> >   * Copyright (C) 2004 Alan Modra (amodra@au.ibm.com)), IBM Corp.
> >   */
> > +#include <asm/cache.h>		/* IFETCH_ALIGN_BYTES */
> >  #include <asm/processor.h>
> >  #include <asm/ppc_asm.h>
> >  #include <asm/unistd.h>
> > @@ -14,21 +15,17 @@
> >  
> >  	.text
> >  
> > -/* The nop here is a hack.  The dwarf2 unwind routines subtract 1 from
> > -   the return address to get an address in the middle of the presumed
> > -   call instruction.  Since we don't have a call here, we artificially
> > -   extend the range covered by the unwind info by padding before the
> > -   real start.  */
> > -	nop
> >  	.balign 8
> > +	.balign IFETCH_ALIGN_BYTES
> >  V_FUNCTION_BEGIN(__kernel_sigtramp_rt64)
> > -.Lsigrt_start = . - 4
> > +.Lsigrt_start:
> > +	bctrl	/* call the handler */
> >  	addi	r1, r1, __SIGNAL_FRAMESIZE
> >  	li	r0,__NR_rt_sigreturn
> >  	sc
> >  .Lsigrt_end:
> >  V_FUNCTION_END(__kernel_sigtramp_rt64)
> > -/* The ".balign 8" above and the following zeros mimic the old stack
> > +/* The .balign 8 above and the following zeros mimic the old stack
> >     trampoline layout.  The last magic value is the ucontext pointer,
> >     chosen in such a way that older libgcc unwind code returns a zero
> >     for a sigcontext pointer.  */
> 
> As far as I understand it, this breaks cancellation handling on musl and
> future glibc because it is necessary to look at the signal delivery
> location to see if a system call sequence has result in an action, and
> that location is no longer in user code after this change.
> 
> We have a glibc test in preparation of our change, and it started
> failing:
> 
>   Linux 5.10 breaks sigcontext_get_pc on powerpc64
>   <https://sourceware.org/bugzilla/show_bug.cgi?id=27223>
> 
> Isn't it possible to avoid the return predictor desynchronization by
> adding the appropriate hint?

Maybe I'm missing something but I don't see how this would break musl;
we just inspect the PC in the mcontext, which I don't see any changes
to and which should still point to the next instruction of the
interrupted context. I don't have a test environment though so I'll
have to wait for feedback from ppc users to be sure. Are there any
further details on how it's breaking glibc?

Rich
