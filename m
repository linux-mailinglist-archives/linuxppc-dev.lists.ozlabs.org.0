Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2821E6B7D6C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:27:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb29g0Rkyz3cLC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 03:27:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jEJOGOD/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb20N45hRz3cjF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:19:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jEJOGOD/;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Pb20N3gkhz4x4r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:19:00 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Pb20N3c7Tz4x5R; Tue, 14 Mar 2023 03:19:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jEJOGOD/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Pb20N1LbCz4x4r
	for <linuxppc-dev@ozlabs.org>; Tue, 14 Mar 2023 03:19:00 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32DErl69031884;
	Mon, 13 Mar 2023 16:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sk/zhX+MZmMRyNGz/YjxsJfOmQ26B0S/YX6WsMSN5bU=;
 b=jEJOGOD/HSVnmyNwebuOGS2vqsrIhvGvGYY0eVmKq/0bZ2vTlRQDOsBJk7fy7bc08zpI
 PGtSsjhxB1ha5YaCBgMMU3Px8VdDTiwmn8P60A1jYSjskVKeFoFgw0J2yVhaYswNaxOH
 RJVa6IGtgy+jHM/UULapGQ4t80H2oRh8BA01fiknAhL7DM6AXqtNoQwMeh6f1hOyhw5L
 ZtunUT3t5QK3ytTNZHxSLPIrki99IfQ0aiAkvVaAoopjq9JqjbAH3o4B1Hxk7oz/EQUx
 nQj9XMlK9lvglenhk9NPrv1cAcBu+Vy2YmO0U7LGBo8rUFJ9q/NqnLl4FtqoSw5FkD3C DA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa60dtgkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 16:18:47 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DErmYJ031918;
	Mon, 13 Mar 2023 16:18:46 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa60dtgjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 16:18:46 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DCvikX015761;
	Mon, 13 Mar 2023 16:18:44 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3p8h96jt20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 16:18:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32DGIeZL40894962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Mar 2023 16:18:40 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C8542004B;
	Mon, 13 Mar 2023 16:18:40 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2BD820043;
	Mon, 13 Mar 2023 16:18:39 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Mar 2023 16:18:39 +0000 (GMT)
Message-ID: <d2346e25-56f0-f198-43cd-efdf73321f09@linux.ibm.com>
Date: Mon, 13 Mar 2023 17:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v9 1/6] powerpc/kexec: turn some static helper functions
 public
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
 <20230312181154.278900-2-sourabhjain@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20230312181154.278900-2-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Mfh-fOOz55VIWrT_2K_0_1vEo45tft9i
X-Proofpoint-GUID: 4UZXnQnVyTjSzpwLbt9sNd8towLY1FZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_07,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303130125
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/03/2023 19:11:49, Sourabh Jain wrote:
> Move update_cpus_node and get_crash_memory_ranges functions from
> kexec/file_load.c to kexec/core_64.c to make these functions usable
        file_load_64.c
> by other kexec compoenets.
                 components
> 
> Later in the series, these functions are utilized to do in-kernel update to
> kexec segments on CPU/Memory hotplug events for both kexec_load and
> kexec_file_load syscalls.
> 
> No functional change intended.
>

FWIW, despite the 2 minor typos above,

Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>

> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kexec.h  |   6 ++
>  arch/powerpc/kexec/core_64.c      | 166 ++++++++++++++++++++++++++++++
>  arch/powerpc/kexec/file_load_64.c | 162 -----------------------------
>  3 files changed, 172 insertions(+), 162 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index a1ddba01e7d13..8090ad7d97d9d 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -99,6 +99,12 @@ void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_co
>  
>  void kexec_copy_flush(struct kimage *image);
>  
> +#ifdef CONFIG_PPC64
> +struct crash_mem;
> +int update_cpus_node(void *fdt);
> +int get_crash_memory_ranges(struct crash_mem **mem_ranges);
> +#endif
> +
>  #if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
>  void crash_free_reserved_phys_range(unsigned long begin, unsigned long end);
>  #define crash_free_reserved_phys_range crash_free_reserved_phys_range
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index a79e28c91e2be..0b292f93a74cc 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -17,6 +17,8 @@
>  #include <linux/cpu.h>
>  #include <linux/hardirq.h>
>  #include <linux/of.h>
> +#include <linux/libfdt.h>
> +#include <linux/memblock.h>
>  
>  #include <asm/page.h>
>  #include <asm/current.h>
> @@ -30,6 +32,8 @@
>  #include <asm/hw_breakpoint.h>
>  #include <asm/svm.h>
>  #include <asm/ultravisor.h>
> +#include <asm/kexec_ranges.h>
> +#include <asm/crashdump-ppc64.h>
>  
>  int machine_kexec_prepare(struct kimage *image)
>  {
> @@ -377,6 +381,168 @@ void default_machine_kexec(struct kimage *image)
>  	/* NOTREACHED */
>  }
>  
> +/**
> + * get_crash_memory_ranges - Get crash memory ranges. This list includes
> + *                           first/crashing kernel's memory regions that
> + *                           would be exported via an elfcore.
> + * @mem_ranges:              Range list to add the memory ranges to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int get_crash_memory_ranges(struct crash_mem **mem_ranges)
> +{
> +	phys_addr_t base, end;
> +	struct crash_mem *tmem;
> +	u64 i;
> +	int ret;
> +
> +	for_each_mem_range(i, &base, &end) {
> +		u64 size = end - base;
> +
> +		/* Skip backup memory region, which needs a separate entry */
> +		if (base == BACKUP_SRC_START) {
> +			if (size > BACKUP_SRC_SIZE) {
> +				base = BACKUP_SRC_END + 1;
> +				size -= BACKUP_SRC_SIZE;
> +			} else
> +				continue;
> +		}
> +
> +		ret = add_mem_range(mem_ranges, base, size);
> +		if (ret)
> +			goto out;
> +
> +		/* Try merging adjacent ranges before reallocation attempt */
> +		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
> +			sort_memory_ranges(*mem_ranges, true);
> +	}
> +
> +	/* Reallocate memory ranges if there is no space to split ranges */
> +	tmem = *mem_ranges;
> +	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
> +		tmem = realloc_mem_ranges(mem_ranges);
> +		if (!tmem)
> +			goto out;
> +	}
> +
> +	/* Exclude crashkernel region */
> +	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
> +	if (ret)
> +		goto out;
> +
> +	/*
> +	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
> +	 *        regions are exported to save their context at the time of
> +	 *        crash, they should actually be backed up just like the
> +	 *        first 64K bytes of memory.
> +	 */
> +	ret = add_rtas_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_opal_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	/* create a separate program header for the backup region */
> +	ret = add_mem_range(mem_ranges, BACKUP_SRC_START, BACKUP_SRC_SIZE);
> +	if (ret)
> +		goto out;
> +
> +	sort_memory_ranges(*mem_ranges, false);
> +out:
> +	if (ret)
> +		pr_err("Failed to setup crash memory ranges\n");
> +	return ret;
> +}
> +
> +/**
> + * add_node_props - Reads node properties from device node structure and add
> + *                  them to fdt.
> + * @fdt:            Flattened device tree of the kernel
> + * @node_offset:    offset of the node to add a property at
> + * @dn:             device node pointer
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int add_node_props(void *fdt, int node_offset, const struct device_node *dn)
> +{
> +	int ret = 0;
> +	struct property *pp;
> +
> +	if (!dn)
> +		return -EINVAL;
> +
> +	for_each_property_of_node(dn, pp) {
> +		ret = fdt_setprop(fdt, node_offset, pp->name, pp->value, pp->length);
> +		if (ret < 0) {
> +			pr_err("Unable to add %s property: %s\n", pp->name, fdt_strerror(ret));
> +			return ret;
> +		}
> +	}
> +	return ret;
> +}
> +
> +/**
> + * update_cpus_node - Update cpus node of flattened device tree using of_root
> + *                    device node.
> + * @fdt:              Flattened device tree of the kernel.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +int update_cpus_node(void *fdt)
> +{
> +	struct device_node *cpus_node, *dn;
> +	int cpus_offset, cpus_subnode_offset, ret = 0;
> +
> +	cpus_offset = fdt_path_offset(fdt, "/cpus");
> +	if (cpus_offset < 0 && cpus_offset != -FDT_ERR_NOTFOUND) {
> +		pr_err("Malformed device tree: error reading /cpus node: %s\n",
> +		       fdt_strerror(cpus_offset));
> +		return cpus_offset;
> +	}
> +
> +	if (cpus_offset > 0) {
> +		ret = fdt_del_node(fdt, cpus_offset);
> +		if (ret < 0) {
> +			pr_err("Error deleting /cpus node: %s\n", fdt_strerror(ret));
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* Add cpus node to fdt */
> +	cpus_offset = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"), "cpus");
> +	if (cpus_offset < 0) {
> +		pr_err("Error creating /cpus node: %s\n", fdt_strerror(cpus_offset));
> +		return -EINVAL;
> +	}
> +
> +	/* Add cpus node properties */
> +	cpus_node = of_find_node_by_path("/cpus");
> +	ret = add_node_props(fdt, cpus_offset, cpus_node);
> +	of_node_put(cpus_node);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Loop through all subnodes of cpus and add them to fdt */
> +	for_each_node_by_type(dn, "cpu") {
> +		cpus_subnode_offset = fdt_add_subnode(fdt, cpus_offset, dn->full_name);
> +		if (cpus_subnode_offset < 0) {
> +			pr_err("Unable to add %s subnode: %s\n", dn->full_name,
> +			       fdt_strerror(cpus_subnode_offset));
> +			ret = cpus_subnode_offset;
> +			goto out;
> +		}
> +
> +		ret = add_node_props(fdt, cpus_subnode_offset, dn);
> +		if (ret < 0)
> +			goto out;
> +	}
> +out:
> +	of_node_put(dn);
> +	return ret;
> +}
> +
>  #ifdef CONFIG_PPC_64S_HASH_MMU
>  /* Values we need to export to the second kernel via the device tree. */
>  static unsigned long htab_base;
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 110d28bede2a7..5b0b3f61e0e72 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -133,81 +133,6 @@ static int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>  	return ret;
>  }
>  
> -/**
> - * get_crash_memory_ranges - Get crash memory ranges. This list includes
> - *                           first/crashing kernel's memory regions that
> - *                           would be exported via an elfcore.
> - * @mem_ranges:              Range list to add the memory ranges to.
> - *
> - * Returns 0 on success, negative errno on error.
> - */
> -static int get_crash_memory_ranges(struct crash_mem **mem_ranges)
> -{
> -	phys_addr_t base, end;
> -	struct crash_mem *tmem;
> -	u64 i;
> -	int ret;
> -
> -	for_each_mem_range(i, &base, &end) {
> -		u64 size = end - base;
> -
> -		/* Skip backup memory region, which needs a separate entry */
> -		if (base == BACKUP_SRC_START) {
> -			if (size > BACKUP_SRC_SIZE) {
> -				base = BACKUP_SRC_END + 1;
> -				size -= BACKUP_SRC_SIZE;
> -			} else
> -				continue;
> -		}
> -
> -		ret = add_mem_range(mem_ranges, base, size);
> -		if (ret)
> -			goto out;
> -
> -		/* Try merging adjacent ranges before reallocation attempt */
> -		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
> -			sort_memory_ranges(*mem_ranges, true);
> -	}
> -
> -	/* Reallocate memory ranges if there is no space to split ranges */
> -	tmem = *mem_ranges;
> -	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
> -		tmem = realloc_mem_ranges(mem_ranges);
> -		if (!tmem)
> -			goto out;
> -	}
> -
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
> -	if (ret)
> -		goto out;
> -
> -	/*
> -	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
> -	 *        regions are exported to save their context at the time of
> -	 *        crash, they should actually be backed up just like the
> -	 *        first 64K bytes of memory.
> -	 */
> -	ret = add_rtas_mem_range(mem_ranges);
> -	if (ret)
> -		goto out;
> -
> -	ret = add_opal_mem_range(mem_ranges);
> -	if (ret)
> -		goto out;
> -
> -	/* create a separate program header for the backup region */
> -	ret = add_mem_range(mem_ranges, BACKUP_SRC_START, BACKUP_SRC_SIZE);
> -	if (ret)
> -		goto out;
> -
> -	sort_memory_ranges(*mem_ranges, false);
> -out:
> -	if (ret)
> -		pr_err("Failed to setup crash memory ranges\n");
> -	return ret;
> -}
> -
>  /**
>   * get_reserved_memory_ranges - Get reserve memory ranges. This list includes
>   *                              memory regions that should be added to the
> @@ -1018,93 +943,6 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>  	return extra_size;
>  }
>  
> -/**
> - * add_node_props - Reads node properties from device node structure and add
> - *                  them to fdt.
> - * @fdt:            Flattened device tree of the kernel
> - * @node_offset:    offset of the node to add a property at
> - * @dn:             device node pointer
> - *
> - * Returns 0 on success, negative errno on error.
> - */
> -static int add_node_props(void *fdt, int node_offset, const struct device_node *dn)
> -{
> -	int ret = 0;
> -	struct property *pp;
> -
> -	if (!dn)
> -		return -EINVAL;
> -
> -	for_each_property_of_node(dn, pp) {
> -		ret = fdt_setprop(fdt, node_offset, pp->name, pp->value, pp->length);
> -		if (ret < 0) {
> -			pr_err("Unable to add %s property: %s\n", pp->name, fdt_strerror(ret));
> -			return ret;
> -		}
> -	}
> -	return ret;
> -}
> -
> -/**
> - * update_cpus_node - Update cpus node of flattened device tree using of_root
> - *                    device node.
> - * @fdt:              Flattened device tree of the kernel.
> - *
> - * Returns 0 on success, negative errno on error.
> - */
> -static int update_cpus_node(void *fdt)
> -{
> -	struct device_node *cpus_node, *dn;
> -	int cpus_offset, cpus_subnode_offset, ret = 0;
> -
> -	cpus_offset = fdt_path_offset(fdt, "/cpus");
> -	if (cpus_offset < 0 && cpus_offset != -FDT_ERR_NOTFOUND) {
> -		pr_err("Malformed device tree: error reading /cpus node: %s\n",
> -		       fdt_strerror(cpus_offset));
> -		return cpus_offset;
> -	}
> -
> -	if (cpus_offset > 0) {
> -		ret = fdt_del_node(fdt, cpus_offset);
> -		if (ret < 0) {
> -			pr_err("Error deleting /cpus node: %s\n", fdt_strerror(ret));
> -			return -EINVAL;
> -		}
> -	}
> -
> -	/* Add cpus node to fdt */
> -	cpus_offset = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"), "cpus");
> -	if (cpus_offset < 0) {
> -		pr_err("Error creating /cpus node: %s\n", fdt_strerror(cpus_offset));
> -		return -EINVAL;
> -	}
> -
> -	/* Add cpus node properties */
> -	cpus_node = of_find_node_by_path("/cpus");
> -	ret = add_node_props(fdt, cpus_offset, cpus_node);
> -	of_node_put(cpus_node);
> -	if (ret < 0)
> -		return ret;
> -
> -	/* Loop through all subnodes of cpus and add them to fdt */
> -	for_each_node_by_type(dn, "cpu") {
> -		cpus_subnode_offset = fdt_add_subnode(fdt, cpus_offset, dn->full_name);
> -		if (cpus_subnode_offset < 0) {
> -			pr_err("Unable to add %s subnode: %s\n", dn->full_name,
> -			       fdt_strerror(cpus_subnode_offset));
> -			ret = cpus_subnode_offset;
> -			goto out;
> -		}
> -
> -		ret = add_node_props(fdt, cpus_subnode_offset, dn);
> -		if (ret < 0)
> -			goto out;
> -	}
> -out:
> -	of_node_put(dn);
> -	return ret;
> -}
> -
>  static int copy_property(void *fdt, int node_offset, const struct device_node *dn,
>  			 const char *propname)
>  {

