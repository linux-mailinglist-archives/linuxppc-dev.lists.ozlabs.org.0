Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1422F871
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 20:50:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFplM1vjRzDrPQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 04:50:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFpgM47JBzF1Tn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 04:46:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BFpgM2y05z8t44
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 04:46:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BFpgM2Ndmz9sSt; Tue, 28 Jul 2020 04:46:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BFpgL5Vkhz9sSn
 for <linuxppc-dev@ozlabs.org>; Tue, 28 Jul 2020 04:46:38 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RIXDVn116728
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 14:46:37 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32j0a1rhsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 14:46:36 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RIiZdl010620
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 18:46:36 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 32gcy4094x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 18:46:36 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06RIkZ5V51511600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 18:46:35 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43F23124055;
 Mon, 27 Jul 2020 18:46:35 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE9CF124054;
 Mon, 27 Jul 2020 18:46:34 +0000 (GMT)
Received: from rascal.austin.ibm.com (unknown [9.41.179.32])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 18:46:34 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 1/2] powerpc/perf: consolidate GPCI hcall structs into
 asm/hvcall.h
Date: Mon, 27 Jul 2020 13:46:04 -0500
Message-Id: <20200727184605.2945095-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_13:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270125
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
 Tyrel Datwylder <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The H_GetPerformanceCounterInfo (GPCI) hypercall input/output structs are
useful to modules outside of perf/, so move them into asm/hvcall.h to live
alongside the other powerpc hypercall structs.

Leave the perf-specific GPCI stuff in perf/hv-gpci.h.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h | 36 +++++++++++++++++++++++++++++++
 arch/powerpc/perf/hv-gpci.c       |  9 --------
 arch/powerpc/perf/hv-gpci.h       | 27 -----------------------
 3 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index e90c073e437e..c338480b4551 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -527,6 +527,42 @@ struct hv_guest_state {
 /* Latest version of hv_guest_state structure */
 #define HV_GUEST_STATE_VERSION	1
 
+/*
+ * From the document "H_GetPerformanceCounterInfo Interface" v1.07
+ *
+ * H_GET_PERF_COUNTER_INFO argument
+ */
+struct hv_get_perf_counter_info_params {
+	__be32 counter_request; /* I */
+	__be32 starting_index;  /* IO */
+	__be16 secondary_index; /* IO */
+	__be16 returned_values; /* O */
+	__be32 detail_rc; /* O, only needed when called via *_norets() */
+
+	/*
+	 * O, size each of counter_value element in bytes, only set for version
+	 * >= 0x3
+	 */
+	__be16 cv_element_size;
+
+	/* I, 0 (zero) for versions < 0x3 */
+	__u8 counter_info_version_in;
+
+	/* O, 0 (zero) if version < 0x3. Must be set to 0 when making hcall */
+	__u8 counter_info_version_out;
+	__u8 reserved[0xC];
+	__u8 counter_value[];
+} __packed;
+
+#define HGPCI_REQ_BUFFER_SIZE	4096
+#define HGPCI_MAX_DATA_BYTES \
+	(HGPCI_REQ_BUFFER_SIZE - sizeof(struct hv_get_perf_counter_info_params))
+
+struct hv_gpci_request_buffer {
+	struct hv_get_perf_counter_info_params params;
+	uint8_t bytes[HGPCI_MAX_DATA_BYTES];
+} __packed;
+
 #endif /* __ASSEMBLY__ */
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_HVCALL_H */
diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 6884d16ec19b..1667315b82e9 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -123,17 +123,8 @@ static const struct attribute_group *attr_groups[] = {
 	NULL,
 };
 
-#define HGPCI_REQ_BUFFER_SIZE	4096
-#define HGPCI_MAX_DATA_BYTES \
-	(HGPCI_REQ_BUFFER_SIZE - sizeof(struct hv_get_perf_counter_info_params))
-
 static DEFINE_PER_CPU(char, hv_gpci_reqb[HGPCI_REQ_BUFFER_SIZE]) __aligned(sizeof(uint64_t));
 
-struct hv_gpci_request_buffer {
-	struct hv_get_perf_counter_info_params params;
-	uint8_t bytes[HGPCI_MAX_DATA_BYTES];
-} __packed;
-
 static unsigned long single_gpci_request(u32 req, u32 starting_index,
 		u16 secondary_index, u8 version_in, u32 offset, u8 length,
 		u64 *value)
diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
index a3053eda5dcc..4d108262bed7 100644
--- a/arch/powerpc/perf/hv-gpci.h
+++ b/arch/powerpc/perf/hv-gpci.h
@@ -2,33 +2,6 @@
 #ifndef LINUX_POWERPC_PERF_HV_GPCI_H_
 #define LINUX_POWERPC_PERF_HV_GPCI_H_
 
-#include <linux/types.h>
-
-/* From the document "H_GetPerformanceCounterInfo Interface" v1.07 */
-
-/* H_GET_PERF_COUNTER_INFO argument */
-struct hv_get_perf_counter_info_params {
-	__be32 counter_request; /* I */
-	__be32 starting_index;  /* IO */
-	__be16 secondary_index; /* IO */
-	__be16 returned_values; /* O */
-	__be32 detail_rc; /* O, only needed when called via *_norets() */
-
-	/*
-	 * O, size each of counter_value element in bytes, only set for version
-	 * >= 0x3
-	 */
-	__be16 cv_element_size;
-
-	/* I, 0 (zero) for versions < 0x3 */
-	__u8 counter_info_version_in;
-
-	/* O, 0 (zero) if version < 0x3. Must be set to 0 when making hcall */
-	__u8 counter_info_version_out;
-	__u8 reserved[0xC];
-	__u8 counter_value[];
-} __packed;
-
 /*
  * counter info version => fw version/reference (spec version)
  *
-- 
2.24.1

