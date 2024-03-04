Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1C486FBD9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 09:29:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XJ7uZu6Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpBhM521Rz3cTT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 19:29:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XJ7uZu6Y;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpBgZ13Psz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 19:29:14 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TpBgT6rXJz4wcK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 19:29:09 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TpBgT6ZHMz4wp0; Mon,  4 Mar 2024 19:29:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XJ7uZu6Y;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TpBgT3c5Xz4wcK
	for <linuxppc-dev@ozlabs.org>; Mon,  4 Mar 2024 19:29:09 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42485sXc016778;
	Mon, 4 Mar 2024 08:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lfy4+CoBg7ZWQrdFtY5C8AUygfgIuGJ53tstVgYE/Xc=;
 b=XJ7uZu6YJCaLbIhIpoOX2Q/FjR9zHlLRjSe0iYhaVx6agFSYqF2APLpaiZ0o1oDZ31YR
 vuGvS+1G96Rgf/2/V+WtYzdES0eNxqyHucU76oQcwKGr8QhE2pWU4qlTPYdDtClWQZTq
 MgoEyxAzApHDoi5ZxRKqVwJXbsCSA7aaxxc17+APfQkVlPM7e9iub/nrrdH6aIHKeFtV
 vZDDV2YhrntucD76k/mlzvttELc8fFHkp1495GvsZveFFWG/WWpU1IfNldbDgNpbesWI
 iGfYYJGG3NKlcDcu1wGcFm6i/ZNH69RscKQ+EcdKgMjWqrwOiMbcYDjIbkTBHCiqsu0l xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wnafy0fd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Mar 2024 08:28:44 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4248QwIN025070;
	Mon, 4 Mar 2024 08:28:43 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wnafy0fcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Mar 2024 08:28:43 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4245LAPT031530;
	Mon, 4 Mar 2024 08:28:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wmgnjq02x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Mar 2024 08:28:42 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4248Sbta65929718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Mar 2024 08:28:39 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF1CF2004B;
	Mon,  4 Mar 2024 08:28:36 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70F222005A;
	Mon,  4 Mar 2024 08:28:29 +0000 (GMT)
Received: from [9.43.79.108] (unknown [9.43.79.108])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Mar 2024 08:28:29 +0000 (GMT)
Message-ID: <5ac68ee8-a6c1-4b2f-8add-81ef1b1e5d52@linux.ibm.com>
Date: Mon, 4 Mar 2024 13:58:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 6/6] powerpc/crash: add crash memory hotplug support
Content-Language: en-US
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <dadf3ccb-3202-4e3c-b1de-04518cdcb25b@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <dadf3ccb-3202-4e3c-b1de-04518cdcb25b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xrAH2Vct8EkHWU42ZT5Nl-bsxJbG8bU-
X-Proofpoint-GUID: DsdNRvDRmJlTas_LLESZBzekMfgLL3EA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_04,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403040064
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
Cc: Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, kexec@lists.infradead.org, Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Borislav Petkov <bp@alien8.de>, Akhil Raj <lf32.dev@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dave Young <dyoung@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Vivek Goyal <vgoyal@redhat.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/03/24 18:49, Hari Bathini wrote:
>
>
> On 26/02/24 2:11 pm, Sourabh Jain wrote:
>> Extend the arch crash hotplug handler, as introduced by the patch title
>> ("powerpc: add crash CPU hotplug support"), to also support memory
>> add/remove events.
>>
>> Elfcorehdr describes the memory of the crash kernel to capture the
>> kernel; hence, it needs to be updated if memory resources change due to
>> memory add/remove events. Therefore, arch_crash_handle_hotplug_event()
>> is updated to recreate the elfcorehdr and replace it with the previous
>> one on memory add/remove events.
>>
>> The memblock list is used to prepare the elfcorehdr. In the case of
>> memory hot remove, the memblock list is updated after the arch crash
>> hotplug handler is triggered, as depicted in Figure 1. Thus, the
>> hot-removed memory is explicitly removed from the crash memory ranges
>> to ensure that the memory ranges added to elfcorehdr do not include the
>> hot-removed memory.
>>
>>      Memory remove
>>            |
>>            v
>>      Offline pages
>>            |
>>            v
>>   Initiate memory notify call <----> crash hotplug handler
>>   chain for MEM_OFFLINE event
>>            |
>>            v
>>   Update memblock list
>>
>>       Figure 1
>>
>> There are two system calls, `kexec_file_load` and `kexec_load`, used to
>> load the kdump image. A few changes have been made to ensure that the
>> kernel can safely update the elfcorehdr component of the kdump image for
>> both system calls.
>>
>> For the kexec_file_load syscall, kdump image is prepared in the kernel.
>> To support an increasing number of memory regions, the elfcorehdr is
>> built with extra buffer space to ensure that it can accommodate
>> additional memory ranges in future.
>>
>> For the kexec_load syscall, the elfcorehdr is updated only if the
>> KEXEC_CRASH_HOTPLUG_SUPPORT kexec flag is passed to the kernel by the
>> kexec tool. Passing this flag to the kernel indicates that the
>> elfcorehdr is built to accommodate additional memory ranges and the
>> elfcorehdr segment is not considered for SHA calculation, making it safe
>> to update.
>>
>> The changes related to this feature are kept under the CRASH_HOTPLUG
>> config, and it is enabled by default.
>>
>
> Overall, the patchset looks good. I tried out the changes too.
>
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>

Hello Hari,

Thanks for trying out the change.

- Sourabh

>
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
>>   arch/powerpc/include/asm/kexec.h        |  3 +
>>   arch/powerpc/include/asm/kexec_ranges.h |  1 +
>>   arch/powerpc/kexec/crash.c              | 95 ++++++++++++++++++++++++-
>>   arch/powerpc/kexec/file_load_64.c       | 20 +++++-
>>   arch/powerpc/kexec/ranges.c             | 85 ++++++++++++++++++++++
>>   5 files changed, 202 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kexec.h 
>> b/arch/powerpc/include/asm/kexec.h
>> index e75970351bcd..95a98b390d62 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -141,6 +141,9 @@ void arch_crash_handle_hotplug_event(struct 
>> kimage *image, void *arg);
>>     int arch_crash_hotplug_support(struct kimage *image, unsigned 
>> long kexec_flags);
>>   #define arch_crash_hotplug_support arch_crash_hotplug_support
>> +
>> +unsigned int arch_crash_get_elfcorehdr_size(void);
>> +#define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
>>   #endif /* CONFIG_CRASH_HOTPLUG */
>>     extern int crashing_cpu;
>> diff --git a/arch/powerpc/include/asm/kexec_ranges.h 
>> b/arch/powerpc/include/asm/kexec_ranges.h
>> index 8489e844b447..14055896cbcb 100644
>> --- a/arch/powerpc/include/asm/kexec_ranges.h
>> +++ b/arch/powerpc/include/asm/kexec_ranges.h
>> @@ -7,6 +7,7 @@
>>   void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
>>   struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
>>   int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
>> +int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 
>> size);
>>   int get_exclude_memory_ranges(struct crash_mem **mem_ranges);
>>   int get_reserved_memory_ranges(struct crash_mem **mem_ranges);
>>   int get_crash_memory_ranges(struct crash_mem **mem_ranges);
>> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
>> index 8938a19af12f..21b193e938a3 100644
>> --- a/arch/powerpc/kexec/crash.c
>> +++ b/arch/powerpc/kexec/crash.c
>> @@ -17,6 +17,7 @@
>>   #include <linux/irq.h>
>>   #include <linux/types.h>
>>   #include <linux/libfdt.h>
>> +#include <linux/memory.h>
>>     #include <asm/processor.h>
>>   #include <asm/machdep.h>
>> @@ -25,6 +26,7 @@
>>   #include <asm/setjmp.h>
>>   #include <asm/debug.h>
>>   #include <asm/interrupt.h>
>> +#include <asm/kexec_ranges.h>
>>     /*
>>    * The primary CPU waits a while for all secondary CPUs to enter. 
>> This is to
>> @@ -398,6 +400,94 @@ void default_machine_crash_shutdown(struct 
>> pt_regs *regs)
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "crash hp: " fmt
>>   +/*
>> + * Advertise preferred elfcorehdr size to userspace via
>> + * /sys/kernel/crash_elfcorehdr_size sysfs interface.
>> + */
>> +unsigned int arch_crash_get_elfcorehdr_size(void)
>> +{
>> +    unsigned long phdr_cnt;
>> +
>> +    /* A program header for possible CPUs + vmcoreinfo */
>> +    phdr_cnt = num_possible_cpus() + 1;
>> +    if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
>> +        phdr_cnt += CONFIG_CRASH_MAX_MEMORY_RANGES;
>> +
>> +    return sizeof(struct elfhdr) + (phdr_cnt * sizeof(Elf64_Phdr));
>> +}
>> +
>> +/**
>> + * update_crash_elfcorehdr() - Recreate the elfcorehdr and replace 
>> it with old
>> + *                   elfcorehdr in the kexec segment array.
>> + * @image: the active struct kimage
>> + * @mn: struct memory_notify data handler
>> + */
>> +static void update_crash_elfcorehdr(struct kimage *image, struct 
>> memory_notify *mn)
>> +{
>> +    int ret;
>> +    struct crash_mem *cmem = NULL;
>> +    struct kexec_segment *ksegment;
>> +    void *ptr, *mem, *elfbuf = NULL;
>> +    unsigned long elfsz, memsz, base_addr, size;
>> +
>> +    ksegment = &image->segment[image->elfcorehdr_index];
>> +    mem = (void *) ksegment->mem;
>> +    memsz = ksegment->memsz;
>> +
>> +    ret = get_crash_memory_ranges(&cmem);
>> +    if (ret) {
>> +        pr_err("Failed to get crash mem range\n");
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * The hot unplugged memory is part of crash memory ranges,
>> +     * remove it here.
>> +     */
>> +    if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
>> +        base_addr = PFN_PHYS(mn->start_pfn);
>> +        size = mn->nr_pages * PAGE_SIZE;
>> +        ret = remove_mem_range(&cmem, base_addr, size);
>> +        if (ret) {
>> +            pr_err("Failed to remove hot-unplugged memory from crash 
>> memory ranges\n");
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
>> +    if (ret) {
>> +        pr_err("Failed to prepare elf header\n");
>> +        goto out;
>> +    }
>> +
>> +    /*
>> +     * It is unlikely that kernel hit this because elfcorehdr kexec
>> +     * segment (memsz) is built with addition space to accommodate 
>> growing
>> +     * number of crash memory ranges while loading the kdump kernel. 
>> It is
>> +     * Just to avoid any unforeseen case.
>> +     */
>> +    if (elfsz > memsz) {
>> +        pr_err("Updated crash elfcorehdr elfsz %lu > memsz %lu", 
>> elfsz, memsz);
>> +        goto out;
>> +    }
>> +
>> +    ptr = __va(mem);
>> +    if (ptr) {
>> +        /* Temporarily invalidate the crash image while it is 
>> replaced */
>> +        xchg(&kexec_crash_image, NULL);
>> +
>> +        /* Replace the old elfcorehdr with newly prepared elfcorehdr */
>> +        memcpy((void *)ptr, elfbuf, elfsz);
>> +
>> +        /* The crash image is now valid once again */
>> +        xchg(&kexec_crash_image, image);
>> +    }
>> +out:
>> +    kvfree(cmem);
>> +    if (elfbuf)
>> +        kvfree(elfbuf);
>> +}
>> +
>>   /**
>>    * get_fdt_index - Loop through the kexec segment array and find
>>    *           the index of the FDT segment.
>> @@ -478,6 +568,8 @@ int arch_crash_hotplug_support(struct kimage 
>> *image, unsigned long kexec_flags)
>>    */
>>   void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>   {
>> +    struct memory_notify *mn;
>> +
>>       switch (image->hp_action) {
>>       case KEXEC_CRASH_HP_REMOVE_CPU:
>>           return;
>> @@ -488,7 +580,8 @@ void arch_crash_handle_hotplug_event(struct 
>> kimage *image, void *arg)
>>         case KEXEC_CRASH_HP_REMOVE_MEMORY:
>>       case KEXEC_CRASH_HP_ADD_MEMORY:
>> -        pr_info_once("Crash update is not supported for memory 
>> hotplug\n");
>> +        mn = (struct memory_notify *)arg;
>> +        update_crash_elfcorehdr(image, mn);
>>           return;
>>       default:
>>           pr_warn_once("Unknown hotplug action\n");
>> diff --git a/arch/powerpc/kexec/file_load_64.c 
>> b/arch/powerpc/kexec/file_load_64.c
>> index 2640a804fcdf..925a69ad2468 100644
>> --- a/arch/powerpc/kexec/file_load_64.c
>> +++ b/arch/powerpc/kexec/file_load_64.c
>> @@ -595,6 +595,23 @@ static void update_backup_region_phdr(struct 
>> kimage *image, Elf64_Ehdr *ehdr)
>>       }
>>   }
>>   +static unsigned int kdump_extra_elfcorehdr_size(struct crash_mem 
>> *cmem)
>> +{
>> +#if defined(CONFIG_CRASH_HOTPLUG) && defined(CONFIG_MEMORY_HOTPLUG)
>> +    unsigned int extra_sz = 0;
>> +
>> +    if (CONFIG_CRASH_MAX_MEMORY_RANGES > (unsigned int)PN_XNUM)
>> +        pr_warn("Number of Phdrs %u exceeds max\n", 
>> CONFIG_CRASH_MAX_MEMORY_RANGES);
>> +    else if (cmem->nr_ranges >= CONFIG_CRASH_MAX_MEMORY_RANGES)
>> +        pr_warn("Configured crash mem ranges may not be enough\n");
>> +    else
>> +        extra_sz = (CONFIG_CRASH_MAX_MEMORY_RANGES - 
>> cmem->nr_ranges) * sizeof(Elf64_Phdr);
>> +
>> +    return extra_sz;
>> +#endif
>> +    return 0;
>> +}
>> +
>>   /**
>>    * load_elfcorehdr_segment - Setup crash memory ranges and 
>> initialize elfcorehdr
>>    *                           segment needed to load kdump kernel.
>> @@ -626,7 +643,8 @@ static int load_elfcorehdr_segment(struct kimage 
>> *image, struct kexec_buf *kbuf)
>>         kbuf->buffer = headers;
>>       kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
>> -    kbuf->bufsz = kbuf->memsz = headers_sz;
>> +    kbuf->bufsz = headers_sz;
>> +    kbuf->memsz = headers_sz + kdump_extra_elfcorehdr_size(cmem);
>>       kbuf->top_down = false;
>>         ret = kexec_add_buffer(kbuf);
>> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
>> index 297b8bc97b9f..00dfd62203bd 100644
>> --- a/arch/powerpc/kexec/ranges.c
>> +++ b/arch/powerpc/kexec/ranges.c
>> @@ -618,4 +618,89 @@ int get_crash_memory_ranges(struct crash_mem 
>> **mem_ranges)
>>           pr_err("Failed to setup crash memory ranges\n");
>>       return ret;
>>   }
>> +
>> +/**
>> + * remove_mem_range - Removes the given memory range from the range 
>> list.
>> + * @mem_ranges:    Range list to remove the memory range to.
>> + * @base:          Base address of the range to remove.
>> + * @size:          Size of the memory range to remove.
>> + *
>> + * (Re)allocates memory, if needed.
>> + *
>> + * Returns 0 on success, negative errno on error.
>> + */
>> +int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
>> +{
>> +    u64 end;
>> +    int ret = 0;
>> +    unsigned int i;
>> +    u64 mstart, mend;
>> +    struct crash_mem *mem_rngs = *mem_ranges;
>> +
>> +    if (!size)
>> +        return 0;
>> +
>> +    /*
>> +     * Memory range are stored as start and end address, use
>> +     * the same format to do remove operation.
>> +     */
>> +    end = base + size - 1;
>> +
>> +    for (i = 0; i < mem_rngs->nr_ranges; i++) {
>> +        mstart = mem_rngs->ranges[i].start;
>> +        mend = mem_rngs->ranges[i].end;
>> +
>> +        /*
>> +         * Memory range to remove is not part of this range entry
>> +         * in the memory range list
>> +         */
>> +        if (!(base >= mstart && end <= mend))
>> +            continue;
>> +
>> +        /*
>> +         * Memory range to remove is equivalent to this entry in the
>> +         * memory range list. Remove the range entry from the list.
>> +         */
>> +        if (base == mstart && end == mend) {
>> +            for (; i < mem_rngs->nr_ranges - 1; i++) {
>> +                mem_rngs->ranges[i].start = 
>> mem_rngs->ranges[i+1].start;
>> +                mem_rngs->ranges[i].end = mem_rngs->ranges[i+1].end;
>> +            }
>> +            mem_rngs->nr_ranges--;
>> +            goto out;
>> +        }
>> +        /*
>> +         * Start address of the memory range to remove and the
>> +         * current memory range entry in the list is same. Just
>> +         * move the start address of the current memory range
>> +         * entry in the list to end + 1.
>> +         */
>> +        else if (base == mstart) {
>> +            mem_rngs->ranges[i].start = end + 1;
>> +            goto out;
>> +        }
>> +        /*
>> +         * End address of the memory range to remove and the
>> +         * current memory range entry in the list is same.
>> +         * Just move the end address of the current memory
>> +         * range entry in the list to base - 1.
>> +         */
>> +        else if (end == mend)  {
>> +            mem_rngs->ranges[i].end = base - 1;
>> +            goto out;
>> +        }
>> +        /*
>> +         * Memory range to remove is not at the edge of current
>> +         * memory range entry. Split the current memory entry into
>> +         * two half.
>> +         */
>> +        else {
>> +            mem_rngs->ranges[i].end = base - 1;
>> +            size = mem_rngs->ranges[i].end - end;
>> +            ret = add_mem_range(mem_ranges, end + 1, size);
>> +        }
>> +    }
>> +out:
>> +    return ret;
>> +}
>>   #endif /* CONFIG_CRASH_DUMP */

