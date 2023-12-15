Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC98141EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 07:49:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gL9wxc2C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ss0FH0Qx4z3d8S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 17:49:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gL9wxc2C;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss0DP43yZz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 17:48:37 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Ss0DM4DWbz4wby
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 17:48:35 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Ss0DM436yz4wcX; Fri, 15 Dec 2023 17:48:35 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gL9wxc2C;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Ss0DM13hdz4wby
	for <linuxppc-dev@ozlabs.org>; Fri, 15 Dec 2023 17:48:34 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BF61Jsh030157;
	Fri, 15 Dec 2023 06:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qq+XM99YKapoO9A7GsmvXm9eR9L802wC+4vFAn2v/uA=;
 b=gL9wxc2CxXdEDze/ICtXAgVjQk/5j9Ct89U+E25wn478nOTZoYizDJ7i+EL7gZETAMr4
 FAlLM4/55fQS08mRacILlJSB5DpCh1d6wFvdeDxLfzGCRwfW2nZDEY1trySkrmXy//5i
 Vu/xxBG0xTu8WbpU5MLtorSHM2BZI1DT0lz3dy9ZvpYMA6xiyWv6zlodIb7bcu0UHBGu
 qjblpPf5F50n/OIC3IiWDTV3V9J69tr2BEpYhXqV9niMONeVkAlVFVQT8HVb+jBQL/ku
 7sUHFXWK0UyLGeqwryZf7C7+/jVxWuyHYhRhMm8/wy7VYQu6JX9ROk92uDPI2iMjF3Bb JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v0avttcw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 06:48:06 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BF6cGrN018642;
	Fri, 15 Dec 2023 06:48:05 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v0avttcva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 06:48:05 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BF69sNY004390;
	Fri, 15 Dec 2023 06:48:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw4skww0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 06:48:03 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BF6m0tm44368242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Dec 2023 06:48:00 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 792412004B;
	Fri, 15 Dec 2023 06:48:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB34B20040;
	Fri, 15 Dec 2023 06:47:54 +0000 (GMT)
Received: from [9.79.186.169] (unknown [9.79.186.169])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Dec 2023 06:47:54 +0000 (GMT)
Message-ID: <7fe7b62f-d3fc-4035-96fe-1ab0e3e743c0@linux.ibm.com>
Date: Fri, 15 Dec 2023 12:17:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/6] crash: add a new kexec flag for FDT update
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
 <20231211083056.340404-4-sourabhjain@linux.ibm.com>
 <ZXu55ZXVSMeQDE/e@MiWiFi-R3L-srv>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZXu55ZXVSMeQDE/e@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ff_wBrRVfiE8PpeimopXNnQOeAWu101d
X-Proofpoint-GUID: 6xLGpZ2Nyziv5yWS7rir-A351zYiKRf8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_02,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312150040
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

On 15/12/23 07:58, Baoquan He wrote:
> On 12/11/23 at 02:00pm, Sourabh Jain wrote:
>> The commit a72bbec70da2 ("crash: hotplug support for kexec_load()")
>> introduced a new kexec flag, `KEXEC_UPDATE_ELFCOREHDR`. Kexec tool uses
>> this flag to indicate kernel that it is safe to modify the elfcorehdr
>> of kdump image loaded using kexec_load system call.
>>
>> Similarly, add a new kexec flag, `KEXEC_UPDATE_FDT`, for another kdump
>> component named FDT (Flatten Device Tree). Architectures like PowerPC
>> need to update FDT kdump image component on CPU hotplug events. Kexec
>> tool passing `KEXEC_UPDATE_FDT` will be an indication to kernel that FDT
>> segment is not part of SHA calculation hence it is safe to update it.
>>
>> With the `KEXEC_UPDATE_ELFCOREHDR` and `KEXEC_UPDATE_FDT` kexec flags,
>> crash hotplug support can be added to PowerPC for the kexec_load syscall
>> while maintaining the backward compatibility with older kexec tools that
>> do not have these newly introduced flags.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Cc: Akhil Raj <lf32.dev@gmail.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>> Cc: Baoquan He <bhe@redhat.com>
>> Cc: Borislav Petkov (AMD) <bp@alien8.de>
>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
>> Cc: Dave Young <dyoung@redhat.com>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Eric DeVolder <eric.devolder@oracle.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Mimi Zohar <zohar@linux.ibm.com>
>> Cc: Naveen N Rao <naveen@kernel.org>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Valentin Schneider <vschneid@redhat.com>
>> Cc: Vivek Goyal <vgoyal@redhat.com>
>> Cc: kexec@lists.infradead.org
>> Cc: x86@kernel.org
>> ---
>>   include/linux/kexec.h      | 6 ++++--
>>   include/uapi/linux/kexec.h | 1 +
>>   kernel/kexec.c             | 2 ++
>>   3 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>> index 0f6ea35879ee..bcedb7625b1f 100644
>> --- a/include/linux/kexec.h
>> +++ b/include/linux/kexec.h
>> @@ -319,6 +319,7 @@ struct kimage {
>>   #ifdef CONFIG_CRASH_HOTPLUG
>>   	/* If set, allow changes to elfcorehdr of kexec_load'd image */
>>   	unsigned int update_elfcorehdr:1;
>> +	unsigned int update_fdt:1;
> Can we unify this to one flag, e.g hotplug_update?
>
> With this, on x86_64, we will skip the sha calculation for elfcorehdr.
> On ppc, we will skip the sha calculation for elfcorehdr and fdt.
Yeah, that's what I suggested to Eric. I can do that, but I see one
problem with powerpc or other platforms that need to skip SHA
for more kexec segments in addition to elfcorehdr.

`update_elfcorehdr` is set when the kexec tool sends the 
`KEXEC_UPDATE_ELFCOREHDR`
flag to the kernel for the `kexec_load` system call.

Given that the kexec tool has already been updated to send the
`KEXEC_UPDATE_ELFCOREHDR` flag only when elfcorehdr is skipped from
SHA verification in generic code, now it would be tricky for 
architectures to
determine whether kexec has skipped SHA verification for just elfcorehdr
or all segments needed on the platform with the same flag.

Code snippet from the kexec tool:

main() {
     ...
     /* NOTE: Xen KEXEC_LIVE_UPDATE and KEXEC_UPDATE_ELFCOREHDR collide */
     if (do_hotplug) {
         ...

         /* Indicate to the kernel it is ok to modify the elfcorehdr */
         kexec_flags |= KEXEC_UPDATE_ELFCOREHDR;
     }
     ...
}

Any suggestion how to handle this with just one kexec flag?

Thanks for the review.

Thanks,
Sourabh Jain

>
>>   #endif
>>   
>>   #ifdef ARCH_HAS_KIMAGE_ARCH
>> @@ -396,9 +397,10 @@ bool kexec_load_permitted(int kexec_image_type);
>>   
>>   /* List of defined/legal kexec flags */
>>   #ifndef CONFIG_KEXEC_JUMP
>> -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR)
>> +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR | KEXEC_UPDATE_FDT)
>>   #else
>> -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR)
>> +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR | \
>> +			KEXEC_UPDATE_FDT)
>>   #endif
>>   
>>   /* List of defined/legal kexec file flags */
>> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
>> index 01766dd839b0..3d5b3d757bed 100644
>> --- a/include/uapi/linux/kexec.h
>> +++ b/include/uapi/linux/kexec.h
>> @@ -13,6 +13,7 @@
>>   #define KEXEC_ON_CRASH		0x00000001
>>   #define KEXEC_PRESERVE_CONTEXT	0x00000002
>>   #define KEXEC_UPDATE_ELFCOREHDR	0x00000004
>> +#define KEXEC_UPDATE_FDT	0x00000008
>>   #define KEXEC_ARCH_MASK		0xffff0000
>>   
>>   /*
>> diff --git a/kernel/kexec.c b/kernel/kexec.c
>> index 8f35a5a42af8..97eb151cd931 100644
>> --- a/kernel/kexec.c
>> +++ b/kernel/kexec.c
>> @@ -132,6 +132,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
>>   #ifdef CONFIG_CRASH_HOTPLUG
>>   	if (flags & KEXEC_UPDATE_ELFCOREHDR)
>>   		image->update_elfcorehdr = 1;
>> +	if (flags & KEXEC_UPDATE_FDT)
>> +		image->update_fdt = 1;
>>   #endif
>>   
>>   	ret = machine_kexec_prepare(image);
>> -- 
>> 2.41.0
>>

