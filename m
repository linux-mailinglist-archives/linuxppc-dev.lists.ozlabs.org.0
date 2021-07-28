Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2C83D94BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 19:57:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZhG05LLjz3ccJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 03:57:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mnuhbba+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mnuhbba+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZhDf71wjz30G4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 03:56:34 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16SHYPCj028437; Wed, 28 Jul 2021 13:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3KcJxp5ep+j9YSbOC/3LnfFE5drRZr5iCpvAMKR/TGA=;
 b=mnuhbba+xv0xwFs18AQLkQCevpqWL3NikK175GEM0rfi5NknDgEt6y0l1nsiPugu4WpP
 W4O0ndQiPF+xlgPx4T/ZKZv/CKJk/Wzc975Z1wLt9Gn1t/F7f0W2PpMRdUNU8WOnz2uA
 W0Vn4buS1mKhQKub9q9+wG+xnZ7BiQwKloB1o9QeaMm8OXpKsh3ctEqiqg5AihBXrume
 g4ZvcoguBmwwiseWAFx2igflMLK8d6txyDp2k0QEhUdR6mfDCw2FFY0jLIzBk0LdJNfv
 UFXgFr02NbHGYoXYxkI84qMhfmhhmzgNqebOZcLyeQecqWPhwxXqgTeFAD2p0E3SqWQs jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a3970nrm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 13:56:29 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16SHYfKS030395;
 Wed, 28 Jul 2021 13:56:29 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a3970nrjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 13:56:28 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16SHt9i4019575;
 Wed, 28 Jul 2021 17:56:27 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3a235m17mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 17:56:26 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16SHriNm24248642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 17:53:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D73952051;
 Wed, 28 Jul 2021 17:56:24 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.1.109])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D6FD652050;
 Wed, 28 Jul 2021 17:56:20 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv2 2/3] powerpc/cacheinfo: Remove the redundant
 get_shared_cpu_map()
Date: Wed, 28 Jul 2021 23:26:06 +0530
Message-Id: <20210728175607.591679-3-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210728175607.591679-1-parth@linux.ibm.com>
References: <20210728175607.591679-1-parth@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fx_3bHIAvxq82hXmfMkPnCSmM60Ff6v2
X-Proofpoint-ORIG-GUID: 6CGPDe_BaKjHBctB3u-Gk5XXOmKdZ4q5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-28_08:2021-07-27,
 2021-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280099
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, srikar@linux.vnet.ibm.com,
 parths1229@gmail.com, svaidy@linux.vnet.ibm.com
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

