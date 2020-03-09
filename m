Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F817DC40
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 10:19:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bXjS08DQzF1R4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 20:19:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bXGG3Tc1zDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Mar 2020 19:59:18 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0298psgQ075327
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Mar 2020 04:59:15 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym8c8ww8w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2020 04:59:15 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 9 Mar 2020 08:59:13 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Mar 2020 08:59:10 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0298x87g56492268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2020 08:59:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 945A0A404D;
 Mon,  9 Mar 2020 08:59:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 258ECA4051;
 Mon,  9 Mar 2020 08:59:06 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.44])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2020 08:59:05 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH 10/15] powerpc/watchpoint: Use loop for
 thread_struct->ptrace_bps
Date: Mon,  9 Mar 2020 14:28:01 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030908-0012-0000-0000-0000038E7F66
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030908-0013-0000-0000-000021CB467B
Message-Id: <20200309085806.155823-11-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_02:2020-03-06,
 2020-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 spamscore=0 adultscore=0 mlxlogscore=935 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003090066
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
Cc: apopple@linux.ibm.com, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 peterz@infradead.org, fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
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
 arch/powerpc/kernel/hw_breakpoint.c |  7 +++++--
 arch/powerpc/kernel/process.c       |  6 +++++-
 arch/powerpc/kernel/ptrace.c        | 28 +++++++++++++++++++++-------
 3 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index f4d48f87dcb8..b27aca623267 100644
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
index 42ff62ef749c..b9ab740fcacf 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1628,6 +1628,9 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 	void (*f)(void);
 	unsigned long sp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
 	struct thread_info *ti = task_thread_info(p);
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	int i;
+#endif
 
 	klp_init_thread_info(p);
 
@@ -1687,7 +1690,8 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 	p->thread.ksp_limit = (unsigned long)end_of_stack(p);
 #endif
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-	p->thread.ptrace_bps[0] = NULL;
+	for (i = 0; i < nr_wp_slots(); i++)
+		p->thread.ptrace_bps[i] = NULL;
 #endif
 
 	p->thread.fp_save_area = NULL;
diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
index f6d7955fc61e..e2651f86d56f 100644
--- a/arch/powerpc/kernel/ptrace.c
+++ b/arch/powerpc/kernel/ptrace.c
@@ -2829,6 +2829,19 @@ static int set_dac_range(struct task_struct *child,
 }
 #endif /* CONFIG_PPC_ADV_DEBUG_DAC_RANGE */
 
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+static int empty_ptrace_bp(struct thread_struct *thread)
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
 #ifndef CONFIG_PPC_ADV_DEBUG_REGS
 static int empty_hw_brk(struct thread_struct *thread)
 {
@@ -2915,8 +2928,9 @@ static long ppc_set_hwdebug(struct task_struct *child,
 		len = 1;
 	else
 		return -EINVAL;
-	bp = thread->ptrace_bps[0];
-	if (bp)
+
+	i = empty_ptrace_bp(thread);
+	if (i < 0)
 		return -ENOSPC;
 
 	/* Create a new breakpoint request if one doesn't exist already */
@@ -2925,14 +2939,14 @@ static long ppc_set_hwdebug(struct task_struct *child,
 	attr.bp_len = len;
 	arch_bp_generic_fields(brk.type, &attr.bp_type);
 
-	thread->ptrace_bps[0] = bp = register_user_hw_breakpoint(&attr,
+	thread->ptrace_bps[i] = bp = register_user_hw_breakpoint(&attr,
 					       ptrace_triggered, NULL, child);
 	if (IS_ERR(bp)) {
-		thread->ptrace_bps[0] = NULL;
+		thread->ptrace_bps[i] = NULL;
 		return PTR_ERR(bp);
 	}
 
-	return 1;
+	return i + 1;
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 
 	if (bp_info->addr_mode != PPC_BREAKPOINT_MODE_EXACT)
@@ -2979,10 +2993,10 @@ static long ppc_del_hwdebug(struct task_struct *child, long data)
 		return -EINVAL;
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-	bp = thread->ptrace_bps[0];
+	bp = thread->ptrace_bps[data - 1];
 	if (bp) {
 		unregister_hw_breakpoint(bp);
-		thread->ptrace_bps[0] = NULL;
+		thread->ptrace_bps[data - 1] = NULL;
 	} else
 		ret = -ENOENT;
 	return ret;
-- 
2.21.1

