Return-Path: <linuxppc-dev+bounces-3860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2F79E8C85
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 08:45:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6DS41s8Rz2yHL;
	Mon,  9 Dec 2024 18:45:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.155.80.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733730340;
	cv=none; b=Ww5iPogc9xx56MfQdEyXjWhJmObDVsvfhgWgK349WBOJPla5Psgf8ECOLJtt2Hr2VPPjSkPUqMM5ut2fY17ufKQQ0M+T4ZMFKlIKQCNdshPEgkXpUlBJoNCUSjqeAzplAZE5fROu8G7V2Gizkiz4bieSNGeqqcZ6ZHpbMt5hvX6gfRq+Nyl00zDBKt3vn83v4bCzppIXLbSzwcprN1JfQhLvkZAllOnzhs7sNWU99HRxnuh7hxtL945RBpxOIPVoT2NZhvtoWOxY4S6NzmGeiv5Vi+HSkUi4NQpPX+AcTshcuDPudq6kBwx+PPttW+qgSAEvcctW696ljPrEeIVz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733730340; c=relaxed/relaxed;
	bh=FoijagBqRB/FY5iL5q1fQwnafmAIFkI6PcL0ltPsGIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXLMIdwFIylhernUvA1j+B4NTT+gAvhAqiGC/9e8CZHEbHAePtkawXsQyMz5coJom3VIBgVtJChHogUL7CwBTYUYP5yZfXgLk/iN5ZMWkVli3cw9lHNiNUEB2LzOQesvegFCWmXcWspb7aByNM4/F4LsGNDbsaawLIOdNhJ02Agdrz5qfRAuMsTPf9xZnImJFIKIhyFmw9pf+fkkFR2VjlHjdNbWcOm72o8z/oleGOhAo0LivGREusyg/BLiMlmxlxl/5ax73thYyxbBu8wSQzvmaknR2iEjEL0gmHycqdo+gee3j/RCgI/Pq1sGDEEaDOkcK4vf34JlX3v05X+xEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6DS11gWnz2xt7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 18:45:36 +1100 (AEDT)
X-QQ-mid: bizesmtp81t1733730236t50m2he4
X-QQ-Originating-IP: HB7EA5TvafFgbpsi3xhFZNFKE32VZgEG1vAQTZ15ZO0=
Received: from HX09040029.powercore.com.cn ( [116.233.136.127])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Dec 2024 15:43:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2417205191134874676
Date: Mon, 9 Dec 2024 15:43:21 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, npiggin@gmail.com,
	maddy@linux.ibm.com, bigeasy@linutronix.de,
	ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 1/2] powerpc: Add preempt lazy support
Message-ID: <9B8CF71F0A7A05E9+Z1afmUprV5hKycvr@HX09040029.powercore.com.cn>
References: <20241116192306.88217-1-sshegde@linux.ibm.com>
 <20241116192306.88217-2-sshegde@linux.ibm.com>
 <97991c77-4d9c-4e33-a076-2dd79cd454fb@csgroup.eu>
 <abbab9de-bafd-4f40-a52e-07c8f8acc128@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abbab9de-bafd-4f40-a52e-07c8f8acc128@linux.ibm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MPyU0B5eC9Rqlct19Qm+EPpUpkWMSnpPpuYeHdoVarMDIKm/ny+cqXbR
	+jYz18bIXwcfNfDNOgQFXArOWKqZsBuPqJVsBNTeih9j7cpp0gky3kTfe1HLGfi5IVb3NAJ
	X9ZYwB4+b2R2Ki+w1jK/dsqbLrchWL8V9i30OUKjouSKmzDGoXbZFSlG1M9OKOM58z5819K
	3xorVTY0TPtuxu4/MfVRx2qhI+a8iNVhwDPDyDb3uYO7MORrIYutGWAYDy/qmkWNPj9jOXe
	xUrjhRkz5X87fZcuFh7K8MA0bmBZ+k8z8IGZlZVz+EUbXt0nEqeq34/r09MsZIvvWN0GBak
	RDwhzpYU0KipibJIzDxsrbMZyeTYybQn5TwxSUPbNXkIL5QIk5TJAhJXckpO1kDeaX7vog+
	b3xCE2tJeXdV+zEVdEgcXczUmQLV4p8ya1JxVL7alVWIX86QzCLGUHq1Ka6XcfsKCuYa5Iu
	8ZvL6tXgDgY7T9hYY5qOiKvIvLDPUn5oCW+8Ep1MP3pSbuXC8aRVo/J+ZyuqW2EeRbn1ReJ
	7SJhFBdPeJOrf7K4EUUfmHlVjRKDiRYjlE8iw+XdmZ70fB0r5v57kWEXp25E0YSeACDWmcG
	ZZyGPj2FObqTvlnvggtS7uGMh0Ba4eshbjmDKPnbFi/TrNsDncfR0gt4GJ9MnfZ6pY610oM
	FYB49HPZ35IB6g5Ksro+tfuKyHEVtrA/fOQqRWkG51Nklkc+w3EcEvmw3JWJIdKKeIU+Zs3
	aLMHzQkp5JEom+C1eEwrWyHnM6yXRPrKh/pl9heSuCBjYmtwCE9zvdilKGOljHSe6njCvSo
	NDyccetfUF51hG3Mj+Vay1ZA2H9HxPjjeSVfHoikCF90+YAcLixRaB/I/mnm2lNEPhGK5C4
	AtluubX2EZliN6cpphx0OJnDHGjJmHEWPnTUh+bCSyjm7gxjducv0s1PZxlq+ddLNjf2PBE
	pS40=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 02, 2024 at 12:58:59AM +0530, Shrikanth Hegde wrote:
> 
> 
> On 11/26/24 16:23, Christophe Leroy wrote:
> > 
> > 
> > Le 16/11/2024 à 20:23, Shrikanth Hegde a écrit :
> > > Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
> > > 16 bit range of NEED_RESCHED, so compiler can issue single andi.
> > > 
> > > Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
> > > to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for
> > > return to kernel.
> > 
> > FWIW, there is work in progress on using generic entry/exit for powerpc,
> > if you can help testing it that can help, see https://
> > patchwork.ozlabs.org/project/linuxppc-dev/patch/
> > F0AE0A4571CE3126+20241111031934.1579-2-luming.yu@shingroup.cn/
> > 
> 
> I gave that series a try. After a lot of manual patching on tip tree and
> removal of multiple definition of regs_irqs_disabled, i was able to compile
> and boot.
> 
> I am skimming through the series, but as far as i understand from the
> comments, it needs to be redesigned. I probably get it why. I will go
> through it in more detail to figure out how to do it better. I believe the
> changes have to stem from interrupt_64.S

Thanks for your time for the work.

when you do it, besides compile, boot, and ppc linux-ci github workflow, 
please also do selftest 
make -C tools/testing/selftest TARGETS=seccomp run_tests to make sure
all secommp 98 unit tests passed. 

> 
> As far as the bits of this patch with that patch concerned, it is with
> NEED_RESCHED bits. There atleast couple of major issues in that patch series
> that are wrong.
> 
> 1. It only tries to move exit to user to generic. exit to kernel is not.
> there is generic irqentry_exit that handles it for generic code. powerpc
> exit to kernel still there.
> 
> 2. Even for exit to user, it ends up calling exit_to_user_mode_loop twice
> for the same syscall. that seems wrong. once in
> interrupt_exit_user_prepare_main and once through syscall_exit_to_user_mode
> in syscall_exit_prepare.

I knew this as ppc system call uses interrupt path. I planned to delete
ppc speicifc interrupt_exit_user_prepare_main later for this series.

Now it might be good timing to complete it as there is a real use case need this
to be done. :-)
    
> 
> 
> > Christophe
> > 
> 
> So I guess, when we do eventually if move, this checks would be removed at
> that point along with rest of the code.
> 
> > 
> > > 
> > > Ran a few benchmarks and db workload on Power10. Performance is close to
> > > preempt=none/voluntary.
> > > Since Powerpc systems can have large core count and large memory,
> > > preempt lazy is going to be helpful in avoiding soft lockup issues.
> > > 
> > > Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > Reviewed-by: Ankur Arora <ankur.a.arora@oracle.com>
> > > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > > ---
> > >   arch/powerpc/Kconfig                   | 1 +
> > >   arch/powerpc/include/asm/thread_info.h | 9 ++++++---
> > >   arch/powerpc/kernel/interrupt.c        | 4 ++--
> > >   3 files changed, 9 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > > index 8094a01974cc..2f625aecf94b 100644
> > > --- a/arch/powerpc/Kconfig
> > > +++ b/arch/powerpc/Kconfig
> > > @@ -145,6 +145,7 @@ config PPC
> > >       select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
> > >       select ARCH_HAS_PHYS_TO_DMA
> > >       select ARCH_HAS_PMEM_API
> > > +    select ARCH_HAS_PREEMPT_LAZY
> > >       select ARCH_HAS_PTE_DEVMAP        if PPC_BOOK3S_64
> > >       select ARCH_HAS_PTE_SPECIAL
> > >       select ARCH_HAS_SCALED_CPUTIME        if
> > > VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
> > > diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/
> > > include/asm/thread_info.h
> > > index 6ebca2996f18..2785c7462ebf 100644
> > > --- a/arch/powerpc/include/asm/thread_info.h
> > > +++ b/arch/powerpc/include/asm/thread_info.h
> > > @@ -103,6 +103,7 @@ void arch_setup_new_exec(void);
> > >   #define TIF_PATCH_PENDING    6    /* pending live patching update */
> > >   #define TIF_SYSCALL_AUDIT    7    /* syscall auditing active */
> > >   #define TIF_SINGLESTEP        8    /* singlestepping active */
> > > +#define TIF_NEED_RESCHED_LAZY    9       /* Scheduler driven lazy
> > > preemption */
> > >   #define TIF_SECCOMP        10    /* secure computing */
> > >   #define TIF_RESTOREALL        11    /* Restore all regs (implies
> > > NOERROR) */
> > >   #define TIF_NOERROR        12    /* Force successful syscall return */
> > > @@ -122,6 +123,7 @@ void arch_setup_new_exec(void);
> > >   #define _TIF_SYSCALL_TRACE    (1<<TIF_SYSCALL_TRACE)
> > >   #define _TIF_SIGPENDING        (1<<TIF_SIGPENDING)
> > >   #define _TIF_NEED_RESCHED    (1<<TIF_NEED_RESCHED)
> > > +#define _TIF_NEED_RESCHED_LAZY    (1<<TIF_NEED_RESCHED_LAZY)
> > >   #define _TIF_NOTIFY_SIGNAL    (1<<TIF_NOTIFY_SIGNAL)
> > >   #define _TIF_POLLING_NRFLAG    (1<<TIF_POLLING_NRFLAG)
> > >   #define _TIF_32BIT        (1<<TIF_32BIT)
> > > @@ -142,9 +144,10 @@ void arch_setup_new_exec(void);
> > >                    _TIF_SYSCALL_EMU)
> > >   #define _TIF_USER_WORK_MASK    (_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
> > > -                 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
> > > -                 _TIF_RESTORE_TM | _TIF_PATCH_PENDING | \
> > > -                 _TIF_NOTIFY_SIGNAL)
> > > +                 _TIF_NEED_RESCHED_LAZY | _TIF_NOTIFY_RESUME | \
> > > +                 _TIF_UPROBE | _TIF_RESTORE_TM | \
> > > +                 _TIF_PATCH_PENDING | _TIF_NOTIFY_SIGNAL)
> > > +
> > >   #define _TIF_PERSYSCALL_MASK    (_TIF_RESTOREALL|_TIF_NOERROR)
> > >   /* Bits in local_flags */
> > > diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/
> > > interrupt.c
> > > index af62ec974b97..8f4acc55407b 100644
> > > --- a/arch/powerpc/kernel/interrupt.c
> > > +++ b/arch/powerpc/kernel/interrupt.c
> > > @@ -185,7 +185,7 @@ interrupt_exit_user_prepare_main(unsigned long
> > > ret, struct pt_regs *regs)
> > >       ti_flags = read_thread_flags();
> > >       while (unlikely(ti_flags & (_TIF_USER_WORK_MASK &
> > > ~_TIF_RESTORE_TM))) {
> > >           local_irq_enable();
> > > -        if (ti_flags & _TIF_NEED_RESCHED) {
> 
> 
> 
> > > +        if (ti_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
> > >               schedule();
> > >           } else {
> > >               /*
> > > @@ -396,7 +396,7 @@ notrace unsigned long
> > > interrupt_exit_kernel_prepare(struct pt_regs *regs)
> > >           /* Returning to a kernel context with local irqs enabled. */
> > >           WARN_ON_ONCE(!(regs->msr & MSR_EE));
> > >   again:
> > > -        if (IS_ENABLED(CONFIG_PREEMPT)) {
> > > +        if (IS_ENABLED(CONFIG_PREEMPTION)) {
> > >               /* Return to preemptible kernel context */
> > >               if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
> > >                   if (preempt_count() == 0)
> 


