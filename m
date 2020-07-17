Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06EA2236C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 10:15:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7P7h1yk0zDr1K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 18:15:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7NzS6whzzDrM8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 18:08:20 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H82RwP010689; Fri, 17 Jul 2020 04:08:15 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32axd26bqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 04:08:15 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H84Ww1020331;
 Fri, 17 Jul 2020 08:08:14 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 327529qcpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 08:08:14 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06H8890h60358924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 08:08:09 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8511C136059;
 Fri, 17 Jul 2020 08:08:11 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B262513604F;
 Fri, 17 Jul 2020 08:08:10 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.61.65])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 08:08:10 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id A164A2E3026; Fri, 17 Jul 2020 13:38:05 +0530 (IST)
Date: Fri, 17 Jul 2020 13:38:05 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 07/11] Powerpc/numa: Detect support for coregroup
Message-ID: <20200717080805.GB32531@in.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-8-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714043624.5648-8-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_04:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007170059
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
Reply-To: ego@linux.vnet.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 10:06:20AM +0530, Srikar Dronamraju wrote:
> Add support for grouping cores based on the device-tree classification.
> - The last domain in the associativity domains always refers to the
> core.
> - If primary reference domain happens to be the penultimate domain in
> the associativity domains device-tree property, then there are no
> coregroups. However if its not a penultimate domain, then there are
> coregroups. There can be more than one coregroup. For now we would be
> interested in the last or the smallest coregroups.
> 
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: Michael Ellerman <michaele@au1.ibm.com>
> Cc: Nick Piggin <npiggin@au1.ibm.com>
> Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Neuling <mikey@linux.ibm.com>
> Cc: Anton Blanchard <anton@au1.ibm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

This looks good to me from the discovery of the core-group point of
view.

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
>  arch/powerpc/include/asm/smp.h |  1 +
>  arch/powerpc/kernel/smp.c      |  1 +
>  arch/powerpc/mm/numa.c         | 34 +++++++++++++++++++++-------------
>  3 files changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index 49a25e2400f2..5bdc17a7049f 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -28,6 +28,7 @@
>  extern int boot_cpuid;
>  extern int spinning_secondaries;
>  extern u32 *cpu_to_phys_id;
> +extern bool coregroup_enabled;
> 
>  extern void cpu_die(void);
>  extern int cpu_to_chip_id(int cpu);
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index f8faf75135af..96e47450d9b3 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -74,6 +74,7 @@ static DEFINE_PER_CPU(int, cpu_state) = { 0 };
> 
>  struct task_struct *secondary_current;
>  bool has_big_cores;
> +bool coregroup_enabled;
> 
>  DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
>  DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index fc7b0505bdd8..a43eab455be4 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -887,7 +887,9 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
>  static void __init find_possible_nodes(void)
>  {
>  	struct device_node *rtas;
> -	u32 numnodes, i;
> +	const __be32 *domains;
> +	int prop_length, max_nodes;
> +	u32 i;
> 
>  	if (!numa_enabled)
>  		return;
> @@ -896,25 +898,31 @@ static void __init find_possible_nodes(void)
>  	if (!rtas)
>  		return;
> 
> -	if (of_property_read_u32_index(rtas, "ibm,current-associativity-domains",
> -				min_common_depth, &numnodes)) {
> -		/*
> -		 * ibm,current-associativity-domains is a fairly recent
> -		 * property. If it doesn't exist, then fallback on
> -		 * ibm,max-associativity-domains. Current denotes what the
> -		 * platform can support compared to max which denotes what the
> -		 * Hypervisor can support.
> -		 */
> -		if (of_property_read_u32_index(rtas, "ibm,max-associativity-domains",
> -				min_common_depth, &numnodes))
> +	/*
> +	 * ibm,current-associativity-domains is a fairly recent property. If
> +	 * it doesn't exist, then fallback on ibm,max-associativity-domains.
> +	 * Current denotes what the platform can support compared to max
> +	 * which denotes what the Hypervisor can support.
> +	 */
> +	domains = of_get_property(rtas, "ibm,current-associativity-domains",
> +					&prop_length);
> +	if (!domains) {
> +		domains = of_get_property(rtas, "ibm,max-associativity-domains",
> +					&prop_length);
> +		if (!domains)
>  			goto out;
>  	}
> 
> -	for (i = 0; i < numnodes; i++) {
> +	max_nodes = of_read_number(&domains[min_common_depth], 1);
> +	for (i = 0; i < max_nodes; i++) {
>  		if (!node_possible(i))
>  			node_set(i, node_possible_map);
>  	}
> 
> +	prop_length /= sizeof(int);
> +	if (prop_length > min_common_depth + 2)
> +		coregroup_enabled = 1;
> +
>  out:
>  	of_node_put(rtas);
>  }
> -- 
> 2.17.1
> 
