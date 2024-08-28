Return-Path: <linuxppc-dev+bounces-661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E05AB9622CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 10:52:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtyq442NNz2y8R;
	Wed, 28 Aug 2024 18:52:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724835168;
	cv=none; b=RE61XSF9AXRyoqRGlWfkg5dEeGAH8svtt9Ikemk2r6STDMxlS/hrJOnKbRCGeVA7mh2e1mZXuCsUCStr4i5NYARgQOs40FXB3M9HqEnTxH0gAFwQWLOm+djVlVYNbp646OBhZaFwCO97grLrDQcxf5g9xFKR5MKQ7Gc/nmC8Z4pNfNh0xebTzk6WQne0aPhRBT7IrvIaYRculYKJS7yXK4ZnUA22mn0+oJ83c0hru9y8VmO9fJmR4WwVKF/ZTmAnPEOL5iGWVAN/m7gF4g9O6DYU7u7QZEGvZXlnijaPzEv1z0B5S0TJv9Tobz7+21xJIHjxOFSn+kH9qF75VGQY0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724835168; c=relaxed/relaxed;
	bh=EjzRO2tGYRVXXwPfUBgOo94f/i40t7UWOscJ0ojY21M=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=d3ybwYDptepsmsGZQHmgmj+mM2iDbeVwC0QFCjJkXBhmt9Hq6L5Y8xaS+7EkSYK6C87vK9M7kEMtdGZhMaZ6+ypssytCaggZgLdYn1C5CVaDimdCEtdkhFsO6hP0EU2xxiEhIbWNKu2kbFb5qwv4ccxwCqEcLQeYQuNo/AZeVAqP8pyL6E0dinZ0xpMrX3P9zJs5VSxVuCibbp7Ysuxun0scGpd7VpQmF8NVomGFNLPR2LiFc5pi4ZWl83v9C+xcbtbv5Ro4FHHge2Vp8FjPI1m6ekr/5XnvqPqccGhze5nz5QkT68hHjzjdtYwuRHsG9E84dGc/KtWJ68u6Y0MF2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rkB/p5pP; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rkB/p5pP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtyq406ghz2xpv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 18:52:47 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47S2tKb1020037;
	Wed, 28 Aug 2024 08:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=EjzRO2tGYRVXXwPfUBgOo94f/i
	40t7UWOscJ0ojY21M=; b=rkB/p5pPfYr6Pq+jXEoPPLW7gYMuGGVf90/AUax9ML
	GeOKTjw0a6tABPAJsE4GDc1TyL1IdcP2TR/t7MkVlgFk8v08UrHAS1hLEERvc4TE
	qvnsHkXxCD6wCmWkgBsDBZwZ3MBrNmS2bhkJkE2S5103crn0XukMH9qSQMStRPIQ
	8IaAuo5Th3zqHZ563yLC4fRzY5rPd8moLjA4FggFnbfpY5OtD06QrgAUWdw1Y5jG
	YsWOZuKWWieZ3sS3lsOPcX0xgGt7qSbX3xOVz5CNs+iEkJw3mImsxUjjAGUgUBtC
	AfqUWx8wOV5ErHkDuiE3UGKu9Ool2L6yav3A3ngEUZnA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8qsvm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 08:52:38 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47S8nZ0b001070;
	Wed, 28 Aug 2024 08:52:38 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8qsvm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 08:52:38 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47S5KLWs031005;
	Wed, 28 Aug 2024 08:52:37 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 417t80xv6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 08:52:37 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47S8qWJL17170718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Aug 2024 08:52:33 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C47420043;
	Wed, 28 Aug 2024 08:52:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6ACF2004B;
	Wed, 28 Aug 2024 08:52:30 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.122.25])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Aug 2024 08:52:30 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v3 1/3] powerpc/pseries: Macros and wrapper functions for H_HTM call
Date: Wed, 28 Aug 2024 14:22:21 +0530
Message-ID: <20240828085223.42177-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sY8rIxtioT4MaGz6jPhMxJgho_lgncCD
X-Proofpoint-ORIG-GUID: zGtp5AWrchA2oICaUMJK_VxCvWgc8lJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=979 spamscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280060

Define macros and wrapper functions to handle
H_HTM (Hardware Trace Macro) hypervisor call.
H_HTM is new HCALL added to export data from
Hardware Trace Macro (HTM) function.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v2:
- No changes
Changelog v1:
- No changes

 arch/powerpc/include/asm/hvcall.h         | 34 +++++++++++++++++++++++
 arch/powerpc/include/asm/plpar_wrappers.h | 21 ++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 7a8495660c2f..7ad13685c127 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -348,6 +348,7 @@
 #define H_SCM_FLUSH		0x44C
 #define H_GET_ENERGY_SCALE_INFO	0x450
 #define H_PKS_SIGNED_UPDATE	0x454
+#define H_HTM			0x458
 #define H_WATCHDOG		0x45C
 #define H_GUEST_GET_CAPABILITIES 0x460
 #define H_GUEST_SET_CAPABILITIES 0x464
@@ -497,6 +498,39 @@
 #define H_GUEST_CAP_POWER10	(1UL<<(63-2))
 #define H_GUEST_CAP_BITMAP2	(1UL<<(63-63))
 
+/*
+ * Defines for H_HTM - Macros for hardware trace macro (HTM) function.
+ */
+#define H_HTM_FLAGS_HARDWARE_TARGET	(1ul << 63)
+#define H_HTM_FLAGS_LOGICAL_TARGET	(1ul << 62)
+#define H_HTM_FLAGS_PROCID_TARGET	(1ul << 61)
+#define H_HTM_FLAGS_NOWRAP		(1ul << 60)
+
+#define H_HTM_OP_SHIFT			(63-15)
+#define H_HTM_OP(x)			((unsigned long)(x)<<H_HTM_OP_SHIFT)
+#define H_HTM_OP_CAPABILITIES		0x01
+#define H_HTM_OP_STATUS			0x02
+#define H_HTM_OP_SETUP			0x03
+#define H_HTM_OP_CONFIGURE		0x04
+#define H_HTM_OP_START			0x05
+#define H_HTM_OP_STOP			0x06
+#define H_HTM_OP_DECONFIGURE		0x07
+#define H_HTM_OP_DUMP_DETAILS		0x08
+#define H_HTM_OP_DUMP_DATA		0x09
+#define H_HTM_OP_DUMP_SYSMEM_CONF	0x0a
+#define H_HTM_OP_DUMP_SYSPROC_CONF	0x0b
+
+#define H_HTM_TYPE_SHIFT		(63-31)
+#define H_HTM_TYPE(x)			((unsigned long)(x)<<H_HTM_TYPE_SHIFT)
+#define H_HTM_TYPE_NEST			0x01
+#define H_HTM_TYPE_CORE			0x02
+#define H_HTM_TYPE_LLAT			0x03
+#define H_HTM_TYPE_GLOBAL		0xff
+
+#define H_HTM_TARGET_NODE_INDEX(x)		((unsigned long)(x)<<(63-15))
+#define H_HTM_TARGET_NODAL_CHIP_INDEX(x)	((unsigned long)(x)<<(63-31))
+#define H_HTM_TARGET_CORE_INDEX_ON_CHIP(x)	((unsigned long)(x)<<(63-47))
+
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 71648c126970..a63a4d29cfdf 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -65,6 +65,27 @@ static inline long register_dtl(unsigned long cpu, unsigned long vpa)
 	return vpa_call(H_VPA_REG_DTL, cpu, vpa);
 }
 
+static inline long htm_call(unsigned long flags, unsigned long target,
+		unsigned long operation, unsigned long param1,
+		unsigned long param2, unsigned long param3)
+{
+	return plpar_hcall_norets(H_HTM, flags, target, operation,
+				  param1, param2, param3);
+}
+
+static inline long htm_get_dump_hardware(unsigned long nodeindex,
+		unsigned long nodalchipindex, unsigned long coreindexonchip,
+		unsigned long type, unsigned long addr, unsigned long size,
+		unsigned long offset)
+{
+	return htm_call(H_HTM_FLAGS_HARDWARE_TARGET,
+			H_HTM_TARGET_NODE_INDEX(nodeindex) |
+			H_HTM_TARGET_NODAL_CHIP_INDEX(nodalchipindex) |
+			H_HTM_TARGET_CORE_INDEX_ON_CHIP(coreindexonchip),
+			H_HTM_OP(H_HTM_OP_DUMP_DATA) | H_HTM_TYPE(type),
+			addr, size, offset);
+}
+
 extern void vpa_init(int cpu);
 
 static inline long plpar_pte_enter(unsigned long flags,
-- 
2.45.2


