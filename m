Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFBF93DCB4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:45:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pBxtIxk1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5W82l2Xz3fnQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:45:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=pBxtIxk1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3ytekzgykdjwoa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Pb6z5Gz3dK5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:55:15 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0b2fb62a07so450260276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038114; x=1722642914; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zSysp7FPh6wn+DolRHFxx8ZAZJRhLuISfWWp3RFo0OA=;
        b=pBxtIxk1QgxaHHl9JIWUBIOkzLvtJJj+oJcGJlgIuS347v+wBH70IlVz19IUXu+9KA
         qTwKGZdn4/egFNUcnyLWRfuHdTeosOjgGp5PXfhSRzJkm/sczfbmJzrIO7tvUpTs4I+n
         pmzLmG8CWQsmPTcpaBfmetTQolb7puw9WukGpWK7cJgRlEJtHPaqfuBjNpGLmnB2mYk2
         D6mVbW+ekQq6ZxQqId84DUHW+434T5iYlKFvpQArLzNmRCUGaA5u344++3Wajdg/0q5R
         8CP4fQUZjCwVcRYz4kyYnjovex4z44ai5r50IH8NDJuyxg+mYolFiCFOJpUkLXaId0pu
         CHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038114; x=1722642914;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSysp7FPh6wn+DolRHFxx8ZAZJRhLuISfWWp3RFo0OA=;
        b=jyJjSnFQMIlPKROye1w2l/B8RcaYJhhS7KElgOVrckI1Sxf029YAUq2H0bLzmIVOX0
         Aq1p78gLDGdCqliGK6+pT4JS7wf+6c6njwBa6XVKBzjUee8mCh/F/9UAZP4CujTYZvvd
         wU34sX/o6CCjpQRmVMg82ZneZliQ8Qal9JRYJ8HvXeF9FDh+gwgJwOf7ZXfwqcIWpGwJ
         AA/7ZkZCNqdmXElpzHez1+0lcKXXlPb2TXTIci3R6FxYGAUKDDpIDwHQomCYmjmuraUJ
         cqYCqkMivUiZB7Jr7knVQ9jXUmzAhqfCEihEomcgefnHMqwDlYvNJqEEYELit3vwPd/Z
         Mg9A==
X-Forwarded-Encrypted: i=1; AJvYcCV58tEvxzZPU7HClLG58NjW9FcbvEtuWZT+CnBDEzYvjVd3lZo4v+En+JXVB0gN0Dq2wApCP6t4dja3pyJ13cVZUyopvKidiPjIwS97uA==
X-Gm-Message-State: AOJu0Yzef5DkvElHvN6PkkRZzp0i15gut4gr+shhjTPXZdUderFfPLSV
	VL7aSMxN6iQDK7Njpmp3cw4n+/9tkk/9P04bZQZ+4k7mgk6FKdNlE0GgKmCZt+6lW1HLBnVhJE7
	tvA==
X-Google-Smtp-Source: AGHT+IHtdYLzf8VxCow9ze9t5PB7b90MwNFbCURT1XZzWgwcWEIftZd8Pqph9MK+hSFYPsX4JKQKNB1AEe8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1889:b0:dfb:1147:cbaa with SMTP id
 3f1490d57ef6-e0b5459b0b9mr34694276.10.1722038113838; Fri, 26 Jul 2024
 16:55:13 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:24 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-76-seanjc@google.com>
Subject: [PATCH v12 75/84] KVM: Add support for read-only usage of gfn_to_page()
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

Rework gfn_to_page() to support read-only accesses so that it can be used
by arm64 to get MTE tags out of guest memory.

Opportunistically rewrite the comment to be even more stern about using
gfn_to_page(), as there are very few scenarios where requiring a struct
page is actually the right thing to do (though there are such scenarios).
Add a FIXME to call out that KVM probably should be pinning pages, not
just getting pages.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  7 ++++++-
 virt/kvm/kvm_main.c      | 15 ++++++++-------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 91341cdc6562..f2d3c3c436cc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1198,7 +1198,12 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages);
 
-struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn);
+struct page *__gfn_to_page(struct kvm *kvm, gfn_t gfn, bool write);
+static inline struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
+{
+	return __gfn_to_page(kvm, gfn, true);
+}
+
 unsigned long gfn_to_hva(struct kvm *kvm, gfn_t gfn);
 unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d0f55a6ecb31..16bc3ac3ff84 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3174,25 +3174,26 @@ int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
 
 /*
- * Do not use this helper unless you are absolutely certain the gfn _must_ be
- * backed by 'struct page'.  A valid example is if the backing memslot is
- * controlled by KVM.  Note, if the returned page is valid, it's refcount has
- * been elevated by gfn_to_pfn().
+ * Don't use this API unless you are absolutely, positively certain that KVM
+ * needs to get a struct page, e.g. to pin the page for firmware DMA.
+ *
+ * FIXME: Users of this API likely need to FOLL_PIN the page, not just elevate
+ *	  its refcount.
  */
-struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
+struct page *__gfn_to_page(struct kvm *kvm, gfn_t gfn, bool write)
 {
 	struct page *refcounted_page = NULL;
 	struct kvm_follow_pfn kfp = {
 		.slot = gfn_to_memslot(kvm, gfn),
 		.gfn = gfn,
-		.flags = FOLL_WRITE,
+		.flags = write ? FOLL_WRITE : 0,
 		.refcounted_page = &refcounted_page,
 	};
 
 	(void)kvm_follow_pfn(&kfp);
 	return refcounted_page;
 }
-EXPORT_SYMBOL_GPL(gfn_to_page);
+EXPORT_SYMBOL_GPL(__gfn_to_page);
 
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
 		   bool writable)
-- 
2.46.0.rc1.232.g9752f9e123-goog

