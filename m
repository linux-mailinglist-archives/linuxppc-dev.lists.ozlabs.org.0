Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3755357086
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 17:38:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFpTJ4Dztz3bsc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 01:38:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g0B6WJiY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=g0B6WJiY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFpSs6N3jz2y0C
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 01:38:21 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137FXfZm158849; Wed, 7 Apr 2021 11:38:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=GlXnQunDufATQ+KZ1mXpYeLrka5deUrsxFY90g2T3v4=;
 b=g0B6WJiYk3/BKUUsOnkWlK+qa4zPSmcRBa3DngopL1VAiXsdlD1NrNC5pJYDMukOnnmM
 rwDeQrlLqe+u52daWpBtlo6KrPrz/0TjrRjlCf4Fwmn+e6NBILWiLr2nqW+2PEttah/l
 WzM8d49lw99SsuImXZOcDFLrBRLf0g6ic26dVHmaH8zmAdvE1tkim4Vv6VfA0PzuzyES
 QwdozFlBgMdQzUlvTZPb3D5gl1paBYpHJM4QpkwIrnEMJbCEJ5/c61K5BCStV2Vo46f8
 YnQPceUNvhZOonKojE+fDl0tqtARpzxS4Ssi/GqcHFSyt0F9MU40Q4DCPhaf5X6wqLiG FQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37rvm4nxca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 11:38:14 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137FbGnd006017;
 Wed, 7 Apr 2021 15:38:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 37rvbu8ugs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 15:38:12 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137Fc9Lx50528648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 15:38:09 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B13D411C04C;
 Wed,  7 Apr 2021 15:38:09 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5055B11C04A;
 Wed,  7 Apr 2021 15:38:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.159.151])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Apr 2021 15:38:09 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 nathanl@linux.ibm.com
Subject: [PATCH v4] pseries: prevent free CPU ids to be reused on another node
Date: Wed,  7 Apr 2021 17:38:08 +0200
Message-Id: <20210407153808.59993-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kNeKRjadjUe_JAGlCTFaxDJHW1mUzB5F
X-Proofpoint-ORIG-GUID: kNeKRjadjUe_JAGlCTFaxDJHW1mUzB5F
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_08:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070109
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

Changes since V3, addressing Nathan's comment:
 - Rename the local variable named 'nid' into 'assigned_node'
Changes since V2, addressing Nathan's comments:
 - Remove the retry feature
 - Reduce the number of local variables (removing 'i')
 - Add comment about the cpu_add_remove_lock protecting the added CPU mask.
Changes since V1 (no functional changes):
 - update the test's output in the commit's description
 - node_recorded_ids_map should be static

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 52 ++++++++++++++++++--
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index ec478f8a98ff..cddf6d2db786 100644
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
+	int err = -ENOSPC, len, nthreads, assigned_node;
 	const __be32 *intserv;
 
 	intserv = of_get_property(np, "ibm,ppc-interrupt-server#s", &len);
@@ -163,9 +169,17 @@ static int pseries_add_processor(struct device_node *np)
 	zalloc_cpumask_var(&candidate_mask, GFP_KERNEL);
 	zalloc_cpumask_var(&tmp, GFP_KERNEL);
 
+	/*
+	 * Fetch from the DT nodes read by dlpar_configure_connector() the NUMA
+	 * node id the added CPU belongs to.
+	 */
+	assigned_node = of_node_to_nid(np);
+	if (assigned_node < 0 || !node_possible(assigned_node))
+		assigned_node = first_online_node;
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
+		if (node == assigned_node) /* Keep our node's recorded ids */
+			continue;
+		cpumask_andnot(candidate_mask, candidate_mask,
+			       node_recorded_ids_map[node]);
+	}
+
 	if (cpumask_empty(candidate_mask)) {
 		/* If we get here, it most likely means that NR_CPUS is
 		 * less than the partition's max processors setting.
@@ -197,6 +224,10 @@ static int pseries_add_processor(struct device_node *np)
 		goto out_unlock;
 	}
 
+	/* Record the newly used CPU ids for the associate node. */
+	cpumask_or(node_recorded_ids_map[assigned_node],
+		   node_recorded_ids_map[assigned_node], tmp);
+
 	for_each_cpu(cpu, tmp) {
 		BUG_ON(cpu_present(cpu));
 		set_cpu_present(cpu, true);
@@ -903,6 +934,7 @@ static struct notifier_block pseries_smp_nb = {
 static int __init pseries_cpu_hotplug_init(void)
 {
 	int qcss_tok;
+	unsigned int node;
 
 #ifdef CONFIG_ARCH_CPU_PROBE_RELEASE
 	ppc_md.cpu_probe = dlpar_cpu_probe;
@@ -924,8 +956,18 @@ static int __init pseries_cpu_hotplug_init(void)
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

