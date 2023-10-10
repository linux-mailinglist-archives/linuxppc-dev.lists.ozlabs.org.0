Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 551557BF8C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 12:38:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A3hM1kmW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4XRZ14XYz3cNt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 21:38:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A3hM1kmW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4XQf4V0Jz30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 21:37:13 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39AARWlq021396;
	Tue, 10 Oct 2023 10:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1LiI5L1O0TBFN9YLrf0egwM/BLc/AU7aZhEnud3aDF4=;
 b=A3hM1kmWx3kB2P0D0KkHNg+rKzbLV9X2qhJowsVJ/konTlNb5UdMjnGR7epbBflhbI1L
 1UswLHU7gOti2S57tRyWHWxRoFnjWFYky0iHVN82ZxTx6ur9UWq1nhohaL0KLlePOWk1
 KHvCxQJPwjKPjhDKfZlQ1L5ldyXZCVBy7YUCDuJk7L/eleEPQBtVeCtZ604uBIOtnZxP
 Cl9y2GhE2M1+TcajzASR2LVSxmeZtgpUgJv0YJ9fLGLI2/W13G4b4B8dT1abwd/g9YvX
 8uFl1+uKHGO6AyqnehOd/0vs2fn2zmmCtU6ca0DOxixa611zYW8OYvph51mqQIOsb9p0 yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tn4vcr91f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 10:37:05 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39AAUMGd001113;
	Tue, 10 Oct 2023 10:37:05 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tn4vcr90v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 10:37:05 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39AA8fbB028633;
	Tue, 10 Oct 2023 10:37:04 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1xyw6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 10:37:04 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39AAb2rg44826884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Oct 2023 10:37:02 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6A2820063;
	Tue, 10 Oct 2023 10:37:02 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FF7E20043;
	Tue, 10 Oct 2023 10:37:01 +0000 (GMT)
Received: from [9.43.29.104] (unknown [9.43.29.104])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Oct 2023 10:37:00 +0000 (GMT)
Message-ID: <adbee287-a446-d65e-a319-ccb8d6033f7e@linux.ibm.com>
Date: Tue, 10 Oct 2023 16:07:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv8 2/5] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
Content-Language: en-US
To: Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org
References: <20231009113036.45988-1-piliu@redhat.com>
 <20231009113036.45988-3-piliu@redhat.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20231009113036.45988-3-piliu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9KXiq6uBNk0x7dIYyOUeIEEMeg1w1vlB
X-Proofpoint-GUID: BvjRwVpkfQSSLseNsmjHnFtEgVH4uPh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_05,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310100078
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/10/23 5:00 pm, Pingfan Liu wrote:
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
> Cc: kexec@lists.infradead.org
> To: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/kernel/prom.c         | 25 +++++----
>   arch/powerpc/kernel/setup-common.c | 87 +++++++++++++++++++++++-------
>   2 files changed, 85 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index ec82f5bda908..87272a2d8c10 100644
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
> +			/* This works around the hole in paca_ptrs[]. */
> +			if (nr_cpu_ids < nthreads)
> +				set_nr_cpu_ids(nthreads);
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
> index 1b19a9815672..81291e13dec0 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -36,6 +36,7 @@
>   #include <linux/of_platform.h>
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
> +	__be32 *intserv;
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
> @@ -480,29 +492,68 @@ void __init smp_setup_cpu_maps(void)
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

> +		intserv_node->intserv = (__be32 *)((char *)intserv_node +
> +						sizeof(struct interrupt_server_node));

This initialization won't be needed if the member was:

	__be32 intserv[];

> +		intserv_node->len = len;
> +		memcpy(intserv_node->intserv, intserv, len);
> +		intserv_node->avail = avail;

> +		INIT_LIST_HEAD(&intserv_node->node);
> +		list_add_tail(&intserv_node->node, &head);

INIT_LIST_HEAD(&intserv_node->node); is not needed as list_add_tail()
initializes both next & prev anyway.

Thanks
Hari
