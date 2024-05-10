Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9DB8C2279
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 12:50:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kIohwBVw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbQf12T4bz3fSr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 20:50:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kIohwBVw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbQdF0vPnz3fST
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 20:50:08 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44AAeVHU026470;
	Fri, 10 May 2024 10:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=bMzuYtaLLWwMb31VrHykZXXBTmMAB8EIGLKLqPTgoXk=;
 b=kIohwBVwuWY6aoDLSvLpvdQxJ6s9pbkDtlRrmJ0iaJfsZcm0n5u4VbT4dGILOq2xPkMg
 rWqAiHkp4qILxW/aJe8ZYThpsdM75Wwd+8uG7IGV5v36IPaXX0sE9xZKNooIPWcpnFdf
 GIZxcNTdsYQYeu/9g9AN/BNjjrehfDo161b2hzfUZl/wZ09GROzOCEZyORAMWyk8qfeV
 gsOmbH+Osc8jrKuaCVu6sLGJClg6p+NkQiFYu2kBTvwa0SPGtTEA24ig10F7OXwqegve
 nniJT92K3PosJlkd4/1A8XjI8lTKubNzjmFfbb/He+i2OXd/gRYwJWVc6UGhLepGQapA pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y1gyg85hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 10:49:55 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44AAns7P008994;
	Fri, 10 May 2024 10:49:54 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y1gyg85hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 10:49:54 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44A7Jxav004174;
	Fri, 10 May 2024 10:49:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xysgsrqq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 10:49:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44AAnlC038535432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 May 2024 10:49:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C61962004F;
	Fri, 10 May 2024 10:49:47 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03F1F2004D;
	Fri, 10 May 2024 10:49:46 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.in.ibm.com (unknown [9.204.206.66])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 May 2024 10:49:45 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com
Subject: [PATCH v8] arch/powerpc/kvm: Add support for reading VPA counters for pseries guests
Date: Fri, 10 May 2024 16:19:38 +0530
Message-ID: <20240510104941.78410-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ect9Akh41fUzqe14us1_5hUK3AHCz5r3
X-Proofpoint-GUID: J7HBD05iZrol3JaljVACxmr1jLRiIPEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_07,2024-05-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405100077
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

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Acked-by: Naveen N Rao <naveen@kernel.org>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
v7 -> v8:
1. Use per_cpu vars instead of paca members.
2. Fix build error for powernv config.

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

 arch/powerpc/include/asm/kvm_book3s_64.h |  6 ++
 arch/powerpc/include/asm/lppaca.h        | 11 +++-
 arch/powerpc/kvm/book3s_hv.c             |  4 ++
 arch/powerpc/kvm/book3s_hv_nestedv2.c    | 80 ++++++++++++++++++++++++
 arch/powerpc/kvm/trace_hv.h              | 31 +++++++++
 5 files changed, 129 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index d8729ec81ca0..083f93881cbb 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -684,6 +684,12 @@ int kvmhv_nestedv2_set_ptbl_entry(unsigned long lpid, u64 dw0, u64 dw1);
 int kvmhv_nestedv2_parse_output(struct kvm_vcpu *vcpu);
 int kvmhv_nestedv2_set_vpa(struct kvm_vcpu *vcpu, unsigned long vpa);
 
+int kvmhv_get_l2_counters_status(void);
+void kvmhv_set_l2_counters_status(int cpu, bool status);
+int kmvhv_counters_tracepoint_regfunc(void);
+void kmvhv_counters_tracepoint_unregfunc(void);
+void do_trace_nested_cs_time(struct kvm_vcpu *vcpu);
+
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
 #endif /* __ASM_KVM_BOOK3S_64_H__ */
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
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8e86eb577eb8..2f49b3a5a4c0 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4156,6 +4156,10 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	timer_rearm_host_dec(*tb);
 
+	/* Record context switch and guest_run_time data */
+	if (kvmhv_get_l2_counters_status())
+		do_trace_nested_cs_time(vcpu);
+
 	return trap;
 }
 
diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
index 8e6f5355f08b..0a99ca137f7a 100644
--- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
+++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
@@ -1037,3 +1037,83 @@ void kvmhv_nestedv2_vcpu_free(struct kvm_vcpu *vcpu,
 	kvmhv_nestedv2_host_free(vcpu, io);
 }
 EXPORT_SYMBOL_GPL(kvmhv_nestedv2_vcpu_free);
+
+/* Helper functions for reading L2's stats from L1's VPA */
+
+#ifdef CONFIG_PPC_PSERIES
+
+static DEFINE_PER_CPU(u64, l1_to_l2_cs);
+static DEFINE_PER_CPU(u64, l2_to_l1_cs);
+static DEFINE_PER_CPU(u64, l2_runtime_agg);
+
+int kvmhv_get_l2_counters_status(void)
+{
+	return firmware_has_feature(FW_FEATURE_LPAR) &&
+		get_lppaca()->l2_counters_enable;
+}
+EXPORT_SYMBOL_GPL(kvmhv_get_l2_counters_status);
+
+void kvmhv_set_l2_counters_status(int cpu, bool status)
+{
+	if (!firmware_has_feature(FW_FEATURE_LPAR))
+		return;
+	if (status)
+		lppaca_of(cpu).l2_counters_enable = 1;
+	else
+		lppaca_of(cpu).l2_counters_enable = 0;
+}
+EXPORT_SYMBOL_GPL(kvmhv_set_l2_counters_status);
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
+EXPORT_SYMBOL_GPL(kmvhv_counters_tracepoint_regfunc);
+
+void kmvhv_counters_tracepoint_unregfunc(void)
+{
+	int cpu;
+
+	for_each_present_cpu(cpu) {
+		kvmhv_set_l2_counters_status(cpu, false);
+	}
+}
+EXPORT_SYMBOL_GPL(kmvhv_counters_tracepoint_unregfunc);
+
+void do_trace_nested_cs_time(struct kvm_vcpu *vcpu)
+{
+	struct lppaca *lp = get_lppaca();
+	u64 l1_to_l2_ns, l2_to_l1_ns, l2_runtime_ns;
+	u64 *l1_to_l2_cs_ptr = this_cpu_ptr(&l1_to_l2_cs);
+	u64 *l2_to_l1_cs_ptr = this_cpu_ptr(&l2_to_l1_cs);
+	u64 *l2_runtime_agg_ptr = this_cpu_ptr(&l2_runtime_agg);
+
+	l1_to_l2_ns = tb_to_ns(be64_to_cpu(lp->l1_to_l2_cs_tb));
+	l2_to_l1_ns = tb_to_ns(be64_to_cpu(lp->l2_to_l1_cs_tb));
+	l2_runtime_ns = tb_to_ns(be64_to_cpu(lp->l2_runtime_tb));
+	trace_kvmppc_vcpu_stats(vcpu, l1_to_l2_ns - *l1_to_l2_cs_ptr,
+					l2_to_l1_ns - *l2_to_l1_cs_ptr,
+					l2_runtime_ns - *l2_runtime_agg_ptr);
+	*l1_to_l2_cs_ptr = l1_to_l2_ns;
+	*l2_to_l1_cs_ptr = l2_to_l1_ns;
+	*l2_runtime_agg_ptr = l2_runtime_ns;
+}
+EXPORT_SYMBOL_GPL(do_trace_nested_cs_time);
+
+#else
+int kvmhv_get_l2_counters_status(void)
+{
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvmhv_get_l2_counters_status);
+
+void do_trace_nested_cs_time(struct kvm_vcpu *vcpu)
+{
+}
+EXPORT_SYMBOL_GPL(do_trace_nested_cs_time);
+#endif
diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
index 8d57c8428531..1e3213a66702 100644
--- a/arch/powerpc/kvm/trace_hv.h
+++ b/arch/powerpc/kvm/trace_hv.h
@@ -512,6 +512,37 @@ TRACE_EVENT(kvmppc_run_vcpu_exit,
 			__entry->vcpu_id, __entry->exit, __entry->ret)
 );
 
+#ifdef CONFIG_PPC_PSERIES
+int kmvhv_counters_tracepoint_regfunc(void);
+void kmvhv_counters_tracepoint_unregfunc(void);
+
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
+#endif
 #endif /* _TRACE_KVM_HV_H */
 
 /* This part must be outside protection */
-- 
2.45.0

