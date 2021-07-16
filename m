Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3BE3CB135
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 05:44:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQxv622Jkz3bXx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 13:44:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LYBttbIy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LYBttbIy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQxtZ15smz2yMp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 13:44:05 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G3XEEp072422; Thu, 15 Jul 2021 23:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FTLxi/gX/UR0Vzp30riXJg0e+s7/6qLFshAocShAUYE=;
 b=LYBttbIykdkqwy4jHCOLqVSjGYD98bNYBIgx7+w4v1x3OgzfBDNaPdKoJhRRL+dWqpZj
 lIs0khtXahwkMuFzbmaDaLeEUe5edVzjadu7IcahJPGTMGIqlWitulEkG0NRG6wcycdp
 YV7NofdgZf0x7GINU8Mo9fBk4ha3Kh7JUtr+sQzZfrVhsMYeoweYleWxRLp0pUo0r5yY
 V/qWloZCHR1Exo4mtI8k8LenGPwD/6SGy9iFI/nZMZnNcptjAQmscrIF+zq2sJhUE+Jc
 o0HNvQCKSAgBDZC2X51E8jfAykmMsOYNjWzSWX+Sq/owgu0kzTCLUEkkjs95mBeDMIOc oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39tw4p6tpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 23:44:00 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16G3XZFq073540;
 Thu, 15 Jul 2021 23:44:00 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39tw4p6tpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 23:43:59 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16G3hvEX025271;
 Fri, 16 Jul 2021 03:43:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 39q368ahhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 03:43:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16G3hsQA23855560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 03:43:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C57B742047;
 Fri, 16 Jul 2021 03:43:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9D074203F;
 Fri, 16 Jul 2021 03:43:52 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.69.64])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 03:43:51 +0000 (GMT)
Subject: Re: [RFC PATCH 10/43] powerpc/64s: Always set PMU control registers
 to frozen/disabled when not in use
To: Nicholas Piggin <npiggin@gmail.com>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-11-npiggin@gmail.com>
 <C58A063A-3B5D-4188-80E2-4C19802785BF@linux.vnet.ibm.com>
 <1626057462.8m12ralsd6.astroid@bobo.none>
 <1626265929.asca0gyunh.astroid@bobo.none>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <6d328555-252b-f6d1-ca3e-4deb70f95000@linux.ibm.com>
Date: Fri, 16 Jul 2021 09:13:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1626265929.asca0gyunh.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sn7L8R0xs1BsuE5RGFJGeTBEsx8z3u_X
X-Proofpoint-GUID: 6MMSlTVpVyq78XOlCtw7ixv0xXWSIrY_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_01:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160018
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/14/21 6:09 PM, Nicholas Piggin wrote:
> Excerpts from Nicholas Piggin's message of July 12, 2021 12:41 pm:
>> Excerpts from Athira Rajeev's message of July 10, 2021 12:50 pm:
>>>
>>>> On 22-Jun-2021, at 4:27 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>>>
>>>> KVM PMU management code looks for particular frozen/disabled bits in
>>>> the PMU registers so it knows whether it must clear them when coming
>>>> out of a guest or not. Setting this up helps KVM make these optimisations
>>>> without getting confused. Longer term the better approach might be to
>>>> move guest/host PMU switching to the perf subsystem.
>>>>
>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>> ---
>>>> arch/powerpc/kernel/cpu_setup_power.c | 4 ++--
>>>> arch/powerpc/kernel/dt_cpu_ftrs.c     | 6 +++---
>>>> arch/powerpc/kvm/book3s_hv.c          | 5 +++++
>>>> arch/powerpc/perf/core-book3s.c       | 7 +++++++
>>>> 4 files changed, 17 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
>>>> index a29dc8326622..3dc61e203f37 100644
>>>> --- a/arch/powerpc/kernel/cpu_setup_power.c
>>>> +++ b/arch/powerpc/kernel/cpu_setup_power.c
>>>> @@ -109,7 +109,7 @@ static void init_PMU_HV_ISA207(void)
>>>> static void init_PMU(void)
>>>> {
>>>> 	mtspr(SPRN_MMCRA, 0);
>>>> -	mtspr(SPRN_MMCR0, 0);
>>>> +	mtspr(SPRN_MMCR0, MMCR0_FC);
>>>> 	mtspr(SPRN_MMCR1, 0);
>>>> 	mtspr(SPRN_MMCR2, 0);
>>>> }
>>>> @@ -123,7 +123,7 @@ static void init_PMU_ISA31(void)
>>>> {
>>>> 	mtspr(SPRN_MMCR3, 0);
>>>> 	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
>>>> -	mtspr(SPRN_MMCR0, MMCR0_PMCCEXT);
>>>> +	mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
>>>> }
>>>>
>>>> /*
>>>> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
>>>> index 0a6b36b4bda8..06a089fbeaa7 100644
>>>> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
>>>> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
>>>> @@ -353,7 +353,7 @@ static void init_pmu_power8(void)
>>>> 	}
>>>>
>>>> 	mtspr(SPRN_MMCRA, 0);
>>>> -	mtspr(SPRN_MMCR0, 0);
>>>> +	mtspr(SPRN_MMCR0, MMCR0_FC);
>>>> 	mtspr(SPRN_MMCR1, 0);
>>>> 	mtspr(SPRN_MMCR2, 0);
>>>> 	mtspr(SPRN_MMCRS, 0);
>>>> @@ -392,7 +392,7 @@ static void init_pmu_power9(void)
>>>> 		mtspr(SPRN_MMCRC, 0);
>>>>
>>>> 	mtspr(SPRN_MMCRA, 0);
>>>> -	mtspr(SPRN_MMCR0, 0);
>>>> +	mtspr(SPRN_MMCR0, MMCR0_FC);
>>>> 	mtspr(SPRN_MMCR1, 0);
>>>> 	mtspr(SPRN_MMCR2, 0);
>>>> }
>>>> @@ -428,7 +428,7 @@ static void init_pmu_power10(void)
>>>>
>>>> 	mtspr(SPRN_MMCR3, 0);
>>>> 	mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
>>>> -	mtspr(SPRN_MMCR0, MMCR0_PMCCEXT);
>>>> +	mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
>>>> }
>>>>
>>>> static int __init feat_enable_pmu_power10(struct dt_cpu_feature *f)
>>>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>>>> index 1f30f98b09d1..f7349d150828 100644
>>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>>>> @@ -2593,6 +2593,11 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
>>>> #endif
>>>> #endif
>>>> 	vcpu->arch.mmcr[0] = MMCR0_FC;
>>>> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>>>> +		vcpu->arch.mmcr[0] |= MMCR0_PMCCEXT;
>>>> +		vcpu->arch.mmcra = MMCRA_BHRB_DISABLE;
>>>> +	}
>>>> +
>>>> 	vcpu->arch.ctrl = CTRL_RUNLATCH;
>>>> 	/* default to host PVR, since we can't spoof it */
>>>> 	kvmppc_set_pvr_hv(vcpu, mfspr(SPRN_PVR));
>>>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
>>>> index 51622411a7cc..e33b29ec1a65 100644
>>>> --- a/arch/powerpc/perf/core-book3s.c
>>>> +++ b/arch/powerpc/perf/core-book3s.c
>>>> @@ -1361,6 +1361,13 @@ static void power_pmu_enable(struct pmu *pmu)
>>>> 		goto out;
>>>>
>>>> 	if (cpuhw->n_events == 0) {
>>>> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>>>> +			mtspr(SPRN_MMCRA, MMCRA_BHRB_DISABLE);
>>>> +			mtspr(SPRN_MMCR0, MMCR0_FC | MMCR0_PMCCEXT);
>>>> +		} else {
>>>> +			mtspr(SPRN_MMCRA, 0);
>>>> +			mtspr(SPRN_MMCR0, MMCR0_FC);
>>>> +		}
>>>
>>> Hi Nick,
>>>
>>> We are setting these bits in “power_pmu_disable” function. And disable will be called before any event gets deleted/stopped. Can you please help to understand why this is needed in power_pmu_enable path also ?
>> I'll have to go back and check what I needed it for.
> Okay, MMCRA is getting MMCRA_SDAR_MODE_DCACHE set on POWER9, by the looks.
>
> That's not necessarily a problem, but KVM sets MMCRA to 0 to disable
> SDAR updates. So KVM and perf don't agree on what the "correct" value
> for disabled is. Which could be a problem with POWER10 not setting BHRB
> disable before my series.

Nick,

BHRB disable will be only known to P10 guest kernel and in case of
P9 guest kernel it is not known. And for the P10 host and guest,
I guess we set BHRB_DISABLE in cpu_setup code and also in 
power_pmu_disable().
So you areseeing P10 guest having MMCRA as zero during context switch?

Maddy
>
> I'll get rid of this hunk for now, I expect things won't be exactly clean
> or consistent until the KVM host PMU code is moved into perf/ though.
>
> Thanks,
> Nick
