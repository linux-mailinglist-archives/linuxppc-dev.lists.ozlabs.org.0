Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7815BF6DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:00:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTnG1vWYz2yX3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:00:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=heTOnI2w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=heTOnI2w;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTkh2x0lz3c8b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:57:48 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L5WDTh012028;
	Wed, 21 Sep 2022 06:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=X8QMMIJBzTZKR68FYKxHDVxr2NbaWc+v5wYX3/Km+II=;
 b=heTOnI2wca+7RAoR66mTffB0giTbGQIy4/P8JaT192QCQtQJ7QjcBahwaaRr4BO4fK3b
 JOSvYwgJeV0OYG0Q4tdZMjssVspLdFAnfTly/jOOsPulv7y+p7Ma9IRyil4pNllMUzI2
 BhqmPTdKdDngG76dpZRvRfMCt7MJJNVXe4O/CMvmP3kz9vTygABKXbs3W/e6BmR1sakS
 H1e+aHP2DcTI8giaG6eR1L9J3OK4nImFlun6lEJo/0j6dHNnW9jjM0tJTXe0dwl2f7D4
 bE1j7WrUN2xrMdpQpt0rI78fEplxcBUx2hWefKfvk19+LL5GnSnBmCU++H7mWPOidc1o 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvj6tw33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:57:43 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L6mAef032412;
	Wed, 21 Sep 2022 06:57:42 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqvj6tw2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:57:42 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6rFk0004586;
	Wed, 21 Sep 2022 06:57:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3jn5v8mvh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:57:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6vcbQ42729852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:57:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93732A4054;
	Wed, 21 Sep 2022 06:57:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EA87A405B;
	Wed, 21 Sep 2022 06:57:38 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:57:38 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C8EB860060;
	Wed, 21 Sep 2022 16:57:34 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 03/25] powerpc: Add ZEROIZE_GPRS macros for register clears
Date: Wed, 21 Sep 2022 16:55:43 +1000
Message-Id: <20220921065605.1051927-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v4AaRa0OXaqkmLLXxlpQRyymmpTvO9RN
X-Proofpoint-GUID: DhgrTKJ27anrw5_Abi7iyk1oY3EZ43kV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=830 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210043
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide register zeroing macros, following the same convention as
existing register stack save/restore macros, to be used in later
change to concisely zero a sequence of consecutive gprs.

The resulting macros are called ZEROIZE_GPRS and ZEROIZE_NVGPRS, keeping
with the naming of the accompanying restore and save macros, and usage
of zeroize to describe this operation elsewhere in the kernel.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
V2: Change 'ZERO' usage in naming to 'NULLIFY', a more obvious verb
V3: Change 'NULLIFY' usage in naming to 'ZEROIZE', which has
ent in kernel and explicitly specifies that we are zeroing.
V4: Update commit message to use zeroize.
V5: The reason for the patch is to add zeroize macros. Move that
to first paragraph in patch description.
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

