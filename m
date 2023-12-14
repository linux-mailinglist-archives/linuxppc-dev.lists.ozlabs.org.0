Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA130812778
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 07:00:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HviIdLMX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrMCK4Mdkz3c96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 17:00:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HviIdLMX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrM6w1R3Fz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 16:56:39 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE2Uej9022139;
	Thu, 14 Dec 2023 05:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/mQKPh+Q/+oVqTYrm5JhFDCdjY5bZbTlHx3Tfk9a0cM=;
 b=HviIdLMX+gGsWGnJUfcgJ1zEBu48XMwnVfecoXiEmf6Tv6qT4swY5ic30eZT4ZCJaK7F
 2tVgJWOTwb1EQta+JtuvXkYe+n0LoOzO0x4ze5EeVexeEV/A7fH+4kL6KDkGSsOgKjCj
 n3tZsn8S9GAuTnCSmmgcNu1Cjo17RPYnwC/nKQ8EkuxfFKe8TLi/BQ2ZF1BYfO2gJBt2
 kK3hoq2EcfsjQfS67rq0cjnQe2/6PR3IwJUEIKI3IFGLHTIqHrioiAHQmyNZO+BxFiWr
 NcMVBwL3zgCKwv09Az1XFXvrpqEHElxwIXHgRZHZXQQqOjeTyQYS5IB1vpQm9hJaNkfS LA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uyjg3cj8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:27 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BE5r8A1026718;
	Thu, 14 Dec 2023 05:56:27 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uyjg3cj7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:27 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE5cXLZ013892;
	Thu, 14 Dec 2023 05:56:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw592dwf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:25 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BE5uOb944237272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Dec 2023 05:56:24 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C18920040;
	Thu, 14 Dec 2023 05:56:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B55CF20043;
	Thu, 14 Dec 2023 05:56:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Dec 2023 05:56:23 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 92302606DB;
	Thu, 14 Dec 2023 16:56:19 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: glider@google.com, elver@google.com, dvyukov@google.com,
        akpm@linux-foundation.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 09/13] powerpc: Disable KMSAN checks on functions which walk the stack
Date: Thu, 14 Dec 2023 05:55:35 +0000
Message-Id: <20231214055539.9420-10-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231214055539.9420-1-nicholas@linux.ibm.com>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bbcuSHGLeoKEVuj7srCG-ZCZayTjEdOS
X-Proofpoint-GUID: KH91wVFkQGDFAZOFPfyiwzBaXkKHaRsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_02,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312140035
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
Cc: iii@linux.ibm.com, linux-kernel@vger.kernel.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>, linux-mm@kvack.org, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Functions which walk the stack read parts of the stack which cannot be
instrumented by KMSAN e.g. the backchain. Disable KMSAN sanitization of
these functions to prevent false positives.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 arch/powerpc/kernel/process.c    |  6 +++---
 arch/powerpc/kernel/stacktrace.c | 10 ++++++----
 arch/powerpc/perf/callchain.c    |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 392404688cec..3dc88143c3b2 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2276,9 +2276,9 @@ static bool empty_user_regs(struct pt_regs *regs, struct task_struct *tsk)
 
 static int kstack_depth_to_print = CONFIG_PRINT_STACK_DEPTH;
 
-void __no_sanitize_address show_stack(struct task_struct *tsk,
-				      unsigned long *stack,
-				      const char *loglvl)
+void __no_sanitize_address __no_kmsan_checks show_stack(struct task_struct *tsk,
+							unsigned long *stack,
+							const char *loglvl)
 {
 	unsigned long sp, ip, lr, newsp;
 	int count = 0;
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index e6a958a5da27..369b8b2a1bcd 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -24,8 +24,9 @@
 
 #include <asm/paca.h>
 
-void __no_sanitize_address arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
-					   struct task_struct *task, struct pt_regs *regs)
+void __no_sanitize_address __no_kmsan_checks
+	arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
+			struct task_struct *task, struct pt_regs *regs)
 {
 	unsigned long sp;
 
@@ -62,8 +63,9 @@ void __no_sanitize_address arch_stack_walk(stack_trace_consume_fn consume_entry,
  *
  * If the task is not 'current', the caller *must* ensure the task is inactive.
  */
-int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
-						   void *cookie, struct task_struct *task)
+int __no_sanitize_address __no_kmsan_checks
+	arch_stack_walk_reliable(stack_trace_consume_fn consume_entry, void *cookie,
+				 struct task_struct *task)
 {
 	unsigned long sp;
 	unsigned long newsp;
diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 6b4434dd0ff3..c7610b38e9b8 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -40,7 +40,7 @@ static int valid_next_sp(unsigned long sp, unsigned long prev_sp)
 	return 0;
 }
 
-void __no_sanitize_address
+void __no_sanitize_address __no_kmsan_checks
 perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
 	unsigned long sp, next_sp;
-- 
2.40.1

