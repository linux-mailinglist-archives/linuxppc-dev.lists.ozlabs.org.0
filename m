Return-Path: <linuxppc-dev+bounces-14816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90051CC3D12
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 16:06:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW0dT1WPYz2yF1;
	Wed, 17 Dec 2025 02:06:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765897613;
	cv=none; b=XeJm+4xVhA7k7VEE9zCE4ojcLj9grirSeyiOBtml2DG95IWIkp9ffskbTEtpm5ZdHpYgrjPyN7nCsYIgFwmjqXLDLzr6ngRIkDs7bawdRAC3kdxjsXI/4/YP31zRipyXqIo9sTwNxVoBBIGe/0BvRjHkzsbm1/IzBPnrmW1gYfvDS4C6hFAXzBNiKc1glei6IMOBWsnyRHxZmEUmgwd2iIwdXd+D/9mawHLE9hTGunusQAH0ouD129aMCyTyH2yheadcaJlr2Fjw8PtyoMorhPkGIU41ebsSl6stMyMK2bBLKl98DCs1EiG14oRWDSDLXyKxvuN8rtoumrnfrnvIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765897613; c=relaxed/relaxed;
	bh=UUf42Z6E4SrYewiGlv95yS20260pheNHlCCVWVUZSfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cj2tohddmkISM+OWpZEJtbiRL3qwbBsQfod3GpDpjPkFwAWaRuK0hICsPcJkgq6T/+aEvY0T+9N9B1qung/nb6GprTT3AZDOP+DcM4sVMOy3QxPjmfJxYto0Hzs9z/l1kOQv5jEDTwI9fsjEsj3ToDVbVIyEokR5d7jj+TWypk0k8/z4RDYlh4ZzqA/veVeRqMj1GTR+HKuoINNDibiR7YQl8etshVZdxg9Fsgp9jLtXp87ASHQm9gmbsbMqkE+Vn36npIHB3SJhy2fFzM1GriQ0ErBiZaRGXq+jHlBnLSqKH0id06uwcz3exeYi6fUnEAqpOgznytSkpIKrTLKX/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iWXRu97i; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iWXRu97i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW0dS1tgFz2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 02:06:52 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGDbe7M028126;
	Tue, 16 Dec 2025 15:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UUf42Z
	6E4SrYewiGlv95yS20260pheNHlCCVWVUZSfw=; b=iWXRu97iY3zSpdrXMiZxon
	Z76DTsmh49mA9IptrW8yIV2t+2mIJQsOo4Ug1NhSQp8iWczvPD+DKRNYFpkxy38T
	/XzD5GTQ7a6yDtFOcYHS2dCpIjxH2avMvEEQHFH5IkunxYR3dojeN3jkG1xqgYOT
	ot4GoLZ6BJfrhBq5i2DY88urieQtzNOfxLHGtYiQPHRHupTLxqi1e9vNetMkpwza
	OHFfJ+AnSjhVkpyivZ+n/ceFjoYFOr/GL/6288/b7Ec2olte6UyfulRnwW4vHH8T
	cOYwrcyUYFYprDIUnY461DrgTBMDI+Q1ZD8Sf7RDp0a5vOdg8cENORNwHWqY8I+g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvb7qr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:06:30 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BGF6TN9020917;
	Tue, 16 Dec 2025 15:06:29 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvb7qqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:06:29 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGDPPll002761;
	Tue, 16 Dec 2025 15:06:28 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kfn4pxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:06:28 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BGF6NgH45678864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 15:06:24 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3EBC20040;
	Tue, 16 Dec 2025 15:06:23 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8D5F20043;
	Tue, 16 Dec 2025 15:06:17 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.210.89])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Dec 2025 15:06:17 +0000 (GMT)
Date: Tue, 16 Dec 2025 20:36:15 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        sshegde@linux.ibm.com, charlie@rivosinc.com, macro@orcam.me.uk,
        akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
        ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] powerpc: Enable IRQ generic entry/exit path.
Message-ID: <hvvwslwriil2y3ggavgzg7dh4asbg6uybrp2woamowp7ocqzsg@3hpmznaayhqw>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-8-mkchauras@linux.ibm.com>
 <3de95000-19ce-499e-b6b6-7e207c02c73c@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3de95000-19ce-499e-b6b6-7e207c02c73c@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=V/JwEOni c=1 sm=1 tr=0 ts=69417576 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=gbUVfkBPdx3t7svOR5cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: meH7z2Xk97e4IoXDdlRZLNGTBm1HEpGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX35mAlqE+RQbP
 kgUnJo38IPa0ttOv/8KKWk4lRGQFCYGTQe/cLRMQb/owrGmr6Jo5xl+N6JgfgUQY7SxjyF1sFMz
 FOGzZx2QxrOA6pBpUB73dDT8xqcgUaED0D4xQriD8uUZysxQNCQZpqnWGXyMTxaONhRtdUmGcIJ
 I3rtAGHKoJIovzRZJfAmms0Q/MRk08IAE361TX8x83sPBAyO8im1AjWuAANpwkDNNBe2YXX/gp2
 VCotN/aL5AvUOW6jto5mcB3W/+/aaqiHPGUzbkPTUGN/d5c3aXdc4ohgM7sPr0Wa0jllMUHwvui
 5sF1rA3LBH7sX6kwOIkE5R1FcfPa0L4Xy/+MjuCM2F3MfaJfab2qYdv5Vhvwo0V+GO+r0U9YB8M
 UbfX4RCaBC/2C9uPESStEeLR/fhoPw==
X-Proofpoint-ORIG-GUID: tcPsyoM0uo73uYndTNbujLYR2LRUwG7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 11:43:02AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> > From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > 
> > Enable the generic IRQ entry/exit infrastructure on PowerPC by selecting
> > GENERIC_IRQ_ENTRY and integrating the architecture-specific interrupt
> > handlers with the generic entry/exit APIs.
> > 
> > This change replaces PowerPC’s local interrupt entry/exit handling with
> > calls to the generic irqentry_* helpers, aligning the architecture with
> > the common kernel entry model. The macros that define interrupt, async,
> > and NMI handlers are updated to use irqentry_enter()/irqentry_exit()
> > and irqentry_nmi_enter()/irqentry_nmi_exit() where applicable.
> > 
> > Key updates include:
> >   - Select GENERIC_IRQ_ENTRY in Kconfig.
> >   - Replace interrupt_enter/exit_prepare() with arch_interrupt_* helpers.
> >   - Integrate irqentry_enter()/exit() in standard and async interrupt paths.
> >   - Integrate irqentry_nmi_enter()/exit() in NMI handlers.
> >   - Remove redundant irq_enter()/irq_exit() calls now handled generically.
> >   - Use irqentry_exit_cond_resched() for preemption checks.
> > 
> > This change establishes the necessary wiring for PowerPC to use the
> > generic IRQ entry/exit framework while maintaining existing semantics.
> 
> Did you look into resulting code ?
> 
> do_IRQ() is bigger and calls irqentry_enter() which is bigger than
> irq_enter().
> 
> And irq_enter_rcu() was tail-called from irq_enter(), now is it called after
> irqentry_enter().
> 
I am not sure if I understand your question correctly here. Can you
elaborate a little more?

> > 
> > Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > ---
> >   arch/powerpc/Kconfig                    |   1 +
> >   arch/powerpc/include/asm/entry-common.h |  66 +---
> >   arch/powerpc/include/asm/interrupt.h    | 499 +++---------------------
> >   arch/powerpc/kernel/interrupt.c         |  13 +-
> >   4 files changed, 74 insertions(+), 505 deletions(-)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index e24f4d88885a..b0c602c3bbe1 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -206,6 +206,7 @@ config PPC
> >   	select GENERIC_GETTIMEOFDAY
> >   	select GENERIC_IDLE_POLL_SETUP
> >   	select GENERIC_IOREMAP
> > +	select GENERIC_IRQ_ENTRY
> >   	select GENERIC_IRQ_SHOW
> >   	select GENERIC_IRQ_SHOW_LEVEL
> >   	select GENERIC_PCI_IOMAP		if PCI
> > diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> > index e8bde4c67eaf..e2ae7416dee1 100644
> > --- a/arch/powerpc/include/asm/entry-common.h
> > +++ b/arch/powerpc/include/asm/entry-common.h
> > @@ -257,6 +257,17 @@ static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
> >    */
> >   static inline void arch_interrupt_exit_prepare(struct pt_regs *regs)
> >   {
> > +	if (user_mode(regs)) {
> > +		BUG_ON(regs_is_unrecoverable(regs));
> > +		BUG_ON(regs_irqs_disabled(regs));
> > +		/*
> > +		 * We don't need to restore AMR on the way back to userspace for KUAP.
> > +		 * AMR can only have been unlocked if we interrupted the kernel.
> > +		 */
> > +		kuap_assert_locked();
> > +
> > +		local_irq_disable();
> > +	}
> >   }
> >   static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
> > @@ -275,7 +286,6 @@ static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
> >   	    !test_thread_local_flags(_TLF_RUNLATCH))
> >   		__ppc64_runlatch_on();
> >   #endif
> > -	irq_enter();
> >   }
> >   static inline void arch_interrupt_async_exit_prepare(struct pt_regs *regs)
> > @@ -288,7 +298,6 @@ static inline void arch_interrupt_async_exit_prepare(struct pt_regs *regs)
> >   	 */
> >   	nap_adjust_return(regs);
> > -	irq_exit();
> >   	arch_interrupt_exit_prepare(regs);
> >   }
> > @@ -354,59 +363,11 @@ static inline void arch_interrupt_nmi_enter_prepare(struct pt_regs *regs,
> >   		this_cpu_set_ftrace_enabled(0);
> >   	}
> >   #endif
> > -
> > -	/* If data relocations are enabled, it's safe to use nmi_enter() */
> > -	if (mfmsr() & MSR_DR) {
> > -		nmi_enter();
> > -		return;
> > -	}
> > -
> > -	/*
> > -	 * But do not use nmi_enter() for pseries hash guest taking a real-mode
> > -	 * NMI because not everything it touches is within the RMA limit.
> > -	 */
> > -	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> > -	    firmware_has_feature(FW_FEATURE_LPAR) &&
> > -	    !radix_enabled())
> > -		return;
> > -
> > -	/*
> > -	 * Likewise, don't use it if we have some form of instrumentation (like
> > -	 * KASAN shadow) that is not safe to access in real mode (even on radix)
> > -	 */
> > -	if (IS_ENABLED(CONFIG_KASAN))
> > -		return;
> > -
> > -	/*
> > -	 * Likewise, do not use it in real mode if percpu first chunk is not
> > -	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
> > -	 * are chances where percpu allocation can come from vmalloc area.
> > -	 */
> > -	if (percpu_first_chunk_is_paged)
> > -		return;
> > -
> > -	/* Otherwise, it should be safe to call it */
> > -	nmi_enter();
> >   }
> >   static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
> >   					      struct interrupt_nmi_state *state)
> >   {
> > -	if (mfmsr() & MSR_DR) {
> > -		// nmi_exit if relocations are on
> > -		nmi_exit();
> > -	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> > -		   firmware_has_feature(FW_FEATURE_LPAR) &&
> > -		   !radix_enabled()) {
> > -		// no nmi_exit for a pseries hash guest taking a real mode exception
> > -	} else if (IS_ENABLED(CONFIG_KASAN)) {
> > -		// no nmi_exit for KASAN in real mode
> > -	} else if (percpu_first_chunk_is_paged) {
> > -		// no nmi_exit if percpu first chunk is not embedded
> > -	} else {
> > -		nmi_exit();
> > -	}
> > -
> >   	/*
> >   	 * nmi does not call nap_adjust_return because nmi should not create
> >   	 * new work to do (must use irq_work for that).
> > @@ -435,6 +396,8 @@ static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
> >   static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
> >   {
> > +	kuap_lock();
> > +
> 
> A reason why this change comes now and not in the patch that added
> arch_enter_from_user_mode() ?
> 
Yes it should have been. Will fix this in next revision.

> >   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> >   		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
> > @@ -467,11 +430,8 @@ static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
> >   	} else
> >   #endif
> >   		kuap_assert_locked();
> > -
> >   	booke_restore_dbcr0();
> > -
> 
> This is cosmetic, should have been done when adding
> arch_enter_from_user_mode()
>
Sure, Will fix this.

Regards,
Mukesh
> >   	account_cpu_user_entry();
> > -
> >   	account_stolen_time();
> >   	/*
> 
> 
> Christophe

