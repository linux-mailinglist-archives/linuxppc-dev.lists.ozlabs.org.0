Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4891EE2A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 07:13:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m1FxYq0w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCrdq1YJNz3cMX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 15:13:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m1FxYq0w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCrd60l9Kz30Wl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 15:12:25 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4624um8S024554;
	Tue, 2 Jul 2024 05:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=ymO50PLZKofPG57nW9j53W04oK
	OPwb8ScfXeOdPnPaw=; b=m1FxYq0wBhciYP8Y1aXc/xzwCG+3FzeY7DsHQQ4XXQ
	ObPjC51cYs2PTj/D3d6SJY3sVuFuJ79R0ci4nQj+i/t2ShuTVwt9Cto/BPiM7f7i
	sZlyceoTH0dDLzDn3Gm7TuKc5TAPnMMbdjc3YpA2/9jyXA2FXpUTWjej8ASHrQds
	yLpOl6kxYw3y204WK+U9JmK+dsebT2dqBDbhaZaAHzsI3lmQKa/nehJTq69MSLFo
	XD4DZpqArekz3Gw1uStKjH9AaDqaQXMNX7xV56AKGMRjh/TsogLuLVw2jGjf/J8P
	WMCVt3rpLWsStSHuFsOpDsA/don6gjoh7MeuF9RL284w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 404a4305a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 05:12:15 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4625CFQP014620;
	Tue, 2 Jul 2024 05:12:15 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 404a43059x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 05:12:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4623KrPZ026386;
	Tue, 2 Jul 2024 05:12:14 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 402wkpu12j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 05:12:13 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4625C8uW38666502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2024 05:12:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17C5520043;
	Tue,  2 Jul 2024 05:12:08 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC2CE20040;
	Tue,  2 Jul 2024 05:12:05 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.124.209.194])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Jul 2024 05:12:05 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 1/3] powerpc/pseries: Macros and wrapper functions for H_HTM call
Date: Tue,  2 Jul 2024 10:41:43 +0530
Message-ID: <20240702051145.251267-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GJwoQZTFrrtdSdxo5HKlEWelBOB4bTfO
X-Proofpoint-GUID: Z_KEtngxBe7O1UVhJgSU_HjpOPMbDeQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_01,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=967 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407020033
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, christophe.leroy@csgroup.eu, Madhavan Srinivasan <maddy@linux.ibm.com>, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Define macros and wrapper functions to handle
H_HTM (Hardware Trace Macro) hypervisor call.
H_HTM is new HCALL added to export data from
Hardware Trace Macro (HTM) function.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
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
index b3ee44a40c2f..24d5647096e0 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -93,6 +93,27 @@ static inline long register_dtl(unsigned long cpu, unsigned long vpa)
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

