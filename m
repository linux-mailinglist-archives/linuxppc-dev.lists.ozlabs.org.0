Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2003B64B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:12:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDB1g0T8lz3bpy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 01:12:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=REN+GW3c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=REN+GW3c; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDB0G61GDz3035
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 01:11:42 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SF4QJS168027; Mon, 28 Jun 2021 11:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=01/uUUbXSudJzlRpKVgbXNW3ySvB0UacosEODucT4AM=;
 b=REN+GW3ca6A+8F+EedB1Kzaz3dJypNwFY+DBfNU9uPDL14Kmx6SkCsAyi6PKBqCHak7S
 PIhDQJwiGqok+0axYDq025p9WXElMg/pwlmfqJqGAeuKYPBq0afbF+wnmpftaWSEFdPl
 Ocqkh8teUVXT+xEAAwpUQon+q4zphHce3CDDqmQUiZOueNmePcIXzLI7k8bXV2ZWfUYE
 eWZJUT2EWaTAHzkwzZTdU2YCd2OnEcev3zUBFaNp4bhEd1X0bEnQcLuKscD6jWK40+WN
 Q4iVTmgCd4hzoF4Tnqs9TIkx/MzfuIZLaqP44MX8hwbDWs9zOU2gPJAFuNHer6nkoCHn NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fdtrpf9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 11:11:37 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15SF4RLf168103;
 Mon, 28 Jun 2021 11:11:36 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fdtrpf8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 11:11:36 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SF2E63029006;
 Mon, 28 Jun 2021 15:11:35 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 39duvakyux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 15:11:35 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15SFBYl527066828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 15:11:34 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 994D028086;
 Mon, 28 Jun 2021 15:11:34 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C827628058;
 Mon, 28 Jun 2021 15:11:31 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.75.58])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Jun 2021 15:11:31 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 2/6] powerpc/pseries: rename distance_ref_points_depth to
 max_associativity_domain_index
Date: Mon, 28 Jun 2021 20:41:13 +0530
Message-Id: <20210628151117.545935-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JxvLppwWzLjlj8fQwjpQfssrVio4I5Yh
X-Proofpoint-ORIG-GUID: 0CBtb5piDIlPcgn4dxU6A19-vXwPGMhM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_12:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280104
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

