Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCCA355B4E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 20:26:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFGFS1SNxz3bdF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 04:26:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V9lVLqrx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V9lVLqrx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFGF139fWz2ysp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 04:26:12 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 136IAcMl060224; Tue, 6 Apr 2021 14:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=o2e05gUL5BXwF168Yo63EHVn9Ti6iJ5nLKTd1VqMfgw=;
 b=V9lVLqrxBJb7yXe6GYaZ2AbFCmVlZ0VXI+xNYdQH4R4LP5KpMx8UrwAO2hN9HQMIaO8G
 yvkVJ1fXBo+RdiIYXJqWICs5KS5rPU8YBOoQ0813q9Bt80dg9e/jzO8+kIK2CFZ2zr6q
 jYJsyHypKytcw4tTsEPWPuKkQyvbWCN9148snlxZ8Sik5zilDrzJ/UwXz/7v0JBWsbN5
 itLcVEFw30TKWGmf55+qWVsRJ5EJp1rIWeCoH6D5Jynsosq+KmHYezMcs/0sKYhebFKD
 dzcH4wm3Rk254fDlo5ql5NSfsD/P39eoHW6o5tOXvxEDooWL8w4lpy0+bPlsncdjj/8f 3A== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvpj0dva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 14:26:02 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 136IH1eK017847;
 Tue, 6 Apr 2021 18:26:00 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 37rvbu80t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 18:26:00 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 136IPaoB35782930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 18:25:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D71F34C040;
 Tue,  6 Apr 2021 18:25:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 692CC4C046;
 Tue,  6 Apr 2021 18:25:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.177.144])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Apr 2021 18:25:56 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 nathanl@linux.ibm.com
Subject: [PATCH v3] pseries: prevent free CPU ids to be reused on another node
Date: Tue,  6 Apr 2021 20:25:54 +0200
Message-Id: <20210406182554.85197-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zu-PT6_r0Tnbl08TiDAM8t4qJXOhAHNk
X-Proofpoint-GUID: Zu-PT6_r0Tnbl08TiDAM8t4qJXOhAHNk
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_06:2021-04-06,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104060124
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
Cc: cheloha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a CPU is hot added, the CPU ids are taken from the available mask from
the lower possible set. If that set of values was previously used for CPU
attached to a different node, this seems to application like if these CPUs
have migrated from a node to another one which is not expected in real
life.

To prevent this, it is needed to record the CPU ids used for each node and
to not reuse them on another node. However, to prevent CPU hot plug to
fail, in the case the CPU ids is starved on a node, the capability to reuse
other nodes’ free CPU ids is kept. A warning is displayed in such a case
to warn the user.

A new CPU bit mask (node_recorded_ids_map) is introduced for each possible
node. It is populated with the CPU onlined at boot time, and then when a
CPU is hot plug to a node. The bits in that mask remain when the CPU is hot
unplugged, to remind this CPU ids have been used for this node.

The effect of this patch can be seen by removing and adding CPUs using the
Qemu monitor. In the following case, the first CPU from the node 2 is
removed, then the first one from the node 1 is removed too. Later, the
first CPU of the node 2 is added back. Without that patch, the kernel will
numbered these CPUs using the first CPU ids available which are the ones
freed when removing the second CPU of the node 0. This leads to the CPU ids
16-23 to move from the node 1 to the node 2. With the patch applied, the
CPU ids 32-39 are used since they are the lowest free ones which have not
been used on another node.

At boot time:
[root@vm40 ~]# numactl -H | grep cpus
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
node 1 cpus: 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
node 2 cpus: 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47

Vanilla kernel, after the CPU hot unplug/plug operations:
[root@vm40 ~]# numactl -H | grep cpus
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
node 1 cpus: 24 25 26 27 28 29 30 31
node 2 cpus: 16 17 18 19 20 21 22 23 40 41 42 43 44 45 46 47

Patched kernel, after the CPU hot unplug/plug operations:
[root@vm40 ~]# numactl -H | grep cpus
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
node 1 cpus: 24 25 26 27 28 29 30 31
node 2 cpus: 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47

Changes since V2, addressing Nathan's comments:
 - Remove the retry feature
 - Reduce the number of local variables (removing 'i')
 - Add comment about the cpu_add_remove_lock protecting the added CPU mask.
Changes since V1 (no functional changes):
 - update the test's output in the commit's description
 - node_recorded_ids_map should be static

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 51 ++++++++++++++++++--
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index ec478f8a98ff..f3fd4807dc3e 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -39,6 +39,12 @@
 /* This version can't take the spinlock, because it never returns */
 static int rtas_stop_self_token = RTAS_UNKNOWN_SERVICE;
 
+/*
+ * Record the CPU ids used on each nodes.
+ * Protected by cpu_add_remove_lock.
+ */
+static cpumask_var_t node_recorded_ids_map[MAX_NUMNODES];
+
 static void rtas_stop_self(void)
 {
 	static struct rtas_args args;
@@ -151,9 +157,9 @@ static void pseries_cpu_die(unsigned int cpu)
  */
 static int pseries_add_processor(struct device_node *np)
 {
-	unsigned int cpu;
+	unsigned int cpu, node;
 	cpumask_var_t candidate_mask, tmp;
-	int err = -ENOSPC, len, nthreads, i;
+	int err = -ENOSPC, len, nthreads, nid;
 	const __be32 *intserv;
 
 	intserv = of_get_property(np, "ibm,ppc-interrupt-server#s", &len);
@@ -163,9 +169,17 @@ static int pseries_add_processor(struct device_node *np)
 	zalloc_cpumask_var(&candidate_mask, GFP_KERNEL);
 	zalloc_cpumask_var(&tmp, GFP_KERNEL);
 
+	/*
+	 * Fetch from the DT nodes read by dlpar_configure_connector() the NUMA
+	 * node id the added CPU belongs to.
+	 */
+	nid = of_node_to_nid(np);
+	if (nid < 0 || !node_possible(nid))
+		nid = first_online_node;
+
 	nthreads = len / sizeof(u32);
-	for (i = 0; i < nthreads; i++)
-		cpumask_set_cpu(i, tmp);
+	for (cpu = 0; cpu < nthreads; cpu++)
+		cpumask_set_cpu(cpu, tmp);
 
 	cpu_maps_update_begin();
 
@@ -173,6 +187,19 @@ static int pseries_add_processor(struct device_node *np)
 
 	/* Get a bitmap of unoccupied slots. */
 	cpumask_xor(candidate_mask, cpu_possible_mask, cpu_present_mask);
+
+	/*
+	 * Remove free ids previously assigned on the other nodes. We can walk
+	 * only online nodes because once a node became online it is not turned
+	 * offlined back.
+	 */
+	for_each_online_node(node) {
+		if (node == nid) /* Keep our node's recorded ids */
+			continue;
+		cpumask_andnot(candidate_mask, candidate_mask,
+			       node_recorded_ids_map[node]);
+	}
+
 	if (cpumask_empty(candidate_mask)) {
 		/* If we get here, it most likely means that NR_CPUS is
 		 * less than the partition's max processors setting.
@@ -197,6 +224,9 @@ static int pseries_add_processor(struct device_node *np)
 		goto out_unlock;
 	}
 
+	/* Record the newly used CPU ids for the associate node. */
+	cpumask_or(node_recorded_ids_map[nid], node_recorded_ids_map[nid], tmp);
+
 	for_each_cpu(cpu, tmp) {
 		BUG_ON(cpu_present(cpu));
 		set_cpu_present(cpu, true);
@@ -903,6 +933,7 @@ static struct notifier_block pseries_smp_nb = {
 static int __init pseries_cpu_hotplug_init(void)
 {
 	int qcss_tok;
+	unsigned int node;
 
 #ifdef CONFIG_ARCH_CPU_PROBE_RELEASE
 	ppc_md.cpu_probe = dlpar_cpu_probe;
@@ -924,8 +955,18 @@ static int __init pseries_cpu_hotplug_init(void)
 	smp_ops->cpu_die = pseries_cpu_die;
 
 	/* Processors can be added/removed only on LPAR */
-	if (firmware_has_feature(FW_FEATURE_LPAR))
+	if (firmware_has_feature(FW_FEATURE_LPAR)) {
+		for_each_node(node) {
+			alloc_bootmem_cpumask_var(&node_recorded_ids_map[node]);
+
+			/* Record ids of CPU added at boot time */
+			cpumask_or(node_recorded_ids_map[node],
+				   node_recorded_ids_map[node],
+				   node_to_cpumask_map[node]);
+		}
+
 		of_reconfig_notifier_register(&pseries_smp_nb);
+	}
 
 	return 0;
 }
-- 
2.31.1

