Return-Path: <linuxppc-dev+bounces-5295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E853BA12635
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 15:40:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY7vR5MDwz3bZN;
	Thu, 16 Jan 2025 01:40:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736952019;
	cv=none; b=N+4A14aCLodTdhzR4eTpBlqLjglRTlz6juNwFLLstSN6JsnRBrKZYhkW3vpJ3VYytA/qUgqhsCI+9RTDDHBFWZ2PZu8xUr6mHLi9hBnn2oPK5ivFkWD09w/0i0265r3DNWgInizU6+1s0t2MAQ3eOCdvbmJehTnaFWba8qAJSNmmKkcBlNaHi0tGIcThOWmtZFc2nMHsKeR9u7k2gmCzwAN7U7SI8hO71dneXVueH83XNw/McW92U6T6KRL0tUB0+2ej7xzsq/FeN7J7NQGl8/NR7DyaHMZkWhEXpw7sIJybiZ/HOkJyPw4lo2+YvVB4rqtVBggZDju2XAQHga9OKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736952019; c=relaxed/relaxed;
	bh=I1HsNkPHPOWZmNLMI7lrPTOCv4Sq8F2psNOfNI+OZQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ux/mV71MynvRjw+x8dOpsYtFS0qolNMOyjRB/QYPwFkD90hdGefMcjqUvPBxJiN6YvuOjMK72IXFStLeFbmwW1YgMMIcrHgooRXUYClx248CPVnHtaJtvMGCpzgb9FAXXm5PblGmwml9chlhiYHQ+Djid/KXvOKoSyZW6kT/zpQqpmXxtZiE7aXJC1HGqAMXT4tmBC0U3AEsL0AGsSDw7xlRUjaWCt5pnMCHCdNHDwbjDwBFtVWY5Uz8sBVUI2Q/oif7OVi78MgssANEr106UmutP7k1wVdSopUcPpw+jvgiN3+/VSK2ZSCA/Xv6LFmYUs+gZGJp5EKJsIZXn6LXWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iD9GNtcX; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iD9GNtcX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY7vR0RZVz30Dw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 01:40:18 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FDKOAr014491;
	Wed, 15 Jan 2025 14:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=I1HsNkPHPOWZmNLMI
	7lrPTOCv4Sq8F2psNOfNI+OZQU=; b=iD9GNtcXviSckbDq8I+Ql4b8xI93vUq9n
	v40yH8xRUqxrRVst71dC+/F3JoK1w9YVj2Mnr23qFPYQBAkWZx0sMS6a/Ou/dHmX
	2sy/tgL9KTiyXLq9yVpsGevUgZdusRWvaNLa3E+I5e3ub3rqswV4n0kmZmNAmnzq
	zDNwwW0rpij28Y9Q17JcYluYi5GSbVmoPSzXCAQKlPM6UtT/PC2kPM/euzJqGlK0
	JAVt4ii+Z3XXpxvHPyPn83E1nV/vgxiQH+bKTcAmiwaBbnWcPVVMJwjHn1DbRPry
	Kv50JzzgYj6+vqEy247ahCFH9DA/i1T4ztLa3hpciGi+1CrP0z3nQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44622hud30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:40:10 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50FEXUNH026760;
	Wed, 15 Jan 2025 14:40:10 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44622hud2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:40:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50FE35Vh002663;
	Wed, 15 Jan 2025 14:40:08 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443by8vyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 14:40:08 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50FEe42X30736962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Jan 2025 14:40:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C46762004B;
	Wed, 15 Jan 2025 14:40:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14F6420043;
	Wed, 15 Jan 2025 14:40:01 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.24.117])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 15 Jan 2025 14:40:00 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 15 Jan 2025 20:10:00 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com
Subject: [PATCH v2 2/6] kvm powerpc/book3s-apiv2: Add support for Hostwide GSB elements
Date: Wed, 15 Jan 2025 20:09:43 +0530
Message-ID: <20250115143948.369379-3-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115143948.369379-1-vaibhav@linux.ibm.com>
References: <20250115143948.369379-1-vaibhav@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: euc66R78B7_aeK5e2vzlwivrPYeVAXWd
X-Proofpoint-ORIG-GUID: P_255x_07tgP9CosNlxEJiK-3gdqVyXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_05,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501150110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add support for adding and parsing Hostwide elements to the
Guest-state-buffer data structure used in apiv2. These elements are used to
share meta-information pertaining to entire L1-Lpar and this
meta-information is maintained by L0-PowerVM hypervisor. Example of this
include the amount of the page-table memory currently used by L0-PowerVM
for hosting the Shadow-Pagetable of all active L2-Guests. More of the are
documented in kernel-documentation at [1]. The Hostwide GSB elements are
currently only support with H_GUEST_SET_STATE hcall with a special flag
namely 'KVMPPC_GS_FLAGS_HOST_WIDE'.

The patch introduces new defs for the 5 new Hostwide GSB elements including
their GSIDs as well as introduces a new class of GSB elements namely
'KVMPPC_GS_CLASS_HOSTWIDE' to indicate to GSB construction/parsing
infrastructure in 'kvm/guest-state-buffer.c'. Also
gs_msg_ops_vcpu_get_size(), kvmppc_gsid_type() and
kvmppc_gse_{flatten,unflatten}_iden() are updated to appropriately indicate
the needed size for these Hostwide GSB elements as well as how to
flatten/unflatten their GSIDs so that they can be marked as available in
GSB bitmap.

[1] Documention/arch/powerpc/kvm-nested.rst

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/include/asm/guest-state-buffer.h | 35 ++++++++++++++---
 arch/powerpc/include/asm/hvcall.h             | 13 ++++---
 arch/powerpc/kvm/book3s_hv_nestedv2.c         |  6 +++
 arch/powerpc/kvm/guest-state-buffer.c         | 39 +++++++++++++++++++
 4 files changed, 81 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/guest-state-buffer.h b/arch/powerpc/include/asm/guest-state-buffer.h
index d107abe1468f..acd61eb36d59 100644
--- a/arch/powerpc/include/asm/guest-state-buffer.h
+++ b/arch/powerpc/include/asm/guest-state-buffer.h
@@ -28,6 +28,21 @@
  /* Process Table Info */
 #define KVMPPC_GSID_PROCESS_TABLE		0x0006
 
+/* Guest Management Heap Size */
+#define KVMPPC_GSID_L0_GUEST_HEAP		0x0800
+
+/* Guest Management Heap Max Size */
+#define KVMPPC_GSID_L0_GUEST_HEAP_MAX		0x0801
+
+/* Guest Pagetable Size */
+#define KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE	0x0802
+
+/* Guest Pagetable Max Size */
+#define KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX	0x0803
+
+/* Guest Pagetable Reclaim in bytes */
+#define KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM	0x0804
+
 /* H_GUEST_RUN_VCPU input buffer Info */
 #define KVMPPC_GSID_RUN_INPUT			0x0C00
 /* H_GUEST_RUN_VCPU output buffer Info */
@@ -106,6 +121,11 @@
 #define KVMPPC_GSE_GUESTWIDE_COUNT \
 	(KVMPPC_GSE_GUESTWIDE_END - KVMPPC_GSE_GUESTWIDE_START + 1)
 
+#define KVMPPC_GSE_HOSTWIDE_START KVMPPC_GSID_L0_GUEST_HEAP
+#define KVMPPC_GSE_HOSTWIDE_END KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM
+#define KVMPPC_GSE_HOSTWIDE_COUNT \
+	(KVMPPC_GSE_HOSTWIDE_END - KVMPPC_GSE_HOSTWIDE_START + 1)
+
 #define KVMPPC_GSE_META_START KVMPPC_GSID_RUN_INPUT
 #define KVMPPC_GSE_META_END KVMPPC_GSID_VPA
 #define KVMPPC_GSE_META_COUNT (KVMPPC_GSE_META_END - KVMPPC_GSE_META_START + 1)
@@ -130,7 +150,8 @@
 	(KVMPPC_GSE_INTR_REGS_END - KVMPPC_GSE_INTR_REGS_START + 1)
 
 #define KVMPPC_GSE_IDEN_COUNT                                 \
-	(KVMPPC_GSE_GUESTWIDE_COUNT + KVMPPC_GSE_META_COUNT + \
+	(KVMPPC_GSE_HOSTWIDE_COUNT + \
+	 KVMPPC_GSE_GUESTWIDE_COUNT + KVMPPC_GSE_META_COUNT + \
 	 KVMPPC_GSE_DW_REGS_COUNT + KVMPPC_GSE_W_REGS_COUNT + \
 	 KVMPPC_GSE_VSRS_COUNT + KVMPPC_GSE_INTR_REGS_COUNT)
 
@@ -139,10 +160,11 @@
  */
 enum {
 	KVMPPC_GS_CLASS_GUESTWIDE = 0x01,
-	KVMPPC_GS_CLASS_META = 0x02,
-	KVMPPC_GS_CLASS_DWORD_REG = 0x04,
-	KVMPPC_GS_CLASS_WORD_REG = 0x08,
-	KVMPPC_GS_CLASS_VECTOR = 0x10,
+	KVMPPC_GS_CLASS_HOSTWIDE = 0x02,
+	KVMPPC_GS_CLASS_META = 0x04,
+	KVMPPC_GS_CLASS_DWORD_REG = 0x08,
+	KVMPPC_GS_CLASS_WORD_REG = 0x10,
+	KVMPPC_GS_CLASS_VECTOR = 0x18,
 	KVMPPC_GS_CLASS_INTR = 0x20,
 };
 
@@ -164,6 +186,7 @@ enum {
  */
 enum {
 	KVMPPC_GS_FLAGS_WIDE = 0x01,
+	KVMPPC_GS_FLAGS_HOST_WIDE = 0x02,
 };
 
 /**
@@ -287,7 +310,7 @@ struct kvmppc_gs_msg_ops {
  * struct kvmppc_gs_msg - a guest state message
  * @bitmap: the guest state ids that should be included
  * @ops: modify message behavior for reading and writing to buffers
- * @flags: guest wide or thread wide
+ * @flags: host wide, guest wide or thread wide
  * @data: location where buffer data will be written to or from.
  *
  * A guest state message is allows flexibility in sending in receiving data
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 65d1f291393d..1c12713538a4 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -489,14 +489,15 @@
 #define H_RPTI_PAGE_ALL (-1UL)
 
 /* Flags for H_GUEST_{S,G}_STATE */
-#define H_GUEST_FLAGS_WIDE     (1UL<<(63-0))
+#define H_GUEST_FLAGS_WIDE     (1UL << (63 - 0))
+#define H_GUEST_FLAGS_HOST_WIDE	(1UL << (63 - 1))
 
 /* Flag values used for H_{S,G}SET_GUEST_CAPABILITIES */
-#define H_GUEST_CAP_COPY_MEM	(1UL<<(63-0))
-#define H_GUEST_CAP_POWER9	(1UL<<(63-1))
-#define H_GUEST_CAP_POWER10	(1UL<<(63-2))
-#define H_GUEST_CAP_POWER11	(1UL<<(63-3))
-#define H_GUEST_CAP_BITMAP2	(1UL<<(63-63))
+#define H_GUEST_CAP_COPY_MEM	(1UL << (63 - 0))
+#define H_GUEST_CAP_POWER9	(1UL << (63 - 1))
+#define H_GUEST_CAP_POWER10	(1UL << (63 - 2))
+#define H_GUEST_CAP_POWER11	(1UL << (63 - 3))
+#define H_GUEST_CAP_BITMAP2	(1UL << (63 - 63))
 
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
index e5c7ce1fb761..87691cf86cae 100644
--- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
+++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
@@ -123,6 +123,12 @@ static size_t gs_msg_ops_vcpu_get_size(struct kvmppc_gs_msg *gsm)
 		case KVMPPC_GSID_PROCESS_TABLE:
 		case KVMPPC_GSID_RUN_INPUT:
 		case KVMPPC_GSID_RUN_OUTPUT:
+		  /* Host wide counters */
+		case KVMPPC_GSID_L0_GUEST_HEAP:
+		case KVMPPC_GSID_L0_GUEST_HEAP_MAX:
+		case KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE:
+		case KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX:
+		case KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM:
 			break;
 		default:
 			size += kvmppc_gse_total_size(kvmppc_gsid_size(iden));
diff --git a/arch/powerpc/kvm/guest-state-buffer.c b/arch/powerpc/kvm/guest-state-buffer.c
index b80dbc58621f..871cf60ddeb6 100644
--- a/arch/powerpc/kvm/guest-state-buffer.c
+++ b/arch/powerpc/kvm/guest-state-buffer.c
@@ -92,6 +92,10 @@ static int kvmppc_gsid_class(u16 iden)
 	    (iden <= KVMPPC_GSE_GUESTWIDE_END))
 		return KVMPPC_GS_CLASS_GUESTWIDE;
 
+	if ((iden >= KVMPPC_GSE_HOSTWIDE_START) &&
+	    (iden <= KVMPPC_GSE_HOSTWIDE_END))
+		return KVMPPC_GS_CLASS_HOSTWIDE;
+
 	if ((iden >= KVMPPC_GSE_META_START) && (iden <= KVMPPC_GSE_META_END))
 		return KVMPPC_GS_CLASS_META;
 
@@ -118,6 +122,21 @@ static int kvmppc_gsid_type(u16 iden)
 	int type = -1;
 
 	switch (kvmppc_gsid_class(iden)) {
+	case KVMPPC_GS_CLASS_HOSTWIDE:
+		switch (iden) {
+		case KVMPPC_GSID_L0_GUEST_HEAP:
+			fallthrough;
+		case KVMPPC_GSID_L0_GUEST_HEAP_MAX:
+			fallthrough;
+		case KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE:
+			fallthrough;
+		case KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX:
+			fallthrough;
+		case KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM:
+			type = KVMPPC_GSE_BE64;
+			break;
+		}
+		break;
 	case KVMPPC_GS_CLASS_GUESTWIDE:
 		switch (iden) {
 		case KVMPPC_GSID_HOST_STATE_SIZE:
@@ -187,6 +206,9 @@ unsigned long kvmppc_gsid_flags(u16 iden)
 	case KVMPPC_GS_CLASS_GUESTWIDE:
 		flags = KVMPPC_GS_FLAGS_WIDE;
 		break;
+	case KVMPPC_GS_CLASS_HOSTWIDE:
+		flags = KVMPPC_GS_FLAGS_HOST_WIDE;
+		break;
 	case KVMPPC_GS_CLASS_META:
 	case KVMPPC_GS_CLASS_DWORD_REG:
 	case KVMPPC_GS_CLASS_WORD_REG:
@@ -310,6 +332,13 @@ static inline int kvmppc_gse_flatten_iden(u16 iden)
 
 	bit += KVMPPC_GSE_GUESTWIDE_COUNT;
 
+	if (class == KVMPPC_GS_CLASS_HOSTWIDE) {
+		bit += iden - KVMPPC_GSE_HOSTWIDE_START;
+		return bit;
+	}
+
+	bit += KVMPPC_GSE_HOSTWIDE_COUNT;
+
 	if (class == KVMPPC_GS_CLASS_META) {
 		bit += iden - KVMPPC_GSE_META_START;
 		return bit;
@@ -356,6 +385,12 @@ static inline u16 kvmppc_gse_unflatten_iden(int bit)
 	}
 	bit -= KVMPPC_GSE_GUESTWIDE_COUNT;
 
+	if (bit < KVMPPC_GSE_HOSTWIDE_COUNT) {
+		iden = KVMPPC_GSE_HOSTWIDE_START + bit;
+		return iden;
+	}
+	bit -= KVMPPC_GSE_HOSTWIDE_COUNT;
+
 	if (bit < KVMPPC_GSE_META_COUNT) {
 		iden = KVMPPC_GSE_META_START + bit;
 		return iden;
@@ -588,6 +623,8 @@ int kvmppc_gsb_send(struct kvmppc_gs_buff *gsb, unsigned long flags)
 
 	if (flags & KVMPPC_GS_FLAGS_WIDE)
 		hflags |= H_GUEST_FLAGS_WIDE;
+	if (flags & KVMPPC_GS_FLAGS_HOST_WIDE)
+		hflags |= H_GUEST_FLAGS_HOST_WIDE;
 
 	rc = plpar_guest_set_state(hflags, gsb->guest_id, gsb->vcpu_id,
 				   __pa(gsb->hdr), gsb->capacity, &i);
@@ -613,6 +650,8 @@ int kvmppc_gsb_recv(struct kvmppc_gs_buff *gsb, unsigned long flags)
 
 	if (flags & KVMPPC_GS_FLAGS_WIDE)
 		hflags |= H_GUEST_FLAGS_WIDE;
+	if (flags & KVMPPC_GS_FLAGS_HOST_WIDE)
+		hflags |= H_GUEST_FLAGS_HOST_WIDE;
 
 	rc = plpar_guest_get_state(hflags, gsb->guest_id, gsb->vcpu_id,
 				   __pa(gsb->hdr), gsb->capacity, &i);
-- 
2.47.1


