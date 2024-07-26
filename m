Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F4D93DC9F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:36:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=C6CWnc1f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5Kf12Zfz3fr7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:36:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=C6CWnc1f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3sdekzgykdimzlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4P64zmqz3fRY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:50 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2cb4bcd9671so1774660a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038089; x=1722642889; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4jqep9wI+WruRy0z2TZYbUEBq8RbIq5j1OfKKvbW4+Y=;
        b=C6CWnc1fDCOZ1P79MFdaWeii0rWy6MCMn18USBXXVWEoapprbQwHOUM2ZytYeqtlo2
         Srv2NVIoVSPmAP/6jS3Om1DhFnfLE0AETqHWWfHvk4Qt+F9121wxYqykQlUtl6qbWCIR
         zdC4KpLuC1eyQfreOlMM35+yMA+WRA14i0kuVypSxkXpzXma8PAUbmVxCY6fere+JqMM
         /Kt+5xPvKo6odl46+emO+T75eQfQ5dT6zWJxkiRes4nP2ip23dboHRr1ry08xD+f6n9+
         KtssfvibFxJLX0yT4RJdoxH/zSnBEoPY+cabLL8GtrytCNx/3CWpKSVO3EpG08ItM243
         PW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038089; x=1722642889;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jqep9wI+WruRy0z2TZYbUEBq8RbIq5j1OfKKvbW4+Y=;
        b=eYA1UZjDW4doUnIJ6GU3GuVmM1+wnhZrTGSiRrgwQghplHy99/rrQPoUlnkQgsk+MU
         mPUbX3AjVRknVqTb6Z61Td7t216oxH5L630DfVbMOK1a+3H5EspQBscHpo9zWpc9r6Y8
         14gdiACvUqlkwD7NYRerH3NKNbUwjGs6gbDDjSrlI0J58OKBWke77rV3v4H/CoChCerP
         vzoynTJpMGKTyrrhk+vqutmKc/2YJIoF6EPkUL+8lUKpjQgoOVFJ2Fl2sSulOPNEWdGy
         /noJTmUCoMmACWgSwAYIS2SVE6gXmyobViwINBXkwM/FL27h/4MUcWv0O1d65Tb7lasQ
         d6nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL7o3uK/NjtTDoIPRueVbX8HLiD7guBBfy8PP2rec//6+HUOER4EnRh17y1DoUKL25DZS0rcOuiaVs5rd9g2S67wk6Op1ArR6NHjVpFg==
X-Gm-Message-State: AOJu0Yy2g6Bcdl4pc5mQa57wQ6F3nbimYc8GbkT1g8jd5SzvX6niGOCi
	EI8t7r5aQYXuhgjDpdZ9uPpppRyLboxQM2L59VTD99BGJ2MBfo+FCib6zcbEZgSnO9h9WKOO7+Q
	mDg==
X-Google-Smtp-Source: AGHT+IFasJAr04PTZrf6XUkQxxUmiACppU16Z34UUuO+d3NYseQpUQCzHrJDN41FkLsUjVBlqZCxQJJvuE8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:6fe5:b0:2c9:98bc:3584 with SMTP id
 98e67ed59e1d1-2cf7e83a1famr42409a91.6.1722038088823; Fri, 26 Jul 2024
 16:54:48 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:12 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-64-seanjc@google.com>
Subject: [PATCH v12 63/84] KVM: PPC: Use kvm_faultin_pfn() to handle page
 faults on Book3s PR
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

Convert Book3S PR to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_book3s.h |  2 +-
 arch/powerpc/kvm/book3s.c             |  7 ++++---
 arch/powerpc/kvm/book3s_32_mmu_host.c |  7 ++++---
 arch/powerpc/kvm/book3s_64_mmu_host.c | 10 +++++-----
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 34e8f0b7b345..343c10dda80f 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -235,7 +235,7 @@ extern void kvmppc_set_bat(struct kvm_vcpu *vcpu, struct kvmppc_bat *bat,
 extern void kvmppc_giveup_ext(struct kvm_vcpu *vcpu, ulong msr);
 extern int kvmppc_emulate_paired_single(struct kvm_vcpu *vcpu);
 extern kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa,
-			bool writing, bool *writable);
+			bool writing, bool *writable, struct page **page);
 extern void kvmppc_add_revmap_chain(struct kvm *kvm, struct revmap_entry *rev,
 			unsigned long *rmap, long pte_index, int realmode);
 extern void kvmppc_update_dirty_map(const struct kvm_memory_slot *memslot,
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index ff6c38373957..d79c5d1098c0 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -422,7 +422,7 @@ int kvmppc_core_prepare_to_enter(struct kvm_vcpu *vcpu)
 EXPORT_SYMBOL_GPL(kvmppc_core_prepare_to_enter);
 
 kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa, bool writing,
-			bool *writable)
+			    bool *writable, struct page **page)
 {
 	ulong mp_pa = vcpu->arch.magic_page_pa & KVM_PAM;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
@@ -437,13 +437,14 @@ kvm_pfn_t kvmppc_gpa_to_pfn(struct kvm_vcpu *vcpu, gpa_t gpa, bool writing,
 		kvm_pfn_t pfn;
 
 		pfn = (kvm_pfn_t)virt_to_phys((void*)shared_page) >> PAGE_SHIFT;
-		get_page(pfn_to_page(pfn));
+		*page = pfn_to_page(pfn);
+		get_page(*page);
 		if (writable)
 			*writable = true;
 		return pfn;
 	}
 
-	return gfn_to_pfn_prot(vcpu->kvm, gfn, writing, writable);
+	return kvm_faultin_pfn(vcpu, gfn, writing, writable, page);
 }
 EXPORT_SYMBOL_GPL(kvmppc_gpa_to_pfn);
 
diff --git a/arch/powerpc/kvm/book3s_32_mmu_host.c b/arch/powerpc/kvm/book3s_32_mmu_host.c
index 4b3a8d80cfa3..5b7212edbb13 100644
--- a/arch/powerpc/kvm/book3s_32_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_32_mmu_host.c
@@ -130,6 +130,7 @@ extern char etext[];
 int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 			bool iswrite)
 {
+	struct page *page;
 	kvm_pfn_t hpaddr;
 	u64 vpn;
 	u64 vsid;
@@ -145,7 +146,7 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	bool writable;
 
 	/* Get host physical address for gpa */
-	hpaddr = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable);
+	hpaddr = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable, &page);
 	if (is_error_noslot_pfn(hpaddr)) {
 		printk(KERN_INFO "Couldn't get guest page for gpa %lx!\n",
 				 orig_pte->raddr);
@@ -232,7 +233,7 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 
 	pte = kvmppc_mmu_hpte_cache_next(vcpu);
 	if (!pte) {
-		kvm_release_pfn_clean(hpaddr >> PAGE_SHIFT);
+		kvm_release_page_unused(page);
 		r = -EAGAIN;
 		goto out;
 	}
@@ -250,7 +251,7 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 
 	kvmppc_mmu_hpte_cache_map(vcpu, pte);
 
-	kvm_release_pfn_clean(hpaddr >> PAGE_SHIFT);
+	kvm_release_page_clean(page);
 out:
 	return r;
 }
diff --git a/arch/powerpc/kvm/book3s_64_mmu_host.c b/arch/powerpc/kvm/book3s_64_mmu_host.c
index d0e4f7bbdc3d..be20aee6fd7d 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_host.c
@@ -88,13 +88,14 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	struct hpte_cache *cpte;
 	unsigned long gfn = orig_pte->raddr >> PAGE_SHIFT;
 	unsigned long pfn;
+	struct page *page;
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
 	smp_rmb();
 
 	/* Get host physical address for gpa */
-	pfn = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable);
+	pfn = kvmppc_gpa_to_pfn(vcpu, orig_pte->raddr, iswrite, &writable, &page);
 	if (is_error_noslot_pfn(pfn)) {
 		printk(KERN_INFO "Couldn't get guest page for gpa %lx!\n",
 		       orig_pte->raddr);
@@ -199,10 +200,9 @@ int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 	}
 
 out_unlock:
-	if (!orig_pte->may_write || !writable)
-		kvm_release_pfn_clean(pfn);
-	else
-		kvm_release_pfn_dirty(pfn);
+	/* FIXME: Don't unconditionally pass unused=false. */
+	kvm_release_faultin_page(kvm, page, false,
+				 orig_pte->may_write && writable);
 	spin_unlock(&kvm->mmu_lock);
 	if (cpte)
 		kvmppc_mmu_hpte_cache_free(cpte);
-- 
2.46.0.rc1.232.g9752f9e123-goog

