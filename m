Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CED673B8914
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 21:17:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFWMN5RWQz2yyC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 05:17:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Erx7ZDez;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Erx7ZDez; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFWLw4YxMz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 05:17:28 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ37gb116195; Wed, 30 Jun 2021 15:17:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=ugoQz0fmFbVQS5r+dE9ci650QmRURYsZuJCJ+WzRfzM=;
 b=Erx7ZDezMMjFI9j5Xr/j6zd2n5/1JtKCqnifgsGHNJyLT6J+9JinTVa8E6fRrFdgqnfq
 AP9nL08bqzDOfFL8lKsiekAiGytEiWJ+PYWfFeRGq1W5qW25xpkKf2lDhWBcGY0YfBhD
 SibqTIWRvbvqfkEBX6Kcf0L8tY28QS1V3iUL7VJm5Ewyzb8x502uh1rm2RI5rJl5KZWc
 asAltlP3L/NCciFvXYhTwrKJLYgAsC4CPvz2zkNOIpMIFXIwKAzWC3xQtEgVbKMDnN8w
 FV3dHqcAUVhRwITlDBijj4rsV7BALG+copqymGXsTEHfCRdpQb+dDzVQFqAs/eZLKO+Z EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39gx00s67w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 15:17:25 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UJ3XM8118598;
 Wed, 30 Jun 2021 15:17:24 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39gx00s67j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 15:17:24 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UJ6xxM003166;
 Wed, 30 Jun 2021 19:17:24 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 39duve0vr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 19:17:24 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UJHN0K34210110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:17:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 225B9AC05F;
 Wed, 30 Jun 2021 19:17:23 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32167AC060;
 Wed, 30 Jun 2021 19:17:22 +0000 (GMT)
Received: from localhost (unknown [9.211.127.242])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 30 Jun 2021 19:17:21 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 08/43] powerpc/64s: Keep AMOR SPR a constant ~0 at
 runtime
In-Reply-To: <20210622105736.633352-9-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-9-npiggin@gmail.com>
Date: Wed, 30 Jun 2021 16:17:19 -0300
Message-ID: <87bl7n2mdc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qIWhGWiZT7Lw7hez-FKXOrSqaoxQSHOC
X-Proofpoint-ORIG-GUID: gJHPgmLm61zKmowQQPTRLjRuTeEpwosU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_11:2021-06-30,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300106
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> This register controls supervisor SPR modifications, and as such is only
> relevant for KVM. KVM always sets AMOR to ~0 on guest entry, and never
> restores it coming back out to the host, so it can be kept constant and
> avoid the mtSPR in KVM guest entry.
>
> -21 cycles (9116) cycles POWER9 virt-mode NULL hcall
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kernel/cpu_setup_power.c    |  8 ++++++++
>  arch/powerpc/kernel/dt_cpu_ftrs.c        |  2 ++
>  arch/powerpc/kvm/book3s_hv_p9_entry.c    |  2 --
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S  |  2 --
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 15 ---------------
>  arch/powerpc/platforms/powernv/idle.c    |  8 +++-----
>  6 files changed, 13 insertions(+), 24 deletions(-)
>
> diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
> index 3cca88ee96d7..a29dc8326622 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.c
> +++ b/arch/powerpc/kernel/cpu_setup_power.c
> @@ -137,6 +137,7 @@ void __setup_cpu_power7(unsigned long offset, struct cpu_spec *t)
>  		return;
>
>  	mtspr(SPRN_LPID, 0);
> +	mtspr(SPRN_AMOR, ~0);
>  	mtspr(SPRN_PCR, PCR_MASK);
>  	init_LPCR_ISA206(mfspr(SPRN_LPCR), LPCR_LPES1 >> LPCR_LPES_SH);
>  }
> @@ -150,6 +151,7 @@ void __restore_cpu_power7(void)
>  		return;
>
>  	mtspr(SPRN_LPID, 0);
> +	mtspr(SPRN_AMOR, ~0);
>  	mtspr(SPRN_PCR, PCR_MASK);
>  	init_LPCR_ISA206(mfspr(SPRN_LPCR), LPCR_LPES1 >> LPCR_LPES_SH);
>  }
> @@ -164,6 +166,7 @@ void __setup_cpu_power8(unsigned long offset, struct cpu_spec *t)
>  		return;
>
>  	mtspr(SPRN_LPID, 0);
> +	mtspr(SPRN_AMOR, ~0);
>  	mtspr(SPRN_PCR, PCR_MASK);
>  	init_LPCR_ISA206(mfspr(SPRN_LPCR) | LPCR_PECEDH, 0); /* LPES = 0 */
>  	init_HFSCR();
> @@ -184,6 +187,7 @@ void __restore_cpu_power8(void)
>  		return;
>
>  	mtspr(SPRN_LPID, 0);
> +	mtspr(SPRN_AMOR, ~0);
>  	mtspr(SPRN_PCR, PCR_MASK);
>  	init_LPCR_ISA206(mfspr(SPRN_LPCR) | LPCR_PECEDH, 0); /* LPES = 0 */
>  	init_HFSCR();
> @@ -202,6 +206,7 @@ void __setup_cpu_power9(unsigned long offset, struct cpu_spec *t)
>  	mtspr(SPRN_PSSCR, 0);
>  	mtspr(SPRN_LPID, 0);
>  	mtspr(SPRN_PID, 0);
> +	mtspr(SPRN_AMOR, ~0);
>  	mtspr(SPRN_PCR, PCR_MASK);
>  	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
>  			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
> @@ -223,6 +228,7 @@ void __restore_cpu_power9(void)
>  	mtspr(SPRN_PSSCR, 0);
>  	mtspr(SPRN_LPID, 0);
>  	mtspr(SPRN_PID, 0);
> +	mtspr(SPRN_AMOR, ~0);
>  	mtspr(SPRN_PCR, PCR_MASK);
>  	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
>  			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
> @@ -242,6 +248,7 @@ void __setup_cpu_power10(unsigned long offset, struct cpu_spec *t)
>  	mtspr(SPRN_PSSCR, 0);
>  	mtspr(SPRN_LPID, 0);
>  	mtspr(SPRN_PID, 0);
> +	mtspr(SPRN_AMOR, ~0);
>  	mtspr(SPRN_PCR, PCR_MASK);
>  	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
>  			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
> @@ -264,6 +271,7 @@ void __restore_cpu_power10(void)
>  	mtspr(SPRN_PSSCR, 0);
>  	mtspr(SPRN_LPID, 0);
>  	mtspr(SPRN_PID, 0);
> +	mtspr(SPRN_AMOR, ~0);
>  	mtspr(SPRN_PCR, PCR_MASK);
>  	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
>  			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 358aee7c2d79..0a6b36b4bda8 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -80,6 +80,7 @@ static void __restore_cpu_cpufeatures(void)
>  	mtspr(SPRN_LPCR, system_registers.lpcr);
>  	if (hv_mode) {
>  		mtspr(SPRN_LPID, 0);
> +		mtspr(SPRN_AMOR, ~0);
>  		mtspr(SPRN_HFSCR, system_registers.hfscr);
>  		mtspr(SPRN_PCR, system_registers.pcr);
>  	}
> @@ -216,6 +217,7 @@ static int __init feat_enable_hv(struct dt_cpu_feature *f)
>  	}
>
>  	mtspr(SPRN_LPID, 0);
> +	mtspr(SPRN_AMOR, ~0);
>
>  	lpcr = mfspr(SPRN_LPCR);
>  	lpcr &=  ~LPCR_LPES0; /* HV external interrupts */
> diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> index c4f3e066fcb4..a3281f0c9214 100644
> --- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
> +++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
> @@ -286,8 +286,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
>  	mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
>  	mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
>
> -	mtspr(SPRN_AMOR, ~0UL);
> -
>  	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_HV_P9;
>
>  	/*
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index 8dd437d7a2c6..007f87b97184 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -772,10 +772,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
>  	/* Restore AMR and UAMOR, set AMOR to all 1s */
>  	ld	r5,VCPU_AMR(r4)
>  	ld	r6,VCPU_UAMOR(r4)
> -	li	r7,-1
>  	mtspr	SPRN_AMR,r5
>  	mtspr	SPRN_UAMOR,r6
> -	mtspr	SPRN_AMOR,r7
>
>  	/* Restore state of CTRL run bit; assume 1 on entry */
>  	lwz	r5,VCPU_CTRL(r4)
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index fe236c38ce00..b985cfead5d7 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -566,18 +566,6 @@ void __init radix__early_init_devtree(void)
>  	return;
>  }
>
> -static void radix_init_amor(void)
> -{
> -	/*
> -	* In HV mode, we init AMOR (Authority Mask Override Register) so that
> -	* the hypervisor and guest can setup IAMR (Instruction Authority Mask
> -	* Register), enable key 0 and set it to 1.
> -	*
> -	* AMOR = 0b1100 .... 0000 (Mask for key 0 is 11)
> -	*/
> -	mtspr(SPRN_AMOR, (3ul << 62));
> -}
> -
>  void __init radix__early_init_mmu(void)
>  {
>  	unsigned long lpcr;
> @@ -638,7 +626,6 @@ void __init radix__early_init_mmu(void)
>  		lpcr = mfspr(SPRN_LPCR);
>  		mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
>  		radix_init_partition_table();
> -		radix_init_amor();
>  	} else {
>  		radix_init_pseries();
>  	}
> @@ -662,8 +649,6 @@ void radix__early_init_mmu_secondary(void)
>
>  		set_ptcr_when_no_uv(__pa(partition_tb) |
>  				    (PATB_SIZE_SHIFT - 12));
> -
> -		radix_init_amor();
>  	}
>
>  	radix__switch_mmu_context(NULL, &init_mm);
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 180baecad914..f791ca041854 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -306,8 +306,8 @@ struct p7_sprs {
>  	/* per thread SPRs that get lost in shallow states */
>  	u64 amr;
>  	u64 iamr;
> -	u64 amor;
>  	u64 uamor;
> +	/* amor is restored to constant ~0 */
>  };
>
>  static unsigned long power7_idle_insn(unsigned long type)
> @@ -378,7 +378,6 @@ static unsigned long power7_idle_insn(unsigned long type)
>  	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
>  		sprs.amr	= mfspr(SPRN_AMR);
>  		sprs.iamr	= mfspr(SPRN_IAMR);
> -		sprs.amor	= mfspr(SPRN_AMOR);
>  		sprs.uamor	= mfspr(SPRN_UAMOR);
>  	}
>
> @@ -397,7 +396,7 @@ static unsigned long power7_idle_insn(unsigned long type)
>  			 */
>  			mtspr(SPRN_AMR,		sprs.amr);
>  			mtspr(SPRN_IAMR,	sprs.iamr);
> -			mtspr(SPRN_AMOR,	sprs.amor);
> +			mtspr(SPRN_AMOR,	~0);
>  			mtspr(SPRN_UAMOR,	sprs.uamor);
>  		}
>  	}
> @@ -687,7 +686,6 @@ static unsigned long power9_idle_stop(unsigned long psscr)
>
>  	sprs.amr	= mfspr(SPRN_AMR);
>  	sprs.iamr	= mfspr(SPRN_IAMR);
> -	sprs.amor	= mfspr(SPRN_AMOR);
>  	sprs.uamor	= mfspr(SPRN_UAMOR);
>
>  	srr1 = isa300_idle_stop_mayloss(psscr);		/* go idle */
> @@ -708,7 +706,7 @@ static unsigned long power9_idle_stop(unsigned long psscr)
>  		 */
>  		mtspr(SPRN_AMR,		sprs.amr);
>  		mtspr(SPRN_IAMR,	sprs.iamr);
> -		mtspr(SPRN_AMOR,	sprs.amor);
> +		mtspr(SPRN_AMOR,	~0);
>  		mtspr(SPRN_UAMOR,	sprs.uamor);
>
>  		/*
