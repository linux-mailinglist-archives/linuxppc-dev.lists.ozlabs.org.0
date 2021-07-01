Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 983E23B9226
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:17:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzKP3z7Zz3bXV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:17:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fsZ8vxX2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fsZ8vxX2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzJv2bl3z2yss
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:17:18 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D3atx129620; Thu, 1 Jul 2021 09:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=GAxXKlyZyNxTBVMCsMHaQd4afXjIIrB0bn+40Gyojg0=;
 b=fsZ8vxX2FSBlUgvB0sv39TqQfxl8E7YqUwMIJLQVuUQbPRbLglrwUfjNro1eyRXNUkoZ
 wYCh9DzKfoC671jB0rDhZGD1tEz2HUwGJ2rd1zx4ARWANonOuNghlMREEh1VzkltOy3y
 uuopYR+KN684U/fQf870lpTOAwt4xrZZZyVgtf01x8MiCbGybiX+ef5WLlFmkIKADh29
 pZXNNJPcGrz+LuDmv3peNc277yYx+yB4jHyW09Rp5pLHSLXL7aL3vqNXjzdxrrGHbbu6
 vvUErZ37s3ohOp+FC9xuQ9rrvFjwHmaHVYOjjvzKHTrpBPGNFMfCzP35WgrFSp0DuLr6 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39hdyfs0tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:17:15 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 161D3dNP130277;
 Thu, 1 Jul 2021 09:17:14 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39hdyfs0sp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:17:14 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DDe4O014926;
 Thu, 1 Jul 2021 13:17:13 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 39duv8ae67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:17:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DHAc632243982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:17:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D872411C04C;
 Thu,  1 Jul 2021 13:17:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20EF911C0E1;
 Thu,  1 Jul 2021 13:17:10 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.199.48.221])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Jul 2021 13:17:09 +0000 (GMT)
Subject: Re: [RFC PATCH 10/43] powerpc/64s: Always set PMU control registers
 to frozen/disabled when not in use
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-11-npiggin@gmail.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <c607e40c-5334-e8b1-11ac-c1464332e01a@linux.ibm.com>
Date: Thu, 1 Jul 2021 18:47:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210622105736.633352-11-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zcV2rhwWArt-vaWobp9NHCywIMnJsKfw
X-Proofpoint-ORIG-GUID: xdZSMj1KOireHD7omvSBnzYGMr7zhU3A
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1011 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107010082
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/22/21 4:27 PM, Nicholas Piggin wrote:
> KVM PMU management code looks for particular frozen/disabled bits in
> the PMU registers so it knows whether it must clear them when coming
> out of a guest or not. Setting this up helps KVM make these optimisations
> without getting confused. Longer term the better approach might be to
> move guest/host PMU switching to the perf subsystem.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/cpu_setup_power.c | 4 ++--
>   arch/powerpc/kernel/dt_cpu_ftrs.c     | 6 +++---
>   arch/powerpc/kvm/book3s_hv.c          | 5 +++++
>   arch/powerpc/perf/core-book3s.c       | 7 +++++++
>   4 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
> index a29dc8326622..3dc61e203f37 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.c
> +++ b/arch/powerpc/kernel/cpu_setup_power.c
> @@ -109,7 +109,7 @@ static void init_PMU_HV_ISA207(void)
>   static void init_PMU(void)
>   {
>   	mtspr(SPRN_MMCRA, 0);
> -	mtspr(SPRN_MMCR0, 0);
> +	mtspr(SPRN_MMCR0, MMCR0_FC);

Sticky point here is, currently if not frozen, pmc5/6 will
keep countering. And not freezing them at boot is quiet useful
sometime, like say when running in a simulation where we could calculate
approx CPIs for micro benchmarks without perf subsystem.

>   	mtspr(SPRN_MMCR1, 0);
>   	mtspr(SPRN_MMCR2, 0);
>   }
> @@ -123,7 +123,7 @@ static void init_PMU_ISA31(void)
>   {
>   	mtspr(SPRN_MMCR3, 0);
>   	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
> -	mtspr(SPRN_MMCR0, MMCR0_PMCCEXT);
> +	mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
>   }
>
>   /*
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index 0a6b36b4bda8..06a089fbeaa7 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -353,7 +353,7 @@ static void init_pmu_power8(void)
>   	}
>
>   	mtspr(SPRN_MMCRA, 0);
> -	mtspr(SPRN_MMCR0, 0);
> +	mtspr(SPRN_MMCR0, MMCR0_FC);
>   	mtspr(SPRN_MMCR1, 0);
>   	mtspr(SPRN_MMCR2, 0);
>   	mtspr(SPRN_MMCRS, 0);
> @@ -392,7 +392,7 @@ static void init_pmu_power9(void)
>   		mtspr(SPRN_MMCRC, 0);
>
>   	mtspr(SPRN_MMCRA, 0);
> -	mtspr(SPRN_MMCR0, 0);
> +	mtspr(SPRN_MMCR0, MMCR0_FC);
>   	mtspr(SPRN_MMCR1, 0);
>   	mtspr(SPRN_MMCR2, 0);
>   }
> @@ -428,7 +428,7 @@ static void init_pmu_power10(void)
>
>   	mtspr(SPRN_MMCR3, 0);
>   	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
> -	mtspr(SPRN_MMCR0, MMCR0_PMCCEXT);
> +	mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
>   }
>
>   static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 1f30f98b09d1..f7349d150828 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2593,6 +2593,11 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
>   #endif
>   #endif
>   	vcpu->arch.mmcr[0] = MMCR0_FC;
> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +		vcpu->arch.mmcr[0] |= MMCR0_PMCCEXT;
> +		vcpu->arch.mmcra = MMCRA_BHRB_DISABLE;
> +	}
> +
>   	vcpu->arch.ctrl = CTRL_RUNLATCH;
>   	/* default to host PVR, since we can't spoof it */
>   	kvmppc_set_pvr_hv(vcpu, mfspr(SPRN_PVR));
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 51622411a7cc..e33b29ec1a65 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1361,6 +1361,13 @@ static void power_pmu_enable(struct pmu *pmu)
>   		goto out;
>
>   	if (cpuhw->n_events == 0) {
> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> +			mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
> +			mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
> +		} else {
> +			mtspr(SPRN_MMCRA, 0);
> +			mtspr(SPRN_MMCR0, MMCR0_FC);
> +		}
>   		ppc_set_pmu_inuse(0);
>   		goto out;
>   	}
