Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 501FD3D728B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 12:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYsqb1Yhqz3dV8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 20:05:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tmp2K6WW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Tmp2K6WW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYsnl0DNrz3bT4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 20:03:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16R9Zrp2049481; Tue, 27 Jul 2021 06:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=T8CVWd/dyJWUAuE0OjHc9MlASOpYb9dvsFdM/Ej18Gs=;
 b=Tmp2K6WWr/voMDAyPuGVosetWylfbK+sjW5gKsD+0+SK3qhyrIql9I+D4SFYQJ9krQDq
 Wi445gde92U8o/I67Bv+jP17bYUKUZ9JKYhdRYoiKctTaUbKjpLwdGZizAyXhdEaoWna
 4q6R/YmzfxK+J1CdojDsdcXi5Y4QW3IX0tfGdK8w/JXnFVAQVAhfNDwoaeSiqBF7LbMT
 Cpib9OYJ7cQfs2w+Y/oa6ciEzH1dBX6SzT8rmRZ+Kda0cnyppIxAeGOhlY3Vry7QgT7S
 cZn71TUsPymrnhbZtcoEYJu7LAXwMUlyBVhbiPExKyWsoGnPWEKeyxteOC3RVpXkvtlY Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a2f6hthmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 06:03:49 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16R9a7M0051473;
 Tue, 27 Jul 2021 06:03:48 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a2f6hthkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 06:03:48 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16RA1E5h000335;
 Tue, 27 Jul 2021 10:03:48 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 3a235mcjt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 10:03:48 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16RA3knR49086780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Jul 2021 10:03:46 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A13A66E056;
 Tue, 27 Jul 2021 10:03:46 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13D116E053;
 Tue, 27 Jul 2021 10:03:43 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.145])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 27 Jul 2021 10:03:42 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 6/6] powerpc/pseries: Consolidate form1 distance
 initialization into a helper
Date: Tue, 27 Jul 2021 15:33:11 +0530
Message-Id: <20210727100311.310969-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727100311.310969-1-aneesh.kumar@linux.ibm.com>
References: <20210727100311.310969-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 95vLovtwJbKthn7RwWO5KO5ZPc7H9whM
X-Proofpoint-GUID: 9D1F2kK1QnZlhpXcE5ZFRNFw1xurDEIc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_06:2021-07-27,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2107270055
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
 arch/powerpc/mm/numa.c | 83 ++++++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index fffb3c40f595..7506251e17f2 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -171,19 +171,19 @@ static void unmap_cpu_from_node(unsigned long cpu)
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
 	int nid = NUMA_NO_NODE;
+	/*
+	 * primary_domain_index is 1 based array index.
+	 */
+	int index = primary_domain_index  - 1;
 
-	if (!numa_enabled)
+	if (!numa_enabled || index >= max_array_sz)
 		goto out;
 
-	if (of_read_number(associativity, 1) >= primary_domain_index)
-		nid = of_read_number(&associativity[primary_domain_index], 1);
+	nid = of_read_number(&associativity[index], 1);
 
 	/* POWER4 LPAR uses 0xffff as invalid node */
 	if (nid == 0xffff || nid >= nr_node_ids)
@@ -191,6 +191,17 @@ static int associativity_to_nid(const __be32 *associativity)
 out:
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
@@ -295,24 +306,41 @@ int of_node_to_nid(struct device_node *device)
 }
 EXPORT_SYMBOL(of_node_to_nid);
 
-static void __initialize_form1_numa_distance(const __be32 *associativity)
+static void ___initialize_form1_numa_distance(const __be32 *associativity,
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
+			if (index >= max_array_sz)
+				return;
 
-			entry = &associativity[be32_to_cpu(distance_ref_points[i])];
+			entry = &associativity[index];
 			distance_lookup_table[nid][i] = of_read_number(entry, 1);
 		}
 	}
 }
 
+static void __initialize_form1_numa_distance(const __be32 *associativity)
+{
+	int array_sz;
+
+	array_sz = of_read_number(associativity, 1);
+	/* Skip the first element in the associativity array */
+	___initialize_form1_numa_distance(associativity + 1, array_sz);
+}
+
 static void initialize_form1_numa_distance(struct device_node *node)
 {
 	const __be32 *associativity;
@@ -586,27 +614,18 @@ static int get_nid_and_numa_distance(struct drmem_lmb *lmb)
 
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
+			___initialize_form1_numa_distance(associativity,
+							  aa.array_sz);
 		}
 	}
 	return nid;
@@ -632,11 +651,11 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 
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
-- 
2.31.1

