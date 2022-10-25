Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F306F60C249
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 05:39:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxHkL6Bh6z3cC5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 14:39:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MQEi4JzR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MQEi4JzR;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxHjN1wCVz307C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 14:38:47 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P3PUbt002422;
	Tue, 25 Oct 2022 03:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=VYvGBx2UETZ4/qT3ZJAZ3qqHQgrIkIgoAZkeR3+HRb8=;
 b=MQEi4JzRDpuiN5Qz3MbuNbm0J/Uhc5jbef2lnTIwyAeBs4HdDz4k1pKH3i5SBbZUSGTk
 lkfp4b/yOmxLSvOEjlPROfpUtdli1fbEAGggntmMWGQnU+q5+9VeWq8sxLlfZPxIWLDY
 TlAJzoIZtYqWKVZ3Jd3D6Jc575XmWkOYIsnUPUWLz4D3cXhYaIOXEa3+HIGkfEM2y15P
 QEljuJCORwc4aYVPd9sasv1xDs/VwpfXGPb0BRLrUJs7TlL9LZGR97997UNnH9Nlyc5S
 5+PTb389p08xhU8xe0ArpaGdcyijO8LFCC6p+UA9X4h7GeMVbcUz9nbLIOJFdttlaLSn xg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke7vsrb1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 03:38:43 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29P3KqSq011745;
	Tue, 25 Oct 2022 03:38:40 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3kc7sj49rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 03:38:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29P3XQxA43647410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 03:33:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 853364203F;
	Tue, 25 Oct 2022 03:38:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39EC142049;
	Tue, 25 Oct 2022 03:38:38 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 25 Oct 2022 03:38:38 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F0BAE60213;
	Tue, 25 Oct 2022 14:38:29 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Interrupt handler stack randomisation
Date: Tue, 25 Oct 2022 14:38:07 +1100
Message-Id: <20221025033807.1413688-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hNduYhIdXIq3T12N12Yri52d1BYn06H3
X-Proofpoint-GUID: hNduYhIdXIq3T12N12Yri52d1BYn06H3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_09,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250018
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

Stack frames used by syscall handlers support random offsets as of
commit f4a0318f278d (powerpc: add support for syscall stack randomization).
Implement the same for general interrupt handlers, by applying the
random stack offset and then updating this offset from within the
DEFINE_INTERRUPT_HANDLER macros.

Applying this offset perturbs the layout of interrupt handler stack
frames, rendering to the kernel stack more difficult to control by means
of user invoked interrupts.

Link: https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-May/243238.html

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/include/asm/interrupt.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 4745bb9998bd..b7f7beff4e13 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -68,6 +68,7 @@
 
 #include <linux/context_tracking.h>
 #include <linux/hardirq.h>
+#include <linux/randomize_kstack.h>
 #include <asm/cputime.h>
 #include <asm/firmware.h>
 #include <asm/ftrace.h>
@@ -448,9 +449,12 @@ interrupt_handler long func(struct pt_regs *regs)			\
 	long ret;							\
 									\
 	__hard_RI_enable();						\
+	add_random_kstack_offset();					\
 									\
 	ret = ____##func (regs);					\
 									\
+	choose_random_kstack_offset(mftb());				\
+									\
 	return ret;							\
 }									\
 NOKPROBE_SYMBOL(func);							\
@@ -480,9 +484,11 @@ static __always_inline void ____##func(struct pt_regs *regs);		\
 interrupt_handler void func(struct pt_regs *regs)			\
 {									\
 	interrupt_enter_prepare(regs);					\
+	add_random_kstack_offset();					\
 									\
 	____##func (regs);						\
 									\
+	choose_random_kstack_offset(mftb());				\
 	interrupt_exit_prepare(regs);					\
 }									\
 NOKPROBE_SYMBOL(func);							\
@@ -515,9 +521,11 @@ interrupt_handler long func(struct pt_regs *regs)			\
 	long ret;							\
 									\
 	interrupt_enter_prepare(regs);					\
+	add_random_kstack_offset();					\
 									\
 	ret = ____##func (regs);					\
 									\
+	choose_random_kstack_offset(mftb());				\
 	interrupt_exit_prepare(regs);					\
 									\
 	return ret;							\
@@ -548,9 +556,11 @@ static __always_inline void ____##func(struct pt_regs *regs);		\
 interrupt_handler void func(struct pt_regs *regs)			\
 {									\
 	interrupt_async_enter_prepare(regs);				\
+	add_random_kstack_offset();					\
 									\
 	____##func (regs);						\
 									\
+	choose_random_kstack_offset(mftb());				\
 	interrupt_async_exit_prepare(regs);				\
 }									\
 NOKPROBE_SYMBOL(func);							\
@@ -585,9 +595,11 @@ interrupt_handler long func(struct pt_regs *regs)			\
 	long ret;							\
 									\
 	interrupt_nmi_enter_prepare(regs, &state);			\
+	add_random_kstack_offset();					\
 									\
 	ret = ____##func (regs);					\
 									\
+	choose_random_kstack_offset(mftb());				\
 	interrupt_nmi_exit_prepare(regs, &state);			\
 									\
 	return ret;							\
-- 
2.34.1

