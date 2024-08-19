Return-Path: <linuxppc-dev+bounces-162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B420956259
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 06:11:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnK0q48fSz2xdg;
	Mon, 19 Aug 2024 14:11:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aPbz4mzN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnK0p4Mj2z2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 14:11:37 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47ICm39h018330;
	Mon, 19 Aug 2024 04:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	zZpHUbtmdCQ21jw42lnEbiH0aZQvYbYMhmI9183h0vM=; b=aPbz4mzNbR284GX+
	9YrjJmtRmJtwjGU6D7kvreedd4Lvzhh/KC0mvm8sH/0j2tzMgLSvRqB18UbinYXs
	J6pmkgl/a94Hs9yQrkPMoPtx3P8qT/ndODl8YUGj7zbsVjqAFXm2F78Kt46DMctx
	y3ckGshiLiEP1IYblm7AXupolWPvCnQ35TjJeOBELoa1w3JsqT2ZOVwnSxOo96lh
	7eW0Se7YDotsNDW5ebL5JS4GEXPcQUS89hw4QgfxA18nJ3pKarAIGfbNFLBRxhDH
	rWYV9w8JXv7fmC3+nQm1/8Zzv6q+z2dqWabd7h+0OYfIP6Gq2+R+XJ218shmP/aL
	FivYDg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mb5ev5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 04:11:23 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47J4BMO8022970;
	Mon, 19 Aug 2024 04:11:22 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mb5ev5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 04:11:22 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47J43sm9014255;
	Mon, 19 Aug 2024 04:11:21 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4137pmmdn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 04:11:21 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47J4BHCQ52625872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 04:11:19 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 476ED2004B;
	Mon, 19 Aug 2024 04:11:17 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAC0720040;
	Mon, 19 Aug 2024 04:11:15 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Aug 2024 04:11:15 +0000 (GMT)
Message-ID: <c40d12df-fdb6-4597-8936-69c4af602609@linux.ibm.com>
Date: Mon, 19 Aug 2024 09:41:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Document/kexec: Generalize crash hotplug description
To: Baoquan He <bhe@redhat.com>
Cc: Petr Tesarik <petr@tesarici.cz>, Hari Bathini <hbathini@linux.ibm.com>,
        kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org
References: <20240812041651.703156-1-sourabhjain@linux.ibm.com>
 <Zrrpcn7cnCigNfWd@MiWiFi-R3L-srv>
 <4cbbf314-5134-4a1a-8a4d-f6f8c09104d3@linux.ibm.com>
 <ZrskkDuMlQu+uBN4@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZrskkDuMlQu+uBN4@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YLGmYYRi3md8Qfpu6OTFM9-jvqRWn3OJ
X-Proofpoint-GUID: SH_clnL326R_tgyr8QE1gL5szyrk7FWR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_01,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=893 phishscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408190029

Hello Baoquan,

On 13/08/24 14:47, Baoquan He wrote:
> On 08/13/24 at 10:58am, Sourabh Jain wrote:
>> Hello Baoquan,
>>
>> On 13/08/24 10:34, Baoquan He wrote:
>>> On 08/12/24 at 09:46am, Sourabh Jain wrote:
>>> ......
>>>> ---
>>>>
>>>> Changelog:
>>>>
>>>> Since v1: https://lore.kernel.org/all/20240805050829.297171-1-sourabhjain@linux.ibm.com/
>>>>     - Update crash_hotplug sysfs document as suggested by Petr T
>>>>     - Update an error message in crash_handle_hotplug_event and
>>>>       crash_check_hotplug_support function.
>>>>
>>>> ---
>>> ......
>>>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>>>> index 63cf89393c6e..c1048893f4b6 100644
>>>> --- a/kernel/crash_core.c
>>>> +++ b/kernel/crash_core.c
>>>> @@ -505,7 +505,7 @@ int crash_check_hotplug_support(void)
>>>>    	crash_hotplug_lock();
>>>>    	/* Obtain lock while reading crash information */
>>>>    	if (!kexec_trylock()) {
>>>> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>>>> +		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
>>> Wondering why this need be updated.
>> In some architectures, additional kexec segments become obsolete during a
>> hotplug event,
>> so simply calling out the `elfcorehdr may be inaccurate` may not be
>> sufficient.
>> Therefore, it has been generalized with the kdump image.
> OK, I forgot the case in ppc, makes sense to me, thx.
>
> Acked-by: Baoquan He <bhe@redhat.com>

Do we know who will be applying this patch and how it will be merged 
into Linus’s tree?

Thanks,
Sourabh Jain

