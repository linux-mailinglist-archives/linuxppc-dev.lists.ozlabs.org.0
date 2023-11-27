Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5901C7F98E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 06:49:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EZ4p4q9O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sdvmy21Xdz3cjr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 16:49:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EZ4p4q9O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sdvl65nLnz3cPS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 16:48:18 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR4EJ2o026488;
	Mon, 27 Nov 2023 05:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3VE38AC5lEeJn5iGZ7XVpsGdiGnZ/I2b116TDYXiRzc=;
 b=EZ4p4q9OlkrlP1aXdPMcHuTtghxoyzDi0QgwkMh95XcTwqOmUXXusLWC3PELu9UJV+8U
 C9OdDVQPxmiwg/hUqYc+vAtigaEGmN3VAQFkdyDtgoW8skGEhZVC5WGH7Vdb49N42mnb
 WOtBhomCj9Xl9eAzl2ecXAsn9Dl8u1UuNptjTn/WKNnHqer/Ze7jw5Bk3MLExhmZfXX1
 5w2fR0YPV1l3RkRdJkzRdKGoqewJKmNP+2on3/5x3auPy5PqGDKrYSugkCmq3a/BRZL3
 c74dA8PEq8Rw6C7PaDtRy995Ktm/GhZtOlSBH2tbVjpghlm9+EfRCdR6jhOyNVbBQQ3k Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3umgaq5hnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 05:48:03 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AR5m36i015367;
	Mon, 27 Nov 2023 05:48:03 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3umgaq5hn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 05:48:03 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR44Fic013738;
	Mon, 27 Nov 2023 05:48:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukvrk6fqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 05:48:01 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AR5lxst19267876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Nov 2023 05:47:59 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2ACF200FA;
	Mon, 27 Nov 2023 05:47:59 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56B55200F8;
	Mon, 27 Nov 2023 05:47:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Nov 2023 05:47:59 +0000 (GMT)
Received: from socotra.ibm.com (unknown [9.177.95.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 32B376015D;
	Mon, 27 Nov 2023 16:47:53 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc: Apply __always_inline to interrupt_{enter,exit}_prepare()
Date: Mon, 27 Nov 2023 16:46:46 +1100
Message-ID: <20231127054648.1205221-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127054648.1205221-2-rmclure@linux.ibm.com>
References: <20231127054648.1205221-2-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _suFl8FwfnV6oG2IIciQIXbdD8BXY50c
X-Proofpoint-ORIG-GUID: LUEPU4xvJP3sZYnMRIAicHmF1HPAg_ht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_03,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 malwarescore=0 bulkscore=0
 mlxlogscore=195 phishscore=0 lowpriorityscore=0 spamscore=1 adultscore=0
 mlxscore=1 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311270039
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
Cc: elver@google.com, arnd@arndb.de, gautam@linux.ibm.com, Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com, will@kernel.org
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
index a4196ab1d016..5f9be87c01ca 100644
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
2.43.0

