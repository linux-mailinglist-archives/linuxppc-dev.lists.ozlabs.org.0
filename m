Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD33E3F68
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 07:29:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gjl4X0tb7z3cGL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 15:29:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nahnK/TR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nahnK/TR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gjl01305Mz30Hl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Aug 2021 15:25:05 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179556c9131109; Mon, 9 Aug 2021 01:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=0uocqdoIKbHFTki1gcd6GsjNWZlOqSMjjFs8a1i2zOo=;
 b=nahnK/TRuSS2eFCC29DqEuwtUqioBYRkJwDofnFkrJKGKvvWaslmlCY2bbOsKjIKnzXO
 xkbph7ew2ACHLQe03MKiYu9rj7444OnvVzgjRpQNL7jkS8OPB31UFkuVovdZyCfMxZso
 PqE76w1p3xsCjgVGH19OQySeGTOLKSjSHttnSr1foQq/iqQ3wEccnF6RVS+hxABpc5Xh
 reyZawVSafjiVZPPzCVs6XyFPF4yV0olaJjn0MIHeYn29wlt9diSCtCj86v8ffHw0cNC
 FUD1sPyBRYzQnb6q6nsLAaAqkQZN8VazKksBzyWEgDRgR/fOmZrzXrAlenZUiA9dXpmk Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aa78b3vbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 01:24:59 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17955B8A131547;
 Mon, 9 Aug 2021 01:24:59 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aa78b3vb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 01:24:59 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1795HWtZ021360;
 Mon, 9 Aug 2021 05:24:58 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 3a9htaadfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 05:24:58 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1795Ovd053739924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 05:24:57 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6CF9B2065;
 Mon,  9 Aug 2021 05:24:57 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EA01B2064;
 Mon,  9 Aug 2021 05:24:55 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.58.86])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  9 Aug 2021 05:24:54 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 5/6] powerpc/pseries: Add support for FORM2 associativity
Date: Mon,  9 Aug 2021 10:54:33 +0530
Message-Id: <20210809052434.53978-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
References: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yInB9JSsa9ayPem0R3inb0HlT3ckIitJ
X-Proofpoint-GUID: JiRgR092ldPVp4OrzANav_PVcn7Mfkun
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_01:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090040
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PAPR interface currently supports two different ways of communicating resource
grouping details to the OS. These are referred to as Form 0 and Form 1
associativity grouping. Form 0 is the older format and is now considered
deprecated. This patch adds another resource grouping named FORM2.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 Documentation/powerpc/associativity.rst   | 103 +++++++++++++
 arch/powerpc/include/asm/firmware.h       |   3 +-
 arch/powerpc/include/asm/prom.h           |   1 +
 arch/powerpc/kernel/prom_init.c           |   3 +-
 arch/powerpc/mm/numa.c                    | 168 ++++++++++++++++++----
 arch/powerpc/platforms/pseries/firmware.c |   1 +
 6 files changed, 252 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/powerpc/associativity.rst

diff --git a/Documentation/powerpc/associativity.rst b/Documentation/powerpc/associativity.rst
new file mode 100644
index 000000000000..b6c89706ca03
--- /dev/null
+++ b/Documentation/powerpc/associativity.rst
@@ -0,0 +1,103 @@
+============================
+NUMA resource associativity
+=============================
+
+Associativity represents the groupings of the various platform resources into
+domains of substantially similar mean performance relative to resources outside
+of that domain. Resources subsets of a given domain that exhibit better
+performance relative to each other than relative to other resources subsets
+are represented as being members of a sub-grouping domain. This performance
+characteristic is presented in terms of NUMA node distance within the Linux kernel.
+From the platform view, these groups are also referred to as domains.
+
+PAPR interface currently supports different ways of communicating these resource
+grouping details to the OS. These are referred to as Form 0, Form 1 and Form2
+associativity grouping. Form 0 is the oldest format and is now considered deprecated.
+
+Hypervisor indicates the type/form of associativity used via "ibm,architecture-vec-5 property".
+Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates usage of Form 0 or Form 1.
+A value of 1 indicates the usage of Form 1 associativity. For Form 2 associativity
+bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
+
+Form 0
+-----
+Form 0 associativity supports only two NUMA distances (LOCAL and REMOTE).
+
+Form 1
+-----
+With Form 1 a combination of ibm,associativity-reference-points, and ibm,associativity
+device tree properties are used to determine the NUMA distance between resource groups/domains.
+
+The “ibm,associativity” property contains a list of one or more numbers (domainID)
+representing the resource’s platform grouping domains.
+
+The “ibm,associativity-reference-points” property contains a list of one or more numbers
+(domainID index) that represents the 1 based ordinal in the associativity lists.
+The list of domainID indexes represents an increasing hierarchy of resource grouping.
+
+ex:
+{ primary domainID index, secondary domainID index, tertiary domainID index.. }
+
+Linux kernel uses the domainID at the primary domainID index as the NUMA node id.
+Linux kernel computes NUMA distance between two domains by recursively comparing
+if they belong to the same higher-level domains. For mismatch at every higher
+level of the resource group, the kernel doubles the NUMA distance between the
+comparing domains.
+
+Form 2
+-------
+Form 2 associativity format adds separate device tree properties representing NUMA node distance
+thereby making the node distance computation flexible. Form 2 also allows flexible primary
+domain numbering. With numa distance computation now detached from the index value in
+"ibm,associativity-reference-points" property, Form 2 allows a large number of primary domain
+ids at the same domainID index representing resource groups of different performance/latency
+characteristics.
+
+Hypervisor indicates the usage of FORM2 associativity using bit 2 of byte 5 in the
+"ibm,architecture-vec-5" property.
+
+"ibm,numa-lookup-index-table" property contains a list of one or more numbers representing
+the domainIDs present in the system. The offset of the domainID in this property is
+used as an index while computing numa distance information via "ibm,numa-distance-table".
+
+prop-encoded-array: The number N of the domainIDs encoded as with encode-int, followed by
+N domainID encoded as with encode-int
+
+For ex:
+"ibm,numa-lookup-index-table" =  {4, 0, 8, 250, 252}. The offset of domainID 8 (2) is used when
+computing the distance of domain 8 from other domains present in the system. For the rest of
+this document, this offset will be referred to as domain distance offset.
+
+"ibm,numa-distance-table" property contains a list of one or more numbers representing the NUMA
+distance between resource groups/domains present in the system.
+
+prop-encoded-array: The number N of the distance values encoded as with encode-int, followed by
+N distance values encoded as with encode-bytes. The max distance value we could encode is 255.
+The number N must be equal to the square of m where m is the number of domainIDs in the
+numa-lookup-index-table.
+
+For ex:
+ibm,numa-lookup-index-table =  {3, 0, 8, 40}
+ibm,numa-distance-table     =  {9:u32, 10:u8, 20:u8, 80:u8, 20:u8, 10:u8, 160:u8, 80:u8, 160:u8, 10:u8}
+
+  | 0    8   40
+--|------------
+  |
+0 | 10   20  80
+  |
+8 | 20   10  160
+  |
+40| 80   160  10
+
+A possible "ibm,associativity" property for resources in node 0, 8 and 40
+
+{ 3, 6, 7, 0 }
+{ 3, 6, 9, 8 }
+{ 3, 6, 7, 40}
+
+With "ibm,associativity-reference-points"  { 0x3 }
+
+"ibm,lookup-index-table" helps in having a compact representation of distance matrix.
+Since domainID can be sparse, the matrix of distances can also be effectively sparse.
+With "ibm,lookup-index-table" we can achieve a compact representation of
+distance information.
diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 60b631161360..97a3bd9ffeb9 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -53,6 +53,7 @@
 #define FW_FEATURE_ULTRAVISOR	ASM_CONST(0x0000004000000000)
 #define FW_FEATURE_STUFF_TCE	ASM_CONST(0x0000008000000000)
 #define FW_FEATURE_RPT_INVALIDATE ASM_CONST(0x0000010000000000)
+#define FW_FEATURE_FORM2_AFFINITY ASM_CONST(0x0000020000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -73,7 +74,7 @@ enum {
 		FW_FEATURE_HPT_RESIZE | FW_FEATURE_DRMEM_V2 |
 		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
 		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
-		FW_FEATURE_RPT_INVALIDATE,
+		FW_FEATURE_RPT_INVALIDATE | FW_FEATURE_FORM2_AFFINITY,
 	FW_FEATURE_PSERIES_ALWAYS = 0,
 	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL | FW_FEATURE_ULTRAVISOR,
 	FW_FEATURE_POWERNV_ALWAYS = 0,
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index df9fec9d232c..5c80152e8f18 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -149,6 +149,7 @@ extern int of_read_drc_info_cell(struct property **prop,
 #define OV5_XCMO		0x0440	/* Page Coalescing */
 #define OV5_FORM1_AFFINITY	0x0580	/* FORM1 NUMA affinity */
 #define OV5_PRRN		0x0540	/* Platform Resource Reassignment */
+#define OV5_FORM2_AFFINITY	0x0520	/* Form2 NUMA affinity */
 #define OV5_HP_EVT		0x0604	/* Hot Plug Event support */
 #define OV5_RESIZE_HPT		0x0601	/* Hash Page Table resizing */
 #define OV5_PFO_HW_RNG		0x1180	/* PFO Random Number Generator */
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 57db605ad33a..95a42d49e291 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1096,7 +1096,8 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
 #else
 		0,
 #endif
-		.associativity = OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRRN),
+		.associativity = OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRRN) |
+		OV5_FEAT(OV5_FORM2_AFFINITY),
 		.bin_opts = OV5_FEAT(OV5_RESIZE_HPT) | OV5_FEAT(OV5_HP_EVT),
 		.micro_checkpoint = 0,
 		.reserved0 = 0,
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index a244398a7766..fffb3c40f595 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -56,12 +56,17 @@ static int n_mem_addr_cells, n_mem_size_cells;
 
 #define FORM0_AFFINITY 0
 #define FORM1_AFFINITY 1
+#define FORM2_AFFINITY 2
 static int affinity_form;
 
 #define MAX_DISTANCE_REF_POINTS 4
 static int distance_ref_points_depth;
 static const __be32 *distance_ref_points;
 static int distance_lookup_table[MAX_NUMNODES][MAX_DISTANCE_REF_POINTS];
+static int numa_distance_table[MAX_NUMNODES][MAX_NUMNODES] = {
+	[0 ... MAX_NUMNODES - 1] = { [0 ... MAX_NUMNODES - 1] = -1 }
+};
+static int numa_id_index_table[MAX_NUMNODES] = { [0 ... MAX_NUMNODES - 1] = NUMA_NO_NODE };
 
 /*
  * Allocate node_to_cpumask_map based on number of available nodes
@@ -166,6 +171,44 @@ static void unmap_cpu_from_node(unsigned long cpu)
 }
 #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
 
+/*
+ * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
+ * info is found.
+ */
+static int associativity_to_nid(const __be32 *associativity)
+{
+	int nid = NUMA_NO_NODE;
+
+	if (!numa_enabled)
+		goto out;
+
+	if (of_read_number(associativity, 1) >= primary_domain_index)
+		nid = of_read_number(&associativity[primary_domain_index], 1);
+
+	/* POWER4 LPAR uses 0xffff as invalid node */
+	if (nid == 0xffff || nid >= nr_node_ids)
+		nid = NUMA_NO_NODE;
+out:
+	return nid;
+}
+
+static int __cpu_form2_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+{
+	int dist;
+	int node1, node2;
+
+	node1 = associativity_to_nid(cpu1_assoc);
+	node2 = associativity_to_nid(cpu2_assoc);
+
+	dist = numa_distance_table[node1][node2];
+	if (dist <= LOCAL_DISTANCE)
+		return 0;
+	else if (dist <= REMOTE_DISTANCE)
+		return 1;
+	else
+		return 2;
+}
+
 static int __cpu_form1_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 {
 	int dist = 0;
@@ -186,8 +229,9 @@ int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 {
 	/* We should not get called with FORM0 */
 	VM_WARN_ON(affinity_form == FORM0_AFFINITY);
-
-	return __cpu_form1_relative_distance(cpu1_assoc, cpu2_assoc);
+	if (affinity_form == FORM1_AFFINITY)
+		return __cpu_form1_relative_distance(cpu1_assoc, cpu2_assoc);
+	return __cpu_form2_relative_distance(cpu1_assoc, cpu2_assoc);
 }
 
 /* must hold reference to node during call */
@@ -201,7 +245,9 @@ int __node_distance(int a, int b)
 	int i;
 	int distance = LOCAL_DISTANCE;
 
-	if (affinity_form == FORM0_AFFINITY)
+	if (affinity_form == FORM2_AFFINITY)
+		return numa_distance_table[a][b];
+	else if (affinity_form == FORM0_AFFINITY)
 		return ((a == b) ? LOCAL_DISTANCE : REMOTE_DISTANCE);
 
 	for (i = 0; i < distance_ref_points_depth; i++) {
@@ -216,27 +262,6 @@ int __node_distance(int a, int b)
 }
 EXPORT_SYMBOL(__node_distance);
 
-/*
- * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
- * info is found.
- */
-static int associativity_to_nid(const __be32 *associativity)
-{
-	int nid = NUMA_NO_NODE;
-
-	if (!numa_enabled)
-		goto out;
-
-	if (of_read_number(associativity, 1) >= primary_domain_index)
-		nid = of_read_number(&associativity[primary_domain_index], 1);
-
-	/* POWER4 LPAR uses 0xffff as invalid node */
-	if (nid == 0xffff || nid >= nr_node_ids)
-		nid = NUMA_NO_NODE;
-out:
-	return nid;
-}
-
 /* Returns the nid associated with the given device tree node,
  * or -1 if not found.
  */
@@ -304,12 +329,93 @@ static void initialize_form1_numa_distance(struct device_node *node)
  */
 void update_numa_distance(struct device_node *node)
 {
+	int nid;
+
 	if (affinity_form == FORM0_AFFINITY)
 		return;
 	else if (affinity_form == FORM1_AFFINITY) {
 		initialize_form1_numa_distance(node);
 		return;
 	}
+
+	/* FORM2 affinity  */
+	nid = of_node_to_nid_single(node);
+	if (nid == NUMA_NO_NODE)
+		return;
+
+	/*
+	 * With FORM2 we expect NUMA distance of all possible NUMA
+	 * nodes to be provided during boot.
+	 */
+	WARN(numa_distance_table[nid][nid] == -1,
+	     "NUMA distance details for node %d not provided\n", nid);
+}
+
+/*
+ * ibm,numa-lookup-index-table= {N, domainid1, domainid2, ..... domainidN}
+ * ibm,numa-distance-table = { N, 1, 2, 4, 5, 1, 6, .... N elements}
+ */
+static void initialize_form2_numa_distance_lookup_table(void)
+{
+	int i, j;
+	struct device_node *root;
+	const __u8 *numa_dist_table;
+	const __be32 *numa_lookup_index;
+	int numa_dist_table_length;
+	int max_numa_index, distance_index;
+
+	if (firmware_has_feature(FW_FEATURE_OPAL))
+		root = of_find_node_by_path("/ibm,opal");
+	else
+		root = of_find_node_by_path("/rtas");
+	if (!root)
+		root = of_find_node_by_path("/");
+
+	numa_lookup_index = of_get_property(root, "ibm,numa-lookup-index-table", NULL);
+	max_numa_index = of_read_number(&numa_lookup_index[0], 1);
+
+	/* first element of the array is the size and is encode-int */
+	numa_dist_table = of_get_property(root, "ibm,numa-distance-table", NULL);
+	numa_dist_table_length = of_read_number((const __be32 *)&numa_dist_table[0], 1);
+	/* Skip the size which is encoded int */
+	numa_dist_table += sizeof(__be32);
+
+	pr_debug("numa_dist_table_len = %d, numa_dist_indexes_len = %d\n",
+		 numa_dist_table_length, max_numa_index);
+
+	for (i = 0; i < max_numa_index; i++)
+		/* +1 skip the max_numa_index in the property */
+		numa_id_index_table[i] = of_read_number(&numa_lookup_index[i + 1], 1);
+
+
+	if (numa_dist_table_length != max_numa_index * max_numa_index) {
+
+		WARN(1, "Wrong NUMA distance information\n");
+		/* consider everybody else just remote. */
+		for (i = 0;  i < max_numa_index; i++) {
+			for (j = 0; j < max_numa_index; j++) {
+				int nodeA = numa_id_index_table[i];
+				int nodeB = numa_id_index_table[j];
+
+				if (nodeA == nodeB)
+					numa_distance_table[nodeA][nodeB] = LOCAL_DISTANCE;
+				else
+					numa_distance_table[nodeA][nodeB] = REMOTE_DISTANCE;
+			}
+		}
+	}
+
+	distance_index = 0;
+	for (i = 0;  i < max_numa_index; i++) {
+		for (j = 0; j < max_numa_index; j++) {
+			int nodeA = numa_id_index_table[i];
+			int nodeB = numa_id_index_table[j];
+
+			numa_distance_table[nodeA][nodeB] = numa_dist_table[distance_index++];
+			pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, numa_distance_table[nodeA][nodeB]);
+		}
+	}
+	of_node_put(root);
 }
 
 static int __init find_primary_domain_index(void)
@@ -322,6 +428,9 @@ static int __init find_primary_domain_index(void)
 	 */
 	if (firmware_has_feature(FW_FEATURE_OPAL)) {
 		affinity_form = FORM1_AFFINITY;
+	} else if (firmware_has_feature(FW_FEATURE_FORM2_AFFINITY)) {
+		dbg("Using form 2 affinity\n");
+		affinity_form = FORM2_AFFINITY;
 	} else if (firmware_has_feature(FW_FEATURE_FORM1_AFFINITY)) {
 		dbg("Using form 1 affinity\n");
 		affinity_form = FORM1_AFFINITY;
@@ -366,9 +475,12 @@ static int __init find_primary_domain_index(void)
 
 		index = of_read_number(&distance_ref_points[1], 1);
 	} else {
+		/*
+		 * Both FORM1 and FORM2 affinity find the primary domain details
+		 * at the same offset.
+		 */
 		index = of_read_number(distance_ref_points, 1);
 	}
-
 	/*
 	 * Warn and cap if the hardware supports more than
 	 * MAX_DISTANCE_REF_POINTS domains.
@@ -807,6 +919,12 @@ static int __init parse_numa_properties(void)
 
 	dbg("NUMA associativity depth for CPU/Memory: %d\n", primary_domain_index);
 
+	/*
+	 * If it is FORM2 initialize the distance table here.
+	 */
+	if (affinity_form == FORM2_AFFINITY)
+		initialize_form2_numa_distance_lookup_table();
+
 	/*
 	 * Even though we connect cpus to numa domains later in SMP
 	 * init, we need to know the node ids now. This is because
diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
index 5d4c2bc20bba..f162156b7b68 100644
--- a/arch/powerpc/platforms/pseries/firmware.c
+++ b/arch/powerpc/platforms/pseries/firmware.c
@@ -123,6 +123,7 @@ vec5_fw_features_table[] = {
 	{FW_FEATURE_PRRN,		OV5_PRRN},
 	{FW_FEATURE_DRMEM_V2,		OV5_DRMEM_V2},
 	{FW_FEATURE_DRC_INFO,		OV5_DRC_INFO},
+	{FW_FEATURE_FORM2_AFFINITY,	OV5_FORM2_AFFINITY},
 };
 
 static void __init fw_vec5_feature_init(const char *vec5, unsigned long len)
-- 
2.31.1

