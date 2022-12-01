Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F28F563EA2A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 08:12:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NN6j16Dcgz3bX4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:12:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BhI/Hgng;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BhI/Hgng;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NN6g14V41z3bVs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 18:10:53 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B179ovw026739;
	Thu, 1 Dec 2022 07:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=akmdDFTbxkJVPPJc3wrlt7rT/pEGiaJ2edbEsNqDUWA=;
 b=BhI/Hgng2OyzGwDVIZU5rlH1hBEPWm4JBXjbqDCZ70KnPBJ0qqs57dZCwddDZ4S9HnC/
 8qA7WrukYyCAVH4l7DOgU1U4GU4Ma5VlfuI3B6zGlgrKf+uB2Ft7YZgCVzQ/8mo3eE0h
 RU5qjHO1mSyvgewzKuDpgP84mipxNbDBZQ/B2PRN90m80jwaFHm4POce7Gd6BldTxnwM
 mWWtibIaTHO1EQhWTDhEI1Uh19bzAT6C+mUwz4vsKLl86nX+4vr6xBXfneD+bD0rUnPn
 s8bpD6O1htJVIY98VpphTXh+Auo8jlDdRVFLG8q0rXXgTfgkiLv6NQ/ebRNSbRoBoEe/ dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6qd607ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:46 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B17AkcP032760;
	Thu, 1 Dec 2022 07:10:46 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6qd607hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B175gSU023879;
	Thu, 1 Dec 2022 07:10:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3m3ae9ewyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:10:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B17AfXl23265628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Dec 2022 07:10:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48B565204F;
	Thu,  1 Dec 2022 07:10:41 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E7C035204E;
	Thu,  1 Dec 2022 07:10:40 +0000 (GMT)
Received: from civic.. (unknown [9.177.92.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 77B3960366;
	Thu,  1 Dec 2022 18:10:34 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 2/7] powerpc/64: Add interrupt register sanitisation macros
Date: Thu,  1 Dec 2022 18:10:14 +1100
Message-Id: <20221201071019.1953023-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221201071019.1953023-1-rmclure@linux.ibm.com>
References: <20221201071019.1953023-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LP59PfeE_7ZmP9FQCz9mOP-P4KpETEnr
X-Proofpoint-ORIG-GUID: y5I45LdfcVCwW3QQSQZ_EKeGDtdp-qCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 mlxlogscore=694
 mlxscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212010048
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

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v4: New patch
v5: Remove unnecessary _ZEROIZE_ parts of macro titles, as the
implementation of how registers are sanitised doesn't need to be
immediately accessible, only that values will be clobbered. Introduce
arbitrary sanitize gpr(s) macros.
---
 arch/powerpc/include/asm/ppc_asm.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 753a2757bcd4..d2f44612f4b0 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -74,6 +74,25 @@
 #define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
 #define REST_GPR(n, base)		REST_GPRS(n, n, base)
 
+/* macros for handling user register sanitisation */
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+#define SANITIZE_SYSCALL_GPRS()			ZEROIZE_GPR(0);		\
+						ZEROIZE_GPRS(5, 12);	\
+						ZEROIZE_NVGPRS()
+#define SANITIZE_GPR(n)				ZEROIZE_GPR(n)
+#define SANITIZE_GPRS(start, end)		ZEROIZE_GPRS(start, end)
+#define SANITIZE_NVGPRS()			ZEROIZE_NVGPRS()
+#define SANITIZE_RESTORE_NVGPRS()		REST_NVGPRS(r1)
+#define HANDLER_RESTORE_NVGPRS()
+#else
+#define SANITIZE_SYSCALL_GPRS()
+#define SANITIZE_GPR(n)
+#define SANITIZE_GPRS(start, end)
+#define SANITIZE_NVGPRS()
+#define SANITIZE_RESTORE_NVGPRS()
+#define HANDLER_RESTORE_NVGPRS()		REST_NVGPRS(r1)
+#endif /* CONFIG_INTERRUPT_SANITIZE_REGISTERS */
+
 #define SAVE_FPR(n, base)	stfd	n,8*TS_FPRWIDTH*(n)(base)
 #define SAVE_2FPRS(n, base)	SAVE_FPR(n, base); SAVE_FPR(n+1, base)
 #define SAVE_4FPRS(n, base)	SAVE_2FPRS(n, base); SAVE_2FPRS(n+2, base)
-- 
2.37.2

