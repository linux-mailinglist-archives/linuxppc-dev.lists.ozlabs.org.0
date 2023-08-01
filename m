Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DFE76A63D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:23:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TcDKrWAG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFHRl40XBz3d8M
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 11:23:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TcDKrWAG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFHL65x1Sz2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 11:18:22 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37117JVW015203
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RFwmVqHWAnvHe8nKiFO/iCj921jr2aF2WFH6n6a7yug=;
 b=TcDKrWAG86YObF20qRGnfcjbj1yGMI/cfNbrgTijqeCfYSCoVNdQc9dr5qAQzkUxcnay
 6RwSilKdtxQItbx7oC+twpiABRkXMqkMa0eH23k0j5tIzeWN10GadMu8FEmhbItgD4pi
 VJ8KUnRDIvNorcR1svV5zcs+cddqcNL+jRv1RpJ9tXOSpBk/hQuVJGpJytMPhTqWvciR
 qC1ZtCDvs0uLecaX4akGJAYhbWXlrt4VeB6aEoV8Y8Gjpi/KUZ/ART8XYRwlXL2zFzNY
 x58MeItVr2Kv+fV9Wnm/LdaiYxP+cj+DMwsTyXKAQM0sqUFKzxy8gEfV4rKkKNcOtxMh Ig== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6qw30p1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:20 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3710kvHR017005
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:19 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s5dfy01gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3711IHeL62783934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:17 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72D0220049
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72BE820040
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:16 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4BAB460367;
	Tue,  1 Aug 2023 11:18:13 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/7] powerpc/watchpoints: Remove ptrace/perf exclusion tracking
Date: Tue,  1 Aug 2023 11:17:42 +1000
Message-ID: <20230801011744.153973-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801011744.153973-1-bgray@linux.ibm.com>
References: <20230801011744.153973-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2qpHcrk9DnvgwohQVoEO5D_pt4uviCot
X-Proofpoint-ORIG-GUID: 2qpHcrk9DnvgwohQVoEO5D_pt4uviCot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_18,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010008
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ptrace and perf watchpoints were considered incompatible in
commit 29da4f91c0c1 ("powerpc/watchpoint: Don't allow concurrent perf
and ptrace events"), but the logic in that commit doesn't really apply.

Ptrace doesn't automatically single step; the ptracer must request this
explicitly. And the ptracer can do so regardless of whether a
ptrace/perf watchpoint triggered or not: it could single step every
instruction if it wanted to. Whatever stopped the ptracee before
executing the instruction that would trigger the perf watchpoint is no
longer relevant by this point.

To get correct behaviour when perf and ptrace are watching the same
data we must ignore the perf watchpoint. After all, ptrace has
before-execute semantics, and perf is after-execute, so perf doesn't
actually care about the watchpoint trigger at this point in time.
Pausing before execution does not mean we will actually end up executing
the instruction.

Importantly though, we don't remove the perf watchpoint yet. This is
key.

The ptracer is free to do whatever it likes right now. E.g., it can
continue the process, single step. or even set the child PC somewhere
completely different.

If it does try to execute the instruction though, without reinserting
the watchpoint (in which case we go back to the start of this example),
the perf watchpoint would immediately trigger. This time there is no
ptrace watchpoint, so we can safely perform a single step and increment
the perf counter. Upon receiving the single step exception, the existing
code already handles propagating or consuming it based on whether
another subsystem (e.g. ptrace) requested a single step. Again, this is
needed with or without perf/ptrace exclusion, because ptrace could be
single stepping this instruction regardless of if a watchpoint is
involved.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

Whether it's a _good_ idea to mix ptrace and perf is another thing
entirely mind... . But they are not inherently incompatible.
---
 arch/powerpc/kernel/hw_breakpoint.c | 249 +---------------------------
 1 file changed, 1 insertion(+), 248 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index bf8dda1a7e04..b8513dc3e53a 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -114,253 +114,6 @@ static bool is_ptrace_bp(struct perf_event *bp)
 	return bp->overflow_handler == ptrace_triggered;
 }
 
-struct breakpoint {
-	struct list_head list;
-	struct perf_event *bp;
-	bool ptrace_bp;
-};
-
-/*
- * While kernel/events/hw_breakpoint.c does its own synchronization, we cannot
- * rely on it safely synchronizing internals here; however, we can rely on it
- * not requesting more breakpoints than available.
- */
-static DEFINE_SPINLOCK(cpu_bps_lock);
-static DEFINE_PER_CPU(struct breakpoint *, cpu_bps[HBP_NUM_MAX]);
-static DEFINE_SPINLOCK(task_bps_lock);
-static LIST_HEAD(task_bps);
-
-static struct breakpoint *alloc_breakpoint(struct perf_event *bp)
-{
-	struct breakpoint *tmp;
-
-	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
-	if (!tmp)
-		return ERR_PTR(-ENOMEM);
-	tmp->bp = bp;
-	tmp->ptrace_bp = is_ptrace_bp(bp);
-	return tmp;
-}
-
-static bool bp_addr_range_overlap(struct perf_event *bp1, struct perf_event *bp2)
-{
-	__u64 bp1_saddr, bp1_eaddr, bp2_saddr, bp2_eaddr;
-
-	bp1_saddr = ALIGN_DOWN(bp1->attr.bp_addr, HW_BREAKPOINT_SIZE);
-	bp1_eaddr = ALIGN(bp1->attr.bp_addr + bp1->attr.bp_len, HW_BREAKPOINT_SIZE);
-	bp2_saddr = ALIGN_DOWN(bp2->attr.bp_addr, HW_BREAKPOINT_SIZE);
-	bp2_eaddr = ALIGN(bp2->attr.bp_addr + bp2->attr.bp_len, HW_BREAKPOINT_SIZE);
-
-	return (bp1_saddr < bp2_eaddr && bp1_eaddr > bp2_saddr);
-}
-
-static bool alternate_infra_bp(struct breakpoint *b, struct perf_event *bp)
-{
-	return is_ptrace_bp(bp) ? !b->ptrace_bp : b->ptrace_bp;
-}
-
-static bool can_co_exist(struct breakpoint *b, struct perf_event *bp)
-{
-	return !(alternate_infra_bp(b, bp) && bp_addr_range_overlap(b->bp, bp));
-}
-
-static int task_bps_add(struct perf_event *bp)
-{
-	struct breakpoint *tmp;
-
-	tmp = alloc_breakpoint(bp);
-	if (IS_ERR(tmp))
-		return PTR_ERR(tmp);
-
-	spin_lock(&task_bps_lock);
-	list_add(&tmp->list, &task_bps);
-	spin_unlock(&task_bps_lock);
-	return 0;
-}
-
-static void task_bps_remove(struct perf_event *bp)
-{
-	struct list_head *pos, *q;
-
-	spin_lock(&task_bps_lock);
-	list_for_each_safe(pos, q, &task_bps) {
-		struct breakpoint *tmp = list_entry(pos, struct breakpoint, list);
-
-		if (tmp->bp == bp) {
-			list_del(&tmp->list);
-			kfree(tmp);
-			break;
-		}
-	}
-	spin_unlock(&task_bps_lock);
-}
-
-/*
- * If any task has breakpoint from alternate infrastructure,
- * return true. Otherwise return false.
- */
-static bool all_task_bps_check(struct perf_event *bp)
-{
-	struct breakpoint *tmp;
-	bool ret = false;
-
-	spin_lock(&task_bps_lock);
-	list_for_each_entry(tmp, &task_bps, list) {
-		if (!can_co_exist(tmp, bp)) {
-			ret = true;
-			break;
-		}
-	}
-	spin_unlock(&task_bps_lock);
-	return ret;
-}
-
-/*
- * If same task has breakpoint from alternate infrastructure,
- * return true. Otherwise return false.
- */
-static bool same_task_bps_check(struct perf_event *bp)
-{
-	struct breakpoint *tmp;
-	bool ret = false;
-
-	spin_lock(&task_bps_lock);
-	list_for_each_entry(tmp, &task_bps, list) {
-		if (tmp->bp->hw.target == bp->hw.target &&
-		    !can_co_exist(tmp, bp)) {
-			ret = true;
-			break;
-		}
-	}
-	spin_unlock(&task_bps_lock);
-	return ret;
-}
-
-static int cpu_bps_add(struct perf_event *bp)
-{
-	struct breakpoint **cpu_bp;
-	struct breakpoint *tmp;
-	int i = 0;
-
-	tmp = alloc_breakpoint(bp);
-	if (IS_ERR(tmp))
-		return PTR_ERR(tmp);
-
-	spin_lock(&cpu_bps_lock);
-	cpu_bp = per_cpu_ptr(cpu_bps, bp->cpu);
-	for (i = 0; i < nr_wp_slots(); i++) {
-		if (!cpu_bp[i]) {
-			cpu_bp[i] = tmp;
-			break;
-		}
-	}
-	spin_unlock(&cpu_bps_lock);
-	return 0;
-}
-
-static void cpu_bps_remove(struct perf_event *bp)
-{
-	struct breakpoint **cpu_bp;
-	int i = 0;
-
-	spin_lock(&cpu_bps_lock);
-	cpu_bp = per_cpu_ptr(cpu_bps, bp->cpu);
-	for (i = 0; i < nr_wp_slots(); i++) {
-		if (!cpu_bp[i])
-			continue;
-
-		if (cpu_bp[i]->bp == bp) {
-			kfree(cpu_bp[i]);
-			cpu_bp[i] = NULL;
-			break;
-		}
-	}
-	spin_unlock(&cpu_bps_lock);
-}
-
-static bool cpu_bps_check(int cpu, struct perf_event *bp)
-{
-	struct breakpoint **cpu_bp;
-	bool ret = false;
-	int i;
-
-	spin_lock(&cpu_bps_lock);
-	cpu_bp = per_cpu_ptr(cpu_bps, cpu);
-	for (i = 0; i < nr_wp_slots(); i++) {
-		if (cpu_bp[i] && !can_co_exist(cpu_bp[i], bp)) {
-			ret = true;
-			break;
-		}
-	}
-	spin_unlock(&cpu_bps_lock);
-	return ret;
-}
-
-static bool all_cpu_bps_check(struct perf_event *bp)
-{
-	int cpu;
-
-	for_each_online_cpu(cpu) {
-		if (cpu_bps_check(cpu, bp))
-			return true;
-	}
-	return false;
-}
-
-int arch_reserve_bp_slot(struct perf_event *bp)
-{
-	int ret;
-
-	/* ptrace breakpoint */
-	if (is_ptrace_bp(bp)) {
-		if (all_cpu_bps_check(bp))
-			return -ENOSPC;
-
-		if (same_task_bps_check(bp))
-			return -ENOSPC;
-
-		return task_bps_add(bp);
-	}
-
-	/* perf breakpoint */
-	if (is_kernel_addr(bp->attr.bp_addr))
-		return 0;
-
-	if (bp->hw.target && bp->cpu == -1) {
-		if (same_task_bps_check(bp))
-			return -ENOSPC;
-
-		return task_bps_add(bp);
-	} else if (!bp->hw.target && bp->cpu != -1) {
-		if (all_task_bps_check(bp))
-			return -ENOSPC;
-
-		return cpu_bps_add(bp);
-	}
-
-	if (same_task_bps_check(bp))
-		return -ENOSPC;
-
-	ret = cpu_bps_add(bp);
-	if (ret)
-		return ret;
-	ret = task_bps_add(bp);
-	if (ret)
-		cpu_bps_remove(bp);
-
-	return ret;
-}
-
-void arch_release_bp_slot(struct perf_event *bp)
-{
-	if (!is_kernel_addr(bp->attr.bp_addr)) {
-		if (bp->hw.target)
-			task_bps_remove(bp);
-		if (bp->cpu != -1)
-			cpu_bps_remove(bp);
-	}
-}
-
 /*
  * Check for virtual address in kernel space.
  */
@@ -687,7 +440,7 @@ int hw_breakpoint_handler(struct die_args *args)
 	 */
 	if (ptrace_bp) {
 		for (i = 0; i < nr_wp_slots(); i++) {
-			if (!hit[i])
+			if (!hit[i] || !is_ptrace_bp(bp[i]))
 				continue;
 			perf_bp_event(bp[i], regs);
 			bp[i] = NULL;
-- 
2.41.0

