Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FAB6EC9A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 12:00:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4gcT5B5Tz3fC2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 20:00:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wq5dV8ei;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4gbX1NsVz3bjk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 19:59:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wq5dV8ei;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Q4gbL5zd7z4x91
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 19:59:42 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Q4gbL5xkBz4xDr; Mon, 24 Apr 2023 19:59:42 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wq5dV8ei;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Q4gbL2yx4z4x91
	for <linuxppc-dev@ozlabs.org>; Mon, 24 Apr 2023 19:59:42 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33O9tVTQ014963;
	Mon, 24 Apr 2023 09:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EcjbUVynZyo2WXWKN/PmLNztxjbkYfjAwPvWTRSgkEo=;
 b=Wq5dV8ei5J5Uyt1IMyOjfSkCynpyiuKoKMWpU+dKPgSDeeqTyk/bhVPTK/yYIn5RsMXi
 wc5xDxE7ZDeilChamyF191AVK614BI51inYLmFWyNewoi5OWiL3pbVpcAwRi4Ze1WX2M
 Z4yz79xnRf9KAEjCTAF8OSNxBmvNv6zECvoNdNF0p5QxksF92lxtgxSiQplUsbQ3b6QJ
 fFu8dI0ikmaL5ZFkwacZiVx1N1DXazbkxn4bV+gCOdYDadublIdP3XnSQma75TLos5Rt
 6fGoR3WDM/gjSXoNiqzkOG8hSMLXQ5HVfpx4ogjeZ3tFMce/UdM1bn+A+YTuElNm/AYv +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q44sh0319-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 09:59:33 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33O9a5Pl014161;
	Mon, 24 Apr 2023 09:59:33 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q44sh030c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 09:59:32 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33O5lAYT013460;
	Mon, 24 Apr 2023 09:59:31 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3q47770uxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 09:59:31 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33O9xRnL36241984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 09:59:27 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A005520040;
	Mon, 24 Apr 2023 09:59:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2AE6F2004B;
	Mon, 24 Apr 2023 09:59:27 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Apr 2023 09:59:27 +0000 (GMT)
Message-ID: <d54027bb-2a58-13b4-6094-61b1a2293480@linux.ibm.com>
Date: Mon, 24 Apr 2023 11:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v10 3/5] powerpc/crash: add crash CPU hotplug support
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230423105213.70795-1-sourabhjain@linux.ibm.com>
 <20230423105213.70795-4-sourabhjain@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20230423105213.70795-4-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 03A5RHUGHD6lulcFBXa2AFfNAZ7kdKEs
X-Proofpoint-ORIG-GUID: WnrJU_mwSvHlZNWDjnDCMrLVuPMnijpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_06,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304240085
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
Cc: bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, Laurent Dufour <laurent.dufour@fr.ibm.com>, eric.devolder@oracle.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/04/2023 12:52:11, Sourabh Jain wrote:
> Introduce powerpc crash hotplug handler to update the necessary kexec
> segments in the kernel on CPU/Memory hotplug events. Currently, these
> updates are done by monitoring CPU/Memory hotplug events in userspace.
> 
> A common crash hotplug handler is triggered from generic infrastructure
> for both CPU/Memory hotplug events. But in this patch, crash updates are
> handled only for CPU hotplug events. Support for the crash update on
> memory hotplug events is added in upcoming patches.
> 
> The elfcorehdr segment is used to exchange the CPU and other
> dump-related information between the kernels. Ideally, the elfcorehdr
> segment needs to be recreated on CPU hotplug events to reflect the
> changes. But on powerpc, the elfcorehdr is built with possible CPUs
> hence there is no need to update/recreate the elfcorehdr on CPU hotplug
> events.
> 
> In addition to elfcorehdr, there is another kexec segment that holds CPU
> data on powerpc is FDT (Flattened Device Tree). During the kdump kernel
> boot, it is expected that the crashing CPU must be present in FDT, else
> kdump kernel boot fails.
> 
> Now the only action needed on powerpc to handle the crash CPU hotplug
> event is to add hot added CPUs in the kdump FDT segment to avoid kdump
> kernel boot failure. So for the CPU hot add event, the FDT segment is
> updated with hot added CPU and Since there is no need to remove the hot
> unplugged CPUs from the FDT segment hence no action was taken for CPU
> hot remove event.
> 
> To accommodate a growing number of CPUs, FDT is built with additional
> buffer space to ensure that it can hold possible CPU nodes.
> 
> The changes done here will also work for the kexec_load system call
> given that the kexec tool builds the FDT segment with additional space
> to accommodate possible CPU nodes.
> 
> Since memory crash hotplug support is not there yet the crash hotplug
> the handler simply warns the user and returns.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com
I don't remember sending a review-by on this patch earlier, do you?

> ---
>  arch/powerpc/include/asm/kexec.h  |  4 ++
>  arch/powerpc/kexec/core_64.c      | 61 +++++++++++++++++++++++++++++++
>  arch/powerpc/kexec/elf_64.c       | 12 +++++-
>  arch/powerpc/kexec/file_load_64.c | 14 +++++++
>  4 files changed, 90 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index 8090ad7d97d9d..f01ba767af56e 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -103,6 +103,10 @@ void kexec_copy_flush(struct kimage *image);
>  struct crash_mem;
>  int update_cpus_node(void *fdt);
>  int get_crash_memory_ranges(struct crash_mem **mem_ranges);
> +#if defined(CONFIG_CRASH_HOTPLUG)
> +void arch_crash_handle_hotplug_event(struct kimage *image);
> +#define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
> +#endif
>  #endif
>  
>  #if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 0b292f93a74cc..611b89bcea2be 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -543,6 +543,67 @@ int update_cpus_node(void *fdt)
>  	return ret;
>  }
>  
> +#if defined(CONFIG_CRASH_HOTPLUG)
> +#undef pr_fmt
> +#define pr_fmt(fmt) "crash hp: " fmt
> +
> +/**
> + * arch_crash_hotplug_handler() - Handle crash CPU/Memory hotplug events to update the
> + *                                necessary kexec segments based on the hotplug event.
> + * @image: the active struct kimage
> + *
> + * Update FDT segment to include newly added CPU. No action for CPU remove case.
> + */
> +void arch_crash_handle_hotplug_event(struct kimage *image)
> +{
> +	void *fdt, *ptr;
> +	unsigned long mem;
> +	int i, fdt_index = -1;
> +	unsigned int hp_action = image->hp_action;
> +
> +	/*
> +	 * Since the hot-unplugged CPU is already part of crash FDT,
> +	 * no action is needed for CPU remove case.
> +	 */
> +	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
> +		return;
> +
> +	/* crash update on memory hotplug events is not supported yet */
> +	if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
> +		pr_info_once("Crash update is not supported for memory hotplug\n");
> +		return;
> +	}
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
> +	/* update FDT to refelect changes in CPU resrouces */
> +	if (update_cpus_node(fdt))
> +		pr_err("Failed to update crash FDT");
> +
> +	/* The crash image is now valid once again */
> +	xchg(&kexec_crash_image, image);
> +}
> +#endif
> +
>  #ifdef CONFIG_PPC_64S_HASH_MMU
>  /* Values we need to export to the second kernel via the device tree. */
>  static unsigned long htab_base;
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index eeb258002d1e0..d8f6d967231e8 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -30,6 +30,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  			unsigned long cmdline_len)
>  {
>  	int ret;
> +	bool do_pack_fdt = true;
>  	unsigned long kernel_load_addr;
>  	unsigned long initrd_load_addr = 0, fdt_load_addr;
>  	void *fdt;
> @@ -116,7 +117,16 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  	if (ret)
>  		goto out_free_fdt;
>  
> -	fdt_pack(fdt);
> +#if defined(CONFIG_CRASH_HOTPLUG)
> +	/*
> +	 * Do not pack FDT, additional space is reserved to accommodate
> +	 * possible CPU nodes which are not yet present in the system.
> +	 */
> +	if (image->type == KEXEC_TYPE_CRASH)
> +		do_pack_fdt = false;
> +#endif
> +	if (do_pack_fdt)
> +		fdt_pack(fdt);
>  
>  	kbuf.buffer = fdt;
>  	kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 5b0b3f61e0e72..3554168687869 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -908,6 +908,9 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>  	unsigned int cpu_nodes, extra_size = 0;
>  	struct device_node *dn;
>  	u64 usm_entries;
> +#if defined(CONFIG_CRASH_HOTPLUG)
> +	unsigned int possible_cpu_nodes;
> +#endif
>  
>  	// Budget some space for the password blob. There's already extra space
>  	// for the key name
> @@ -940,6 +943,17 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>  	if (cpu_nodes > boot_cpu_node_count)
>  		extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
>  
> +#if defined(CONFIG_CRASH_HOTPLUG)
> +	/*
> +	 * Make sure enough space is reserved to accommodate possible CPU nodes
> +	 * in the crash FDT. This allows packing possible CPU nodes which are
> +	 * not yet present in the system without regenerating the entire FDT.
> +	 */
> +	possible_cpu_nodes = num_possible_cpus() / threads_per_core;
> +	if (image->type == KEXEC_TYPE_CRASH && possible_cpu_nodes > cpu_nodes)
> +		extra_size += (possible_cpu_nodes - cpu_nodes) * cpu_node_size();
> +#endif
> +
>  	return extra_size;
>  }
>  

