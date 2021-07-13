Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470CA3C69B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 07:25:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP8HM389Rz3blT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 15:25:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DcXEnHM8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DcXEnHM8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP8GF5KTcz2yNZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 15:24:53 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16D54GkU062583; Tue, 13 Jul 2021 01:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rVgni9StortTZXRWrd8xM1wdZuWSy6UI/QQyrSbYZLI=;
 b=DcXEnHM8nM52Cb6ev1HvlaAqOS+IuyAYrnwo62vFk2/rPOuoUSFXpqa+tZTS4dj5hjxq
 j50zQgCI+O4HXlIg6gHqmHPYoWkqY8Yt66EXhPcEIaKyJ37NnYIZg6Qj8UqVpOsuBqOQ
 oNeEqUj49up8qwqRPi9JbFpIoU9zcT5Kh0KQLmok3x4eff04JBXKy+zcf+XWNtDKAOl6
 NAo964dBhFfCTGP2qmr2Prmny4HJUe1yQdKMFEttMatN3LunvqiriPSbCuvveuG2DDLS
 vr6uiBFuZOl6+63tgAAegoQs2iC4F0D55Wz07SVxxvwurnEdxNZeJoYW8bhwnJw87ivT bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs3bqq66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:24:46 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16D56XSn069155;
 Tue, 13 Jul 2021 01:24:46 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39qs3bqq4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:24:46 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16D5Oimc015497;
 Tue, 13 Jul 2021 05:24:44 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 39s3p780e6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 05:24:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16D5OgTI28639568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 05:24:42 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 017104C046;
 Tue, 13 Jul 2021 05:24:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 698ED4C04E;
 Tue, 13 Jul 2021 05:24:39 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.18.200])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 05:24:39 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 1/2] powerpc/book3s_hv: Add new idle-hint attribute in VPA region
Date: Tue, 13 Jul 2021 10:54:32 +0530
Message-Id: <20210713052433.257003-2-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210713052433.257003-1-parth@linux.ibm.com>
References: <20210713052433.257003-1-parth@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fnIQ02gnzoSz23RRV73oZNL7NaWOu_Kh
X-Proofpoint-ORIG-GUID: fvr0rah-xX68hXKfioGyCLlsRiPsSI1q
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_03:2021-07-13,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130022
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
 parths1229@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In lppaca region, add a new attribute idle_hint which can allow guest scheduler for
better cpu selection. Hypervisor can update idle_hint attribute based on
the prediction that if vCPU needs to be scheduled then can it be scheduled
instantly or not.

Signed-off-by: Parth Shah <parth@linux.ibm.com>
---
 arch/powerpc/include/asm/idle_hint.h | 28 +++++++++++++++++++++++
 arch/powerpc/include/asm/lppaca.h    |  3 ++-
 arch/powerpc/kvm/book3s.h            |  2 ++
 arch/powerpc/kvm/book3s_hv.c         | 34 ++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/idle_hint.h

diff --git a/arch/powerpc/include/asm/idle_hint.h b/arch/powerpc/include/asm/idle_hint.h
new file mode 100644
index 000000000000..165d65c0275b
--- /dev/null
+++ b/arch/powerpc/include/asm/idle_hint.h
@@ -0,0 +1,28 @@
+#ifndef _ASM_POWERPC_IDLEHINT_H
+#define _ASM_POWERPC_IDLEHINT_H
+
+#include <linux/kvm_host.h>
+
+extern void kvmppc_idle_hint_set(struct kvm_vcpu *vcpu, int idle_hint);
+
+extern int idle_hint_is_active;
+
+extern void set_idle_hint(int cpu, int value);
+
+static inline int prev_cpu_of_kvm(struct kvm_vcpu *vcpu)
+{
+	struct pid *pid;
+	struct task_struct *task = NULL;
+
+	rcu_read_lock();
+	pid = rcu_dereference(vcpu->pid);
+	if (pid)
+		task = get_pid_task(pid, PIDTYPE_PID);
+	rcu_read_unlock();
+
+	if (!task)
+		return -1;
+
+	return task_cpu(task);
+}
+#endif
diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index c390ec377bae..ee790a566036 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -111,7 +111,8 @@ struct lppaca {
 	__be32	page_ins;		/* CMO Hint - # page ins by OS */
 	u8	reserved11[148];
 	volatile __be64 dtl_idx;	/* Dispatch Trace Log head index */
-	u8	reserved12[96];
+	volatile __be32 idle_hint;	/* Can vCPU be scheduled instantly? */
+	u8	reserved12[92];
 } ____cacheline_aligned;
 
 #define lppaca_of(cpu)	(*paca_ptrs[cpu]->lppaca_ptr)
diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
index 740e51def5a5..61b0741c139a 100644
--- a/arch/powerpc/kvm/book3s.h
+++ b/arch/powerpc/kvm/book3s.h
@@ -7,6 +7,8 @@
 #ifndef __POWERPC_KVM_BOOK3S_H__
 #define __POWERPC_KVM_BOOK3S_H__
 
+#include <asm/idle_hint.h>
+
 extern void kvmppc_core_flush_memslot_hv(struct kvm *kvm,
 					 struct kvm_memory_slot *memslot);
 extern bool kvm_unmap_gfn_range_hv(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index bc0813644666..c008be20294d 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -447,6 +447,7 @@ static void init_vpa(struct kvm_vcpu *vcpu, struct lppaca *vpa)
 {
 	vpa->__old_status |= LPPACA_OLD_SHARED_PROC;
 	vpa->yield_count = cpu_to_be32(1);
+	vpa->idle_hint = cpu_to_be32(0);
 }
 
 static int set_vpa(struct kvm_vcpu *vcpu, struct kvmppc_vpa *v,
@@ -911,6 +912,17 @@ static int kvm_arch_vcpu_yield_to(struct kvm_vcpu *target)
 	return kvm_vcpu_yield_to(target);
 }
 
+void kvmppc_idle_hint_set(struct kvm_vcpu *vcpu, int idle_hint)
+{
+	struct lppaca *lppaca;
+
+	if (!vcpu) return;
+
+	lppaca = (struct lppaca *)vcpu->arch.vpa.pinned_addr;
+	if (lppaca)
+		lppaca->idle_hint = cpu_to_be32(idle_hint);
+}
+
 static int kvmppc_get_yield_count(struct kvm_vcpu *vcpu)
 {
 	int yield_count = 0;
@@ -2803,6 +2815,28 @@ static int on_primary_thread(void)
 	return 1;
 }
 
+void set_idle_hint_for_kvm(struct kvm *kvm, int cpu, int value)
+{
+	int i;
+	struct kvm_vcpu *vcpu;
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		if (cpu == prev_cpu_of_kvm(vcpu)) {
+			kvmppc_idle_hint_set(vcpu, value);
+		}
+	}
+}
+
+void set_idle_hint(int cpu, int value)
+{
+	struct kvm *kvm;
+	struct kvm *tmp;
+
+	list_for_each_entry_safe(kvm, tmp, &vm_list, vm_list) {
+		set_idle_hint_for_kvm(kvm, cpu, value);
+	}
+}
+
 /*
  * A list of virtual cores for each physical CPU.
  * These are vcores that could run but their runner VCPU tasks are
-- 
2.26.3

