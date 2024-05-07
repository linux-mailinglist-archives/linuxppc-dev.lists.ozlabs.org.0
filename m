Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFBE8BE151
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 13:45:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ARevRImt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYc036Mw4z3ccS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 21:45:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ARevRImt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYbzH5wRfz30T0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 21:44:27 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 447Bh5N7019035;
	Tue, 7 May 2024 11:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=otzPcaazGn9g+pLvwtbtDObHp2piOhkZasDXAFFP0fw=;
 b=ARevRImtO92G/PTpUydNB9y+fV6avH6oKz8o2O/NxtHrM1lu7J3Xb8d1W6ygmMdORX7P
 q0J1/lcygLcjHpCSZBlCuXEzy0vjONVty513eevAg4mDDz5oUTJ2CgPER+uPUJEb4vVp
 JcuwDfZD2/8QkKEEuXtcZnNY4DwwXFgbrJa/247wsAi/GMiytLj4Z6d1QtBnnII+MbYR
 95R7+yioCfjnjhiWO8O4pGEfi9YVadqvsw4oeDZBVdcVG2PVn4rD4NBHhZr4uXkSyK0q
 pH34V7W8/zxSoiF/eYU1qnhvKOn+mJnbNLVj4XO5edHog+mAsNia6pGvUJyqQMy0reGE Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xykntg02s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 11:44:12 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 447BiB9b019975;
	Tue, 7 May 2024 11:44:11 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xykntg02q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 11:44:11 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 447AThJl022558;
	Tue, 7 May 2024 11:44:10 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xx1jkwj3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 11:44:10 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 447Bi5VS45351252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2024 11:44:07 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D5EC20043;
	Tue,  7 May 2024 11:44:05 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EEFE20040;
	Tue,  7 May 2024 11:44:01 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.43.79.251])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 May 2024 11:44:00 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com
Subject: [PATCH v7] arch/powerpc/kvm: Add support for reading VPA counters for pseries guests
Date: Tue,  7 May 2024 17:13:48 +0530
Message-ID: <20240507114352.51819-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nNipPBvCewN7W1260uvHkJQ39eL6XonP
X-Proofpoint-GUID: gDbvdjFnxUD-5yXqqZnX2AoZ3WWNWZDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_05,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405070080
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
Cc: kvm@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>, linux-kernel@vger.kernel.org, Naveen N Rao <naveen@kernel.org>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PAPR hypervisor has introduced three new counters in the VPA area of
LPAR CPUs for KVM L2 guest (see [1] for terminology) observability - 2
for context switches from host to guest and vice versa, and 1 counter
for getting the total time spent inside the KVM guest. Add a tracepoint
that enables reading the counters for use by ftrace/perf. Note that this
tracepoint is only available for nestedv2 API (i.e, KVM on PowerVM).

[1] Terminology:
a. L1 refers to the VM (LPAR) booted on top of PAPR hypervisor
b. L2 refers to the KVM guest booted on top of L1.

Acked-by: Naveen N Rao <naveen@kernel.org>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
v6 -> v7:
1. Use TRACE_EVENT_FN_COND to handle zero counters case.
2. Use for_each_present_cpu() to handle hotplugs.

v5 -> v6:
1. Use TRACE_EVENT_FN to enable/disable counters only once.
2. Remove the agg. counters from vcpu->arch.
3. Use PACA to maintain old counter values instead of zeroing on every
entry.
4. Simplify variable names

v4 -> v5:
1. Define helper functions for getting/setting the accumulation counter
in L2's VPA

v3 -> v4:
1. After vcpu_run, check the VPA flag instead of checking for tracepoint
being enabled for disabling the cs time accumulation.

v2 -> v3:
1. Move the counter disabling and zeroing code to a different function.
2. Move the get_lppaca() inside the tracepoint_enabled() branch.
3. Add the aggregation logic to maintain total context switch time.

v1 -> v2:
1. Fix the build error due to invalid struct member reference.

 arch/powerpc/include/asm/lppaca.h | 11 +++++--
 arch/powerpc/include/asm/paca.h   |  5 +++
 arch/powerpc/kvm/book3s_hv.c      | 52 +++++++++++++++++++++++++++++++
 arch/powerpc/kvm/trace_hv.h       | 29 +++++++++++++++++
 4 files changed, 94 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index 61ec2447dabf..f40a646bee3c 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -62,7 +62,8 @@ struct lppaca {
 	u8	donate_dedicated_cpu;	/* Donate dedicated CPU cycles */
 	u8	fpregs_in_use;
 	u8	pmcregs_in_use;
-	u8	reserved8[28];
+	u8	l2_counters_enable;  /* Enable usage of counters for KVM guest */
+	u8	reserved8[27];
 	__be64	wait_state_cycles;	/* Wait cycles for this proc */
 	u8	reserved9[28];
 	__be16	slb_count;		/* # of SLBs to maintain */
@@ -92,9 +93,13 @@ struct lppaca {
 	/* cacheline 4-5 */
 
 	__be32	page_ins;		/* CMO Hint - # page ins by OS */
-	u8	reserved12[148];
+	u8	reserved12[28];
+	volatile __be64 l1_to_l2_cs_tb;
+	volatile __be64 l2_to_l1_cs_tb;
+	volatile __be64 l2_runtime_tb;
+	u8 reserved13[96];
 	volatile __be64 dtl_idx;	/* Dispatch Trace Log head index */
-	u8	reserved13[96];
+	u8	reserved14[96];
 } ____cacheline_aligned;
 
 #define lppaca_of(cpu)	(*paca_ptrs[cpu]->lppaca_ptr)
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 1d58da946739..f20ac7a6efa4 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -278,6 +278,11 @@ struct paca_struct {
 	struct mce_info *mce_info;
 	u8 mce_pending_irq_work;
 #endif /* CONFIG_PPC_BOOK3S_64 */
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	u64 l1_to_l2_cs;
+	u64 l2_to_l1_cs;
+	u64 l2_runtime_agg;
+#endif
 } ____cacheline_aligned;
 
 extern void copy_mm_to_paca(struct mm_struct *mm);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8e86eb577eb8..6acfe59c9b4f 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4108,6 +4108,54 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
 	}
 }
 
+static inline int kvmhv_get_l2_counters_status(void)
+{
+	return get_lppaca()->l2_counters_enable;
+}
+
+static inline void kvmhv_set_l2_counters_status(int cpu, bool status)
+{
+	if (status)
+		lppaca_of(cpu).l2_counters_enable = 1;
+	else
+		lppaca_of(cpu).l2_counters_enable = 0;
+}
+
+int kmvhv_counters_tracepoint_regfunc(void)
+{
+	int cpu;
+
+	for_each_present_cpu(cpu) {
+		kvmhv_set_l2_counters_status(cpu, true);
+	}
+	return 0;
+}
+
+void kmvhv_counters_tracepoint_unregfunc(void)
+{
+	int cpu;
+
+	for_each_present_cpu(cpu) {
+		kvmhv_set_l2_counters_status(cpu, false);
+	}
+}
+
+static void do_trace_nested_cs_time(struct kvm_vcpu *vcpu)
+{
+	struct lppaca *lp = get_lppaca();
+	u64 l1_to_l2_ns, l2_to_l1_ns, l2_runtime_ns;
+
+	l1_to_l2_ns = tb_to_ns(be64_to_cpu(lp->l1_to_l2_cs_tb));
+	l2_to_l1_ns = tb_to_ns(be64_to_cpu(lp->l2_to_l1_cs_tb));
+	l2_runtime_ns = tb_to_ns(be64_to_cpu(lp->l2_runtime_tb));
+	trace_kvmppc_vcpu_stats(vcpu, l1_to_l2_ns - local_paca->l1_to_l2_cs,
+					l2_to_l1_ns - local_paca->l2_to_l1_cs,
+					l2_runtime_ns - local_paca->l2_runtime_agg);
+	local_paca->l1_to_l2_cs = l1_to_l2_ns;
+	local_paca->l2_to_l1_cs = l2_to_l1_ns;
+	local_paca->l2_runtime_agg = l2_runtime_ns;
+}
+
 static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
 				     unsigned long lpcr, u64 *tb)
 {
@@ -4156,6 +4204,10 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	timer_rearm_host_dec(*tb);
 
+	/* Record context switch and guest_run_time data */
+	if (kvmhv_get_l2_counters_status())
+		do_trace_nested_cs_time(vcpu);
+
 	return trap;
 }
 
diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
index 8d57c8428531..8c563e9438db 100644
--- a/arch/powerpc/kvm/trace_hv.h
+++ b/arch/powerpc/kvm/trace_hv.h
@@ -238,6 +238,9 @@
 	{H_MULTI_THREADS_ACTIVE,	"H_MULTI_THREADS_ACTIVE"}, \
 	{H_OUTSTANDING_COP_OPS,		"H_OUTSTANDING_COP_OPS"}
 
+int kmvhv_counters_tracepoint_regfunc(void);
+void kmvhv_counters_tracepoint_unregfunc(void);
+
 TRACE_EVENT(kvm_guest_enter,
 	TP_PROTO(struct kvm_vcpu *vcpu),
 	TP_ARGS(vcpu),
@@ -512,6 +515,32 @@ TRACE_EVENT(kvmppc_run_vcpu_exit,
 			__entry->vcpu_id, __entry->exit, __entry->ret)
 );
 
+TRACE_EVENT_FN_COND(kvmppc_vcpu_stats,
+	TP_PROTO(struct kvm_vcpu *vcpu, u64 l1_to_l2_cs, u64 l2_to_l1_cs, u64 l2_runtime),
+
+	TP_ARGS(vcpu, l1_to_l2_cs, l2_to_l1_cs, l2_runtime),
+
+	TP_CONDITION(l1_to_l2_cs || l2_to_l1_cs || l2_runtime),
+
+	TP_STRUCT__entry(
+		__field(int,		vcpu_id)
+		__field(u64,		l1_to_l2_cs)
+		__field(u64,		l2_to_l1_cs)
+		__field(u64,		l2_runtime)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id  = vcpu->vcpu_id;
+		__entry->l1_to_l2_cs = l1_to_l2_cs;
+		__entry->l2_to_l1_cs = l2_to_l1_cs;
+		__entry->l2_runtime = l2_runtime;
+	),
+
+	TP_printk("VCPU %d: l1_to_l2_cs_time=%llu ns l2_to_l1_cs_time=%llu ns l2_runtime=%llu ns",
+		__entry->vcpu_id,  __entry->l1_to_l2_cs,
+		__entry->l2_to_l1_cs, __entry->l2_runtime),
+	kmvhv_counters_tracepoint_regfunc, kmvhv_counters_tracepoint_unregfunc
+);
 #endif /* _TRACE_KVM_HV_H */
 
 /* This part must be outside protection */
-- 
2.44.0

