Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FAE59F151
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:14:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8mm1DTtz3dpv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 12:14:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WaF1ypig;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WaF1ypig;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8cF0zpHz3c6Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 12:07:08 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O1xqcC008794;
	Wed, 24 Aug 2022 02:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xWd0pT4Cin4Rn4t81e7pvmXk5g+ACLSPCdpshRGPUJ0=;
 b=WaF1ypigh0oJolz2nCwIsIafwzMWbhgVjPZSdZ4wwv/edjiYzNFuMj4geOZfuF8BkbJ6
 ZGbskgqh5K7UQpzoYfwysWSLGBVzmaY2/ZkyL0L5X0ISrG+kdSDoCyYbZMuQm3dhmDGu
 eNPgQIjxfpKVTFWohRuWoA7SN4rOb1BK7VwDgF2dpTwHWgl3zx1pXenioFMS24P33zlY
 rI6kayzli7A+QlBT+ufB2gQbmcV5abBCZ+VhxDU5iDlovwXt6F4j+eDyoXQh0Sv65h8J
 evYoT3byqEuKAs55sqcnhuUKIU2/hYaJk5lrP2pSNE2we4S5GK+deegrRUGU6XZ/ybMx LA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5atag5cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:07:02 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O25pXJ014373;
	Wed, 24 Aug 2022 02:07:00 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3j2pvj4gkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:07:00 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27O26vhP30998990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Aug 2022 02:06:57 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEC855204F;
	Wed, 24 Aug 2022 02:06:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 68FE052050;
	Wed, 24 Aug 2022 02:06:57 +0000 (GMT)
Received: from civic.. (unknown [9.177.18.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 78D4A600A7;
	Wed, 24 Aug 2022 12:06:54 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 11/20] powerpc: Add ZEROIZE_GPRS macros for register clears
Date: Wed, 24 Aug 2022 12:05:39 +1000
Message-Id: <20220824020548.62625-12-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824020548.62625-1-rmclure@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wMhyDXomhIx493nA2_IRkJj209Fra6Rd
X-Proofpoint-ORIG-GUID: wMhyDXomhIx493nA2_IRkJj209Fra6Rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=876 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208240005
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
of zeroize to describe this operation elsewhere in the kernel.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Change 'ZERO' usage in naming to 'NULLIFY', a more obvious verb
V2 -> V3: Change 'NULLIFY' usage in naming to 'ZEROIZE', which has
precedent in kernel and explicitly specifies that we are zeroing.
V3 -> V4: Update commit message to use zeroize.
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

