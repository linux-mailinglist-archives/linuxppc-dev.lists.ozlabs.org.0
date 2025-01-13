Return-Path: <linuxppc-dev+bounces-5143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 850ABA0B4AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 11:40:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWpgZ6yhjz3048;
	Mon, 13 Jan 2025 21:40:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736764826;
	cv=none; b=HcWbXQfF3MZTmLTgMW1fFZjYf2LB7WZTf7b+bY8Yrlcr5PyfSdk0dyBUPqR3c0Ckhwfq+qTdBMu/sp3y0vV+EIvNC3/6wYPbf80pBT1uCksROiF8O3w2Cd29tf0OSUNAPFnglNtSmPpjPEnGoFeI1olSc9RCamyhx5o18zoGwmlD9ab6sGn8fs7susadkAhZBX8Osm8kmvF0jjo5rcYiNM8mxEkUn8QWkwiTe5Rv2WGS6CDlCy/pIlk6Y3B7YP3Nj4FTz+3mOTWo1LZqXiPTJt7qaAwg2ox5CRXBkU+HkEgJ35bF+aHKxpF552IracS1OxW5kzTQWMbfvAzqTENBRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736764826; c=relaxed/relaxed;
	bh=o4tsKYDpvLj4ioh1d8CMeFdxY1E2+fnVC8DpzLndD4A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UcliF2TrfLDlpcvCWFV0NZE0ny12uhsg3KhgV8cFEVKgxy6p1FA6/bmJOo9UAMWgBQ161O4M/2JTIB/kG8zz2Tjt1J3Ezr4YkDUprCtUfepMWkHBrFhy2I/PjqnLzk5zUtCNXhMbDM/SYuPe/DfrydaPDxM4mTBFZ+BAPZK9raEoYQCqMnpZMIiRl0TdxFeVFd99Tn+UucV7GdnyNYljSpeKBWuMeN4RMCyK7lUpLTaLVv2umrQu64Xp0NZ3dZqvPGWkz/89n7c/K96+4PS6xKi1EuyiPYcvoKojqw2yk0XK7rUnTt/GzfP0D/HdH+/jl4WcHvejP4/iNbyBh5z44A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U9kKe2ka; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U9kKe2ka;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWpgY5hf9z2yRF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 21:40:25 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D3v2ZA022978
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=o4tsKYDpvLj4ioh1d8CMeFdxY1E2+fnVC8DpzLndD
	4A=; b=U9kKe2kamH8jiiRtzw3oHnDyHyJugiISAN8NQqNRZLTiMkZf5cgJ95CE/
	srbLEm/sS1NlgMF59XuaV8hsEEy4TyrVrz4J2lJJ2nAvIl37SLsZxQlGHPCvdz3U
	9/byUwxkwAtjnUHbDPPUEntvqkdlX0KQ0yIlhkVoZ5TzWmXk5Oix9bqZCiG2mK0S
	L14eHPWX/YTmnF05rmRcDGPUwhcCX3zacdyR4XOBTRQTUlBnAU9F5DSSA2KRdMIO
	z4J5PyXKPxUt+0F1O10PpOwu+rpDy9UItc2IlQaWea+Fs8KIjQiriFbr9QOcRMd0
	N2RuOe9lkTC9TWwuq7N0fqJ6TE15Q==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444f74k77u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:22 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50D8ZO56007364
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443ymwqb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 10:40:21 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DAeI5K33555022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 10:40:18 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57BA220043;
	Mon, 13 Jan 2025 10:40:18 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BE2E2004B;
	Mon, 13 Jan 2025 10:40:17 +0000 (GMT)
Received: from ltcden3-lp4.aus.stglabs.ibm.com (unknown [9.53.174.155])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 10:40:17 +0000 (GMT)
From: adubey@linux.ibm.com
To: maddy@linux.ibm.com, atrajeev@linux.ibm.com, hbathini@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 1/3] powerpc/pseries: Macros and wrapper functions for H_HTM call
Date: Mon, 13 Jan 2025 05:40:13 -0500
Message-Id: <20250113104015.290566-1-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
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
X-Proofpoint-GUID: CSYlpUzYjGXiuUk5c1eJ2auSmteLkXh8
X-Proofpoint-ORIG-GUID: CSYlpUzYjGXiuUk5c1eJ2auSmteLkXh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501130089
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Abhishek Dubey <adubey@linux.ibm.com>

Define macros and wrapper functions to handle
H_HTM (Hardware Trace Macro) hypervisor call.
H_HTM is new HCALL added to export data from
Hardware Trace Macro (HTM) function.

v3 patch:
  https://lore.kernel.org/linuxppc-dev/20240828085223.42177-1-maddy@linux.ibm.com/

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h         | 34 +++++++++++++++++++++++
 arch/powerpc/include/asm/plpar_wrappers.h | 21 ++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 65d1f291393d..eeef13db2770 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -348,6 +348,7 @@
 #define H_SCM_FLUSH		0x44C
 #define H_GET_ENERGY_SCALE_INFO	0x450
 #define H_PKS_SIGNED_UPDATE	0x454
+#define H_HTM                   0x458
 #define H_WATCHDOG		0x45C
 #define H_GUEST_GET_CAPABILITIES 0x460
 #define H_GUEST_SET_CAPABILITIES 0x464
@@ -498,6 +499,39 @@
 #define H_GUEST_CAP_POWER11	(1UL<<(63-3))
 #define H_GUEST_CAP_BITMAP2	(1UL<<(63-63))
 
+/*
+ * Defines for H_HTM - Macros for hardware trace macro (HTM) function.
+ */
+#define H_HTM_FLAGS_HARDWARE_TARGET    (1ul << 63)
+#define H_HTM_FLAGS_LOGICAL_TARGET     (1ul << 62)
+#define H_HTM_FLAGS_PROCID_TARGET      (1ul << 61)
+#define H_HTM_FLAGS_NOWRAP             (1ul << 60)
+
+#define H_HTM_OP_SHIFT                 (63-15)
+#define H_HTM_OP(x)                    ((unsigned long)(x)<<H_HTM_OP_SHIFT)
+#define H_HTM_OP_CAPABILITIES          0x01
+#define H_HTM_OP_STATUS                        0x02
+#define H_HTM_OP_SETUP                 0x03
+#define H_HTM_OP_CONFIGURE             0x04
+#define H_HTM_OP_START                 0x05
+#define H_HTM_OP_STOP                  0x06
+#define H_HTM_OP_DECONFIGURE           0x07
+#define H_HTM_OP_DUMP_DETAILS          0x08
+#define H_HTM_OP_DUMP_DATA             0x09
+#define H_HTM_OP_DUMP_SYSMEM_CONF      0x0a
+#define H_HTM_OP_DUMP_SYSPROC_CONF     0x0b
+
+#define H_HTM_TYPE_SHIFT               (63-31)
+#define H_HTM_TYPE(x)                  ((unsigned long)(x)<<H_HTM_TYPE_SHIFT)
+#define H_HTM_TYPE_NEST                        0x01
+#define H_HTM_TYPE_CORE                        0x02
+#define H_HTM_TYPE_LLAT                        0x03
+#define H_HTM_TYPE_GLOBAL              0xff
+
+#define H_HTM_TARGET_NODE_INDEX(x)             ((unsigned long)(x)<<(63-15))
+#define H_HTM_TARGET_NODAL_CHIP_INDEX(x)       ((unsigned long)(x)<<(63-31))
+#define H_HTM_TARGET_CORE_INDEX_ON_CHIP(x)     ((unsigned long)(x)<<(63-47))
+
 #ifndef __ASSEMBLY__
 #include <linux/types.h>
 
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 71648c126970..91be7b885944 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -65,6 +65,27 @@ static inline long register_dtl(unsigned long cpu, unsigned long vpa)
 	return vpa_call(H_VPA_REG_DTL, cpu, vpa);
 }
 
+static inline long htm_call(unsigned long flags, unsigned long target,
+               unsigned long operation, unsigned long param1,
+               unsigned long param2, unsigned long param3)
+{
+       return plpar_hcall_norets(H_HTM, flags, target, operation,
+                                 param1, param2, param3);
+}
+
+static inline long htm_get_dump_hardware(unsigned long nodeindex,
+               unsigned long nodalchipindex, unsigned long coreindexonchip,
+               unsigned long type, unsigned long addr, unsigned long size,
+               unsigned long offset)
+{
+       return htm_call(H_HTM_FLAGS_HARDWARE_TARGET,
+                       H_HTM_TARGET_NODE_INDEX(nodeindex) |
+                       H_HTM_TARGET_NODAL_CHIP_INDEX(nodalchipindex) |
+                       H_HTM_TARGET_CORE_INDEX_ON_CHIP(coreindexonchip),
+                       H_HTM_OP(H_HTM_OP_DUMP_DATA) | H_HTM_TYPE(type),
+                       addr, size, offset);
+}
+
 extern void vpa_init(int cpu);
 
 static inline long plpar_pte_enter(unsigned long flags,
-- 
2.39.3


