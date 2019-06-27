Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4F57B31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 07:17:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z7SN6pHdzDqdM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 15:17:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z7QT6RmkzDqdT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 15:15:45 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5R5D3QC129411
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 01:15:43 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tcpr8skwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 01:15:43 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5R5ExU5011614
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:42 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 2t9by748th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:42 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5R5Fe2D56033654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:41 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3EF46A04F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:40 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A08046A057
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:40 +0000 (GMT)
Received: from localhost (unknown [9.80.233.188])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:40 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/cacheinfo: name@unit instead of full DT path in
 debug messages
Date: Thu, 27 Jun 2019 00:15:35 -0500
Message-Id: <20190627051537.7298-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627051537.7298-1-nathanl@linux.ibm.com>
References: <20190627051537.7298-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906270056
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We know that every OF node we deal with in this code is under /cpus,
so we can make the debug messages a little less verbose without losing
information.

E.g.

cacheinfo: creating L1 dcache and icache for /cpus/PowerPC,POWER8@0
cacheinfo: creating L2 ucache for /cpus/l2-cache@2006
cacheinfo: creating L3 ucache for /cpus/l3-cache@3106

becomes

cacheinfo: creating L1 dcache and icache for PowerPC,POWER8@0
cacheinfo: creating L2 ucache for l2-cache@2006
cacheinfo: creating L3 ucache for l3-cache@3106

Replace all '%pOF' specifiers with '%pOFP'.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/cacheinfo.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 295af19e00f0..d8200f7e1075 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -171,7 +171,7 @@ static void release_cache_debugcheck(struct cache *cache)
 
 	list_for_each_entry(iter, &cache_list, list)
 		WARN_ONCE(iter->next_local == cache,
-			  "cache for %pOF(%s) refers to cache for %pOF(%s)\n",
+			  "cache for %pOFP(%s) refers to cache for %pOFP(%s)\n",
 			  iter->ofnode,
 			  cache_type_string(iter),
 			  cache->ofnode,
@@ -183,7 +183,7 @@ static void release_cache(struct cache *cache)
 	if (!cache)
 		return;
 
-	pr_debug("freeing L%d %s cache for %pOF\n", cache->level,
+	pr_debug("freeing L%d %s cache for %pOFP\n", cache->level,
 		 cache_type_string(cache), cache->ofnode);
 
 	release_cache_debugcheck(cache);
@@ -198,7 +198,7 @@ static void cache_cpu_set(struct cache *cache, int cpu)
 
 	while (next) {
 		WARN_ONCE(cpumask_test_cpu(cpu, &next->shared_cpu_map),
-			  "CPU %i already accounted in %pOF(%s)\n",
+			  "CPU %i already accounted in %pOFP(%s)\n",
 			  cpu, next->ofnode,
 			  cache_type_string(next));
 		cpumask_set_cpu(cpu, &next->shared_cpu_map);
@@ -359,7 +359,7 @@ static int cache_is_unified_d(const struct device_node *np)
  */
 static struct cache *cache_do_one_devnode_unified(struct device_node *node, int level)
 {
-	pr_debug("creating L%d ucache for %pOF\n", level, node);
+	pr_debug("creating L%d ucache for %pOFP\n", level, node);
 
 	return new_cache(cache_is_unified_d(node), level, node);
 }
@@ -369,7 +369,7 @@ static struct cache *cache_do_one_devnode_split(struct device_node *node,
 {
 	struct cache *dcache, *icache;
 
-	pr_debug("creating L%d dcache and icache for %pOF\n", level,
+	pr_debug("creating L%d dcache and icache for %pOFP\n", level,
 		 node);
 
 	dcache = new_cache(CACHE_TYPE_DATA, level, node);
@@ -740,13 +740,13 @@ static void cacheinfo_create_index_opt_attrs(struct cache_index_dir *dir)
 		rc = attr->show(&dir->kobj, attr, buf);
 		if (rc <= 0) {
 			pr_debug("not creating %s attribute for "
-				 "%pOF(%s) (rc = %zd)\n",
+				 "%pOFP(%s) (rc = %zd)\n",
 				 attr->attr.name, cache->ofnode,
 				 cache_type, rc);
 			continue;
 		}
 		if (sysfs_create_file(&dir->kobj, &attr->attr))
-			pr_debug("could not create %s attribute for %pOF(%s)\n",
+			pr_debug("could not create %s attribute for %pOFP(%s)\n",
 				 attr->attr.name, cache->ofnode, cache_type);
 	}
 
@@ -862,7 +862,7 @@ static void cache_cpu_clear(struct cache *cache, int cpu)
 		struct cache *next = cache->next_local;
 
 		WARN_ONCE(!cpumask_test_cpu(cpu, &cache->shared_cpu_map),
-			  "CPU %i not accounted in %pOF(%s)\n",
+			  "CPU %i not accounted in %pOFP(%s)\n",
 			  cpu, cache->ofnode,
 			  cache_type_string(cache));
 
-- 
2.20.1

