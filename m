Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9117CC0D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 12:39:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nTcN+ecW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8r8S5YyYz3vcx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 21:39:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nTcN+ecW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8r7b6sGqz3vZV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 21:39:07 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39HAWoep004916;
	Tue, 17 Oct 2023 10:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=edq0Xo7kFqdB+ctgWRiXRWiVpxh9mi/kF/uFS3llpTk=;
 b=nTcN+ecWWvzFB0mvITAhD/iF/Tum+l+dWFQfmYipnoIFFgtnwCGUW9GanHmSKG63nGFV
 hvITUbHPV9SAfK+7KdLDGgNwQH71ucZl3OmWuGCkmZrohkkgoORJwISX3DZIMuOa3NDw
 BZuHAhBjKdyWx1RfQL19NGYrUu6ouLvMNo4dXWRrixGissMZoI0/lDJhNzHNBRbZR93r
 q4KL61t8XeY5lMLnVt/+xPNNvWDMWa1SXY/m4fzXBFz+6vy3HTZUT0dQuB2GlSlUhUki
 J+tsMnqblftqheo7dTftKIntv+2v57LMQx6ilTFHf1E9uBpgKn9wLV8lRuAu8knNDqsG 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsrkugasu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 10:39:02 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39HAY2YY012185;
	Tue, 17 Oct 2023 10:39:01 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsrkugas7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 10:39:01 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39HABvvX019700;
	Tue, 17 Oct 2023 10:34:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr811fshs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 10:34:00 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39HAXvuU14484062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Oct 2023 10:33:57 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B76A20040;
	Tue, 17 Oct 2023 10:33:57 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59DD820043;
	Tue, 17 Oct 2023 10:33:55 +0000 (GMT)
Received: from [9.43.86.173] (unknown [9.43.86.173])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Oct 2023 10:33:55 +0000 (GMT)
Message-ID: <064ae2ee-ad15-c0ab-f78b-7b3e7dc6612d@linux.ibm.com>
Date: Tue, 17 Oct 2023 16:03:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv9 2/2] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
Content-Language: en-US
To: Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org
References: <20231017022806.4523-1-piliu@redhat.com>
 <20231017022806.4523-3-piliu@redhat.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20231017022806.4523-3-piliu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Nj3Jwc_kulFLqwp7vqi6i-cLR2apLvOb
X-Proofpoint-ORIG-GUID: aTTMcrpSEfJm3RMXTkD4YGZ0BtF5ehkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310170088
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 17/10/23 7:58 am, Pingfan Liu wrote:
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

Thanks for working on this, Pingfan.
Looks good to me.

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

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
