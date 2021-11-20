Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2F2457D0D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 11:33:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hx8yV2xNBz3cc4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 21:33:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Xq+TKkth;
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hx8sV5LRRz2yp0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 21:29:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mkQSxNiO24zNj6PGwmIB/b9M7//rpOKLCivjYBWhmLk=; b=Xq+TKkth6UGodwC73698VUUlg7
 XaF+tHM0Nlbri4MMM3zhIHH4iVFBGizeCvqtcoCTQjtzolu8/j4b0EWXksiWfweSzwKvWn2qeCmQ8
 tVv0OxDJf6neQTb9+hvnu3mcxe2Xogw6e3lQogSWyUfXCk7Ow9LPwJVMA14SPu4RQT5RN5MjWabv6
 8mVy1AKQKTVA9kPyTEi8VcCTAFcPULt6mEEScYsRuzttf3QmjQCpmmUyZ514KUlPKpUplHlYkbjCg
 P9d28LBw8RTMs+QDZjKa4yh6FtrIihxtdYWEFXzLLdCaRdUZ3K2eKqbNvmD8msBDBbqMzka4kfJnt
 3nqfee8Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moNbR-00H55z-IH; Sat, 20 Nov 2021 10:28:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1moNbR-0002KZ-4L; Sat, 20 Nov 2021 10:28:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	kvm <kvm@vger.kernel.org>
Subject: [PATCH v4 11/11] KVM: x86: First attempt at converting nested virtual
 APIC page to gpc
Date: Sat, 20 Nov 2021 10:28:10 +0000
Message-Id: <20211120102810.8858-12-dwmw2@infradead.org>
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

This is what evolved during the discussion at
https://lore.kernel.org/kvm/960E233F-EC0B-4FB5-BA2E-C8D2CCB38B12@infradead.org/T/#m11d75fcfe2da357ec1dabba0d0e3abb91fd13665

As discussed, an alternative approach might be to augment
kvm_arch_memslots_updated() to raise KVM_REQ_GET_NESTED_STATE_PAGES to
each vCPU (and make that req only do anything on a given vCPU if that
vCPU is actually in L2 guest mode).

That would mean the reload gets actively triggered even on memslot
changes rather than only on MMU notifiers as is the case now. It could
*potentially* mean we can drop the new 'check_guest_maps' function.

The 'check_guest_maps' function could be a lot simpler than it is,
though. It only really needs to get kvm->memslots->generation, then
check each gpc->generation against that, and each gpc->valid.

Also I suspect we *shouldn't* destroy the virtual_apic_cache in
nested_vmx_vmexit(). We can just leave it there for next time the
vCPU enters guest mode. If it happens to get invalidated in the
meantime, that's fine and we'll refresh it on the way back in.
We probably *would* want to actively do something on memslot changes
in that case though, to ensure that even if the vCPU isn't in guest
mode any more, we *release* the cached page.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/vmx/nested.c       | 50 ++++++++++++++++++++++++++++-----
 arch/x86/kvm/vmx/vmx.c          | 12 +++++---
 arch/x86/kvm/vmx/vmx.h          |  2 +-
 arch/x86/kvm/x86.c              | 10 +++++++
 5 files changed, 63 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 6ea2446ab851..24f6f3e2de47 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1511,6 +1511,7 @@ struct kvm_x86_nested_ops {
 	int (*enable_evmcs)(struct kvm_vcpu *vcpu,
 			    uint16_t *vmcs_version);
 	uint16_t (*get_evmcs_version)(struct kvm_vcpu *vcpu);
+	void (*check_guest_maps)(struct kvm_vcpu *vcpu);
 };
 
 struct kvm_x86_init_ops {
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 1e2f66951566..01bfabcfbbce 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -309,7 +309,7 @@ static void free_nested(struct kvm_vcpu *vcpu)
 		kvm_release_page_clean(vmx->nested.apic_access_page);
 		vmx->nested.apic_access_page = NULL;
 	}
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
+	kvm_gfn_to_pfn_cache_destroy(vcpu->kvm, &vmx->nested.virtual_apic_cache);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
 	vmx->nested.pi_desc = NULL;
 
@@ -3179,10 +3179,12 @@ static bool nested_get_vmcs12_pages(struct kvm_vcpu *vcpu)
 	}
 
 	if (nested_cpu_has(vmcs12, CPU_BASED_TPR_SHADOW)) {
-		map = &vmx->nested.virtual_apic_map;
+		struct gfn_to_pfn_cache *gpc = &vmx->nested.virtual_apic_cache;
 
-		if (!kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->virtual_apic_page_addr), map)) {
-			vmcs_write64(VIRTUAL_APIC_PAGE_ADDR, pfn_to_hpa(map->pfn));
+ 		if (!kvm_gfn_to_pfn_cache_init(vcpu->kvm, gpc, vcpu, true, true,
+					       vmcs12->virtual_apic_page_addr,
+					       PAGE_SIZE, true)) {
+			vmcs_write64(VIRTUAL_APIC_PAGE_ADDR, pfn_to_hpa(gpc->pfn));
 		} else if (nested_cpu_has(vmcs12, CPU_BASED_CR8_LOAD_EXITING) &&
 		           nested_cpu_has(vmcs12, CPU_BASED_CR8_STORE_EXITING) &&
 			   !nested_cpu_has2(vmcs12, SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES)) {
@@ -3207,6 +3209,9 @@ static bool nested_get_vmcs12_pages(struct kvm_vcpu *vcpu)
 	if (nested_cpu_has_posted_intr(vmcs12)) {
 		map = &vmx->nested.pi_desc_map;
 
+		if (kvm_vcpu_mapped(map))
+			kvm_vcpu_unmap(vcpu, map, true);
+
 		if (!kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->posted_intr_desc_addr), map)) {
 			vmx->nested.pi_desc =
 				(struct pi_desc *)(((void *)map->hva) +
@@ -3251,6 +3256,29 @@ static bool vmx_get_nested_state_pages(struct kvm_vcpu *vcpu)
 	return true;
 }
 
+static void nested_vmx_check_guest_maps(struct kvm_vcpu *vcpu)
+{
+	struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	struct gfn_to_pfn_cache *gpc;
+
+	int valid;
+
+	if (nested_cpu_has_posted_intr(vmcs12)) {
+		gpc = &vmx->nested.virtual_apic_cache;
+
+		read_lock(&gpc->lock);
+		valid = kvm_gfn_to_pfn_cache_check(vcpu->kvm, gpc,
+						   vmcs12->virtual_apic_page_addr,
+						   PAGE_SIZE);
+		read_unlock(&gpc->lock);
+		if (!valid) {
+			kvm_make_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
+			return;
+		}
+	}
+}
+
 static int nested_vmx_write_pml_buffer(struct kvm_vcpu *vcpu, gpa_t gpa)
 {
 	struct vmcs12 *vmcs12;
@@ -3749,9 +3777,15 @@ static int vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
 
 	max_irr = find_last_bit((unsigned long *)vmx->nested.pi_desc->pir, 256);
 	if (max_irr != 256) {
-		vapic_page = vmx->nested.virtual_apic_map.hva;
-		if (!vapic_page)
+		struct gfn_to_pfn_cache *gpc = &vmx->nested.virtual_apic_cache;
+
+		read_lock(&gpc->lock);
+		if (!kvm_gfn_to_pfn_cache_check(vcpu->kvm, gpc, gpc->gpa, PAGE_SIZE)) {
+			read_unlock(&gpc->lock);
 			goto mmio_needed;
+		}
+
+		vapic_page = gpc->khva;
 
 		__kvm_apic_update_irr(vmx->nested.pi_desc->pir,
 			vapic_page, &max_irr);
@@ -3761,6 +3795,7 @@ static int vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
 			status |= (u8)max_irr;
 			vmcs_write16(GUEST_INTR_STATUS, status);
 		}
+		read_unlock(&gpc->lock);
 	}
 
 	nested_mark_vmcs12_pages_dirty(vcpu);
@@ -4581,7 +4616,7 @@ void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 		kvm_release_page_clean(vmx->nested.apic_access_page);
 		vmx->nested.apic_access_page = NULL;
 	}
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
+	kvm_gfn_to_pfn_cache_unmap(vcpu->kvm, &vmx->nested.virtual_apic_cache);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
 	vmx->nested.pi_desc = NULL;
 
@@ -6756,4 +6791,5 @@ struct kvm_x86_nested_ops vmx_nested_ops = {
 	.write_log_dirty = nested_vmx_write_pml_buffer,
 	.enable_evmcs = nested_enable_evmcs,
 	.get_evmcs_version = nested_get_evmcs_version,
+	.check_guest_maps = nested_vmx_check_guest_maps,
 };
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index ba66c171d951..6c61faef86d3 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3839,19 +3839,23 @@ void pt_update_intercept_for_msr(struct kvm_vcpu *vcpu)
 static bool vmx_guest_apic_has_interrupt(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	void *vapic_page;
+	struct gfn_to_pfn_cache *gpc = &vmx->nested.virtual_apic_cache;
 	u32 vppr;
 	int rvi;
 
 	if (WARN_ON_ONCE(!is_guest_mode(vcpu)) ||
 		!nested_cpu_has_vid(get_vmcs12(vcpu)) ||
-		WARN_ON_ONCE(!vmx->nested.virtual_apic_map.gfn))
+		WARN_ON_ONCE(gpc->gpa == GPA_INVALID))
 		return false;
 
 	rvi = vmx_get_rvi();
 
-	vapic_page = vmx->nested.virtual_apic_map.hva;
-	vppr = *((u32 *)(vapic_page + APIC_PROCPRI));
+	read_lock(&gpc->lock);
+	if (!kvm_gfn_to_pfn_cache_check(vcpu->kvm, gpc, gpc->gpa, PAGE_SIZE))
+		vppr = *((u32 *)(gpc->khva + APIC_PROCPRI));
+	else
+		vppr = 0xff;
+	read_unlock(&gpc->lock);
 
 	return ((rvi & 0xf0) > (vppr & 0xf0));
 }
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 4df2ac24ffc1..8364e7fc92a0 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -195,7 +195,7 @@ struct nested_vmx {
 	 * pointers, so we must keep them pinned while L2 runs.
 	 */
 	struct page *apic_access_page;
-	struct kvm_host_map virtual_apic_map;
+	struct gfn_to_pfn_cache virtual_apic_cache;
 	struct kvm_host_map pi_desc_map;
 
 	struct kvm_host_map msr_bitmap_map;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index fa56c590d8db..01d20db5b1f4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9739,6 +9739,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 
 		if (kvm_check_request(KVM_REQ_UPDATE_CPU_DIRTY_LOGGING, vcpu))
 			static_call(kvm_x86_update_cpu_dirty_logging)(vcpu);
+		if (kvm_check_request(KVM_REQ_GPC_INVALIDATE, vcpu))
+			; /* Nothing to do. It just wanted to wake us */
 	}
 
 	if (kvm_check_request(KVM_REQ_EVENT, vcpu) || req_int_win ||
@@ -9785,6 +9787,14 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	local_irq_disable();
 	vcpu->mode = IN_GUEST_MODE;
 
+	/*
+	 * If the guest requires direct access to mapped L1 pages, check
+	 * the caches are valid. Will raise KVM_REQ_GET_NESTED_STATE_PAGES
+	 * to go and revalidate them, if necessary.
+	 */
+	if (is_guest_mode(vcpu) && kvm_x86_ops.nested_ops->check_guest_maps)
+		kvm_x86_ops.nested_ops->check_guest_maps(vcpu);
+
 	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 
 	/*
-- 
2.31.1

