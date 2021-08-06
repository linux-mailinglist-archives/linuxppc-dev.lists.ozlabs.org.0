Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A63E2300
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 07:44:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgvYk2WBdz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 15:44:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NDkRwT82;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NDkRwT82; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgvYF5rfsz30Hb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 15:44:01 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1765Y59O177448; Fri, 6 Aug 2021 01:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=GWaANYfcNxMbnYpwRH2OkePORAklRSvXowfFgTB9n4I=;
 b=NDkRwT821LosfI/qap71WGml4r5zGyZV8t6rAqwM0ixf7aUjX5HqGOMd0U39SoJ1s4uL
 dBgUXC4siQ8jeKD2y+pz7a0CqeRdoJuLAMW4+nwxQiDOVRX1V0r/PySW0S0l+dRPZxI6
 n8fLYmAEjUGsqQLlRE/E8DuPS6eYoa4B5TUDSWg6UGD4Igy/rcYkrAg5Er3EzMRdJpaS
 pe6RSeK5lDxuzOM7ZCdpWPYEExndC0iZ/UxzdD5fJhuJObUlErGropAg7kBHEbZWyQV1
 KXZcafzovEYkcSbs4lFjplyQlSKoMv7lzmx8MMfRveZhH4sOBQebtUcFW2KlToXF6GSW iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a8m9uduut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 01:43:53 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1765YnVb184332;
 Fri, 6 Aug 2021 01:43:53 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a8m9uduuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 01:43:52 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1765g4uE030131;
 Fri, 6 Aug 2021 05:43:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3a4x594jd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 05:43:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1765ekg416318866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Aug 2021 05:40:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA021A40BB;
 Fri,  6 Aug 2021 05:43:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88D9BA40C8;
 Fri,  6 Aug 2021 05:43:46 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  6 Aug 2021 05:43:46 +0000 (GMT)
Date: Fri, 6 Aug 2021 11:13:45 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Parth Shah <parth@linux.ibm.com>
Subject: Re: [PATCHv2 1/3] powerpc/cacheinfo: Lookup cache by dt node and
 thread-group id
Message-ID: <20210806054345.GF4072958@linux.vnet.ibm.com>
References: <20210728175607.591679-1-parth@linux.ibm.com>
 <20210728175607.591679-2-parth@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210728175607.591679-2-parth@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XlTbX70s6sVPf24m681nIpL7cRzEAurF
X-Proofpoint-ORIG-GUID: L51jLHQu3Yyvp3TNf9cMixeDAjgSIhti
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_01:2021-08-05,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108060036
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, parths1229@gmail.com,
 svaidy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Parth Shah <parth@linux.ibm.com> [2021-07-28 23:26:05]:

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> Currently the cacheinfo code on powerpc indexes the "cache" objects
> (modelling the L1/L2/L3 caches) where the key is device-tree node
> corresponding to that cache. On some of the POWER server platforms
> thread-groups within the core share different sets of caches (Eg: On
> SMT8 POWER9 systems, threads 0,2,4,6 of a core share L1 cache and
> threads 1,3,5,7 of the same core share another L1 cache). On such
> platforms, there is a single device-tree node corresponding to that
> cache and the cache-configuration within the threads of the core is
> indicated via "ibm,thread-groups" device-tree property.
> 
> Since the current code is not aware of the "ibm,thread-groups"
> property, on the aforementoined systems, cacheinfo code still treats
> all the threads in the core to be sharing the cache because of the
> single device-tree node (In the earlier example, the cacheinfo code
> would says CPUs 0-7 share L1 cache).
> 
> In this patch, we make the powerpc cacheinfo code aware of the
> "ibm,thread-groups" property. We indexe the "cache" objects by the
> key-pair (device-tree node, thread-group id). For any CPUX, for a
> given level of cache, the thread-group id is defined to be the first
> CPU in the "ibm,thread-groups" cache-group containing CPUX. For levels
> of cache which are not represented in "ibm,thread-groups" property,
> the thread-group id is -1.
> 
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> [parth: Remove "static" keyword for the definition of "thread_group_l1_cache_map"
> and "thread_group_l2_cache_map" to get rid of the compile error.]
> Signed-off-by: Parth Shah <parth@linux.ibm.com>


Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> ---
>  arch/powerpc/include/asm/smp.h  |  3 ++
>  arch/powerpc/kernel/cacheinfo.c | 80 ++++++++++++++++++++++++---------
>  arch/powerpc/kernel/smp.c       |  4 +-
>  3 files changed, 63 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index 03b3d010cbab..1259040cc3a4 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -33,6 +33,9 @@ extern bool coregroup_enabled;
>  extern int cpu_to_chip_id(int cpu);
>  extern int *chip_id_lookup_table;
> 
> +DECLARE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
> +DECLARE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
> +
>  #ifdef CONFIG_SMP
> 
>  struct smp_ops_t {
> diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
> index 6f903e9aa20b..5a6925d87424 100644
> --- a/arch/powerpc/kernel/cacheinfo.c
> +++ b/arch/powerpc/kernel/cacheinfo.c
> @@ -120,6 +120,7 @@ struct cache {
>  	struct cpumask shared_cpu_map; /* online CPUs using this cache */
>  	int type;                      /* split cache disambiguation */
>  	int level;                     /* level not explicit in device tree */
> +	int group_id;                  /* id of the group of threads that share this cache */
>  	struct list_head list;         /* global list of cache objects */
>  	struct cache *next_local;      /* next cache of >= level */
>  };
> @@ -142,22 +143,24 @@ static const char *cache_type_string(const struct cache *cache)
>  }
> 
>  static void cache_init(struct cache *cache, int type, int level,
> -		       struct device_node *ofnode)
> +		       struct device_node *ofnode, int group_id)
>  {
>  	cache->type = type;
>  	cache->level = level;
>  	cache->ofnode = of_node_get(ofnode);
> +	cache->group_id = group_id;
>  	INIT_LIST_HEAD(&cache->list);
>  	list_add(&cache->list, &cache_list);
>  }
> 
> -static struct cache *new_cache(int type, int level, struct device_node *ofnode)
> +static struct cache *new_cache(int type, int level,
> +			       struct device_node *ofnode, int group_id)
>  {
>  	struct cache *cache;
> 
>  	cache = kzalloc(sizeof(*cache), GFP_KERNEL);
>  	if (cache)
> -		cache_init(cache, type, level, ofnode);
> +		cache_init(cache, type, level, ofnode, group_id);
> 
>  	return cache;
>  }
> @@ -309,20 +312,24 @@ static struct cache *cache_find_first_sibling(struct cache *cache)
>  		return cache;
> 
>  	list_for_each_entry(iter, &cache_list, list)
> -		if (iter->ofnode == cache->ofnode && iter->next_local == cache)
> +		if (iter->ofnode == cache->ofnode &&
> +		    iter->group_id == cache->group_id &&
> +		    iter->next_local == cache)
>  			return iter;
> 
>  	return cache;
>  }
> 
> -/* return the first cache on a local list matching node */
> -static struct cache *cache_lookup_by_node(const struct device_node *node)
> +/* return the first cache on a local list matching node and thread-group id */
> +static struct cache *cache_lookup_by_node_group(const struct device_node *node,
> +						int group_id)
>  {
>  	struct cache *cache = NULL;
>  	struct cache *iter;
> 
>  	list_for_each_entry(iter, &cache_list, list) {
> -		if (iter->ofnode != node)
> +		if (iter->ofnode != node ||
> +		    iter->group_id != group_id)
>  			continue;
>  		cache = cache_find_first_sibling(iter);
>  		break;
> @@ -352,14 +359,15 @@ static int cache_is_unified_d(const struct device_node *np)
>  		CACHE_TYPE_UNIFIED_D : CACHE_TYPE_UNIFIED;
>  }
> 
> -static struct cache *cache_do_one_devnode_unified(struct device_node *node, int level)
> +static struct cache *cache_do_one_devnode_unified(struct device_node *node, int group_id,
> +						  int level)
>  {
>  	pr_debug("creating L%d ucache for %pOFP\n", level, node);
> 
> -	return new_cache(cache_is_unified_d(node), level, node);
> +	return new_cache(cache_is_unified_d(node), level, node, group_id);
>  }
> 
> -static struct cache *cache_do_one_devnode_split(struct device_node *node,
> +static struct cache *cache_do_one_devnode_split(struct device_node *node, int group_id,
>  						int level)
>  {
>  	struct cache *dcache, *icache;
> @@ -367,8 +375,8 @@ static struct cache *cache_do_one_devnode_split(struct device_node *node,
>  	pr_debug("creating L%d dcache and icache for %pOFP\n", level,
>  		 node);
> 
> -	dcache = new_cache(CACHE_TYPE_DATA, level, node);
> -	icache = new_cache(CACHE_TYPE_INSTRUCTION, level, node);
> +	dcache = new_cache(CACHE_TYPE_DATA, level, node, group_id);
> +	icache = new_cache(CACHE_TYPE_INSTRUCTION, level, node, group_id);
> 
>  	if (!dcache || !icache)
>  		goto err;
> @@ -382,31 +390,32 @@ static struct cache *cache_do_one_devnode_split(struct device_node *node,
>  	return NULL;
>  }
> 
> -static struct cache *cache_do_one_devnode(struct device_node *node, int level)
> +static struct cache *cache_do_one_devnode(struct device_node *node, int group_id, int level)
>  {
>  	struct cache *cache;
> 
>  	if (cache_node_is_unified(node))
> -		cache = cache_do_one_devnode_unified(node, level);
> +		cache = cache_do_one_devnode_unified(node, group_id, level);
>  	else
> -		cache = cache_do_one_devnode_split(node, level);
> +		cache = cache_do_one_devnode_split(node, group_id, level);
> 
>  	return cache;
>  }
> 
>  static struct cache *cache_lookup_or_instantiate(struct device_node *node,
> +						 int group_id,
>  						 int level)
>  {
>  	struct cache *cache;
> 
> -	cache = cache_lookup_by_node(node);
> +	cache = cache_lookup_by_node_group(node, group_id);
> 
>  	WARN_ONCE(cache && cache->level != level,
>  		  "cache level mismatch on lookup (got %d, expected %d)\n",
>  		  cache->level, level);
> 
>  	if (!cache)
> -		cache = cache_do_one_devnode(node, level);
> +		cache = cache_do_one_devnode(node, group_id, level);
> 
>  	return cache;
>  }
> @@ -443,7 +452,27 @@ static void do_subsidiary_caches_debugcheck(struct cache *cache)
>  		  of_node_get_device_type(cache->ofnode));
>  }
> 
> -static void do_subsidiary_caches(struct cache *cache)
> +/*
> + * If sub-groups of threads in a core containing @cpu_id share the
> + * L@level-cache (information obtained via "ibm,thread-groups"
> + * device-tree property), then we identify the group by the first
> + * thread-sibling in the group. We define this to be the group-id.
> + *
> + * In the absence of any thread-group information for L@level-cache,
> + * this function returns -1.
> + */
> +static int get_group_id(unsigned int cpu_id, int level)
> +{
> +	if (has_big_cores && level == 1)
> +		return cpumask_first(per_cpu(thread_group_l1_cache_map,
> +					     cpu_id));
> +	else if (thread_group_shares_l2 && level == 2)
> +		return cpumask_first(per_cpu(thread_group_l2_cache_map,
> +					     cpu_id));
> +	return -1;
> +}
> +
> +static void do_subsidiary_caches(struct cache *cache, unsigned int cpu_id)
>  {
>  	struct device_node *subcache_node;
>  	int level = cache->level;
> @@ -452,9 +481,11 @@ static void do_subsidiary_caches(struct cache *cache)
> 
>  	while ((subcache_node = of_find_next_cache_node(cache->ofnode))) {
>  		struct cache *subcache;
> +		int group_id;
> 
>  		level++;
> -		subcache = cache_lookup_or_instantiate(subcache_node, level);
> +		group_id = get_group_id(cpu_id, level);
> +		subcache = cache_lookup_or_instantiate(subcache_node, group_id, level);
>  		of_node_put(subcache_node);
>  		if (!subcache)
>  			break;
> @@ -468,6 +499,7 @@ static struct cache *cache_chain_instantiate(unsigned int cpu_id)
>  {
>  	struct device_node *cpu_node;
>  	struct cache *cpu_cache = NULL;
> +	int group_id;
> 
>  	pr_debug("creating cache object(s) for CPU %i\n", cpu_id);
> 
> @@ -476,11 +508,13 @@ static struct cache *cache_chain_instantiate(unsigned int cpu_id)
>  	if (!cpu_node)
>  		goto out;
> 
> -	cpu_cache = cache_lookup_or_instantiate(cpu_node, 1);
> +	group_id = get_group_id(cpu_id, 1);
> +
> +	cpu_cache = cache_lookup_or_instantiate(cpu_node, group_id, 1);
>  	if (!cpu_cache)
>  		goto out;
> 
> -	do_subsidiary_caches(cpu_cache);
> +	do_subsidiary_caches(cpu_cache, cpu_id);
> 
>  	cache_cpu_set(cpu_cache, cpu_id);
>  out:
> @@ -848,13 +882,15 @@ static struct cache *cache_lookup_by_cpu(unsigned int cpu_id)
>  {
>  	struct device_node *cpu_node;
>  	struct cache *cache;
> +	int group_id;
> 
>  	cpu_node = of_get_cpu_node(cpu_id, NULL);
>  	WARN_ONCE(!cpu_node, "no OF node found for CPU %i\n", cpu_id);
>  	if (!cpu_node)
>  		return NULL;
> 
> -	cache = cache_lookup_by_node(cpu_node);
> +	group_id = get_group_id(cpu_id, 1);
> +	cache = cache_lookup_by_node_group(cpu_node, group_id);
>  	of_node_put(cpu_node);
> 
>  	return cache;
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 447b78a87c8f..a7fcac44a8e2 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -122,14 +122,14 @@ static struct thread_groups_list tgl[NR_CPUS] __initdata;
>   * On big-cores system, thread_group_l1_cache_map for each CPU corresponds to
>   * the set its siblings that share the L1-cache.
>   */
> -static DEFINE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
> +DEFINE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
> 
>  /*
>   * On some big-cores system, thread_group_l2_cache_map for each CPU
>   * corresponds to the set its siblings within the core that share the
>   * L2-cache.
>   */
> -static DEFINE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
> +DEFINE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
> 
>  /* SMP operations for this machine */
>  struct smp_ops_t *smp_ops;
> -- 
> 2.26.3
> 

-- 
Thanks and Regards
Srikar Dronamraju
