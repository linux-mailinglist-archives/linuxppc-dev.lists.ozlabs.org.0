Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B800693DCB9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:47:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YbQ3CGf+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5YZ4sPwz30TQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:47:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YbQ3CGf+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3zzekzgykdkiugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Pj6YsTz3fVm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:55:21 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-664bc570740so4647557b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038120; x=1722642920; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=B5cS3fQCyroPznI2D76vYSWht1aEO90tb+OiOa938C4=;
        b=YbQ3CGf+bC3dqDYXJW93vl0CXBZ+eV5k65cIjncuhJ75IafPnZ5PsC7kfhjdG4KndT
         gVYm7pti5NI2l9btbyHHqjfBNfaKcVhZmcOGDWYMnAW6W2WyQ8dKuSAg4JDAr+tVCIqw
         vE4DXFcHSRi0gYZ7mJ6hUmephOiMKh6y6Q8Ym7o8Z+j5e34BysDrDkQ0buLJgEgadDZm
         yl7PlSLsGtnl+aCy8HbQM/Z0aPbRglyCrMiUZTDcdMAzfxnpKR7f0mZWvEJ4xZFXqUTX
         ZlERIPowLTSZ13EzRSdTTR6XQ4cmzopc/3JMquXA7JX4trJezkVLA997THiG1W4Ww+Kx
         /88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038120; x=1722642920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5cS3fQCyroPznI2D76vYSWht1aEO90tb+OiOa938C4=;
        b=BxU0Jerhrv6TqcVp4uXS4mysCLp7ne6Arm7RKz+7i9fcyHrlmdzdvN7YtBcUWpj+mw
         jrAwmJwnLUL0RgqQ1CUPEeFrPb1FtNnMgoqddzLlM2XWlaCa/coIxTlH2C5FhyYStonP
         eZIYaA1LxyPG+J2su3OZg+9BK/IoTNJDCpbtKxRa+ujSlV7Ae1+l3dlcz1WndFpytmEX
         bWN6m7Uj40T6T/bV5JKbPir4CQPJfz0sbsAegkpdOKV0nS7slbwvhTGadTJTR56B7ohB
         u1OKpYs8f5Mf40LQmFreHsmREtQAPHdMcPLV3firht6mnx8yOMoSj7nmVMrJqxGp1XEw
         KTHw==
X-Forwarded-Encrypted: i=1; AJvYcCUrH+jXXVjbZ70AaDhQ2lhyRurYVGFkotjqNZyumA7ZkhDQ/E58ZjWnUiCjTscz0ewW6r+ji7F2DDbFN3q5a0ARtQkbUgXjzMgPTJjoiQ==
X-Gm-Message-State: AOJu0Yyy67uzJNialrOQObnobH14rU36zGSunJSS8K5NEnN+4C2vU6AW
	AWqDgUcWhqPrK3dW5wl1QAQ2Gu4tJtzrD8DkRpGl3LMyLTQrI4D7DqqGftn+olJjF1HKOHxSyE8
	L4A==
X-Google-Smtp-Source: AGHT+IFMnVGgr4kpL4f9GKaKFvGezuIshpJ8eZPypNhpoA7Mjxc5gf+mvj1jThnEcafAjrCOymr+lPlnWyQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a5b:606:0:b0:e0b:3139:7ce5 with SMTP id
 3f1490d57ef6-e0b55d079camr27265276.5.1722038119814; Fri, 26 Jul 2024 16:55:19
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:27 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-79-seanjc@google.com>
Subject: [PATCH v12 78/84] KVM: Drop gfn_to_pfn() APIs now that all users are gone
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

Drop gfn_to_pfn() and all its variants now that all users are gone.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 11 --------
 virt/kvm/kvm_main.c      | 59 ----------------------------------------
 2 files changed, 70 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f2d3c3c436cc..34a1cadb1b80 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1260,14 +1260,6 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
 				 write ? FOLL_WRITE : 0, writable, refcounted_page);
 }
 
-kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
-kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
-		      bool *writable);
-kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn);
-kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable);
-
 void kvm_release_pfn_clean(kvm_pfn_t pfn);
 void kvm_release_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_dirty(kvm_pfn_t pfn);
@@ -1342,9 +1334,6 @@ unsigned long kvm_host_page_size(struct kvm_vcpu *vcpu, gfn_t gfn);
 void mark_page_dirty_in_slot(struct kvm *kvm, const struct kvm_memory_slot *memslot, gfn_t gfn);
 void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
 
-
-kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
-
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *map,
 		   bool writable);
 void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 16bc3ac3ff84..5dcf3561b829 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3059,65 +3059,6 @@ static kvm_pfn_t kvm_follow_pfn(struct kvm_follow_pfn *kfp)
 	return hva_to_pfn(kfp);
 }
 
-kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
-			       bool interruptible, bool no_wait,
-			       bool write_fault, bool *writable)
-{
-	struct kvm_follow_pfn kfp = {
-		.slot = slot,
-		.gfn = gfn,
-		.map_writable = writable,
-	};
-
-	if (write_fault)
-		kfp.flags |= FOLL_WRITE;
-	if (no_wait)
-		kfp.flags |= FOLL_NOWAIT;
-	if (interruptible)
-		kfp.flags |= FOLL_INTERRUPTIBLE;
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
-
-kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
-		      bool *writable)
-{
-	struct kvm_follow_pfn kfp = {
-		.slot = gfn_to_memslot(kvm, gfn),
-		.gfn = gfn,
-		.flags = write_fault ? FOLL_WRITE : 0,
-		.map_writable = writable,
-	};
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn_prot);
-
-kvm_pfn_t gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn)
-{
-	struct kvm_follow_pfn kfp = {
-		.slot = slot,
-		.gfn = gfn,
-		.flags = FOLL_WRITE,
-	};
-
-	return kvm_follow_pfn(&kfp);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn_memslot);
-
-kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn)
-{
-	return gfn_to_pfn_memslot(gfn_to_memslot(kvm, gfn), gfn);
-}
-EXPORT_SYMBOL_GPL(gfn_to_pfn);
-
-kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
-{
-	return gfn_to_pfn_memslot(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn);
-}
-EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
-
 kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn)
 {
 	struct page *refcounted_page = NULL;
-- 
2.46.0.rc1.232.g9752f9e123-goog

