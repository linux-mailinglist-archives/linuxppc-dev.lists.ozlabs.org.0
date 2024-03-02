Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 579D386F08D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 14:23:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e8rzL7GO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tn5HQ6hVgz3vrF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Mar 2024 00:22:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e8rzL7GO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tn5DV4CxWz3dmy
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Mar 2024 00:20:26 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Tn5DV3dHYz4wcT
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Mar 2024 00:20:26 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Tn5DV3Yh0z4wcs; Sun,  3 Mar 2024 00:20:26 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e8rzL7GO;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Tn5DV14ssz4wcT
	for <linuxppc-dev@ozlabs.org>; Sun,  3 Mar 2024 00:20:25 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 422CTjsa019986;
	Sat, 2 Mar 2024 13:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=pp1;
 bh=Vnkn7r6H9kRff5dX9xOcRKMLEokVyztTe0AxDAhC0wI=;
 b=e8rzL7GObBsFRULW5WiiU+Zw80Kkzjc7oc8cZ7XlCueboubNCzDjazn3OqE5WDV2ErGN
 8uCKKSymk0Xyfhps3pUHGT3esBkmjb3YlROGg/Cf2xJ9c1UtBjX9ERaBR+u1vFdQ63yk
 Ln+VLedgpuBKai19iY2KgQFOVveaAXss2dMJuyjsh0UC7eFkFjyCR6hSKx95rpX9ixal
 GaMjc79l6RDZ9ZeTGGWjjarlR2+sUJZa2DaCdgh3VFl/xeGhOGObCUz6Rjg1woj2EptA
 hHeXLAA1cX3XrWLhUyWaHfMaSUTrVRzbnTvC+2GDaSF/QZRUGHHE3wwvw9/JMaGKRMnY MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wm45r8rj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:20:10 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 422DFTVN006544;
	Sat, 2 Mar 2024 13:20:09 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wm45r8rhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:20:09 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 422B6PmE023777;
	Sat, 2 Mar 2024 13:20:08 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0m2jk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:20:07 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 422DK2Gg28967678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 2 Mar 2024 13:20:04 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 592A92004E;
	Sat,  2 Mar 2024 13:20:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97C172004B;
	Sat,  2 Mar 2024 13:19:56 +0000 (GMT)
Received: from [9.43.41.117] (unknown [9.43.41.117])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  2 Mar 2024 13:19:56 +0000 (GMT)
Message-ID: <dadf3ccb-3202-4e3c-b1de-04518cdcb25b@linux.ibm.com>
Date: Sat, 2 Mar 2024 18:49:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v17 6/6] powerpc/crash: add crash memory hotplug support
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zf4UNnAMCq7Z_lejwfI7pK3r8IGX-KqC
X-Proofpoint-GUID: ERnuK3iGiaP-V_agIhOpKLiTHP-MsZv-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-02_04,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403020115
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



On 26/02/24 2:11 pm, Sourabh Jain wrote:
> Extend the arch crash hotplug handler, as introduced by the patch title
> ("powerpc: add crash CPU hotplug support"), to also support memory
> add/remove events.
> 
> Elfcorehdr describes the memory of the crash kernel to capture the
> kernel; hence, it needs to be updated if memory resources change due to
> memory add/remove events. Therefore, arch_crash_handle_hotplug_event()
> is updated to recreate the elfcorehdr and replace it with the previous
> one on memory add/remove events.
> 
> The memblock list is used to prepare the elfcorehdr. In the case of
> memory hot remove, the memblock list is updated after the arch crash
> hotplug handler is triggered, as depicted in Figure 1. Thus, the
> hot-removed memory is explicitly removed from the crash memory ranges
> to ensure that the memory ranges added to elfcorehdr do not include the
> hot-removed memory.
> 
>      Memory remove
>            |
>            v
>      Offline pages
>            |
>            v
>   Initiate memory notify call <----> crash hotplug handler
>   chain for MEM_OFFLINE event
>            |
>            v
>   Update memblock list
> 
>   	Figure 1
> 
> There are two system calls, `kexec_file_load` and `kexec_load`, used to
> load the kdump image. A few changes have been made to ensure that the
> kernel can safely update the elfcorehdr component of the kdump image for
> both system calls.
> 
> For the kexec_file_load syscall, kdump image is prepared in the kernel.
> To support an increasing number of memory regions, the elfcorehdr is
> built with extra buffer space to ensure that it can accommodate
> additional memory ranges in future.
> 
> For the kexec_load syscall, the elfcorehdr is updated only if the
> KEXEC_CRASH_HOTPLUG_SUPPORT kexec flag is passed to the kernel by the
> kexec tool. Passing this flag to the kernel indicates that the
> elfcorehdr is built to accommodate additional memory ranges and the
> elfcorehdr segment is not considered for SHA calculation, making it safe
> to update.
> 
> The changes related to this feature are kept under the CRASH_HOTPLUG
> config, and it is enabled by default.
> 

Overall, the patchset looks good. I tried out the changes too.

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Akhil Raj <lf32.dev@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Borislav Petkov (AMD) <bp@alien8.de>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Mimi Zohar <zohar@linux.ibm.com>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Cc: Vivek Goyal <vgoyal@redhat.com>
> Cc: kexec@lists.infradead.org
> Cc: x86@kernel.org
> ---
>   arch/powerpc/include/asm/kexec.h        |  3 +
>   arch/powerpc/include/asm/kexec_ranges.h |  1 +
>   arch/powerpc/kexec/crash.c              | 95 ++++++++++++++++++++++++-
>   arch/powerpc/kexec/file_load_64.c       | 20 +++++-
>   arch/powerpc/kexec/ranges.c             | 85 ++++++++++++++++++++++
>   5 files changed, 202 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index e75970351bcd..95a98b390d62 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -141,6 +141,9 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
>   
>   int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
>   #define arch_crash_hotplug_support arch_crash_hotplug_support
> +
> +unsigned int arch_crash_get_elfcorehdr_size(void);
> +#define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
>   #endif /* CONFIG_CRASH_HOTPLUG */
>   
>   extern int crashing_cpu;
> diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
> index 8489e844b447..14055896cbcb 100644
> --- a/arch/powerpc/include/asm/kexec_ranges.h
> +++ b/arch/powerpc/include/asm/kexec_ranges.h
> @@ -7,6 +7,7 @@
>   void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
>   struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
>   int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
> +int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
>   int get_exclude_memory_ranges(struct crash_mem **mem_ranges);
>   int get_reserved_memory_ranges(struct crash_mem **mem_ranges);
>   int get_crash_memory_ranges(struct crash_mem **mem_ranges);
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index 8938a19af12f..21b193e938a3 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -17,6 +17,7 @@
>   #include <linux/irq.h>
>   #include <linux/types.h>
>   #include <linux/libfdt.h>
> +#include <linux/memory.h>
>   
>   #include <asm/processor.h>
>   #include <asm/machdep.h>
> @@ -25,6 +26,7 @@
>   #include <asm/setjmp.h>
>   #include <asm/debug.h>
>   #include <asm/interrupt.h>
> +#include <asm/kexec_ranges.h>
>   
>   /*
>    * The primary CPU waits a while for all secondary CPUs to enter. This is to
> @@ -398,6 +400,94 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
>   #undef pr_fmt
>   #define pr_fmt(fmt) "crash hp: " fmt
>   
> +/*
> + * Advertise preferred elfcorehdr size to userspace via
> + * /sys/kernel/crash_elfcorehdr_size sysfs interface.
> + */
> +unsigned int arch_crash_get_elfcorehdr_size(void)
> +{
> +	unsigned long phdr_cnt;
> +
> +	/* A program header for possible CPUs + vmcoreinfo */
> +	phdr_cnt = num_possible_cpus() + 1;
> +	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG))
> +		phdr_cnt += CONFIG_CRASH_MAX_MEMORY_RANGES;
> +
> +	return sizeof(struct elfhdr) + (phdr_cnt * sizeof(Elf64_Phdr));
> +}
> +
> +/**
> + * update_crash_elfcorehdr() - Recreate the elfcorehdr and replace it with old
> + *			       elfcorehdr in the kexec segment array.
> + * @image: the active struct kimage
> + * @mn: struct memory_notify data handler
> + */
> +static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *mn)
> +{
> +	int ret;
> +	struct crash_mem *cmem = NULL;
> +	struct kexec_segment *ksegment;
> +	void *ptr, *mem, *elfbuf = NULL;
> +	unsigned long elfsz, memsz, base_addr, size;
> +
> +	ksegment = &image->segment[image->elfcorehdr_index];
> +	mem = (void *) ksegment->mem;
> +	memsz = ksegment->memsz;
> +
> +	ret = get_crash_memory_ranges(&cmem);
> +	if (ret) {
> +		pr_err("Failed to get crash mem range\n");
> +		return;
> +	}
> +
> +	/*
> +	 * The hot unplugged memory is part of crash memory ranges,
> +	 * remove it here.
> +	 */
> +	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
> +		base_addr = PFN_PHYS(mn->start_pfn);
> +		size = mn->nr_pages * PAGE_SIZE;
> +		ret = remove_mem_range(&cmem, base_addr, size);
> +		if (ret) {
> +			pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
> +			goto out;
> +		}
> +	}
> +
> +	ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
> +	if (ret) {
> +		pr_err("Failed to prepare elf header\n");
> +		goto out;
> +	}
> +
> +	/*
> +	 * It is unlikely that kernel hit this because elfcorehdr kexec
> +	 * segment (memsz) is built with addition space to accommodate growing
> +	 * number of crash memory ranges while loading the kdump kernel. It is
> +	 * Just to avoid any unforeseen case.
> +	 */
> +	if (elfsz > memsz) {
> +		pr_err("Updated crash elfcorehdr elfsz %lu > memsz %lu", elfsz, memsz);
> +		goto out;
> +	}
> +
> +	ptr = __va(mem);
> +	if (ptr) {
> +		/* Temporarily invalidate the crash image while it is replaced */
> +		xchg(&kexec_crash_image, NULL);
> +
> +		/* Replace the old elfcorehdr with newly prepared elfcorehdr */
> +		memcpy((void *)ptr, elfbuf, elfsz);
> +
> +		/* The crash image is now valid once again */
> +		xchg(&kexec_crash_image, image);
> +	}
> +out:
> +	kvfree(cmem);
> +	if (elfbuf)
> +		kvfree(elfbuf);
> +}
> +
>   /**
>    * get_fdt_index - Loop through the kexec segment array and find
>    *		   the index of the FDT segment.
> @@ -478,6 +568,8 @@ int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
>    */
>   void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>   {
> +	struct memory_notify *mn;
> +
>   	switch (image->hp_action) {
>   	case KEXEC_CRASH_HP_REMOVE_CPU:
>   		return;
> @@ -488,7 +580,8 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>   
>   	case KEXEC_CRASH_HP_REMOVE_MEMORY:
>   	case KEXEC_CRASH_HP_ADD_MEMORY:
> -		pr_info_once("Crash update is not supported for memory hotplug\n");
> +		mn = (struct memory_notify *)arg;
> +		update_crash_elfcorehdr(image, mn);
>   		return;
>   	default:
>   		pr_warn_once("Unknown hotplug action\n");
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 2640a804fcdf..925a69ad2468 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -595,6 +595,23 @@ static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
>   	}
>   }
>   
> +static unsigned int kdump_extra_elfcorehdr_size(struct crash_mem *cmem)
> +{
> +#if defined(CONFIG_CRASH_HOTPLUG) && defined(CONFIG_MEMORY_HOTPLUG)
> +	unsigned int extra_sz = 0;
> +
> +	if (CONFIG_CRASH_MAX_MEMORY_RANGES > (unsigned int)PN_XNUM)
> +		pr_warn("Number of Phdrs %u exceeds max\n", CONFIG_CRASH_MAX_MEMORY_RANGES);
> +	else if (cmem->nr_ranges >= CONFIG_CRASH_MAX_MEMORY_RANGES)
> +		pr_warn("Configured crash mem ranges may not be enough\n");
> +	else
> +		extra_sz = (CONFIG_CRASH_MAX_MEMORY_RANGES - cmem->nr_ranges) * sizeof(Elf64_Phdr);
> +
> +	return extra_sz;
> +#endif
> +	return 0;
> +}
> +
>   /**
>    * load_elfcorehdr_segment - Setup crash memory ranges and initialize elfcorehdr
>    *                           segment needed to load kdump kernel.
> @@ -626,7 +643,8 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
>   
>   	kbuf->buffer = headers;
>   	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
> -	kbuf->bufsz = kbuf->memsz = headers_sz;
> +	kbuf->bufsz = headers_sz;
> +	kbuf->memsz = headers_sz + kdump_extra_elfcorehdr_size(cmem);
>   	kbuf->top_down = false;
>   
>   	ret = kexec_add_buffer(kbuf);
> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
> index 297b8bc97b9f..00dfd62203bd 100644
> --- a/arch/powerpc/kexec/ranges.c
> +++ b/arch/powerpc/kexec/ranges.c
> @@ -618,4 +618,89 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>   		pr_err("Failed to setup crash memory ranges\n");
>   	return ret;
>   }
> +
> +/**
> + * remove_mem_range - Removes the given memory range from the range list.
> + * @mem_ranges:    Range list to remove the memory range to.
> + * @base:          Base address of the range to remove.
> + * @size:          Size of the memory range to remove.
> + *
> + * (Re)allocates memory, if needed.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
> +{
> +	u64 end;
> +	int ret = 0;
> +	unsigned int i;
> +	u64 mstart, mend;
> +	struct crash_mem *mem_rngs = *mem_ranges;
> +
> +	if (!size)
> +		return 0;
> +
> +	/*
> +	 * Memory range are stored as start and end address, use
> +	 * the same format to do remove operation.
> +	 */
> +	end = base + size - 1;
> +
> +	for (i = 0; i < mem_rngs->nr_ranges; i++) {
> +		mstart = mem_rngs->ranges[i].start;
> +		mend = mem_rngs->ranges[i].end;
> +
> +		/*
> +		 * Memory range to remove is not part of this range entry
> +		 * in the memory range list
> +		 */
> +		if (!(base >= mstart && end <= mend))
> +			continue;
> +
> +		/*
> +		 * Memory range to remove is equivalent to this entry in the
> +		 * memory range list. Remove the range entry from the list.
> +		 */
> +		if (base == mstart && end == mend) {
> +			for (; i < mem_rngs->nr_ranges - 1; i++) {
> +				mem_rngs->ranges[i].start = mem_rngs->ranges[i+1].start;
> +				mem_rngs->ranges[i].end = mem_rngs->ranges[i+1].end;
> +			}
> +			mem_rngs->nr_ranges--;
> +			goto out;
> +		}
> +		/*
> +		 * Start address of the memory range to remove and the
> +		 * current memory range entry in the list is same. Just
> +		 * move the start address of the current memory range
> +		 * entry in the list to end + 1.
> +		 */
> +		else if (base == mstart) {
> +			mem_rngs->ranges[i].start = end + 1;
> +			goto out;
> +		}
> +		/*
> +		 * End address of the memory range to remove and the
> +		 * current memory range entry in the list is same.
> +		 * Just move the end address of the current memory
> +		 * range entry in the list to base - 1.
> +		 */
> +		else if (end == mend)  {
> +			mem_rngs->ranges[i].end = base - 1;
> +			goto out;
> +		}
> +		/*
> +		 * Memory range to remove is not at the edge of current
> +		 * memory range entry. Split the current memory entry into
> +		 * two half.
> +		 */
> +		else {
> +			mem_rngs->ranges[i].end = base - 1;
> +			size = mem_rngs->ranges[i].end - end;
> +			ret = add_mem_range(mem_ranges, end + 1, size);
> +		}
> +	}
> +out:
> +	return ret;
> +}
>   #endif /* CONFIG_CRASH_DUMP */
