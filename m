Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B465993C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:51:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M87933sx7z3fN7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:51:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HdBeyN7p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HdBeyN7p;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M86vT39jwz3c7y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 13:39:49 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3Rxbk024348;
	Fri, 19 Aug 2022 03:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Dc7MLliRzdXhHSgMQ78M9OvO5nyRr5G5b4LpBc+rtPE=;
 b=HdBeyN7pcAHZMovN9yQNL4l4yKIoq/b2vlmW4neiPd2dQUsI/zx6NT9Dnn33xTZ8H8Pu
 u07PU1lVehqZSc7URGdqqnPjhSGFg67ot7WXMnxaNtjwRITrZSrPAlYM+dHl9vUJtTj0
 TiCt9MmWptz3NjtOWNrKelwZfXyocRJ/JRoXR3v2dMnCq4xzTB5hf75Y1EaaBexUZcIr
 xhBjt2gITw5RARZWILofR+nZCbqe0vUZ1hHU6X5dY85PIz7sQrk/OdW2usjKIvIfDVyJ
 CaVVGaoe88bLT/7IwcMpq4+zldpLzqqX5mfRQvwlvKIXTlpjFIWT/BlLYacNywtcTHl4 jw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j22mwgac5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J3ch6J011390;
	Fri, 19 Aug 2022 03:39:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3hx3k9ep18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:35 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J3dqGr33489362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 03:39:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74F5D11C050;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F17911C04A;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9CE7E60460;
	Fri, 19 Aug 2022 13:39:29 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 11/18] powerpc: Add ZEROIZE_GPRS macros for register clears
Date: Fri, 19 Aug 2022 13:37:59 +1000
Message-Id: <20220819033806.162054-12-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819033806.162054-1-rmclure@linux.ibm.com>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ThvkFQ1jt5eOy9o3LB-3Y70w-cfZaN1v
X-Proofpoint-ORIG-GUID: ThvkFQ1jt5eOy9o3LB-3Y70w-cfZaN1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=835
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190013
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Macros for restoring and saving registers to and from the stack exist.
Provide macros with the same interface for clearing a range of gprs by
setting each register's value in that range to zero.

The resulting macros are called ZEROIZE_GPRS and ZEROIZE_NVGPRS, keeping
with the naming of the accompanying restore and save macros, and usage
of nullify to describe this operation elsewhere in the kernel.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Change 'ZERO' usage in naming to 'NULLIFY', a more obvious verb
V2 -> V3: Change 'NULLIFY' usage in naming to 'ZEROIZE', which has
precedent in kernel and explicitly specifies that we are zeroing.
---
 arch/powerpc/include/asm/ppc_asm.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 83c02f5a7f2a..b95689ada59c 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -33,6 +33,20 @@
 	.endr
 .endm
 
+/*
+ * This expands to a sequence of register clears for regs start to end
+ * inclusive, of the form:
+ *
+ *   li rN, 0
+ */
+.macro ZEROIZE_REGS start, end
+	.Lreg=\start
+	.rept (\end - \start + 1)
+	li	.Lreg, 0
+	.Lreg=.Lreg+1
+	.endr
+.endm
+
 /*
  * Macros for storing registers into and loading registers from
  * exception frames.
@@ -49,6 +63,14 @@
 #define REST_NVGPRS(base)		REST_GPRS(13, 31, base)
 #endif
 
+#define	ZEROIZE_GPRS(start, end)	ZEROIZE_REGS start, end
+#ifdef __powerpc64__
+#define	ZEROIZE_NVGPRS()		ZEROIZE_GPRS(14, 31)
+#else
+#define	ZEROIZE_NVGPRS()		ZEROIZE_GPRS(13, 31)
+#endif
+#define	ZEROIZE_GPR(n)			ZEROIZE_GPRS(n, n)
+
 #define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
 #define REST_GPR(n, base)		REST_GPRS(n, n, base)
 
-- 
2.34.1

