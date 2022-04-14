Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF65A5018AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 18:33:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfQ5361Bsz3bdy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 02:33:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q3TySc62;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfQ4F1LbBz2y8R
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 02:33:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=q3TySc62; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KfQ475pfPz4xL4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 02:32:55 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KfQ475WPWz4xNp; Fri, 15 Apr 2022 02:32:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=q3TySc62; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KfQ472DXmz4xL4
 for <linuxppc-dev@ozlabs.org>; Fri, 15 Apr 2022 02:32:55 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23EEZ7jX011022; 
 Thu, 14 Apr 2022 16:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=teBOdYeyPiJmgSzG7r7Iqcxx5eTb7+6cpKVk0z0eIac=;
 b=q3TySc62TZ/6Koxnsvzlws5B0OE4jMvr+Qwa5jBc2WhE6Lbzhos+qdKvUoQ9B1Ifoemk
 JUz/3m56vxUqvl8AOXll5UaWs9Am9I5L78njYodEgZAeTffnnbCXTNBWc1pVr+4klCC7
 asUM1tGvEc5mkHF4msjqXd2pSiFnqOivkc4WX8IQX0VzFZw+8UDhm6ivynvu9+hDAwDA
 hsDKndjgeJEIrt1vN3rVOXtAFQ3CDiSC3aFxEOo1oQdr/p9m6kBAwHLGl2Znjm7rRaA7
 pzYrrMpMBh2l/Zuplc/enYUmIC16ooLpWwwWmydMLQZ59gX+pPrfR6MwxRV6JbqqAtcg 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fegst8vjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 16:32:38 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23EGWc5e032171;
 Thu, 14 Apr 2022 16:32:38 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fegst8vht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 16:32:38 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23EGHeMi017070;
 Thu, 14 Apr 2022 16:32:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3fbsj063p6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 16:32:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23EGWXqI45547900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Apr 2022 16:32:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4218411C052;
 Thu, 14 Apr 2022 16:32:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E574E11C04C;
 Thu, 14 Apr 2022 16:32:32 +0000 (GMT)
Received: from [9.145.94.207] (unknown [9.145.94.207])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Apr 2022 16:32:32 +0000 (GMT)
Message-ID: <20a85683-a2bf-e6dc-8d34-cc0c88496928@linux.ibm.com>
Date: Thu, 14 Apr 2022 18:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC v4 PATCH 4/5] powerpc/crash hp: add crash hotplug support
 for kexec_file_load
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
 <20220411084357.157308-5-sourabhjain@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220411084357.157308-5-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x7Q7ddvopX0rmiqIu1QRzYJvOerqiYj1
X-Proofpoint-ORIG-GUID: -nz0otXxfRYZ65qFw0cAXPS3bPnCKq6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_04,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204140088
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com,
 kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/04/2022, 10:43:56, Sourabh Jain wrote:
> Two major changes are done to enable the crash CPU hotplug handler.
> Firstly, updated the kexec load path to prepare kimage for hotplug
> changes, and secondly, implemented the crash hotplug handler.
> 
> On the kexec load path, the memsz allocation of the crash FDT segment
> is updated to ensure that it has sufficient buffer space to accommodate
> future hot add CPUs. Initialized the kimage members to track the kexec
> FDT segment.
> 
> The crash hotplug handler updates the cpus node of crash FDT. While we
> update crash FDT the kexec_crash_image is marked invalid and restored
> after FDT update to avoid race.
> 
> Since memory crash hotplug support is not there yet the crash hotplug
> the handler simply warns the user and returns.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/kexec/core_64.c | 46 ++++++++++++++++++++++
>  arch/powerpc/kexec/elf_64.c  | 74 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
> 
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 249d2632526d..62f77cc86407 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -466,6 +466,52 @@ int update_cpus_node(void *fdt)
>  	return ret;
>  }
>  
> +#ifdef CONFIG_CRASH_HOTPLUG
> +/**
> + * arch_crash_hotplug_handler() - Handle hotplug FDT changes
> + * @image: the active struct kimage
> + * @hp_action: the hot un/plug action being handled
> + * @a: first parameter dependent upon hp_action
> + * @b: first parameter dependent upon hp_action
> + *
> + * To accurately reflect CPU hot un/plug changes, the FDT
> + * must be updated with the new list of CPUs and memories.
> + */
> +void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
> +				unsigned long a, unsigned long b)
> +{
> +	void *fdt;
> +
> +	/* No action needed for CPU hot-unplug */
> +	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
> +		return;

I should have report since in the previous version too, why nothing is done
when CPU are removed?

> +
> +	/* crash update on memory hotplug is not support yet */
> +	if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
> +		pr_info_once("crash hp: crash update is not supported with memory hotplug\n");
> +		return;
> +	}
> +
> +	/* Must have valid FDT index */
> +	if (!image->arch.fdt_index_valid) {
> +		pr_err("crash hp: unable to locate FDT segment");
> +		return;
> +	}
> +
> +	fdt = __va((void *)image->segment[image->arch.fdt_index].mem);
> +
> +	/* Temporarily invalidate the crash image while it is replaced */
> +	xchg(&kexec_crash_image, NULL);
> +
> +	/* update FDT to refelect changes to CPU resrouces */
> +	if (update_cpus_node(fdt))
> +		pr_err("crash hp: failed to update crash FDT");
> +
> +	/* The crash image is now valid once again */
> +	xchg(&kexec_crash_image, image);
> +}
> +#endif /* CONFIG_CRASH_HOTPLUG */
> +
>  #ifdef CONFIG_PPC_64S_HASH_MMU
>  /* Values we need to export to the second kernel via the device tree. */
>  static unsigned long htab_base;
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index eeb258002d1e..9dc774548ce4 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -24,6 +24,67 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  
> +#include <asm/kvm_book3s.h>
> +#include <asm/kvm_ppc.h>
> +
> +#ifdef CONFIG_CRASH_HOTPLUG
> +
> +/**
> + * get_cpu_node_sz() - Calculate the space needed to store a CPU device type node
> + *                     in FDT. The calculation is done based on the existing CPU
> + *                     node in unflatten device tree. Loop through all the
> + *                     properties of the very first CPU type device node found in
> + *                     unflatten device tree and returns the sum of the property
> + *                     length and property string size of all properties of a CPU
> + *                     node.
> + */

I don't think this is following the indent rules.

> +static int get_cpu_node_sz(void) {
> +	struct device_node *dn = NULL;
> +	struct property *pp;
> +	int cpu_node_size = 0;
> +
> +	dn = of_find_node_by_type(NULL, "cpu");
> +
> +	if (!dn) {
> +		pr_warn("Unable to locate cpu device_type node.\n");
> +		goto out;
> +	}
> +
> +	/* Every node in FDT starts with FDT_BEGIN_NODE and ends with
> +	 * FDT_END_NODE that takes one byte each.
> +	 */
> +	cpu_node_size = 2;
> +
> +	for_each_property_of_node(dn, pp) {
> +		/* For each property add two bytes extra. One for string null
> +		 * character for property name and other for FDT property start
> +		 * tag FDT_PROP.
> +		 */

Coding style request to start with a blank comment line for multiple
comment lines.

> +		cpu_node_size = cpu_node_size + pp->length + strlen(pp->name) + 2;
> +	}
> +
> +out:
> +	return cpu_node_size;
> +}
> +
> +/**
> + * get_crash_fdt_mem_sz() - calcuate mem size for crash kernel FDT
> + * @fdt: pointer to crash kernel FDT
> + *
> + * Calculate the buffer space needed to add more CPU nodes in crash FDT
> + * post capture kenrel load due to CPU hotplug events.
> + */
> +static unsigned int get_crash_fdt_mem_sz(void *fdt)
> +{
> +	int fdt_cpu_nodes_sz, offline_cpu_cnt;
> +
> +	offline_cpu_cnt = (num_possible_cpus() - num_present_cpus()) / MAX_SMT_THREADS;
> +	fdt_cpu_nodes_sz = get_cpu_node_sz() * offline_cpu_cnt;
> +
> +	return fdt_totalsize(fdt) + fdt_cpu_nodes_sz;
> +}
> +#endif
> +
>  static void *elf64_load(struct kimage *image, char *kernel_buf,
>  			unsigned long kernel_len, char *initrd,
>  			unsigned long initrd_len, char *cmdline,
> @@ -123,6 +184,19 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  	kbuf.buf_align = PAGE_SIZE;
>  	kbuf.top_down = true;
>  	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
> +
> +#ifdef CONFIG_CRASH_HOTPLUG
> +	if (image->type == KEXEC_TYPE_CRASH) {
> +		kbuf.memsz = get_crash_fdt_mem_sz(fdt);
> +		fdt_set_totalsize(fdt, kbuf.memsz);
> +		image->arch.fdt_index = image->nr_segments;
> +		image->arch.fdt_index_valid = true;
> +	} else
> +#endif
> +	{
> +		kbuf.memsz = fdt_totalsize(fdt);
> +	}
> +
>  	ret = kexec_add_buffer(&kbuf);
>  	if (ret)
>  		goto out_free_fdt;

