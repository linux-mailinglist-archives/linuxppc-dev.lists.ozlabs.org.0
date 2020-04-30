Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C9E1BEF7A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 06:57:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CNQk2TM6zDrH6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 14:57:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CMxk2BvHzDrBZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 14:35:22 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U4WJFt122525; Thu, 30 Apr 2020 00:35:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhr8vg1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 00:35:12 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03U4ZBWC129737;
 Thu, 30 Apr 2020 00:35:11 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mhr8vg0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 00:35:11 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03U4P9DG011143;
 Thu, 30 Apr 2020 04:35:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 30mcu7x9ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 04:35:08 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03U4Z5ak22741040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 04:35:05 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3AF042045;
 Thu, 30 Apr 2020 04:35:05 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D16A42041;
 Thu, 30 Apr 2020 04:35:02 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.59.105])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Apr 2020 04:35:02 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v4 10/16] powerpc/watchpoint: Use loop for
 thread_struct->ptrace_bps
Date: Thu, 30 Apr 2020 10:04:11 +0530
Message-Id: <20200430043417.30948-11-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200430043417.30948-1-ravi.bangoria@linux.ibm.com>
References: <20200430043417.30948-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_01:2020-04-30,
 2020-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004300030
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
Cc: apopple@linux.ibm.com, ravi.bangoria@linux.ibm.com, peterz@infradead.org,
 fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ptrace_bps is already an array of size HBP_NUM_MAX. But we use
hardcoded index 0 while fetching/updating it. Convert such code
to loop over array.

ptrace interface to use multiple watchpoint remains same. eg:
two PPC_PTRACE_SETHWDEBUG calls will create two watchpoint if
hw underneath supports it.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Reviewed-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/kernel/hw_breakpoint.c       |  7 ++++--
 arch/powerpc/kernel/process.c             |  6 ++++-
 arch/powerpc/kernel/ptrace/ptrace-noadv.c | 28 +++++++++++++++++------
 3 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 5826f1f2cab9..772b2c953220 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -419,10 +419,13 @@ NOKPROBE_SYMBOL(hw_breakpoint_exceptions_notify);
  */
 void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
 {
+	int i;
 	struct thread_struct *t = &tsk->thread;
 
-	unregister_hw_breakpoint(t->ptrace_bps[0]);
-	t->ptrace_bps[0] = NULL;
+	for (i = 0; i < nr_wp_slots(); i++) {
+		unregister_hw_breakpoint(t->ptrace_bps[i]);
+		t->ptrace_bps[i] = NULL;
+	}
 }
 
 void hw_breakpoint_pmu_read(struct perf_event *bp)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 6d1b7cede900..41a59a37383b 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1604,6 +1604,9 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 	void (*f)(void);
 	unsigned long sp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
 	struct thread_info *ti = task_thread_info(p);
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	int i;
+#endif
 
 	klp_init_thread_info(p);
 
@@ -1663,7 +1666,8 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 	p->thread.ksp_limit = (unsigned long)end_of_stack(p);
 #endif
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-	p->thread.ptrace_bps[0] = NULL;
+	for (i = 0; i < nr_wp_slots(); i++)
+		p->thread.ptrace_bps[i] = NULL;
 #endif
 
 	p->thread.fp_save_area = NULL;
diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
index 0dbb35392dd2..08cb8c1b504c 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -168,6 +168,19 @@ int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned l
 	return 0;
 }
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+static int find_empty_ptrace_bp(struct thread_struct *thread)
+{
+	int i;
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (!thread->ptrace_bps[i])
+			return i;
+	}
+	return -1;
+}
+#endif
+
 static int find_empty_hw_brk(struct thread_struct *thread)
 {
 	int i;
@@ -217,8 +230,9 @@ long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_inf
 		len = 1;
 	else
 		return -EINVAL;
-	bp = thread->ptrace_bps[0];
-	if (bp)
+
+	i = find_empty_ptrace_bp(thread);
+	if (i < 0)
 		return -ENOSPC;
 
 	/* Create a new breakpoint request if one doesn't exist already */
@@ -228,13 +242,13 @@ long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_inf
 	arch_bp_generic_fields(brk.type, &attr.bp_type);
 
 	bp = register_user_hw_breakpoint(&attr, ptrace_triggered, NULL, child);
-	thread->ptrace_bps[0] = bp;
+	thread->ptrace_bps[i] = bp;
 	if (IS_ERR(bp)) {
-		thread->ptrace_bps[0] = NULL;
+		thread->ptrace_bps[i] = NULL;
 		return PTR_ERR(bp);
 	}
 
-	return 1;
+	return i + 1;
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 
 	if (bp_info->addr_mode != PPC_BREAKPOINT_MODE_EXACT)
@@ -263,10 +277,10 @@ long ppc_del_hwdebug(struct task_struct *child, long data)
 		return -EINVAL;
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-	bp = thread->ptrace_bps[0];
+	bp = thread->ptrace_bps[data - 1];
 	if (bp) {
 		unregister_hw_breakpoint(bp);
-		thread->ptrace_bps[0] = NULL;
+		thread->ptrace_bps[data - 1] = NULL;
 	} else {
 		ret = -ENOENT;
 	}
-- 
2.21.1

