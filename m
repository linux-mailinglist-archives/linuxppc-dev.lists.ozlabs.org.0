Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5483E3F66
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 07:27:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gjl2w2kxDz3dDN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 15:27:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NRl1bYDv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NRl1bYDv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gjkzt0NRKz2yLk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Aug 2021 15:24:57 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17953f4P091898; Mon, 9 Aug 2021 01:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=phYCrM7x7tr8q/wiGmx1gFMw8D5vSPwuoQ2/a2BEbBw=;
 b=NRl1bYDvlq8EprLRR82vMPwedSGpZZ62ALGwraefzejlxfgNWGOTwBla0rtaQVkGc/It
 +SKqKpYR67Whny2K3voyqdw0LfmkxNgMhvx/hDzxS8lILN9iGKNzjAwzS1TvQH5Vp4R9
 r6yfx9NWIKI1CI3YWXBsBWYYpRalSKVB8YBFOUq2BMDNhAx3bJBHi3mdOIj/FtUoEaO/
 DqdenQOiaAoOwtOSNTFvkcpqe8QRXmSLKpOWTj5DK28OP6GG8uihd7pzsW3nnAItaQM/
 1Z8DAK43tqOan6w8bM0viERrNjc1OmHVnSltSbaDQpTWLwRB1WsWYX2MSIFoIAZSwGAn TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa74hwsmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 01:24:54 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1795BUfH126134;
 Mon, 9 Aug 2021 01:24:53 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa74hwsm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 01:24:53 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1795HBkJ006414;
 Mon, 9 Aug 2021 05:24:52 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3aapj886wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 05:24:52 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1795Opjc44892498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 05:24:51 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 911DAB2065;
 Mon,  9 Aug 2021 05:24:51 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A0D4B205F;
 Mon,  9 Aug 2021 05:24:49 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.58.86])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  9 Aug 2021 05:24:48 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 3/6] powerpc/pseries: Consolidate different NUMA distance
 update code paths
Date: Mon,  9 Aug 2021 10:54:31 +0530
Message-Id: <20210809052434.53978-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
References: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: psqc8PEZUIxYR0N8vHutQecr6Y07Bk-r
X-Proofpoint-GUID: w6CmEu2LbLGFo_f42cVuj4gLsoFMrhrh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_01:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 phishscore=0
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

The associativity details of the newly added resourced are collected from
the hypervisor via "ibm,configure-connector" rtas call. Update the numa
distance details of the newly added numa node after the above call.

Instead of updating NUMA distance every time we lookup a node id
from the associativity property, add helpers that can be used
during boot which does this only once. Also remove the distance
update from node id lookup helpers.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h           |   2 +
 arch/powerpc/mm/numa.c                        | 178 +++++++++++++-----
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |   2 +
 .../platforms/pseries/hotplug-memory.c        |   2 +
 4 files changed, 138 insertions(+), 46 deletions(-)

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
index 368719b14dcc..c695faf67d68 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -208,22 +208,6 @@ int __node_distance(int a, int b)
 }
 EXPORT_SYMBOL(__node_distance);
 
-static void initialize_distance_lookup_table(int nid,
-		const __be32 *associativity)
-{
-	int i;
-
-	if (affinity_form != FORM1_AFFINITY)
-		return;
-
-	for (i = 0; i < distance_ref_points_depth; i++) {
-		const __be32 *entry;
-
-		entry = &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
-		distance_lookup_table[nid][i] = of_read_number(entry, 1);
-	}
-}
-
 /*
  * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
  * info is found.
@@ -241,15 +225,6 @@ static int associativity_to_nid(const __be32 *associativity)
 	/* POWER4 LPAR uses 0xffff as invalid node */
 	if (nid == 0xffff || nid >= nr_node_ids)
 		nid = NUMA_NO_NODE;
-
-	if (nid > 0 &&
-		of_read_number(associativity, 1) >= distance_ref_points_depth) {
-		/*
-		 * Skip the length field and send start of associativity array
-		 */
-		initialize_distance_lookup_table(nid, associativity + 1);
-	}
-
 out:
 	return nid;
 }
@@ -287,6 +262,48 @@ int of_node_to_nid(struct device_node *device)
 }
 EXPORT_SYMBOL(of_node_to_nid);
 
+static void __initialize_form1_numa_distance(const __be32 *associativity)
+{
+	int i, nid;
+
+	if (affinity_form != FORM1_AFFINITY)
+		return;
+
+	nid = associativity_to_nid(associativity);
+	if (nid != NUMA_NO_NODE) {
+		for (i = 0; i < distance_ref_points_depth; i++) {
+			const __be32 *entry;
+
+			entry = &associativity[be32_to_cpu(distance_ref_points[i])];
+			distance_lookup_table[nid][i] = of_read_number(entry, 1);
+		}
+	}
+}
+
+static void initialize_form1_numa_distance(struct device_node *node)
+{
+	const __be32 *associativity;
+
+	associativity = of_get_associativity(node);
+	if (!associativity)
+		return;
+
+	__initialize_form1_numa_distance(associativity);
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
+		initialize_form1_numa_distance(node);
+		return;
+	}
+}
+
 static int __init find_primary_domain_index(void)
 {
 	int index;
@@ -433,6 +450,48 @@ static int of_get_assoc_arrays(struct assoc_arrays *aa)
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
+		index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
+		nid = of_read_number(&aa.arrays[index], 1);
+
+		if (nid == 0xffff || nid >= nr_node_ids)
+			nid = default_nid;
+		if (nid > 0 && affinity_form == FORM1_AFFINITY) {
+			int i;
+			const __be32 *associativity;
+
+			index = lmb->aa_index * aa.array_sz;
+			associativity = &aa.arrays[index];
+			/*
+			 * lookup array associativity entries have different format
+			 * There is no length of the array as the first element.
+			 */
+			for (i = 0; i < distance_ref_points_depth; i++) {
+				const __be32 *entry;
+
+				entry = &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
+				distance_lookup_table[nid][i] = of_read_number(entry, 1);
+			}
+		}
+	}
+	return nid;
+}
+
 /*
  * This is like of_node_to_nid_single() for memory represented in the
  * ibm,dynamic-reconfiguration-memory node.
@@ -458,21 +517,14 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 
 		if (nid == 0xffff || nid >= nr_node_ids)
 			nid = default_nid;
-
-		if (nid > 0) {
-			index = lmb->aa_index * aa.array_sz;
-			initialize_distance_lookup_table(nid,
-							&aa.arrays[index]);
-		}
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
@@ -492,12 +544,30 @@ static int vphn_get_nid(long lcpu)
 
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
@@ -692,7 +762,7 @@ static int __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
 			size = read_n_cells(n_mem_size_cells, usm);
 		}
 
-		nid = of_drconf_to_nid_single(lmb);
+		nid = get_nid_and_numa_distance(lmb);
 		fake_numa_create_new_node(((base + size) >> PAGE_SHIFT),
 					  &nid);
 		node_set_online(nid);
@@ -709,6 +779,7 @@ static int __init parse_numa_properties(void)
 	struct device_node *memory;
 	int default_nid = 0;
 	unsigned long i;
+	const __be32 *associativity;
 
 	if (numa_enabled == 0) {
 		printk(KERN_WARNING "NUMA disabled by user\n");
@@ -734,18 +805,30 @@ static int __init parse_numa_properties(void)
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
+			__initialize_form1_numa_distance(vphn_assoc);
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
+				__initialize_form1_numa_distance(associativity);
+			}
 			of_node_put(cpu);
 		}
 
@@ -781,8 +864,11 @@ static int __init parse_numa_properties(void)
 		 * have associativity properties.  If none, then
 		 * everything goes to default_nid.
 		 */
-		nid = of_node_to_nid_single(memory);
-		if (nid < 0)
+		associativity = of_get_associativity(memory);
+		if (associativity) {
+			nid = associativity_to_nid(associativity);
+			__initialize_form1_numa_distance(associativity);
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

