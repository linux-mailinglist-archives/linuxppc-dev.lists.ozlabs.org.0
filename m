Return-Path: <linuxppc-dev+bounces-4546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E8D9FF325
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 07:47:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNL4H5Q1Zz2yFB;
	Wed,  1 Jan 2025 17:47:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735714047;
	cv=none; b=bjWFA1I7vH2ZSddJR09/AUY4aelv0+zGg29E3QlFZ2dC5LnzGGtIhSaun9NN1mz55U69QeZFsgwKYi6YQKcDNH5xGfIp3OdfwVnWiHTk0fYc9ml+cjHmaTKfP/Ue2Z7gp4sggKB87X9HVbxuXP0CcVD4e2/mv3blcvYyiVVThRSAxgo9r8XFWndP8ZXSfl7dTVFmcwegodkLiEB4JMYPb8S32Xl1C4BOpYF+0NjY3rr4oipprd9lUVvlAn21nEGlrOsgBNIS1Z/1ju0v3+ZLunsmvwwf2ukifhLTUnao+MxUipAj6ARRtFNi8cpMyfR4D2PBWHZ8lg3nfJYGAvv05A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735714047; c=relaxed/relaxed;
	bh=cegCRU9AZBgiNtCXKz4itaW7pnSmWtwrbW5bqWcet0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lyhbk9G/Hja85gA9GbMxN0lH86dZ5dfG5TM1lIoBvD2OPEBhylWZe0dBZTPgCWr4eo8Rbl7zlIJ8bqCYe+XMtOr9c0Ibb/0PTCAjR3tUwGrjWxL/474nXWoAYG+eLlgOtVT3RhmYeAOxKA47x/4zWxVyRrBPS3ja6orj8+kY+09+LG3bZZO5qYl2hqLkqGQP3jxw3w7qNZud4UwIMEXl4SIEBg5AUKl8rBuJ6UrIpl5TGWmWpReNqBZU3wYnsACGMdJyeW1XajfebRFoI3LhFssr/CsltLty5jjRUuviw8Bp3vdtjnArwJPvTvswa0H394WEagHeiX61fSEm56VQoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ekL2gybf; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ekL2gybf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNL4G3jp6z2y66
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jan 2025 17:47:25 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5013qflY029636
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Jan 2025 06:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=cegCRU9AZBgiNtCXKz4itaW7pnSmWtwrbW5bqWcet
	0o=; b=ekL2gybf8bscXzOP9Kd/Iha5+X086WeTdvZx6UyAEz/TKU1anG4u8IWxX
	Ei58ItpTJzyitZfjV1vX5KxKukAGgF7vOrEWcjUf4rn8YNynYkYStFN8zlS4BidC
	SdOSWFPi49yPLXJ4APnNbu42hPdCGq4DU3DYQfO/30LVslHbNM3RCqb2IkLm2/Y+
	g7gKfmPcu7CEkmdI+1NA9qdn4wLL+7ccscXwg5yDYtDg7wEAGFXQqKVWB1jvro+u
	wgbE7K5nFuBAjAHBqJyktRIc3loVyrKoHu1bQx8p2K5SoUswABpUCjN7rkc5Cva7
	1VDXEznOzYd+vaXVuLtvxb+2mfGOQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vx6hrdeb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jan 2025 06:47:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5011L690016656
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Jan 2025 06:47:22 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tw5kd5mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jan 2025 06:47:21 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5016lHq939518468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jan 2025 06:47:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F261D20040;
	Wed,  1 Jan 2025 06:47:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D682720043;
	Wed,  1 Jan 2025 06:47:15 +0000 (GMT)
Received: from ltcden3-lp14.aus.stglabs.ibm.com (unknown [9.53.174.165])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jan 2025 06:47:15 +0000 (GMT)
From: Abhishek Dubey <adubey@linux.ibm.com>
To: maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, hbathini@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v5 1/3] powerpc/pseries: Macros and wrapper functions for H_HTM call
Date: Wed,  1 Jan 2025 01:46:54 -0500
Message-ID: <a102e9d6923c4696c54f399b5c5ded7d28415fa5.1734277855.git.adubey@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
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
X-Proofpoint-ORIG-GUID: l4C3F-yZqSFLpLjw7aRsBDYj8r4G3pI0
X-Proofpoint-GUID: l4C3F-yZqSFLpLjw7aRsBDYj8r4G3pI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=895 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501010054
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
2.44.0


