Return-Path: <linuxppc-dev+bounces-3243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB299CD9C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 08:19:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqT190B9yz2y66;
	Fri, 15 Nov 2024 18:19:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731655180;
	cv=none; b=a4tJZma8mE2gn8gXHSzr3taX7GsfcIwAhtRFnHyWz363zrdtQRNAJ4QfRKLfY6JYlbxDlhTdK7bVxqctrELnVQaoy4WNQn9OC9UR822hV62V9m4n40T+6VR/y0Wm4Hx2u25jmnE4xICgICc5loMf1m78tpyFj2F3tcM1hFMcCuXdlw6O8Sf5UsL67Ck5WIjVQ9Ixhgrs1h6DQBiChvrhJEJpdLlJL/s+NKHs9Bf8KO8F/CsAWVwBOKxZprziXRjPovoQ67g2tjQVhu6YtsX+fH0TRl9BSFTm3qQsfPzYCqXMkgAQNCiVvau6CvntcEwsHuF5syz1b+zo54ToBbL3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731655180; c=relaxed/relaxed;
	bh=rgMo3wArx7V3RcNrgbf77y2+EgI8P5kv/RoQTtNPXfo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DJG84uXYvcRA4EgEn9Bm2znP8uzrMLhVJXnPsN8rKvATpzOVquNwOE1Z0IysNMqB/wRjSdeW4bSwy8w2zzoCKeQs2zgMdagaQZEAuqHGIbZELJ9PTnwj/RG6y9RBMMQ1kSg2Mch+vn3q7ITJok1lBlyjWbnX/txQqqB93s73wNUIx2/wn4F7T9dRAIgTYMz7Cu20rirRMgMFDqT8kRtlbOAgyPaBEdb2YZ3l+eDXgdONkKH+t9PBs2MpVgUKZh+NzN+GrEFMAIbUUKJQMr5RD59Zl0evNq+ACWrdf4K2RKWukimwtA+Fip9Ax2rjObp4YkDZFn9YauB/8P1zayKvzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O34Th1d6; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O34Th1d6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqT156FjHz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 18:19:37 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF0jrls018360;
	Fri, 15 Nov 2024 07:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rgMo3w
	Arx7V3RcNrgbf77y2+EgI8P5kv/RoQTtNPXfo=; b=O34Th1d6EePKWCZX/Dy0z1
	ohw6LcfAflA8Mq5kgmjxhlFXD1caa1tBUnt5u0JsJLIuh5hxRG+0Uo5CsujAd9BI
	lU5orskpfyXis6KpoqJIotgo9cRydAGgKPznf0FLH32w91Yc5X4C7hJITngvx96O
	kCJE3ESFd6Hw07A+HAQwpkBm+ZRpHzzH0awsfu0JIUAPZsr+0gCXP3WrxmUxAF+s
	lrrzc4Sk2x9XM/XgPz1UcsvIT8C9j3TktAv8vg2AzbUQ4tHNZL4fy+wzjReFupIk
	kDhB/P+7isaDVGnLqtyRcC8hsV73w4UVQRbV900yXWBKJF6GGCKp9ynhIIqLbaCw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42wrvkt62f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 07:19:12 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AF7JCHk017786;
	Fri, 15 Nov 2024 07:19:12 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42wrvkt628-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 07:19:12 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF68iYO008243;
	Fri, 15 Nov 2024 07:19:11 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42tjf0fwk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 07:19:11 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AF7J7Wh18809144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Nov 2024 07:19:07 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1383420040;
	Fri, 15 Nov 2024 07:19:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F406D20049;
	Fri, 15 Nov 2024 07:19:04 +0000 (GMT)
Received: from [9.39.26.152] (unknown [9.39.26.152])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Nov 2024 07:19:04 +0000 (GMT)
Message-ID: <16e10c41-4e32-4987-b4e1-56d7247d3c1c@linux.ibm.com>
Date: Fri, 15 Nov 2024 12:49:04 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Add preempt lazy support
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        maddy@linux.ibm.com, christophe.leroy@csgroup.eu, peterz@infradead.org,
        bigeasy@linutronix.de, vaibhav@linux.ibm.com
References: <20241108101853.277808-1-sshegde@linux.ibm.com>
 <87fro135qt.fsf@oracle.com>
 <f8fe7182-d9e8-4323-a4ce-94fa0080365c@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <f8fe7182-d9e8-4323-a4ce-94fa0080365c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k4QIBRpn2i3EUtdGsf9gxx6bfd5pPylr
X-Proofpoint-GUID: BNDjUoUGJ5sI5DpTjSNpyZGAgR7Vc-Kd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=737
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150058
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/9/24 22:24, Shrikanth Hegde wrote:
> 
> 
> On 11/9/24 00:36, Ankur Arora wrote:
>>
>> Shrikanth Hegde <sshegde@linux.ibm.com> writes:
>>
>>> Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
>>> 16 bit range of NEED_RESCHED, so compiler can issue single andi.
>>>
>>> Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
>>> to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for
>>> return to kernel.
>>>
>>> Ran a few benchmarks and db workload on Power10. Performance is close to
>>> preempt=none/voluntary. It is possible that some patterns would
>>> differ in lazy[2]. More details of preempt lazy is here [1]
>>>
>>> Since Powerpc system can have large core count and large memory,
>>> preempt lazy is going to be helpful in avoiding soft lockup issues.
>>>
>>> [1]: https://lore.kernel.org/ 
>>> lkml/20241007074609.447006177@infradead.org/
>>> [2]: https://lore.kernel.org/all/1a973dda-c79e-4d95-935b- 
>>> e4b93eb077b8@linux.ibm.com/
>>>
>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>
>> Looks good. Reviewed-by: <ankur.a.arora@oracle.com>
> 
> Thank you Ankur for taking a look and rwb tag.
> 
>>
>> However, I just checked and powerpc does not have
>> CONFIG_KVM_XFER_TO_GUEST_WORK. Do you need this additional patch
>> for handling the lazy bit at KVM guest entry?
> 

It doesn't use the generic kvm entry/exit either AFAIK. I need to 
understand more of this kvm maze. There are quite a lot of combinations.

> will take a look. Thanks for the pointers.
> 
>>
>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index f14329989e9a..7bdf7015bb65 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -84,7 +84,8 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>>          hard_irq_disable();
>>
>>          while (true) {
>> -               if (need_resched()) {
>> +               unsigned long tf = read_thread_flags();
>> +               if (tf & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
>>                          local_irq_enable();
>>                          cond_resched();
>>                          hard_irq_disable();
>>

This is not going help since, with LAZY, cond_resched is nop. So it 
doesn't call to schedule. Same is true with preempt=full. I need to 
figure out if kvm stuff was tested for preempt=full.

Instead of cond_resched this needs to use schedule instead. Need to test 
it out and also see other places for kvm.
So, i need to spend more time on this and figure out, will send the 
patches after that.

>>
>> Ankur
> 


