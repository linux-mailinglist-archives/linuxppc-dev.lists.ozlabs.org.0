Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA4A93DC83
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:24:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LEG4jgcB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW53C4q96z3fTT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:24:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LEG4jgcB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3ijekzgykdf0n95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4NN4rWfz3dVx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:12 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2cb639aa911so1508221a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038051; x=1722642851; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RjeQeusXYf+NFoksbIMp6SJLG4xl7UVW4NR1eYCui2c=;
        b=LEG4jgcBGBd0u0cy1FK+0442BjN4+FvM3tyK2v1sdMVm8zTQFWvZGZIkBzCuZvfAfN
         YHi+7y1356C3KxxTj+ioMsqENIjcQCUB4fuJJ5PGXNj68z44pQcaSlawQbOleGhEQ2Se
         iagpD1L3do/HOdb6k+jgYPk8lxJkXB9jkk3FruCwGem0PE49dE/uvEoQ7r3Pk3CreK5p
         zY4GguUKQYyIEA9FnvKTw4/u3zadIFnAA/qKZQ83cqDudsFkiwow64hlVNasCW1fRiII
         5bO81k/7FRWJsvSypjIHXsLnW+3rBj5bsOydX+bpKlVF6TQ0g4OJS+BaBcIYWtmeYDie
         8KMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038051; x=1722642851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjeQeusXYf+NFoksbIMp6SJLG4xl7UVW4NR1eYCui2c=;
        b=P53o5xk08tKMibhLvmwIEMM8m4IZlOqH9El8HJzofx8D4dzivtcxWsfk8JxuEGz/xW
         8DGgGxeXTdYFi24S+fGHc4YnYRg4X5zfV8zsZfe5V40dxLwD/tK9D2L0d9j6WBe4DD/f
         sXnf1wtBNRg2Xa1xzeqf9zYwCvKq/IuYcBUH+2iV44fySSzQwnsVMq6OOgnGoe8Cm5ZV
         ymimvm2u789+E1IJ4D1rtJaZM+jnOEzF1/EOougdiibYs9e27w9AFfIkTk5oefv+9agT
         mnm8HXbMUODYiY2BELItGHOE7Q+8GIwAFSWr2gqXI531Len2bVq/pZhpNpUJbdcwy1PH
         ZGHA==
X-Forwarded-Encrypted: i=1; AJvYcCVECMSP0r9v0egWJCyC05wLeNOp0Rte8YQsQ3oPrFVrPFMGhlEOLSd3y83eH+XvxOSTxSohjZeAB7B92p4L+POEyEhOMJ/HUryA4IKSXQ==
X-Gm-Message-State: AOJu0Yx9UZU96Lb58y8IvuFW0KmtUURU3vulSVHtvsnWp+FeqhaRr0pi
	oxLIoSmmoCoOjiyqZQ8kenReZaD2h5a8KmhvmACnJ1P/jvyOmynEZ70Ycs3pPhodI7lLTu3TIAY
	atQ==
X-Google-Smtp-Source: AGHT+IH9Sleax7HjGR/xKBhc5+sBB7ouHNPkUkQToWM2on12s7r2/JIy8m8cUdV6C+LgY7aIUstVbYLK+Ts=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:244b:b0:1fb:82f5:6631 with SMTP id
 d9443c01a7336-1ff04898c7dmr609255ad.9.1722038050968; Fri, 26 Jul 2024
 16:54:10 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:54 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-46-seanjc@google.com>
Subject: [PATCH v12 45/84] KVM: guest_memfd: Provide "struct page" as output
 from kvm_gmem_get_pfn()
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

Provide the "struct page" associated with a guest_memfd pfn as an output
from __kvm_gmem_get_pfn() so that KVM guest page fault handlers can
directly put the page instead of having to rely on
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   |  2 +-
 arch/x86/kvm/svm/sev.c   | 10 ++++++----
 include/linux/kvm_host.h |  6 ++++--
 virt/kvm/guest_memfd.c   | 19 +++++++++++--------
 4 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 53555ea5e5bb..146e57c9c86d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4353,7 +4353,7 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 	}
 
 	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
-			     &max_order);
+			     &fault->refcounted_page, &max_order);
 	if (r) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
 		return r;
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 62f63fd714df..5c125e4c1096 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3847,6 +3847,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
 	if (VALID_PAGE(svm->sev_es.snp_vmsa_gpa)) {
 		gfn_t gfn = gpa_to_gfn(svm->sev_es.snp_vmsa_gpa);
 		struct kvm_memory_slot *slot;
+		struct page *page;
 		kvm_pfn_t pfn;
 
 		slot = gfn_to_memslot(vcpu->kvm, gfn);
@@ -3857,7 +3858,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
 		 * The new VMSA will be private memory guest memory, so
 		 * retrieve the PFN from the gmem backend.
 		 */
-		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, NULL))
+		if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, &page, NULL))
 			return -EINVAL;
 
 		/*
@@ -3886,7 +3887,7 @@ static int __sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu)
 		 * changes then care should be taken to ensure
 		 * svm->sev_es.vmsa is pinned through some other means.
 		 */
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_clean(page);
 	}
 
 	/*
@@ -4686,6 +4687,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 	struct kvm_memory_slot *slot;
 	struct kvm *kvm = vcpu->kvm;
 	int order, rmp_level, ret;
+	struct page *page;
 	bool assigned;
 	kvm_pfn_t pfn;
 	gfn_t gfn;
@@ -4712,7 +4714,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 		return;
 	}
 
-	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &order);
+	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &page, &order);
 	if (ret) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for private GPA 0x%llx\n",
 				    gpa);
@@ -4770,7 +4772,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 out:
 	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
 out_no_trace:
-	put_page(pfn_to_page(pfn));
+	kvm_release_page_unused(page);
 }
 
 static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e0548ae92659..9d2a97eb30e4 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2462,11 +2462,13 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 
 #ifdef CONFIG_KVM_PRIVATE_MEM
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order);
+		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+		     int *max_order);
 #else
 static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn,
-				   kvm_pfn_t *pfn, int *max_order)
+				   kvm_pfn_t *pfn, struct page **page,
+				   int *max_order)
 {
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 1c509c351261..ad1f9e73cd13 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -542,12 +542,12 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 }
 
 static int __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
-		       gfn_t gfn, kvm_pfn_t *pfn, int *max_order, bool prepare)
+			      gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+			      int *max_order, bool prepare)
 {
 	pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
 	struct kvm_gmem *gmem = file->private_data;
 	struct folio *folio;
-	struct page *page;
 	int r;
 
 	if (file != slot->gmem.file) {
@@ -571,9 +571,9 @@ static int __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
 		return -EHWPOISON;
 	}
 
-	page = folio_file_page(folio, index);
+	*page = folio_file_page(folio, index);
 
-	*pfn = page_to_pfn(page);
+	*pfn = page_to_pfn(*page);
 	if (max_order)
 		*max_order = 0;
 
@@ -585,7 +585,8 @@ static int __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
 }
 
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
-		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
+		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
+		     int *max_order)
 {
 	struct file *file = kvm_gmem_get_file(slot);
 	int r;
@@ -593,7 +594,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (!file)
 		return -EFAULT;
 
-	r = __kvm_gmem_get_pfn(file, slot, gfn, pfn, max_order, true);
+	r = __kvm_gmem_get_pfn(file, slot, gfn, pfn, page, max_order, true);
 	fput(file);
 	return r;
 }
@@ -604,6 +605,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 {
 	struct file *file;
 	struct kvm_memory_slot *slot;
+	struct page *page;
 	void __user *p;
 
 	int ret = 0, max_order;
@@ -633,7 +635,8 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 			break;
 		}
 
-		ret = __kvm_gmem_get_pfn(file, slot, gfn, &pfn, &max_order, false);
+		ret = __kvm_gmem_get_pfn(file, slot, gfn, &pfn, &page,
+					  &max_order, false);
 		if (ret)
 			break;
 
@@ -644,7 +647,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 		p = src ? src + i * PAGE_SIZE : NULL;
 		ret = post_populate(kvm, gfn, pfn, p, max_order, opaque);
 
-		put_page(pfn_to_page(pfn));
+		put_page(page);
 		if (ret)
 			break;
 	}
-- 
2.46.0.rc1.232.g9752f9e123-goog

