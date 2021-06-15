Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352B3A77AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:09:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3zwD59h0z308H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 17:09:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wr5QtSBj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Wr5QtSBj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3ztp3NxZz3bnl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 17:08:33 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F74L5E189621; Tue, 15 Jun 2021 03:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3KcJxp5ep+j9YSbOC/3LnfFE5drRZr5iCpvAMKR/TGA=;
 b=Wr5QtSBj8wZgcbqPROth52fKsyvMgvIT49etDBK1gSaQY7o8AcyAuXWHrKlmpJWQ4z1H
 asiibHoEVab5p1sGzqOw5moP80Ao2dGkIizblMmUZxif/8m1w6E5hPMydcWJyRPfbFp7
 2iz1PunjFmONLb+heoKFzHKcq+G5ndgsccP81QEBuHoglLJ/pTSYCEXjV1iDBaTsX/GS
 /qPWPuDEesBrUe52Rk+tKIEIRpC5ddtYGRX5bxRrhp9kotWZ+3DgwGRpGVwYdibeW4Lt
 t7wjUonfGzJ/KIgqykfBMlCzIG+OLMzMYSlD+Ucv3J1jw2dafVR3E2uwlCVoW2l4PcnS Yg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 396q76gmvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 03:08:28 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F78Q3A002343;
 Tue, 15 Jun 2021 07:08:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 395c3t8g1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 07:08:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15F77KaS34996632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 07:07:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 087BB4C04A;
 Tue, 15 Jun 2021 07:08:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F37D44C044;
 Tue, 15 Jun 2021 07:08:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.27.150])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 07:08:20 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/cacheinfo: Remove the redundant
 get_shared_cpu_map()
Date: Tue, 15 Jun 2021 12:38:03 +0530
Message-Id: <20210615070804.390341-3-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210615070804.390341-1-parth@linux.ibm.com>
References: <20210615070804.390341-1-parth@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YehMmuzEs2ttVbdEGPYkqnozjRDJYqjC
X-Proofpoint-GUID: YehMmuzEs2ttVbdEGPYkqnozjRDJYqjC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_03:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 arch/powerpc/kernel/cacheinfo.c | 41 +--------------------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 5a6925d87424..20d91693eac1 100644
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
@@ -724,7 +685,7 @@ show_shared_cpumap(struct kobject *k, struct kobj_attribute *attr, char *buf, bo
 	index = kobj_to_cache_index_dir(k);
 	cache = index->cache;
 
-	mask = get_shared_cpu_map(index, cache);
+	mask = &cache->shared_cpu_map;
 
 	return cpumap_print_to_pagebuf(list, buf, mask);
 }
-- 
2.26.3

