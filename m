Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B2A4536E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 17:06:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtrXZ38mqz3dgS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 03:06:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtrTr20bFz2yNC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 03:04:16 +1100 (AEDT)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D593061AA5;
 Tue, 16 Nov 2021 16:04:14 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mn0wP-005sTB-06; Tue, 16 Nov 2021 16:04:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 5/7] KVM: Convert the kvm->vcpus array to a xarray
Date: Tue, 16 Nov 2021 16:04:01 +0000
Message-Id: <20211116160403.4074052-6-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116160403.4074052-1-maz@kernel.org>
References: <20211116160403.4074052-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org,
 pbonzini@redhat.com, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com,
 anup.patel@wdc.com, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, imbrenda@linux.ibm.com, jgross@suse.com, npiggin@gmail.com,
 seanjc@google.com, paulus@samba.org, mpe@ellerman.id.au, f4bug@amsat.org,
 james.morse@arm.com, suzuki.poulose@arm.com, alexandru.elisei@arm.com,
 kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Juergen Gross <jgross@suse.com>, Huacai Chen <chenhuacai@kernel.org>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Anup Patel <anup.patel@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@samba.org>, James Morse <james.morse@arm.com>,
 kernel-team@android.com, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At least on arm64 and x86, the vcpus array is pretty huge (up to
1024 entries on x86) and is mostly empty in the majority of the cases
(running 1k vcpu VMs is not that common).

This mean that we end-up with a 4kB block of unused memory in the
middle of the kvm structure.

Instead of wasting away this memory, let's use an xarray instead,
which gives us almost the same flexibility as a normal array, but
with a reduced memory usage with smaller VMs.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/kvm_host.h |  5 +++--
 virt/kvm/kvm_main.c      | 15 +++++++++------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9a8c997ff9bc..df1b2b183d94 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -29,6 +29,7 @@
 #include <linux/refcount.h>
 #include <linux/nospec.h>
 #include <linux/notifier.h>
+#include <linux/xarray.h>
 #include <asm/signal.h>
 
 #include <linux/kvm.h>
@@ -552,7 +553,7 @@ struct kvm {
 	struct mutex slots_arch_lock;
 	struct mm_struct *mm; /* userspace tied to this vm */
 	struct kvm_memslots __rcu *memslots[KVM_ADDRESS_SPACE_NUM];
-	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
+	struct xarray vcpu_array;
 
 	/* Used to wait for completion of MMU notifiers.  */
 	spinlock_t mn_invalidate_lock;
@@ -701,7 +702,7 @@ static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
 
 	/* Pairs with smp_wmb() in kvm_vm_ioctl_create_vcpu.  */
 	smp_rmb();
-	return kvm->vcpus[i];
+	return xa_load(&kvm->vcpu_array, i);
 }
 
 #define kvm_for_each_vcpu(idx, vcpup, kvm) \
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 73811c3829a2..9a7bce944427 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -458,7 +458,7 @@ void kvm_destroy_vcpus(struct kvm *kvm)
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		kvm_vcpu_destroy(vcpu);
-		kvm->vcpus[i] = NULL;
+		xa_erase(&kvm->vcpu_array, i);
 	}
 
 	atomic_set(&kvm->online_vcpus, 0);
@@ -1063,6 +1063,7 @@ static struct kvm *kvm_create_vm(unsigned long type)
 	mutex_init(&kvm->slots_arch_lock);
 	spin_lock_init(&kvm->mn_invalidate_lock);
 	rcuwait_init(&kvm->mn_memslots_update_rcuwait);
+	xa_init(&kvm->vcpu_array);
 
 	INIT_LIST_HEAD(&kvm->devices);
 
@@ -3658,7 +3659,10 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, u32 id)
 	}
 
 	vcpu->vcpu_idx = atomic_read(&kvm->online_vcpus);
-	BUG_ON(kvm->vcpus[vcpu->vcpu_idx]);
+	r = xa_insert(&kvm->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
+	BUG_ON(r == -EBUSY);
+	if (r)
+		goto unlock_vcpu_destroy;
 
 	/* Fill the stats id string for the vcpu */
 	snprintf(vcpu->stats_id, sizeof(vcpu->stats_id), "kvm-%d/vcpu-%d",
@@ -3668,15 +3672,14 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, u32 id)
 	kvm_get_kvm(kvm);
 	r = create_vcpu_fd(vcpu);
 	if (r < 0) {
+		xa_erase(&kvm->vcpu_array, vcpu->vcpu_idx);
 		kvm_put_kvm_no_destroy(kvm);
 		goto unlock_vcpu_destroy;
 	}
 
-	kvm->vcpus[vcpu->vcpu_idx] = vcpu;
-
 	/*
-	 * Pairs with smp_rmb() in kvm_get_vcpu.  Write kvm->vcpus
-	 * before kvm->online_vcpu's incremented value.
+	 * Pairs with smp_rmb() in kvm_get_vcpu.  Store the vcpu
+	 * pointer before kvm->online_vcpu's incremented value.
 	 */
 	smp_wmb();
 	atomic_inc(&kvm->online_vcpus);
-- 
2.30.2

