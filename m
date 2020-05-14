Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 236CB1D2EB8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 13:49:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N8wL3VtNzDqTV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 21:49:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N8F266Z4zDqfq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 21:19:02 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EB2ETs022970; Thu, 14 May 2020 07:18:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 310x55vdf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 07:18:50 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04EB2vPd031150;
 Thu, 14 May 2020 07:18:49 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 310x55vde3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 07:18:49 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04EBG1AL019863;
 Thu, 14 May 2020 11:18:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3100ub3g8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:18:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04EBIilk6881586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 May 2020 11:18:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F8CD42045;
 Thu, 14 May 2020 11:18:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18CA94203F;
 Thu, 14 May 2020 11:18:41 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.59.186])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 May 2020 11:18:40 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v6 14/16] powerpc/watchpoint: Don't allow concurrent perf and
 ptrace events
Date: Thu, 14 May 2020 16:47:39 +0530
Message-Id: <20200514111741.97993-15-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514111741.97993-1-ravi.bangoria@linux.ibm.com>
References: <20200514111741.97993-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-13,
 2020-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 adultscore=0 clxscore=1015 cotscore=-2147483648 lowpriorityscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005140095
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
Cc: christophe.leroy@c-s.fr, apopple@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 peterz@infradead.org, fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With Book3s DAWR, ptrace and perf watchpoints on powerpc behaves
differently. Ptrace watchpoint works in one-shot mode and generates
signal before executing instruction. It's ptrace user's job to
single-step the instruction and re-enable the watchpoint. OTOH, in
case of perf watchpoint, kernel emulates/single-steps the instruction
and then generates event. If perf and ptrace creates two events with
same or overlapping address ranges, it's ambiguous to decide who
should single-step the instruction. Because of this issue, don't
allow perf and ptrace watchpoint at the same time if their address
range overlaps.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Reviewed-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/include/asm/hw_breakpoint.h |   2 +
 arch/powerpc/kernel/hw_breakpoint.c      | 221 +++++++++++++++++++++++
 kernel/events/hw_breakpoint.c            |  16 ++
 3 files changed, 239 insertions(+)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index add5aa076919..f42a55eb77d2 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -70,6 +70,8 @@ extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
 						unsigned long val, void *data);
 int arch_install_hw_breakpoint(struct perf_event *bp);
 void arch_uninstall_hw_breakpoint(struct perf_event *bp);
+int arch_reserve_bp_slot(struct perf_event *bp);
+void arch_release_bp_slot(struct perf_event *bp);
 void arch_unregister_hw_breakpoint(struct perf_event *bp);
 void hw_breakpoint_pmu_read(struct perf_event *bp);
 extern void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index da858bc6a414..80396f3f7e90 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -124,6 +124,227 @@ static bool is_ptrace_bp(struct perf_event *bp)
 	return bp->overflow_handler == ptrace_triggered;
 }
 
+struct breakpoint {
+	struct list_head list;
+	struct perf_event *bp;
+	bool ptrace_bp;
+};
+
+static DEFINE_PER_CPU(struct breakpoint *, cpu_bps[HBP_NUM_MAX]);
+static LIST_HEAD(task_bps);
+
+static struct breakpoint *alloc_breakpoint(struct perf_event *bp)
+{
+	struct breakpoint *tmp;
+
+	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
+	if (!tmp)
+		return ERR_PTR(-ENOMEM);
+	tmp->bp = bp;
+	tmp->ptrace_bp = is_ptrace_bp(bp);
+	return tmp;
+}
+
+static bool bp_addr_range_overlap(struct perf_event *bp1, struct perf_event *bp2)
+{
+	__u64 bp1_saddr, bp1_eaddr, bp2_saddr, bp2_eaddr;
+
+	bp1_saddr = ALIGN_DOWN(bp1->attr.bp_addr, HW_BREAKPOINT_SIZE);
+	bp1_eaddr = ALIGN(bp1->attr.bp_addr + bp1->attr.bp_len, HW_BREAKPOINT_SIZE);
+	bp2_saddr = ALIGN_DOWN(bp2->attr.bp_addr, HW_BREAKPOINT_SIZE);
+	bp2_eaddr = ALIGN(bp2->attr.bp_addr + bp2->attr.bp_len, HW_BREAKPOINT_SIZE);
+
+	return (bp1_saddr < bp2_eaddr && bp1_eaddr > bp2_saddr);
+}
+
+static bool alternate_infra_bp(struct breakpoint *b, struct perf_event *bp)
+{
+	return is_ptrace_bp(bp) ? !b->ptrace_bp : b->ptrace_bp;
+}
+
+static bool can_co_exist(struct breakpoint *b, struct perf_event *bp)
+{
+	return !(alternate_infra_bp(b, bp) && bp_addr_range_overlap(b->bp, bp));
+}
+
+static int task_bps_add(struct perf_event *bp)
+{
+	struct breakpoint *tmp;
+
+	tmp = alloc_breakpoint(bp);
+	if (IS_ERR(tmp))
+		return PTR_ERR(tmp);
+
+	list_add(&tmp->list, &task_bps);
+	return 0;
+}
+
+static void task_bps_remove(struct perf_event *bp)
+{
+	struct list_head *pos, *q;
+
+	list_for_each_safe(pos, q, &task_bps) {
+		struct breakpoint *tmp = list_entry(pos, struct breakpoint, list);
+
+		if (tmp->bp == bp) {
+			list_del(&tmp->list);
+			kfree(tmp);
+			break;
+		}
+	}
+}
+
+/*
+ * If any task has breakpoint from alternate infrastructure,
+ * return true. Otherwise return false.
+ */
+static bool all_task_bps_check(struct perf_event *bp)
+{
+	struct breakpoint *tmp;
+
+	list_for_each_entry(tmp, &task_bps, list) {
+		if (!can_co_exist(tmp, bp))
+			return true;
+	}
+	return false;
+}
+
+/*
+ * If same task has breakpoint from alternate infrastructure,
+ * return true. Otherwise return false.
+ */
+static bool same_task_bps_check(struct perf_event *bp)
+{
+	struct breakpoint *tmp;
+
+	list_for_each_entry(tmp, &task_bps, list) {
+		if (tmp->bp->hw.target == bp->hw.target &&
+		    !can_co_exist(tmp, bp))
+			return true;
+	}
+	return false;
+}
+
+static int cpu_bps_add(struct perf_event *bp)
+{
+	struct breakpoint **cpu_bp;
+	struct breakpoint *tmp;
+	int i = 0;
+
+	tmp = alloc_breakpoint(bp);
+	if (IS_ERR(tmp))
+		return PTR_ERR(tmp);
+
+	cpu_bp = per_cpu_ptr(cpu_bps, bp->cpu);
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (!cpu_bp[i]) {
+			cpu_bp[i] = tmp;
+			break;
+		}
+	}
+	return 0;
+}
+
+static void cpu_bps_remove(struct perf_event *bp)
+{
+	struct breakpoint **cpu_bp;
+	int i = 0;
+
+	cpu_bp = per_cpu_ptr(cpu_bps, bp->cpu);
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (!cpu_bp[i])
+			continue;
+
+		if (cpu_bp[i]->bp == bp) {
+			kfree(cpu_bp[i]);
+			cpu_bp[i] = NULL;
+			break;
+		}
+	}
+}
+
+static bool cpu_bps_check(int cpu, struct perf_event *bp)
+{
+	struct breakpoint **cpu_bp;
+	int i;
+
+	cpu_bp = per_cpu_ptr(cpu_bps, cpu);
+	for (i = 0; i < nr_wp_slots(); i++) {
+		if (cpu_bp[i] && !can_co_exist(cpu_bp[i], bp))
+			return true;
+	}
+	return false;
+}
+
+static bool all_cpu_bps_check(struct perf_event *bp)
+{
+	int cpu;
+
+	for_each_online_cpu(cpu) {
+		if (cpu_bps_check(cpu, bp))
+			return true;
+	}
+	return false;
+}
+
+/*
+ * We don't use any locks to serialize accesses to cpu_bps or task_bps
+ * because are already inside nr_bp_mutex.
+ */
+int arch_reserve_bp_slot(struct perf_event *bp)
+{
+	int ret;
+
+	/* ptrace breakpoint */
+	if (is_ptrace_bp(bp)) {
+		if (all_cpu_bps_check(bp))
+			return -ENOSPC;
+
+		if (same_task_bps_check(bp))
+			return -ENOSPC;
+
+		return task_bps_add(bp);
+	}
+
+	/* perf breakpoint */
+	if (is_kernel_addr(bp->attr.bp_addr))
+		return 0;
+
+	if (bp->hw.target && bp->cpu == -1) {
+		if (same_task_bps_check(bp))
+			return -ENOSPC;
+
+		return task_bps_add(bp);
+	} else if (!bp->hw.target && bp->cpu != -1) {
+		if (all_task_bps_check(bp))
+			return -ENOSPC;
+
+		return cpu_bps_add(bp);
+	}
+
+	if (same_task_bps_check(bp))
+		return -ENOSPC;
+
+	ret = cpu_bps_add(bp);
+	if (ret)
+		return ret;
+	ret = task_bps_add(bp);
+	if (ret)
+		cpu_bps_remove(bp);
+
+	return ret;
+}
+
+void arch_release_bp_slot(struct perf_event *bp)
+{
+	if (!is_kernel_addr(bp->attr.bp_addr)) {
+		if (bp->hw.target)
+			task_bps_remove(bp);
+		if (bp->cpu != -1)
+			cpu_bps_remove(bp);
+	}
+}
+
 /*
  * Perform cleanup of arch-specific counters during unregistration
  * of the perf-event
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 3cc8416ec844..b48d7039a015 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -213,6 +213,15 @@ toggle_bp_slot(struct perf_event *bp, bool enable, enum bp_type_idx type,
 		list_del(&bp->hw.bp_list);
 }
 
+__weak int arch_reserve_bp_slot(struct perf_event *bp)
+{
+	return 0;
+}
+
+__weak void arch_release_bp_slot(struct perf_event *bp)
+{
+}
+
 /*
  * Function to perform processor-specific cleanup during unregistration
  */
@@ -270,6 +279,7 @@ static int __reserve_bp_slot(struct perf_event *bp, u64 bp_type)
 	struct bp_busy_slots slots = {0};
 	enum bp_type_idx type;
 	int weight;
+	int ret;
 
 	/* We couldn't initialize breakpoint constraints on boot */
 	if (!constraints_initialized)
@@ -294,6 +304,10 @@ static int __reserve_bp_slot(struct perf_event *bp, u64 bp_type)
 	if (slots.pinned + (!!slots.flexible) > nr_slots[type])
 		return -ENOSPC;
 
+	ret = arch_reserve_bp_slot(bp);
+	if (ret)
+		return ret;
+
 	toggle_bp_slot(bp, true, type, weight);
 
 	return 0;
@@ -317,6 +331,8 @@ static void __release_bp_slot(struct perf_event *bp, u64 bp_type)
 	enum bp_type_idx type;
 	int weight;
 
+	arch_release_bp_slot(bp);
+
 	type = find_slot_idx(bp_type);
 	weight = hw_breakpoint_weight(bp);
 	toggle_bp_slot(bp, false, type, weight);
-- 
2.26.2

