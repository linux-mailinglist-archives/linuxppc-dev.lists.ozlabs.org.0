Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8560B63B92D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 05:45:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLqWm2MPJz3cMT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 15:45:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y6Rb4BVg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y6Rb4BVg;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLqVp2cdDz3cFn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 15:44:17 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AT3C06Q028460;
	Tue, 29 Nov 2022 04:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Qrp10DmLuzRw8XxcBG/+4DH3VC02uPaE0WZNWVzwwJs=;
 b=Y6Rb4BVgAOQCALIJaeas3CSzX1Vmx1uSK7SqrSVmeiBpduOklqu/8dZb1diV/IYBTLAf
 gMAiq2LFE293j7SOh8hSK+AnXC5wdIerGkOFvKJB9ZqL2qkdJhhU7weCD2T+27m2TS73
 oDnH2UHIpV9Tqk0W3U2LmVjJ4uBR4rjdr7fDMlH6hzilzV0oRmFemFTELKNXObo/PhZt
 VouEk5bmjnkmNhc41I3WPSSkAZl7mH15CuEU70tLHshkAUDBi+nHmF7K9XI5EF9e+TVc
 fdQrLfWDUtXMQVdNeD4x0KZsSR3YvSB+E2otVsoEVuHJQPMj5xDksiF1JfsuEdma+mCJ 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m59yb9p49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:13 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AT4iDh1027046;
	Tue, 29 Nov 2022 04:44:13 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m59yb9p3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:13 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT4b1rA025017;
	Tue, 29 Nov 2022 04:44:10 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3m3ae9bf9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 04:44:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AT4i8mu37552548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 04:44:08 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E9D542041;
	Tue, 29 Nov 2022 04:44:08 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB8A24203F;
	Tue, 29 Nov 2022 04:44:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 04:44:07 +0000 (GMT)
Received: from civic.. (unknown [9.177.66.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8E94260312;
	Tue, 29 Nov 2022 15:44:04 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/7] powerpc/64: Add interrupt register sanitisation macros
Date: Tue, 29 Nov 2022 15:43:49 +1100
Message-Id: <20221129044354.1836018-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221129044354.1836018-1-rmclure@linux.ibm.com>
References: <20221129044354.1836018-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zq1Ml_Bt2PtV1wBeTiXCRgcrJYHeuj61
X-Proofpoint-ORIG-GUID: 9J7fDKGbGwB4b4HSIbRcmL4RhN1T4kj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_03,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=527 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290029
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

Include in asm/ppc_asm.h macros to be used in multiple successive
patches to implement zeroising architected registers in interrupt
handlers. Registers will be sanitised in this fashion in future patches
to reduce the speculation influence of user-controlled register values.
These mitigations will be configurable through the
CONFIG_INTERRUPT_SANITIZE_REGISTERS Kconfig option.

Included are macros for conditionally zeroising registers and restoring
as required with the mitigation enabled. With the mitigation disabled,
non-volatiles must be restored on demand at separate locations to
those required by the mitigation.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v4: New patch
---
 arch/powerpc/include/asm/ppc_asm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 753a2757bcd4..272b2795c36a 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -74,6 +74,23 @@
 #define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
 #define REST_GPR(n, base)		REST_GPRS(n, n, base)
 
+/* macros for handling user register sanitisation */
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+#define SANITIZE_ZEROIZE_SYSCALL_GPRS()		ZEROIZE_GPR(0);		\
+						ZEROIZE_GPRS(5, 12);	\
+						ZEROIZE_NVGPRS()
+#define SANITIZE_ZEROIZE_INTERRUPT_NVGPRS()	ZEROIZE_NVGPRS()
+#define SANITIZE_ZEROIZE_NVGPRS()		ZEROIZE_NVGPRS()
+#define SANITIZE_RESTORE_NVGPRS()		REST_NVGPRS(r1)
+#define HANDLER_RESTORE_NVGPRS()
+#else
+#define SANITIZE_ZEROIZE_INTERRUPT_NVGPRS()
+#define SANITIZE_ZEROIZE_SYSCALL_GPRS()
+#define SANITIZE_ZEROIZE_NVGPRS()
+#define SANITIZE_RESTORE_NVGPRS()
+#define HANDLER_RESTORE_NVGPRS()		REST_NVGPRS(r1)
+#endif /* CONFIG_INTERRUPT_SANITIZE_REGISTERS */
+
 #define SAVE_FPR(n, base)	stfd	n,8*TS_FPRWIDTH*(n)(base)
 #define SAVE_2FPRS(n, base)	SAVE_FPR(n, base); SAVE_FPR(n+1, base)
 #define SAVE_4FPRS(n, base)	SAVE_2FPRS(n, base); SAVE_2FPRS(n+2, base)
-- 
2.37.2

