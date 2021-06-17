Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7883AADC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:37:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5DRQ0VW1z3dFd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:37:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MZ/pgMqa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MZ/pgMqa; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5DP862l5z3bvb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 17:35:40 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H7XHKD166654; Thu, 17 Jun 2021 03:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hzBfgvRZsyGyAi/7Gs3fL3tnk30Yl7ZqVPqhEJAz8gM=;
 b=MZ/pgMqaBl+dToQMbAUqXEYQKhztziH+IAHunyPjYMv0QqS0sHL7XWT6v843SqHvCRPz
 vJYFDVNbJtL68Gl3mC/rHpbQBQnbL6o37BlgJcBPcZ8palLCIg0x88C50lnno0fK8Tmv
 /ZSiPWjIYIe285D+FzqizTTOcBe9ebgFYOuu96slIeSTmBihUciKZP5QuWGm787wWf5T
 jtKkMfr3Hzs4HVYkrsBpGZeWLyLOpB+Vo0i2mgBD/k06Xo4as1QI/haSfM0xQ8bz4QXL
 dhWH4DPmcA1BzNG4pb2EJTNwBbi+H3Fdki0krgFBlMRV3T76/yd7aYI27Z18tyaO/hSq Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3981m991sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 03:35:32 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15H7XcZA168734;
 Thu, 17 Jun 2021 03:35:31 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3981m991rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 03:35:31 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15H7YLYc021071;
 Thu, 17 Jun 2021 07:35:29 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 394mjarfad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:35:29 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15H7ZSIL27263292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 07:35:28 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F84A11206E;
 Thu, 17 Jun 2021 07:35:28 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A197D11206B;
 Thu, 17 Jun 2021 07:35:25 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.31.110])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 07:35:25 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 5/8] powerpc/pseries: Consolidate NUMA distance update
 during boot
Date: Thu, 17 Jun 2021 13:04:55 +0530
Message-Id: <20210617073458.510545-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617073458.510545-1-aneesh.kumar@linux.ibm.com>
References: <20210617073458.510545-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: q64MAG6VQlODnV6AdRvdWAjm-4hHhZqL
X-Proofpoint-GUID: MKylcSN_g0wLmrXwhvasFHvTGrUMDDZK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_02:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106170052
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, nvdimm@lists.linux.dev,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, dan.j.williams@intel.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of updating NUMA distance every time we lookup a node id
from the associativity property, add helpers that can be used
during boot which does this only once. Also remove the distance
update from node id lookup helpers.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 135 +++++++++++++++++++++++++++--------------
 1 file changed, 88 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 645a95e3a7ea..c481f08d565b 100644
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
-	for (i = 0; i < max_associativity_domain_index; i++) {
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
-		of_read_number(associativity, 1) >= max_associativity_domain_index) {
-		/*
-		 * Skip the length field and send start of associativity array
-		 */
-		initialize_distance_lookup_table(nid, associativity + 1);
-	}
-
 out:
 	return nid;
 }
@@ -291,10 +266,13 @@ static void __initialize_form1_numa_distance(const __be32 *associativity)
 {
 	int i, nid;
 
+	if (affinity_form != FORM1_AFFINITY)
+		return;
+
 	if (of_read_number(associativity, 1) >= primary_domain_index) {
 		nid = of_read_number(&associativity[primary_domain_index], 1);
 
-		for (i = 0; i < max_domain_index; i++) {
+		for (i = 0; i < max_associativity_domain_index; i++) {
 			const __be32 *entry;
 
 			entry = &associativity[be32_to_cpu(distance_ref_points[i])];
@@ -474,6 +452,48 @@ static int of_get_assoc_arrays(struct assoc_arrays *aa)
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
+			for (i = 0; i < max_associativity_domain_index; i++) {
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
@@ -499,21 +519,14 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 
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
@@ -533,10 +546,22 @@ static int vphn_get_nid(long lcpu)
 
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
 static int vphn_get_nid(long unused)
@@ -733,7 +758,7 @@ static int __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
 			size = read_n_cells(n_mem_size_cells, usm);
 		}
 
-		nid = of_drconf_to_nid_single(lmb);
+		nid = get_nid_and_numa_distance(lmb);
 		fake_numa_create_new_node(((base + size) >> PAGE_SHIFT),
 					  &nid);
 		node_set_online(nid);
@@ -750,6 +775,7 @@ static int __init parse_numa_properties(void)
 	struct device_node *memory;
 	int default_nid = 0;
 	unsigned long i;
+	const __be32 *associativity;
 
 	if (numa_enabled == 0) {
 		printk(KERN_WARNING "NUMA disabled by user\n");
@@ -775,18 +801,30 @@ static int __init parse_numa_properties(void)
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
 
@@ -822,8 +860,11 @@ static int __init parse_numa_properties(void)
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
-- 
2.31.1

