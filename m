Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C144457F96E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrqtB5BK8z3c2v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:30:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h8qJpJ8f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h8qJpJ8f;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrqrd4bQNz3f3H
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:29:21 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P6Bw3L008736;
	Mon, 25 Jul 2022 06:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=c0eW6U8Uds2mP8OMqEshLfUBnIBq96BTeLdZfJpx8iQ=;
 b=h8qJpJ8fXnMfzfaGOHGwgz0+39va07x6X1fDr9T5qvbe5cheoPrvnUERtrDPXiLhmnS5
 YaujRzGoSqJsdqK9KeaiiGsHN06CVWMAlPpIPU6NTtPlv3i3Fi6dcx9t6lF8jOE6PDbk
 vqaSZ5qxzVhfM+YFDEc8pZa0XWScuYjCUT1vOROYtg0FAUgDKZnhBDsoE0GZmHyb8ht5
 Qs481cAo3aWjFYuTDY/K90CBqzJo+pOl57+bg9iDXPHZjUSTl0zZlcnRVUP1YOmx8Q+p
 n+Gwu6UvovGuIJQFyk+NdICujSN376TY+qx55naPP0WPxpQMNxw3/7lJ/Ci3tV7IEWc5 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnpp8d2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:29:17 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P6DXqh014287;
	Mon, 25 Jul 2022 06:29:17 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnpp8d1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:29:16 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26P6L4Dx031921;
	Mon, 25 Jul 2022 06:29:14 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3hh6eugnr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:29:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26P6TPr229098264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 06:29:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63832AE053;
	Mon, 25 Jul 2022 06:29:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F184AE045;
	Mon, 25 Jul 2022 06:29:10 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.53])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jul 2022 06:29:09 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/14] powerpc: Add NULLIFY_GPRS macros for register clears
Date: Mon, 25 Jul 2022 16:29:06 +1000
Message-Id: <20220725062906.120088-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nhvbjmCo_pnUwQRmCM4esawujHrjvYI9
X-Proofpoint-ORIG-GUID: PaJFXf6125UacM0JrlL07SQhjA9mxo3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=967 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250026
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

Macros for restoring and saving registers to and from the stack exist.
Provide macros with the same interface for clearing a range of gprs by
setting each register's value in that range to zero.

The resulting macros are called NULLIFY_GPRS and NULLIFY_NVGPRS, keeping
with the naming of the accompanying restore and save macros, and usage
of nullify to describe this operation elsewhere in the kernel.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Change 'ZERO' usage in naming to 'NULLIFY', a more obvious verb
---
 arch/powerpc/include/asm/ppc_asm.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 83c02f5a7f2a..d6c46082bf7f 100644
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
+.macro NULLIFY_REGS start, end
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
 
+#define	NULLIFY_GPRS(start, end)	NULLIFY_REGS start, end
+#ifdef __powerpc64__
+#define	NULLIFY_NVGPRS()		NULLIFY_GPRS(14, 31)
+#else
+#define	NULLIFY_NVGPRS()		NULLIFY_GPRS(13, 31)
+#endif
+#define	NULLIFY_GPR(n)			NULLIFY_GPRS(n, n)
+
 #define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
 #define REST_GPR(n, base)		REST_GPRS(n, n, base)
 
-- 
2.34.1

