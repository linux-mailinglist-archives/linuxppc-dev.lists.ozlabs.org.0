Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB933411629
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 15:56:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCmLq3w1qz30RK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 23:56:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GXC2YtiF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GXC2YtiF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCmKH0GKtz2yN1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 23:55:14 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KDD3WB025938; 
 Mon, 20 Sep 2021 09:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AWD5SFJjOx0STfmNrBeAQ+ZUTCBTdHkbrqRQ9aUBOC8=;
 b=GXC2YtiFLNCaMna6rpj12uWm1jVYqR/Nx7U4mJhKXqoiRf0CTfPoJWVRnvPF9wXwp0Ro
 +fWi7YZvnLfLMciiEDkgR8Hym3zI0LWd9Z2QStVMwdy0aDK7+pYb1FwsKb/J30OGcF8c
 kOT97G5TIoArnsHAu0rhSWK7G+WEXo4nYrKKSjfewBf64XpXQ1K4UGZg4aDyjk/JemD8
 w9w8sRtrXEDQ4uwnjxWPzn+YP65I+peelKcuRda8dQznRqYlsDHnl4HTCoGZs6Y1c5U2
 Yik4pBXh4QyUOtFzXQdFF7gy/EUt9YzueX878/3aAeXa0rHbZG/rxBMhBBlZAtYBYZ2J bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5wq5ag18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 09:55:09 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18KDlFIA003519;
 Mon, 20 Sep 2021 09:55:09 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5wq5ag0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 09:55:09 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18KDr70N003681;
 Mon, 20 Sep 2021 13:55:08 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 3b57r9ye3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 13:55:08 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18KDt6aj10748278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 13:55:06 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 953FD6E050;
 Mon, 20 Sep 2021 13:55:06 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EB906E064;
 Mon, 20 Sep 2021 13:55:06 +0000 (GMT)
Received: from localhost (unknown [9.211.63.177])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Sep 2021 13:55:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/pseries/cpuhp: cache node corrections
Date: Mon, 20 Sep 2021 08:55:02 -0500
Message-Id: <20210920135504.1792219-2-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920135504.1792219-1-nathanl@linux.ibm.com>
References: <20210920135504.1792219-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: M_0svQ7cNF92-bKN1eZbzvgTFXLKo6A1
X-Proofpoint-GUID: EA7EK82xJiRPl25njPxzf4YFsYrvRwZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109200086
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 danielhb413@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On pseries, cache nodes in the device tree can be added and removed by the
CPU DLPAR code as well as the partition migration (mobility) code. PowerVM
partitions in dedicated processor mode typically have L2 and L3 cache
nodes.

The CPU DLPAR code has the following shortcomings:

* Cache nodes returned as siblings of a new CPU node by
  ibm,configure-connector are silently discarded; only the CPU node is
  added to the device tree.

* Cache nodes which become unreferenced in the processor removal path are
  not removed from the device tree. This can lead to duplicate nodes when
  the post-migration device tree update code replaces cache nodes.

This is long-standing behavior. Presumably it has gone mostly unnoticed
because the two bugs have the property of obscuring each other in common
simple scenarios (e.g. remove a CPU and add it back). Likely you'd notice
only if you cared to inspect the device tree or the sysfs cacheinfo
information.

Booted with two processors:

  $ pwd
  /sys/firmware/devicetree/base/cpus
  $ ls -1d */
  l2-cache@2010/
  l2-cache@2011/
  l3-cache@3110/
  l3-cache@3111/
  PowerPC,POWER9@0/
  PowerPC,POWER9@8/
  $ lsprop */l2-cache
  l2-cache@2010/l2-cache
                 00003110 (12560)
  l2-cache@2011/l2-cache
                 00003111 (12561)
  PowerPC,POWER9@0/l2-cache
                 00002010 (8208)
  PowerPC,POWER9@8/l2-cache
                 00002011 (8209)
  $ ls /sys/devices/system/cpu/cpu0/cache/
  index0  index1  index2  index3

After DLPAR-adding PowerPC,POWER9@10, we see that its associated cache
nodes are absent, its threads' L2+L3 cacheinfo is unpopulated, and it is
missing a cache level in its sched domain hierarchy:

  $ ls -1d */
  l2-cache@2010/
  l2-cache@2011/
  l3-cache@3110/
  l3-cache@3111/
  PowerPC,POWER9@0/
  PowerPC,POWER9@10/
  PowerPC,POWER9@8/
  $ lsprop PowerPC\,POWER9@10/l2-cache
  PowerPC,POWER9@10/l2-cache
                 00002012 (8210)
  $ ls /sys/devices/system/cpu/cpu16/cache/
  index0  index1
  $ grep . /sys/kernel/debug/sched/domains/cpu{0,8,16}/domain*/name
  /sys/kernel/debug/sched/domains/cpu0/domain0/name:SMT
  /sys/kernel/debug/sched/domains/cpu0/domain1/name:CACHE
  /sys/kernel/debug/sched/domains/cpu0/domain2/name:DIE
  /sys/kernel/debug/sched/domains/cpu8/domain0/name:SMT
  /sys/kernel/debug/sched/domains/cpu8/domain1/name:CACHE
  /sys/kernel/debug/sched/domains/cpu8/domain2/name:DIE
  /sys/kernel/debug/sched/domains/cpu16/domain0/name:SMT
  /sys/kernel/debug/sched/domains/cpu16/domain1/name:DIE

When removing PowerPC,POWER9@8, we see that its cache nodes are left
behind:

  $ ls -1d */
  l2-cache@2010/
  l2-cache@2011/
  l3-cache@3110/
  l3-cache@3111/
  PowerPC,POWER9@0/

When DLPAR is combined with VM migration, we can get duplicate nodes. E.g.
removing one processor, then migrating, adding a processor, and then
migrating again can result in warnings from the OF core during
post-migration device tree updates:

  Duplicate name in cpus, renamed to "l2-cache@2011#1"
  Duplicate name in cpus, renamed to "l3-cache@3111#1"

and nodes with duplicated phandles in the tree, making lookup behavior
unpredictable:

  $ lsprop l[23]-cache@*/ibm,phandle
  l2-cache@2010/ibm,phandle
                   00002010 (8208)
  l2-cache@2011#1/ibm,phandle
                   00002011 (8209)
  l2-cache@2011/ibm,phandle
                   00002011 (8209)
  l3-cache@3110/ibm,phandle
                   00003110 (12560)
  l3-cache@3111#1/ibm,phandle
                   00003111 (12561)
  l3-cache@3111/ibm,phandle
                   00003111 (12561)

Address these issues by:

* Correctly processing siblings of the node returned from
  dlpar_configure_connector().
* Removing cache nodes in the CPU remove path when it can be determined
  that they are not associated with other CPUs or caches.

Use the of_changeset API in both cases, which allows us to keep the error
handling in this code from becoming more complex while ensuring that the
device tree cannot become inconsistent.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: ac71380 ("powerpc/pseries: Add CPU dlpar remove functionality")
Fixes: 90edf18 ("powerpc/pseries: Add CPU dlpar add functionality")
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 72 +++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index d646c22e94ab..87a0fbe9cf12 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -521,6 +521,27 @@ static bool valid_cpu_drc_index(struct device_node *parent, u32 drc_index)
 	return found;
 }
 
+static int pseries_cpuhp_attach_nodes(struct device_node *dn)
+{
+	struct of_changeset cs;
+	int ret;
+
+	/*
+	 * This device node is unattached but may have siblings; open-code the
+	 * traversal.
+	 */
+	for (of_changeset_init(&cs); dn != NULL; dn = dn->sibling) {
+		ret = of_changeset_attach_node(&cs, dn);
+		if (ret)
+			goto out;
+	}
+
+	ret = of_changeset_apply(&cs);
+out:
+	of_changeset_destroy(&cs);
+	return ret;
+}
+
 static ssize_t dlpar_cpu_add(u32 drc_index)
 {
 	struct device_node *dn, *parent;
@@ -563,7 +584,7 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
 		return -EINVAL;
 	}
 
-	rc = dlpar_attach_node(dn, parent);
+	rc = pseries_cpuhp_attach_nodes(dn);
 
 	/* Regardless we are done with parent now */
 	of_node_put(parent);
@@ -600,6 +621,53 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
 	return rc;
 }
 
+static unsigned int pseries_cpuhp_cache_use_count(const struct device_node *cachedn)
+{
+	unsigned int use_count = 0;
+	struct device_node *dn;
+
+	WARN_ON(!of_node_is_type(cachedn, "cache"));
+
+	for_each_of_cpu_node(dn) {
+		if (of_find_next_cache_node(dn) == cachedn)
+			use_count++;
+	}
+
+	for_each_node_by_type(dn, "cache") {
+		if (of_find_next_cache_node(dn) == cachedn)
+			use_count++;
+	}
+
+	return use_count;
+}
+
+static int pseries_cpuhp_detach_nodes(struct device_node *cpudn)
+{
+	struct device_node *dn;
+	struct of_changeset cs;
+	int ret = 0;
+
+	of_changeset_init(&cs);
+	ret = of_changeset_detach_node(&cs, cpudn);
+	if (ret)
+		goto out;
+
+	dn = cpudn;
+	while ((dn = of_find_next_cache_node(dn))) {
+		if (pseries_cpuhp_cache_use_count(dn) > 1)
+			break;
+
+		ret = of_changeset_detach_node(&cs, dn);
+		if (ret)
+			goto out;
+	}
+
+	ret = of_changeset_apply(&cs);
+out:
+	of_changeset_destroy(&cs);
+	return ret;
+}
+
 static ssize_t dlpar_cpu_remove(struct device_node *dn, u32 drc_index)
 {
 	int rc;
@@ -621,7 +689,7 @@ static ssize_t dlpar_cpu_remove(struct device_node *dn, u32 drc_index)
 		return rc;
 	}
 
-	rc = dlpar_detach_node(dn);
+	rc = pseries_cpuhp_detach_nodes(dn);
 	if (rc) {
 		int saved_rc = rc;
 
-- 
2.31.1

