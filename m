Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 205DD3514AA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 14:00:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB1wn0y93z3bv1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 23:00:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BsxzZoue;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BsxzZoue; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB1vY1Ftnz2yqC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 22:59:52 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 131BYF8M029489; Thu, 1 Apr 2021 07:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mhozAGGP29s7EkW6wcrYpYvfVGvknqmTMIuti+62z0s=;
 b=BsxzZoueDxt8C1TPnKYVFbKznUWVOvLYJFVuNc9sv+1PCAA6JP9ztCSmtJhwjz02eqF8
 Gi/QDcYDA2f3zVbTTiAi1gHXuT67exzGauoPqcJsteVGITxnnOZp+NOCJAj6lB+GXqku
 S4DilCRPc6F8zXjcvx/QR6lHE3kueViV5MVsgFyWBl5Jb+nv8o8RU94fZ6mnTfQK2DH9
 CIJXOLR0uZNDKXeCMoEIqp5ifahp+4PE9IzkNXhkND4gD0BxvaJkbf5PK6uCnTjbuoOT
 7sodczQCXoucRPPEWcdOsDyOfgq04rdxJur2WpejfZ0QCZVxzyULLG42Bw5JLblKrSlF LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ncbxts7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 07:59:44 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 131BZHwe035011;
 Thu, 1 Apr 2021 07:59:44 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ncbxts75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 07:59:44 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 131BvOeY012247;
 Thu, 1 Apr 2021 11:59:42 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 37n29c88ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 11:59:42 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 131BxKkG29491590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Apr 2021 11:59:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E11FD4204C;
 Thu,  1 Apr 2021 11:59:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CD084205F;
 Thu,  1 Apr 2021 11:59:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.32.50])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Apr 2021 11:59:36 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 1/2] KVM:PPC: Add new hcall to provide hint if a vcpu task will
 be scheduled instantly.
Date: Thu,  1 Apr 2021 17:29:21 +0530
Message-Id: <20210401115922.1524705-2-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210401115922.1524705-1-parth@linux.ibm.com>
References: <20210401115922.1524705-1-parth@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5cGdkdjRcf1eYRFrRHJQWplmCGlJ_Y0Y
X-Proofpoint-GUID: 2aEqlhGQtoY30oXR-0mP1KMkf798V1aj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_04:2021-03-31,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010082
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, srikar@linux.vnet.ibm.com,
 npiggin@gmail.com, paulus@samba.org, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

H_IDLE_HINT is a new hcall introduced to provide a hint to the guestOS
indicating if a given vCPU can be scheduled instantly or not.

The task scheduler generally prefers previous cpu of a task if it is
available_idle. So if a prev_cpu of the corresponding vCPU task_struct is
found to be available_idle or sched_idle then hint guestOS that the given
vCPU can be scheduled instantly by the hypervisor.

Signed-off-by: Parth Shah <parth@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h |  3 ++-
 arch/powerpc/kvm/book3s_hv.c      | 13 +++++++++++++
 arch/powerpc/kvm/trace_hv.h       |  1 +
 include/linux/kvm_host.h          |  1 +
 include/linux/sched.h             |  1 +
 kernel/sched/core.c               | 13 +++++++++++++
 kernel/sched/fair.c               | 12 ++++++++++++
 kernel/sched/sched.h              |  1 +
 virt/kvm/kvm_main.c               | 17 +++++++++++++++++
 9 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index c98f5141e3fc..c91e27840c03 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -315,7 +315,8 @@
 #define H_SCM_HEALTH            0x400
 #define H_SCM_PERFORMANCE_STATS 0x418
 #define H_RPT_INVALIDATE	0x448
-#define MAX_HCALL_OPCODE	H_RPT_INVALIDATE
+#define H_IDLE_HINT		0x44C
+#define MAX_HCALL_OPCODE	H_IDLE_HINT
 
 /* Scope args for H_SCM_UNBIND_ALL */
 #define H_UNBIND_SCOPE_ALL (0x1)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6f612d240392..0472b8a1302f 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -931,6 +931,17 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 		if (tvcpu->arch.ceded)
 			kvmppc_fast_vcpu_kick_hv(tvcpu);
 		break;
+	case H_IDLE_HINT:
+		target = kvmppc_get_gpr(vcpu, 4);
+		tvcpu = kvmppc_find_vcpu(vcpu->kvm, target);
+		if (!tvcpu) {
+			ret = H_PARAMETER;
+			break;
+		}
+		ret = kvm_vcpu_provide_idle_hint(tvcpu);
+		kvmppc_set_gpr(vcpu, 4, ret);
+		ret = H_SUCCESS;
+		break;
 	case H_CONFER:
 		target = kvmppc_get_gpr(vcpu, 4);
 		if (target == -1)
@@ -1145,6 +1156,7 @@ static int kvmppc_hcall_impl_hv(unsigned long cmd)
 	case H_CEDE:
 	case H_PROD:
 	case H_CONFER:
+	case H_IDLE_HINT:
 	case H_REGISTER_VPA:
 	case H_SET_MODE:
 	case H_LOGICAL_CI_LOAD:
@@ -5359,6 +5371,7 @@ static unsigned int default_hcall_list[] = {
 	H_PROD,
 	H_CONFER,
 	H_REGISTER_VPA,
+	H_IDLE_HINT,
 #ifdef CONFIG_KVM_XICS
 	H_EOI,
 	H_CPPR,
diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
index 830a126e095d..d0302a917eaf 100644
--- a/arch/powerpc/kvm/trace_hv.h
+++ b/arch/powerpc/kvm/trace_hv.h
@@ -46,6 +46,7 @@
 	{H_CEDE,			"H_CEDE"}, \
 	{H_CONFER,			"H_CONFER"}, \
 	{H_PROD,			"H_PROD"}, \
+	{H_IDLE_HINT,			"H_IDLE_HINT"}, \
 	{H_GET_PPP,			"H_GET_PPP"}, \
 	{H_SET_PPP,			"H_SET_PPP"}, \
 	{H_PURR,			"H_PURR"}, \
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f3b1013fb22c..78fb0465cd65 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -843,6 +843,7 @@ bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu);
 void kvm_vcpu_kick(struct kvm_vcpu *vcpu);
 int kvm_vcpu_yield_to(struct kvm_vcpu *target);
 void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool usermode_vcpu_not_eligible);
+unsigned long kvm_vcpu_provide_idle_hint(struct kvm_vcpu *target);
 
 void kvm_flush_remote_tlbs(struct kvm *kvm);
 void kvm_reload_remote_mmus(struct kvm *kvm);
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 6e3a5eeec509..3dea2a4ff58d 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1688,6 +1688,7 @@ static inline int set_cpus_allowed_ptr(struct task_struct *p, const struct cpuma
 extern int yield_to(struct task_struct *p, bool preempt);
 extern void set_user_nice(struct task_struct *p, long nice);
 extern int task_prio(const struct task_struct *p);
+extern unsigned long get_idle_hint(struct task_struct *p);
 
 /**
  * task_nice - return the nice value of a given task.
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ff74fca39ed2..2962bf97ab13 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6812,6 +6812,19 @@ int __sched yield_to(struct task_struct *p, bool preempt)
 }
 EXPORT_SYMBOL_GPL(yield_to);
 
+/*
+ * Provide hint to the VM indicating if the previous vCPU can be scheduled
+ * instantly or not.
+ */
+unsigned long __sched get_idle_hint(struct task_struct *p)
+{
+	unsigned long ret = 0;
+	if (p->sched_class->get_idle_hint)
+		ret = p->sched_class->get_idle_hint(p);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(get_idle_hint);
+
 int io_schedule_prepare(void)
 {
 	int old_iowait = current->in_iowait;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 04a3ce20da67..16701a3da5dc 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7236,6 +7236,16 @@ static bool yield_to_task_fair(struct rq *rq, struct task_struct *p)
 	return true;
 }
 
+static unsigned long get_idle_hint_fair(struct task_struct *p)
+{
+	unsigned int prev_cpu = task_cpu(p);
+
+	if (available_idle_cpu(prev_cpu) || sched_idle_cpu(prev_cpu))
+		return 1;
+
+	return 0;
+}
+
 #ifdef CONFIG_SMP
 /**************************************************
  * Fair scheduling class load-balancing methods.
@@ -11264,6 +11274,8 @@ DEFINE_SCHED_CLASS(fair) = {
 	.task_change_group	= task_change_group_fair,
 #endif
 
+	.get_idle_hint		= get_idle_hint_fair,
+
 #ifdef CONFIG_UCLAMP_TASK
 	.uclamp_enabled		= 1,
 #endif
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index bb09988451a0..09b1e35d8331 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1871,6 +1871,7 @@ struct sched_class {
 #ifdef CONFIG_FAIR_GROUP_SCHED
 	void (*task_change_group)(struct task_struct *p, int type);
 #endif
+	unsigned long (*get_idle_hint)(struct task_struct *p);
 };
 
 static inline void put_prev_task(struct rq *rq, struct task_struct *prev)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8367d88ce39b..5d750ae2fe0a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2907,6 +2907,23 @@ int kvm_vcpu_yield_to(struct kvm_vcpu *target)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_yield_to);
 
+unsigned long kvm_vcpu_provide_idle_hint(struct kvm_vcpu *target)
+{
+	struct pid *pid;
+	struct task_struct *task = NULL;
+
+	rcu_read_lock();
+	pid = rcu_dereference(target->pid);
+	if (pid)
+		task = get_pid_task(pid, PIDTYPE_PID);
+	rcu_read_unlock();
+	if (!task)
+		return 0;
+
+	return get_idle_hint(task);
+}
+EXPORT_SYMBOL_GPL(kvm_vcpu_provide_idle_hint);
+
 /*
  * Helper that checks whether a VCPU is eligible for directed yield.
  * Most eligible candidate to yield is decided by following heuristics:
-- 
2.26.2

