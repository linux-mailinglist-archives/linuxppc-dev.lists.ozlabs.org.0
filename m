Return-Path: <linuxppc-dev+bounces-1162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6055970CF9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 07:32:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2Fp02P3sz2yK7;
	Mon,  9 Sep 2024 15:32:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725859928;
	cv=none; b=Yjy7cbIhoW4RhVqK+c27nIUBVtGuHWJox9uMbcsEMyfTVv+WydsoHIgGByBsvV1ReEweesyKn4TR/Tb+cFV/C61ZSbeUrnZy3lj9sQdih4EaNfWn3LYjrS306bbkEZtvr7GU8vAlXxwQmM9nBdYrlDbV8HLRJBLMrFpmwnokhzajk1bU9QHGtoQCx+psYjflR2oUbKZXectMOnlQOxqCPH6LRa6REnJQztN4NYHMkO957hUL1Z4TLBimn96/gNX3ucMZ9CrqcadKpJtbgDzkvwB/PRpzTnhV/NtcXOMve7F2fCSBs2mRYhdBIG7oOyyM2v4to9a3SrCO390UXVGH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725859928; c=relaxed/relaxed;
	bh=593iICQUh09PKvU66TxOV6LoN3J+HfH+KvkpLvaNaRc=;
	h=DKIM-Signature:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:MIME-Version; b=hdZ5QVOv6NTvYosDAhQENQRlafR4jMO2Wyn3Eyq7ZEbf3ag81FIWHBoHFgEYuFG0hBg5weBci6f/5UBm4n1bnoGpcnNqAEh/uufF8h8iq3F1cNjOh25KUu4HabLWZyV9OqmRVs/KyIxp7qJqc5dNVVKnr4xtH/y5O/PieJu8mf+Gjmc/LJeC3zNkd9oB+fp2HJjVGxn/hME122v8gmhxrEHKZRdbUHyQecwlEq0thv9+BFxJrTkVV22PFB+6XwFILsftF5SD3N8gfAk8W4v4VIaJ2pPX/g4EP+d3D3/z9Jyy6Bq3dHD0866xNIbwThYqNau/0E2tZ8C02+PgNvryBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o39pOcU3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o39pOcU3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2Fnz6yWjz2xrM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 15:32:07 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4892U7Yu027443;
	Mon, 9 Sep 2024 05:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	593iICQUh09PKvU66TxOV6LoN3J+HfH+KvkpLvaNaRc=; b=o39pOcU3W4vHn4fS
	5WyWSt3yY2+jTrtWMtYRu0qZlYDtv2QzRZYr43dgwquYJHUld4KuBuq4YxpZWiet
	Tz6SRUgYimAdNEj3IjuH7iDUW/b1i/y9JxF3YbCx65GyXo5TLkOSdJqk5/zmGWPw
	JdtCcWl5/Qx7MYQKPis5ojOXPw3ON6w1D9b1XvuTIynAW/mPXHNtgJX7Y5U071Yo
	5uxm0nWD5iVdWA04URbd2FwkDQPzUJDpsAmJuWb5kIkAOX+ZWcokSa1v/W0xDLCz
	QY2qPyJPhJRiDjsO1HyhIS0h2PohkVeJpzS5B217iU5nUZMxdLRVSKmlVudEJXeP
	4WW4dg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41geja7x68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 05:31:50 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4895Vo5s003988;
	Mon, 9 Sep 2024 05:31:50 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41geja7x66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 05:31:50 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4892QDd9019853;
	Mon, 9 Sep 2024 05:31:49 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41h25pmx4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 05:31:48 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4895VlA854919534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Sep 2024 05:31:47 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDB8F20043;
	Mon,  9 Sep 2024 05:31:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2C5720040;
	Mon,  9 Sep 2024 05:31:41 +0000 (GMT)
Received: from [9.43.108.91] (unknown [9.43.108.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Sep 2024 05:31:41 +0000 (GMT)
Message-ID: <451396da-5c2d-4862-ad31-28d79b00223c@linux.ibm.com>
Date: Mon, 9 Sep 2024 11:01:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec/crash: no crash update when kexec in progress
To: Baoquan He <bhe@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Hari Bathini <hbathini@linux.ibm.com>, kexec@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
References: <10c666ae-d528-4f49-82e9-8e0fee7099e0@linux.ibm.com>
 <355b58b1-6c51-4c42-b6ea-dcd6b1617a18@linux.ibm.com>
 <ZsLjGJvAUIaxrG6x@MiWiFi-R3L-srv>
 <1e4a8e18-cda9-45f5-a842-8ffcd725efc9@linux.ibm.com>
 <ZtGqTSMvx6Ljf5Xi@MiWiFi-R3L-srv>
 <0dd94920-b13f-4da7-9ea6-4f008af1f4b3@linux.ibm.com>
 <ZtkkIoUIu8shp/ut@MiWiFi-R3L-srv>
 <c6f30e31-69fe-4ece-b251-c49f1ab59a04@linux.ibm.com>
 <Zt18yUCWRK8178uv@MiWiFi-R3L-srv>
 <9eba8dc4-ceb3-4234-b352-aeb34c840e70@linux.ibm.com>
 <Zt6GNqIUbEl8M4QD@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <Zt6GNqIUbEl8M4QD@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5RL_r7Lk5uhRWwXjCsRcmZLRGiG-CC47
X-Proofpoint-GUID: KNbvE_AA7MWi-HOBayyerih_8L6MlbrQ
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-08_10,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=953 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409090039

Hello Baoquan,

On 09/09/24 10:53, Baoquan He wrote:
> On 09/09/24 at 10:35am, Sourabh Jain wrote:
>>
>> On 08/09/24 16:00, Baoquan He wrote:
>>> On 09/05/24 at 02:07pm, Sourabh Jain wrote:
>>>> Hello Baoquan,
>>>>
>>>> On 05/09/24 08:53, Baoquan He wrote:
>>>>> On 09/04/24 at 02:55pm, Sourabh Jain wrote:
>>>>>> Hello Baoquan,
>>>>>>
>>>>>> On 30/08/24 16:47, Baoquan He wrote:
>>>>>>> On 08/20/24 at 12:10pm, Sourabh Jain wrote:
>>>>>>>> Hello Baoquan,
>>>>>>>>
>>>>> ......snip...
>>>>>>>> 2. A patch to return early from the `crash_handle_hotplug_event()` function
>>>>>>>> if `kexec_in_progress` is
>>>>>>>>        set to True. This is essentially my original patch.
>>>>>>> There's a race gap between the kexec_in_progress checking and the
>>>>>>> setting it to true which Michael has mentioned.
>>>>>> The window where kernel is holding kexec_lock to do kexec boot
>>>>>> but kexec_in_progress is yet not set to True.
>>>>>>
>>>>>> If kernel needs to handle crash hotplug event, the function
>>>>>> crash_handle_hotplug_event()  will not get the kexec_lock and
>>>>>> error out by printing error message about not able to update
>>>>>> kdump image.
>>>>> But you wanted to avoid the erroring out if it's being in
>>>>> kernel_kexec().  Now you are seeing at least one the noising
>>>>> message, aren't you?
>>>> Yes, but it is very rare to encounter.
>>>>
>>>> My comments on your updated code are inline below.
>>>>
>>>>>> I think it should be fine. Given that lock is already taken for
>>>>>> kexec kernel boot.
>>>>>>
>>>>>> Am I missing something major?
>>>>>>
>>>>>>> That's why I think
>>>>>>> maybe checking kexec_in_progress after failing to retriving
>>>>>>> __kexec_lock is a little better, not very sure.
>>>>>> Try for kexec lock before kexec_in_progress check will not solve
>>>>>> the original problem this patch trying to solve.
>>>>>>
>>>>>> You proposed the below changes earlier:
>>>>>>
>>>>>> -	if (!kexec_trylock()) {
>>>>>> +	if (!kexec_trylock() && kexec_in_progress) {
>>>>>>     		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>>>>>>     		crash_hotplug_unlock();
>>>>> Ah, I meant as below, but wrote it mistakenly.
>>>>>
>>>>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>>>>> index 63cf89393c6e..e7c7aa761f46 100644
>>>>> --- a/kernel/crash_core.c
>>>>> +++ b/kernel/crash_core.c
>>>>> @@ -504,7 +504,7 @@ int crash_check_hotplug_support(void)
>>>>>     	crash_hotplug_lock();
>>>>>     	/* Obtain lock while reading crash information */
>>>>> -	if (!kexec_trylock()) {
>>>>> +	if (!kexec_trylock() && !kexec_in_progress) {
>>>>>     		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>>>>>     		crash_hotplug_unlock();
>>>>>     		return 0;
>>>>>
>>>>>
>>>>>> Once the kexec_in_progress is set to True there is no way one can get
>>>>>> kexec_lock. So kexec_trylock() before kexec_in_progress is not helpful
>>>>>> for the problem I am trying to solve.
>>>>> With your patch, you could still get the error message if the race gap
>>>>> exist. With above change, you won't get it. Please correct me if I am
>>>>> wrong.
>>>> The above code will print an error message during the race gap. Here's why:
>>>>
>>>> Let’s say the kexec lock is acquired in the kernel_kexec() function,
>>>> but kexec_in_progress is not yet set to True. In this scenario, the code
>>>> will print
>>>> an error message.
>>>>
>>>> There is another issue I see with the above code:
>>>>
>>>> Consider that the system is on the kexec kernel boot path, and
>>>> kexec_in_progress
>>>> is set to True. If crash_hotplug_unlock() is called, the kernel will not
>>>> only update
>>>> the kdump image without acquiring the kexec lock, but it will also release
>>>> the
>>>> kexec lock in the out label. I believe this is incorrect.
>>>>
>>>> Please share your thoughts.
>>> How about this?
>>>
>>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>>> index 63cf89393c6e..8ba7b1da0ded 100644
>>> --- a/kernel/crash_core.c
>>> +++ b/kernel/crash_core.c
>>> @@ -505,7 +505,8 @@ int crash_check_hotplug_support(void)
>>>    	crash_hotplug_lock();
>>>    	/* Obtain lock while reading crash information */
>>>    	if (!kexec_trylock()) {
>>> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>>> +		if (!kexec_in_progress)
>>> +			pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>>>    		crash_hotplug_unlock();
>>>    		return 0;
>>>    	}
>>> @@ -540,7 +541,8 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>>>    	crash_hotplug_lock();
>>>    	/* Obtain lock while changing crash information */
>>>    	if (!kexec_trylock()) {
>>> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>>> +		if (!kexec_in_progress)
>>> +			pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>>>    		crash_hotplug_unlock();
>>>    		return;
>>>    	}
>> Yes putting pr_info under kexec in progress check would work.
>>
>> I will rebase the patch on top on next-20240906 to avoid conflict with
>> https://lore.kernel.org/all/20240812041651.703156-1-sourabhjain@linux.ibm.com/T/#u
>> and send v2.
> Great. When you repost, can you please also add why ppc will hot add cpu
> into patch log when crash triggered? Otherwise other people may be
> confused when reading code here or trace back the code change.

Sure, I will add it.

- Sourabh Jain

