Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AD286F08C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 14:22:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pz1qBErb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tn5Gd1BVdz3vhM
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Mar 2024 00:22:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pz1qBErb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tn5D01BBdz3vfq
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Mar 2024 00:20:00 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Tn5D00cVxz4wcT
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Mar 2024 00:20:00 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Tn5D00YP5z4wcb; Sun,  3 Mar 2024 00:20:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pz1qBErb;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Tn5Cz5Dzwz4wcT
	for <linuxppc-dev@ozlabs.org>; Sun,  3 Mar 2024 00:19:59 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 422CTewr019867;
	Sat, 2 Mar 2024 13:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=pp1;
 bh=soZqkCfYuA3lHVzgUbbBf5wEmakhZ0acXTVzyul/Cdg=;
 b=Pz1qBErbvjJn9iXFLXi//i8P8pK1aPJPgmrMFqx58XDq7C6QC82Lq/qqpGqBGzV7nvBg
 gCynSvW1GMEMVFVcCDBxAFFHGdSs5Tpjg4feZR5z7eemxlHNGzMB4GybPyA7u1+r1FIN
 cVeJlYPCN1/uG/tI7Sa+hVy6wZBZf39urel/Q6UvwbfOLD2Vd5A81fHM9dqJ5itSi+qy
 6RMrVdeZcAsjHAE3nPJ3qsAaTNV0e5z3LD5ksejCilcGRebt7rvrvyhXRh6y8ZpIuwZR
 ZCkEEsIxPGybqg2/vRyc4VlDg16QgqUFvhkV20WnMEsqbmNDbpb1shraCjWR2KMFMUJZ YA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wm45r8r1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:19:14 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 422DJDEQ015406;
	Sat, 2 Mar 2024 13:19:13 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wm45r8r0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:19:13 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 422AOmLw021316;
	Sat, 2 Mar 2024 13:19:11 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfusptvdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:19:11 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 422DJ5UK34275612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 2 Mar 2024 13:19:07 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 529B020043;
	Sat,  2 Mar 2024 13:19:05 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43D4E20040;
	Sat,  2 Mar 2024 13:18:59 +0000 (GMT)
Received: from [9.43.41.117] (unknown [9.43.41.117])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  2 Mar 2024 13:18:59 +0000 (GMT)
Message-ID: <c8753ef1-3030-45be-8226-78ab6803f679@linux.ibm.com>
Date: Sat, 2 Mar 2024 18:48:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v17 5/6] powerpc/crash: add crash CPU hotplug support
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5RDKFawhYYt_3BUhvGdEe6j4XHYVQ-Uk
X-Proofpoint-GUID: GwQUuHaYowDuAv-QLvy7jZS0Wx7cCidp
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 26/02/24 2:11 pm, Sourabh Jain wrote:
> Due to CPU/Memory hotplug or online/offline events, the elfcorehdr
> (which describes the CPUs and memory of the crashed kernel) and FDT
> (Flattened Device Tree) of kdump image becomes outdated. Consequently,
> attempting dump collection with an outdated elfcorehdr or FDT can lead
> to failed or inaccurate dump collection.
> 
> Going forward, CPU hotplug or online/offline events are referred as
> CPU/Memory add/remove events.
> 
> The current solution to address the above issue involves monitoring the
> CPU/Memory add/remove events in userspace using udev rules and whenever
> there are changes in CPU and memory resources, the entire kdump image
> is loaded again. The kdump image includes kernel, initrd, elfcorehdr,
> FDT, purgatory. Given that only elfcorehdr and FDT get outdated due to
> CPU/Memory add/remove events, reloading the entire kdump image is
> inefficient. More importantly, kdump remains inactive for a substantial
> amount of time until the kdump reload completes.
> 
> To address the aforementioned issue, commit 247262756121 ("crash: add
> generic infrastructure for crash hotplug support") added a generic
> infrastructure that allows architectures to selectively update the kdump
> image component during CPU or memory add/remove events within the kernel
> itself.
> 
> In the event of a CPU or memory add/remove events, the generic crash
> hotplug event handler, `crash_handle_hotplug_event()`, is triggered. It
> then acquires the necessary locks to update the kdump image and invokes
> the architecture-specific crash hotplug handler,
> `arch_crash_handle_hotplug_event()`, to update the required kdump image
> components.
> 
> This patch adds crash hotplug handler for PowerPC and enable support to
> update the kdump image on CPU add/remove events. Support for memory
> add/remove events is added in a subsequent patch with the title
> "powerpc: add crash memory hotplug support"
> 
> As mentioned earlier, only the elfcorehdr and FDT kdump image components
> need to be updated in the event of CPU or memory add/remove events.
> However, on PowerPC architecture crash hotplug handler only updates the
> FDT to enable crash hotplug support for CPU add/remove events. Here's
> why.
> 
> The elfcorehdr on PowerPC is built with possible CPUs, and thus, it does
> not need an update on CPU add/remove events. On the other hand, the FDT
> needs to be updated on CPU add events to include the newly added CPU. If
> the FDT is not updated and the kernel crashes on a newly added CPU, the
> kdump kernel will fail to boot due to the unavailability of the crashing
> CPU in the FDT. During the early boot, it is expected that the boot CPU
> must be a part of the FDT; otherwise, the kernel will raise a BUG and
> fail to boot. For more information, refer to commit 36ae37e3436b0
> ("powerpc: Make boot_cpuid common between 32 and 64-bit"). Since it is
> okay to have an offline CPU in the kdump FDT, no action is taken in case
> of CPU removal.
> 
> There are two system calls, `kexec_file_load` and `kexec_load`, used to
> load the kdump image. Few changes have been made to ensure kernel can
> safely update the FDT of kdump image loaded using both system calls.
> 
> For kexec_file_load syscall the kdump image is prepared in kernel. So to
> support an increasing number of CPUs, the FDT is constructed with extra
> buffer space to ensure it can accommodate a possible number of CPU
> nodes. Additionally, a call to fdt_pack (which trims the unused space
> once the FDT is prepared) is avoided if this feature is enabled.
> 
> For the kexec_load syscall, the FDT is updated only if the
> KEXEC_CRASH_HOTPLUG_SUPPORT kexec flag is passed to the kernel by
> userspace (kexec tools). When userspace passes this flag to the kernel,
> it indicates that the FDT is built to accommodate possible CPUs, and the
> FDT segment is excluded from SHA calculation, making it safe to update.
> 
> The changes related to this feature are kept under the CRASH_HOTPLUG
> config, and it is enabled by default.
> 

Looks good.

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
>   arch/powerpc/Kconfig              |   4 ++
>   arch/powerpc/include/asm/kexec.h  |   8 +++
>   arch/powerpc/kexec/crash.c        | 103 ++++++++++++++++++++++++++++++
>   arch/powerpc/kexec/elf_64.c       |   3 +-
>   arch/powerpc/kexec/file_load_64.c |  17 +++++
>   5 files changed, 134 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e377deefa2dc..16d2b20574c4 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -686,6 +686,10 @@ config ARCH_SELECTS_CRASH_DUMP
>   	depends on CRASH_DUMP
>   	select RELOCATABLE if PPC64 || 44x || PPC_85xx
>   
> +config ARCH_SUPPORTS_CRASH_HOTPLUG
> +	def_bool y
> +	depends on PPC64
> +
>   config FA_DUMP
>   	bool "Firmware-assisted dump"
>   	depends on CRASH_DUMP && PPC64 && (PPC_RTAS || PPC_POWERNV)
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index d9ff4d0e392d..e75970351bcd 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -135,6 +135,14 @@ static inline void crash_setup_regs(struct pt_regs *newregs,
>   		ppc_save_regs(newregs);
>   }
>   
> +#ifdef CONFIG_CRASH_HOTPLUG
> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
> +#define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
> +
> +int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
> +#define arch_crash_hotplug_support arch_crash_hotplug_support
> +#endif /* CONFIG_CRASH_HOTPLUG */
> +
>   extern int crashing_cpu;
>   extern void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *));
>   extern void crash_ipi_callback(struct pt_regs *regs);
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index ef5c2d25ec39..8938a19af12f 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -16,6 +16,7 @@
>   #include <linux/delay.h>
>   #include <linux/irq.h>
>   #include <linux/types.h>
> +#include <linux/libfdt.h>
>   
>   #include <asm/processor.h>
>   #include <asm/machdep.h>
> @@ -392,3 +393,105 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
>   	if (ppc_md.kexec_cpu_down)
>   		ppc_md.kexec_cpu_down(1, 0);
>   }
> +
> +#ifdef CONFIG_CRASH_HOTPLUG
> +#undef pr_fmt
> +#define pr_fmt(fmt) "crash hp: " fmt
> +
> +/**
> + * get_fdt_index - Loop through the kexec segment array and find
> + *		   the index of the FDT segment.
> + * @image: a pointer to kexec_crash_image
> + *
> + * Returns the index of FDT segment in the kexec segment array
> + * if found; otherwise -1.
> + */
> +static int get_fdt_index(struct kimage *image)
> +{
> +	void *ptr;
> +	unsigned long mem;
> +	int i, fdt_index = -1;
> +
> +	/* Find the FDT segment index in kexec segment array. */
> +	for (i = 0; i < image->nr_segments; i++) {
> +		mem = image->segment[i].mem;
> +		ptr = __va(mem);
> +
> +		if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
> +			fdt_index = i;
> +			break;
> +		}
> +	}
> +
> +	return fdt_index;
> +}
> +
> +/**
> + * update_crash_fdt - updates the cpus node of the crash FDT.
> + *
> + * @image: a pointer to kexec_crash_image
> + */
> +static void update_crash_fdt(struct kimage *image)
> +{
> +	void *fdt;
> +	int fdt_index;
> +
> +	fdt_index = get_fdt_index(image);
> +	if (fdt_index < 0) {
> +		pr_err("Unable to locate FDT segment.\n");
> +		return;
> +	}
> +
> +	fdt = __va((void *)image->segment[fdt_index].mem);
> +
> +	/* Temporarily invalidate the crash image while it is replaced */
> +	xchg(&kexec_crash_image, NULL);
> +
> +	/* update FDT to reflect changes in CPU resources */
> +	if (update_cpus_node(fdt))
> +		pr_err("Failed to update crash FDT");
> +
> +	/* The crash image is now valid once again */
> +	xchg(&kexec_crash_image, image);
> +}
> +
> +int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
> +{
> +#ifdef CONFIG_KEXEC_FILE
> +	if (image->file_mode)
> +		return 1;
> +#endif
> +	return kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT;
> +}
> +
> +/**
> + * arch_crash_handle_hotplug_event - Handle crash CPU/Memory hotplug events to update the
> + *				     necessary kexec segments based on the hotplug event.
> + * @image: a pointer to kexec_crash_image
> + * @arg: struct memory_notify handler for memory hotplug case and NULL for CPU hotplug case.
> + *
> + * Update the kdump image based on the type of hotplug event, represented by image->hp_action.
> + * CPU add: Update the FDT segment to include the newly added CPU.
> + * CPU remove: No action is needed, with the assumption that it's okay to have offline CPUs
> + *	       part of the FDT.
> + * Memory add/remove: No action is taken as this is not yet supported.
> + */
> +void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
> +{
> +	switch (image->hp_action) {
> +	case KEXEC_CRASH_HP_REMOVE_CPU:
> +		return;
> +
> +	case KEXEC_CRASH_HP_ADD_CPU:
> +		update_crash_fdt(image);
> +		break;
> +
> +	case KEXEC_CRASH_HP_REMOVE_MEMORY:
> +	case KEXEC_CRASH_HP_ADD_MEMORY:
> +		pr_info_once("Crash update is not supported for memory hotplug\n");
> +		return;
> +	default:
> +		pr_warn_once("Unknown hotplug action\n");
> +	}
> +}
> +#endif /* CONFIG_CRASH_HOTPLUG */
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index 6d8951e8e966..214c071c58ed 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -116,7 +116,8 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>   	if (ret)
>   		goto out_free_fdt;
>   
> -	fdt_pack(fdt);
> +	if (!IS_ENABLED(CONFIG_CRASH_HOTPLUG) || image->type != KEXEC_TYPE_CRASH)
> +		fdt_pack(fdt);
>   
>   	kbuf.buffer = fdt;
>   	kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 4b94c31e3172..2640a804fcdf 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -30,6 +30,7 @@
>   #include <asm/iommu.h>
>   #include <asm/prom.h>
>   #include <asm/plpks.h>
> +#include <asm/cputhreads.h>
>   
>   struct umem_info {
>   	__be64 *buf;		/* data buffer for usable-memory property */
> @@ -789,6 +790,9 @@ static unsigned int kdump_extra_fdt_size_ppc64(struct kimage *image)
>   	unsigned int cpu_nodes, extra_size = 0;
>   	struct device_node *dn;
>   	u64 usm_entries;
> +#ifdef CONFIG_CRASH_HOTPLUG
> +	unsigned int possible_cpu_nodes;
> +#endif
>   
>   	if (!IS_ENABLED(CONFIG_CRASH_DUMP) || image->type != KEXEC_TYPE_CRASH)
>   		return 0;
> @@ -816,6 +820,19 @@ static unsigned int kdump_extra_fdt_size_ppc64(struct kimage *image)
>   	if (cpu_nodes > boot_cpu_node_count)
>   		extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
>   
> +#ifdef CONFIG_CRASH_HOTPLUG
> +	/*
> +	 * Make sure enough space is reserved to accommodate possible CPU nodes
> +	 * in the crash FDT. This allows packing possible CPU nodes which are
> +	 * not yet present in the system without regenerating the entire FDT.
> +	 */
> +	if (image->type == KEXEC_TYPE_CRASH) {
> +		possible_cpu_nodes = num_possible_cpus() / threads_per_core;
> +		if (possible_cpu_nodes > cpu_nodes)
> +			extra_size += (possible_cpu_nodes - cpu_nodes) * cpu_node_size();
> +	}
> +#endif
> +
>   	return extra_size;
>   }
>   
