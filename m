Return-Path: <linuxppc-dev+bounces-3242-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F209CD9A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 08:04:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqSgg3hh3z2yRC;
	Fri, 15 Nov 2024 18:04:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731654271;
	cv=none; b=GcU/pScV3rEicNtjvbmOwu0ej9xsmwoIzuAmghqfNx5ZPTghmjIvrs707qeKJnsmeOMyooYy94sFM9Pnzka4QVOTgFIff7eeziAl44FEiGhbPkEygAFT+ju7AK/mUzMjqsoMQa652Q1Fbhn9C/dLaoZfHPn9i/FcNfTrzcinW4+j6lOsaMuK7CWWlmBAHcBZ2aha4Qwr5n4q3u4Om+jUR+2OixIOOqkIufLxcwyZqABq+9COno8QJ1L3r0I5cS7kATATbWvWgJ3EFCrtXcbpByL3W02HA4ejFnYbiZINvdPhyRivneUEdCS8SLqzT7uRFz10MzVjGDoMzc/N6euL+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731654271; c=relaxed/relaxed;
	bh=drbz5hzEedBRiyUVAARfr6kaVzjw083/n4XbTfKaq6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aARRZ1k099opC75Zz3EMtRW2xO4Arl+Q54VPKdDwsaOGew1rI6i2a6YXFpkwKvqMdeFKtrUiQ3cHKB3kJalixX3k0qNnyH/BhsXGqgItTzLzIgjdG0AJOF8RPMYbYYhHIRS8sozYNBqOQctOiiJrP3TanEWOC+s5D9pMrskLaEwgq/uXiWrlg5FoYeextMBj1WLE9EmJziwDpyfA86YvkwUFkDxIpr+ZzNWDr+V4D9OdvUNjvT+mHB3SdmnfY6gMkhSVhLkBk6+k4bX+zdPoymfwJHTd12oejGVzDsZwilYVydD/j+3x+jtcVymKJUM5MR+7ngP+iyG5yMzkw4Ofgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i5mliMtg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i5mliMtg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqSgf18lsz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 18:04:29 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF0koqM016465;
	Fri, 15 Nov 2024 07:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=drbz5h
	zEedBRiyUVAARfr6kaVzjw083/n4XbTfKaq6E=; b=i5mliMtgm8boXNdZ0aEX9f
	HYqhm7M826+BOvw3DdEHZLTezSHtkr9X4aobjy/WcFeuK6DpWssI80qeAaI9pdNM
	IeClGeIg3GgWdgWYo1mbVbs4jv7Q+MpuwOMJPpYMF8H/d0MTJ3iCckiFU1B0kIYx
	/VhKHuiexn2EzZ2tFuHxMy7TgIH5X05wWzLxwkhcHoSEwhjwH6K5C+QjOdSgOlIS
	kjQhukuvDAQVOKLEdE2/LDlbOTlPIBU46LwLeqgSmF/WA6QX3jfoQAhtSKcGKAMK
	JaGLavGbJiv2gAEe1GXfm25lVTIGyAFyCKCd+nVY2YQbXTd+th4FMdPvCU3ZP5iw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42wuvc1cpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 07:04:09 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AF748FJ010060;
	Fri, 15 Nov 2024 07:04:08 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42wuvc1cpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 07:04:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF5xaOr010507;
	Fri, 15 Nov 2024 07:04:07 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42tj2s9xws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 07:04:07 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AF746hA50332130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Nov 2024 07:04:06 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DFCC2004F;
	Fri, 15 Nov 2024 07:04:06 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65C5A2004B;
	Fri, 15 Nov 2024 07:04:04 +0000 (GMT)
Received: from [9.39.26.152] (unknown [9.39.26.152])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Nov 2024 07:04:04 +0000 (GMT)
Message-ID: <6cb2d1dd-39d3-45d5-ab08-cd71c501b1ee@linux.ibm.com>
Date: Fri, 15 Nov 2024 12:34:02 +0530
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
To: Michael Ellerman <mpe@ellerman.id.au>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, maddy@linux.ibm.com,
        christophe.leroy@csgroup.eu, peterz@infradead.org,
        ankur.a.arora@oracle.com
References: <20241108101853.277808-1-sshegde@linux.ibm.com>
 <20241108105031.Uq8MV60I@linutronix.de>
 <054a79d6-85a4-4c02-a361-d8e4b34ca674@linux.ibm.com>
 <877c96vaiu.fsf@mpe.ellerman.id.au>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <877c96vaiu.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EO-mn1JFQWQbPqXfBd4hpLEFFWoZqPdF
X-Proofpoint-ORIG-GUID: VMAO-jPpBr8MrhkVeX1xd0_ZxwwLhbS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=721 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150058
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/14/24 07:31, Michael Ellerman wrote:
> Shrikanth Hegde <sshegde@linux.ibm.com> writes:
>> Thank you Sebastian for taking a look and rwb tag.
>>
>>> On 2024-11-08 15:48:53 [+0530], Shrikanth Hegde wrote:
>>>> Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
>>>> 16 bit range of NEED_RESCHED, so compiler can issue single andi.
>>>>
>>>> Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
>>>> to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for
>>>> return to kernel.
>>>>
>>>> Ran a few benchmarks and db workload on Power10. Performance is close to
>>>> preempt=none/voluntary. It is possible that some patterns would
>>>> differ in lazy[2]. More details of preempt lazy is here [1]
>>>>
>>>> Since Powerpc system can have large core count and large memory,
>>>> preempt lazy is going to be helpful in avoiding soft lockup issues.
>>>>
>>>> [1]: https://lore.kernel.org/lkml/20241007074609.447006177@infradead.org/
>>>> [2]: https://lore.kernel.org/all/1a973dda-c79e-4d95-935b-e4b93eb077b8@linux.ibm.com/
>>>
>>> The lazy bits are only in tip.
>>

I have added change suggested by sebastian. I think it makes sense since 
the large user copy using vmx could take sometime and in preemptible 
kernel it needs to resched as soon as possible. However i am not making 
it consider lazy since it would lead to quite a bit of context switches 
which is not necessary.

-       if (IS_ENABLED(CONFIG_PREEMPT) && need_resched())
+       if (IS_ENABLED(CONFIG_PREEMPTION) && need_resched())
                 set_dec(1);
         return 0;


>> Hi Michael, I sent it to powerpc tree since all the changes were in
>> arch/powerpc. Please let me know if i have send it to tip tree instead.
> 
> I think I'd like it to have a full cycle of testing in next before going
> into mainline. So I'll plan to take this via the powerpc tree for the
> next cycle.
> 

Make sense.

> I assume you haven't tested 32-bit at all?
>

Yes, 32 bit isn't tested.  it would be better if it goes through  a test 
cycle. I will send out v2 soon.

> cheers


