Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 651064E7A29
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 19:04:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ92y27Wnz30RH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 05:04:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FveZDiYw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQ92B3V2Qz2yg3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Mar 2022 05:03:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FveZDiYw; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KQ92B310Nz4xYc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Mar 2022 05:03:46 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KQ92B2wqWz4xcj; Sat, 26 Mar 2022 05:03:46 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FveZDiYw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KQ92B0gjMz4xYc
 for <linuxppc-dev@ozlabs.org>; Sat, 26 Mar 2022 05:03:45 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PGjuiK002802; 
 Fri, 25 Mar 2022 18:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jrkF7URpv0NYIBTkwuiIr+0gfwGij+7l3+Y51++kn90=;
 b=FveZDiYwjhS7Pxe0WyLNPxV8Y5XQLbtVGaQ72zBNFFfLi4hWtaJKLmhszXcsDI7RvGMs
 AB4LKH7Vp815CpvU1eRLEFJsydEb4FsJfAuFON3ouCZnvdwiFEY6giq3y0Nb0QYSKQgL
 x4iScxMIfYIUkaaDjfVzztY+Sc3kiQuKG1HNWsWmmHUeo1EwuqkGLnlVsG1CC7C9LR/s
 cyFYkqRjCmtcZHK6PpdWP0WEiYTSPEBX9xTDuqgxEBg0LaNOA3uyspzDa7x9qNtoQY2J
 7BcaX75cXfUwKanm5OckNkVKH0/VzJJBLuZfNbHqtcvVXsrJ2CRwQRsGPl45gbKxDkIE Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0mwuf3e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 18:03:34 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22PI1wcF002037;
 Fri, 25 Mar 2022 18:03:34 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0mwuf3du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 18:03:34 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22PHwPC7025807;
 Fri, 25 Mar 2022 18:03:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ew6t95sjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 18:03:31 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PI3TfY37224908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 18:03:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E03435204E;
 Fri, 25 Mar 2022 18:03:28 +0000 (GMT)
Received: from [9.145.35.34] (unknown [9.145.35.34])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A0C2B52050;
 Fri, 25 Mar 2022 18:03:28 +0000 (GMT)
Message-ID: <b9cf2d6a-7fec-3ef3-0600-1b09ee7c1c37@linux.ibm.com>
Date: Fri, 25 Mar 2022 19:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC v3 PATCH 4/5] powerpc/crash hp: add crash hotplug support
 for kexec_file_load
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
 <20220321080422.56255-5-sourabhjain@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220321080422.56255-5-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SVKX4C8HAsAD59jGkWRjyODjiaMHLbXH
X-Proofpoint-ORIG-GUID: vW_h9jaxyy9t4nF20tB3QITheherQgGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_05,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250099
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
 kexec@lists.infradead.org, hbathini@linux.ibm.com, bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/03/2022, 09:04:21, Sourabh Jain wrote:
> Two major changes are done to enable the crash CPU hotplug handler.
> Firstly, updated the kexec_load path to prepare kimage for hotplug
> changes and secondly, implemented the crash hotplug handler itself.
> 
> On the kexec load path, memsz allocation of crash FDT segment is
> updated to ensure that it has sufficient buffer space to accommodate
> future hot add CPUs. Initialized the kimage members to track the FDT
> segment.
> 
> The crash hotplug handler updates the cpus node of crash FDT. While
> we update crash FDT the kexec_crash_image is marked invalid and restored
> after FDT update to avoid race.
> 
> Since memory crash hotplug support is not there yet the crash hotplug
> handler simply warn the user and return.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/kexec/core_64.c | 46 ++++++++++++++++++++++++++++++++++++
>  arch/powerpc/kexec/elf_64.c  | 40 +++++++++++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
> 
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 249d2632526d..a470fe6904e3 100644
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
> +
> +	/* crash update on memory hotplug is not support yet */
> +	if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
> +		pr_err("crash hp: crash update is not supported with memory hotplug\n");
		
May be pr_info_once() that's not really an error ?

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
> index eeb258002d1e..2ffe6d69e186 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -24,6 +24,33 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  
> +
> +#ifdef CONFIG_CRASH_HOTPLUG
> +#define MAX_CORE 256

Why not computing something based on nr_cpus_ids and threads_per_core instead?

> +#define PER_CORE_NODE_SIZE 1500

Is that size function of threadsd_per_core too?

> +> +/**
> + * get_crash_fdt_mem_sz() - calcuate mem size for crash kernel FDT
> + * @fdt: pointer to crash kernel FDT
> + *
> + * Calculate the buffer space needed to add more CPU nodes in FDT after
> + * capture kenrel load due to hot add events.
              kernel
> + *
> + * Some assumption are made to calculate the additional buffer size needed
> + * to accommodate future hot add CPUs to the crash FDT. The maximum core count
> + * in the system would not go beyond MAX_CORE and memory needed to store per core
> + * date in FDT is PER_CORE_NODE_SIZE.
> + *
> + * Certainly MAX_CORE count can be replaced with possible core count and
> + * PER_CORE_NODE_SIZE to some standard value instead of randomly observed
> + * core size value on Power9 LPAR.

See above.

> + */
> +static unsigned int get_crash_fdt_mem_sz(void *fdt)
> +{
> +	return fdt_totalsize(fdt) + (PER_CORE_NODE_SIZE * MAX_CORE);

I guess fdt_totalsize() is already taken in account the online CPUs, isn't it?
If that's the case, you should add the remaining needed part only.

> +}
> +#endif
> +
>  static void *elf64_load(struct kimage *image, char *kernel_buf,
>  			unsigned long kernel_len, char *initrd,
>  			unsigned long initrd_len, char *cmdline,
> @@ -123,6 +150,19 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
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

