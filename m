Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656623EA5A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 15:25:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlnVx1X7Bz3dHP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 23:25:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ijjP0RS5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ijjP0RS5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlnRx734lz3bhx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 23:22:53 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17CD4frW167117; Thu, 12 Aug 2021 09:22:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TyW9XbY7Z8gp/JocfuWGQ06NlY59jGWxeSGdV7WhNKg=;
 b=ijjP0RS5a/YyisOSefhtph1Z0kgp/A1V/NUzeinuCdxMKbeNpPr8gLr6OS8pw08M5fTU
 8FKUEtDc2cSGDhcNb5DJbUFkbwDeHGouWtTaempk8+vTA8hk8pacJjRVl/zVn1eq58Gr
 Gydd+xSLlHTDB+RDunS5HrywOAJdzKQWW+BMC/bp1jvt0+O4b175xWDICLda2v4ykUOd
 FO2J+dwYlPQ87DdjSxJQ//ePT6bg8UhJ1WUxM7gtY6ji8OZ3BAquaLqu1CJsfX9Ho2xA
 Y/dM4ycUmm8eiwppwivKiBnE6uXjOn0+iKU9emKvUz8r+S1m6niqfDl0B5X/7cZUIFOg Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acur509je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 09:22:45 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17CD6V5m183799;
 Thu, 12 Aug 2021 09:22:45 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acur509j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 09:22:45 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17CDCufI003146;
 Thu, 12 Aug 2021 13:22:44 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3a9htftmpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 13:22:44 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17CDMgJt24314330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Aug 2021 13:22:42 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81AAF6E05F;
 Thu, 12 Aug 2021 13:22:42 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 214526E054;
 Thu, 12 Aug 2021 13:22:40 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.50.186])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 12 Aug 2021 13:22:39 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v8 3/5] powerpc/pseries: Consolidate different NUMA distance
 update code paths
Date: Thu, 12 Aug 2021 18:52:21 +0530
Message-Id: <20210812132223.225214-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210812132223.225214-1-aneesh.kumar@linux.ibm.com>
References: <20210812132223.225214-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V8TDGIHkWvgb8myUUHmQF-1MR_9LTgq8
X-Proofpoint-GUID: WrslQPI1hwJF2VWSr-bgj5bJlKBJGYJW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-12_04:2021-08-12,
 2021-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120085
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

The associativity details of the newly added resourced are collected from
the hypervisor via "ibm,configure-connector" rtas call. Update the numa
distance details of the newly added numa node after the above call.

Instead of updating NUMA distance every time we lookup a node id
from the associativity property, add helpers that can be used
during boot which does this only once. Also remove the distance
update from node id lookup helpers.

Currently, we duplicate parsing code for ibm,associativity and
ibm,associativity-lookup-arrays in the kernel. The associativity array provided
by these device tree properties are very similar and hence can use
a helper to parse the node id and numa distance details.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h           |   2 +
 arch/powerpc/mm/numa.c                        | 212 +++++++++++++-----
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |   2 +
 .../platforms/pseries/hotplug-memory.c        |   2 +
 4 files changed, 161 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index e4db64c0e184..a6425a70c37b 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -64,6 +64,7 @@ static inline int early_cpu_to_node(int cpu)
 }
 
 int of_drconf_to_nid_single(struct drmem_lmb *lmb);
+void update_numa_distance(struct device_node *node);
 
 #else
 
@@ -93,6 +94,7 @@ static inline int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 	return first_online_node;
 }
 
+static inline void update_numa_distance(struct device_node *node) {}
 #endif /* CONFIG_NUMA */
 
 #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 368719b14dcc..c0a89839310c 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -208,50 +208,35 @@ int __node_distance(int a, int b)
 }
 EXPORT_SYMBOL(__node_distance);
 
-static void initialize_distance_lookup_table(int nid,
-		const __be32 *associativity)
+static int __associativity_to_nid(const __be32 *associativity,
+				  int max_array_sz)
 {
-	int i;
+	int nid;
+	/*
+	 * primary_domain_index is 1 based array index.
+	 */
+	int index = primary_domain_index  - 1;
 
-	if (affinity_form != FORM1_AFFINITY)
-		return;
+	if (!numa_enabled || index >= max_array_sz)
+		return NUMA_NO_NODE;
 
-	for (i = 0; i < distance_ref_points_depth; i++) {
-		const __be32 *entry;
+	nid = of_read_number(&associativity[index], 1);
 
-		entry = &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
-		distance_lookup_table[nid][i] = of_read_number(entry, 1);
-	}
+	/* POWER4 LPAR uses 0xffff as invalid node */
+	if (nid == 0xffff || nid >= nr_node_ids)
+		nid = NUMA_NO_NODE;
+	return nid;
 }
-
 /*
  * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
  * info is found.
  */
 static int associativity_to_nid(const __be32 *associativity)
 {
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
-
-	if (nid > 0 &&
-		of_read_number(associativity, 1) >= distance_ref_points_depth) {
-		/*
-		 * Skip the length field and send start of associativity array
-		 */
-		initialize_distance_lookup_table(nid, associativity + 1);
-	}
+	int array_sz = of_read_number(associativity, 1);
 
-out:
-	return nid;
+	/* Skip the first element in the associativity array */
+	return __associativity_to_nid((associativity + 1), array_sz);
 }
 
 /* Returns the nid associated with the given device tree node,
@@ -287,6 +272,60 @@ int of_node_to_nid(struct device_node *device)
 }
 EXPORT_SYMBOL(of_node_to_nid);
 
+static void __initialize_form1_numa_distance(const __be32 *associativity,
+					     int max_array_sz)
+{
+	int i, nid;
+
+	if (affinity_form != FORM1_AFFINITY)
+		return;
+
+	nid = __associativity_to_nid(associativity, max_array_sz);
+	if (nid != NUMA_NO_NODE) {
+		for (i = 0; i < distance_ref_points_depth; i++) {
+			const __be32 *entry;
+			int index = be32_to_cpu(distance_ref_points[i]) - 1;
+
+			/*
+			 * broken hierarchy, return with broken distance table
+			 */
+			if (WARN(index >= max_array_sz, "Broken ibm,associativity property"))
+				return;
+
+			entry = &associativity[index];
+			distance_lookup_table[nid][i] = of_read_number(entry, 1);
+		}
+	}
+}
+
+static void initialize_form1_numa_distance(const __be32 *associativity)
+{
+	int array_sz;
+
+	array_sz = of_read_number(associativity, 1);
+	/* Skip the first element in the associativity array */
+	__initialize_form1_numa_distance(associativity + 1, array_sz);
+}
+
+/*
+ * Used to update distance information w.r.t newly added node.
+ */
+void update_numa_distance(struct device_node *node)
+{
+	if (affinity_form == FORM0_AFFINITY)
+		return;
+	else if (affinity_form == FORM1_AFFINITY) {
+		const __be32 *associativity;
+
+		associativity = of_get_associativity(node);
+		if (!associativity)
+			return;
+
+		initialize_form1_numa_distance(associativity);
+		return;
+	}
+}
+
 static int __init find_primary_domain_index(void)
 {
 	int index;
@@ -433,6 +472,38 @@ static int of_get_assoc_arrays(struct assoc_arrays *aa)
 	return 0;
 }
 
+static int get_nid_and_numa_distance(struct drmem_lmb *lmb)
+{
+	struct assoc_arrays aa = { .arrays = NULL };
+	int default_nid = NUMA_NO_NODE;
+	int nid = default_nid;
+	int rc, index;
+
+	if ((primary_domain_index < 0) || !numa_enabled)
+		return default_nid;
+
+	rc = of_get_assoc_arrays(&aa);
+	if (rc)
+		return default_nid;
+
+	if (primary_domain_index <= aa.array_sz &&
+	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
+		const __be32 *associativity;
+
+		index = lmb->aa_index * aa.array_sz;
+		associativity = &aa.arrays[index];
+		nid = __associativity_to_nid(associativity, aa.array_sz);
+		if (nid > 0 && affinity_form == FORM1_AFFINITY) {
+			/*
+			 * lookup array associativity entries have
+			 * no length of the array as the first element.
+			 */
+			__initialize_form1_numa_distance(associativity, aa.array_sz);
+		}
+	}
+	return nid;
+}
+
 /*
  * This is like of_node_to_nid_single() for memory represented in the
  * ibm,dynamic-reconfiguration-memory node.
@@ -453,26 +524,19 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 
 	if (primary_domain_index <= aa.array_sz &&
 	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
-		index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
-		nid = of_read_number(&aa.arrays[index], 1);
-
-		if (nid == 0xffff || nid >= nr_node_ids)
-			nid = default_nid;
+		const __be32 *associativity;
 
-		if (nid > 0) {
-			index = lmb->aa_index * aa.array_sz;
-			initialize_distance_lookup_table(nid,
-							&aa.arrays[index]);
-		}
+		index = lmb->aa_index * aa.array_sz;
+		associativity = &aa.arrays[index];
+		nid = __associativity_to_nid(associativity, aa.array_sz);
 	}
-
 	return nid;
 }
 
 #ifdef CONFIG_PPC_SPLPAR
-static int vphn_get_nid(long lcpu)
+
+static int __vphn_get_associativity(long lcpu, __be32 *associativity)
 {
-	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
 	long rc, hwid;
 
 	/*
@@ -492,12 +556,30 @@ static int vphn_get_nid(long lcpu)
 
 		rc = hcall_vphn(hwid, VPHN_FLAG_VCPU, associativity);
 		if (rc == H_SUCCESS)
-			return associativity_to_nid(associativity);
+			return 0;
 	}
 
+	return -1;
+}
+
+static int vphn_get_nid(long lcpu)
+{
+	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
+
+
+	if (!__vphn_get_associativity(lcpu, associativity))
+		return associativity_to_nid(associativity);
+
 	return NUMA_NO_NODE;
+
 }
 #else
+
+static int __vphn_get_associativity(long lcpu, __be32 *associativity)
+{
+	return -1;
+}
+
 static int vphn_get_nid(long unused)
 {
 	return NUMA_NO_NODE;
@@ -692,7 +774,7 @@ static int __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
 			size = read_n_cells(n_mem_size_cells, usm);
 		}
 
-		nid = of_drconf_to_nid_single(lmb);
+		nid = get_nid_and_numa_distance(lmb);
 		fake_numa_create_new_node(((base + size) >> PAGE_SHIFT),
 					  &nid);
 		node_set_online(nid);
@@ -709,6 +791,7 @@ static int __init parse_numa_properties(void)
 	struct device_node *memory;
 	int default_nid = 0;
 	unsigned long i;
+	const __be32 *associativity;
 
 	if (numa_enabled == 0) {
 		printk(KERN_WARNING "NUMA disabled by user\n");
@@ -734,18 +817,30 @@ static int __init parse_numa_properties(void)
 	 * each node to be onlined must have NODE_DATA etc backing it.
 	 */
 	for_each_present_cpu(i) {
+		__be32 vphn_assoc[VPHN_ASSOC_BUFSIZE];
 		struct device_node *cpu;
-		int nid = vphn_get_nid(i);
+		int nid = NUMA_NO_NODE;
 
-		/*
-		 * Don't fall back to default_nid yet -- we will plug
-		 * cpus into nodes once the memory scan has discovered
-		 * the topology.
-		 */
-		if (nid == NUMA_NO_NODE) {
+		memset(vphn_assoc, 0, VPHN_ASSOC_BUFSIZE * sizeof(__be32));
+
+		if (__vphn_get_associativity(i, vphn_assoc) == 0) {
+			nid = associativity_to_nid(vphn_assoc);
+			initialize_form1_numa_distance(vphn_assoc);
+		} else {
+
+			/*
+			 * Don't fall back to default_nid yet -- we will plug
+			 * cpus into nodes once the memory scan has discovered
+			 * the topology.
+			 */
 			cpu = of_get_cpu_node(i, NULL);
 			BUG_ON(!cpu);
-			nid = of_node_to_nid_single(cpu);
+
+			associativity = of_get_associativity(cpu);
+			if (associativity) {
+				nid = associativity_to_nid(associativity);
+				initialize_form1_numa_distance(associativity);
+			}
 			of_node_put(cpu);
 		}
 
@@ -781,8 +876,11 @@ static int __init parse_numa_properties(void)
 		 * have associativity properties.  If none, then
 		 * everything goes to default_nid.
 		 */
-		nid = of_node_to_nid_single(memory);
-		if (nid < 0)
+		associativity = of_get_associativity(memory);
+		if (associativity) {
+			nid = associativity_to_nid(associativity);
+			initialize_form1_numa_distance(associativity);
+		} else
 			nid = default_nid;
 
 		fake_numa_create_new_node(((start + size) >> PAGE_SHIFT), &nid);
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 7e970f81d8ff..778b6ab35f0d 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -498,6 +498,8 @@ static ssize_t dlpar_cpu_add(u32 drc_index)
 		return saved_rc;
 	}
 
+	update_numa_distance(dn);
+
 	rc = dlpar_online_cpu(dn);
 	if (rc) {
 		saved_rc = rc;
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 377d852f5a9a..ee1d81d7e54a 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -180,6 +180,8 @@ static int update_lmb_associativity_index(struct drmem_lmb *lmb)
 		return -ENODEV;
 	}
 
+	update_numa_distance(lmb_node);
+
 	dr_node = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
 	if (!dr_node) {
 		dlpar_free_cc_nodes(lmb_node);
-- 
2.31.1

