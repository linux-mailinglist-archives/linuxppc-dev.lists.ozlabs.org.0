Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F238C009
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 08:51:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmcgs2c3Tz3byn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 16:50:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vlm/sk2q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vlm/sk2q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmcfd58Jpz2xvZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 16:49:45 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L6XNcD096307; Fri, 21 May 2021 02:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ROu7NLoIixUlOj4nhOClEY/lAyyr2xqljdpJaV8XXd4=;
 b=Vlm/sk2qUFtU4poarOJ1mIsrwTh5gCoVG0s3De3m54IbgohW4MAgiWqcmgnb+ifsiyza
 WJ6EIHiGZxdR9u5zyhBobl5HtTYf8OwiSw+lMy0MEspQ47mrmS9khSg/s0Mdiy6snSkk
 ndAjylyigEKOJy2X+r9vw/hp5jx9o1vnQ0hw9nbOCHht+U7JmOGUIPgOXQGpD1xI+y8R
 jPPhksQckPZje+M8++P9ZuitxbZjwhnisF/7b55wz52c3JxCShk1b1C06r9aJnCtfsWb
 RWo8Dz5Q3H2n21mm7oY9zi8NpXSOps8eOvzhemW2pc5LaB7xHnb9Xamf2UCJSWRXPLdA xg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p6q71tuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 02:49:15 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L6nDVk012296;
 Fri, 21 May 2021 06:49:13 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 38m1gv11hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 06:49:13 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L6nAQ926673536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 06:49:10 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C90E44204B;
 Fri, 21 May 2021 06:49:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A61784204C;
 Fri, 21 May 2021 06:49:07 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.72.15])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 06:49:07 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Suchanek <msuchanek@suse.de>, Torsten Duwe <duwe@suse.de>
Subject: [RFC PATCH 1/6] trace/stack: Move code to save the stack trace into a
 separate function
Date: Fri, 21 May 2021 12:18:36 +0530
Message-Id: <6a8b68f8bd64f8c16d97ef943534c639781e7f77.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621577151.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V6yRkNsr4PJMHo1N8i4lXEt85OnZE42-
X-Proofpoint-GUID: V6yRkNsr4PJMHo1N8i4lXEt85OnZE42-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105210043
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation to add support for stack tracer to powerpc, move code to
save stack trace and to calculate the frame sizes into a separate weak
function. Also provide access to some of the data structures used by the
stack trace code so that architectures can update those.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 include/linux/ftrace.h     |  8 ++++
 kernel/trace/trace_stack.c | 98 ++++++++++++++++++++------------------
 2 files changed, 60 insertions(+), 46 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index a69f363b61bf73..8263427379f05c 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -368,10 +368,18 @@ static inline void arch_ftrace_set_direct_caller(struct pt_regs *regs,
 
 #ifdef CONFIG_STACK_TRACER
 
+#define STACK_TRACE_ENTRIES 500
+
+extern unsigned long stack_dump_trace[STACK_TRACE_ENTRIES];
+extern unsigned stack_trace_index[STACK_TRACE_ENTRIES];
+extern unsigned int stack_trace_nr_entries;
+extern unsigned long stack_trace_max_size;
 extern int stack_tracer_enabled;
 
 int stack_trace_sysctl(struct ctl_table *table, int write, void *buffer,
 		       size_t *lenp, loff_t *ppos);
+void stack_get_trace(unsigned long traced_ip, unsigned long *stack_ref,
+					unsigned long stack_size, int *tracer_frame);
 
 /* DO NOT MODIFY THIS VARIABLE DIRECTLY! */
 DECLARE_PER_CPU(int, disable_stack_tracer);
diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
index 63c28504205162..5b63dbd37c8c25 100644
--- a/kernel/trace/trace_stack.c
+++ b/kernel/trace/trace_stack.c
@@ -19,13 +19,11 @@
 
 #include "trace.h"
 
-#define STACK_TRACE_ENTRIES 500
+unsigned long stack_dump_trace[STACK_TRACE_ENTRIES];
+unsigned stack_trace_index[STACK_TRACE_ENTRIES];
 
-static unsigned long stack_dump_trace[STACK_TRACE_ENTRIES];
-static unsigned stack_trace_index[STACK_TRACE_ENTRIES];
-
-static unsigned int stack_trace_nr_entries;
-static unsigned long stack_trace_max_size;
+unsigned int stack_trace_nr_entries;
+unsigned long stack_trace_max_size;
 static arch_spinlock_t stack_trace_max_lock =
 	(arch_spinlock_t)__ARCH_SPIN_LOCK_UNLOCKED;
 
@@ -152,49 +150,19 @@ static void print_max_stack(void)
  * Although the entry function is not displayed, the first function (sys_foo)
  * will still include the stack size of it.
  */
-static void check_stack(unsigned long ip, unsigned long *stack)
+void __weak stack_get_trace(unsigned long traced_ip, unsigned long *stack_ref,
+					unsigned long stack_size, int *tracer_frame)
 {
-	unsigned long this_size, flags; unsigned long *p, *top, *start;
-	static int tracer_frame;
-	int frame_size = READ_ONCE(tracer_frame);
+	unsigned long *p, *top, *start;
 	int i, x;
 
-	this_size = ((unsigned long)stack) & (THREAD_SIZE-1);
-	this_size = THREAD_SIZE - this_size;
-	/* Remove the frame of the tracer */
-	this_size -= frame_size;
-
-	if (this_size <= stack_trace_max_size)
-		return;
-
-	/* we do not handle interrupt stacks yet */
-	if (!object_is_on_stack(stack))
-		return;
-
-	/* Can't do this from NMI context (can cause deadlocks) */
-	if (in_nmi())
-		return;
-
-	local_irq_save(flags);
-	arch_spin_lock(&stack_trace_max_lock);
-
-	/* In case another CPU set the tracer_frame on us */
-	if (unlikely(!frame_size))
-		this_size -= tracer_frame;
-
-	/* a race could have already updated it */
-	if (this_size <= stack_trace_max_size)
-		goto out;
-
-	stack_trace_max_size = this_size;
-
 	stack_trace_nr_entries = stack_trace_save(stack_dump_trace,
 					       ARRAY_SIZE(stack_dump_trace) - 1,
 					       0);
 
 	/* Skip over the overhead of the stack tracer itself */
 	for (i = 0; i < stack_trace_nr_entries; i++) {
-		if (stack_dump_trace[i] == ip)
+		if (stack_dump_trace[i] == traced_ip)
 			break;
 	}
 
@@ -209,7 +177,7 @@ static void check_stack(unsigned long ip, unsigned long *stack)
 	 * Now find where in the stack these are.
 	 */
 	x = 0;
-	start = stack;
+	start = stack_ref;
 	top = (unsigned long *)
 		(((unsigned long)start & ~(THREAD_SIZE-1)) + THREAD_SIZE);
 
@@ -223,7 +191,7 @@ static void check_stack(unsigned long ip, unsigned long *stack)
 	while (i < stack_trace_nr_entries) {
 		int found = 0;
 
-		stack_trace_index[x] = this_size;
+		stack_trace_index[x] = stack_size;
 		p = start;
 
 		for (; p < top && i < stack_trace_nr_entries; p++) {
@@ -233,7 +201,7 @@ static void check_stack(unsigned long ip, unsigned long *stack)
 			 */
 			if ((READ_ONCE_NOCHECK(*p)) == stack_dump_trace[i]) {
 				stack_dump_trace[x] = stack_dump_trace[i++];
-				this_size = stack_trace_index[x++] =
+				stack_size = stack_trace_index[x++] =
 					(top - p) * sizeof(unsigned long);
 				found = 1;
 				/* Start the search from here */
@@ -245,10 +213,10 @@ static void check_stack(unsigned long ip, unsigned long *stack)
 				 * out what that is, then figure it out
 				 * now.
 				 */
-				if (unlikely(!tracer_frame)) {
-					tracer_frame = (p - stack) *
+				if (unlikely(!*tracer_frame)) {
+					*tracer_frame = (p - stack_ref) *
 						sizeof(unsigned long);
-					stack_trace_max_size -= tracer_frame;
+					stack_trace_max_size -= *tracer_frame;
 				}
 			}
 		}
@@ -272,6 +240,44 @@ static void check_stack(unsigned long ip, unsigned long *stack)
 #endif
 
 	stack_trace_nr_entries = x;
+}
+
+static void check_stack(unsigned long ip, unsigned long *stack)
+{
+	unsigned long this_size, flags;
+	static int tracer_frame;
+	int frame_size = READ_ONCE(tracer_frame);
+
+	this_size = ((unsigned long)stack) & (THREAD_SIZE-1);
+	this_size = THREAD_SIZE - this_size;
+	/* Remove the frame of the tracer */
+	this_size -= frame_size;
+
+	if (this_size <= stack_trace_max_size)
+		return;
+
+	/* we do not handle interrupt stacks yet */
+	if (!object_is_on_stack(stack))
+		return;
+
+	/* Can't do this from NMI context (can cause deadlocks) */
+	if (in_nmi())
+		return;
+
+	local_irq_save(flags);
+	arch_spin_lock(&stack_trace_max_lock);
+
+	/* In case another CPU set the tracer_frame on us */
+	if (unlikely(!frame_size))
+		this_size -= tracer_frame;
+
+	/* a race could have already updated it */
+	if (this_size <= stack_trace_max_size)
+		goto out;
+
+	stack_trace_max_size = this_size;
+
+	stack_get_trace(ip, stack, this_size, &tracer_frame);
 
 	if (task_stack_end_corrupted(current)) {
 		print_max_stack();
-- 
2.30.2

