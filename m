Return-Path: <linuxppc-dev+bounces-14812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70689CC3BED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 15:51:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW0Ht0Snlz2yDk;
	Wed, 17 Dec 2025 01:51:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765896697;
	cv=none; b=XVTsTvvtoOGLwKfn9BexI7xlbjFSec7mM1YCJ/PCslKSA2PQ0+jFmBe5AcS6ZxCzh0kZ40D5DdqkibYD0YoDXnHddWKXWclV0PJp6KeW9Y0CsD8a9LvIm8HyuuWnD17QQv+bs6SSAqqp2Booc472QzMDYiQv228v+OirnhtDyZ680CQgaQuBR9SOXP+0hhMkKAcNBjLG9/aSdmm/B7ff00R+vWsldaNqBgJFEPqaCY19HsT9erJ/ZuI0ZQsGwrwFQu8n+IJMcF/oXtUyatNtQ0hLDo2leyEjmwF+U1oF4IxFi1WXz6smuDORK+hpLoUK4wBCpdum/Kgjn7FE8SZWew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765896697; c=relaxed/relaxed;
	bh=pgO8wopOSDFxjKJdBoN0Dcc3ZxT8CPSvN+RVSx+nm/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuBFssnIh2tfC1tUo6RuSHqaMesaBrCVpvoXBox/a818Jpc+5QG0fhwlN7MMnZPN4DQoCnEwA+u5HIWkPg3dzFUVT7CbGLDB8D3Z9xrBiZ6iXYmSofK9TDaaprj6aiHcs94M1H8UtEbhnGvHuxJvlrxFl4fZOsQa3NVnbAwH6mkTzTnNBL0Uu+eu8WRE46CzxDhyvCDviP9LtpXd7wiOUuqtMzXsQuCSocPbgwZ/DoMmqfSGjXIkSLR3VG3jI1sTVGpXPvJzlTkY4i2QSPET2pF3EHL13FJrmsQuTb6XuPHloxCEf930jstPvZTUXVXsGk9LkxqRm7ADreWe5pzHiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hd4eIXdK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hd4eIXdK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW0Hs1fD6z2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 01:51:37 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGDHmJQ029561;
	Tue, 16 Dec 2025 14:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pgO8wo
	pOSDFxjKJdBoN0Dcc3ZxT8CPSvN+RVSx+nm/c=; b=hd4eIXdKTWDxzPAI6kg2tK
	BJaTYEY0f2gJTBg7rrkpg330U006/+eWw8y9Ez9Vmd69hkS6uvwTqLcWwmx3PP8I
	gAS92TaxamrsVYxrE9FNb2ELPYDsH/PVMdLVD6DHvZfRDQI0RknUda8LpjEdQFP6
	0DOfbkhqI5ROO5V/+Ja9B8Yj6aYoGQmseL2m6KRi8gnQpFPeHEJKyH1tuQJPl254
	ttKb+VhsLxxGvqCx5ubYavoUFP0WgwCxP4zd0ENKT93AwU2kHnH70Ur2CYxES8GL
	GlQ75Nwvr2bdIluFhiqCNeCxTpr+tBVQA9DfFYAGl1rseIi5Sc8cFIhWSmlVMR/g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvb7mvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:51:15 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BGETSQv003470;
	Tue, 16 Dec 2025 14:51:15 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvb7mvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:51:14 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGEjgVf014344;
	Tue, 16 Dec 2025 14:51:13 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1mpjvb5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:51:13 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BGEp97j42336682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 14:51:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF97E20043;
	Tue, 16 Dec 2025 14:51:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25C3020040;
	Tue, 16 Dec 2025 14:51:04 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.210.89])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Dec 2025 14:51:03 +0000 (GMT)
Date: Tue, 16 Dec 2025 20:21:01 +0530
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
Subject: Re: [PATCH v2 4/8] powerpc: Introduce syscall exit arch functions
Message-ID: <wbdl4jliyvbofvpj3t4hxllouvrexmfrmea5eytn42v3j3pfpd@55i2bvgdhwtb>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-5-mkchauras@linux.ibm.com>
 <89a25fd0-2d49-4062-a194-55f21350e5a8@kernel.org>
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
In-Reply-To: <89a25fd0-2d49-4062-a194-55f21350e5a8@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=V/JwEOni c=1 sm=1 tr=0 ts=694171e3 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=X27pKGmI69V0a2-3choA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: vC3w1-Jq8wJF36-3odqMQZ2sSMbAG-K0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX27l6TrfDr1xF
 8qBrhNvswXCRj9N475FeFjCUMJPO5A33PXhrGEboB9cUip/NJ7uyeENrqi0mCKwKJOF19QzeKFl
 tTBPOsZ5bzzycD9G28eOR/eFEFYzVOXE+zNdzptW5McQXOQ7CXoZ+OVz76w6CoXYVOCX+SAio8j
 waG2QKTQcRI4tZ4ZPvjTakXsz7GezHT6X3a036+3sYszodjSw+2HV3Gpcv2bjxjgr8J3GULwvw0
 Q+BefLs61VVUPdoYtF9xEcyJ52Ruz0JNwCho27DQTCgGp4VUpeObUKFqHDi9FGGaZIQ07ktDaRA
 3Jvwo8ovY4P7yh+irCnpwS3XlCmBWeM3298SqczDq724LpxFzk0XnkNL8KXkXjT7U9CVTAYEyKv
 7SLsEJ21t4J99gyISlfA2dnGaxzZsA==
X-Proofpoint-ORIG-GUID: dxDzj_2lCH6kDfz-MEhN6IUdBCOMG80h
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

On Tue, Dec 16, 2025 at 10:46:28AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> > From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > 
> > Add PowerPC-specific implementations of the generic syscall exit hooks
> > used by the generic entry/exit framework:
> > 
> >   - arch_exit_to_user_mode_work_prepare()
> >   - arch_exit_to_user_mode_work()
> > 
> > These helpers handle user state restoration when returning from the
> > kernel to userspace, including FPU/VMX/VSX state, transactional memory,
> > KUAP restore, and per-CPU accounting.
> > 
> > Additionally, move check_return_regs_valid() from interrupt.c to
> > interrupt.h so it can be shared by the new entry/exit logic, and add
> > arch_do_signal_or_restart() for use with the generic entry flow.
> > 
> > No functional change is intended with this patch.
> > 
> > Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > ---
> >   arch/powerpc/include/asm/entry-common.h | 49 +++++++++++++++
> >   arch/powerpc/include/asm/interrupt.h    | 82 +++++++++++++++++++++++++
> >   arch/powerpc/kernel/interrupt.c         | 81 ------------------------
> >   arch/powerpc/kernel/signal.c            | 14 +++++
> >   4 files changed, 145 insertions(+), 81 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> > index 093ece06ef79..e8ebd42a4e6d 100644
> > --- a/arch/powerpc/include/asm/entry-common.h
> > +++ b/arch/powerpc/include/asm/entry-common.h
> > @@ -8,6 +8,7 @@
> >   #include <asm/cputime.h>
> >   #include <asm/interrupt.h>
> >   #include <asm/stacktrace.h>
> > +#include <asm/switch_to.h>
> >   #include <asm/tm.h>
> >   static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
> > @@ -104,5 +105,53 @@ static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
> >   #define arch_enter_from_user_mode arch_enter_from_user_mode
> > +static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
> > +						  unsigned long ti_work)
> > +{
> > +	unsigned long mathflags;
> > +
> > +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
> > +		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> > +		    unlikely((ti_work & _TIF_RESTORE_TM))) {
> > +			restore_tm_state(regs);
> > +		} else {
> > +			mathflags = MSR_FP;
> > +
> > +			if (cpu_has_feature(CPU_FTR_VSX))
> > +				mathflags |= MSR_VEC | MSR_VSX;
> > +			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
> > +				mathflags |= MSR_VEC;
> > +
> > +			/*
> > +			 * If userspace MSR has all available FP bits set,
> > +			 * then they are live and no need to restore. If not,
> > +			 * it means the regs were given up and restore_math
> > +			 * may decide to restore them (to avoid taking an FP
> > +			 * fault).
> > +			 */
> > +			if ((regs->msr & mathflags) != mathflags)
> > +				restore_math(regs);
> > +		}
> > +	}
> > +
> > +	check_return_regs_valid(regs);
> > +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > +	local_paca->tm_scratch = regs->msr;
> > +#endif
> > +	/* Restore user access locks last */
> > +	kuap_user_restore(regs);
> > +}
> > +
> > +#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
> > +
> > +static __always_inline void arch_exit_to_user_mode(void)
> > +{
> > +	booke_load_dbcr0();
> > +
> > +	account_cpu_user_exit();
> > +}
> > +
> > +#define arch_exit_to_user_mode arch_exit_to_user_mode
> > +
> >   #endif /* CONFIG_GENERIC_IRQ_ENTRY */
> >   #endif /* _ASM_PPC_ENTRY_COMMON_H */
> > diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> > index ca8a2cda9400..77ff8e33f8cd 100644
> > --- a/arch/powerpc/include/asm/interrupt.h
> > +++ b/arch/powerpc/include/asm/interrupt.h
> > @@ -68,6 +68,8 @@
> >   #include <linux/context_tracking.h>
> >   #include <linux/hardirq.h>
> > +#include <linux/sched/debug.h> /* for show_regs */
> > +
> >   #include <asm/cputime.h>
> >   #include <asm/firmware.h>
> >   #include <asm/ftrace.h>
> > @@ -172,6 +174,86 @@ static inline void booke_restore_dbcr0(void)
> >   #endif
> >   }
> > +static inline void check_return_regs_valid(struct pt_regs *regs)
> 
> This was previously a notrace function. Should it be marked __always_inline
> instead of just inline ?
> 
Yes it should. Will fix this too.
> > +{
> > +#ifdef CONFIG_PPC_BOOK3S_64
> > +	unsigned long trap, srr0, srr1;
> > +	static bool warned;
> > +	u8 *validp;
> > +	char *h;
> > +
> > +	if (trap_is_scv(regs))
> > +		return;
> > +
> > +	trap = TRAP(regs);
> > +	// EE in HV mode sets HSRRs like 0xea0
> > +	if (cpu_has_feature(CPU_FTR_HVMODE) && trap == INTERRUPT_EXTERNAL)
> > +		trap = 0xea0;
> > +
> > +	switch (trap) {
> > +	case 0x980:
> > +	case INTERRUPT_H_DATA_STORAGE:
> > +	case 0xe20:
> > +	case 0xe40:
> > +	case INTERRUPT_HMI:
> > +	case 0xe80:
> > +	case 0xea0:
> > +	case INTERRUPT_H_FAC_UNAVAIL:
> > +	case 0x1200:
> > +	case 0x1500:
> > +	case 0x1600:
> > +	case 0x1800:
> > +		validp = &local_paca->hsrr_valid;
> > +		if (!READ_ONCE(*validp))
> > +			return;
> > +
> > +		srr0 = mfspr(SPRN_HSRR0);
> > +		srr1 = mfspr(SPRN_HSRR1);
> > +		h = "H";
> > +
> > +		break;
> > +	default:
> > +		validp = &local_paca->srr_valid;
> > +		if (!READ_ONCE(*validp))
> > +			return;
> > +
> > +		srr0 = mfspr(SPRN_SRR0);
> > +		srr1 = mfspr(SPRN_SRR1);
> > +		h = "";
> > +		break;
> > +	}
> > +
> > +	if (srr0 == regs->nip && srr1 == regs->msr)
> > +		return;
> > +
> > +	/*
> > +	 * A NMI / soft-NMI interrupt may have come in after we found
> > +	 * srr_valid and before the SRRs are loaded. The interrupt then
> > +	 * comes in and clobbers SRRs and clears srr_valid. Then we load
> > +	 * the SRRs here and test them above and find they don't match.
> > +	 *
> > +	 * Test validity again after that, to catch such false positives.
> > +	 *
> > +	 * This test in general will have some window for false negatives
> > +	 * and may not catch and fix all such cases if an NMI comes in
> > +	 * later and clobbers SRRs without clearing srr_valid, but hopefully
> > +	 * such things will get caught most of the time, statistically
> > +	 * enough to be able to get a warning out.
> > +	 */
> > +	if (!READ_ONCE(*validp))
> > +		return;
> > +
> > +	if (!data_race(warned)) {
> > +		data_race(warned = true);
> > +		pr_warn("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
> > +		pr_warn("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
> > +		show_regs(regs);
> > +	}
> > +
> > +	WRITE_ONCE(*validp, 0); /* fixup */
> > +#endif
> > +}
> > +
> >   static inline void interrupt_enter_prepare(struct pt_regs *regs)
> >   {
> >   #ifdef CONFIG_PPC64
> > diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> > index 2a09ac5dabd6..f53d432f6087 100644
> > --- a/arch/powerpc/kernel/interrupt.c
> > +++ b/arch/powerpc/kernel/interrupt.c
> > @@ -4,7 +4,6 @@
> >   #include <linux/err.h>
> >   #include <linux/compat.h>
> >   #include <linux/rseq.h>
> > -#include <linux/sched/debug.h> /* for show_regs */
> >   #include <asm/kup.h>
> >   #include <asm/cputime.h>
> > @@ -78,86 +77,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
> >   	return true;
> >   }
> > -static notrace void check_return_regs_valid(struct pt_regs *regs)
> > -{
> > -#ifdef CONFIG_PPC_BOOK3S_64
> > -	unsigned long trap, srr0, srr1;
> > -	static bool warned;
> > -	u8 *validp;
> > -	char *h;
> > -
> > -	if (trap_is_scv(regs))
> > -		return;
> > -
> > -	trap = TRAP(regs);
> > -	// EE in HV mode sets HSRRs like 0xea0
> > -	if (cpu_has_feature(CPU_FTR_HVMODE) && trap == INTERRUPT_EXTERNAL)
> > -		trap = 0xea0;
> > -
> > -	switch (trap) {
> > -	case 0x980:
> > -	case INTERRUPT_H_DATA_STORAGE:
> > -	case 0xe20:
> > -	case 0xe40:
> > -	case INTERRUPT_HMI:
> > -	case 0xe80:
> > -	case 0xea0:
> > -	case INTERRUPT_H_FAC_UNAVAIL:
> > -	case 0x1200:
> > -	case 0x1500:
> > -	case 0x1600:
> > -	case 0x1800:
> > -		validp = &local_paca->hsrr_valid;
> > -		if (!READ_ONCE(*validp))
> > -			return;
> > -
> > -		srr0 = mfspr(SPRN_HSRR0);
> > -		srr1 = mfspr(SPRN_HSRR1);
> > -		h = "H";
> > -
> > -		break;
> > -	default:
> > -		validp = &local_paca->srr_valid;
> > -		if (!READ_ONCE(*validp))
> > -			return;
> > -
> > -		srr0 = mfspr(SPRN_SRR0);
> > -		srr1 = mfspr(SPRN_SRR1);
> > -		h = "";
> > -		break;
> > -	}
> > -
> > -	if (srr0 == regs->nip && srr1 == regs->msr)
> > -		return;
> > -
> > -	/*
> > -	 * A NMI / soft-NMI interrupt may have come in after we found
> > -	 * srr_valid and before the SRRs are loaded. The interrupt then
> > -	 * comes in and clobbers SRRs and clears srr_valid. Then we load
> > -	 * the SRRs here and test them above and find they don't match.
> > -	 *
> > -	 * Test validity again after that, to catch such false positives.
> > -	 *
> > -	 * This test in general will have some window for false negatives
> > -	 * and may not catch and fix all such cases if an NMI comes in
> > -	 * later and clobbers SRRs without clearing srr_valid, but hopefully
> > -	 * such things will get caught most of the time, statistically
> > -	 * enough to be able to get a warning out.
> > -	 */
> > -	if (!READ_ONCE(*validp))
> > -		return;
> > -
> > -	if (!data_race(warned)) {
> > -		data_race(warned = true);
> > -		printk("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
> > -		printk("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
> > -		show_regs(regs);
> > -	}
> > -
> > -	WRITE_ONCE(*validp, 0); /* fixup */
> > -#endif
> > -}
> > -
> >   static notrace unsigned long
> >   interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
> >   {
> > diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> > index aa17e62f3754..719930cf4ae1 100644
> > --- a/arch/powerpc/kernel/signal.c
> > +++ b/arch/powerpc/kernel/signal.c
> > @@ -22,6 +22,11 @@
> >   #include "signal.h"
> > +/* This will be removed */
> > +#ifdef CONFIG_GENERIC_ENTRY
> 
> Is this #ifdef really needed ?
Will fix this.
> 
> > +#include <linux/entry-common.h>
> > +#endif /* CONFIG_GENERIC_ENTRY */
> > +
> >   #ifdef CONFIG_VSX
> >   unsigned long copy_fpr_to_user(void __user *to,
> >   			       struct task_struct *task)
> > @@ -368,3 +373,12 @@ void signal_fault(struct task_struct *tsk, struct pt_regs *regs,
> >   		printk_ratelimited(regs->msr & MSR_64BIT ? fm64 : fm32, tsk->comm,
> >   				   task_pid_nr(tsk), where, ptr, regs->nip, regs->link);
> >   }
> > +
> > +#ifdef CONFIG_GENERIC_ENTRY
> 
> Why is this #ifdef needed ?
> 
> > +void arch_do_signal_or_restart(struct pt_regs *regs)
> > +{
> > +	BUG_ON(regs != current->thread.regs);
> 
> Is this BUG_ON() needed ? Can't we use something smoother ?
> 
I am not sure about what to do here. Proceeding with this seemed
dangerous. So went with a BUG_ON. Can you suggest if something better
comes to your mind.

Regards,
Mukesh
> > +	local_paca->generic_fw_flags |= GFW_RESTORE_ALL;
> > +	do_signal(current);
> > +}
> > +#endif /* CONFIG_GENERIC_ENTRY */
> 

