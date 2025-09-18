Return-Path: <linuxppc-dev+bounces-12376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5844EB85677
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 17:00:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSJhh2DVsz30RJ;
	Fri, 19 Sep 2025 01:00:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758178717;
	cv=none; b=Sq2vw1WhJh7P+IuJ9ITYzKJPnr6723z2xCr8OUbQdly/Vev8WALCRUPGONy/MOEW00GYpe1F4oYGFDZvb31g2Yd4xcHKJ/xhXHUggn9wAx+NL34Kcesc3eqZYXdxuwP7R/YVsKl/lbcJjtjbval5h3DdO5r9x4uEyixYyAbPVVZmyhWmIHUklA5UogPOfL3/Ld7JqhWVkMRhEHoOWBnLxEdPxHBT08OXFyVKfkdJp7JVN7JEeTap5Lna27byR0kk3DDC9VdGuQcVZ60jHkhiVSpsXz2qDFA+GAlXWvmJyMZn5UeOKJAnkO8BTHM/ebijwJ/aMCn45A1sjlByz7oqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758178717; c=relaxed/relaxed;
	bh=brd0jGLEahzq+jQ9bb8/eI3nZ4dAnh1Dj3AmnuAzON8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/EiMqD1k88+bwXF8FT6EqdUa8wfw7ADs+6nupF6CfnrsUyC35QPBN5ZGLTVYdFZ1OPsm2GnR64ED/WMJLXLWMHSwkGov4Y4P2uwK7tdwp+pJf7vacTzGH9Y33oNeiBP42kX1gTJygtzf5KlryMo9i66btDoRN9xehJAZGzjOTqiKsNyxmJvePGRtm7wRiNBd05Bzb3FtxdXyFoWodnjnFhiAmQDyljf3yuOTspmWtmMCRR8Risp5eW4G6yvKzpbD/1idUfTXgDeDRWOCbPW/J724YPuWRM1bCX3YxpmgKwmxAyunLOQvl2rbCxDEufv1DsvlUGWhEw2lSwh+NXF1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l+YoZI7i; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l+YoZI7i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cS61838WBz3000
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 16:58:36 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I6sQZV032451;
	Thu, 18 Sep 2025 06:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=brd0jG
	LEahzq+jQ9bb8/eI3nZ4dAnh1Dj3AmnuAzON8=; b=l+YoZI7i570i0M6jU9uXN0
	9qDx+BfUAMSfRF1sb+aAyPBDWyVElY4ACRTQzJtXQUJKt6hs+itA1pNGpumlUNZ1
	SoWypS56/UYawstdJ+ry8ASYcERxRuaBYm0Bq0h8xvqMxHBunVuJ1jJR1rdriyp7
	xRMtGOCiDz4xXx9mJqd7Jygyi8Y58SBB9cd2TC0X1brt/el/QCcWBUeTh0hhCEkx
	90HKyG4uvC3E5CrJ+Dj4Zi5oUNBceHOx8zCKTYvHsy+mUPCjfdm7THSozkw+DP0s
	Npidep6wLlCKp/nbptw0zG8esZiNbk3P8y+7vinzFlCvm5ySUuXdUN2eM6e1e0Hw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4hrj0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:58:07 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58I6rNqe006459;
	Thu, 18 Sep 2025 06:58:07 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4hrj0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:58:06 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58I53Osi029536;
	Thu, 18 Sep 2025 06:58:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kb15hxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:58:05 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58I6w1lg59441606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 06:58:01 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 353A720043;
	Thu, 18 Sep 2025 06:58:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F88A20040;
	Thu, 18 Sep 2025 06:57:54 +0000 (GMT)
Received: from [9.109.209.61] (unknown [9.109.209.61])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Sep 2025 06:57:54 +0000 (GMT)
Message-ID: <48e364e5-47d8-4d12-a77d-a3f42996a7d3@linux.ibm.com>
Date: Thu, 18 Sep 2025 12:27:53 +0530
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
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
        Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
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
Content-Language: en-US, en-IN, en-GB
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
In-Reply-To: <5ffe0761-67c0-42ce-be3f-13915aa67080@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WxSnkXHMHquJMhDWW43d_N7T76Sutj1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwNCBTYWx0ZWRfXztAE3Yaml1zs
 6/zLNWv9cer8vEUnJVy6ZuPW999Yo5htPt0+EuxEQp4yNrXizyE4kBZTnfiQTIkzlIcGswgG7sM
 Pxp8SGAOK1tDA3BPAUqsWctpaura9QV2NaTi8r+bUriPZu2s+/6zD6Bs94FIv7tz5EMplLc9moA
 HUX95vNLthZBtOKQa5rMlAjoPNOkq9ekhu9jpJHzsTAGhartDiOfQlbNzpHwlvYLFNWu2dNo6nl
 t3jJK4QHAsTugaamX5sANax0hxKC7BSor1NyR7ksEs1TBYevQa8GVJ3rt3zz3n50tqFwORR/3jF
 k/Dzo+KkYdUanW6/527YHqwoLFA7ECEqw8sNn826nSHiX5mlGpEEvsVcKn9S/Og4tmO8XMOP+sp
 EuNuCaWF
X-Proofpoint-GUID: BvgrIXZFl_IXXLu0u182Snw0tho6wQR_
X-Authority-Analysis: v=2.4 cv=co2bk04i c=1 sm=1 tr=0 ts=68cbad7f cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=-kjzzyyERGOlH0tmX-gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160204
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 9/9/25 12:24 PM, Shrikanth Hegde wrote:
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
> ----
> Though ideal thing is move them to sched/core instead of being in 
> generic code. Like below.
> https://lore.kernel.org/all/20250716094745.2232041-1-sshegde@linux.ibm.com/ 
>
>
Sure.

