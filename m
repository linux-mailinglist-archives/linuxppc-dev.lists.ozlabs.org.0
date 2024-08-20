Return-Path: <linuxppc-dev+bounces-204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 663D8957E75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 08:41:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp0Gz2Ds7z2xtp;
	Tue, 20 Aug 2024 16:41:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XUBn7GHb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp0Gy4Y8cz2xfP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 16:41:13 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JNRTTp011313;
	Tue, 20 Aug 2024 06:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=E
	YAWZyzQ0FYJZPEoFW49YgYvz17cDNcnXjq4cw3edVk=; b=XUBn7GHbQilsKaSHo
	DVEiY2XypahRzHGDjr8h1Mos4ntN6mgu81HisO8jP7Xsu+EfGmhcqEsrqg+zGa6R
	89rLazQ/FjF5+91vgKkFzOARyYXue0uh4oLVbhNF/jgGyH0nwRAhNMhOXoM3meAH
	3Jgwzi2l9109cq7eK3FE9NbD8Z724y27uxdSlGbSHcEWl6OLCqdtd33prueaLmqW
	IiOh9xSl3/OoMQbBDeZtkamGU4euhJ1bw6NRdUnZHtySaRZVZF50rDzU4jtX3wzG
	jRiDTLCOvCzxH4NDW1mVPifxGKd+RPnFD4vlpq0DqQjdZjpm4WoQ3gNSpj9LT75o
	gx7qA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412ma04cka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 06:40:46 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47K6ejLl016167;
	Tue, 20 Aug 2024 06:40:45 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412ma04ck7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 06:40:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47K1xGKY018973;
	Tue, 20 Aug 2024 06:40:44 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41376psn0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 06:40:44 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47K6ee2K56099110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Aug 2024 06:40:42 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 427AD20043;
	Tue, 20 Aug 2024 06:40:37 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E1F420040;
	Tue, 20 Aug 2024 06:40:34 +0000 (GMT)
Received: from [9.43.1.80] (unknown [9.43.1.80])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Aug 2024 06:40:34 +0000 (GMT)
Message-ID: <1e4a8e18-cda9-45f5-a842-8ffcd725efc9@linux.ibm.com>
Date: Tue, 20 Aug 2024 12:10:27 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
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
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZsLjGJvAUIaxrG6x@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MeARZ9ZfxA25mP6cIm7xMSv65SI-14Jd
X-Proofpoint-ORIG-GUID: 1fNEByVcExy7KUsVWapOtrVhkkRpMBj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408200048

Hello Baoquan,

On 19/08/24 11:45, Baoquan He wrote:
> On 08/19/24 at 09:45am, Sourabh Jain wrote:
>> Hello Michael and Boaquan
>>
>> On 01/08/24 12:21, Sourabh Jain wrote:
>>> Hello Michael,
>>>
>>> On 01/08/24 08:04, Michael Ellerman wrote:
>>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>>> The following errors are observed when kexec is done with SMT=off on
>>>>> powerpc.
>>>>>
>>>>> [  358.458385] Removing IBM Power 842 compression device
>>>>> [  374.795734] kexec_core: Starting new kernel
>>>>> [  374.795748] kexec: Waking offline cpu 1.
>>>>> [  374.875695] crash hp: kexec_trylock() failed, elfcorehdr may
>>>>> be inaccurate
>>>>> [  374.935833] kexec: Waking offline cpu 2.
>>>>> [  375.015664] crash hp: kexec_trylock() failed, elfcorehdr may
>>>>> be inaccurate
>>>>> snip..
>>>>> [  375.515823] kexec: Waking offline cpu 6.
>>>>> [  375.635667] crash hp: kexec_trylock() failed, elfcorehdr may
>>>>> be inaccurate
>>>>> [  375.695836] kexec: Waking offline cpu 7.
>>>> Are they actually errors though? Do they block the actual kexec from
>>>> happening? Or are they just warnings in dmesg?
>>> The kexec kernel boots fine.
>>>
>>> This warning appears regardless of whether the kdump kernel is loaded.
>>>
>>> However, when the kdump kernel is loaded, we will not be able to update
>>> the kdump image (FDT).
>>> I think this should be fine given that kexec is in progress.
>>>
>>> Please let me know your opinion.
>>>
>>>> Because the fix looks like it could be racy.
>>> It seems like it is racy, but given that kexec takes the lock first and
>>> then
>>> brings the CPU up, which triggers the kdump image, which always fails to
>>> update the kdump image because it could not take the same lock.
>>>
>>> Note: the kexec lock is not released unless kexec boot fails.
>> Any comments or suggestions on this fix?
> Is this a little better?
>
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 63cf89393c6e..0355ffb712f4 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -504,7 +504,7 @@ int crash_check_hotplug_support(void)
>   
>   	crash_hotplug_lock();
>   	/* Obtain lock while reading crash information */
> -	if (!kexec_trylock()) {
> +	if (!kexec_trylock() && kexec_in_progress) {
>   		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>   		crash_hotplug_unlock();
>   		return 0;
> @@ -539,7 +539,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>   
>   	crash_hotplug_lock();
>   	/* Obtain lock while changing crash information */
> -	if (!kexec_trylock()) {
> +	if (!kexec_trylock() && kexec_in_progress) {
>   		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
>   		crash_hotplug_unlock();
>   		return;

Ideally, when `kexec_in_progress` is True, there should be no way to 
acquire the kexec lock.
Therefore, calling `kexec_trylock()` before checking `kexec_in_progress` 
is not helpful.
The kernel will print the error message "kexec_trylock() failed, 
elfcorehdr may be inaccurate."
So, with the above changes, the original problem remains unsolved.

However, after closely inspecting the 
`kernel/kexec_core.c:kernel_kexec()` function, I discovered
an exceptional case where my patch needs an update. The issue arises 
when the system returns
from the `machine_kexec()` function, which indicates that kexec has failed.

In this scenario, the kexec lock is released, but `kexec_in_progress` 
remains True.

I am unsure why `kexec_in_progress` is NOT set to False when kexec 
fails. Was this by design,
or was it an oversight because returning from the `machine_kexec()` 
function is highly unlikely?

Here is my proposal to address the original problem along with the 
exceptional case I described
above.

Let's implement two patches:

1. A patch that sets `kexec_in_progress` to False if the system returns 
from `machine_kexec()` before
    unlocking the kexec lock in the `kernel_kexec()` function.

    ```
    diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
    index c0caa14880c3..b41277183455 100644
    --- a/kernel/kexec_core.c
    +++ b/kernel/kexec_core.c
    @@ -1069,6 +1069,7 @@ int kernel_kexec(void)
    #endif

     Unlock:
    +      kexec_in_progress = false;
            kexec_unlock();
            return error;
     ```

2. A patch to return early from the `crash_handle_hotplug_event()` 
function if `kexec_in_progress` is
    set to True. This is essentially my original patch.

Please share your comments on the new approach.

Thank you for review.

- Sourabh Jain

