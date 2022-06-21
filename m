Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C72552DC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 11:00:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LS0pJ6BRqz3bk7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 19:00:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n0437zon;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LS0nX5HHnz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 18:59:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n0437zon;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LS0nX587Hz4xYC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 18:59:28 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4LS0nX551Wz4xYD; Tue, 21 Jun 2022 18:59:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n0437zon;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4LS0nX27g9z4xYC
	for <linuxppc-dev@ozlabs.org>; Tue, 21 Jun 2022 18:59:28 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L8MfLU002079;
	Tue, 21 Jun 2022 08:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9QSiJLr9rFvG9IsQcH+vrpXPHg5yeQ3UUD0HemvLOak=;
 b=n0437zonrPAweAdixHS4xmuCM5d3PXzR6ZxD73lxYENyOreZCKOF/D85BLpkkLsz8On5
 OCsGeFtmHmDnn0bztPGhne5pca3yW3rQBFK3wqUflzxXdrRLsOPHmmFZO94ZUrsH44ov
 TgHTv0F2qHO0fblwRJ15sc/EOWnRc4AENPgd3Yps/YMCu0fTseQOUmomqTGTBSaan77M
 fhcEFHd9cQD0MI9d6hNWiThL9pwW8pu4meA/C5sPaH1/2Y0cbQoggruNi0Cucd1d4JlO
 rRl35szmICd5neGSNRwujIxfSjp8/uvx07u+LNcaThmovQVlsqqjULYrik40CuM/v1p8 wA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gu8b8ctbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jun 2022 08:59:15 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25L7mX0N025842;
	Tue, 21 Jun 2022 08:59:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gu8b8ctax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jun 2022 08:59:14 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25L8pgLw015674;
	Tue, 21 Jun 2022 08:59:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3gs6b93qcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jun 2022 08:59:13 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25L8xFnq16712018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 08:59:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1DCDAE055;
	Tue, 21 Jun 2022 08:59:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9269DAE04D;
	Tue, 21 Jun 2022 08:59:09 +0000 (GMT)
Received: from [9.145.4.7] (unknown [9.145.4.7])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jun 2022 08:59:09 +0000 (GMT)
Message-ID: <2df3da07-9384-d8b2-15f5-b124538b93c2@linux.ibm.com>
Date: Tue, 21 Jun 2022 10:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v5 1/5] powerpc/kexec: make update_cpus_node non-static
Content-Language: fr
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20220620070106.93141-1-sourabhjain@linux.ibm.com>
 <20220620070106.93141-2-sourabhjain@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220620070106.93141-2-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xuE0eHp_5TAqd5f70xtgvJEbGlsHlhgI
X-Proofpoint-ORIG-GUID: 1MAYFnzZaqPZEDtg-TVT1vpENA4EjQYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_03,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1011 phishscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206210036
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

On 20/06/2022, 09:01:02, Sourabh Jain wrote:
> Make the update_cpus_node function non-static and export it for
> usage in other kexec components.
> 
> The update_cpus_node definition is moved to core_64.c so that it
> can be used with both kexec_load and kexec_file_load system calls.
> 
> No functional change intended.

And FWIW
Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kexec.h  |  1 +
>  arch/powerpc/kexec/core_64.c      | 88 +++++++++++++++++++++++++++++++
>  arch/powerpc/kexec/file_load_64.c | 87 ------------------------------
>  3 files changed, 89 insertions(+), 87 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index 2aefe14e1442..c8040c93b15a 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -129,6 +129,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image);
>  int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>  			unsigned long initrd_load_addr,
>  			unsigned long initrd_len, const char *cmdline);
> +int update_cpus_node(void *fdt);
>  #endif /* CONFIG_PPC64 */
>  
>  #endif /* CONFIG_KEXEC_FILE */
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 6cc7793b8420..65b3afb2169a 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -16,6 +16,7 @@
>  #include <linux/kernel.h>
>  #include <linux/cpu.h>
>  #include <linux/hardirq.h>
> +#include <linux/libfdt.h>
>  
>  #include <asm/page.h>
>  #include <asm/current.h>
> @@ -377,6 +378,93 @@ void default_machine_kexec(struct kimage *image)
>  	/* NOTREACHED */
>  }
>  
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
> index 07da6bf1cf24..57f991b0a9da 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -951,93 +951,6 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>  	return (unsigned int)(usm_entries * sizeof(u64));
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
>  /**
>   * setup_new_fdt_ppc64 - Update the flattend device-tree of the kernel
>   *                       being loaded.

