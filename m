Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D8893DCA1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:38:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CE35hJ66;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5M86q2cz3bZ3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:38:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CE35hJ66;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3tdekzgykdic3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4PB2vQKz3dKF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:54 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fda155bc43so11485515ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038092; x=1722642892; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rpwXsNxFJqP0CEr/yEQ2h0r+lN6KBTuvETCSKMoe8FQ=;
        b=CE35hJ66s97viPeAIeUPtSM6ZGKUeizu/yafSqBYZERZgW+8lonzHS4ft9wFFgihVE
         9RPxjbnW/LmM9LbKo6Dgbu5dmTt0ZFYxCLM95MC3FSdT1gaRsJz/N3N2luneiwV2KSha
         m3qLVpyBPq+Ui57IJmxEbzWv88zOszSTmIp7ZICh/zqg+H0GT6+vLZEPxiONCW92+A2E
         /Yt/qaOL6gDCCc0khgZxq9bt7sCqQYIV3q2H6uUCUCxt0kQeTCTQvEpTU/vSEFE5KjhB
         Gznc4vICcf5G3nJ/44C6as9/s+YOaCHUXG5vWV97fMpJuPSa2NUvbM0DWwyw4KG71s8I
         VS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038092; x=1722642892;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpwXsNxFJqP0CEr/yEQ2h0r+lN6KBTuvETCSKMoe8FQ=;
        b=KN7XdRFqRt5zH0w4WwS8HvSpErzaoPAYLvq+B4lr//FoxK7pcP7ox+6/X++/COVVkg
         lNv37x0yoIKvfhy96Mo1vhsYApHCYEngbBNarMwoSYdD0cO/Ljb1WLNC+qiRnXw6i0qV
         NODxnKCKXXHnCwZJa3Tov5sVaIMHByO1TDzGgI7DhM9t22iSr4umiTOVYnU2fwZWOgwj
         kPNk/DMlyFwsMEoCcewIUpj1byeC6RVI+YWt+XpIhJwqy8tU7nxkrJ6XyyBY4mPnI3ul
         nMim2Wb1cd4nwc8utY8qNpcrvUzX5MUJ64IJml87P/u+0mtscpy6l3XJBV5JH3+EgAAF
         4bdg==
X-Forwarded-Encrypted: i=1; AJvYcCVRfCRlrWpp1pbGFamGikPxmgGBJwZRsqz8h5S9dKsbJxuzinCqmpaAJMx03F4IpRx1vH7vn9VGP+fAS7feKzQdlD4z/S+ovwlHU85IcQ==
X-Gm-Message-State: AOJu0YxCL7unbcEKvMg0w6OwDl7bQkEatUpvORnRUWpxkQt6hxn2VWc5
	Gc6ggkdnftNLM7tghaEwJuX7JsEgJZtQ/uoeZszRXbz/eEdOvFNiKSuScqY0iq2PLWVHtlmrNQ2
	AJA==
X-Google-Smtp-Source: AGHT+IEz1qMb/9xSOR6pziERGmR6RlcO2d1FpOxR3ZCse98fOqCGJ5ia3ZBUMMNkI3e0ioyh2oD8FsbOxx8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2341:b0:1fd:63d7:5d34 with SMTP id
 d9443c01a7336-1ff04803eeamr27405ad.5.1722038092373; Fri, 26 Jul 2024 16:54:52
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:14 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-66-seanjc@google.com>
Subject: [PATCH v12 65/84] KVM: LoongArch: Mark "struct page" pfns accessed
 only in "slow" page fault path
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

Mark pages accessed only in the slow path, before dropping mmu_lock when
faulting in guest memory so that LoongArch can convert to
kvm_release_faultin_page() without tripping its lockdep assertion on
mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 364dd35e0557..52b5c16cf250 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -552,12 +552,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 {
 	int ret = 0;
-	kvm_pfn_t pfn = 0;
 	kvm_pte_t *ptep, changed, new;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memory_slot *slot;
-	struct page *page;
 
 	spin_lock(&kvm->mmu_lock);
 
@@ -570,8 +568,6 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 
 	/* Track access to pages marked old */
 	new = kvm_pte_mkyoung(*ptep);
-	/* call kvm_set_pfn_accessed() after unlock */
-
 	if (write && !kvm_pte_dirty(new)) {
 		if (!kvm_pte_write(new)) {
 			ret = -EFAULT;
@@ -595,23 +591,11 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 	}
 
 	changed = new ^ (*ptep);
-	if (changed) {
+	if (changed)
 		kvm_set_pte(ptep, new);
-		pfn = kvm_pte_pfn(new);
-		page = kvm_pfn_to_refcounted_page(pfn);
-		if (page)
-			get_page(page);
-	}
+
 	spin_unlock(&kvm->mmu_lock);
 
-	if (changed) {
-		if (kvm_pte_young(changed))
-			kvm_set_pfn_accessed(pfn);
-
-		if (page)
-			put_page(page);
-	}
-
 	if (kvm_pte_dirty(changed))
 		mark_page_dirty(kvm, gfn);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

