Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED292FB354
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 08:40:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKgXz3c0yzDqld
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 18:40:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Fw0KAC5n; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKgT74T6qzDqyp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 18:36:39 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10J7Y64N050168; Tue, 19 Jan 2021 02:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=cjUj6ZQ7xttD9or/tZBsGAZYHXa//N6DVWt3L+kbweU=;
 b=Fw0KAC5nFNRRlnms3mQwD5DwQHHnutHRIQdKFLWPKrv7HZeCgGT5ic1Eu5y/BQu/x4Ve
 R3JzND4Bda8G50euSQNBC8x4jbNuBmsKO/SQb41xo72fWpU5D+9XK1W4f/nhssE59Shc
 6e6x1ekI9AHn7Wt36PjJh/QR+y7/aLvZuVFq+Wjur8F+apuki89dN5Z5ePKLWO4RRyFx
 /dDf7hc998++IPAIkJINJ0ycTs7GFnZ+hjEVvpPkiz16mY07hY6E9QXS6HLuNybhVD7B
 QmxA4eLemrhrVygaWWA+f5akqjQuPPO5P1tSzJRxIU7lejKRup6OV8Ncola5ja3tsCSt yQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365tebs3j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 02:36:35 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10J7WOPI027224;
 Tue, 19 Jan 2021 07:36:34 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 363qs91kyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 07:36:34 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10J7aXcq12845728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 07:36:33 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59DB66A047;
 Tue, 19 Jan 2021 07:36:33 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78CBC6A04D;
 Tue, 19 Jan 2021 07:36:32 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.79.213.81])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 07:36:32 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 110BF2E2F1A; Tue, 19 Jan 2021 13:06:28 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: [PATCH 2/2] powerpc/cacheinfo: Remove the redundant
 get_shared_cpu_map()
Date: Tue, 19 Jan 2021 13:06:20 +0530
Message-Id: <1611041780-8640-3-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611041780-8640-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1611041780-8640-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_01:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101190044
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

The helper function get_shared_cpu_map() was added in

'commit 500fe5f550ec ("powerpc/cacheinfo: Report the correct
shared_cpu_map on big-cores")'

and subsequently expanded upon in

'commit 0be47634db0b ("powerpc/cacheinfo: Print correct cache-sibling
map/list for L2 cache")'

in order to help report the correct groups of threads sharing these caches
on big-core systems where groups of threads within a core can share
different sets of caches.

Now that powerpc/cacheinfo is aware of "ibm,thread-groups" property,
cache->shared_cpu_map contains the correct set of thread-siblings
sharing the cache. Hence we no longer need the functions
get_shared_cpu_map(). This patch removes this function. We also remove
the helper function index_dir_to_cpu() which was only called by
get_shared_cpu_map().

With these functions removed, we can still see the correct
cache-sibling map/list for L1 and L2 caches on systems with L1 and L2
caches distributed among groups of threads in a core.

With this patch, on a SMT8 POWER10 system where the L1 and L2 caches
are split between the two groups of threads in a core, for CPUs 8,9,
the L1-Data, L1-Instruction, L2, L3 cache CPU sibling list is as
follows:

$ grep . /sys/devices/system/cpu/cpu[89]/cache/index[0123]/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8,10,12,14
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8,10,12,14
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8,10,12,14
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8-15
/sys/devices/system/cpu/cpu9/cache/index0/shared_cpu_list:9,11,13,15
/sys/devices/system/cpu/cpu9/cache/index1/shared_cpu_list:9,11,13,15
/sys/devices/system/cpu/cpu9/cache/index2/shared_cpu_list:9,11,13,15
/sys/devices/system/cpu/cpu9/cache/index3/shared_cpu_list:8-15

$ ppc64_cpu --smt=4
$ grep . /sys/devices/system/cpu/cpu[89]/cache/index[0123]/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8,10
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8,10
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8,10
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8-11
/sys/devices/system/cpu/cpu9/cache/index0/shared_cpu_list:9,11
/sys/devices/system/cpu/cpu9/cache/index1/shared_cpu_list:9,11
/sys/devices/system/cpu/cpu9/cache/index2/shared_cpu_list:9,11
/sys/devices/system/cpu/cpu9/cache/index3/shared_cpu_list:8-11

$ ppc64_cpu --smt=2
$ grep . /sys/devices/system/cpu/cpu[89]/cache/index[0123]/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8-9
/sys/devices/system/cpu/cpu9/cache/index0/shared_cpu_list:9
/sys/devices/system/cpu/cpu9/cache/index1/shared_cpu_list:9
/sys/devices/system/cpu/cpu9/cache/index2/shared_cpu_list:9
/sys/devices/system/cpu/cpu9/cache/index3/shared_cpu_list:8-9

$ ppc64_cpu --smt=1
$ grep . /sys/devices/system/cpu/cpu[89]/cache/index[0123]/shared_cpu_list
/sys/devices/system/cpu/cpu8/cache/index0/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index1/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index2/shared_cpu_list:8
/sys/devices/system/cpu/cpu8/cache/index3/shared_cpu_list:8

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/cacheinfo.c | 41 +----------------------------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 5a6925d..20d9169 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -675,45 +675,6 @@ static ssize_t level_show(struct kobject *k, struct kobj_attribute *attr, char *
 static struct kobj_attribute cache_level_attr =
 	__ATTR(level, 0444, level_show, NULL);
 
-static unsigned int index_dir_to_cpu(struct cache_index_dir *index)
-{
-	struct kobject *index_dir_kobj = &index->kobj;
-	struct kobject *cache_dir_kobj = index_dir_kobj->parent;
-	struct kobject *cpu_dev_kobj = cache_dir_kobj->parent;
-	struct device *dev = kobj_to_dev(cpu_dev_kobj);
-
-	return dev->id;
-}
-
-/*
- * On big-core systems, each core has two groups of CPUs each of which
- * has its own L1-cache. The thread-siblings which share l1-cache with
- * @cpu can be obtained via cpu_smallcore_mask().
- *
- * On some big-core systems, the L2 cache is shared only between some
- * groups of siblings. This is already parsed and encoded in
- * cpu_l2_cache_mask().
- *
- * TODO: cache_lookup_or_instantiate() needs to be made aware of the
- *       "ibm,thread-groups" property so that cache->shared_cpu_map
- *       reflects the correct siblings on platforms that have this
- *       device-tree property. This helper function is only a stop-gap
- *       solution so that we report the correct siblings to the
- *       userspace via sysfs.
- */
-static const struct cpumask *get_shared_cpu_map(struct cache_index_dir *index, struct cache *cache)
-{
-	if (has_big_cores) {
-		int cpu = index_dir_to_cpu(index);
-		if (cache->level == 1)
-			return cpu_smallcore_mask(cpu);
-		if (cache->level == 2 && thread_group_shares_l2)
-			return cpu_l2_cache_mask(cpu);
-	}
-
-	return &cache->shared_cpu_map;
-}
-
 static ssize_t
 show_shared_cpumap(struct kobject *k, struct kobj_attribute *attr, char *buf, bool list)
 {
@@ -724,7 +685,7 @@ static const struct cpumask *get_shared_cpu_map(struct cache_index_dir *index, s
 	index = kobj_to_cache_index_dir(k);
 	cache = index->cache;
 
-	mask = get_shared_cpu_map(index, cache);
+	mask = &cache->shared_cpu_map;
 
 	return cpumap_print_to_pagebuf(list, buf, mask);
 }
-- 
1.9.4

