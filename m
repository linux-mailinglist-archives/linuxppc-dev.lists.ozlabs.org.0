Return-Path: <linuxppc-dev+bounces-3451-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5DC9D3F1F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 16:33:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xtlkw30wpz2yQJ;
	Thu, 21 Nov 2024 02:33:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732116824;
	cv=none; b=YYdCoJk03LmqThvEIGx9hHlJjoJcZgWysLG6mS3mYj0ckax6ISD60SKu0A5NM3oSHS8OMBTpR1KSFXfL/Yy3BLfhEPoqBIkJlUae+tAto7QU8876s76ukTGcUIGRj6uVgoJoAl6AOgeitH75uCztNtBLajp5S9dUF4yETY31LNDkqN+o/WehlT5fjZYch/vzhyAuLiK0o1pR3pwMaOjMQn9B8t1gnBDUt1FZgqJo8QQ6/stnHkWQrD4KeArHtclqmlZHjVuh5Ea4Q9qlNi+/wzQ954e53zVcByfFiAt3x2sXx9iIBIt6xGcGrpaV0Df+VOtzX5bIq+ZlVKgOROGOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732116824; c=relaxed/relaxed;
	bh=Bh8MRmv0pX9jmFl/6GWRY8seqCjGSEKE6C1pTn7rS0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wtg3aNNiBxt2aCrP8xeKxq86tB+7hRYesFbB9mIuqGOpQcbB6mKsRaWjFbdV5dU4n/usR53F3KTKQYa8Pk+K8JB2uziY1B8Q57vtDQpLBI/2cguo1AzDwqHbC1dJC+l6QGiGqWIue8Vt9M9NDP+LqgtakiuW2x/JT5VU2OXqyakVFg3eFa8L3lBiD46ryBdy9OnGn6sNemSQmwQuQCWc5+E8s6dLfCNembfffy9P9LSyoMOaFoGWPRaxEQzQTX4teeht/Vk8h25/CEZf2EyyqUexbbvZyCE9FLawuBDWir/s9K3X35ncmua5eMfBZUdITSoaBEpmWJEpJhP7BD5B2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dCmL0YzI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dCmL0YzI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xtlkv2gd2z2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 02:33:42 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKEx2lm026174;
	Wed, 20 Nov 2024 15:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Bh8MRm
	v0pX9jmFl/6GWRY8seqCjGSEKE6C1pTn7rS0Y=; b=dCmL0YzIJtaw3kYOvtWw1B
	TUoOLdeOA/NRuCw+hJPlqnv8/OfEQs/mmphSfcM+s5kDs5R34nDii4JapXBIDVjl
	18CU693Mc2vJF6ifaAPRVujHnIYuNss0HfCX9op79Hm4OSffCiDDjifXeKo2NDdD
	q81aCdCuaEbp5NS0Lo/AQ7Dy+A1Vwi28W3wzyGhfjGJwVmhOxetM4Fkwzr9BAVKs
	NnbQfInejp/3cd+hREdcJ9kHxr4FhWvaZlPq0mW2o9sXAfpD0AM8fUIdGH7j1uaC
	ynVB5oGBfL0HPunsxKm26QPAMX6hrra82F8stXVqIsoZ93TBworO8nXZO4elv1fg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xyu1vkku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 15:33:18 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AKFRdR3016149;
	Wed, 20 Nov 2024 15:33:17 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xyu1vkkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 15:33:17 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9tOVD011836;
	Wed, 20 Nov 2024 15:33:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42y7xjps2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 15:33:16 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AKFXEa956689076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Nov 2024 15:33:14 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEECE2004D;
	Wed, 20 Nov 2024 15:33:14 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B66B20043;
	Wed, 20 Nov 2024 15:33:12 +0000 (GMT)
Received: from [9.39.17.146] (unknown [9.39.17.146])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 20 Nov 2024 15:33:12 +0000 (GMT)
Message-ID: <b98b7795-070a-4d9c-9599-445c2ff55fd7@linux.ibm.com>
Date: Wed, 20 Nov 2024 21:03:11 +0530
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
Subject: Re: [PATCH v2 2/2] powerpc: Large user copy aware of full:rt:lazy
 preemption
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Ankur Arora <ankur.a.arora@oracle.com>
Cc: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
        linux-kernel@vger.kernel.org, vschneid@redhat.com,
        mark.rutland@arm.com
References: <20241116192306.88217-1-sshegde@linux.ibm.com>
 <20241116192306.88217-3-sshegde@linux.ibm.com> <874j43hqy8.fsf@oracle.com>
 <20241120080312.uHw4eJcQ@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241120080312.uHw4eJcQ@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lxn4TwimSjF5ZDmHrDVncIqTmAArPk-q
X-Proofpoint-ORIG-GUID: PGvuBsbHrGTCCltdKFKc1bebG_OZGQjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 clxscore=1011 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200104
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/20/24 13:33, Sebastian Andrzej Siewior wrote:
> On 2024-11-19 13:08:31 [-0800], Ankur Arora wrote:
>>
>> Shrikanth Hegde <sshegde@linux.ibm.com> writes:
>>

Thanks Ankur and Sebastian for taking a look.

>>> Large user copy_to/from (more than 16 bytes) uses vmx instructions to
>>> speed things up. Once the copy is done, it makes sense to try schedule
>>> as soon as possible for preemptible kernels. So do this for
>>> preempt=full/lazy and rt kernel.
>>
>> Note that this check will also fire for PREEMPT_DYNAMIC && preempt=none.
>> So when power supports PREEMPT_DYNAMIC this will need to change
>> to preempt_model_*() based checks.

Yes. This and return to kernel both needs to change when PowerPC support PREEMPT_DYNAMIC.
I have a patch in work in which I essentially do check for the preemption model.
Either below or based on static key.

-	if (IS_ENABLED(CONFIG_PREEMPTION) && need_resched())
+	if (preempt_model_preemptible() && need_resched())



+mark +valentin

More looking into how PREEMPPT_DYNAMIC works with static key, I have one query.
This is more on PREEMPT_DYNAMIC than anything to with LAZY.

I see many places use static_key based check instead of using preempt_model_preemptible such as
dynamic_preempt_schedule, is it because static_key is faster?

On the other hand, using preempt_model_preemptible could make the code simpler.

>>
>>> Not checking for lazy bit here, since it could lead to unnecessary
>>> context switches.
>>
>> Maybe:
>> Not checking for lazy bit here, since we only want to schedule when
>> a context switch is imminently required.
> 
> Isn't his behaviour here exactly what preempt_enable() would do?
> If the LAZY bit is set, it is delayed until return to userland or an
> explicit schedule() because it is done. If this LAZY bit turned into an
> actual scheduling request then it is acted upon.
> 
> Sebastian


