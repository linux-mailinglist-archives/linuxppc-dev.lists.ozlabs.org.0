Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C07751A7200
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 05:47:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491Wdw51WZzDqDs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:47:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 491W47282VzDqSF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 13:21:43 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E33fHW131080
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 23:21:41 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30cvwv3v0d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 23:21:41 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 14 Apr 2020 04:21:05 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 Apr 2020 04:21:02 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03E3LYpK52953274
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 03:21:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECE6452051;
 Tue, 14 Apr 2020 03:21:33 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.60.157])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9483752057;
 Tue, 14 Apr 2020 03:21:16 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v3 10/16] powerpc/watchpoint: Use loop for
 thread_struct->ptrace_bps
Date: Tue, 14 Apr 2020 08:46:53 +0530
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200414031659.58875-1-ravi.bangoria@linux.ibm.com>
References: <20200414031659.58875-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20041403-4275-0000-0000-000003BF6AAD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041403-4276-0000-0000-000038D4DB5C
Message-Id: <20200414031659.58875-11-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-13_11:2020-04-13,
 2020-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=969 priorityscore=1501 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004140024
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

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
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
index 5ad23ac2c9d9..aab82ab80dfa 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1624,6 +1624,9 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 	void (*f)(void);
 	unsigned long sp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
 	struct thread_info *ti = task_thread_info(p);
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	int i;
+#endif
 
 	klp_init_thread_info(p);
 
@@ -1683,7 +1686,8 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
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

