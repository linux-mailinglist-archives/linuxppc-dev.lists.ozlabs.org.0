Return-Path: <linuxppc-dev+bounces-14811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A243DCC3B96
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 15:48:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW0D41j1Lz2yDY;
	Wed, 17 Dec 2025 01:48:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765896500;
	cv=none; b=fwPy7HR9X8e0Ni/yuGTyP1u4dwrT+gcd8IwYiIwzKqq4AeUTPFA2aeMglww7IdSwbG8uLgp400bpxHcBuxmfwuAYCbHoFK7K63jvDUms9CdWdLNKfylNm4+zPyNCh+T5SlGxVE7/Te6sEKhFtFqpQq2Mi+VKG3V4TYu3DmBkAjDQmYlXDtRo1oEXjS2mj0Pg/t70xQnk+qHwak4DK0vmu0n4WCeBbj5ljvVCIojjZNuv120qRVZDh3y6MNNtJtN4JIauvnDCkIOFW67CfuIKajUkTskTOJa102Z7cksadRh8OrteZ6anZpLMWMFVayr5WGEIE0ejoHx32n83tPdElg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765896500; c=relaxed/relaxed;
	bh=R/2Qs+Q3SkDoTy2bLKYpmSLVwfPYS6uQP9kfazTfN4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcrR0WZFA643rSFDMYIsI9UqhIcD26n+uVrNamaewgH9n2T7aUN1a0vp3iEO9Avc1J4id4p9Av/CAb3FJnQtgdaj8ubcji048GagH6VOo4Zh1aTg48VOdqWch89aPp6kQyRx9WAhFUdyh7F8QuXsrZguE0symbWOhjNwYpqOPUveVg3XiWZM+DrLisHvORwO9rSTVaQF0KWCucPpZoJGLoFfh4oprDtEJrpLnpTe+AtNAumusBumpzCn9fY1jnpsE0/idPQvTmcRfhRMYwzNEOnw7Lyed+AAcX9x0YeNIHGLrYNt07ELH2XP32HHeDxNZ7a+L8gvPyXCNKrWsA5dvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hcxAsdmy; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hcxAsdmy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW0D31qmbz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 01:48:19 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGDUMdP011526;
	Tue, 16 Dec 2025 14:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=R/2Qs+
	Q3SkDoTy2bLKYpmSLVwfPYS6uQP9kfazTfN4E=; b=hcxAsdmyxlXW1dYc9iQmfZ
	T+mex4scH7hg42VHwtMStIw2ElPQqUSJvGLqqyUm5F7tayPx2YX+DkhSSIIb8vSC
	Nm8rIebr16m+w/wckvvi749MpNbKkErpcIqTZVekIrShKenLj4IxVIpYmlAsyIaa
	HeX3rPpADtcowYVanovbEHIq2C6zxDwCVx0ko0iyGzXLl+cXW6uVTscfDCZ8nqy6
	NC00Rj1cEsbHPcF/UquZU7Cmr82+E74YZ/Yg/rz3P5Cxg9yGAJdiDqxX+8m6tBcE
	OPhGy0JwFMmv0DJUrmlHQF+HE/mGl7DAc1LcI0fXc9RhZvHvsct3GflusrCZXfbw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn8fqv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:47:34 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BGEgFiB016908;
	Tue, 16 Dec 2025 14:47:34 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn8fqv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:47:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGCsidp012816;
	Tue, 16 Dec 2025 14:47:32 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1juy4rk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:47:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BGElS6N13107456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 14:47:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 197792004D;
	Tue, 16 Dec 2025 14:47:28 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD1D620040;
	Tue, 16 Dec 2025 14:47:21 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.210.89])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Dec 2025 14:47:21 +0000 (GMT)
Date: Tue, 16 Dec 2025 20:17:19 +0530
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
Subject: Re: [PATCH v2 3/8] powerpc: introduce arch_enter_from_user_mode
Message-ID: <lei2w2jf4ha65xvwhvh7ttryqto3il6zf2bpemzx2x32kcqzrl@fpl7tevk3txz>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-4-mkchauras@linux.ibm.com>
 <30d26b5c-7a5d-403e-a10b-381d09cae3b9@kernel.org>
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
In-Reply-To: <30d26b5c-7a5d-403e-a10b-381d09cae3b9@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAxOCBTYWx0ZWRfX/hzWwU4HIBx2
 Fbz9bs5ZtSAafDwU1oe5Mv2qKd96pFlG3rXUOrGj0wz+vls0qko2aYW8dV7UBLSgmvcsj4498FG
 VYM4IX3a+PF1/UI9RXm6IZ0CWcJnaSkrCQL+VEdEgH7Wo8V9JawE+EQxs6O4/UBFk9RBSHw0lMp
 dFf9NSDH/S9B9DlrR6gJtF0R7NalVoQq5R8Zs+A2MeWzoJVIJ+CivMbqfkqisWjeovVXl1z8a7N
 DovdE7allMJ4miN6tQZhFETF8HPbXCCpvYFRIjrH+gPznPnx3UEoBTRnSQND58vWQEAbo0+xhKm
 orsez1DYT8YQQeVdK5/AzeOFIytB+JZ+7AlO1JoSIgc8SIB+BdrrCHEkv3pU+dYtsvlbdTOj3kq
 G12YYaa0KOUIFagjWoMCNAylXR51qg==
X-Proofpoint-GUID: hnMcEi3EaJBMDMmSbx8cTy8fN-C7F-5v
X-Proofpoint-ORIG-GUID: c5nKcanoI3cTZ5ZI8MWGOTasyKVNfwjr
X-Authority-Analysis: v=2.4 cv=LbYxKzfi c=1 sm=1 tr=0 ts=69417106 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=LdsCdmnqpdUPqmvPWgAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2512130018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 10:38:50AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> > From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > 
> > Implement the arch_enter_from_user_mode() hook required by the generic
> > entry/exit framework. This helper prepares the CPU state when entering
> > the kernel from userspace, ensuring correct handling of KUAP/KUEP,
> > transactional memory, and debug register state.
> > 
> > As part of this change, move booke_load_dbcr0() from interrupt.c to
> > interrupt.h so it can be used by the new helper without introducing
> > cross-file dependencies.
> > 
> > This patch contains no functional changes, it is purely preparatory for
> > enabling the generic syscall and interrupt entry path on PowerPC.
> > 
> > Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > ---
> >   arch/powerpc/include/asm/entry-common.h | 97 +++++++++++++++++++++++++
> >   arch/powerpc/include/asm/interrupt.h    | 22 ++++++
> >   arch/powerpc/kernel/interrupt.c         | 22 ------
> >   3 files changed, 119 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> > index 3af16d821d07..093ece06ef79 100644
> > --- a/arch/powerpc/include/asm/entry-common.h
> > +++ b/arch/powerpc/include/asm/entry-common.h
> > @@ -5,7 +5,104 @@
> >   #ifdef CONFIG_GENERIC_IRQ_ENTRY
> 
> This #ifdef is still unnecessary it seems.
> 
Sure will fix it in next iteration.
> > +#include <asm/cputime.h>
> > +#include <asm/interrupt.h>
> >   #include <asm/stacktrace.h>
> > +#include <asm/tm.h>
> > +
> > +static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
> > +{
> > +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> > +		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
> > +
> > +	BUG_ON(regs_is_unrecoverable(regs));
> > +	BUG_ON(!user_mode(regs));
> > +	BUG_ON(regs_irqs_disabled(regs));
> > +
> > +#ifdef CONFIG_PPC_PKEY
> > +	if (mmu_has_feature(MMU_FTR_PKEY) && trap_is_syscall(regs)) {
> > +		unsigned long amr, iamr;
> > +		bool flush_needed = false;
> > +		/*
> > +		 * When entering from userspace we mostly have the AMR/IAMR
> > +		 * different from kernel default values. Hence don't compare.
> > +		 */
> > +		amr = mfspr(SPRN_AMR);
> > +		iamr = mfspr(SPRN_IAMR);
> > +		regs->amr  = amr;
> > +		regs->iamr = iamr;
> > +		if (mmu_has_feature(MMU_FTR_KUAP)) {
> > +			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
> > +			flush_needed = true;
> > +		}
> > +		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
> > +			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
> > +			flush_needed = true;
> > +		}
> > +		if (flush_needed)
> > +			isync();
> > +	} else
> > +#endif
> > +		kuap_assert_locked();
> 
> This construct is odd, can you do something about it ?
> 
Yeah seemed weird to me too. Lemme see what i can do about this.
Will do something in next iteration.
> > +
> > +	booke_restore_dbcr0();
> > +
> > +	account_cpu_user_entry();
> > +
> > +	account_stolen_time();
> > +
> > +	/*
> > +	 * This is not required for the syscall exit path, but makes the
> > +	 * stack frame look nicer. If this was initialised in the first stack
> > +	 * frame, or if the unwinder was taught the first stack frame always
> > +	 * returns to user with IRQS_ENABLED, this store could be avoided!
> > +	 */
> > +	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
> > +
> > +	/*
> > +	 * If system call is called with TM active, set _TIF_RESTOREALL to
> > +	 * prevent RFSCV being used to return to userspace, because POWER9
> > +	 * TM implementation has problems with this instruction returning to
> > +	 * transactional state. Final register values are not relevant because
> > +	 * the transaction will be aborted upon return anyway. Or in the case
> > +	 * of unsupported_scv SIGILL fault, the return state does not much
> > +	 * matter because it's an edge case.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> > +	    unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
> > +		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
> > +
> > +	/*
> > +	 * If the system call was made with a transaction active, doom it and
> > +	 * return without performing the system call. Unless it was an
> > +	 * unsupported scv vector, in which case it's treated like an illegal
> > +	 * instruction.
> > +	 */
> > +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > +	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
> > +	    !trap_is_unsupported_scv(regs)) {
> > +		/* Enable TM in the kernel, and disable EE (for scv) */
> > +		hard_irq_disable();
> > +		mtmsr(mfmsr() | MSR_TM);
> > +
> > +		/* tabort, this dooms the transaction, nothing else */
> > +		asm volatile(".long 0x7c00071d | ((%0) << 16)"
> > +			     :: "r"(TM_CAUSE_SYSCALL | TM_CAUSE_PERSISTENT));
> > +
> > +		/*
> > +		 * Userspace will never see the return value. Execution will
> > +		 * resume after the tbegin. of the aborted transaction with the
> > +		 * checkpointed register state. A context switch could occur
> > +		 * or signal delivered to the process before resuming the
> > +		 * doomed transaction context, but that should all be handled
> > +		 * as expected.
> > +		 */
> > +		return;
> > +	}
> > +#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> > +}
> > +
> > +#define arch_enter_from_user_mode arch_enter_from_user_mode
> >   #endif /* CONFIG_GENERIC_IRQ_ENTRY */
> >   #endif /* _ASM_PPC_ENTRY_COMMON_H */
> > diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> > index 0e2cddf8bd21..ca8a2cda9400 100644
> > --- a/arch/powerpc/include/asm/interrupt.h
> > +++ b/arch/powerpc/include/asm/interrupt.h
> > @@ -138,6 +138,28 @@ static inline void nap_adjust_return(struct pt_regs *regs)
> >   #endif
> >   }
> > +static inline void booke_load_dbcr0(void)
> 
> It was a notrace function in interrupt.c
> Should it be an __always_inline now ?
Yes, will fix this.

Regards,
Mukesh
> 
> Christophe
> 
> > +{
> > +#ifdef CONFIG_PPC_ADV_DEBUG_REGS
> > +	unsigned long dbcr0 = current->thread.debug.dbcr0;
> > +
> > +	if (likely(!(dbcr0 & DBCR0_IDM)))
> > +		return;
> > +
> > +	/*
> > +	 * Check to see if the dbcr0 register is set up to debug.
> > +	 * Use the internal debug mode bit to do this.
> > +	 */
> > +	mtmsr(mfmsr() & ~MSR_DE);
> > +	if (IS_ENABLED(CONFIG_PPC32)) {
> > +		isync();
> > +		global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
> > +	}
> > +	mtspr(SPRN_DBCR0, dbcr0);
> > +	mtspr(SPRN_DBSR, -1);
> > +#endif
> > +}
> > +
> >   static inline void booke_restore_dbcr0(void)
> >   {
> >   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
> > diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> > index 0d8fd47049a1..2a09ac5dabd6 100644
> > --- a/arch/powerpc/kernel/interrupt.c
> > +++ b/arch/powerpc/kernel/interrupt.c
> > @@ -78,28 +78,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
> >   	return true;
> >   }
> > -static notrace void booke_load_dbcr0(void)
> > -{
> > -#ifdef CONFIG_PPC_ADV_DEBUG_REGS
> > -	unsigned long dbcr0 = current->thread.debug.dbcr0;
> > -
> > -	if (likely(!(dbcr0 & DBCR0_IDM)))
> > -		return;
> > -
> > -	/*
> > -	 * Check to see if the dbcr0 register is set up to debug.
> > -	 * Use the internal debug mode bit to do this.
> > -	 */
> > -	mtmsr(mfmsr() & ~MSR_DE);
> > -	if (IS_ENABLED(CONFIG_PPC32)) {
> > -		isync();
> > -		global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
> > -	}
> > -	mtspr(SPRN_DBCR0, dbcr0);
> > -	mtspr(SPRN_DBSR, -1);
> > -#endif
> > -}
> > -
> >   static notrace void check_return_regs_valid(struct pt_regs *regs)
> >   {
> >   #ifdef CONFIG_PPC_BOOK3S_64
> 

