Return-Path: <linuxppc-dev+bounces-1158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD45B970CD9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 07:11:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2FCb67NGz2yD5;
	Mon,  9 Sep 2024 15:05:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725858347;
	cv=none; b=RgXhF2SZzNOYHIZhes4YK0gOiIY77CVrwdIgkI36yvSFbCf9GhTAC4rd22v5RcfDAD2MUuYBuqyYxZ0rN6K3hzBetcoSTc8vq2083LmeqeLjBqSWHNQgR9nFjEogPI1fledNEx9Q0gx6/8lVs4QXAJ5QUeBDOYmL7uSc5Pw9Hi/ad3+Qqa786QRBE1zXzI/bu/6TDnA2213tKDeH9FcuJRc8DyuwaYQB/xL5n34hUoaWTwXw7uJ3/TH6746ybLjkWDaQmyMJvwgdbZp2qXrq+Fx5Tqvo1WpqfN2tT4XledFMTsPIBiPCWblFporbqwfNe+18xwp57emLatCKu/M5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725858347; c=relaxed/relaxed;
	bh=GPrmwWnko671No7/Z6IdQjS7SU1lDVNUmv4xVmaX2TY=;
	h=DKIM-Signature:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:MIME-Version; b=CFr7wyc5uERbPMkeUjAuOyBW1E0H7JVCMlAFrJB5L2DpWvflMY2NGdS7op723VDAdU3T4MGKUGCao6H+q66gdtW99WU4iaagbzA14nN55B1E1KnJTkdcDI4GvkTzFnJNv85pcsx9U93JX02OuOtWDHaf/SJMiJZRYhdhWasGzZtjXyRpPPzpxwAfaUdo4ajp5h58OiBV1QE5FinPoXGLPBDeZNCMwkVxD0HYbnK084iK/Fd2HmYFM+6e20Pa7lb3ssAVHUfS2+GYhoNbjn4put+UwK98GT0P/XD7PnufFsROBXwfWfRVseZH4Dxf1XgOmQ2hbgFtz8cCrAjJem6TVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BhBH7jtc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BhBH7jtc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2FCZ5l7fz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 15:05:46 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488NFGne006405;
	Mon, 9 Sep 2024 05:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	GPrmwWnko671No7/Z6IdQjS7SU1lDVNUmv4xVmaX2TY=; b=BhBH7jtcqvwgasbt
	iohUnWhPwCiUt9yxj7OMdiMGueLVYw4eZoSvNw5C8YsqGNR3f+ZU7cIyUfHJTnko
	e9Zc1khk95vqNVRyyOP0ZyK6W3fG7AUg17XMOETz1Njnr0WFDWY4OkKlOJr02c0j
	IlV03iAvNmYmG4qIMiISJ+FbLH55FmeeeYCkHto2PY7Ebj+rhWzDoM9vZo22ykRq
	JsoAQfsgBBFqP/uSiwlaUN1RD3BOgolkE+g4mRner7Hy0zZqtqWQWE7k+tGkaAd3
	Yn8tp4rhG7bk8CTCWFsp99VrA0Kimg0Wa9tMxnhC7rPicY/12eDTBgqojS3yKPWN
	EBZqoQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gefy7rxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 05:05:21 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48955LAq004183;
	Mon, 9 Sep 2024 05:05:21 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gefy7rxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 05:05:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4894D5q8027308;
	Mon, 9 Sep 2024 05:05:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41h3v2vgkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 05:05:20 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48955IZ552101476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Sep 2024 05:05:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD9AA2004B;
	Mon,  9 Sep 2024 05:05:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5571020040;
	Mon,  9 Sep 2024 05:05:14 +0000 (GMT)
Received: from [9.43.108.91] (unknown [9.43.108.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Sep 2024 05:05:13 +0000 (GMT)
Message-ID: <9eba8dc4-ceb3-4234-b352-aeb34c840e70@linux.ibm.com>
Date: Mon, 9 Sep 2024 10:35:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec/crash: no crash update when kexec in progress
To: Baoquan He <bhe@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Hari Bathini <hbathini@linux.ibm.com>, kexec@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
References: <20240731152738.194893-1-sourabhjain@linux.ibm.com>
 <87v80lnf8d.fsf@mail.lhotse>
 <10c666ae-d528-4f49-82e9-8e0fee7099e0@linux.ibm.com>
 <355b58b1-6c51-4c42-b6ea-dcd6b1617a18@linux.ibm.com>
 <ZsLjGJvAUIaxrG6x@MiWiFi-R3L-srv>
 <1e4a8e18-cda9-45f5-a842-8ffcd725efc9@linux.ibm.com>
 <ZtGqTSMvx6Ljf5Xi@MiWiFi-R3L-srv>
 <0dd94920-b13f-4da7-9ea6-4f008af1f4b3@linux.ibm.com>
 <ZtkkIoUIu8shp/ut@MiWiFi-R3L-srv>
 <c6f30e31-69fe-4ece-b251-c49f1ab59a04@linux.ibm.com>
 <Zt18yUCWRK8178uv@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <Zt18yUCWRK8178uv@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L_T2SMdDgcohbwN827nc0vwdNPIo8LnP
X-Proofpoint-ORIG-GUID: XhV8Ue3GrBekmk7WD7oyGoA-qFgUxvRJ
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
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090039



On 08/09/24 16:00, Baoquan He wrote:
> On 09/05/24 at 02:07pm, Sourabh Jain wrote:
>> Hello Baoquan,
>>
>> On 05/09/24 08:53, Baoquan He wrote:
>>> On 09/04/24 at 02:55pm, Sourabh Jain wrote:
>>>> Hello Baoquan,
>>>>
>>>> On 30/08/24 16:47, Baoquan He wrote:
>>>>> On 08/20/24 at 12:10pm, Sourabh Jain wrote:
>>>>>> Hello Baoquan,
>>>>>>
>>> ......snip...
>>>>>> 2. A patch to return early from the `crash_handle_hotplug_event()` function
>>>>>> if `kexec_in_progress` is
>>>>>>       set to True. This is essentially my original patch.
>>>>> There's a race gap between the kexec_in_progress checking and the
>>>>> setting it to true which Michael has mentioned.
>>>> The window where kernel is holding kexec_lock to do kexec boot
>>>> but kexec_in_progress is yet not set to True.
>>>>
>>>> If kernel needs to handle crash hotplug event, the function
>>>> crash_handle_hotplug_event()  will not get the kexec_lock and
>>>> error out by printing error message about not able to update
>>>> kdump image.
>>> But you wanted to avoid the erroring out if it's being in
>>> kernel_kexec().  Now you are seeing at least one the noising
>>> message, aren't you?
>> Yes, but it is very rare to encounter.
>>
>> My comments on your updated code are inline below.
>>
>>>> I think it should be fine. Given that lock is already taken for
>>>> kexec kernel boot.
>>>>
>>>> Am I missing something major?
>>>>
>>>>> That's why I think
>>>>> maybe checking kexec_in_progress after failing to retriving
>>>>> __kexec_lock is a little better, not very sure.
>>>> Try for kexec lock before kexec_in_progress check will not solve
>>>> the original problem this patch trying to solve.
>>>>
>>>> You proposed the below changes earlier:
>>>>
>>>> -	if (!kexec_trylock()) {
>>>> +	if (!kexec_trylock() && kexec_in_progress) {
>>>>    		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>>>>    		crash_hotplug_unlock();
>>> Ah, I meant as below, but wrote it mistakenly.
>>>
>>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>>> index 63cf89393c6e..e7c7aa761f46 100644
>>> --- a/kernel/crash_core.c
>>> +++ b/kernel/crash_core.c
>>> @@ -504,7 +504,7 @@ int crash_check_hotplug_support(void)
>>>    	crash_hotplug_lock();
>>>    	/* Obtain lock while reading crash information */
>>> -	if (!kexec_trylock()) {
>>> +	if (!kexec_trylock() && !kexec_in_progress) {
>>>    		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>>>    		crash_hotplug_unlock();
>>>    		return 0;
>>>
>>>
>>>> Once the kexec_in_progress is set to True there is no way one can get
>>>> kexec_lock. So kexec_trylock() before kexec_in_progress is not helpful
>>>> for the problem I am trying to solve.
>>> With your patch, you could still get the error message if the race gap
>>> exist. With above change, you won't get it. Please correct me if I am
>>> wrong.
>> The above code will print an error message during the race gap. Here's why:
>>
>> Let’s say the kexec lock is acquired in the kernel_kexec() function,
>> but kexec_in_progress is not yet set to True. In this scenario, the code
>> will print
>> an error message.
>>
>> There is another issue I see with the above code:
>>
>> Consider that the system is on the kexec kernel boot path, and
>> kexec_in_progress
>> is set to True. If crash_hotplug_unlock() is called, the kernel will not
>> only update
>> the kdump image without acquiring the kexec lock, but it will also release
>> the
>> kexec lock in the out label. I believe this is incorrect.
>>
>> Please share your thoughts.
> How about this?
>
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 63cf89393c6e..8ba7b1da0ded 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -505,7 +505,8 @@ int crash_check_hotplug_support(void)
>   	crash_hotplug_lock();
>   	/* Obtain lock while reading crash information */
>   	if (!kexec_trylock()) {
> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> +		if (!kexec_in_progress)
> +			pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>   		crash_hotplug_unlock();
>   		return 0;
>   	}
> @@ -540,7 +541,8 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>   	crash_hotplug_lock();
>   	/* Obtain lock while changing crash information */
>   	if (!kexec_trylock()) {
> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> +		if (!kexec_in_progress)
> +			pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>   		crash_hotplug_unlock();
>   		return;
>   	}

Yes putting pr_info under kexec in progress check would work.

I will rebase the patch on top on next-20240906 to avoid conflict with
https://lore.kernel.org/all/20240812041651.703156-1-sourabhjain@linux.ibm.com/T/#u
and send v2.

Thanks,
Sourabh Jain


