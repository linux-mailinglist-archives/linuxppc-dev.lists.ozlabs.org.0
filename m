Return-Path: <linuxppc-dev+bounces-43-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB40094FD37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 07:28:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ITmNG1XJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjg0K4byMz2xmZ;
	Tue, 13 Aug 2024 15:28:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ITmNG1XJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjg0J5SRPz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 15:28:31 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CNlZcL009210;
	Tue, 13 Aug 2024 05:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	/lNn5nU6xFoZkgBpvGqy1oEMvMo3TWepI8F/OAlN3uQ=; b=ITmNG1XJQUhMGpOI
	iCKpSLHyMYfLEarrxX9AUkiRSKaA6xU/3UmDMvLWvu5nBJBPbjwBjhFhHdZSvcYO
	XknWB+ib+sT/iMuFnZA+FqmXNYiWMpFwTnX4doaksAh7M8eLvlyJyOi8QEjrlgzG
	AXqGjZP8gumnKQygyxJesHEVAm8A4q0j3MfXGPCiRHg5I1Hu5lVozASXCNAxnAUt
	dlpvlD3lRo40ClkAs4BYZ0Z4vF76GTKVfrwIKzH6Tr1Z2hCZyjGV6l6DfIWpcFPz
	sHKqgVZB0KQPl4XNE1gpH3cGBsoBypIDTkNneQclTj9S5xhH4v4Af19R0zU+I56I
	Z2C34A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40wy0rpn1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 05:28:21 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47D5SL68008157;
	Tue, 13 Aug 2024 05:28:21 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40wy0rpn1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 05:28:21 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47D3oiH3016309;
	Tue, 13 Aug 2024 05:28:20 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40xkhphyxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 05:28:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47D5SGaO48955810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Aug 2024 05:28:18 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4437820049;
	Tue, 13 Aug 2024 05:28:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D478C2004D;
	Tue, 13 Aug 2024 05:28:13 +0000 (GMT)
Received: from [9.43.76.60] (unknown [9.43.76.60])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Aug 2024 05:28:13 +0000 (GMT)
Message-ID: <4cbbf314-5134-4a1a-8a4d-f6f8c09104d3@linux.ibm.com>
Date: Tue, 13 Aug 2024 10:58:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Document/kexec: Generalize crash hotplug description
To: Baoquan He <bhe@redhat.com>
Cc: Petr Tesarik <petr@tesarici.cz>, Hari Bathini <hbathini@linux.ibm.com>,
        kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org
References: <20240812041651.703156-1-sourabhjain@linux.ibm.com>
 <Zrrpcn7cnCigNfWd@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <Zrrpcn7cnCigNfWd@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _t_Jy8gzm8GRubRgPR8-NNNKZC7NI_iL
X-Proofpoint-GUID: y3oYdxfQXZBJ9XHE2X8Vd_g5qQcQ6-aA
Content-Transfer-Encoding: 7bit
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
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=897 adultscore=0 malwarescore=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130034

Hello Baoquan,

On 13/08/24 10:34, Baoquan He wrote:
> On 08/12/24 at 09:46am, Sourabh Jain wrote:
> ......
>> ---
>>
>> Changelog:
>>
>> Since v1: https://lore.kernel.org/all/20240805050829.297171-1-sourabhjain@linux.ibm.com/
>>    - Update crash_hotplug sysfs document as suggested by Petr T
>>    - Update an error message in crash_handle_hotplug_event and
>>      crash_check_hotplug_support function.
>>
>> ---
> ......
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index 63cf89393c6e..c1048893f4b6 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -505,7 +505,7 @@ int crash_check_hotplug_support(void)
>>   	crash_hotplug_lock();
>>   	/* Obtain lock while reading crash information */
>>   	if (!kexec_trylock()) {
>> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>> +		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
> Wondering why this need be updated.

In some architectures, additional kexec segments become obsolete during 
a hotplug event,
so simply calling out the `elfcorehdr may be inaccurate` may not be 
sufficient.
Therefore, it has been generalized with the kdump image.


Thanks,
Sourabh Jain

