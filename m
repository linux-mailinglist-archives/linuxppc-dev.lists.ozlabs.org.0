Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D68632D47A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 18:14:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrkF26PrRzDqwY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 04:14:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eqW5wFtg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crk6B3brfzDqqK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 04:08:50 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9H2ia2032827; Wed, 9 Dec 2020 12:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=p7i09glt1PA34RRWozLvlg3Hs9Pfdi+IanmOpLaKeX8=;
 b=eqW5wFtgQwRnQ4FrgzVvNLhH++6zJAA8ld49g9kd4oCdkzzETv6f9AX/yKmWz2By6txJ
 cdfILaNQb6ZMRWf7gW2fywRo37QvaOfSibvMpEqG+pdwvMNgBIvpZiMzsLB+KxzLQpgm
 7cTOEui88AGuYiCsW81b60DfZtEED3wk4W3y8AN7a51RtoMY4N0DEd5XVjBVDZTYoFWM
 4bLizG8dGnp6yyyD5gfAbGND2pDqor2CQmBnPoHmvGf4cy0Otf4JDN6mHE6usjw/508Q
 bhWiJ9hzNa6vJ/m2eEKTSn/+KuQTI+Zme586bhwjzheYMrt+TM2xX80SPBXA6K1/loNB Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35avffas81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:08:39 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9H2pwF033976;
 Wed, 9 Dec 2020 12:08:38 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35avffas7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:08:38 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9H31ib026903;
 Wed, 9 Dec 2020 17:08:37 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3581u9sd7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 17:08:37 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9H8bJH56688924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 17:08:37 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0F0A124053;
 Wed,  9 Dec 2020 17:08:36 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44C84124054;
 Wed,  9 Dec 2020 17:08:36 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.58.223])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 17:08:36 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 8A27D2E35BB; Wed,  9 Dec 2020 22:38:28 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@ozlabs.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Subject: [PATCH v2 5/5] powerpc/cacheinfo: Print correct cache-sibling
 map/list for L2 cache
Date: Wed,  9 Dec 2020 22:38:20 +0530
Message-Id: <1607533700-5546-6-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607533700-5546-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1607533700-5546-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_14:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090116
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

On POWER platforms where only some groups of threads within a core
share the L2-cache (indicated by the ibm,thread-groups device-tree
property), we currently print the incorrect shared_cpu_map/list for
L2-cache in the sysfs.

This patch reports the correct shared_cpu_map/list on such platforms.

Example:
On a platform with "ibm,thread-groups" set to
                 00000001 00000002 00000004 00000000
                 00000002 00000004 00000006 00000001
                 00000003 00000005 00000007 00000002
                 00000002 00000004 00000000 00000002
                 00000004 00000006 00000001 00000003
                 00000005 00000007

This indicates that threads {0,2,4,6} in the core share the L2-cache
and threads {1,3,5,7} in the core share the L2 cache.

However, without the patch, the shared_cpu_map/list for L2 for CPUs 0,
1 is reported in the sysfs as follows:

/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_list:0-7
/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_map:000000,000000ff

/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_list:0-7
/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_map:000000,000000ff

With the patch, the shared_cpu_map/list for L2 cache for CPUs 0, 1 is
correctly reported as follows:

/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_list:0,2,4,6
/sys/devices/system/cpu/cpu0/cache/index2/shared_cpu_map:000000,00000055

/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_list:1,3,5,7
/sys/devices/system/cpu/cpu1/cache/index2/shared_cpu_map:000000,000000aa

This patch adds #CONFIG_PPC64 checks for these cases to ensure that
32-bit configs build correctly.
Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/cacheinfo.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 65ab9fc..cb87b68 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -641,6 +641,7 @@ static ssize_t level_show(struct kobject *k, struct kobj_attribute *attr, char *
 static struct kobj_attribute cache_level_attr =
 	__ATTR(level, 0444, level_show, NULL);
 
+#ifdef CONFIG_PPC64
 static unsigned int index_dir_to_cpu(struct cache_index_dir *index)
 {
 	struct kobject *index_dir_kobj = &index->kobj;
@@ -650,16 +651,35 @@ static unsigned int index_dir_to_cpu(struct cache_index_dir *index)
 
 	return dev->id;
 }
+#endif
 
 /*
  * On big-core systems, each core has two groups of CPUs each of which
  * has its own L1-cache. The thread-siblings which share l1-cache with
  * @cpu can be obtained via cpu_smallcore_mask().
+ *
+ * On some big-core systems, the L2 cache is shared only between some
+ * groups of siblings. This is already parsed and encoded in
+ * cpu_l2_cache_mask().
+ *
+ * TODO: cache_lookup_or_instantiate() needs to be made aware of the
+ *       "ibm,thread-groups" property so that cache->shared_cpu_map
+ *       reflects the correct siblings on platforms that have this
+ *       device-tree property. This helper function is only a stop-gap
+ *       solution so that we report the correct siblings to the
+ *       userspace via sysfs.
  */
-static const struct cpumask *get_big_core_shared_cpu_map(int cpu, struct cache *cache)
+static const struct cpumask *get_shared_cpu_map(struct cache_index_dir *index, struct cache *cache)
 {
-	if (cache->level == 1)
-		return cpu_smallcore_mask(cpu);
+#ifdef CONFIG_PPC64
+	if (has_big_cores) {
+		int cpu = index_dir_to_cpu(index);
+		if (cache->level == 1)
+			return cpu_smallcore_mask(cpu);
+		if (cache->level == 2 && thread_group_shares_l2)
+			return cpu_l2_cache_mask(cpu);
+	}
+#endif
 
 	return &cache->shared_cpu_map;
 }
@@ -670,17 +690,11 @@ static const struct cpumask *get_big_core_shared_cpu_map(int cpu, struct cache *
 	struct cache_index_dir *index;
 	struct cache *cache;
 	const struct cpumask *mask;
-	int cpu;
 
 	index = kobj_to_cache_index_dir(k);
 	cache = index->cache;
 
-	if (has_big_cores) {
-		cpu = index_dir_to_cpu(index);
-		mask = get_big_core_shared_cpu_map(cpu, cache);
-	} else {
-		mask  = &cache->shared_cpu_map;
-	}
+	mask = get_shared_cpu_map(index, cache);
 
 	return cpumap_print_to_pagebuf(list, buf, mask);
 }
-- 
1.9.4

