Return-Path: <linuxppc-dev+bounces-3071-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D59C2E94
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2024 17:52:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xm2174NjDz2xKL;
	Sun, 10 Nov 2024 03:52:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731171163;
	cv=none; b=Grm/EDenIZtwFwX4pU49iMZ+1/Ci5inDiY+aSihA5il4EmxYzE+t8+AivtJSS/+NFL5sIKnEeGmtERRnQnno9qwkQ/YeUcJ1FdcwNtg3NUElCVBohTQydZrD97/ffWppJumiQu4BIlt17sRp/vomnJy1TSOUzbJutm3jsyA8nuGlvURvKy3JfWZeLGialzQ8zDkw+HLN8fZWGuPuENlhFtbfoJfFOwmwkZovCuow6kS1FInP2lV5NRqO/qU7r/vCa7WMGRKESHI+N0Z00hmv+jKU0IxEjYzCVtWNuCSGVki0bu+th8Cf0SYgSRysuDfZCjcilRXgbfDDFp2DYS04Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731171163; c=relaxed/relaxed;
	bh=SIFfFEVYdr09UeyG+odxtg81eZb+MLC5B5zgLgaeW7c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B2v1SwEOpKNp0cm9Y3WeyKoBTWAFtvelV9xpZq3QsQfxKgZdfvH7dOCvy8vZBRpi144uIVsPYvA7+U72jxoI2tSjaD1nhE+k/YA5GDMVb8aGyOY8cv+8juWXAVC1dWj0akAfHKUG1UIpfYYULxpwCIvx/h0RF2PoCA2tzQ3iuL+pz1BCdz9SxFEV4K9uM5ZtbckePSDLVfPY9JQWBzLAaSOwP/ZkaUZHDhNW8bUYloHf7oz6rsJkbfqxI0I7vwDQRFOOmnn0/9kkNtbdrzznCrBFDbp7Hd5sAWO/hBeFNf/9IaZER5GhbICFvKrQe8txRdrxU8SdwLezQZ2F6W6UXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mh4IKD7x; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mh4IKD7x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xm21570d5z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2024 03:52:41 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A9FfLPH012168;
	Sat, 9 Nov 2024 16:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SIFfFE
	VYdr09UeyG+odxtg81eZb+MLC5B5zgLgaeW7c=; b=Mh4IKD7xvcmPEmQaaJKpSE
	HibAZt0d4eZvm9As9HMWOXr4nGltgRcuzPW9fTUIGyJtJdYGmql5tLTHVyBMbMZU
	0fcSDNcEHqH7VFx3dgI94pXTCOX7f410hdgFtYbpM7DSF1etTfbUtx9jEJNO6h9K
	ohYi7YZEz13iD4wEN2dVD9jaZbGA7yajaQYKtS40za4WbgfXVAvAbwFqM5MhdKEc
	ihfrFvxK0Va6g59GyOXvwiOyTWTW/3WBv8GcFj3LyxYrOtKbjLte5yGWzvkdrNSJ
	MupVuz0khhpkB8rSgqDB3cEeoJIdVA6DeswqNd+bTuz12IBXOkLeo/FkIkt7zTeg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42tak3g54p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 16:52:10 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A9GqAaQ010984;
	Sat, 9 Nov 2024 16:52:10 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42tak3g54j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 16:52:10 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A97dhRX031854;
	Sat, 9 Nov 2024 16:52:09 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nydmv93h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 16:52:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A9Gq74L41419106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 9 Nov 2024 16:52:07 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C36D920043;
	Sat,  9 Nov 2024 16:52:07 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C579320040;
	Sat,  9 Nov 2024 16:52:04 +0000 (GMT)
Received: from [9.39.24.130] (unknown [9.39.24.130])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  9 Nov 2024 16:52:04 +0000 (GMT)
Message-ID: <054a79d6-85a4-4c02-a361-d8e4b34ca674@linux.ibm.com>
Date: Sat, 9 Nov 2024 22:22:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Add preempt lazy support
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        maddy@linux.ibm.com, christophe.leroy@csgroup.eu, peterz@infradead.org,
        ankur.a.arora@oracle.com
References: <20241108101853.277808-1-sshegde@linux.ibm.com>
 <20241108105031.Uq8MV60I@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241108105031.Uq8MV60I@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KNUNqiew6M-jXcFDF3ZOUrxOzLp2x8GA
X-Proofpoint-GUID: bJ7nt8f16msX7g0ziNrbOjuWd6Lx1Hea
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
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
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 clxscore=1015 mlxlogscore=616 lowpriorityscore=0 suspectscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411090142
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Thank you Sebastian for taking a look and rwb tag.

> On 2024-11-08 15:48:53 [+0530], Shrikanth Hegde wrote:
>> Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
>> 16 bit range of NEED_RESCHED, so compiler can issue single andi.
>>
>> Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
>> to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for
>> return to kernel.
>>
>> Ran a few benchmarks and db workload on Power10. Performance is close to
>> preempt=none/voluntary. It is possible that some patterns would
>> differ in lazy[2]. More details of preempt lazy is here [1]
>>
>> Since Powerpc system can have large core count and large memory,
>> preempt lazy is going to be helpful in avoiding soft lockup issues.
>>
>> [1]: https://lore.kernel.org/lkml/20241007074609.447006177@infradead.org/
>> [2]: https://lore.kernel.org/all/1a973dda-c79e-4d95-935b-e4b93eb077b8@linux.ibm.com/
> 
> The lazy bits are only in tip.
>

Hi Michael, I sent it to powerpc tree since all the changes were in 
arch/powerpc. Please let me know if i have send it to tip tree instead.


> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
>> index af62ec974b97..8f4acc55407b 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -396,7 +396,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>>   		/* Returning to a kernel context with local irqs enabled. */
>>   		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>>   again:
>> -		if (IS_ENABLED(CONFIG_PREEMPT)) {
>> +		if (IS_ENABLED(CONFIG_PREEMPTION)) {
>>   			/* Return to preemptible kernel context */
>>   			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
>>   				if (preempt_count() == 0)
> 
> Shouldn't exit_vmx_usercopy() get also this
> s@CONFIG_PREEMPT@CONFIG_PREEMPTION@ change ?
> 

I had seen this, but wasn't sure. Will take a look at it.
Thanks for the pointers.

> Sebastian


