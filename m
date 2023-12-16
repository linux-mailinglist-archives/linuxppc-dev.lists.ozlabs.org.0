Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A3815B28
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 19:58:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zf09h0Rn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SswNX3wm1z3bXv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 05:58:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zf09h0Rn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SswMd4j1wz2xgw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 05:58:05 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SswMZ5rMzz4xT0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 05:58:02 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SswMZ5X0hz4xVV; Sun, 17 Dec 2023 05:58:02 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zf09h0Rn;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SswMZ2YCrz4xT0
	for <linuxppc-dev@ozlabs.org>; Sun, 17 Dec 2023 05:58:02 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BGGqoa4004488;
	Sat, 16 Dec 2023 18:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1YqUFEoj3Un5UZQQUD65WSiElJJ8dXs1qWeTmb9xVLU=;
 b=Zf09h0RnQpoCHzZPTth0r1gAVRiFDd4Mme7G7iW1qPCDPjxrW5uo8p+Q0JF1Dw/Xm6Kn
 PST3GOsHaN5Xo1ya59TC4QQqkMYOc/K7USyT6Cwf/gsBGm8yGdOezNn4PkKgLNQaiy2d
 1XGdLvIpMR6XNl20zqR41yUxTNodr1b+xfboHAyJJRKW+gILg2j24ubBxDiI+fp8tWxn
 DGfvcni3TcWvoyMmFqCPDwNgDGwuuzzr/uqTZmK+IrApL2xiuP3NyQ/SPvdS3j1JeZkR
 ZZ+gqMtvmUAP+kDaEZIRzJh/+0q5O6HH5d2JC2LN77W/a8VElqg7axWTqLsbM+nVtNDN 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v1ft1j9ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 18:57:21 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BGIujnM023208;
	Sat, 16 Dec 2023 18:57:20 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v1ft1j9rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 18:57:20 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BGG3o37004960;
	Sat, 16 Dec 2023 18:57:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3v1f378utj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 18:57:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BGIvG6825297632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 16 Dec 2023 18:57:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B36820043;
	Sat, 16 Dec 2023 18:57:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE67120040;
	Sat, 16 Dec 2023 18:57:11 +0000 (GMT)
Received: from [9.195.46.2] (unknown [9.195.46.2])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 16 Dec 2023 18:57:11 +0000 (GMT)
Message-ID: <67cadf74-6ae6-4f37-8645-af1833b13196@linux.ibm.com>
Date: Sun, 17 Dec 2023 00:27:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/6] crash: add a new kexec flag for FDT update
To: Baoquan He <bhe@redhat.com>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
 <20231211083056.340404-4-sourabhjain@linux.ibm.com>
 <ZXu55ZXVSMeQDE/e@MiWiFi-R3L-srv>
 <7fe7b62f-d3fc-4035-96fe-1ab0e3e743c0@linux.ibm.com>
 <ZX1wwVlE85FcTxmV@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZX1wwVlE85FcTxmV@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vnVsbcHGTBQq_9KI4BSBszexX564dw86
X-Proofpoint-GUID: LChgU9aB48Dw7jMeYT7nDsJrTPNkq7Eq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-16_14,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312160146
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



On 16/12/23 15:11, Baoquan He wrote:
> On 12/15/23 at 12:17pm, Sourabh Jain wrote:
> ......
>>>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>>>> index 0f6ea35879ee..bcedb7625b1f 100644
>>>> --- a/include/linux/kexec.h
>>>> +++ b/include/linux/kexec.h
>>>> @@ -319,6 +319,7 @@ struct kimage {
>>>>    #ifdef CONFIG_CRASH_HOTPLUG
>>>>    	/* If set, allow changes to elfcorehdr of kexec_load'd image */
>>>>    	unsigned int update_elfcorehdr:1;
>>>> +	unsigned int update_fdt:1;
>>> Can we unify this to one flag, e.g hotplug_update?
>>>
>>> With this, on x86_64, we will skip the sha calculation for elfcorehdr.
>>> On ppc, we will skip the sha calculation for elfcorehdr and fdt.
>> Yeah, that's what I suggested to Eric. I can do that, but I see one
>> problem with powerpc or other platforms that need to skip SHA
>> for more kexec segments in addition to elfcorehdr.
>>
>> `update_elfcorehdr` is set when the kexec tool sends the
>> `KEXEC_UPDATE_ELFCOREHDR`
>> flag to the kernel for the `kexec_load` system call.
>>
>> Given that the kexec tool has already been updated to send the
>> `KEXEC_UPDATE_ELFCOREHDR` flag only when elfcorehdr is skipped from
>> SHA verification in generic code, now it would be tricky for architectures
>> to
>> determine whether kexec has skipped SHA verification for just elfcorehdr
>> or all segments needed on the platform with the same flag.
> In kexec-tools, it's judged by do_hotplug to skip the elfcorehdr
> segment. I am wondering how you skip the fdt segment when calculating
> and verifying sha, only saw the update_fdt mark.

In the kexec tool where we loop through all the kexec segments to calculate
the SHA, there will be a arch call made to determine whether the segment 
needs
to be excluded from SHA or not.

Now in the arch function if decide a specific segment needs to excluded then
corresponding flag is also set by arch function to communicate same with the
kernel.

>
> About the existing KEXEC_UPDATE_ELFCOREHDR, we only rename the macro,
> but still use the same value, could you think of what problem could be
> caused between kernel and kexec-tools utility, the old and new version
> compatibility?

Just changing the macro name will NOT help because the current kexec tool
enables the KEXEC_UPDATE_ELFCOREHDR = 0x00000004 kexec flag bit
if
the command argument --hotplug is passed to the kexec
and
the /sys/kernel/crash_elfcorehdr_size file exists in the system.

Now, let's say an architecture enables this feature in the kernel with 
the assumption
that the 0x00000004 kexec flag bit is passed from the kexec tool when 
all the required
kexec segments are skipped from SHA calculation. In this case, the 
current kexec tool,
which passes the 0x00000004 kexec flag bit only when the elfcorehdr is 
skipped, will
cause issues for architectures.

>
> If it's about the new header files installed on older kernel, we can
> change it like below? Fortunately only one release, 6.6 passed.
>
> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> index 3d5b3d757bed..df6a6505e267 100644
> --- a/include/uapi/linux/kexec.h
> +++ b/include/uapi/linux/kexec.h
> @@ -13,7 +13,7 @@
>   #define KEXEC_ON_CRASH         0x00000001
>   #define KEXEC_PRESERVE_CONTEXT 0x00000002
> -#define KEXEC_UPDATE_FDT       0x00000008
> +#define KEXEC_CRASH_HOTPLUG_UPDATE 0x00000004
>   #define KEXEC_UPDATE_ELFCOREHDR        0x00000004
>   #define KEXEC_ARCH_MASK                0xffff0000
>   
>   /*
>
> With my understanding, the kexec flag should be indicating the action,
> the mem/cpu hotplug, but not relating to any detail. Imagine later
> another segment need be skipped on one ARCH again, then another flag
> need be added, this sounds not reasonable.
I strongly agree with you. The KEXEC_CRASH_HOTPLUG_UPDATE kexec flag
should be sufficient to inform the kernel that the kexec tool has been 
updated
to support CPU/Memory hotplug for the kexec_load system call. Unfortunately,
we cannot use the 0x00000004 kexec flags bit for KEXEC_CRASH_HOTPLUG_UPDATE
at the moment.

What about using 0x00000008 for the KEXEC_CRASH_HOTPLUG_UPDATE flag?

I am aware that we are utilizing two kexec flag bits (0x00000004 and 
0x00000008)
for the same feature, but what other options do we have?

Thanks,
Sourabh
>> Code snippet from the kexec tool:
>>
>> main() {
>>      ...
>>      /* NOTE: Xen KEXEC_LIVE_UPDATE and KEXEC_UPDATE_ELFCOREHDR collide */
>>      if (do_hotplug) {
>>          ...
>>
>>          /* Indicate to the kernel it is ok to modify the elfcorehdr */
>>          kexec_flags |= KEXEC_UPDATE_ELFCOREHDR;
>>      }
>>      ...
>> }
>>
>> Any suggestion how to handle this with just one kexec flag?
>>
>> Thanks for the review.
>>
>> Thanks,
>> Sourabh Jain
>>
>>>>    #endif
>>>>    #ifdef ARCH_HAS_KIMAGE_ARCH
>>>> @@ -396,9 +397,10 @@ bool kexec_load_permitted(int kexec_image_type);
>>>>    /* List of defined/legal kexec flags */
>>>>    #ifndef CONFIG_KEXEC_JUMP
>>>> -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR)
>>>> +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR | KEXEC_UPDATE_FDT)
>>>>    #else
>>>> -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR)
>>>> +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR | \
>>>> +			KEXEC_UPDATE_FDT)
>>>>    #endif
>>>>    /* List of defined/legal kexec file flags */
>>>> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
>>>> index 01766dd839b0..3d5b3d757bed 100644
>>>> --- a/include/uapi/linux/kexec.h
>>>> +++ b/include/uapi/linux/kexec.h
>>>> @@ -13,6 +13,7 @@
>>>>    #define KEXEC_ON_CRASH		0x00000001
>>>>    #define KEXEC_PRESERVE_CONTEXT	0x00000002
>>>>    #define KEXEC_UPDATE_ELFCOREHDR	0x00000004
>>>> +#define KEXEC_UPDATE_FDT	0x00000008
>>>>    #define KEXEC_ARCH_MASK		0xffff0000
>>>>    /*
>>>> diff --git a/kernel/kexec.c b/kernel/kexec.c
>>>> index 8f35a5a42af8..97eb151cd931 100644
>>>> --- a/kernel/kexec.c
>>>> +++ b/kernel/kexec.c
>>>> @@ -132,6 +132,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
>>>>    #ifdef CONFIG_CRASH_HOTPLUG
>>>>    	if (flags & KEXEC_UPDATE_ELFCOREHDR)
>>>>    		image->update_elfcorehdr = 1;
>>>> +	if (flags & KEXEC_UPDATE_FDT)
>>>> +		image->update_fdt = 1;
>>>>    #endif
>>>>    	ret = machine_kexec_prepare(image);
>>>> -- 
>>>> 2.41.0
>>>>

