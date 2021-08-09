Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB43E3F69
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 07:29:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gjl5T5h4wz3dTH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Aug 2021 15:29:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SQ4U+or8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SQ4U+or8; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gjl041V5xz3bT9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Aug 2021 15:25:08 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17954O1F025759; Mon, 9 Aug 2021 01:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NL5Ub1UOwwUM/2U723bNx984LFsfnOFuvLXm64BdijI=;
 b=SQ4U+or8pfNyApPu5nec2eQWCgyBg2dX2Cv5zu3ASO8H+VPFjIm+90oQLDdiIDx0CCK1
 KcpM77TiG0ZDvHsrZwXOCefQpzoKx249YbxPmjDoMpUgSxrjZXO2IrlQlS2G6Gd4r2BX
 +TJECEABgFNKigcsrhyhkiUD3DFeUJItLgx+eqzO4bgyeqPtn/pG1RO5V5ltt+XXQZ+2
 W7q8DH/Vwc3cLi3kj3C4vWtklC5uMnpifveNqeefZgl910Ckb9hfK6eqgu4c8tyHcvM7
 xJLOdr8GtgdHYvuLsBw34DoH85GC/ekGyDgLdkqREceejByxYdEGyzqeIKEnAfKasJEG XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa7dxvqnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 01:25:02 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17954gBU027133;
 Mon, 9 Aug 2021 01:25:02 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa7dxvqnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 01:25:02 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1795HVwb021196;
 Mon, 9 Aug 2021 05:25:01 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3a9htaadgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 05:25:01 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1795P0xA21430694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Aug 2021 05:25:01 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5B28B206A;
 Mon,  9 Aug 2021 05:25:00 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 591E7B2064;
 Mon,  9 Aug 2021 05:24:58 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.58.86])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  9 Aug 2021 05:24:58 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 6/6] powerpc/pseries: Consolidate form1 distance
 initialization into a helper
Date: Mon,  9 Aug 2021 10:54:34 +0530
Message-Id: <20210809052434.53978-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
References: <20210809052434.53978-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6fHaDrLUdYqIWWdk2Tl9XVtsrWHDfqMy
X-Proofpoint-GUID: zcdoDEq_XB2wrndfTN99xaVx9b5ZPFIM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_01:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090040
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

Currently, we duplicate parsing code for ibm,associativity and
ibm,associativity-lookup-arrays in the kernel. The associativity array provided
by these device tree properties are very similar and hence can use
a helper to parse the node id and numa distance details.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 104 +++++++++++++++++++++++------------------
 1 file changed, 58 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index fffb3c40f595..e6d47fcba335 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -171,26 +171,36 @@ static void unmap_cpu_from_node(unsigned long cpu)
 }
 #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
 
-/*
- * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
- * info is found.
- */
-static int associativity_to_nid(const __be32 *associativity)
+static int __associativity_to_nid(const __be32 *associativity,
+				  int max_array_sz)
 {
-	int nid = NUMA_NO_NODE;
+	int nid;
+	/*
+	 * primary_domain_index is 1 based array index.
+	 */
+	int index = primary_domain_index  - 1;
 
-	if (!numa_enabled)
-		goto out;
+	if (!numa_enabled || index >= max_array_sz)
+		return NUMA_NO_NODE;
 
-	if (of_read_number(associativity, 1) >= primary_domain_index)
-		nid = of_read_number(&associativity[primary_domain_index], 1);
+	nid = of_read_number(&associativity[index], 1);
 
 	/* POWER4 LPAR uses 0xffff as invalid node */
 	if (nid == 0xffff || nid >= nr_node_ids)
 		nid = NUMA_NO_NODE;
-out:
 	return nid;
 }
+/*
+ * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
+ * info is found.
+ */
+static int associativity_to_nid(const __be32 *associativity)
+{
+	int array_sz = of_read_number(associativity, 1);
+
+	/* Skip the first element in the associativity array */
+	return __associativity_to_nid((associativity + 1), array_sz);
+}
 
 static int __cpu_form2_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 {
@@ -295,33 +305,39 @@ int of_node_to_nid(struct device_node *device)
 }
 EXPORT_SYMBOL(of_node_to_nid);
 
-static void __initialize_form1_numa_distance(const __be32 *associativity)
+static void __initialize_form1_numa_distance(const __be32 *associativity,
+					     int max_array_sz)
 {
 	int i, nid;
 
 	if (affinity_form != FORM1_AFFINITY)
 		return;
 
-	nid = associativity_to_nid(associativity);
+	nid = __associativity_to_nid(associativity, max_array_sz);
 	if (nid != NUMA_NO_NODE) {
 		for (i = 0; i < distance_ref_points_depth; i++) {
 			const __be32 *entry;
+			int index = be32_to_cpu(distance_ref_points[i]) - 1;
+
+			/*
+			 * broken hierarchy, return with broken distance table
+			 */
+			if (WARN(index >= max_array_sz, "Broken ibm,associativity property"))
+				return;
 
-			entry = &associativity[be32_to_cpu(distance_ref_points[i])];
+			entry = &associativity[index];
 			distance_lookup_table[nid][i] = of_read_number(entry, 1);
 		}
 	}
 }
 
-static void initialize_form1_numa_distance(struct device_node *node)
+static void initialize_form1_numa_distance(const __be32 *associativity)
 {
-	const __be32 *associativity;
-
-	associativity = of_get_associativity(node);
-	if (!associativity)
-		return;
+	int array_sz;
 
-	__initialize_form1_numa_distance(associativity);
+	array_sz = of_read_number(associativity, 1);
+	/* Skip the first element in the associativity array */
+	__initialize_form1_numa_distance(associativity + 1, array_sz);
 }
 
 /*
@@ -334,7 +350,13 @@ void update_numa_distance(struct device_node *node)
 	if (affinity_form == FORM0_AFFINITY)
 		return;
 	else if (affinity_form == FORM1_AFFINITY) {
-		initialize_form1_numa_distance(node);
+		const __be32 *associativity;
+
+		associativity = of_get_associativity(node);
+		if (!associativity)
+			return;
+
+		initialize_form1_numa_distance(associativity);
 		return;
 	}
 
@@ -586,27 +608,17 @@ static int get_nid_and_numa_distance(struct drmem_lmb *lmb)
 
 	if (primary_domain_index <= aa.array_sz &&
 	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
-		index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
-		nid = of_read_number(&aa.arrays[index], 1);
+		const __be32 *associativity;
 
-		if (nid == 0xffff || nid >= nr_node_ids)
-			nid = default_nid;
+		index = lmb->aa_index * aa.array_sz;
+		associativity = &aa.arrays[index];
+		nid = __associativity_to_nid(associativity, aa.array_sz);
 		if (nid > 0 && affinity_form == FORM1_AFFINITY) {
-			int i;
-			const __be32 *associativity;
-
-			index = lmb->aa_index * aa.array_sz;
-			associativity = &aa.arrays[index];
 			/*
-			 * lookup array associativity entries have different format
-			 * There is no length of the array as the first element.
+			 * lookup array associativity entries have
+			 * no length of the array as the first element.
 			 */
-			for (i = 0; i < distance_ref_points_depth; i++) {
-				const __be32 *entry;
-
-				entry = &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
-				distance_lookup_table[nid][i] = of_read_number(entry, 1);
-			}
+			__initialize_form1_numa_distance(associativity, aa.array_sz);
 		}
 	}
 	return nid;
@@ -632,11 +644,11 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 
 	if (primary_domain_index <= aa.array_sz &&
 	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
-		index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
-		nid = of_read_number(&aa.arrays[index], 1);
+		const __be32 *associativity;
 
-		if (nid == 0xffff || nid >= nr_node_ids)
-			nid = default_nid;
+		index = lmb->aa_index * aa.array_sz;
+		associativity = &aa.arrays[index];
+		nid = __associativity_to_nid(associativity, aa.array_sz);
 	}
 	return nid;
 }
@@ -939,7 +951,7 @@ static int __init parse_numa_properties(void)
 
 		if (__vphn_get_associativity(i, vphn_assoc) == 0) {
 			nid = associativity_to_nid(vphn_assoc);
-			__initialize_form1_numa_distance(vphn_assoc);
+			initialize_form1_numa_distance(vphn_assoc);
 		} else {
 
 			/*
@@ -953,7 +965,7 @@ static int __init parse_numa_properties(void)
 			associativity = of_get_associativity(cpu);
 			if (associativity) {
 				nid = associativity_to_nid(associativity);
-				__initialize_form1_numa_distance(associativity);
+				initialize_form1_numa_distance(associativity);
 			}
 			of_node_put(cpu);
 		}
@@ -993,7 +1005,7 @@ static int __init parse_numa_properties(void)
 		associativity = of_get_associativity(memory);
 		if (associativity) {
 			nid = associativity_to_nid(associativity);
-			__initialize_form1_numa_distance(associativity);
+			initialize_form1_numa_distance(associativity);
 		} else
 			nid = default_nid;
 
-- 
2.31.1

