Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBBE86F08B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 14:21:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZLHV84md;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tn5Fh2KzCz3vdD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Mar 2024 00:21:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZLHV84md;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tn5C35WWvz3vb7
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Mar 2024 00:19:11 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Tn5C353jCz4wcQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Mar 2024 00:19:11 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Tn5C350kVz4wcb; Sun,  3 Mar 2024 00:19:11 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZLHV84md;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Tn5C31tN4z4wcQ
	for <linuxppc-dev@ozlabs.org>; Sun,  3 Mar 2024 00:19:11 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 422D7rWl002326;
	Sat, 2 Mar 2024 13:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=pp1;
 bh=ytx/c6rgQwEAvDoySvIL0NcG+VvaX8vGwPDybxOisBI=;
 b=ZLHV84mdal8G52vfc9bXL2gOM7iRR0e8wa+D1u8+IiYb8/LnqAr65cCUKEV5oWygdg0r
 Tg3UyVbALjxX5WmQee5jbxL7w4DzrdPk32tXJOkuZkEmORsa0VsFjXqiuJD26/vmM9la
 gxQjJI0Xh/43EPgljdRfAmD8UTmGFS9xzUWYJ58XT8fGXvWIwkaNpj9pd0icC+O577/x
 AOP2k3mci7zeGvzqdCRIfPajjMHHmstJaf2Yayg5H4m3/JFSQtah0SblOzS3WJVAXiku
 DhOq1STOMfzarP0Y8uyMNgYawdDRYHJ/ct8QeQ7a/smG+OGEqqJfggLsqh4gRlljC96M 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wm4qhr45t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:18:51 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 422DC8Wx009733;
	Sat, 2 Mar 2024 13:18:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wm4qhr45k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:18:51 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 422DD35n008787;
	Sat, 2 Mar 2024 13:18:50 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wftsub6xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 02 Mar 2024 13:18:50 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 422DIiU137880252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 2 Mar 2024 13:18:47 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D764620043;
	Sat,  2 Mar 2024 13:18:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 926B520040;
	Sat,  2 Mar 2024 13:18:38 +0000 (GMT)
Received: from [9.43.41.117] (unknown [9.43.41.117])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  2 Mar 2024 13:18:38 +0000 (GMT)
Message-ID: <0a04d3ee-ada0-4efa-9096-8ccf0710a464@linux.ibm.com>
Date: Sat, 2 Mar 2024 18:48:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v17 4/6] PowerPC/kexec: make the update_cpus_node()
 function public
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2HdB74r1ExAkDaP-s_Jzbm-LOxfYQRMY
X-Proofpoint-ORIG-GUID: OE7CFyItRxMKLPwwKnwfUqWzvh7EEDC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-02_04,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403020115
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
> Move the update_cpus_node() from kexec/{file_load_64.c => core_64.c}
> to allow other kexec components to use it.
> 
> Later in the series, this function is used for in-kernel updates
> to the kdump image during CPU/memory hotplug or online/offline events for
> both kexec_load and kexec_file_load syscalls.
> 
> No functional changes are intended.
> 

Looks good to me.

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
>   arch/powerpc/include/asm/kexec.h  |  4 ++
>   arch/powerpc/kexec/core_64.c      | 91 +++++++++++++++++++++++++++++++
>   arch/powerpc/kexec/file_load_64.c | 87 -----------------------------
>   3 files changed, 95 insertions(+), 87 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index fdb90e24dc74..d9ff4d0e392d 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -185,6 +185,10 @@ static inline void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *))
>   
>   #endif /* CONFIG_CRASH_DUMP */
>   
> +#if defined(CONFIG_KEXEC_FILE) || defined(CONFIG_CRASH_DUMP)
> +int update_cpus_node(void *fdt);
> +#endif
> +
>   #ifdef CONFIG_PPC_BOOK3S_64
>   #include <asm/book3s/64/kexec.h>
>   #endif
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 762e4d09aacf..85050be08a23 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -17,6 +17,7 @@
>   #include <linux/cpu.h>
>   #include <linux/hardirq.h>
>   #include <linux/of.h>
> +#include <linux/libfdt.h>
>   
>   #include <asm/page.h>
>   #include <asm/current.h>
> @@ -30,6 +31,7 @@
>   #include <asm/hw_breakpoint.h>
>   #include <asm/svm.h>
>   #include <asm/ultravisor.h>
> +#include <asm/crashdump-ppc64.h>
>   
>   int machine_kexec_prepare(struct kimage *image)
>   {
> @@ -419,3 +421,92 @@ static int __init export_htab_values(void)
>   }
>   late_initcall(export_htab_values);
>   #endif /* CONFIG_PPC_64S_HASH_MMU */
> +
> +#if defined(CONFIG_KEXEC_FILE) || defined(CONFIG_CRASH_DUMP)
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
> +#endif /* CONFIG_KEXEC_FILE || CONFIG_CRASH_DUMP */
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 6a01f62b8fcf..4b94c31e3172 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -838,93 +838,6 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>   	return extra_size + kdump_extra_fdt_size_ppc64(image);
>   }
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
>   static int copy_property(void *fdt, int node_offset, const struct device_node *dn,
>   			 const char *propname)
>   {
