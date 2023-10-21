Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B92777D1E51
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Oct 2023 18:42:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DVUCQQln;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SCS0q4TnPz3vXy
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Oct 2023 03:42:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DVUCQQln;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SCRzt5jf2z2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Oct 2023 03:41:30 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39LGTjxq028062;
	Sat, 21 Oct 2023 16:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pOlx5uQ7uwTZ2ePVWXTzUIeGMx8CNPw4rhhB09zlnQM=;
 b=DVUCQQlnjfEe8Pi0b6WFs4/0ovLwn8n/8YbFdAvQV+11KDkdEsDU1le6jHiUNSBATrcq
 OJ+KtSa4VAJAQzhXIvnFvKTYUp04I12UDE5XoIFgFYAzbXnstX4/HyHvBOh1ucpS8bsY
 /TRdf3Tn2SqmibaiCXOKTsshGYlyFPPBc2ORVi3TLD/NfbpSioXS3040K33X8DT0H1Fh
 ZUPK0gcE00GUOVyRTdw6gC36hx7yE2UaYzvEfqFJyVLv0ku9mFBxpLWdxkWydAqfhfc0
 2mNm8LBE6Wz2gyKNjNxALMhV2KFES/uxIyWHsnFfPDKks00jxc5pbqdo/jX9Gwnu4bHq 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvj76g5kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Oct 2023 16:39:13 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39LGU7Mk028661;
	Sat, 21 Oct 2023 16:39:12 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tvj76g5ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Oct 2023 16:39:12 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39LD6pV8007084;
	Sat, 21 Oct 2023 16:39:12 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc27v6wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Oct 2023 16:39:11 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39LGd9te9568922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Oct 2023 16:39:09 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 000E52004B;
	Sat, 21 Oct 2023 16:39:08 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80C6720043;
	Sat, 21 Oct 2023 16:39:06 +0000 (GMT)
Received: from [9.43.13.19] (unknown [9.43.13.19])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 21 Oct 2023 16:39:06 +0000 (GMT)
Message-ID: <a9659afb-9ea7-534f-df46-de193c9701ca@linux.ibm.com>
Date: Sat, 21 Oct 2023 22:09:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCHv9 2/2] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
Content-Language: en-US
To: Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org
References: <20231017022806.4523-1-piliu@redhat.com>
 <20231017022806.4523-3-piliu@redhat.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20231017022806.4523-3-piliu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gG6X92HTyCj_04GU-umXMm5lGhcbPyCd
X-Proofpoint-ORIG-GUID: yiNYKZaKbwhZW3ouK43tBSar14whCRE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-21_09,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310210153
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


With this patch series applied first and kdump kernel boots fine
with nr_cpus=1 on both PowerNV and PowerVM platforms.

For both patches:
Tested-by: Sourabh Jain <sourabhjain@linux.ibm.com>

- Sourabh Jain


On 17/10/23 07:58, Pingfan Liu wrote:
> *** Idea ***
> For kexec -p, the boot cpu can be not the cpu0, this causes the problem
> of allocating memory for paca_ptrs[]. However, in theory, there is no
> requirement to assign cpu's logical id as its present sequence in the
> device tree. But there is something like cpu_first_thread_sibling(),
> which makes assumption on the mapping inside a core. Hence partially
> loosening the mapping, i.e. unbind the mapping of core while keep the
> mapping inside a core.
>
> *** Implement ***
> At this early stage, there are plenty of memory to utilize. Hence, this
> patch allocates interim memory to link the cpu info on a list, then
> reorder cpus by changing the list head. As a result, there is a rotate
> shift between the sequence number in dt and the cpu logical number.
>
> *** Result ***
> After this patch, a boot-cpu's logical id will always be mapped into the
> range [0,threads_per_core).
>
> Besides this, at this phase, all threads in the boot core are forced to
> be onlined. This restriction will be lifted in a later patch with
> extra effort.
>
> Signed-off-by: Pingfan Liu <piliu@redhat.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Wen Xiong <wenxiong@us.ibm.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Ming Lei <ming.lei@redhat.com>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: kexec@lists.infradead.org
> To: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/kernel/prom.c         | 25 +++++----
>   arch/powerpc/kernel/setup-common.c | 84 +++++++++++++++++++++++-------
>   2 files changed, 82 insertions(+), 27 deletions(-)
>
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index ec82f5bda908..7ed9034912ca 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -76,7 +76,9 @@ u64 ppc64_rma_size;
>   unsigned int boot_cpu_node_count __ro_after_init;
>   #endif
>   static phys_addr_t first_memblock_size;
> +#ifdef CONFIG_SMP
>   static int __initdata boot_cpu_count;
> +#endif
>   
>   static int __init early_parse_mem(char *p)
>   {
> @@ -331,8 +333,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>   	const __be32 *intserv;
>   	int i, nthreads;
>   	int len;
> -	int found = -1;
> -	int found_thread = 0;
> +	bool found = false;
>   
>   	/* We are scanning "cpu" nodes only */
>   	if (type == NULL || strcmp(type, "cpu") != 0)
> @@ -355,8 +356,15 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>   	for (i = 0; i < nthreads; i++) {
>   		if (be32_to_cpu(intserv[i]) ==
>   			fdt_boot_cpuid_phys(initial_boot_params)) {
> -			found = boot_cpu_count;
> -			found_thread = i;
> +			/*
> +			 * always map the boot-cpu logical id into the
> +			 * range of [0, thread_per_core)
> +			 */
> +			boot_cpuid = i;
> +			found = true;
> +			/* This forces all threads in a core to be online */
> +			if (nr_cpu_ids % nthreads != 0)
> +				set_nr_cpu_ids(ALIGN(nr_cpu_ids, nthreads));
>   		}
>   #ifdef CONFIG_SMP
>   		/* logical cpu id is always 0 on UP kernels */
> @@ -365,14 +373,13 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>   	}
>   
>   	/* Not the boot CPU */
> -	if (found < 0)
> +	if (!found)
>   		return 0;
>   
> -	DBG("boot cpu: logical %d physical %d\n", found,
> -	    be32_to_cpu(intserv[found_thread]));
> -	boot_cpuid = found;
> +	DBG("boot cpu: logical %d physical %d\n", boot_cpuid,
> +	    be32_to_cpu(intserv[boot_cpuid]));
>   
> -	boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
> +	boot_cpu_hwid = be32_to_cpu(intserv[boot_cpuid]);
>   
>   	/*
>   	 * PAPR defines "logical" PVR values for cpus that
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 707f0490639d..9802c7e5ee2f 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -36,6 +36,7 @@
>   #include <linux/of_irq.h>
>   #include <linux/hugetlb.h>
>   #include <linux/pgtable.h>
> +#include <linux/list.h>
>   #include <asm/io.h>
>   #include <asm/paca.h>
>   #include <asm/processor.h>
> @@ -425,6 +426,13 @@ static void __init cpu_init_thread_core_maps(int tpc)
>   
>   u32 *cpu_to_phys_id = NULL;
>   
> +struct interrupt_server_node {
> +	struct list_head node;
> +	bool	avail;
> +	int	len;
> +	__be32 intserv[];
> +};
> +
>   /**
>    * setup_cpu_maps - initialize the following cpu maps:
>    *                  cpu_possible_mask
> @@ -446,11 +454,16 @@ u32 *cpu_to_phys_id = NULL;
>   void __init smp_setup_cpu_maps(void)
>   {
>   	struct device_node *dn;
> -	int cpu = 0;
> -	int nthreads = 1;
> +	int shift = 0, cpu = 0;
> +	int j, nthreads = 1;
> +	int len;
> +	struct interrupt_server_node *intserv_node, *n;
> +	struct list_head *bt_node, head;
> +	bool avail, found_boot_cpu = false;
>   
>   	DBG("smp_setup_cpu_maps()\n");
>   
> +	INIT_LIST_HEAD(&head);
>   	cpu_to_phys_id = memblock_alloc(nr_cpu_ids * sizeof(u32),
>   					__alignof__(u32));
>   	if (!cpu_to_phys_id)
> @@ -460,7 +473,6 @@ void __init smp_setup_cpu_maps(void)
>   	for_each_node_by_type(dn, "cpu") {
>   		const __be32 *intserv;
>   		__be32 cpu_be;
> -		int j, len;
>   
>   		DBG("  * %pOF...\n", dn);
>   
> @@ -480,29 +492,65 @@ void __init smp_setup_cpu_maps(void)
>   			}
>   		}
>   
> -		nthreads = len / sizeof(int);
> +		avail = of_device_is_available(dn);
> +		if (!avail)
> +			avail = !of_property_match_string(dn,
> +					"enable-method", "spin-table");
>   
> -		for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
> -			bool avail;
>   
> -			DBG("    thread %d -> cpu %d (hard id %d)\n",
> -			    j, cpu, be32_to_cpu(intserv[j]));
> -
> -			avail = of_device_is_available(dn);
> -			if (!avail)
> -				avail = !of_property_match_string(dn,
> -						"enable-method", "spin-table");
> +		intserv_node = memblock_alloc(sizeof(struct interrupt_server_node) + len,
> +					__alignof__(u32));
> +		if (!intserv_node)
> +			panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
> +				__func__,
> +				sizeof(struct interrupt_server_node) + len,
> +				__alignof__(u32));
> +		intserv_node->len = len;
> +		memcpy(intserv_node->intserv, intserv, len);
> +		intserv_node->avail = avail;
> +		list_add_tail(&intserv_node->node, &head);
> +
> +		if (!found_boot_cpu) {
> +			nthreads = len / sizeof(int);
> +			for (j = 0 ; j < nthreads; j++) {
> +				if (be32_to_cpu(intserv[j]) == boot_cpu_hwid) {
> +					bt_node = &intserv_node->node;
> +					found_boot_cpu = true;
> +					/*
> +					 * Record the round-shift between dt
> +					 * seq and cpu logical number
> +					 */
> +					shift = cpu - j;
> +					break;
> +				}
> +
> +				cpu++;
> +			}
> +		}
>   
> +	}
> +	cpu = 0;
> +	list_del_init(&head);
> +	/* Select the primary thread, the boot cpu's slibing, as the logic 0 */
> +	list_add_tail(&head, bt_node);
> +	pr_info("the round shift between dt seq and the cpu logic number: %d\n", shift);
> +	list_for_each_entry(intserv_node, &head, node) {
> +
> +		avail = intserv_node->avail;
> +		nthreads = intserv_node->len / sizeof(int);
> +		for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
>   			set_cpu_present(cpu, avail);
>   			set_cpu_possible(cpu, true);
> -			cpu_to_phys_id[cpu] = be32_to_cpu(intserv[j]);
> +			cpu_to_phys_id[cpu] = be32_to_cpu(intserv_node->intserv[j]);
> +			DBG("    thread %d -> cpu %d (hard id %d)\n",
> +			    j, cpu, be32_to_cpu(intserv_node->intserv[j]));
>   			cpu++;
>   		}
> +	}
>   
> -		if (cpu >= nr_cpu_ids) {
> -			of_node_put(dn);
> -			break;
> -		}
> +	list_for_each_entry_safe(intserv_node, n, &head, node) {
> +		len = sizeof(struct interrupt_server_node) + intserv_node->len;
> +		memblock_free(intserv_node, len);
>   	}
>   
>   	/* If no SMT supported, nthreads is forced to 1 */

