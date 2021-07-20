Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F93CF4B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 08:43:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTTgJ4V35z3bfH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 16:43:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DYME1iNl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DYME1iNl; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTTfm10dxz2xfT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 16:42:39 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16K6YATe057239; Tue, 20 Jul 2021 02:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=8EOW4N9Ynm+ST34TBWr5vcFs6P6udgSBm0JsJBEu1rE=;
 b=DYME1iNlTj5DVVpEPqxUZUyAQa+aU6dhW17msprqo553TFodKtaQ4e5iyWT4Qxh0MB7X
 gWu2ycoPDsQHC7wKpFgkzypP2kZn60x6ehuEMfZ/nPcpt68IePnWh/gG4DGgi0QquJu2
 heA5psQypKhFAE4CyO5wI0wth+vB9eS/jnZeVY8S1ZbsaogJe+7UUt05LkO93NGzElA8
 gQsvE0SM3myWStXZ3V4Z3TV0R7HG89RynCt2OVcykCHK1buUK2CVZqDP5yh+a2nJywWH
 Ol0TwuvuDeglmXNiGjWRQ/mSCkPVlPwX6YjRqVwjFXF4P4G9SfOVEKN3KxI4TimlhzXK sQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wr5tsym5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 02:42:32 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16K6gLSc028334;
 Tue, 20 Jul 2021 06:42:31 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 39upubtvc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 06:42:31 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16K6gUfR38863342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 06:42:30 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 131F1B2068;
 Tue, 20 Jul 2021 06:42:30 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73EB3B2064;
 Tue, 20 Jul 2021 06:42:28 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.102.16.115])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 06:42:28 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 797CD2E3AFD; Tue, 20 Jul 2021 12:12:26 +0530 (IST)
Date: Tue, 20 Jul 2021 12:12:26 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Parth Shah <parth@linux.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/smp: Use existing L2 cache_map cpumask to
 find L3 cache siblings
Message-ID: <20210720064226.GA28266@in.ibm.com>
References: <20210615070804.390341-1-parth@linux.ibm.com>
 <20210615070804.390341-4-parth@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615070804.390341-4-parth@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UxmvCscSSPD7d-jr0TaniFQvssI8Z9c1
X-Proofpoint-GUID: UxmvCscSSPD7d-jr0TaniFQvssI8Z9c1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_04:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107200037
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, srikar@linux.vnet.ibm.com,
 svaidy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Parth,

Sorry for the late review.

On Tue, Jun 15, 2021 at 12:38:04PM +0530, Parth Shah wrote:
> On POWER10 systems, the "ibm,thread-groups" property "2" indicates the cpus
> in thread-group share both L2 and L3 caches. Hence, use cache_property = 2
> itself to find both the L2 and L3 cache siblings.
> Hence, rename existing macros to detect if the cache property is for L2 or
> L3 and use the L2 cache map itself to find the presence of L3 siblings.
> 
> Signed-off-by: Parth Shah <parth@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/smp.h  |  2 ++
>  arch/powerpc/kernel/cacheinfo.c |  3 +++
>  arch/powerpc/kernel/smp.c       | 20 +++++++++++++++-----
>  3 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index 1259040cc3a4..55082d343bd2 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -144,6 +144,7 @@ extern int cpu_to_core_id(int cpu);
> 
>  extern bool has_big_cores;
>  extern bool thread_group_shares_l2;
> +extern bool thread_group_shares_l3;
> 
>  #define cpu_smt_mask cpu_smt_mask
>  #ifdef CONFIG_SCHED_SMT
> @@ -198,6 +199,7 @@ extern void __cpu_die(unsigned int cpu);
>  #define hard_smp_processor_id()		get_hard_smp_processor_id(0)
>  #define smp_setup_cpu_maps()
>  #define thread_group_shares_l2  0
> +#define thread_group_shares_l3	0
>  static inline void inhibit_secondary_onlining(void) {}
>  static inline void uninhibit_secondary_onlining(void) {}
>  static inline const struct cpumask *cpu_sibling_mask(int cpu)
> diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
> index 20d91693eac1..378ae20d05a9 100644
> --- a/arch/powerpc/kernel/cacheinfo.c
> +++ b/arch/powerpc/kernel/cacheinfo.c
> @@ -469,6 +469,9 @@ static int get_group_id(unsigned int cpu_id, int level)
>  	else if (thread_group_shares_l2 && level == 2)
>  		return cpumask_first(per_cpu(thread_group_l2_cache_map,
>  					     cpu_id));
> +	else if (thread_group_shares_l3 && level == 3)
> +		return cpumask_first(per_cpu(thread_group_l2_cache_map,
> +					     cpu_id));

We should either rename thread_group_l2_cache_map as
thread_group_l2_l3_cache_map or we should create a separate
thread_group_l3_cache_map. I prefer the latter approach since it makes
the code consistent. 

Otherwise, the patch looks good to me.

--
Thanks and Regards
gautham.

>  	return -1;
>  }
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index a34877257f2d..d0c70fcd0068 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -78,6 +78,7 @@ struct task_struct *secondary_current;
>  bool has_big_cores;
>  bool coregroup_enabled;
>  bool thread_group_shares_l2;
> +bool thread_group_shares_l3;
> 
>  DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
>  DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
> @@ -101,7 +102,7 @@ enum {
> 
>  #define MAX_THREAD_LIST_SIZE	8
>  #define THREAD_GROUP_SHARE_L1   1
> -#define THREAD_GROUP_SHARE_L2   2
> +#define THREAD_GROUP_SHARE_L2_L3 2
>  struct thread_groups {
>  	unsigned int property;
>  	unsigned int nr_groups;
> @@ -887,9 +888,16 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
>  	cpumask_var_t *mask = NULL;
> 
>  	if (cache_property != THREAD_GROUP_SHARE_L1 &&
> -	    cache_property != THREAD_GROUP_SHARE_L2)
> +	    cache_property != THREAD_GROUP_SHARE_L2_L3)
>  		return -EINVAL;
> 
> +	/*
> +	 * On P10 fused-core system, the L3 cache is shared between threads of a
> +	 * small core only, but the "ibm,thread-groups" property is indicated as
> +	 * "2" only which is interpreted as the thread-groups sharing both L2
> +	 * and L3 caches. Hence cache_property of THREAD_GROUP_SHARE_L2_L3 is
> +	 * used for both L2 and L3 cache sibling detection.
> +	 */
>  	tg = get_thread_groups(cpu, cache_property, &err);
>  	if (!tg)
>  		return err;
> @@ -903,7 +911,7 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
> 
>  	if (cache_property == THREAD_GROUP_SHARE_L1)
>  		mask = &per_cpu(thread_group_l1_cache_map, cpu);
> -	else if (cache_property == THREAD_GROUP_SHARE_L2)
> +	else if (cache_property == THREAD_GROUP_SHARE_L2_L3)
>  		mask = &per_cpu(thread_group_l2_cache_map, cpu);
> 
>  	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
> @@ -1009,14 +1017,16 @@ static int __init init_big_cores(void)
>  	has_big_cores = true;
> 
>  	for_each_possible_cpu(cpu) {
> -		int err = init_thread_group_cache_map(cpu, THREAD_GROUP_SHARE_L2);
> +		int err = init_thread_group_cache_map(cpu, THREAD_GROUP_SHARE_L2_L3);
> 
>  		if (err)
>  			return err;
>  	}
> 
>  	thread_group_shares_l2 = true;
> -	pr_debug("L2 cache only shared by the threads in the small core\n");
> +	thread_group_shares_l3 = true;
> +	pr_debug("L2/L3 cache only shared by the threads in the small core\n");
> +
>  	return 0;
>  }
> 
> -- 
> 2.26.3
> 
