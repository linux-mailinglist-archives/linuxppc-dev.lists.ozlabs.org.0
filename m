Return-Path: <linuxppc-dev+bounces-11916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE2B4A5D5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 10:47:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLcrP4NrVz3cYG;
	Tue,  9 Sep 2025 18:47:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757407621;
	cv=none; b=BjE8ZID3+mh8Dan/Rjm/Cdz/zs9eNy4yCR3HhuVaMLKAqbNsK7a4jngfUsjsMHzn8BdKngpbInPAHcGiST7mFv4mpVYRYkprGYBVyXTrIvAEIlE0i9bS6lzl5z3u2u1xcMbZnuwP6ErQfaA8JJgR87HpGedb9x0WJH6rntR4MNqevnZatGmneK+jFjIFN8THFVZRLWxfGaqXp3yTdygJ8Tu8T+LmRroaVaS7fNPRiiatyNozRBFih2/c+nSuJqLJpuKc7MPCiv2NdtSUKShYHtUvFwWbY5sASkRx0XGu2FVZR6PsP/b7pCuEsAXH5iSVBSEUsmRjJwfftTdigZ6xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757407621; c=relaxed/relaxed;
	bh=qlEAMkCRMmlN5bIEaUH8aHyGNYn6dZofdlf44oFUN1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0IMj08YsSVBItYo5CDzUXuo40ZjAZoWBO2qbjumgeATagRYeH9hd5G6fX+wKxkh+p3+LoLEDL6AbV0vMTIW0HLgcZXc7U5UjstQUDIWsCCktfJi/K9z9X3E8Oi1p1g6e2ikVQC+bjJI2KzOdW4p4pGJMg0alUG7HNSxoBijOAf42BOzKRcLSN2BMohYbygR4uClPN+qeqno7PuVmG7GUanCarruWGy3Cso9U4fRhGlYuj+5dwyoTy7NFTweNWDqG41XUALGpgpDcJ/Nk3heb+PlPC5Dw9p+3E59VterU9UYHaB5QoiwAlsU4yRan3CvQz7WS2PZQQyFW8ZKtGGmyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nd5tYO/y; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nd5tYO/y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLcrN5ZK7z30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 18:47:00 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5893M0RV022815;
	Tue, 9 Sep 2025 08:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qlEAMk
	CRMmlN5bIEaUH8aHyGNYn6dZofdlf44oFUN1c=; b=nd5tYO/yG5FxSencqDtpLY
	SesSFVvibos4l0SKbWpUnkiQuxBEW6e0kWaNYezuswtNoLJyGAvjgs5g+aHfNnEG
	N0MRohwLdnlbaBTMbtj0NNyO6we0gTYywinwva/Ou5VPcSJ3LxbFNYn2JN3cDvmz
	XLrsEW0/znbcLxLn0IWM//OEbwVxWDcvxqS3tkM5K1zBRJ1FX3bSFKibnu/c2M2F
	WK9jiWgKY0wKN900tvh0WoeaYE1tvP6J6ETp6qhTUyjVpmImbCjSWCGso5VT2VPc
	PAEr8hQya7/BXQKsWW8XfgmPCj2z8XZBzULjVCpbf/mmgS7Ygfart01kuhmb/aDg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcspc1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:46:38 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5898hTFx020019;
	Tue, 9 Sep 2025 08:46:38 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcspc1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:46:38 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5895h3jt020700;
	Tue, 9 Sep 2025 08:46:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp0tc2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 08:46:37 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5898kWZx17039650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 08:46:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 992962004D;
	Tue,  9 Sep 2025 08:46:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E04FD20040;
	Tue,  9 Sep 2025 08:46:23 +0000 (GMT)
Received: from [9.109.207.139] (unknown [9.109.207.139])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 08:46:23 +0000 (GMT)
Message-ID: <4adc3f46-15df-4a0a-af81-eecf81127c44@linux.ibm.com>
Date: Tue, 9 Sep 2025 14:16:01 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, deller@gmx.de, ldv@strace.io,
        macro@orcam.me.uk, charlie@rivosinc.com, akpm@linux-foundation.org,
        bigeasy@linutronix.de, ankur.a.arora@oracle.com, naveen@kernel.org,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com, peterz@infradead.org,
        tglx@linutronix.de, namcao@linutronix.de, kan.liang@linux.intel.com,
        mingo@kernel.org, oliver.upton@linux.dev, mark.barnett@arm.com,
        atrajeev@linux.vnet.ibm.com, rppt@kernel.org, coltonlewis@google.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250908210235.137300-2-mchauras@linux.ibm.com>
 <20250908210235.137300-11-mchauras@linux.ibm.com>
 <5ffe0761-67c0-42ce-be3f-13915aa67080@linux.ibm.com>
Content-Language: en-US
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
In-Reply-To: <5ffe0761-67c0-42ce-be3f-13915aa67080@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX/BdCXo/BRzgc
 Tp6r3jO3z/Wl9Dr9uSSEYf6ZbLnodweBzN4n0cKr3jfiISST/1/MfecPw7zrcd+BMBNmoYWFrUR
 ps5EiWiL9FcE1J9EEAtFEfQMe1I8c31mqhU9UqJFtVVKtXNZxKCTuN2IsN/KP+eomapfE6Y1Nka
 xH4YFi7HoUHPSBQt/yuEeNR8K7frueJRCr2BYJvmTcVppEP64bif4OXUBBLsF0QvzXP2Faa97sR
 oM1JDRTerxmXBXM66l/1C6XIehEwTwxgVhajvH240CSwFzwSoquPRxtdEhPHckfH2vkvyfUHsKe
 xgI02+Iwvyku5mrgQFh89TuJ2QWvKdjrArc9h5VeSs6D5tdxIY2hsw6bfNe5eX22mAj4lyzdeUR
 VIfCUwUs
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68bfe96e cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=FuRnj6zlySlOp9212E8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9lp2iKdIHfY5574hIX0sj19ASl8QMMw7
X-Proofpoint-ORIG-GUID: JBKS3Y9ITvdVsPxH3T5ZUxsJaCOeOTRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/9/25 12:24, Shrikanth Hegde wrote:
>
>
> On 9/9/25 2:32 AM, Mukesh Kumar Chaurasiya wrote:
>> Enable the syscall entry and exit path from generic framework.
>>
>> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
>> ---
>
> Hi Mukesh.
> Thanks for working on this and getting it to better shape.
>
>>   arch/powerpc/Kconfig |   1 +
>>   arch/powerpc/include/asm/entry-common.h |   2 +-
>>   arch/powerpc/kernel/interrupt.c         | 135 +++++++----------------
>>   arch/powerpc/kernel/ptrace/ptrace.c     | 141 ------------------------
>>   arch/powerpc/kernel/signal.c            |  10 +-
>>   arch/powerpc/kernel/syscall.c           | 119 +-------------------
>>   6 files changed, 49 insertions(+), 359 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index e0c51d7b5638d..e67294a72e4d4 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -199,6 +199,7 @@ config PPC
>>       select GENERIC_CPU_AUTOPROBE
>>       select GENERIC_CPU_VULNERABILITIES    if PPC_BARRIER_NOSPEC
>>       select GENERIC_EARLY_IOREMAP
>> +    select GENERIC_ENTRY
>>       select GENERIC_GETTIMEOFDAY
>>       select GENERIC_IDLE_POLL_SETUP
>>       select GENERIC_IOREMAP
>> diff --git a/arch/powerpc/include/asm/entry-common.h 
>> b/arch/powerpc/include/asm/entry-common.h
>> index d3f4a12aeafca..8fb74e6aa9560 100644
>> --- a/arch/powerpc/include/asm/entry-common.h
>> +++ b/arch/powerpc/include/asm/entry-common.h
>> @@ -3,7 +3,7 
>
> There could be some of the configs we need to take care while enabling 
> generic entry. Since powerpc
> didn't have it earlier, there could areas which needs cleanup. One for 
> example dynamic preemption.
> There could be more. Do some git history checks and see.
>
> Issue with dynamic preemption:
>
> ld: 
> kernel/entry/common.o:/home/shrikanth/sched_tip/kernel/entry/common.c:161: 
> multiple definition of `sk_dynamic_irqentry_exit_cond_resched';
> arch/powerpc/kernel/interrupt.o:/home/shrikanth/sched_tip/arch/powerpc/kernel/interrupt.c:29: 
> first defined here
>
> Below diff helps to fix and changing preemption modes help. Also 
> verified preempt lazy works too.
>
> ---
> diff --git a/arch/powerpc/kernel/interrupt.c 
> b/arch/powerpc/kernel/interrupt.c
> index 642e22527f9d..e1e0f0da4165 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -25,10 +25,6 @@
>  unsigned long global_dbcr0[NR_CPUS];
>  #endif
>
> -#if defined(CONFIG_PREEMPT_DYNAMIC)
> -DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> -#endif
> -
>  #ifdef CONFIG_PPC_BOOK3S_64
>  DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
>  static inline bool exit_must_hard_disable(void)
>
>
Hey Srikanth,

Thanks for this. I will add this in next revision.

Mukesh
> ----
> Though ideal thing is move them to sched/core instead of being in 
> generic code. Like below.
> https://lore.kernel.org/all/20250716094745.2232041-1-sshegde@linux.ibm.com/ 
>
>


