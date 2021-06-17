Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B473C3AAD81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:25:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5D90322Fz3cFx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:25:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a6mKyBGx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a6mKyBGx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5D7V72Lxz2ykQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 17:23:50 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H73pMx083861; Thu, 17 Jun 2021 03:23:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=01/uUUbXSudJzlRpKVgbXNW3ySvB0UacosEODucT4AM=;
 b=a6mKyBGx/uS/ZNW2/+cRCjYU4PO+cOWmzxEIFMer3Gue8GExSOMXaGeoWACnaOchqyrE
 tXGboMpC+TuaFCqJcdT+Vp3M99cAPOJQeEifA8x/PFIS0ghDbFsxI0jkppIGnlRcSyv5
 dSb9hiyrjz4lKziErvlGEqPNBGAXW9cv0yVztVnWD4nV1NdMJ+rgEN3IOzzAPNhkko/g
 mT/g2b7a+hpclYuK7uWDI0VXY1UmP/f6uFr1uIqQCZd0h2FTIzV+E2fVhpE4mBZixHso
 zfvcfXV1tln5wT8E5t8fPXzvu5UgbrfKODFh5JsHXjt8g/YNZU20714iMJdh/EEfQs1n 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397xryw74x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 03:23:45 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15H74IWj085989;
 Thu, 17 Jun 2021 03:23:45 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397xryw74g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 03:23:45 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15H7HNtn012215;
 Thu, 17 Jun 2021 07:23:43 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 3954gkj6bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 07:23:43 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15H7NhRv31785460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 07:23:43 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60E0F1240BE;
 Thu, 17 Jun 2021 07:23:43 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42CB2124095;
 Thu, 17 Jun 2021 07:23:41 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.31.110])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 07:23:40 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 2/8] powerpc/pseries: rename distance_ref_points_depth to
 max_associativity_domain_index
Date: Thu, 17 Jun 2021 12:52:40 +0530
Message-Id: <20210617072246.500768-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617072246.500768-1-aneesh.kumar@linux.ibm.com>
References: <20210617072246.500768-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kQu2rcoItKeNjA91K8iaH6PRlO_8IE5b
X-Proofpoint-GUID: u9NmRH-UTX6vQcuDbIc8sVxDQcOEgMpl
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_02:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170049
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

No functional change in this patch

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 8365b298ec48..132813dd1a6c 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -56,7 +56,7 @@ static int n_mem_addr_cells, n_mem_size_cells;
 static int form1_affinity;
 
 #define MAX_DISTANCE_REF_POINTS 4
-static int distance_ref_points_depth;
+static int max_associativity_domain_index;
 static const __be32 *distance_ref_points;
 static int distance_lookup_table[MAX_NUMNODES][MAX_DISTANCE_REF_POINTS];
 
@@ -169,7 +169,7 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 
 	int i, index;
 
-	for (i = 0; i < distance_ref_points_depth; i++) {
+	for (i = 0; i < max_associativity_domain_index; i++) {
 		index = be32_to_cpu(distance_ref_points[i]);
 		if (cpu1_assoc[index] == cpu2_assoc[index])
 			break;
@@ -193,7 +193,7 @@ int __node_distance(int a, int b)
 	if (!form1_affinity)
 		return ((a == b) ? LOCAL_DISTANCE : REMOTE_DISTANCE);
 
-	for (i = 0; i < distance_ref_points_depth; i++) {
+	for (i = 0; i < max_associativity_domain_index; i++) {
 		if (distance_lookup_table[a][i] == distance_lookup_table[b][i])
 			break;
 
@@ -213,7 +213,7 @@ static void initialize_distance_lookup_table(int nid,
 	if (!form1_affinity)
 		return;
 
-	for (i = 0; i < distance_ref_points_depth; i++) {
+	for (i = 0; i < max_associativity_domain_index; i++) {
 		const __be32 *entry;
 
 		entry = &associativity[be32_to_cpu(distance_ref_points[i]) - 1];
@@ -240,7 +240,7 @@ static int associativity_to_nid(const __be32 *associativity)
 		nid = NUMA_NO_NODE;
 
 	if (nid > 0 &&
-		of_read_number(associativity, 1) >= distance_ref_points_depth) {
+		of_read_number(associativity, 1) >= max_associativity_domain_index) {
 		/*
 		 * Skip the length field and send start of associativity array
 		 */
@@ -310,14 +310,14 @@ static int __init find_primary_domain_index(void)
 	 */
 	distance_ref_points = of_get_property(root,
 					"ibm,associativity-reference-points",
-					&distance_ref_points_depth);
+					&max_associativity_domain_index);
 
 	if (!distance_ref_points) {
 		dbg("NUMA: ibm,associativity-reference-points not found.\n");
 		goto err;
 	}
 
-	distance_ref_points_depth /= sizeof(int);
+	max_associativity_domain_index /= sizeof(int);
 
 	if (firmware_has_feature(FW_FEATURE_OPAL) ||
 	    firmware_has_feature(FW_FEATURE_TYPE1_AFFINITY)) {
@@ -328,7 +328,7 @@ static int __init find_primary_domain_index(void)
 	if (form1_affinity) {
 		index = of_read_number(distance_ref_points, 1);
 	} else {
-		if (distance_ref_points_depth < 2) {
+		if (max_associativity_domain_index < 2) {
 			printk(KERN_WARNING "NUMA: "
 				"short ibm,associativity-reference-points\n");
 			goto err;
@@ -341,10 +341,10 @@ static int __init find_primary_domain_index(void)
 	 * Warn and cap if the hardware supports more than
 	 * MAX_DISTANCE_REF_POINTS domains.
 	 */
-	if (distance_ref_points_depth > MAX_DISTANCE_REF_POINTS) {
+	if (max_associativity_domain_index > MAX_DISTANCE_REF_POINTS) {
 		printk(KERN_WARNING "NUMA: distance array capped at "
 			"%d entries\n", MAX_DISTANCE_REF_POINTS);
-		distance_ref_points_depth = MAX_DISTANCE_REF_POINTS;
+		max_associativity_domain_index = MAX_DISTANCE_REF_POINTS;
 	}
 
 	of_node_put(root);
-- 
2.31.1

