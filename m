Return-Path: <linuxppc-dev+bounces-6415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2441A42033
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 14:16:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1h7c37wVz305C;
	Tue, 25 Feb 2025 00:15:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740402956;
	cv=none; b=Xarj8686JU1MugGqctEg9W/UJ4C/gX4Xi/GUhwODMgoM/05b480dAeAnnDXTiLbpL7Sh1BZuoSV8T90UIhZP+ZaPTfBAXq9DAFS82X5Q4ltPr7HcOp1Gtszcp6/ZrhOvEqgZLTMmu1gbF2+g3SipasFHk2cjj4HtTdYHWBYoPrky4VGcMGtRBZckTnOHefT1qBUQNHFot7HnY0PbevzxyFbNFZ/yMBV8Y5fjUVYHmdXaTYFn+NM3WqaXYSWgaeSMU4kpmvSS3y3+FMrvb/xHKSx4SPvsaVpLqvrsnKlLj9fEDQ2FgI/GRyv8alfBlgdn7FvtzycOiD4tAVZLYQgwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740402956; c=relaxed/relaxed;
	bh=zMTtx5dIxOF1B3Q4YuCYxj2hJTPLODuItVw2c4EAEHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PlHpJ4+mWYUln/Zj1uPurBAQtZyzT32+dCosW2hONIL57X67f0NJO07kfZFh3999PmrMRWaLT5vTFfB4OciUw5PZ4Cb36bACIA1YdGQEF8v5zsWYWMS7cQTmD4as9/KN79uoX8XzomVYFqMJE52q+HoH1wlIXtFMhap4/Lz69vUa9J8xLbqH9DR5M3TZVRNkEIYKkUdwYZ2RRDhx1pMbVh/9W7/ct3GSsTb3L3qRx12fxdmXm2N9Mnhdrq65s+l3B3iDSVE6ymcGJ3U9HI7nHQiu+Tq4OumC2vURSUQ36PAN4I4ZTwLGzDFljgTum/OJZutczEz2JfIZgN32bmjj2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P35skQNT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P35skQNT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1h7b4h2wz302c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 00:15:55 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OCoFVT023371;
	Mon, 24 Feb 2025 13:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zMTtx5dIxOF1B3Q4Y
	uCYxj2hJTPLODuItVw2c4EAEHg=; b=P35skQNT4vd2jOrATBpgCumFH7b6Htmpn
	xzeCTDjCCUplaKLClYGoJ2aQUITfw3TL8b4tmsGAh3exSus44pSFIHwEBHXhh652
	Rl9dWdDAOsBrraC/koyGmRhcqz5wCq9oDW+G9+jj/B97ZtkUu9OQcsa88l3ooIcd
	vQ06tbI11ISS75BnM+tkh2eggCgP4BsTqvGu6nVeyig6UaF/P0zzZ9EpXniKnXg0
	71vGdYJsPhF8GdAZts6XagLrQVk32zBlYIaQb8kwXcqPzzri4keiEBp1xyL4cVgi
	hQ+KLYm8EHDqossjcKdpBstvatsrO3QoBaW7gbOn8gdC0EQOgwc7g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450cta33sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:15:48 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51ODCA5F022057;
	Mon, 24 Feb 2025 13:15:48 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450cta33se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:15:48 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51OCToU6026304;
	Mon, 24 Feb 2025 13:15:47 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44yswn78kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 13:15:47 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51ODFheW57213392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 13:15:43 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5494B20043;
	Mon, 24 Feb 2025 13:15:43 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E3B420040;
	Mon, 24 Feb 2025 13:15:39 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.210.32])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 24 Feb 2025 13:15:38 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 24 Feb 2025 18:45:38 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: [PATCH v4 2/6] kvm powerpc/book3s-apiv2: Add support for Hostwide GSB elements
Date: Mon, 24 Feb 2025 18:45:16 +0530
Message-ID: <20250224131522.77104-3-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224131522.77104-1-vaibhav@linux.ibm.com>
References: <20250224131522.77104-1-vaibhav@linux.ibm.com>
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
X-Proofpoint-GUID: dklPXDEivAAuvoSy8OCurqAuAkYPBmQC
X-Proofpoint-ORIG-GUID: _0WfTVq51tpNXZsxjOkrckk4ODTTzRa5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_05,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240095
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
Changelog

v3->v4:
None

v2->v3:
None

v1->v2:
None
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
2.48.1


