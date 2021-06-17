Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC623AB9FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 18:52:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Slw092cz3cDh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 02:52:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BP6H/S5G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BP6H/S5G; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5SkW1P8Bz307x
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 02:51:31 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HGivH0010913; Thu, 17 Jun 2021 12:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/kd2YglBElv/BXYL+MFJGNpixpl/5CBFLs6iWF+3ViA=;
 b=BP6H/S5GPKDKrEmPeZtNoqy6TD2+NFFHRbAOtABhtB4VwkQ/2THEIpkIt2UWeAuLGUAQ
 LISbWnpPxYhbpPSi1one7cwypcs2ePNLUl6aDNQl+efVLutCO9GTbqdW0Nzb4GYkMQBk
 cZpMcdzP7mUA8woS2PFcCOeFrCBiNU4Jxo5RY3ROYUoMlvADCnvykleYEKpentnA/Zt7
 HCgDM/Udkz8tAlU/73WL0sWbeeH33gw9yB6IAI2Pp9QSYKlt42/AMI9HPZXunw+d6rit
 X+QohOaIhoIFZlmlXBqr20XsPQyXmf4nhbnlsenkJDYP8N8Bo+izgIDeS1WcA8i5wb7d MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398a6905je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 12:51:22 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HGjFfk012952;
 Thu, 17 Jun 2021 12:51:19 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398a6905g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 12:51:19 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HGlmgI013586;
 Thu, 17 Jun 2021 16:51:17 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 394mjad2n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:51:17 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HGpGiN40763794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 16:51:16 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35500B2065;
 Thu, 17 Jun 2021 16:51:16 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DC38B2073;
 Thu, 17 Jun 2021 16:51:13 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.39.101])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 16:51:13 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 1/7] powerpc/pseries: rename min_common_depth to
 primary_domain_index
Date: Thu, 17 Jun 2021 22:20:59 +0530
Message-Id: <20210617165105.574178-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617165105.574178-1-aneesh.kumar@linux.ibm.com>
References: <20210617165105.574178-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: p_BiCAJNbj3IfAm4tegzxbX4oOAp7D2U
X-Proofpoint-GUID: JVr5mE2BOYm6xgnKo9j0KRsgoPFcrrGY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_15:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106170104
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

No functional change in this patch.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index f2bf98bdcea2..8365b298ec48 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -51,7 +51,7 @@ EXPORT_SYMBOL(numa_cpu_lookup_table);
 EXPORT_SYMBOL(node_to_cpumask_map);
 EXPORT_SYMBOL(node_data);
 
-static int min_common_depth;
+static int primary_domain_index;
 static int n_mem_addr_cells, n_mem_size_cells;
 static int form1_affinity;
 
@@ -232,8 +232,8 @@ static int associativity_to_nid(const __be32 *associativity)
 	if (!numa_enabled)
 		goto out;
 
-	if (of_read_number(associativity, 1) >= min_common_depth)
-		nid = of_read_number(&associativity[min_common_depth], 1);
+	if (of_read_number(associativity, 1) >= primary_domain_index)
+		nid = of_read_number(&associativity[primary_domain_index], 1);
 
 	/* POWER4 LPAR uses 0xffff as invalid node */
 	if (nid == 0xffff || nid >= nr_node_ids)
@@ -284,9 +284,9 @@ int of_node_to_nid(struct device_node *device)
 }
 EXPORT_SYMBOL(of_node_to_nid);
 
-static int __init find_min_common_depth(void)
+static int __init find_primary_domain_index(void)
 {
-	int depth;
+	int index;
 	struct device_node *root;
 
 	if (firmware_has_feature(FW_FEATURE_OPAL))
@@ -326,7 +326,7 @@ static int __init find_min_common_depth(void)
 	}
 
 	if (form1_affinity) {
-		depth = of_read_number(distance_ref_points, 1);
+		index = of_read_number(distance_ref_points, 1);
 	} else {
 		if (distance_ref_points_depth < 2) {
 			printk(KERN_WARNING "NUMA: "
@@ -334,7 +334,7 @@ static int __init find_min_common_depth(void)
 			goto err;
 		}
 
-		depth = of_read_number(&distance_ref_points[1], 1);
+		index = of_read_number(&distance_ref_points[1], 1);
 	}
 
 	/*
@@ -348,7 +348,7 @@ static int __init find_min_common_depth(void)
 	}
 
 	of_node_put(root);
-	return depth;
+	return index;
 
 err:
 	of_node_put(root);
@@ -437,16 +437,16 @@ int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 	int nid = default_nid;
 	int rc, index;
 
-	if ((min_common_depth < 0) || !numa_enabled)
+	if ((primary_domain_index < 0) || !numa_enabled)
 		return default_nid;
 
 	rc = of_get_assoc_arrays(&aa);
 	if (rc)
 		return default_nid;
 
-	if (min_common_depth <= aa.array_sz &&
+	if (primary_domain_index <= aa.array_sz &&
 	    !(lmb->flags & DRCONF_MEM_AI_INVALID) && lmb->aa_index < aa.n_arrays) {
-		index = lmb->aa_index * aa.array_sz + min_common_depth - 1;
+		index = lmb->aa_index * aa.array_sz + primary_domain_index - 1;
 		nid = of_read_number(&aa.arrays[index], 1);
 
 		if (nid == 0xffff || nid >= nr_node_ids)
@@ -708,18 +708,18 @@ static int __init parse_numa_properties(void)
 		return -1;
 	}
 
-	min_common_depth = find_min_common_depth();
+	primary_domain_index = find_primary_domain_index();
 
-	if (min_common_depth < 0) {
+	if (primary_domain_index < 0) {
 		/*
-		 * if we fail to parse min_common_depth from device tree
+		 * if we fail to parse primary_domain_index from device tree
 		 * mark the numa disabled, boot with numa disabled.
 		 */
 		numa_enabled = false;
-		return min_common_depth;
+		return primary_domain_index;
 	}
 
-	dbg("NUMA associativity depth for CPU/Memory: %d\n", min_common_depth);
+	dbg("NUMA associativity depth for CPU/Memory: %d\n", primary_domain_index);
 
 	/*
 	 * Even though we connect cpus to numa domains later in SMP
@@ -919,14 +919,14 @@ static void __init find_possible_nodes(void)
 			goto out;
 	}
 
-	max_nodes = of_read_number(&domains[min_common_depth], 1);
+	max_nodes = of_read_number(&domains[primary_domain_index], 1);
 	for (i = 0; i < max_nodes; i++) {
 		if (!node_possible(i))
 			node_set(i, node_possible_map);
 	}
 
 	prop_length /= sizeof(int);
-	if (prop_length > min_common_depth + 2)
+	if (prop_length > primary_domain_index + 2)
 		coregroup_enabled = 1;
 
 out:
@@ -1259,7 +1259,7 @@ int cpu_to_coregroup_id(int cpu)
 		goto out;
 
 	index = of_read_number(associativity, 1);
-	if (index > min_common_depth + 1)
+	if (index > primary_domain_index + 1)
 		return of_read_number(&associativity[index - 1], 1);
 
 out:
-- 
2.31.1

