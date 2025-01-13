Return-Path: <linuxppc-dev+bounces-5169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F79A0BDCC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 17:41:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWygZ2k0bz3cfB;
	Tue, 14 Jan 2025 03:40:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736786458;
	cv=none; b=JCL20bN0QvPsq63k3ufCYuqZ4rtMmesrJAGl2zx1cXLpsKljvJsZL3fCvnLzs4E2Ay9Y+hQh29SbEU81vq6tkt0+gh290qSK36Y0RECJCF0yJTut3mnoS6dmEToRiQjpGNDaoLy4WzyGwkVn3mI4XqCrPyp4OLRbIEKRq9xWTD/fL/VIP1s3/MSTp7HaI4c1VLufFG7kRfjzloLRRBTPK9gyhQ1K5NJOEJ5EbKeCTMSFrznq1+Zk1KcSeJUo1YLpV8ugLHrT362QLYispqtqUOenorsbSdVySDZG2RlU0K2512MCehuvwCqQLkiEiHswHLAWrqs1xK/Wcu52gPAvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736786458; c=relaxed/relaxed;
	bh=PTWi29uOEIShxcRjNUzIVYFGvehoXdRph01RkbdIVQA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JYCosBn0BIy0HOry4ENYfYvpWqKkYILB7ekrm6fZXrxh8GnlD1p2C9O1ZkImnZjZUrY8ERpkYz3AkblYSqr1uTWWnYgPwgsSaIFxD6hOPoH80vkQJIvfgZqCddefFd5BgIFy9X+F1UCDYS1NI6LStDGRTX4vb8P5HsIu9tJ/HFk4AEGtTt3y6eBFdteztzpHZACfQsQVPp6azlXsiQroi64XSBEShz/zFZzd5x9cfg6YKdxn15KXmGMdXntPXWswC0XAw28iAR2lfYeBsZH0Sd/Q1cLldKQikcvJRVyINqYKkWWv+CHIGjaxMsdVngTNZEuypDMcx96mDakE2tvQ4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XLVPut/U; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XLVPut/U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWygY1sFXz3cdh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 03:40:57 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DD7WUD022743
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=PTWi29uOEIShxcRjNUzIVYFGvehoXdRph01RkbdIV
	QA=; b=XLVPut/Ul02teFGyeJNsCwI3vcikZWq47eQndYtJJixcc4NjKoEnaPa2L
	2H8Qw02hcdvgJUz+2Tl0wYKDqms1YDTFjIL9OQry+kBZkCEaMpmvW/nrHRIQIeR2
	o+tSYDYwyC/PUCowjd3B20sA2QPdlcn3x/oMkMuISa4dyIOZA7iVK+Zs3CV/XDbH
	zp4GToOrzwrpIK+VpgLqEdIFqe8Lcy9JcdkADEsyEyhIHyLKsI0+qPzwy676Xiay
	wkWBOwcwdUonR7pUj5PgqAZLTGL1tmi/Yxps6Hzr5UJHweK1N++0hTv9LkodQlv5
	p3/Jd+Yvcn8Ju11QWIsMK9paeK4gA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 444qvhkpra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50DGLt0n007519
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443ymy35y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 16:40:53 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50DGenLB56885516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jan 2025 16:40:50 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAA852005A;
	Mon, 13 Jan 2025 16:40:49 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1025220043;
	Mon, 13 Jan 2025 16:40:49 +0000 (GMT)
Received: from ltcden3-lp4.aus.stglabs.ibm.com (unknown [9.53.174.155])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jan 2025 16:40:48 +0000 (GMT)
From: adubey@linux.ibm.com
To: maddy@linux.ibm.com, atrajeev@linux.ibm.com, hbathini@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 RESEND 1/3] powerpc/pseries: Macros and wrapper functions for H_HTM call
Date: Mon, 13 Jan 2025 11:40:37 -0500
Message-Id: <20250113164039.302017-1-adubey@linux.ibm.com>
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
X-Proofpoint-GUID: XmkTY-fSYZwRUV7pbXymppDcZtyQkz4v
X-Proofpoint-ORIG-GUID: XmkTY-fSYZwRUV7pbXymppDcZtyQkz4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130135
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Abhishek Dubey <adubey@linux.ibm.com>

Define macros and wrapper functions to handle
H_HTM (Hardware Trace Macro) hypervisor call.
H_HTM is new HCALL added to export data from
Hardware Trace Macro (HTM) function.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
v3 patch:
  https://lore.kernel.org/linuxppc-dev/20240828085223.42177-1-maddy@linux.ibm.com/

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


