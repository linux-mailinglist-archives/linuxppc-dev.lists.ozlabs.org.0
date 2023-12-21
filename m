Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500AA81AEA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 07:08:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iiO6RTKg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Swg396nS0z3cVt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 17:08:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iiO6RTKg;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Swg2K211Bz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 17:07:37 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Swg2F0BdJz4xCg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 17:07:33 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Swg2D70j0z4xKR; Thu, 21 Dec 2023 17:07:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iiO6RTKg;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Swg2D40QKz4xCg
	for <linuxppc-dev@ozlabs.org>; Thu, 21 Dec 2023 17:07:32 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BL5gsvW027919;
	Thu, 21 Dec 2023 06:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mlEzLMSbgwKYiXuGSUXtjot5hxjG7NAbIvPHyReafCo=;
 b=iiO6RTKgSw32eTP6fhTUZw0M1vL8KoRKLZVAubqn192u8IT8c5MQDymAB1IPgeyMp+ao
 3drJApUXoWbRc5Em44b8lZKPv9Z5iY0K9J0yQUoB00h1tRzMx6+FUk12y4V5qDyOvT4b
 W0xBdBPwOgQz4X5H3AkkP1KHmCdmVaok+tyezLzePyPhZlA9Z7AjTfV2qWXh8HjIEW8x
 aE9ptMXNzJkjfr4VJDALIi2yzs5v9rGn/DxkxywDg0UvvLdoT5Sqs8vsamowY4SZl+Y4
 MpJmi5qoZg8DY5yU20Ugf3qO6eTSzwKn27jyw3Cs5aHypCxqiDU5vw0HUhdjq+zXDFaA kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v4fey8ruk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Dec 2023 06:06:52 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BL66pXU003864;
	Thu, 21 Dec 2023 06:06:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v4fey8ru7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Dec 2023 06:06:51 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BL5oJBT004797;
	Thu, 21 Dec 2023 06:06:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3v1pm03ba9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Dec 2023 06:06:50 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BL66jK319071494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Dec 2023 06:06:47 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D97F42004E;
	Thu, 21 Dec 2023 06:06:45 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 807152004B;
	Thu, 21 Dec 2023 06:06:40 +0000 (GMT)
Received: from [9.195.35.103] (unknown [9.195.35.103])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 21 Dec 2023 06:06:40 +0000 (GMT)
Message-ID: <cdde877b-e620-45db-ae28-4b691c1ae5b6@linux.ibm.com>
Date: Thu, 21 Dec 2023 11:36:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/6] crash: add a new kexec flag for FDT update
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
 <20231211083056.340404-4-sourabhjain@linux.ibm.com>
 <ZXu55ZXVSMeQDE/e@MiWiFi-R3L-srv>
 <7fe7b62f-d3fc-4035-96fe-1ab0e3e743c0@linux.ibm.com>
 <ZX1wwVlE85FcTxmV@MiWiFi-R3L-srv>
 <67cadf74-6ae6-4f37-8645-af1833b13196@linux.ibm.com>
 <ZX5H+X9Urz8kuiSG@MiWiFi-R3L-srv>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZX5H+X9Urz8kuiSG@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k5lfgCxIBfLmT59O_Qno0leysUmwS1Ik
X-Proofpoint-ORIG-GUID: 4bcOEpxyibbmTSwJ2B9qVbi9bSP48_H1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-21_02,2023-12-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 suspectscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312210043
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org, Eric DeVolder <eric.devolder@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Baoquan,

While replying to this email earlier, I mistakenly pressed "Reply to List"
instead of "Reply to All." Consequently, my response was sent only to 
powerpc
mailing list.

On 17/12/23 06:29, Baoquan He wrote:
> On 12/17/23 at 12:27am, Sourabh Jain wrote:
>> On 16/12/23 15:11, Baoquan He wrote:
>>> On 12/15/23 at 12:17pm, Sourabh Jain wrote:
>>> ......
>>>>>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>>>>>> index 0f6ea35879ee..bcedb7625b1f 100644
>>>>>> --- a/include/linux/kexec.h
>>>>>> +++ b/include/linux/kexec.h
>>>>>> @@ -319,6 +319,7 @@ struct kimage {
>>>>>>     #ifdef CONFIG_CRASH_HOTPLUG
>>>>>>     	/* If set, allow changes to elfcorehdr of kexec_load'd image */
>>>>>>     	unsigned int update_elfcorehdr:1;
>>>>>> +	unsigned int update_fdt:1;
>>>>> Can we unify this to one flag, e.g hotplug_update?
>>>>>
>>>>> With this, on x86_64, we will skip the sha calculation for elfcorehdr.
>>>>> On ppc, we will skip the sha calculation for elfcorehdr and fdt.
>>>> Yeah, that's what I suggested to Eric. I can do that, but I see one
>>>> problem with powerpc or other platforms that need to skip SHA
>>>> for more kexec segments in addition to elfcorehdr.
>>>>
>>>> `update_elfcorehdr` is set when the kexec tool sends the
>>>> `KEXEC_UPDATE_ELFCOREHDR`
>>>> flag to the kernel for the `kexec_load` system call.
>>>>
>>>> Given that the kexec tool has already been updated to send the
>>>> `KEXEC_UPDATE_ELFCOREHDR` flag only when elfcorehdr is skipped from
>>>> SHA verification in generic code, now it would be tricky for architectures
>>>> to
>>>> determine whether kexec has skipped SHA verification for just elfcorehdr
>>>> or all segments needed on the platform with the same flag.
>>> In kexec-tools, it's judged by do_hotplug to skip the elfcorehdr
>>> segment. I am wondering how you skip the fdt segment when calculating
>>> and verifying sha, only saw the update_fdt mark.
>> In the kexec tool where we loop through all the kexec segments to calculate
>> the SHA, there will be a arch call made to determine whether the segment
>> needs
>> to be excluded from SHA or not.
> OK, a arch call will be added to exclude segments in the ARCH. And the
> elfcorehdr segment need be excluded in x86 ARCH in case other ARCH later
> may not want to exclude elfcorehdr.

Yes, Arch can choose which segment to exclude.


>> Now in the arch function if decide a specific segment needs to excluded then
>> corresponding flag is also set by arch function to communicate same with the
>> kernel.
> But I don't see how you exclude elfcorehdr and fdt in kernel for
> kexec_file codes. It's not happening in kexec-tools.

On PowerPC, SHA verification is NOT performed for the kexec_file_load 
case; hence, you
won't find any code changes in my patch series to exclude FDT in the 
kernel code.

However, let's consider a scenario where it gets added in the future, or 
other architectures
need to skip the kexec segment, in addition to elfcorehdr. In that case, 
we can use the
same setup as you suggested below. For each kexec segment, there should 
be an
architecture-specific function call to decide whether the segment needs 
to be excluded or not.

>>> About the existing KEXEC_UPDATE_ELFCOREHDR, we only rename the macro,
>>> but still use the same value, could you think of what problem could be
>>> caused between kernel and kexec-tools utility, the old and new version
>>> compatibility?
>> Just changing the macro name will NOT help because the current kexec tool
>> enables the KEXEC_UPDATE_ELFCOREHDR = 0x00000004 kexec flag bit
>> if
>> the command argument --hotplug is passed to the kexec
>> and
>> the /sys/kernel/crash_elfcorehdr_size file exists in the system.
> As we have discussed, excluding will be done in each ARCH's function
> when doing sha calculation in kexec-tools, isn't it?
>
> diff --git a/kexec/kexec.c b/kexec/kexec.c
> index b5393e3b20aa..0095aeec988a 100644
> --- a/kexec/kexec.c
> +++ b/kexec/kexec.c
> @@ -701,10 +701,10 @@ static void update_purgatory(struct kexec_info *info)
>   			continue;
>   		}
>   
> -		/* Don't include elfcorehdr in the checksum, if hotplug
> +		/* Don't include unwanted segments in the checksum, if hotplug
>   		 * support enabled.
> -		 */
> -		if (do_hotplug && (info->segment[i].mem == (void *)info->elfcorehdr)) {
> +		if (do_hotplug)
> +			arch_exclude_segments(info, &i)
>   			continue;
>   		}

Yes, something like the above should work.
>> Now, let's say an architecture enables this feature in the kernel with the
>> assumption
>> that the 0x00000004 kexec flag bit is passed from the kexec tool when all
>> the required
>> kexec segments are skipped from SHA calculation. In this case, the current
>> kexec tool,
>> which passes the 0x00000004 kexec flag bit only when the elfcorehdr is
>> skipped, will
>> cause issues for architectures.
>>
>>> If it's about the new header files installed on older kernel, we can
>>> change it like below? Fortunately only one release, 6.6 passed.
>>>
>>> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
>>> index 3d5b3d757bed..df6a6505e267 100644
>>> --- a/include/uapi/linux/kexec.h
>>> +++ b/include/uapi/linux/kexec.h
>>> @@ -13,7 +13,7 @@
>>>    #define KEXEC_ON_CRASH         0x00000001
>>>    #define KEXEC_PRESERVE_CONTEXT 0x00000002
>>> -#define KEXEC_UPDATE_FDT       0x00000008
>>> +#define KEXEC_CRASH_HOTPLUG_UPDATE 0x00000004
>>>    #define KEXEC_UPDATE_ELFCOREHDR        0x00000004
>>>    #define KEXEC_ARCH_MASK                0xffff0000
>>>    /*
>>>
>>> With my understanding, the kexec flag should be indicating the action,
>>> the mem/cpu hotplug, but not relating to any detail. Imagine later
>>> another segment need be skipped on one ARCH again, then another flag
>>> need be added, this sounds not reasonable.
>> I strongly agree with you. The KEXEC_CRASH_HOTPLUG_UPDATE kexec flag
>> should be sufficient to inform the kernel that the kexec tool has been
>> updated
>> to support CPU/Memory hotplug for the kexec_load system call. Unfortunately,
>> we cannot use the 0x00000004 kexec flags bit for KEXEC_CRASH_HOTPLUG_UPDATE
>> at the moment.
> I am fine with 0x00000008 and a new flag, it has the same effect as
> #define KEXEC_CRASH_HOTPLUG_UPDATE 0x00000004
>
> I am worried about the header file incompatiblity.

If we are OK to have KEXEC_CRASH_HOTPLUG_UPDATE 0x00000008 as new bit
to introduce CPU/Memory hotplug feature for kexec_load syscall, we will 
not have
compatibility issue.

Let me write next version for this patch with KEXEC_CRASH_HOTPLUG_UPDATE 
0x00000008
as new flag bit and show how it will be handled. I will also share kexec 
code for clarity.

Thanks,
Sourabh
