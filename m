Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF10910F51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 19:48:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ItLXeD7S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4nyW5twKz3cVy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 03:48:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ItLXeD7S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4nxr1D4Bz3cRJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 03:47:27 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHPHtv030117;
	Thu, 20 Jun 2024 17:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=BUMB4bv3dFAneA/O9iKY4Z4+Hr
	8vT1YKKEfHeFU963c=; b=ItLXeD7SuMMlhWSlIaZD1yLrwyCgUb97pr3WnCcxJm
	AVze9+X8DyEOQ3Nz96g5cNZUBv40nov26ZldvRZBjoD69mwWut2cWML9enHQb/EX
	tUW4s7atjbQo4cd12a1ftoWbsob5SIivc7Z0Bxzz11yVy3/SZ+31TVeMuuFHsX+1
	0pTPhgsHbPyBsNgGP9VVvxdIytT+0bQJmD+fGT6kB8/o0QL50n5Z4pNZtirzK6qw
	sth1XvARAEFn+T9p4I0f6ciEtdQt8pWwl1VqXCh9ZFd9IGz8IEkFwW8a1bObOaWk
	JLfwyeP9z5KvWjoDPzol9rvrWsEZsErUwavytzpNaizA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yvrt401t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 17:47:20 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45KHlJhY001981;
	Thu, 20 Jun 2024 17:47:20 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yvrt401t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 17:47:19 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45KHJkJD025635;
	Thu, 20 Jun 2024 17:47:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yvrqv06hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 17:47:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45KHlDxC55706018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Jun 2024 17:47:15 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9696C20049;
	Thu, 20 Jun 2024 17:47:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0C5420040;
	Thu, 20 Jun 2024 17:47:10 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.195.32.74])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Jun 2024 17:47:10 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/3] powerpc/pseries: Macros and wrapper functions for H_HTM call
Date: Thu, 20 Jun 2024 23:16:12 +0530
Message-ID: <20240620174614.53751-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k_yMxGyIRRJPvRpWQv9OaZxzGvnwDdou
X-Proofpoint-ORIG-GUID: OMlYL1_z0S81OBHA8mIDCOKAFdPU4Wtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_08,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 impostorscore=0 mlxscore=0
 malwarescore=0 phishscore=0 mlxlogscore=885 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406200126
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

