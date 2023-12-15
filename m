Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEC48141A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 07:01:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hTA/hLCu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Srz9d4sDXz3ckP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 17:01:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hTA/hLCu;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Srz8q1bzJz3c75
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 17:00:27 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Srz8n15GYz4xKb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 17:00:25 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Srz8n0ts0z4xKl; Fri, 15 Dec 2023 17:00:25 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hTA/hLCu;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Srz8m5hpZz4xKb
	for <linuxppc-dev@ozlabs.org>; Fri, 15 Dec 2023 17:00:24 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BF5VHwu001450;
	Fri, 15 Dec 2023 05:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Qh/cGgSyzWQqAhnXY2qpYHFgiruFaBd0S1c3QP5x9mQ=;
 b=hTA/hLCuK5JbYn8xrVAlM+qLRCZsIZiwz/Xf+cS4PB4ICYSF3G14bgsMMGHSz3p+sO00
 85i54ALEPHJbLWPNbjLXY0F3Bzdug/8W7vF4STgbiA7Rx/IF9hKcqTd1QCvu+4WtZx+m
 TszZ0tTR+cOWBVsTdo2yL0ccU//fMBN6xv9hl9tP7ANuiTRFcP5JmJTp3wVfDDoyxoWk
 +lYI/LjPnEZISPnWCtULmvIi6cQ9Q97iUtT9pq6iQxzeGxv8nbbGcNVyr6wxuP9JvyV5
 qLo35xGA1wUJ8rKG22gc0457aysA40tFjZMvrdB3D8uLtTj8G6LWzLO7UnqUI7cxbS4l NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v0fqd1ye2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 05:59:39 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BF5acFT015299;
	Fri, 15 Dec 2023 05:59:39 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v0fqd1ydu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 05:59:39 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BF33Asq005049;
	Fri, 15 Dec 2023 05:59:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw4skwnn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 05:59:37 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BF5xYIc12845796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Dec 2023 05:59:34 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9B6B2004B;
	Fri, 15 Dec 2023 05:59:34 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18B8620040;
	Fri, 15 Dec 2023 05:59:29 +0000 (GMT)
Received: from [9.79.186.169] (unknown [9.79.186.169])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Dec 2023 05:59:28 +0000 (GMT)
Message-ID: <c8f5893a-0f15-47a2-b8ee-90cbb77c24d8@linux.ibm.com>
Date: Fri, 15 Dec 2023 11:29:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/6] powerpc: add crash memory hotplug support
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
 <20231211083056.340404-7-sourabhjain@linux.ibm.com>
 <ZXuqjAsRlKP152YG@MiWiFi-R3L-srv>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZXuqjAsRlKP152YG@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JSHUtRSvLuPJCzyQAdXoULkbpu0ZVOgX
X-Proofpoint-ORIG-GUID: iZUhnQ3zWN3vIfCTIbmVK-UNlbW1SD70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_02,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312150034
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



On 15/12/23 06:53, Baoquan He wrote:
> On 12/11/23 at 02:00pm, Sourabh Jain wrote:
> ......
>> diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
>> index f83866a19e87..802abf580cf0 100644
>> --- a/arch/powerpc/include/asm/kexec_ranges.h
>> +++ b/arch/powerpc/include/asm/kexec_ranges.h
>> @@ -7,6 +7,7 @@
>>   void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
>>   struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
>>   int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
>> +int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
>>   int add_tce_mem_ranges(struct crash_mem **mem_ranges);
>>   int add_initrd_mem_range(struct crash_mem **mem_ranges);
>>   #ifdef CONFIG_PPC_64S_HASH_MMU
>> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
>> index 9932793cd64b..5be30659172f 100644
>> --- a/arch/powerpc/kexec/core_64.c
>> +++ b/arch/powerpc/kexec/core_64.c
>> @@ -19,8 +19,11 @@
>>   #include <linux/of.h>
>>   #include <linux/libfdt.h>
>>   #include <linux/memblock.h>
>> +#include <linux/memory.h>
>>   
>>   #include <asm/page.h>
>> +#include <asm/drmem.h>
>> +#include <asm/mmzone.h>
>>   #include <asm/current.h>
>>   #include <asm/machdep.h>
>>   #include <asm/cacheflush.h>
>> @@ -547,9 +550,7 @@ int update_cpus_node(void *fdt)
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "crash hp: " fmt
>>   
>> -#ifdef CONFIG_HOTPLUG_CPU
>> - /* Provides the value for the sysfs crash_hotplug nodes */
>> -int arch_crash_hotplug_cpu_support(struct kimage *image)
>> +static int crash_hotplug_support(struct kimage *image)
>>   {
>>   	if (image->file_mode)
>>   		return 1;
>> @@ -560,8 +561,118 @@ int arch_crash_hotplug_cpu_support(struct kimage *image)
>>   	 */
>>   	return image->update_elfcorehdr && image->update_fdt;
>>   }
>> +
>> +#ifdef CONFIG_HOTPLUG_CPU
>> + /* Provides the value for the sysfs crash_hotplug nodes */
>> +int arch_crash_hotplug_cpu_support(struct kimage *image)
>> +{
>> +	return crash_hotplug_support(image);
>> +}
>> +#endif
>> +
>> +#ifdef CONFIG_MEMORY_HOTPLUG
>> + /* Provides the value for the sysfs memory_hotplug nodes */
>> +int arch_crash_hotplug_memory_support(struct kimage *image)
>> +{
>> +	return crash_hotplug_support(image);
>> +}
>>   #endif
>>   
>> +/*
>> + * Advertise preferred elfcorehdr size to userspace via
>> + * /sys/kernel/crash_elfcorehdr_size sysfs interface.
>> + */
>> +unsigned int arch_crash_get_elfcorehdr_size(void)
>> +{
>> +	unsigned int sz;
>> +	unsigned long elf_phdr_cnt;
>> +
>> +	/* Program header for CPU notes and vmcoreinfo */
>> +	elf_phdr_cnt = 2;
>> +	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
>> +		/* In the worst case, a Phdr is needed for every other LMB to be
>> +		 * represented as an individual crash range.
>> +		 */
>> +		elf_phdr_cnt += memory_hotplug_max() / (2 * drmem_lmb_size());
>> +
>> +	/* Do not cross the max limit */
>> +	if (elf_phdr_cnt > PN_XNUM)
>> +		elf_phdr_cnt = PN_XNUM;
>> +
>> +	sz = sizeof(struct elfhdr) + (elf_phdr_cnt * sizeof(Elf64_Phdr));
>> +	return sz;
>> +}
>> +
>> +/**
>> + * update_crash_elfcorehdr() - Recreate the elfcorehdr and replace it with old
>> + *			       elfcorehdr in the kexec segment array.
>> + * @image: the active struct kimage
>> + * @mn: struct memory_notify data handler
>> + */
>> +static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *mn)
>> +{
>> +	int ret;
>> +	struct crash_mem *cmem = NULL;
>> +	struct kexec_segment *ksegment;
>> +	void *ptr, *mem, *elfbuf = NULL;
>> +	unsigned long elfsz, memsz, base_addr, size;
>> +
>> +	ksegment = &image->segment[image->elfcorehdr_index];
>> +	mem = (void *) ksegment->mem;
>> +	memsz = ksegment->memsz;
>> +
>> +	ret = get_crash_memory_ranges(&cmem);
>> +	if (ret) {
>> +		pr_err("Failed to get crash mem range\n");
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * The hot unplugged memory is part of crash memory ranges,
>> +	 * remove it here.
>> +	 */
>> +	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
>> +		base_addr = PFN_PHYS(mn->start_pfn);
>> +		size = mn->nr_pages * PAGE_SIZE;
>> +		ret = remove_mem_range(&cmem, base_addr, size);
> Althouth this is ppc specific, I don't understand. Why don't you
> recreate the elfcorehdr, but take removing the removed region. Comparing the
> remove_mem_range() implementation with recreating, I don't see too much
> benefit from that, and it makes your code more complicated. Just
> curious, surely ppc people can decide what should be taken.

I am recreating `elfcorehdr` by calling `crash_prepare_elf64_headers()` 
below.

This complexity is necessary to avoid adding hot-removed memory to the
new `elfcorehdr`.

On powerpc, the memblock list is utilized to prepare the `elfcorehdr`. 
In the
case of memory hot removal, the memblock list is updated after the arch
crash hotplug handler is triggered. Thus, the hot-removed memory is 
explicitly
removed from the crash memory ranges to ensure that the memory ranges
added to `elfcorehdr` do not include the hot-removed memory.

Thanks,
Sourabh Jain

>
>> +		if (ret) {
>> +			pr_err("Failed to remove hot-unplugged from crash memory ranges.\n");
>> +			return;
>> +		}
>> +	}
>> +
>> +	ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
>> +	if (ret) {
>> +		pr_err("Failed to prepare elf header\n");
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * It is unlikely that kernel hit this because elfcorehdr kexec
>> +	 * segment (memsz) is built with addition space to accommodate growing
>> +	 * number of crash memory ranges while loading the kdump kernel. It is
>> +	 * Just to avoid any unforeseen case.
>> +	 */
>> +	if (elfsz > memsz) {
>> +		pr_err("Updated crash elfcorehdr elfsz %lu > memsz %lu", elfsz, memsz);
>> +		goto out;
>> +	}
>> +
>> +	ptr = __va(mem);
>> +	if (ptr) {
>> +		/* Temporarily invalidate the crash image while it is replaced */
>> +		xchg(&kexec_crash_image, NULL);
>> +
>> +		/* Replace the old elfcorehdr with newly prepared elfcorehdr */
>> +		memcpy((void *)ptr, elfbuf, elfsz);
>> +
>> +		/* The crash image is now valid once again */
>> +		xchg(&kexec_crash_image, image);
>> +	}
>> +out:
>> +	vfree(elfbuf);
>> +}
>> +
>>   /**
>>    * arch_crash_handle_hotplug_event - Handle crash CPU/Memory hotplug events to update the
>>    *				     necessary kexec segments based on the hotplug event.
>> @@ -572,7 +683,7 @@ int arch_crash_hotplug_cpu_support(struct kimage *image)
>>    * CPU addition: Update the FDT segment to include the newly added CPU.
>>    * CPU removal: No action is needed, with the assumption that it's okay to have offline CPUs
>>    *		as part of the FDT.
>> - * Memory addition/removal: No action is taken as this is not yet supported.
>> + * Memory addition/removal: Recreate the elfcorehdr segment
>>    */
>>   void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>   {
>> @@ -593,7 +704,6 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>   		return;
>>   
>>   	} else if (hp_action == KEXEC_CRASH_HP_ADD_CPU) {
>> -
>>   		void *fdt, *ptr;
>>   		unsigned long mem;
>>   		int i, fdt_index = -1;
>> @@ -628,8 +738,10 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>>   
>>   	} else if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY ||
>>   		   hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
>> -		pr_info_once("Crash update is not supported for memory hotplug\n");
>> -		return;
>> +		struct memory_notify *mn;
>> +
>> +		mn = (struct memory_notify *)arg;
>> +		update_crash_elfcorehdr(image, mn);
>>   	}
>>   }
>>   #endif
>> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
>> index e2148a009701..2457d7ec2075 100644
>> --- a/arch/powerpc/kexec/file_load_64.c
>> +++ b/arch/powerpc/kexec/file_load_64.c
>> @@ -21,6 +21,8 @@
>>   #include <linux/memblock.h>
>>   #include <linux/slab.h>
>>   #include <linux/vmalloc.h>
>> +#include <linux/elf.h>
>> +
>>   #include <asm/setup.h>
>>   #include <asm/cputhreads.h>
>>   #include <asm/drmem.h>
>> @@ -740,7 +742,35 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
>>   
>>   	kbuf->buffer = headers;
>>   	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
>> -	kbuf->bufsz = kbuf->memsz = headers_sz;
>> +	kbuf->bufsz = headers_sz;
>> +#if defined(CONFIG_CRASH_HOTPLUG) && defined(CONFIG_MEMORY_HOTPLUG)
>> +	/* Adjust the elfcorehdr segment size to accommodate
>> +	 * future crash memory ranges.
>> +	 */
>> +	int max_lmb;
>> +	unsigned long pnum;
>> +
>> +	/* In the worst case, a Phdr is needed for every other LMB to be
>> +	 * represented as an individual crash range.
>> +	 */
>> +	max_lmb = memory_hotplug_max() / (2 * drmem_lmb_size());
>> +
>> +	/* Do not cross the Phdr max limit of the elf header.
>> +	 * Avoid counting Phdr for crash ranges (cmem->nr_ranges)
>> +	 * which are already part of elfcorehdr.
>> +	 */
>> +	if (max_lmb > PN_XNUM)
>> +		pnum = PN_XNUM - cmem->nr_ranges;
>> +	else
>> +		pnum = max_lmb - cmem->nr_ranges;
>> +
>> +	/* Additional buffer space for elfcorehdr to accommodate
>> +	 * future memory ranges.
>> +	 */
>> +	kbuf->memsz = headers_sz + pnum * sizeof(Elf64_Phdr);
>> +#else
>> +	kbuf->memsz = headers_sz;
>> +#endif
>>   	kbuf->top_down = false;
>>   
>>   	ret = kexec_add_buffer(kbuf);
>> @@ -750,7 +780,7 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
>>   	}
>>   
>>   	image->elf_load_addr = kbuf->mem;
>> -	image->elf_headers_sz = headers_sz;
>> +	image->elf_headers_sz = kbuf->memsz;
>>   	image->elf_headers = headers;
>>   out:
>>   	kfree(cmem);
>> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
>> index fb3e12f15214..4fd0c5d5607b 100644
>> --- a/arch/powerpc/kexec/ranges.c
>> +++ b/arch/powerpc/kexec/ranges.c
>> @@ -234,6 +234,91 @@ int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
>>   	return __add_mem_range(mem_ranges, base, size);
>>   }
>>   
>> +/**
>> + * remove_mem_range - Removes the given memory range from the range list.
>> + * @mem_ranges:    Range list to remove the memory range to.
>> + * @base:          Base address of the range to remove.
>> + * @size:          Size of the memory range to remove.
>> + *
>> + * (Re)allocates memory, if needed.
>> + *
>> + * Returns 0 on success, negative errno on error.
>> + */
>> +int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
>> +{
>> +	u64 end;
>> +	int ret = 0;
>> +	unsigned int i;
>> +	u64 mstart, mend;
>> +	struct crash_mem *mem_rngs = *mem_ranges;
>> +
>> +	if (!size)
>> +		return 0;
>> +
>> +	/*
>> +	 * Memory range are stored as start and end address, use
>> +	 * the same format to do remove operation.
>> +	 */
>> +	end = base + size - 1;
>> +
>> +	for (i = 0; i < mem_rngs->nr_ranges; i++) {
>> +		mstart = mem_rngs->ranges[i].start;
>> +		mend = mem_rngs->ranges[i].end;
>> +
>> +		/*
>> +		 * Memory range to remove is not part of this range entry
>> +		 * in the memory range list
>> +		 */
>> +		if (!(base >= mstart && end <= mend))
>> +			continue;
>> +
>> +		/*
>> +		 * Memory range to remove is equivalent to this entry in the
>> +		 * memory range list. Remove the range entry from the list.
>> +		 */
>> +		if (base == mstart && end == mend) {
>> +			for (; i < mem_rngs->nr_ranges - 1; i++) {
>> +				mem_rngs->ranges[i].start = mem_rngs->ranges[i+1].start;
>> +				mem_rngs->ranges[i].end = mem_rngs->ranges[i+1].end;
>> +			}
>> +			mem_rngs->nr_ranges--;
>> +			goto out;
>> +		}
>> +		/*
>> +		 * Start address of the memory range to remove and the
>> +		 * current memory range entry in the list is same. Just
>> +		 * move the start address of the current memory range
>> +		 * entry in the list to end + 1.
>> +		 */
>> +		else if (base == mstart) {
>> +			mem_rngs->ranges[i].start = end + 1;
>> +			goto out;
>> +		}
>> +		/*
>> +		 * End address of the memory range to remove and the
>> +		 * current memory range entry in the list is same.
>> +		 * Just move the end address of the current memory
>> +		 * range entry in the list to base - 1.
>> +		 */
>> +		else if (end == mend)  {
>> +			mem_rngs->ranges[i].end = base - 1;
>> +			goto out;
>> +		}
>> +		/*
>> +		 * Memory range to remove is not at the edge of current
>> +		 * memory range entry. Split the current memory entry into
>> +		 * two half.
>> +		 */
>> +		else {
>> +			mem_rngs->ranges[i].end = base - 1;
>> +			size = mem_rngs->ranges[i].end - end;
>> +			ret = add_mem_range(mem_ranges, end + 1, size);
>> +		}
>> +	}
>> +out:
>> +	return ret;
>> +}
>> +
>>   /**
>>    * add_tce_mem_ranges - Adds tce-table range to the given memory ranges list.
>>    * @mem_ranges:         Range list to add the memory range(s) to.
>> -- 
>> 2.41.0
>>

