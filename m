Return-Path: <linuxppc-dev+bounces-7797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB2EA93BCE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 19:16:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfLyf4v4jz3c4t;
	Sat, 19 Apr 2025 03:16:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744996586;
	cv=none; b=PYORrzH+OiblV2S6K72UwZGq6mXjcJZxONiCq7p/OkNfAx+uM54ZcoVD9ZvOtNaf8BnSL7z8or++N9G84sXuKnVzwCnIOhxuRQMu/hOQdlm+ybjMkMFZHafyFB0hY3wD4KFyiKRzXnt+ixlauibbyF9QvtX6bGZaqz45lxLYmE7WQxTcUJYTKR5uMBWvLA+t8yCJTkJpHtrWUnp97QLuMPrXI6nb4IY1iUOHjhGxnZgJJSpChcBsi6N4+5e7OIf1M5RQqChqQuH5dMemnibaj/l8hjbBRq+8imkH3NiiQfhhcssePtUjw6cAvulMM0M04IUqd2BBzoen5hb+mrRngg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744996586; c=relaxed/relaxed;
	bh=sDbt2DYYkNyWT5oGemZdan3esNskCyLssS6aV6nsjxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LWMLawXF5REsH5SCZFPONn1gh9kR1V3ZJamIqZSWHEQEmNxVJ1cmRp+M4qDkMh1HbZIM/BnqGAk/9VNfiD7w8ClfcPWgiY+BmLitgkT4WUgBkU8wT6etV58HgkEbT/mIk8czP7qcWi2GuszaQyBu0Ifyq1j1vE7Yz5EC5O1BOhl+V02Sa7uWdVDRpxOpo0CaT5yUP0JhryQYuOSR02gmKAQfUVWdF9qtEDqrBhzdtZ/9YNxBdOxKvLMjWA+ZlimA+p0/7sovH/RbhGn0RIEm14hXohmDsbtOP6JzDQ8MnFIAcxae+9gsH3eKaSgvZPUn8mYqTGSE2qwclG1kbKviFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wxd/DW+P; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L5Mswmn4; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wxd/DW+P;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L5Mswmn4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfLyb2TB6z3c4h
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 03:16:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744996574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sDbt2DYYkNyWT5oGemZdan3esNskCyLssS6aV6nsjxA=;
	b=Wxd/DW+PdOKeW9ZC3fl8IltY3Z0yVVPbqP6Ma/Jw4bthN80N4DOqdoHP5524OpnySO77qL
	FSlpDy3EByhZGDJjC4pRvXXD0muylbvw7MRuUxynYFK2LTeTGNGoom4J9DLl3x9OzaIgGY
	DP4zo4VOKQLCwiD5DJK1Zuy2YFoJ9ng=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744996575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sDbt2DYYkNyWT5oGemZdan3esNskCyLssS6aV6nsjxA=;
	b=L5Mswmn4pkso2jZ2x1e9IKRPtLyvtZmaDc6lXvY7YGzt4+rF8iSWG+7g3fZA5IjTKXicED
	Ksl6Yncs08Eaue0Ah5qp5iV8LK0SrlG1HSX/vbLLu3YCbUdF9zs9WfwP0GiZCvkHQAKCLC
	t4bVfV1d2aMQgAGwHArezAYo77DFLxI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-345-nEOZX5jSMYG0rXM3YFpAlQ-1; Fri,
 18 Apr 2025 13:16:12 -0400
X-MC-Unique: nEOZX5jSMYG0rXM3YFpAlQ-1
X-Mimecast-MFC-AGG-ID: nEOZX5jSMYG0rXM3YFpAlQ_1744996571
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E8CB19560AA;
	Fri, 18 Apr 2025 17:16:11 +0000 (UTC)
Received: from virtlab1023.lab.eng.rdu2.redhat.com (virtlab1023.lab.eng.rdu2.redhat.com [10.8.1.187])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 049BD1800965;
	Fri, 18 Apr 2025 17:16:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: arm64, x86: make kvm_arch_has_irq_bypass() inline
Date: Fri, 18 Apr 2025 13:16:09 -0400
Message-ID: <20250418171609.231588-1-pbonzini@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

kvm_arch_has_irq_bypass() is a small function and even though it does
not appear in any *really* hot paths, it's also not entirely rare.
Make it inline---it also works out nicely in preparation for using it in
kvm-intel.ko and kvm-amd.ko, since the function is not currently exported.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h   | 5 +++++
 arch/arm64/kvm/arm.c                | 5 -----
 arch/powerpc/include/asm/kvm_host.h | 2 ++
 arch/x86/include/asm/kvm_host.h     | 6 ++++++
 arch/x86/kvm/x86.c                  | 5 -----
 include/linux/kvm_host.h            | 1 -
 6 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e98cfe7855a6..08ba91e6fb03 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1588,4 +1588,9 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 #define kvm_has_s1poe(k)				\
 	(kvm_has_feat((k), ID_AA64MMFR3_EL1, S1POE, IMP))
 
+static inline bool kvm_arch_has_irq_bypass(void)
+{
+	return true;
+}
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 68fec8c95fee..19ca57def629 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2743,11 +2743,6 @@ bool kvm_arch_irqchip_in_kernel(struct kvm *kvm)
 	return irqchip_in_kernel(kvm);
 }
 
-bool kvm_arch_has_irq_bypass(void)
-{
-	return true;
-}
-
 int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
 				      struct irq_bypass_producer *prod)
 {
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 2d139c807577..6f761b77b813 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -907,4 +907,6 @@ static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
+bool kvm_arch_has_irq_bypass(void);
+
 #endif /* __POWERPC_KVM_HOST_H__ */
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 3bdae454a959..7bc174a1f1cb 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -35,6 +35,7 @@
 #include <asm/mtrr.h>
 #include <asm/msr-index.h>
 #include <asm/asm.h>
+#include <asm/irq_remapping.h>
 #include <asm/kvm_page_track.h>
 #include <asm/kvm_vcpu_regs.h>
 #include <asm/reboot.h>
@@ -2423,4 +2424,9 @@ int memslot_rmap_alloc(struct kvm_memory_slot *slot, unsigned long npages);
  */
 #define KVM_EXIT_HYPERCALL_MBZ		GENMASK_ULL(31, 1)
 
+static inline bool kvm_arch_has_irq_bypass(void)
+{
+	return enable_apicv && irq_remapping_cap(IRQ_POSTING_CAP);
+}
+
 #endif /* _ASM_X86_KVM_HOST_H */
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 3712dde0bf9d..c1fdd527044c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13556,11 +13556,6 @@ bool kvm_arch_has_noncoherent_dma(struct kvm *kvm)
 }
 EXPORT_SYMBOL_GPL(kvm_arch_has_noncoherent_dma);
 
-bool kvm_arch_has_irq_bypass(void)
-{
-	return enable_apicv && irq_remapping_cap(IRQ_POSTING_CAP);
-}
-
 int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
 				      struct irq_bypass_producer *prod)
 {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 291d49b9bf05..82f044e4b3f5 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2383,7 +2383,6 @@ struct kvm_vcpu *kvm_get_running_vcpu(void);
 struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void);
 
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
-bool kvm_arch_has_irq_bypass(void);
 int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *,
 			   struct irq_bypass_producer *);
 void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *,
-- 
2.43.5


