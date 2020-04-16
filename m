Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D601AB72C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 07:21:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492ndQ4w4PzDrML
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 15:21:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57;
 helo=out30-57.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
X-Greylist: delayed 311 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Apr 2020 15:16:27 AEST
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492nWb6XDqzDrJV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 15:16:27 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04428;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0Tvg4OPB_1587013858; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0Tvg4OPB_1587013858) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 16 Apr 2020 13:10:58 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: pbonzini@redhat.com, tsbogend@alpha.franken.de, paulus@ozlabs.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 heiko.carstens@de.ibm.com, gor@linux.ibm.com,
 sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com
Subject: [PATCH v2] KVM: Optimize kvm_arch_vcpu_ioctl_run function
Date: Thu, 16 Apr 2020 13:10:57 +0800
Message-Id: <20200416051057.26526-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 16 Apr 2020 15:19:47 +1000
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
Cc: linux-s390@vger.kernel.org, tianjia.zhang@linux.alibaba.com,
 kvm@vger.kernel.org, linux-mips@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In earlier versions of kvm, 'kvm_run' is an independent structure
and is not included in the vcpu structure. At present, 'kvm_run'
is already included in the vcpu structure, so the parameter
'kvm_run' is redundant.

This patch simplify the function definition, removes the extra
'kvm_run' parameter, and extract it from the 'kvm_vcpu' structure
if necessary.

Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---

v2 change:
  remove 'kvm_run' parameter and extract it from 'kvm_vcpu'

 arch/mips/kvm/mips.c       |  3 ++-
 arch/powerpc/kvm/powerpc.c |  3 ++-
 arch/s390/kvm/kvm-s390.c   |  3 ++-
 arch/x86/kvm/x86.c         | 11 ++++++-----
 include/linux/kvm_host.h   |  2 +-
 virt/kvm/arm/arm.c         |  6 +++---
 virt/kvm/kvm_main.c        |  2 +-
 7 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 8f05dd0a0f4e..ec24adf4857e 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -439,8 +439,9 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 	return -ENOIOCTLCMD;
 }
 
-int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
+int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	int r = -EINTR;
 
 	vcpu_load(vcpu);
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index e15166b0a16d..7e24691e138a 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1764,8 +1764,9 @@ int kvm_vcpu_ioctl_set_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
 	return r;
 }
 
-int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
+int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	int r;
 
 	vcpu_load(vcpu);
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 19a81024fe16..443af3ead739 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -4333,8 +4333,9 @@ static void store_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
 		store_regs_fmt2(vcpu, kvm_run);
 }
 
-int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
+int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *kvm_run = vcpu->run;
 	int rc;
 
 	if (kvm_run->immediate_exit)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 3bf2ecafd027..a0338e86c90f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8707,8 +8707,9 @@ static void kvm_put_guest_fpu(struct kvm_vcpu *vcpu)
 	trace_kvm_fpu(0);
 }
 
-int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
+int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *kvm_run = vcpu->run;
 	int r;
 
 	vcpu_load(vcpu);
@@ -8726,18 +8727,18 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
 		r = -EAGAIN;
 		if (signal_pending(current)) {
 			r = -EINTR;
-			vcpu->run->exit_reason = KVM_EXIT_INTR;
+			kvm_run->exit_reason = KVM_EXIT_INTR;
 			++vcpu->stat.signal_exits;
 		}
 		goto out;
 	}
 
-	if (vcpu->run->kvm_valid_regs & ~KVM_SYNC_X86_VALID_FIELDS) {
+	if (kvm_run->kvm_valid_regs & ~KVM_SYNC_X86_VALID_FIELDS) {
 		r = -EINVAL;
 		goto out;
 	}
 
-	if (vcpu->run->kvm_dirty_regs) {
+	if (kvm_run->kvm_dirty_regs) {
 		r = sync_regs(vcpu);
 		if (r != 0)
 			goto out;
@@ -8767,7 +8768,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
 
 out:
 	kvm_put_guest_fpu(vcpu);
-	if (vcpu->run->kvm_valid_regs)
+	if (kvm_run->kvm_valid_regs)
 		store_regs(vcpu);
 	post_kvm_run_save(vcpu);
 	kvm_sigset_deactivate(vcpu);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6d58beb65454..1e17ef719595 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -866,7 +866,7 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 				    struct kvm_mp_state *mp_state);
 int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 					struct kvm_guest_debug *dbg);
-int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run);
+int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
 
 int kvm_arch_init(void *opaque);
 void kvm_arch_exit(void);
diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
index 48d0ec44ad77..f5390ac2165b 100644
--- a/virt/kvm/arm/arm.c
+++ b/virt/kvm/arm/arm.c
@@ -639,7 +639,6 @@ static void check_vcpu_requests(struct kvm_vcpu *vcpu)
 /**
  * kvm_arch_vcpu_ioctl_run - the main VCPU run function to execute guest code
  * @vcpu:	The VCPU pointer
- * @run:	The kvm_run structure pointer used for userspace state exchange
  *
  * This function is called through the VCPU_RUN ioctl called from user space. It
  * will execute VM code in a loop until the time slice for the process is used
@@ -647,8 +646,9 @@ static void check_vcpu_requests(struct kvm_vcpu *vcpu)
  * return with return value 0 and with the kvm_run structure filled in with the
  * required data for the requested emulation.
  */
-int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
+int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 {
+	struct kvm_run *run = vcpu->run;
 	int ret;
 
 	if (unlikely(!kvm_vcpu_initialized(vcpu)))
@@ -659,7 +659,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
 		return ret;
 
 	if (run->exit_reason == KVM_EXIT_MMIO) {
-		ret = kvm_handle_mmio_return(vcpu, vcpu->run);
+		ret = kvm_handle_mmio_return(vcpu, run);
 		if (ret)
 			return ret;
 	}
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 74bdb7bf3295..e18faea89146 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3135,7 +3135,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 				synchronize_rcu();
 			put_pid(oldpid);
 		}
-		r = kvm_arch_vcpu_ioctl_run(vcpu, vcpu->run);
+		r = kvm_arch_vcpu_ioctl_run(vcpu);
 		trace_kvm_userspace_exit(vcpu->run->exit_reason, r);
 		break;
 	}
-- 
2.17.1

