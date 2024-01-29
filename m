Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D19083FEA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 07:47:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZgPIiRZb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNf4J2RpDz3cV9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 17:47:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZgPIiRZb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNf3Y35Pjz30fF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 17:46:49 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TNf3V0y4Qz4wcX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 17:46:46 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TNf3V0k5cz4wqN; Mon, 29 Jan 2024 17:46:46 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZgPIiRZb;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TNf3T46NCz4wcX
	for <linuxppc-dev@ozlabs.org>; Mon, 29 Jan 2024 17:46:45 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40T6b288003323;
	Mon, 29 Jan 2024 06:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0T82raFiD3dbZpzG/7SKc2/TmwZw6lj/hOSrKN4Ajig=;
 b=ZgPIiRZb8rjqslpTqIkI5O6jDoTcuCgid1zOwBu1GjwAQnb9kZOmXzBiN0XSyeMXK1Aw
 NmYgsvQdZzpVissoiWou7qUBGCMA9Rzgv4JF73cHgvUNqjif2aKks/XK4oX6svOCezCF
 oa9+meyLa4/ENFWx9NMRZ093DMv4aqs8+n3VGoXYZWS840v2aU38Hl+2u8Y5wL56Q+CT
 pEx3e6HYLchsyb6YSQPejLVlqIP/NdaQ5jTW55/YRV4/gZRLXaL5V1Q0WG7JeNYaoRHW
 BaJnZpzIKOVCZQW0w1WELKMglOI5ohScbg10k5m+vzlHZKnF4spWROjJ5N53Uf6VNp+o mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vx6e28raa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:46:10 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40T6QpjL002768;
	Mon, 29 Jan 2024 06:46:10 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vx6e28r9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:46:10 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40T2tHJC007184;
	Mon, 29 Jan 2024 06:46:09 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vwev1x5q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:46:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40T6k6gN9961994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jan 2024 06:46:06 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F92920040;
	Mon, 29 Jan 2024 06:46:06 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA95C20043;
	Mon, 29 Jan 2024 06:46:01 +0000 (GMT)
Received: from [9.79.186.242] (unknown [9.79.186.242])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Jan 2024 06:46:01 +0000 (GMT)
Message-ID: <d2996e30-cd3c-461a-8f8f-46dfb8938407@linux.ibm.com>
Date: Mon, 29 Jan 2024 12:16:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 5/5] powerpc: add crash memory hotplug support
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20240111105138.251366-1-sourabhjain@linux.ibm.com>
 <20240111105138.251366-6-sourabhjain@linux.ibm.com>
 <bd82e721-e674-4cfe-b9bf-942aaf7ee52c@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <bd82e721-e674-4cfe-b9bf-942aaf7ee52c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cvhG2sxazeARmlpH_iEjnin9Ww8_sb0P
X-Proofpoint-ORIG-GUID: JnCG9HXCmSbOeSSWPwraULLmK9GWsVzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_02,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401290046
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



On 23/01/24 15:52, Hari Bathini wrote:
>
>
> On 11/01/24 4:21 pm, Sourabh Jain wrote:
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
>> memory hot removal, the memblock list is updated after the arch crash
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
>>   arch/powerpc/include/asm/kexec.h        |   5 +-
>>   arch/powerpc/include/asm/kexec_ranges.h |   1 +
>>   arch/powerpc/kexec/core_64.c            | 107 +++++++++++++++++++++++-
>>   arch/powerpc/kexec/file_load_64.c       |  34 +++++++-
>>   arch/powerpc/kexec/ranges.c             |  85 +++++++++++++++++++
>>   5 files changed, 225 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kexec.h 
>> b/arch/powerpc/include/asm/kexec.h
>> index 943e58eb9bff..25ff5b7f1a28 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -116,8 +116,11 @@ int get_crash_memory_ranges(struct crash_mem 
>> **mem_ranges);
>>   #ifdef CONFIG_CRASH_HOTPLUG
>>   void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
>>   #define arch_crash_handle_hotplug_event 
>> arch_crash_handle_hotplug_event
>> -#endif /*CONFIG_CRASH_HOTPLUG */
>>   +unsigned int arch_crash_get_elfcorehdr_size(void);
>> +#define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
>> +
>> +#endif /*CONFIG_CRASH_HOTPLUG */
>>   #endif /* CONFIG_PPC64 */
>>     #ifdef CONFIG_KEXEC_FILE
>> diff --git a/arch/powerpc/include/asm/kexec_ranges.h 
>> b/arch/powerpc/include/asm/kexec_ranges.h
>> index f83866a19e87..802abf580cf0 100644
>> --- a/arch/powerpc/include/asm/kexec_ranges.h
>> +++ b/arch/powerpc/include/asm/kexec_ranges.h
>> @@ -7,6 +7,7 @@
>>   void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
>>   struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
>>   int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
>> +int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 
>> size);
>>   int add_tce_mem_ranges(struct crash_mem **mem_ranges);
>>   int add_initrd_mem_range(struct crash_mem **mem_ranges);
>>   #ifdef CONFIG_PPC_64S_HASH_MMU
>> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
>> index 43fcd78c2102..4673f150f973 100644
>> --- a/arch/powerpc/kexec/core_64.c
>> +++ b/arch/powerpc/kexec/core_64.c
>> @@ -19,8 +19,11 @@
>>   #include <linux/of.h>
>>   #include <linux/libfdt.h>
>>   #include <linux/memblock.h>
>> +#include <linux/memory.h>
>>     #include <asm/page.h>
>> +#include <asm/drmem.h>
>> +#include <asm/mmzone.h>
>>   #include <asm/current.h>
>>   #include <asm/machdep.h>
>>   #include <asm/cacheflush.h>
>> @@ -546,6 +549,101 @@ int update_cpus_node(void *fdt)
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "crash hp: " fmt
>>   +/*
>> + * Advertise preferred elfcorehdr size to userspace via
>> + * /sys/kernel/crash_elfcorehdr_size sysfs interface.
>> + */
>> +unsigned int arch_crash_get_elfcorehdr_size(void)
>> +{
>> +    unsigned int sz;
>> +    unsigned long elf_phdr_cnt;
>> +
>> +    /* Program header for CPU notes and vmcoreinfo */
>> +    elf_phdr_cnt = 2;
>> +    if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
>> +        /* In the worst case, a Phdr is needed for every other LMB 
>> to be
>> +         * represented as an individual crash range.
>> +         */
>> +        elf_phdr_cnt += memory_hotplug_max() / (2 * drmem_lmb_size());
>> +
>> +    /* Do not cross the max limit */
>> +    if (elf_phdr_cnt > PN_XNUM)
>> +        elf_phdr_cnt = PN_XNUM;
>> +
>> +    sz = sizeof(struct elfhdr) + (elf_phdr_cnt * sizeof(Elf64_Phdr));
>> +    return sz;
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
>> +            pr_err("Failed to remove hot-unplugged from crash memory 
>> ranges.\n");
>> +            return;
>> +        }
>> +    }
>> +
>> +    ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
>> +    if (ret) {
>> +        pr_err("Failed to prepare elf header\n");
>> +        return;
>> +    }
>> +
>
>
>
>> +    /*
>> +     * It is unlikely that kernel hit this because elfcorehdr kexec
>> +     * segment (memsz) is built with addition space to accommodate 
>> growing
>> +     * number of crash memory ranges while loading the kdump kernel. 
>> It is
>> +     * Just to avoid any unforeseen case.
>
> nitpick..
>
> s/Just/just/

Thanks I will fix it.

>
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
>> +    vfree(elfbuf);
>> +}
>> +
>>   /**
>>    * arch_crash_handle_hotplug_event - Handle crash CPU/Memory 
>> hotplug events to update the
>>    *                     necessary kexec segments based on the 
>> hotplug event.
>> @@ -556,7 +654,7 @@ int update_cpus_node(void *fdt)
>>    * CPU addition: Update the FDT segment to include the newly added 
>> CPU.
>>    * CPU removal: No action is needed, with the assumption that it's 
>> okay to have offline CPUs
>>    *        as part of the FDT.
>> - * Memory addition/removal: No action is taken as this is not yet 
>> supported.
>> + * Memory addition/removal: Recreate the elfcorehdr segment
>>    */
>>   void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>   {
>> @@ -570,7 +668,6 @@ void arch_crash_handle_hotplug_event(struct 
>> kimage *image, void *arg)
>>           return;
>
>>       } else if (hp_action == KEXEC_CRASH_HP_ADD_CPU) {
>> -
>
>>           void *fdt, *ptr;
>>           unsigned long mem;
>>           int i, fdt_index = -1;
>> @@ -605,8 +702,10 @@ void arch_crash_handle_hotplug_event(struct 
>> kimage *image, void *arg)
>
>>       } else if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY ||
>>              hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
>
>> -        pr_info_once("Crash update is not supported for memory 
>> hotplug\n");
>> -        return;
>> +        struct memory_notify *mn;
>> +
>> +        mn = (struct memory_notify *)arg;
>> +        update_crash_elfcorehdr(image, mn);
>>       }
>
> Use switch case statement for hotplug actions for better readability..

Sure.

Thanks,
Sourabh
