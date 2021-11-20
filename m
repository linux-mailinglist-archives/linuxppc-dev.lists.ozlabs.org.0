Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FCA457D0E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 11:34:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hx8zF3tC8z3clS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 21:34:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ELWsUjnj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=desiato.srs.infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=batv+a034db1df2736406f323+6663+infradead.org+dwmw2@desiato.srs.infradead.org;
 receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hx8sV5F7pz2ygB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 21:29:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GvZsOWYUtDU9vFIuOYzAFyyQt31D73DjNFQebbB3268=; b=ELWsUjnj89JarU3iv5XxLQxFNj
 ytgBDJS/WAKGYFL3Y1Ra7B7r2YO/jWi8sB73pKR/NWTkJN05U6Kj9xIsyPmhJ1ac6Zsj20nRDRPjw
 u01ZB/I2vSrjcdm08JVlVfO1IhOiHuF1mjSjLBa+WWHYda7EFjaC7s3YN8ixrprdRoymp5ovLLPw4
 k7AyZquBsHpk6qfoB9tcC8T3LlsSLwCpQL99vK9NBX2D5baZrdWbrUCn8ZfOIiV07nnGuNHYnMK2e
 vmJI5PllBQpLBf3DzsQY/J8uTUUHim0CVGygzQQZ+ZMu2ZC4aGeI8riCvPFjqC0FigvsijKKbt7H0
 3hE+1flg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moNbR-00H55w-I1; Sat, 20 Nov 2021 10:28:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1moNbQ-0002KW-W3; Sat, 20 Nov 2021 10:28:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	kvm <kvm@vger.kernel.org>
Subject: [PATCH v4 10/11] KVM: x86/xen: Add KVM_IRQ_ROUTING_XEN_EVTCHN and
 event channel delivery
Date: Sat, 20 Nov 2021 10:28:09 +0000
Message-Id: <20211120102810.8858-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211120102810.8858-1-dwmw2@infradead.org>
References: <20211120102810.8858-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Woodhouse <dwmw@amazon.co.uk>

This adds basic support for delivering 2 level event channels to a guest.

Initially, it only supports delivery via the IRQ routing table, triggered
by an eventfd. In order to do so, it has a kvm_xen_set_evtchn_fast()
function which will use the pre-mapped shared_info page if it already
exists and is still valid, while the slow path through the irqfd_inject
workqueue will remap the shared_info page if necessary.

It sets the bits in the shared_info page but not the vcpu_info; that is
deferred to __kvm_xen_has_interrupt() which raises the vector to the
appropriate vCPU.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 Documentation/virt/kvm/api.rst                |  21 ++
 arch/x86/include/asm/kvm_host.h               |   1 +
 arch/x86/kvm/irq_comm.c                       |  12 +
 arch/x86/kvm/x86.c                            |   3 +-
 arch/x86/kvm/xen.c                            | 262 +++++++++++++++++-
 arch/x86/kvm/xen.h                            |   9 +
 include/linux/kvm_host.h                      |   7 +
 include/uapi/linux/kvm.h                      |  11 +
 .../selftests/kvm/x86_64/xen_shinfo_test.c    | 112 +++++++-
 9 files changed, 431 insertions(+), 7 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 455664c39d42..ec4d693851a2 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -1799,6 +1799,7 @@ No flags are specified so far, the corresponding field must be set to zero.
 		struct kvm_irq_routing_msi msi;
 		struct kvm_irq_routing_s390_adapter adapter;
 		struct kvm_irq_routing_hv_sint hv_sint;
+		struct kvm_irq_routing_xen_evtchn xen_evtchn;
 		__u32 pad[8];
 	} u;
   };
@@ -1808,6 +1809,7 @@ No flags are specified so far, the corresponding field must be set to zero.
   #define KVM_IRQ_ROUTING_MSI 2
   #define KVM_IRQ_ROUTING_S390_ADAPTER 3
   #define KVM_IRQ_ROUTING_HV_SINT 4
+  #define KVM_IRQ_ROUTING_XEN_EVTCHN 5
 
 flags:
 
@@ -1859,6 +1861,20 @@ address_hi must be zero.
 	__u32 sint;
   };
 
+  struct kvm_irq_routing_xen_evtchn {
+	__u32 port;
+	__u32 vcpu;
+	__u32 priority;
+  };
+
+
+When KVM_CAP_XEN_HVM includes the KVM_XEN_HVM_CONFIG_EVTCHN_2LEVEL bit
+in its indication of supported features, routing to Xen event channels
+is supported. Although the priority field is present, only the value
+KVM_XEN_HVM_CONFIG_EVTCHN_2LEVEL is supported, which means delivery by
+2 level event channels. FIFO event channel support may be added in
+the future.
+
 
 4.55 KVM_SET_TSC_KHZ
 --------------------
@@ -7413,6 +7429,7 @@ PVHVM guests. Valid flags are::
   #define KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL	(1 << 1)
   #define KVM_XEN_HVM_CONFIG_SHARED_INFO	(1 << 2)
   #define KVM_XEN_HVM_CONFIG_RUNSTATE		(1 << 2)
+  #define KVM_XEN_HVM_CONFIG_EVTCHN_2LEVEL	(1 << 3)
 
 The KVM_XEN_HVM_CONFIG_HYPERCALL_MSR flag indicates that the KVM_XEN_HVM_CONFIG
 ioctl is available, for the guest to set its hypercall page.
@@ -7432,6 +7449,10 @@ The KVM_XEN_HVM_CONFIG_RUNSTATE flag indicates that the runstate-related
 features KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR/_CURRENT/_DATA/_ADJUST are
 supported by the KVM_XEN_VCPU_SET_ATTR/KVM_XEN_VCPU_GET_ATTR ioctls.
 
+The KVM_XEN_HVM_CONFIG_EVTCHN_2LEVEL flag indicates that IRQ routing entries
+of the type KVM_IRQ_ROUTING_XEN_EVTCHN are supported, with the priority
+field set to indicate 2 level event channel delivery.
+
 8.31 KVM_CAP_PPC_MULTITCE
 -------------------------
 
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 4b2b4ecf3b46..6ea2446ab851 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -604,6 +604,7 @@ struct kvm_vcpu_xen {
 	u64 last_steal;
 	u64 runstate_entry_time;
 	u64 runstate_times[4];
+	unsigned long evtchn_pending_sel;
 };
 
 struct kvm_vcpu_arch {
diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
index d5b72a08e566..afd2de84be60 100644
--- a/arch/x86/kvm/irq_comm.c
+++ b/arch/x86/kvm/irq_comm.c
@@ -24,6 +24,7 @@
 
 #include "hyperv.h"
 #include "x86.h"
+#include "xen.h"
 
 static int kvm_set_pic_irq(struct kvm_kernel_irq_routing_entry *e,
 			   struct kvm *kvm, int irq_source_id, int level,
@@ -175,6 +176,13 @@ int kvm_arch_set_irq_inatomic(struct kvm_kernel_irq_routing_entry *e,
 			return r;
 		break;
 
+#ifdef CONFIG_KVM_XEN
+	case KVM_IRQ_ROUTING_XEN_EVTCHN:
+		if (!level)
+			return -1;
+
+		return kvm_xen_set_evtchn_fast(e, kvm);
+#endif
 	default:
 		break;
 	}
@@ -310,6 +318,10 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->hv_sint.vcpu = ue->u.hv_sint.vcpu;
 		e->hv_sint.sint = ue->u.hv_sint.sint;
 		break;
+#ifdef CONFIG_KVM_XEN
+	case KVM_IRQ_ROUTING_XEN_EVTCHN:
+		return kvm_xen_setup_evtchn(kvm, e, ue);
+#endif
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5a403d92833f..fa56c590d8db 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4147,7 +4147,8 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_XEN_HVM:
 		r = KVM_XEN_HVM_CONFIG_HYPERCALL_MSR |
 		    KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL |
-		    KVM_XEN_HVM_CONFIG_SHARED_INFO;
+		    KVM_XEN_HVM_CONFIG_SHARED_INFO |
+		    KVM_XEN_HVM_CONFIG_EVTCHN_2LEVEL;
 		if (sched_info_on())
 			r |= KVM_XEN_HVM_CONFIG_RUNSTATE;
 		break;
diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index da4bf2c6407f..4b380d2157a9 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -16,6 +16,7 @@
 #include <trace/events/kvm.h>
 #include <xen/interface/xen.h>
 #include <xen/interface/vcpu.h>
+#include <xen/interface/event_channel.h>
 
 #include "trace.h"
 
@@ -195,6 +196,8 @@ void kvm_xen_update_runstate_guest(struct kvm_vcpu *v, int state)
 
 int __kvm_xen_has_interrupt(struct kvm_vcpu *v)
 {
+	unsigned long evtchn_pending_sel = READ_ONCE(v->arch.xen.evtchn_pending_sel);
+	bool atomic = in_atomic() || !task_is_running(current);
 	int err;
 	u8 rc = 0;
 
@@ -204,6 +207,9 @@ int __kvm_xen_has_interrupt(struct kvm_vcpu *v)
 	 */
 	struct gfn_to_hva_cache *ghc = &v->arch.xen.vcpu_info_cache;
 	struct kvm_memslots *slots = kvm_memslots(v->kvm);
+	bool ghc_valid = slots->generation == ghc->generation &&
+		!kvm_is_error_hva(ghc->hva) && ghc->memslot;
+
 	unsigned int offset = offsetof(struct vcpu_info, evtchn_upcall_pending);
 
 	/* No need for compat handling here */
@@ -219,8 +225,7 @@ int __kvm_xen_has_interrupt(struct kvm_vcpu *v)
 	 * cache in kvm_read_guest_offset_cached(), but just uses
 	 * __get_user() instead. And falls back to the slow path.
 	 */
-	if (likely(slots->generation == ghc->generation &&
-		   !kvm_is_error_hva(ghc->hva) && ghc->memslot)) {
+	if (!evtchn_pending_sel && ghc_valid) {
 		/* Fast path */
 		pagefault_disable();
 		err = __get_user(rc, (u8 __user *)ghc->hva + offset);
@@ -239,11 +244,82 @@ int __kvm_xen_has_interrupt(struct kvm_vcpu *v)
 	 * and we'll end up getting called again from a context where we *can*
 	 * fault in the page and wait for it.
 	 */
-	if (in_atomic() || !task_is_running(current))
+	if (atomic)
 		return 1;
 
-	kvm_read_guest_offset_cached(v->kvm, ghc, &rc, offset,
-				     sizeof(rc));
+	if (!ghc_valid) {
+		err = kvm_gfn_to_hva_cache_init(v->kvm, ghc, ghc->gpa, ghc->len);
+		if (err || !ghc->memslot) {
+			/*
+			 * If this failed, userspace has screwed up the
+			 * vcpu_info mapping. No interrupts for you.
+			 */
+			return 0;
+		}
+	}
+
+	/*
+	 * Now we have a valid (protected by srcu) userspace HVA in
+	 * ghc->hva which points to the struct vcpu_info. If there
+	 * are any bits in the in-kernel evtchn_pending_sel then
+	 * we need to write those to the guest vcpu_info and set
+	 * its evtchn_upcall_pending flag. If there aren't any bits
+	 * to add, we only want to *check* evtchn_upcall_pending.
+	 */
+	if (evtchn_pending_sel) {
+		bool long_mode = v->kvm->arch.xen.long_mode;
+
+		if (!user_access_begin((void *)ghc->hva, sizeof(struct vcpu_info)))
+			return 0;
+
+		if (IS_ENABLED(CONFIG_64BIT) && long_mode) {
+			struct vcpu_info __user *vi = (void *)ghc->hva;
+
+			/* Attempt to set the evtchn_pending_sel bits in the
+			 * guest, and if that succeeds then clear the same
+			 * bits in the in-kernel version. */
+			asm volatile("1:\t" LOCK_PREFIX "orq %0, %1\n"
+				     "\tnotq %0\n"
+				     "\t" LOCK_PREFIX "andq %0, %2\n"
+				     "2:\n"
+				     "\t.section .fixup,\"ax\"\n"
+				     "3:\tjmp\t2b\n"
+				     "\t.previous\n"
+				     _ASM_EXTABLE_UA(1b, 3b)
+				     : "=r" (evtchn_pending_sel),
+				       "+m" (vi->evtchn_pending_sel),
+				       "+m" (v->arch.xen.evtchn_pending_sel)
+				     : "0" (evtchn_pending_sel));
+		} else {
+			struct compat_vcpu_info __user *vi = (void *)ghc->hva;
+			u32 evtchn_pending_sel32 = evtchn_pending_sel;
+
+			/* Attempt to set the evtchn_pending_sel bits in the
+			 * guest, and if that succeeds then clear the same
+			 * bits in the in-kernel version. */
+			asm volatile("1:\t" LOCK_PREFIX "orl %0, %1\n"
+				     "\tnotl %0\n"
+				     "\t" LOCK_PREFIX "andl %0, %2\n"
+				     "2:\n"
+				     "\t.section .fixup,\"ax\"\n"
+				     "3:\tjmp\t2b\n"
+				     "\t.previous\n"
+				     _ASM_EXTABLE_UA(1b, 3b)
+				     : "=r" (evtchn_pending_sel32),
+				       "+m" (vi->evtchn_pending_sel),
+				       "+m" (v->arch.xen.evtchn_pending_sel)
+				     : "0" (evtchn_pending_sel32));
+		}
+		rc = 1;
+		unsafe_put_user(rc, (u8 __user *)ghc->hva + offset, err);
+
+	err:
+		user_access_end();
+
+		mark_page_dirty_in_slot(v->kvm, ghc->memslot, ghc->gpa >> PAGE_SHIFT);
+	} else {
+		__get_user(rc, (u8 __user *)ghc->hva + offset);
+	}
 
 	return rc;
 }
@@ -740,3 +816,179 @@ int kvm_xen_hypercall(struct kvm_vcpu *vcpu)
 
 	return 0;
 }
+
+static inline int max_evtchn_port(struct kvm *kvm)
+{
+	if (IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode)
+		return EVTCHN_2L_NR_CHANNELS;
+	else
+		return COMPAT_EVTCHN_2L_NR_CHANNELS;
+}
+
+/*
+ * This follows the kvm_set_irq() API, so it returns:
+ *  < 0   Interrupt was ignored (masked or not delivered for other reasons)
+ *  = 0   Interrupt was coalesced (previous irq is still pending)
+ *  > 0   Number of CPUs interrupt was delivered to
+ */
+int kvm_xen_set_evtchn_fast(struct kvm_kernel_irq_routing_entry *e,
+			    struct kvm *kvm)
+{
+	struct gfn_to_pfn_cache *gpc = &kvm->arch.xen.shinfo_cache;
+	struct kvm_vcpu *vcpu;
+	unsigned long *pending_bits, *mask_bits;
+	unsigned long flags;
+	int port_word_bit;
+	bool kick_vcpu = false;
+	int idx;
+	int rc;
+
+	vcpu = kvm_get_vcpu_by_id(kvm, e->xen_evtchn.vcpu);
+	if (!vcpu)
+		return -1;
+
+	if (!vcpu->arch.xen.vcpu_info_set)
+		return -1;
+
+	if (e->xen_evtchn.port >= max_evtchn_port(kvm))
+		return -1;
+
+	rc = -EWOULDBLOCK;
+	read_lock_irqsave(&gpc->lock, flags);
+
+	idx = srcu_read_lock(&kvm->srcu);
+	if (!kvm_gfn_to_pfn_cache_check(kvm, gpc, gpc->gpa, PAGE_SIZE))
+		goto out_rcu;
+
+	if (IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode) {
+		struct shared_info *shinfo = gpc->khva;
+		pending_bits = (unsigned long *)&shinfo->evtchn_pending;
+		mask_bits = (unsigned long *)&shinfo->evtchn_mask;
+		port_word_bit = e->xen_evtchn.port / 64;
+	} else {
+		struct compat_shared_info *shinfo = gpc->khva;
+		pending_bits = (unsigned long *)&shinfo->evtchn_pending;
+		mask_bits = (unsigned long *)&shinfo->evtchn_mask;
+		port_word_bit = e->xen_evtchn.port / 32;
+	}
+
+	/*
+	 * If this port wasn't already set, and if it isn't masked, then
+	 * we try to set the corresponding bit in the in-kernel shadow of
+	 * evtchn_pending_sel for the target vCPU. And if *that* wasn't
+	 * already set, then we kick the vCPU in question to write to the
+	 * *real* evtchn_pending_sel in its own guest vcpu_info struct.
+	 */
+	if (test_and_set_bit(e->xen_evtchn.port, pending_bits)) {
+		rc = 0; /* It was already raised */
+	} else if (test_bit(e->xen_evtchn.port, mask_bits)) {
+		rc = -1; /* Masked */
+	} else {
+		rc = 1; /* Delivered. But was the vCPU waking already? */
+		if (!test_and_set_bit(port_word_bit, &vcpu->arch.xen.evtchn_pending_sel))
+			kick_vcpu = true;
+	}
+
+ out_rcu:
+	srcu_read_unlock(&kvm->srcu, idx);
+	read_unlock_irqrestore(&gpc->lock, flags);
+
+	if (kick_vcpu) {
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
+		kvm_vcpu_kick(vcpu);
+	}
+
+	return rc;
+}
+
+/* This is the version called from kvm_set_irq() as the .set function */
+static int evtchn_set_fn(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
+			 int irq_source_id, int level, bool line_status)
+{
+	bool mm_borrowed = false;
+	int rc;
+
+	if (!level)
+		return -1;
+
+	rc = kvm_xen_set_evtchn_fast(e, kvm);
+	if (rc != -EWOULDBLOCK)
+		return rc;
+
+	if (current->mm != kvm->mm) {
+		/*
+		 * If not on a thread which already belongs to this KVM,
+		 * we'd better be in the irqfd workqueue.
+		 */
+		if (WARN_ON_ONCE(current->mm))
+			return -EINVAL;
+
+		kthread_use_mm(kvm->mm);
+		mm_borrowed = true;
+	}
+
+	/*
+	 * For the irqfd workqueue, using the main kvm->lock mutex is
+	 * fine since this function is invoked from kvm_set_irq() with
+	 * no other lock held, no srcu. In future if it will be called
+	 * directly from a vCPU thread (e.g. on hypercall for an IPI)
+	 * then it may need to switch to using a leaf-node mutex for
+	 * serializing the shared_info mapping.
+	 */
+	mutex_lock(&kvm->lock);
+
+	/*
+	 * It is theoretically possible for the page to be unmapped
+	 * and the MMU notifier to invalidate the shared_info before
+	 * we even get to use it. In that case, this looks like an
+	 * infinite loop. It was tempting to do it via the userspace
+	 * HVA instead... but that just *hides* the fact that it's
+	 * an infinite loop, because if a fault occurs and it waits
+	 * for the page to come back, it can *still* immediately
+	 * fault and have to wait again, repeatedly.
+	 *
+	 * Conversely, the page could also have been reinstated by
+	 * another thread before we even obtain the mutex above, so
+	 * check again *first* before remapping it.
+	 */
+	do {
+		struct gfn_to_pfn_cache *gpc = &kvm->arch.xen.shinfo_cache;
+		int idx;
+
+		rc = kvm_xen_set_evtchn_fast(e, kvm);
+		if (rc != -EWOULDBLOCK)
+			break;
+
+		idx = srcu_read_lock(&kvm->srcu);
+		rc = kvm_gfn_to_pfn_cache_refresh(kvm, gpc, gpc->gpa,
+						  PAGE_SIZE, false);
+		srcu_read_unlock(&kvm->srcu, idx);
+	} while(!rc);
+
+	mutex_unlock(&kvm->lock);
+
+	if (mm_borrowed)
+		kthread_unuse_mm(kvm->mm);
+
+	return rc;
+}
+
+int kvm_xen_setup_evtchn(struct kvm *kvm,
+			 struct kvm_kernel_irq_routing_entry *e,
+			 const struct kvm_irq_routing_entry *ue)
+
+{
+	if (ue->u.xen_evtchn.port >= max_evtchn_port(kvm))
+		return -EINVAL;
+
+	/* We only support 2 level event channels for now */
+	if (ue->u.xen_evtchn.priority != KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL)
+		return -EINVAL;
+
+	e->xen_evtchn.port = ue->u.xen_evtchn.port;
+	e->xen_evtchn.vcpu = ue->u.xen_evtchn.vcpu;
+	e->xen_evtchn.priority = ue->u.xen_evtchn.priority;
+	e->set = evtchn_set_fn;
+
+	return 0;
+}
diff --git a/arch/x86/kvm/xen.h b/arch/x86/kvm/xen.h
index cc0cf5f37450..adbcc9ed59db 100644
--- a/arch/x86/kvm/xen.h
+++ b/arch/x86/kvm/xen.h
@@ -24,6 +24,12 @@ int kvm_xen_hvm_config(struct kvm *kvm, struct kvm_xen_hvm_config *xhc);
 void kvm_xen_init_vm(struct kvm *kvm);
 void kvm_xen_destroy_vm(struct kvm *kvm);
 
+int kvm_xen_set_evtchn_fast(struct kvm_kernel_irq_routing_entry *e,
+			    struct kvm *kvm);
+int kvm_xen_setup_evtchn(struct kvm *kvm,
+			 struct kvm_kernel_irq_routing_entry *e,
+			 const struct kvm_irq_routing_entry *ue);
+
 static inline bool kvm_xen_msr_enabled(struct kvm *kvm)
 {
 	return static_branch_unlikely(&kvm_xen_enabled.key) &&
@@ -134,6 +140,9 @@ struct compat_shared_info {
 	struct compat_arch_shared_info arch;
 };
 
+#define COMPAT_EVTCHN_2L_NR_CHANNELS (8 *				\
+				      sizeof_field(struct compat_shared_info, \
+						   evtchn_pending))
 struct compat_vcpu_runstate_info {
     int state;
     uint64_t state_entry_time;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 457c38d75913..47fbc253d72b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -470,6 +470,12 @@ struct kvm_hv_sint {
 	u32 sint;
 };
 
+struct kvm_xen_evtchn {
+	u32 port;
+	u32 vcpu;
+	u32 priority;
+};
+
 struct kvm_kernel_irq_routing_entry {
 	u32 gsi;
 	u32 type;
@@ -490,6 +496,7 @@ struct kvm_kernel_irq_routing_entry {
 		} msi;
 		struct kvm_s390_adapter_int adapter;
 		struct kvm_hv_sint hv_sint;
+		struct kvm_xen_evtchn xen_evtchn;
 	};
 	struct hlist_node link;
 };
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 1daa45268de2..12421e76adcb 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1162,11 +1162,20 @@ struct kvm_irq_routing_hv_sint {
 	__u32 sint;
 };
 
+struct kvm_irq_routing_xen_evtchn {
+	__u32 port;
+	__u32 vcpu;
+	__u32 priority;
+};
+
+#define KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL ((__u32)(-1))
+
 /* gsi routing entry types */
 #define KVM_IRQ_ROUTING_IRQCHIP 1
 #define KVM_IRQ_ROUTING_MSI 2
 #define KVM_IRQ_ROUTING_S390_ADAPTER 3
 #define KVM_IRQ_ROUTING_HV_SINT 4
+#define KVM_IRQ_ROUTING_XEN_EVTCHN 5
 
 struct kvm_irq_routing_entry {
 	__u32 gsi;
@@ -1178,6 +1187,7 @@ struct kvm_irq_routing_entry {
 		struct kvm_irq_routing_msi msi;
 		struct kvm_irq_routing_s390_adapter adapter;
 		struct kvm_irq_routing_hv_sint hv_sint;
+		struct kvm_irq_routing_xen_evtchn xen_evtchn;
 		__u32 pad[8];
 	} u;
 };
@@ -1208,6 +1218,7 @@ struct kvm_x86_mce {
 #define KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL	(1 << 1)
 #define KVM_XEN_HVM_CONFIG_SHARED_INFO		(1 << 2)
 #define KVM_XEN_HVM_CONFIG_RUNSTATE		(1 << 3)
+#define KVM_XEN_HVM_CONFIG_EVTCHN_2LEVEL	(1 << 4)
 
 struct kvm_xen_hvm_config {
 	__u32 flags;
diff --git a/tools/testing/selftests/kvm/x86_64/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86_64/xen_shinfo_test.c
index a0699f00b3d6..a865e60a042c 100644
--- a/tools/testing/selftests/kvm/x86_64/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86_64/xen_shinfo_test.c
@@ -14,6 +14,9 @@
 #include <stdint.h>
 #include <time.h>
 #include <sched.h>
+#include <signal.h>
+
+#include <sys/eventfd.h>
 
 #define VCPU_ID		5
 
@@ -22,10 +25,12 @@
 #define SHINFO_REGION_SLOT	10
 #define PAGE_SIZE		4096
 
+#define SHINFO_ADDR	(SHINFO_REGION_GPA)
 #define PVTIME_ADDR	(SHINFO_REGION_GPA + PAGE_SIZE)
 #define RUNSTATE_ADDR	(SHINFO_REGION_GPA + PAGE_SIZE + 0x20)
 #define VCPU_INFO_ADDR	(SHINFO_REGION_GPA + 0x40)
 
+#define SHINFO_VADDR	(SHINFO_REGION_GVA)
 #define RUNSTATE_VADDR	(SHINFO_REGION_GVA + PAGE_SIZE + 0x20)
 #define VCPU_INFO_VADDR	(SHINFO_REGION_GVA + 0x40)
 
@@ -73,15 +78,30 @@ struct vcpu_info {
         struct pvclock_vcpu_time_info time;
 }; /* 64 bytes (x86) */
 
+struct shared_info {
+	struct vcpu_info vcpu_info[32];
+	unsigned long evtchn_pending[64];
+	unsigned long evtchn_mask[64];
+	struct pvclock_wall_clock wc;
+	uint32_t wc_sec_hi;
+	/* arch_shared_info here */
+};
+
 #define RUNSTATE_running  0
 #define RUNSTATE_runnable 1
 #define RUNSTATE_blocked  2
 #define RUNSTATE_offline  3
 
+struct {
+	struct kvm_irq_routing info;
+	struct kvm_irq_routing_entry entries[2];
+} irq_routes;
+
 static void evtchn_handler(struct ex_regs *regs)
 {
 	struct vcpu_info *vi = (void *)VCPU_INFO_VADDR;
 	vi->evtchn_upcall_pending = 0;
+	vi->evtchn_pending_sel = 0;
 
 	GUEST_SYNC(0x20);
 }
@@ -127,7 +147,19 @@ static void guest_code(void)
 	GUEST_SYNC(6);
 	GUEST_ASSERT(rs->time[RUNSTATE_runnable] >= MIN_STEAL_TIME);
 
-	GUEST_DONE();
+	/* Attempt to deliver a *masked* interrupt */
+	GUEST_SYNC(7);
+
+	/* Wait until we see the bit set */
+	struct shared_info *si = (void *)SHINFO_VADDR;
+	while (!si->evtchn_pending[0])
+		__asm__ __volatile__ ("rep nop" : : : "memory");
+
+	/* Now deliver an *unmasked* interrupt */
+	GUEST_SYNC(8);
+
+	for (;;)
+		__asm__ __volatile__ ("rep nop" : : : "memory");
 }
 
 static int cmp_timespec(struct timespec *a, struct timespec *b)
@@ -144,6 +176,11 @@ static int cmp_timespec(struct timespec *a, struct timespec *b)
 		return 0;
 }
 
+static void handle_alrm(int sig)
+{
+	TEST_FAIL("IRQ delivery timed out");
+}
+
 int main(int argc, char *argv[])
 {
 	struct timespec min_ts, max_ts, vm_ts;
@@ -155,6 +192,7 @@ int main(int argc, char *argv[])
 	}
 
 	bool do_runstate_tests = !!(xen_caps & KVM_XEN_HVM_CONFIG_RUNSTATE);
+	bool do_eventfd_tests = !!(xen_caps & KVM_XEN_HVM_CONFIG_EVTCHN_2LEVEL);
 
 	clock_gettime(CLOCK_REALTIME, &min_ts);
 
@@ -166,6 +204,11 @@ int main(int argc, char *argv[])
 				    SHINFO_REGION_GPA, SHINFO_REGION_SLOT, 2, 0);
 	virt_map(vm, SHINFO_REGION_GVA, SHINFO_REGION_GPA, 2);
 
+	struct shared_info *shinfo = addr_gpa2hva(vm, SHINFO_VADDR);
+
+	int zero_fd = open("/dev/zero", O_RDONLY);
+	TEST_ASSERT(zero_fd != -1, "Failed to open /dev/zero");
+
 	struct kvm_xen_hvm_config hvmc = {
 		.flags = KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL,
 		.msr = XEN_HYPERCALL_MSR,
@@ -184,6 +227,16 @@ int main(int argc, char *argv[])
 	};
 	vm_ioctl(vm, KVM_XEN_HVM_SET_ATTR, &ha);
 
+	/*
+	 * Test what happens when the HVA of the shinfo page is remapped after
+	 * the kernel has a reference to it. But make sure we copy the clock
+	 * info over since that's only set at setup time, and we test it later.
+	 */
+	struct pvclock_wall_clock wc_copy = shinfo->wc;
+	void *m = mmap(shinfo, PAGE_SIZE, PROT_READ|PROT_WRITE, MAP_FIXED|MAP_PRIVATE, zero_fd, 0);
+	TEST_ASSERT(m == shinfo, "Failed to map /dev/zero over shared info");
+	shinfo->wc = wc_copy;
+
 	struct kvm_xen_vcpu_attr vi = {
 		.type = KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO,
 		.u.gpa = VCPU_INFO_ADDR,
@@ -214,6 +267,49 @@ int main(int argc, char *argv[])
 		vcpu_ioctl(vm, VCPU_ID, KVM_XEN_VCPU_SET_ATTR, &st);
 	}
 
+	int irq_fd[2] = { -1, -1 };
+
+	if (do_eventfd_tests) {
+		irq_fd[0] = eventfd(0, 0);
+		irq_fd[1] = eventfd(0, 0);
+
+		/* Unexpected, but not a KVM failure */
+		if (irq_fd[0] == -1 || irq_fd[1] == -1)
+			do_eventfd_tests = false;
+	}
+
+	if (do_eventfd_tests) {
+		irq_routes.info.nr = 2;
+
+		irq_routes.entries[0].gsi = 32;
+		irq_routes.entries[0].type = KVM_IRQ_ROUTING_XEN_EVTCHN;
+		irq_routes.entries[0].u.xen_evtchn.port = 15;
+		irq_routes.entries[0].u.xen_evtchn.vcpu = VCPU_ID;
+		irq_routes.entries[0].u.xen_evtchn.priority = KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL;
+
+		irq_routes.entries[1].gsi = 33;
+		irq_routes.entries[1].type = KVM_IRQ_ROUTING_XEN_EVTCHN;
+		irq_routes.entries[1].u.xen_evtchn.port = 66;
+		irq_routes.entries[1].u.xen_evtchn.vcpu = VCPU_ID;
+		irq_routes.entries[1].u.xen_evtchn.priority = KVM_IRQ_ROUTING_XEN_EVTCHN_PRIO_2LEVEL;
+
+		vm_ioctl(vm, KVM_SET_GSI_ROUTING, &irq_routes);
+
+		struct kvm_irqfd ifd = { };
+
+		ifd.fd = irq_fd[0];
+		ifd.gsi = 32;
+		vm_ioctl(vm, KVM_IRQFD, &ifd);
+
+		ifd.fd = irq_fd[1];
+		ifd.gsi = 33;
+		vm_ioctl(vm, KVM_IRQFD, &ifd);
+
+		struct sigaction sa = { };
+		sa.sa_handler = handle_alrm;
+		sigaction(SIGALRM, &sa, NULL);
+	}
+
 	struct vcpu_info *vinfo = addr_gpa2hva(vm, VCPU_INFO_VADDR);
 	vinfo->evtchn_upcall_pending = 0;
 
@@ -289,9 +385,23 @@ int main(int argc, char *argv[])
 					sched_yield();
 				} while (get_run_delay() < rundelay);
 				break;
+			case 7:
+				if (!do_eventfd_tests)
+					goto done;
+				shinfo->evtchn_mask[0] = 0x8000;
+				eventfd_write(irq_fd[0], 1UL);
+				alarm(1);
+				break;
+			case 8:
+				eventfd_write(irq_fd[1], 1UL);
+				evtchn_irq_expected = true;
+				break;
+
 			case 0x20:
 				TEST_ASSERT(evtchn_irq_expected, "Unexpected event channel IRQ");
 				evtchn_irq_expected = false;
+				if (shinfo->evtchn_pending[1])
+					goto done;
 				break;
 			}
 			break;
-- 
2.31.1

