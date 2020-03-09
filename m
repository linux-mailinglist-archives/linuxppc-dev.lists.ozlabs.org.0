Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 441F617DC59
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 10:24:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bXqB1Zf8zDr1V
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 20:24:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bXGQ5W5zzDqTQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Mar 2020 19:59:26 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0298ptHP075409
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Mar 2020 04:59:23 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym8c8wwdq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2020 04:59:23 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 9 Mar 2020 08:59:21 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Mar 2020 08:59:18 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0298xHxx459106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2020 08:59:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E545DA4040;
 Mon,  9 Mar 2020 08:59:16 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EC6BA404D;
 Mon,  9 Mar 2020 08:59:14 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.44])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2020 08:59:14 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH 13/15] powerpc/watchpoint: Don't allow concurrent perf and
 ptrace events
Date: Mon,  9 Mar 2020 14:28:04 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20030908-4275-0000-0000-000003A9B43B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030908-4276-0000-0000-000038BEC9F9
Message-Id: <20200309085806.155823-14-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_02:2020-03-06,
 2020-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 spamscore=0 adultscore=0 mlxlogscore=922 malwarescore=0
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

ptrace and perf watchpoints on powerpc behaves differently. Ptrace
watchpoint works in one-shot mode and generates signal before executing
instruction. It's ptrace user's job to single-step the instruction and
re-enable the watchpoint. OTOH, in case of perf watchpoint, kernel
emulates/single-steps the instruction and then generates event. If perf
and ptrace creates two events with same or overlapping address ranges,
it's ambiguous to decide who should single-step the instruction. Because
of this issue ptrace and perf event can't coexist when the address range
overlaps.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_breakpoint.h |   2 +
 arch/powerpc/kernel/hw_breakpoint.c      | 220 +++++++++++++++++++++++
 kernel/events/hw_breakpoint.c            |  16 ++
 3 files changed, 238 insertions(+)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index ec61e2b7195c..6e1a19af5177 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -66,6 +66,8 @@ extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
 						unsigned long val, void *data);
 int arch_install_hw_breakpoint(struct perf_event *bp);
 void arch_uninstall_hw_breakpoint(struct perf_event *bp);
+int arch_reserve_bp_slot(struct perf_event *bp);
+void arch_release_bp_slot(struct perf_event *bp);
 void arch_unregister_hw_breakpoint(struct perf_event *bp);
 void hw_breakpoint_pmu_read(struct perf_event *bp);
 extern void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 2ac89b92590f..d8529d9151e8 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -123,6 +123,226 @@ static bool is_ptrace_bp(struct perf_event *bp)
 	return (bp->overflow_handler == ptrace_triggered);
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
+	bp1_saddr = bp1->attr.bp_addr & ~HW_BREAKPOINT_ALIGN;
+	bp1_eaddr = (bp1->attr.bp_addr + bp1->attr.bp_len - 1) | HW_BREAKPOINT_ALIGN;
+	bp2_saddr = bp2->attr.bp_addr & ~HW_BREAKPOINT_ALIGN;
+	bp2_eaddr = (bp2->attr.bp_addr + bp2->attr.bp_len - 1) | HW_BREAKPOINT_ALIGN;
+
+	return (bp1_saddr <= bp2_eaddr && bp1_eaddr >= bp2_saddr);
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
+	struct breakpoint *tmp;
+
+	list_for_each_safe(pos, q, &task_bps) {
+		tmp = list_entry(pos, struct breakpoint, list);
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
+	if (is_ptrace_bp(bp)) {
+		if (all_cpu_bps_check(bp))
+			return -ENOSPC;
+
+		if (same_task_bps_check(bp))
+			return -ENOSPC;
+
+		return task_bps_add(bp);
+	} else {
+		if (is_kernel_addr(bp->attr.bp_addr))
+			return 0;
+
+		if (bp->hw.target && bp->cpu == -1) {
+			if (same_task_bps_check(bp))
+				return -ENOSPC;
+
+			return task_bps_add(bp);
+		} else if (!bp->hw.target && bp->cpu != -1) {
+			if (all_task_bps_check(bp))
+				return -ENOSPC;
+
+			return cpu_bps_add(bp);
+		} else {
+			if (same_task_bps_check(bp))
+				return -ENOSPC;
+
+			ret = cpu_bps_add(bp);
+			if (ret)
+				return ret;
+			ret = task_bps_add(bp);
+			if (ret)
+				cpu_bps_remove(bp);
+
+			return ret;
+		}
+	}
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
2.21.1

