Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D21B5BA65A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:34:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTN6C43Lyz3bm9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:33:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ErQC/Wy5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ErQC/Wy5;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN5j0smVz3bYM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:33:28 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5UvmD035998;
	Fri, 16 Sep 2022 05:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6Zt8uxWhrhok5zsHLEuPUkiprFd1CnuFw4DOjFymqi4=;
 b=ErQC/Wy5/vNeWgffkJVtfaxo2tE0zfxaZYC7gG3E3cfN4j/z6BDMc/43XpX9Q6toEB6n
 M8Ad/g7R+E+qR/1KgBg96wFbNN6sRkgrLsCf6HA+fp6/WVC9Ra93g1B3Y1VlOpsGGGQI
 uIH86DrEKl5j+p73vcAXu1cXoag6lnjRzrQQa0k71shtuemvvKaZA8FHQ32KK6slShLs
 VWcLTRrqqSq/dKRZhgaoDkqAw6PoAja/ksNV2lLOzTJEOre6pYRA8GFOZ6XsLmd9FxuJ
 an08vEcMwmhNp3XXJ1Q/wozg9FK+7MjKOzx6sfsWRwfXT0wcKI4uGYILpaXgIJGa+AGm wQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk2kr1mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:24 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5JvdH025392;
	Fri, 16 Sep 2022 05:33:21 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03fra.de.ibm.com with ESMTP id 3jm91p0cqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:21 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5TUul32702830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:29:30 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 636ACA405B;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F84DA4054;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BC79B605A5;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 23/23] powerpc/64e: Clear gprs on interrupt routine entry on Book3E
Date: Fri, 16 Sep 2022 15:33:00 +1000
Message-Id: <20220916053300.786330-24-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d-kKr7gDecAbK6Apt1qhOXQeAQNAJ_0S
X-Proofpoint-ORIG-GUID: d-kKr7gDecAbK6Apt1qhOXQeAQNAJ_0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=493 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160041
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

Zero GPRS r14-r31 on entry into the kernel for interrupt sources to
limit influence of user-space values in potential speculation gadgets.
Prior to this commit, all other GPRS are reassigned during the common
prologue to interrupt handlers and so need not be zeroised explicitly.

This may be done safely, without loss of register state prior to the
interrupt, as the common prologue saves the initial values of
non-volatiles, which are unconditionally restored in interrupt_64.S.
Mitigation defaults to enabled by INTERRUPT_SANITIZE_REGISTERS.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V3 -> V4: New patch.
V4 -> V5: Depend on Kconfig option. Remove ZEROIZE_NVGPRS on bad kernel
stack handler.
---
 arch/powerpc/kernel/exceptions-64e.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 48c640ca425d..61748769ea29 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -365,6 +365,11 @@ ret_from_mc_except:
 	std	r14,PACA_EXMC+EX_R14(r13);				    \
 	std	r15,PACA_EXMC+EX_R15(r13)
 
+#ifdef CONFIG_INTERRUPT_SANITIZE_REGISTERS
+#define SANITIZE_NVGPRS	ZEROIZE_NVGPRS()
+#else
+#define SANITIZE_NVGPRS
+#endif
 
 /* Core exception code for all exceptions except TLB misses. */
 #define EXCEPTION_COMMON_LVL(n, scratch, excf)				    \
@@ -401,7 +406,8 @@ exc_##n##_common:							    \
 	std	r12,STACK_FRAME_OVERHEAD-16(r1); /* mark the frame */	    \
 	std	r3,_TRAP(r1);		/* set trap number		*/  \
 	std	r0,RESULT(r1);		/* clear regs->result */	    \
-	SAVE_NVGPRS(r1);
+	SAVE_NVGPRS(r1);						    \
+	SANITIZE_NVGPRS;		/* minimise speculation influence */
 
 #define EXCEPTION_COMMON(n) \
 	EXCEPTION_COMMON_LVL(n, SPRN_SPRG_GEN_SCRATCH, PACA_EXGEN)
-- 
2.34.1

