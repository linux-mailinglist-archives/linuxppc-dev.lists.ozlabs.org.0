Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D4F93DC8A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:26:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Zs+R/EhB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW55V5jF3z3fqY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:26:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Zs+R/EhB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3kdekzgykdgmtfbokdhpphmf.dpnmjovyqqd-efwmjtut.pambct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4NV5Qkgz3dXP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:18 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc6f3ac7beso10762495ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038057; x=1722642857; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=l9BW/dK5c/4ryaOpC0RxFiUBYVnD4MPO1UqGokFlyv8=;
        b=Zs+R/EhB08c7/eltADfjC6J6qnpKoxLHXD8V5jI6/OHQlWGmQYOfGlSf0GJ0ed7Jkk
         zggqo54K3rG5EgxXxpzo9Iv50aXaC9d9Wsy3EYgwVkvIDfRbPUEVH4WLZ0TIPA/1o4nt
         z/CXUdJ+J7nIL//4enpi7YxdGqtQgph/8812Spmn5atwsychmZfwCM4LE7NWLfYTjEMZ
         JCZhjnyKAQDHL9yI9no8nJbnkiXQRSjV7FNpUuM3yi8wkUcAzO677wSnV4UvcQOmQuku
         gor/anrNlxc7ofG/ZKOlFsNzwHbqmA+VgaZDHYwFri/TqXsAcqK3p5itdVvLzIdQ7ICA
         K1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038057; x=1722642857;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9BW/dK5c/4ryaOpC0RxFiUBYVnD4MPO1UqGokFlyv8=;
        b=LB0Nu9DjWh3uYmybJ17Sy84t3EBoJVOFSZtOVeM9UtBc8IoTWWYwH0pjFeX9a8mfig
         z6LTEKAbQq0ee5eBQ9EIq8QGfjxhsYLI6ZL8izsl3f9MmKyG8z4EMsSWmSj1cWqnO+C7
         4liMSonodcj66l7i7pUUHrTn/b3A3FYwEFl5rSNFpxdH7+hT9AHYEaMAHOSMxqyA8UrK
         QqmhZhaSeoibuRfRmKxW4GNV6EKaQW9oYSHv2LlxrIGtX9WNVF6b69MiqgmT6DokCzTa
         Q8NtGAUKXILgTmMMKarcOvLZM+oCsQ2rOgbXQthBeJdtmgYOxxKKIoUHeA9WY3GYc7+S
         6PiA==
X-Forwarded-Encrypted: i=1; AJvYcCVbWuDjp2O6VTQLTeg11LBOGv/uppFv3X+Ny/cR79e+1oulBrWBtF2CTQQA26X2/l2Md5IsocpA0laxfL30cpZ43969ApdljpBElNDtcw==
X-Gm-Message-State: AOJu0YyV1i0/7olIDShjGjPuGIkVvyHaVt/tjVuY/yD0XmTwdMWWQ+fE
	cGXvQ/yIDQy/nEfTRai9ZhMCydz/7vOaqmelp2OEdYZGCS8HUBGC9/kbQi0sMb7CRvD19lSkADr
	lqw==
X-Google-Smtp-Source: AGHT+IH3COIaUp2rXSDrmiVRXNOzjzCRiof8RV2PU1lQ3pUgA2jXVKIIsmrd9aJoYDTjtMdA3IOsVNqBhcc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ea06:b0:1f9:cbe5:e422 with SMTP id
 d9443c01a7336-1ff0488dbf2mr744395ad.8.1722038056933; Fri, 26 Jul 2024
 16:54:16 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:57 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-49-seanjc@google.com>
Subject: [PATCH v12 48/84] KVM: Move x86's API to release a faultin page to
 common KVM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move KVM x86's helper that "finishes" the faultin process to common KVM
so that the logic can be shared across all architectures.  Note, not all
architectures implement a fast page fault path, but the gist of the
comment applies to all architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 24 ++----------------------
 include/linux/kvm_host.h | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 95beb50748fc..2a0cfa225c8d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4323,28 +4323,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				      struct kvm_page_fault *fault, int r)
 {
-	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
-			    r == RET_PF_RETRY);
-
-	if (!fault->refcounted_page)
-		return;
-
-	/*
-	 * If the page that KVM got from the *primary MMU* is writable, and KVM
-	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
-	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
-	 * the GFN is write-protected.  Folios can't be safely marked dirty
-	 * outside of mmu_lock as doing so could race with writeback on the
-	 * folio.  As a result, KVM can't mark folios dirty in the fast page
-	 * fault handler, and so KVM must (somewhat) speculatively mark the
-	 * folio dirty if KVM could locklessly make the SPTE writable.
-	 */
-	if (r == RET_PF_RETRY)
-		kvm_release_page_unused(fault->refcounted_page);
-	else if (!fault->map_writable)
-		kvm_release_page_clean(fault->refcounted_page);
-	else
-		kvm_release_page_dirty(fault->refcounted_page);
+	kvm_release_faultin_page(vcpu->kvm, fault->refcounted_page,
+				 r == RET_PF_RETRY, fault->map_writable);
 }
 
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9d2a97eb30e4..91341cdc6562 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1216,6 +1216,32 @@ static inline void kvm_release_page_unused(struct page *page)
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
+static inline void kvm_release_faultin_page(struct kvm *kvm, struct page *page,
+					    bool unused, bool dirty)
+{
+	lockdep_assert_once(lockdep_is_held(&kvm->mmu_lock) || unused);
+
+	if (!page)
+		return;
+
+	/*
+	 * If the page that KVM got from the *primary MMU* is writable, and KVM
+	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
+	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
+	 * the GFN is write-protected.  Folios can't be safely marked dirty
+	 * outside of mmu_lock as doing so could race with writeback on the
+	 * folio.  As a result, KVM can't mark folios dirty in the fast page
+	 * fault handler, and so KVM must (somewhat) speculatively mark the
+	 * folio dirty if KVM could locklessly make the SPTE writable.
+	 */
+	if (unused)
+		kvm_release_page_unused(page);
+	else if (dirty)
+		kvm_release_page_dirty(page);
+	else
+		kvm_release_page_clean(page);
+}
+
 kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
 			    unsigned int foll, bool *writable,
-- 
2.46.0.rc1.232.g9752f9e123-goog

