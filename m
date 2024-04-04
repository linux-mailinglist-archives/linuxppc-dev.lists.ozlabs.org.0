Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C7E897E41
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 06:46:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VnAimRNR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V98Gh2kLCz3vYr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 15:46:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VnAimRNR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V98G04bDwz3bp7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 15:46:16 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4343QgnK019005;
	Thu, 4 Apr 2024 04:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CLEeyfWipTFPMwu+Y0lgsvfkvSL9M1+3hmwBbV4OniI=;
 b=VnAimRNR/btHmd6brWGAe3KGD/lRUeWK+y9BOyyUbEp/gxaJQn8XQtDxWAKJN8d+2tjp
 eDBQdAna6BkYYBWqYiP3kq8RSFTZKYJdWloZy4bhDSHtY1EzgKtevVG1pRfo44QcBnui
 2OeGLLX8Ukfu61gY4M0/+6vRDz8/YbF+OTgu3ggG9PFfXq9/EiIuxDR/HUOWFC2qzAiY
 kp6kr0j1HmvjGa7Q+9grGElzm0LDc50LfMGp96OQc1zeDnftLhChUE/bOBf93g3LIVr5
 BaIXHA1DSczKOsB6DuNcpYg2Vl5p7/hMP9znDPSQp581ePuwnkrQaHgBkGwe1oxpaJOI bg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x9kxq08kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Apr 2024 04:46:09 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43446oD5003627;
	Thu, 4 Apr 2024 04:46:05 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x9epya0h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Apr 2024 04:46:05 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4344k27a29819480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Apr 2024 04:46:04 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A47C2004B;
	Thu,  4 Apr 2024 04:46:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9627F2004D;
	Thu,  4 Apr 2024 04:46:01 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Apr 2024 04:46:01 +0000 (GMT)
Received: from socotra.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 371306005D;
	Thu,  4 Apr 2024 15:46:00 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc: Apply __always_inline to interrupt_{enter,exit}_prepare()
Date: Thu,  4 Apr 2024 15:45:34 +1100
Message-ID: <20240404044535.642122-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t8Z3dgqMbgCA9KnX0VRJimI4lv6fTT9T
X-Proofpoint-ORIG-GUID: t8Z3dgqMbgCA9KnX0VRJimI4lv6fTT9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_26,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 mlxlogscore=284 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404040030
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

In keeping with the advice given by Documentation/core-api/entry.rst,
entry and exit handlers for interrupts should not be instrumented.
Guarantee that the interrupt_{enter,exit}_prepare() routines are inlined
so that they will inheret instrumentation from their caller.

KCSAN kernels were observed to compile without inlining these routines,
which would lead to grief on NMI handlers.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/include/asm/interrupt.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 7b610864b364..f4343e0bfb13 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -150,7 +150,7 @@ static inline void booke_restore_dbcr0(void)
 #endif
 }
 
-static inline void interrupt_enter_prepare(struct pt_regs *regs)
+static __always_inline void interrupt_enter_prepare(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC64
 	irq_soft_mask_set(IRQS_ALL_DISABLED);
@@ -215,11 +215,11 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
  * However interrupt_nmi_exit_prepare does return directly to regs, because
  * NMIs do not do "exit work" or replay soft-masked interrupts.
  */
-static inline void interrupt_exit_prepare(struct pt_regs *regs)
+static __always_inline void interrupt_exit_prepare(struct pt_regs *regs)
 {
 }
 
-static inline void interrupt_async_enter_prepare(struct pt_regs *regs)
+static __always_inline void interrupt_async_enter_prepare(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC64
 	/* Ensure interrupt_enter_prepare does not enable MSR[EE] */
@@ -238,7 +238,7 @@ static inline void interrupt_async_enter_prepare(struct pt_regs *regs)
 	irq_enter();
 }
 
-static inline void interrupt_async_exit_prepare(struct pt_regs *regs)
+static __always_inline void interrupt_async_exit_prepare(struct pt_regs *regs)
 {
 	/*
 	 * Adjust at exit so the main handler sees the true NIA. This must
@@ -278,7 +278,7 @@ static inline bool nmi_disables_ftrace(struct pt_regs *regs)
 	return true;
 }
 
-static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
+static __always_inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
 #ifdef CONFIG_PPC64
 	state->irq_soft_mask = local_paca->irq_soft_mask;
@@ -340,7 +340,7 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	nmi_enter();
 }
 
-static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
+static __always_inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
 	if (mfmsr() & MSR_DR) {
 		// nmi_exit if relocations are on
-- 
2.44.0

