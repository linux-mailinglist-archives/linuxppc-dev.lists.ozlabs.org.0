Return-Path: <linuxppc-dev+bounces-14814-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFACDCC3CD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 16:01:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW0W12sD4z2yDk;
	Wed, 17 Dec 2025 02:01:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765897277;
	cv=none; b=TV/lfVPusmiHQo91DNLAuswhK/LKMb40kPf5yUGGwKG2WMRureahv3R64ZKA2AZBQd9+afs74delNYRNKDPMPf+Wncm9b8ewkM+tIFspVpJ9c93Jkgw0pbp92bi4tEZIbA6eu5PPduyFZyRWzuIOMjO2nDgVWZeTSlx9XWdDbAdZt1RUFcscwaFusVpxEilebHOHe6hzKZxmrH4qhukwPaS4zpPa3IgMoxBmfJOf9Ho+8VKfyUugEZckeKf26TpDkRrDrP20qrZig4G7fcpjaaqeF/GO0ycj0VvZI+nx5AVpzW3NXu9Y+92VpHmp8dG/+eIphU6TCsMIIboNEUG9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765897277; c=relaxed/relaxed;
	bh=Pvdr0XTIrEgmHUSnv0roRTNWJFtuN39oXK3QcbCtF+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVQRWBusMrPHwgiErnJHB26DRoc3a0HaOdzgVtPp6RcMEe7o+4+ZfdYN/hF8157LgfQAxFynvv5AcTIF8fCOuqpa70MPyDrYmryDtjrBUcPDuvqB901bi1rTqu5ucbxAJHtwFkAtNHK2FBHGdoXgcH8QJq5m6DdV5wDoEzJWMtP4ZKUetNaS0+Dq5Snps/wMeTGO1QUOJk24I1QWNTzPB9Y5HUntm2zv0msRzprt+EJwb9F4fc7SNkQnSeSxz+qjjeSooymWbWCBspAgkr4+qbyr9AFrKfP4EdGF4RZq+Qp2qGH7D3jQ2P0/MciDdNbHJkznHAdbCgo3/ujsHd27ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZBXSa3lr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZBXSa3lr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW0W03Xb4z2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 02:01:16 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGCEPWK032017;
	Tue, 16 Dec 2025 15:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Pvdr0X
	TIrEgmHUSnv0roRTNWJFtuN39oXK3QcbCtF+Q=; b=ZBXSa3lrwNYpXFsvIQWPYq
	u7+aHF5NY58gS28cptooHog28//sLE0P9BEejHHQkgskHKooDck0hd0bvN6eDusy
	IoKApXBJQ4JR/Wo9Qe9slWLxv9Ra0CqX6ysIqHK1jAtS2kiBa3RUF+xIj0LeMhkl
	c15Bk1EdVf6hq1NmipxiuHLK5Wv8ARr1Pmq++1CcGYSE3c6hxPVuXEzd1PfNUHq6
	VZ4fj6g/0I8mpzE0/x2HpX7yOPdcEo+Nf59reAL7OS9CR1rk+BRkSUBWD89tXOVJ
	9I4wAMMIa9cNngOlvGCQjaMVLHH5Axga1073397LYJO2ya1EqBWI+b2WGwfymUmg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt1eywk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:00:50 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BGEpAaw002977;
	Tue, 16 Dec 2025 15:00:49 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt1eywd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:00:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGD2jve026753;
	Tue, 16 Dec 2025 15:00:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1jfscxhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:00:48 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BGF0jld39977398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 15:00:45 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E3BF20043;
	Tue, 16 Dec 2025 15:00:45 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E56C2004B;
	Tue, 16 Dec 2025 15:00:39 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.210.89])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Dec 2025 15:00:39 +0000 (GMT)
Date: Tue, 16 Dec 2025 20:30:35 +0530
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
Subject: Re: [PATCH v2 6/8] powerpc: Prepare for IRQ entry exit
Message-ID: <vk6k6fbjpq6pajvce5idrfq2m7smygpazpqemxkiyov7ywhbt7@6sckgpjdxarq>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-7-mkchauras@linux.ibm.com>
 <91d280af-fb41-4c05-8b96-113717ecd64a@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91d280af-fb41-4c05-8b96-113717ecd64a@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S29N3WWYeKACX1VyHdnYyO8WHREi4URs
X-Proofpoint-ORIG-GUID: VHH3EbwhcX2WYpseHF8kDJbVwM5BgeYr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX2N2KymhjI8oF
 cQK/RgTTO8wQ4IuE3fLzGeVBxDWacxkNj8/I/0x16IqIb8K9+oMYPWG7CKgHVY5k1sJoyG47YyR
 HoxV6ExATUnzGlocizcjhHPaUZyTD/C+MHllwWo81g84fwumzNoUYVXN7fGP6dtXlrU2jCeFjXf
 ZxmCcLO5bPrQVf3d7Zc75jx+nE7b2Kfk+qQsw8MoPBOpdWX7XUbW2mZ0iJVEWhSs/MJwVbQzNoR
 XKaabXUEqWvNRK53nI3SGl7aOEOBloIC9uJXxZMhGOfnJB7HJg1rPUhgqGuSQf5xsm+Asz4ZSiP
 LTaghL+6ObFRvysxkV8zs5fAqrGHt6RcWvjulcqDcPV7hedOp+a4r6DQe2fq9twuRyf6S899Gkv
 /lFeXlvmAKHLy4n5odqrZ2y6oSqn0Q==
X-Authority-Analysis: v=2.4 cv=L/MQguT8 c=1 sm=1 tr=0 ts=69417422 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=0nTDRU5T16wNvC3hJKEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 10:58:16AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> > From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > 
> > Move interrupt entry and exit helper routines from interrupt.h into the
> > PowerPC-specific entry-common.h header as a preparatory step for enabling
> > the generic entry/exit framework.
> > 
> > This consolidation places all PowerPC interrupt entry/exit handling in a
> > single common header, aligning with the generic entry infrastructure.
> > The helpers provide architecture-specific handling for interrupt and NMI
> > entry/exit sequences, including:
> > 
> >   - arch_interrupt_enter/exit_prepare()
> >   - arch_interrupt_async_enter/exit_prepare()
> >   - arch_interrupt_nmi_enter/exit_prepare()
> >   - Supporting helpers such as nap_adjust_return(), check_return_regs_valid(),
> >     debug register maintenance, and soft mask handling.
> > 
> > The functions are copied verbatim from interrupt.h to avoid functional
> > changes at this stage. Subsequent patches will integrate these routines
> > into the generic entry/exit flow.
> 
> Can we move them instead of duplicating them ?
> 
Till we enable the Generic framework i didn't want to touch the already
used code path. Once we enable the code all the unused code should be
removed. This helps us in bisecting future issues caused due to this.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > ---
> >   arch/powerpc/include/asm/entry-common.h | 422 ++++++++++++++++++++++++
> >   1 file changed, 422 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> > index e8ebd42a4e6d..e8bde4c67eaf 100644
> > --- a/arch/powerpc/include/asm/entry-common.h
> > +++ b/arch/powerpc/include/asm/entry-common.h
> > @@ -7,10 +7,432 @@
> >   #include <asm/cputime.h>
> >   #include <asm/interrupt.h>
> > +#include <asm/runlatch.h>
> >   #include <asm/stacktrace.h>
> >   #include <asm/switch_to.h>
> >   #include <asm/tm.h>
> > +#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
> > +/*
> > + * WARN/BUG is handled with a program interrupt so minimise checks here to
> > + * avoid recursion and maximise the chance of getting the first oops handled.
> > + */
> > +#define INT_SOFT_MASK_BUG_ON(regs, cond)				\
> > +do {									\
> > +	if ((user_mode(regs) || (TRAP(regs) != INTERRUPT_PROGRAM)))	\
> > +		BUG_ON(cond);						\
> > +} while (0)
> > +#else
> > +#define INT_SOFT_MASK_BUG_ON(regs, cond)
> > +#endif
> > +
> > +#ifdef CONFIG_PPC_BOOK3S_64
> > +extern char __end_soft_masked[];
> > +bool search_kernel_soft_mask_table(unsigned long addr);
> > +unsigned long search_kernel_restart_table(unsigned long addr);
> > +
> > +DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
> > +

[...]

> > +static inline bool nmi_disables_ftrace(struct pt_regs *regs)
> > +{
> > +	/* Allow DEC and PMI to be traced when they are soft-NMI */
> > +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
> > +		if (TRAP(regs) == INTERRUPT_DECREMENTER)
> > +			return false;
> > +		if (TRAP(regs) == INTERRUPT_PERFMON)
> > +			return false;
> > +	}
> > +	if (IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
> > +		if (TRAP(regs) == INTERRUPT_PERFMON)
> > +			return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static inline void arch_interrupt_nmi_enter_prepare(struct pt_regs *regs,
> > +					       struct interrupt_nmi_state *state)
> 
> CHECK: Alignment should match open parenthesis
> #354: FILE: arch/powerpc/include/asm/entry-common.h:322:
> +static inline void arch_interrupt_nmi_enter_prepare(struct pt_regs *regs,
> +					       struct interrupt_nmi_state *state)
> 
> 
Will fix this.
> > +{
> > +#ifdef CONFIG_PPC64
> > +	state->irq_soft_mask = local_paca->irq_soft_mask;
> > +	state->irq_happened = local_paca->irq_happened;
> > +	state->softe = regs->softe;
> > +
> > +	/*
> > +	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
> > +	 * the right thing, and set IRQ_HARD_DIS. We do not want to reconcile
> > +	 * because that goes through irq tracing which we don't want in NMI.
> > +	 */
> > +	local_paca->irq_soft_mask = IRQS_ALL_DISABLED;
> > +	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> > +
> > +	if (!(regs->msr & MSR_EE) || is_implicit_soft_masked(regs)) {
> > +		/*
> > +		 * Adjust regs->softe to be soft-masked if it had not been
> > +		 * reconcied (e.g., interrupt entry with MSR[EE]=0 but softe
> > +		 * not yet set disabled), or if it was in an implicit soft
> > +		 * masked state. This makes regs_irqs_disabled(regs)
> > +		 * behave as expected.
> > +		 */
> > +		regs->softe = IRQS_ALL_DISABLED;
> > +	}
> > +
> > +	__hard_RI_enable();
> > +
> > +	/* Don't do any per-CPU operations until interrupt state is fixed */
> > +
> > +	if (nmi_disables_ftrace(regs)) {
> > +		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
> > +		this_cpu_set_ftrace_enabled(0);
> > +	}
> > +#endif
> > +
> > +	/* If data relocations are enabled, it's safe to use nmi_enter() */
> > +	if (mfmsr() & MSR_DR) {
> > +		nmi_enter();
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * But do not use nmi_enter() for pseries hash guest taking a real-mode
> > +	 * NMI because not everything it touches is within the RMA limit.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> > +	    firmware_has_feature(FW_FEATURE_LPAR) &&
> > +	    !radix_enabled())
> > +		return;
> > +
> > +	/*
> > +	 * Likewise, don't use it if we have some form of instrumentation (like
> > +	 * KASAN shadow) that is not safe to access in real mode (even on radix)
> > +	 */
> > +	if (IS_ENABLED(CONFIG_KASAN))
> > +		return;
> > +
> > +	/*
> > +	 * Likewise, do not use it in real mode if percpu first chunk is not
> > +	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
> > +	 * are chances where percpu allocation can come from vmalloc area.
> > +	 */
> > +	if (percpu_first_chunk_is_paged)
> > +		return;
> > +
> > +	/* Otherwise, it should be safe to call it */
> > +	nmi_enter();
> > +}
> > +
> > +static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
> > +					      struct interrupt_nmi_state *state)
> > +{
> 
> CHECK: Alignment should match open parenthesis
> #425: FILE: arch/powerpc/include/asm/entry-common.h:393:
> +static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
> +					      struct interrupt_nmi_state *state)
> 

Will fix this.

Regards,
Mukesh
> > +	if (mfmsr() & MSR_DR) {
> > +		// nmi_exit if relocations are on
> > +		nmi_exit();
> > +	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> > +		   firmware_has_feature(FW_FEATURE_LPAR) &&
> > +		   !radix_enabled()) {
> > +		// no nmi_exit for a pseries hash guest taking a real mode exception
> > +	} else if (IS_ENABLED(CONFIG_KASAN)) {
> > +		// no nmi_exit for KASAN in real mode
> > +	} else if (percpu_first_chunk_is_paged) {
> > +		// no nmi_exit if percpu first chunk is not embedded
> > +	} else {
> > +		nmi_exit();
> > +	}
> > +
> > +	/*
> > +	 * nmi does not call nap_adjust_return because nmi should not create
> > +	 * new work to do (must use irq_work for that).
> > +	 */
> > +
> > +#ifdef CONFIG_PPC64
> > +#ifdef CONFIG_PPC_BOOK3S
> > +	if (regs_irqs_disabled(regs)) {
> > +		unsigned long rst = search_kernel_restart_table(regs->nip);
> > +
> > +		if (rst)
> > +			regs_set_return_ip(regs, rst);
> > +	}
> > +#endif
> > +
> > +	if (nmi_disables_ftrace(regs))
> > +		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
> > +
> > +	/* Check we didn't change the pending interrupt mask. */
> > +	WARN_ON_ONCE((state->irq_happened | PACA_IRQ_HARD_DIS) != local_paca->irq_happened);
> > +	regs->softe = state->softe;
> > +	local_paca->irq_happened = state->irq_happened;
> > +	local_paca->irq_soft_mask = state->irq_soft_mask;
> > +#endif
> > +}
> > +
> >   static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
> >   {
> >   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> 

