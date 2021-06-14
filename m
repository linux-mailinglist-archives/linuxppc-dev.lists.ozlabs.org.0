Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3323A6C99
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 19:02:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3d6Y5wVfz30DG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 03:02:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=os8T2UnG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=os8T2UnG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3d626rx9z2ysw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 03:02:02 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EGYCts051409; Mon, 14 Jun 2021 13:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NI5vAkVDG7Wrw8eY7HLcIuvp24JI8RoSD5oGPcRBneE=;
 b=os8T2UnGpTsVp48OKi1Z+YAPxAhmtgVAouUNQ4F11Y9R4JcsoYDTJSzqYg5bRwlnTADv
 oNKt3Od0pT0ZcvTXngBJq95UQLQR5ntC2Z3XoijTxQgNLF8GspXbI7jpgAINmeULfPT3
 Fz/q8WgdTELUTqtieeIU1uIbV965bQB1ZociwYIuh0tbeiVGyJiNmrdo36lLfIFQ9Ejj
 C/xykFPFjC7mBiIrXJ3GlSxe3jeYEq64Le0Ty1K+IyIHi85F0LVnwf0/2GPbGAUNKdSD
 tHbCzFUXSVux+qA8LRiyeE6+JJVb4xX4yUeh/TI7TmFSGU2tWojf5Ru6vbPiMzzxS55i Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3969b7uu8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 13:01:54 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15EGYDfk051511;
 Mon, 14 Jun 2021 13:01:53 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3969b7uu8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 13:01:53 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15EGc76d005482;
 Mon, 14 Jun 2021 16:40:40 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02wdc.us.ibm.com with ESMTP id 394mj9h28y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 16:40:40 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15EGec1B30409060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 16:40:38 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8C14136053;
 Mon, 14 Jun 2021 16:40:38 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5835E13604F;
 Mon, 14 Jun 2021 16:40:36 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.37.120])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Jun 2021 16:40:36 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH 3/8] powerpc/pseries: Rename TYPE1_AFFINITY to
 FORM1_AFFINITY
Date: Mon, 14 Jun 2021 22:09:58 +0530
Message-Id: <20210614164003.196094-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7DfSnTTvsjSmMedKqpGxjHllos2QEPFm
X-Proofpoint-ORIG-GUID: 15GJadxbEK7dBFoNn-qJh-zVtbVH-z4s
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_10:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106140104
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

Also make related code cleanup that will allow adding FORM2_AFFINITY in
later patches. No functional change in this patch.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/firmware.h       |  4 +--
 arch/powerpc/include/asm/prom.h           |  2 +-
 arch/powerpc/kernel/prom_init.c           |  2 +-
 arch/powerpc/mm/numa.c                    | 35 ++++++++++++++---------
 arch/powerpc/platforms/pseries/firmware.c |  2 +-
 5 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 7604673787d6..60b631161360 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -44,7 +44,7 @@
 #define FW_FEATURE_OPAL		ASM_CONST(0x0000000010000000)
 #define FW_FEATURE_SET_MODE	ASM_CONST(0x0000000040000000)
 #define FW_FEATURE_BEST_ENERGY	ASM_CONST(0x0000000080000000)
-#define FW_FEATURE_TYPE1_AFFINITY ASM_CONST(0x0000000100000000)
+#define FW_FEATURE_FORM1_AFFINITY ASM_CONST(0x0000000100000000)
 #define FW_FEATURE_PRRN		ASM_CONST(0x0000000200000000)
 #define FW_FEATURE_DRMEM_V2	ASM_CONST(0x0000000400000000)
 #define FW_FEATURE_DRC_INFO	ASM_CONST(0x0000000800000000)
@@ -69,7 +69,7 @@ enum {
 		FW_FEATURE_SPLPAR | FW_FEATURE_LPAR |
 		FW_FEATURE_CMO | FW_FEATURE_VPHN | FW_FEATURE_XCMO |
 		FW_FEATURE_SET_MODE | FW_FEATURE_BEST_ENERGY |
-		FW_FEATURE_TYPE1_AFFINITY | FW_FEATURE_PRRN |
+		FW_FEATURE_FORM1_AFFINITY | FW_FEATURE_PRRN |
 		FW_FEATURE_HPT_RESIZE | FW_FEATURE_DRMEM_V2 |
 		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
 		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index 324a13351749..df9fec9d232c 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -147,7 +147,7 @@ extern int of_read_drc_info_cell(struct property **prop,
 #define OV5_MSI			0x0201	/* PCIe/MSI support */
 #define OV5_CMO			0x0480	/* Cooperative Memory Overcommitment */
 #define OV5_XCMO		0x0440	/* Page Coalescing */
-#define OV5_TYPE1_AFFINITY	0x0580	/* Type 1 NUMA affinity */
+#define OV5_FORM1_AFFINITY	0x0580	/* FORM1 NUMA affinity */
 #define OV5_PRRN		0x0540	/* Platform Resource Reassignment */
 #define OV5_HP_EVT		0x0604	/* Hot Plug Event support */
 #define OV5_RESIZE_HPT		0x0601	/* Hash Page Table resizing */
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 41ed7e33d897..64b9593038a7 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1070,7 +1070,7 @@ static const struct ibm_arch_vec ibm_architecture_vec_template __initconst = {
 #else
 		0,
 #endif
-		.associativity = OV5_FEAT(OV5_TYPE1_AFFINITY) | OV5_FEAT(OV5_PRRN),
+		.associativity = OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRRN),
 		.bin_opts = OV5_FEAT(OV5_RESIZE_HPT) | OV5_FEAT(OV5_HP_EVT),
 		.micro_checkpoint = 0,
 		.reserved0 = 0,
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 5941da201fa3..192067991f8a 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -53,7 +53,10 @@ EXPORT_SYMBOL(node_data);
 
 static int primary_domain_index;
 static int n_mem_addr_cells, n_mem_size_cells;
-static int form1_affinity;
+
+#define FORM0_AFFINITY 0
+#define FORM1_AFFINITY 1
+static int affinity_form;
 
 #define MAX_DISTANCE_REF_POINTS 4
 static int max_domain_index;
@@ -190,7 +193,7 @@ int __node_distance(int a, int b)
 	int i;
 	int distance = LOCAL_DISTANCE;
 
-	if (!form1_affinity)
+	if (affinity_form == FORM0_AFFINITY)
 		return ((a == b) ? LOCAL_DISTANCE : REMOTE_DISTANCE);
 
 	for (i = 0; i < max_domain_index; i++) {
@@ -210,7 +213,7 @@ static void initialize_distance_lookup_table(int nid,
 {
 	int i;
 
-	if (!form1_affinity)
+	if (affinity_form != FORM1_AFFINITY)
 		return;
 
 	for (i = 0; i < max_domain_index; i++) {
@@ -289,6 +292,17 @@ static int __init find_primary_domain_index(void)
 	int index;
 	struct device_node *root;
 
+	/*
+	 * Check for which form of affinity.
+	 */
+	if (firmware_has_feature(FW_FEATURE_OPAL)) {
+		affinity_form = FORM1_AFFINITY;
+	} else if (firmware_has_feature(FW_FEATURE_FORM1_AFFINITY)) {
+		dbg("Using form 1 affinity\n");
+		affinity_form = FORM1_AFFINITY;
+	} else
+		affinity_form = FORM0_AFFINITY;
+
 	if (firmware_has_feature(FW_FEATURE_OPAL))
 		root = of_find_node_by_path("/ibm,opal");
 	else
@@ -318,23 +332,16 @@ static int __init find_primary_domain_index(void)
 	}
 
 	max_domain_index /= sizeof(int);
-
-	if (firmware_has_feature(FW_FEATURE_OPAL) ||
-	    firmware_has_feature(FW_FEATURE_TYPE1_AFFINITY)) {
-		dbg("Using form 1 affinity\n");
-		form1_affinity = 1;
-	}
-
-	if (form1_affinity) {
-		index = of_read_number(distance_ref_points, 1);
-	} else {
+	if (affinity_form == FORM0_AFFINITY) {
 		if (max_domain_index < 2) {
 			printk(KERN_WARNING "NUMA: "
-				"short ibm,associativity-reference-points\n");
+			       "short ibm,associativity-reference-points\n");
 			goto err;
 		}
 
 		index = of_read_number(&distance_ref_points[1], 1);
+	} else {
+		index = of_read_number(distance_ref_points, 1);
 	}
 
 	/*
diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
index 4c7b7f5a2ebc..5d4c2bc20bba 100644
--- a/arch/powerpc/platforms/pseries/firmware.c
+++ b/arch/powerpc/platforms/pseries/firmware.c
@@ -119,7 +119,7 @@ struct vec5_fw_feature {
 
 static __initdata struct vec5_fw_feature
 vec5_fw_features_table[] = {
-	{FW_FEATURE_TYPE1_AFFINITY,	OV5_TYPE1_AFFINITY},
+	{FW_FEATURE_FORM1_AFFINITY,	OV5_FORM1_AFFINITY},
 	{FW_FEATURE_PRRN,		OV5_PRRN},
 	{FW_FEATURE_DRMEM_V2,		OV5_DRMEM_V2},
 	{FW_FEATURE_DRC_INFO,		OV5_DRC_INFO},
-- 
2.31.1

