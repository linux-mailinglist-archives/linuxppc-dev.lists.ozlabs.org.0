Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3C03A77AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:09:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zvf3BQ4z3c6b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 17:09:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fEgLLbiJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fEgLLbiJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3ztm1Gnzz308f
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 17:08:31 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F74RIE128172; Tue, 15 Jun 2021 03:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jm+l1nfyPlKNJF/En9kINwPWX8jBqH05TfFBiHRXFR8=;
 b=fEgLLbiJsqMZ8dT9MrKsGjyFhWA3ALCJt7Vn3tIh7EqQ7uGM8frB8b9+PWJX/iH2AjfT
 CAPVSUtGmnHi/1yVHQhveTh8Q11AOYBNbvEfHNVjU4yg277FN4WgJxKtcxk/CQgbKceI
 qkhcNTLCCtUcY/BYaoqZHx0qBRsi0IsJ9jn+dGzxJFDf3eFx+q9WGlsQxA9Tmx0qxvZG
 vNTimT6KyPOPkNdIbkXzm+nc/ECy/0HumjgnkujVAI1B+7IlZ3xktiX0MzbLMiflILpR
 vvrMVsOnI78ogTE6yWr9Wd9Q3W4c+Z/5AVqi7Udz3F8f/RrnmwbgN6zXLNMHf3zoeebm QA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396qf38888-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 03:08:25 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F73tN0024354;
 Tue, 15 Jun 2021 07:08:23 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 394mj90qg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 07:08:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F78KWH22872358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 07:08:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D7A04C058;
 Tue, 15 Jun 2021 07:08:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0922B4C04E;
 Tue, 15 Jun 2021 07:08:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.27.150])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 07:08:17 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/cacheinfo: Lookup cache by dt node and
 thread-group id
Date: Tue, 15 Jun 2021 12:38:02 +0530
Message-Id: <20210615070804.390341-2-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210615070804.390341-1-parth@linux.ibm.com>
References: <20210615070804.390341-1-parth@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vuRAj0it8BCnmM7eM87F3vOGUxcGyxuf
X-Proofpoint-GUID: vuRAj0it8BCnmM7eM87F3vOGUxcGyxuf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_04:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150042
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
Cc: mikey@neuling.org, svaidy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 ego@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

Currently the cacheinfo code on powerpc indexes the "cache" objects
(modelling the L1/L2/L3 caches) where the key is device-tree node
corresponding to that cache. On some of the POWER server platforms
thread-groups within the core share different sets of caches (Eg: On
SMT8 POWER9 systems, threads 0,2,4,6 of a core share L1 cache and
threads 1,3,5,7 of the same core share another L1 cache). On such
platforms, there is a single device-tree node corresponding to that
cache and the cache-configuration within the threads of the core is
indicated via "ibm,thread-groups" device-tree property.

Since the current code is not aware of the "ibm,thread-groups"
property, on the aforementoined systems, cacheinfo code still treats
all the threads in the core to be sharing the cache because of the
single device-tree node (In the earlier example, the cacheinfo code
would says CPUs 0-7 share L1 cache).

In this patch, we make the powerpc cacheinfo code aware of the
"ibm,thread-groups" property. We indexe the "cache" objects by the
key-pair (device-tree node, thread-group id). For any CPUX, for a
given level of cache, the thread-group id is defined to be the first
CPU in the "ibm,thread-groups" cache-group containing CPUX. For levels
of cache which are not represented in "ibm,thread-groups" property,
the thread-group id is -1.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
[parth: Remove "static" keyword for the definition of "thread_group_l1_cache_map"
and "thread_group_l2_cache_map" to get rid of the compile error.]
Signed-off-by: Parth Shah <parth@linux.ibm.com>
---
 arch/powerpc/include/asm/smp.h  |  3 ++
 arch/powerpc/kernel/cacheinfo.c | 80 ++++++++++++++++++++++++---------
 arch/powerpc/kernel/smp.c       |  4 +-
 3 files changed, 63 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 03b3d010cbab..1259040cc3a4 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -33,6 +33,9 @@ extern bool coregroup_enabled;
 extern int cpu_to_chip_id(int cpu);
 extern int *chip_id_lookup_table;
 
+DECLARE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
+DECLARE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
+
 #ifdef CONFIG_SMP
 
 struct smp_ops_t {
diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 6f903e9aa20b..5a6925d87424 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -120,6 +120,7 @@ struct cache {
 	struct cpumask shared_cpu_map; /* online CPUs using this cache */
 	int type;                      /* split cache disambiguation */
 	int level;                     /* level not explicit in device tree */
+	int group_id;                  /* id of the group of threads that share this cache */
 	struct list_head list;         /* global list of cache objects */
 	struct cache *next_local;      /* next cache of >= level */
 };
@@ -142,22 +143,24 @@ static const char *cache_type_string(const struct cache *cache)
 }
 
 static void cache_init(struct cache *cache, int type, int level,
-		       struct device_node *ofnode)
+		       struct device_node *ofnode, int group_id)
 {
 	cache->type = type;
 	cache->level = level;
 	cache->ofnode = of_node_get(ofnode);
+	cache->group_id = group_id;
 	INIT_LIST_HEAD(&cache->list);
 	list_add(&cache->list, &cache_list);
 }
 
-static struct cache *new_cache(int type, int level, struct device_node *ofnode)
+static struct cache *new_cache(int type, int level,
+			       struct device_node *ofnode, int group_id)
 {
 	struct cache *cache;
 
 	cache = kzalloc(sizeof(*cache), GFP_KERNEL);
 	if (cache)
-		cache_init(cache, type, level, ofnode);
+		cache_init(cache, type, level, ofnode, group_id);
 
 	return cache;
 }
@@ -309,20 +312,24 @@ static struct cache *cache_find_first_sibling(struct cache *cache)
 		return cache;
 
 	list_for_each_entry(iter, &cache_list, list)
-		if (iter->ofnode == cache->ofnode && iter->next_local == cache)
+		if (iter->ofnode == cache->ofnode &&
+		    iter->group_id == cache->group_id &&
+		    iter->next_local == cache)
 			return iter;
 
 	return cache;
 }
 
-/* return the first cache on a local list matching node */
-static struct cache *cache_lookup_by_node(const struct device_node *node)
+/* return the first cache on a local list matching node and thread-group id */
+static struct cache *cache_lookup_by_node_group(const struct device_node *node,
+						int group_id)
 {
 	struct cache *cache = NULL;
 	struct cache *iter;
 
 	list_for_each_entry(iter, &cache_list, list) {
-		if (iter->ofnode != node)
+		if (iter->ofnode != node ||
+		    iter->group_id != group_id)
 			continue;
 		cache = cache_find_first_sibling(iter);
 		break;
@@ -352,14 +359,15 @@ static int cache_is_unified_d(const struct device_node *np)
 		CACHE_TYPE_UNIFIED_D : CACHE_TYPE_UNIFIED;
 }
 
-static struct cache *cache_do_one_devnode_unified(struct device_node *node, int level)
+static struct cache *cache_do_one_devnode_unified(struct device_node *node, int group_id,
+						  int level)
 {
 	pr_debug("creating L%d ucache for %pOFP\n", level, node);
 
-	return new_cache(cache_is_unified_d(node), level, node);
+	return new_cache(cache_is_unified_d(node), level, node, group_id);
 }
 
-static struct cache *cache_do_one_devnode_split(struct device_node *node,
+static struct cache *cache_do_one_devnode_split(struct device_node *node, int group_id,
 						int level)
 {
 	struct cache *dcache, *icache;
@@ -367,8 +375,8 @@ static struct cache *cache_do_one_devnode_split(struct device_node *node,
 	pr_debug("creating L%d dcache and icache for %pOFP\n", level,
 		 node);
 
-	dcache = new_cache(CACHE_TYPE_DATA, level, node);
-	icache = new_cache(CACHE_TYPE_INSTRUCTION, level, node);
+	dcache = new_cache(CACHE_TYPE_DATA, level, node, group_id);
+	icache = new_cache(CACHE_TYPE_INSTRUCTION, level, node, group_id);
 
 	if (!dcache || !icache)
 		goto err;
@@ -382,31 +390,32 @@ static struct cache *cache_do_one_devnode_split(struct device_node *node,
 	return NULL;
 }
 
-static struct cache *cache_do_one_devnode(struct device_node *node, int level)
+static struct cache *cache_do_one_devnode(struct device_node *node, int group_id, int level)
 {
 	struct cache *cache;
 
 	if (cache_node_is_unified(node))
-		cache = cache_do_one_devnode_unified(node, level);
+		cache = cache_do_one_devnode_unified(node, group_id, level);
 	else
-		cache = cache_do_one_devnode_split(node, level);
+		cache = cache_do_one_devnode_split(node, group_id, level);
 
 	return cache;
 }
 
 static struct cache *cache_lookup_or_instantiate(struct device_node *node,
+						 int group_id,
 						 int level)
 {
 	struct cache *cache;
 
-	cache = cache_lookup_by_node(node);
+	cache = cache_lookup_by_node_group(node, group_id);
 
 	WARN_ONCE(cache && cache->level != level,
 		  "cache level mismatch on lookup (got %d, expected %d)\n",
 		  cache->level, level);
 
 	if (!cache)
-		cache = cache_do_one_devnode(node, level);
+		cache = cache_do_one_devnode(node, group_id, level);
 
 	return cache;
 }
@@ -443,7 +452,27 @@ static void do_subsidiary_caches_debugcheck(struct cache *cache)
 		  of_node_get_device_type(cache->ofnode));
 }
 
-static void do_subsidiary_caches(struct cache *cache)
+/*
+ * If sub-groups of threads in a core containing @cpu_id share the
+ * L@level-cache (information obtained via "ibm,thread-groups"
+ * device-tree property), then we identify the group by the first
+ * thread-sibling in the group. We define this to be the group-id.
+ *
+ * In the absence of any thread-group information for L@level-cache,
+ * this function returns -1.
+ */
+static int get_group_id(unsigned int cpu_id, int level)
+{
+	if (has_big_cores && level == 1)
+		return cpumask_first(per_cpu(thread_group_l1_cache_map,
+					     cpu_id));
+	else if (thread_group_shares_l2 && level == 2)
+		return cpumask_first(per_cpu(thread_group_l2_cache_map,
+					     cpu_id));
+	return -1;
+}
+
+static void do_subsidiary_caches(struct cache *cache, unsigned int cpu_id)
 {
 	struct device_node *subcache_node;
 	int level = cache->level;
@@ -452,9 +481,11 @@ static void do_subsidiary_caches(struct cache *cache)
 
 	while ((subcache_node = of_find_next_cache_node(cache->ofnode))) {
 		struct cache *subcache;
+		int group_id;
 
 		level++;
-		subcache = cache_lookup_or_instantiate(subcache_node, level);
+		group_id = get_group_id(cpu_id, level);
+		subcache = cache_lookup_or_instantiate(subcache_node, group_id, level);
 		of_node_put(subcache_node);
 		if (!subcache)
 			break;
@@ -468,6 +499,7 @@ static struct cache *cache_chain_instantiate(unsigned int cpu_id)
 {
 	struct device_node *cpu_node;
 	struct cache *cpu_cache = NULL;
+	int group_id;
 
 	pr_debug("creating cache object(s) for CPU %i\n", cpu_id);
 
@@ -476,11 +508,13 @@ static struct cache *cache_chain_instantiate(unsigned int cpu_id)
 	if (!cpu_node)
 		goto out;
 
-	cpu_cache = cache_lookup_or_instantiate(cpu_node, 1);
+	group_id = get_group_id(cpu_id, 1);
+
+	cpu_cache = cache_lookup_or_instantiate(cpu_node, group_id, 1);
 	if (!cpu_cache)
 		goto out;
 
-	do_subsidiary_caches(cpu_cache);
+	do_subsidiary_caches(cpu_cache, cpu_id);
 
 	cache_cpu_set(cpu_cache, cpu_id);
 out:
@@ -848,13 +882,15 @@ static struct cache *cache_lookup_by_cpu(unsigned int cpu_id)
 {
 	struct device_node *cpu_node;
 	struct cache *cache;
+	int group_id;
 
 	cpu_node = of_get_cpu_node(cpu_id, NULL);
 	WARN_ONCE(!cpu_node, "no OF node found for CPU %i\n", cpu_id);
 	if (!cpu_node)
 		return NULL;
 
-	cache = cache_lookup_by_node(cpu_node);
+	group_id = get_group_id(cpu_id, 1);
+	cache = cache_lookup_by_node_group(cpu_node, group_id);
 	of_node_put(cpu_node);
 
 	return cache;
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 2e05c783440a..a34877257f2d 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -122,14 +122,14 @@ static struct thread_groups_list tgl[NR_CPUS] __initdata;
  * On big-cores system, thread_group_l1_cache_map for each CPU corresponds to
  * the set its siblings that share the L1-cache.
  */
-static DEFINE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
+DEFINE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
 
 /*
  * On some big-cores system, thread_group_l2_cache_map for each CPU
  * corresponds to the set its siblings within the core that share the
  * L2-cache.
  */
-static DEFINE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
+DEFINE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
 
 /* SMP operations for this machine */
 struct smp_ops_t *smp_ops;
-- 
2.26.3

