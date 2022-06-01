Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73106539CC7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 07:49:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCdX02HWyz2xrS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 15:49:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VF5TaNqG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VF5TaNqG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCdWH1hb2z2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 15:49:14 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2514gch9010309;
	Wed, 1 Jun 2022 05:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jgknlmyqw4cWjHt5LWKYqRXejt4nH4yontjQ8nrl+Gg=;
 b=VF5TaNqGGFJuBsvY65mGVnbdP9/VN8jUGdZWpm6bLAr6dzOf+YSs0q7o61B3L1XyvleE
 mAXIjn7pmPZiyacLgr7nK/aBRysyvXSu1jm8AE2Dg9EgfG79udwNV60J7aQovAeDqdm1
 Ekqhn6YLXSYH0CHZj2fLujJSFujHnwOYMLuHNeVgwAvp7hyo+SYVtJqwaThHQUN7NPKQ
 cgCecQW6nkHS1dgV+1raWdlgWxPLf6/Me1ZEyIFjVJIYeRvoMkNFlo5AYLd40NZ7hCEX
 DP/icSyyW+GgGBm64KHfI5M0aaeypWrV9RU6hz9A7L9icqb54LZZNAA/2hvHjqu74n/B 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ge1ajs1d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:49:02 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2515n2jK027551;
	Wed, 1 Jun 2022 05:49:02 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ge1ajs1cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:49:02 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2515YRfR001448;
	Wed, 1 Jun 2022 05:49:00 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma05fra.de.ibm.com with ESMTP id 3gbc97buav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:48:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2515mvs222610348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jun 2022 05:48:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F1C211C04C;
	Wed,  1 Jun 2022 05:48:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B31B611C04A;
	Wed,  1 Jun 2022 05:48:55 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.94])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jun 2022 05:48:55 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc: Add ZERO_GPRS macros for register clears
Date: Wed,  1 Jun 2022 15:48:45 +1000
Message-Id: <20220601054850.250287-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BSDus3J-Mc-PEwPf6ZrjLZfYXEjFwSbU
X-Proofpoint-ORIG-GUID: Cd-6ph6RXK90F37hCMEGHRKVNTpX_CVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_01,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=548 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010025
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Macros for restoring saving registers to and from the stack exist.
Provide a macro for simply zeroing a range of gprs, or an individual
gpr.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc_asm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 4dea2d963738..3fb37a9767f7 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -33,6 +33,19 @@
 	.endr
 .endm
 
+/*
+ * Simplification of OP_REGS, for an arbitrary right hand operand.
+ *
+ *   op  reg, rhs
+ */
+.macro BINOP_REGS op, rhs, start, end
+	.Lreg=\start
+	.rept (\end - \start + 1)
+	\op .Lreg, \rhs
+	.Lreg=.Lreg+1
+	.endr
+.endm
+
 /*
  * Macros for storing registers into and loading registers from
  * exception frames.
@@ -49,6 +62,10 @@
 #define REST_NVGPRS(base)		REST_GPRS(13, 31, base)
 #endif
 
+#define ZERO_GPRS(start, end)		BINOP_REGS li, 0, start, end
+#define ZERO_NVGPRS()			ZERO_GPRS(14, 31)
+#define ZERO_GPR(n)			ZERO_GPRS(n, n)
+
 #define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
 #define REST_GPR(n, base)		REST_GPRS(n, n, base)
 
-- 
2.34.1

