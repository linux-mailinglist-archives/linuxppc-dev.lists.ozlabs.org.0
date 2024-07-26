Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD193DCC4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:50:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eNuPnhrb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5dV6YFdz3frl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eNuPnhrb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3ctekzgykdkweqmzvosaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Pv3YMpz3fSV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:55:31 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2cb6c5f9810so1642453a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038130; x=1722642930; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jpI7lTRxFmJ8IejB0Qdg95emli3A+yh4X5lHdX1qdPI=;
        b=eNuPnhrbyA1YBffJMdajXtU1EDpquVYkHPQvv3O+9JXgimsVVJd8DyQe4/tQwrqHX3
         EoSymjQWGMqr6wW2X05i2k+aIW4njjJN3aMjrjw82ESTkEl+Mt++cpM0+oiZQsWv6Y1Q
         OnD/6Qhj6s3p4RsCl/I/Jhd314RhSyltVFVN8946oFx4/lumEq+eQZfVPQZitbl/Jprn
         pQSUH8AUDd/k63g/F5NHUDHW+7UtJ1jXxUnQheVVEBACZaqc1/rxd6AflzQYTDAelkYp
         dDwHVvgScX1DASkfL7qB2m+yod7PkWr2KrDZFjSvagNsHCtNCHUTVZSScf/+fIquPybH
         o+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038130; x=1722642930;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpI7lTRxFmJ8IejB0Qdg95emli3A+yh4X5lHdX1qdPI=;
        b=WEvybYsQGgIWnScbhEIgYettTkbLW38jewh4RLHG+5wDTu/ghAbcJaQIAmTjEt0VUL
         KC3+qD7nCbJS9llU6fiAZYi37kWaSDb0ev13HlFVYVXI8ggyMrM48Cpa4momccy4R3hX
         OX/k2PmdQ19huMOt46Ae2y/FtKWspzXq4jwt11JdHq6IDx0GtczWwviIM+ntB6lBun9U
         aACm0xG+JZk5Whe2HLr/gW4bWa4isuFecr4Olbfe7ZekH9YGQ/PpXwpTQgutSgWkNYVQ
         J+k6fbDh1uc/z8DRjTkwXiZmp7qXh/p7SKF4zNwgdxkj7lV8Ge7LePhjSepr/jkzDHeT
         0MTA==
X-Forwarded-Encrypted: i=1; AJvYcCXQTdrXY67TyG6j8RHdUMPx7Potczu6ktOoB6ehsQ2/e3TSqmVmJHL123qshOd6jPe83dgkz+Qt78/drKQGqu7r/exoQvFh2MVpCSEVwA==
X-Gm-Message-State: AOJu0YwG3CfOsYBd9VRz7a4HoH1KT1nP55ZZO7aWYq9aipYW4D2EoVhS
	aV7XbiDj3XidlE34T6La45cLwTVsn04aZqFu3nY5vVoQPbBXy/mNsfXJMlc3qfswLdJchlpVa4n
	tFQ==
X-Google-Smtp-Source: AGHT+IFv8CQNcqhsspCtIqnm+Y+lStR0ot3kSIK9X3XaAk7UtrG+09935pql8gySUvK94zWnbXq5q/tu644=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:fb47:b0:2c9:61f9:9aea with SMTP id
 98e67ed59e1d1-2cf7e618b7dmr21168a91.5.1722038129745; Fri, 26 Jul 2024
 16:55:29 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:32 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-84-seanjc@google.com>
Subject: [PATCH v12 83/84] KVM: Drop APIs that manipulate "struct page" via pfns
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

Remove all kvm_{release,set}_pfn_*() APIs not that all users are gone.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  5 ----
 virt/kvm/kvm_main.c      | 55 ----------------------------------------
 2 files changed, 60 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 34a1cadb1b80..87d61f16a449 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1260,11 +1260,6 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
 				 write ? FOLL_WRITE : 0, writable, refcounted_page);
 }
 
-void kvm_release_pfn_clean(kvm_pfn_t pfn);
-void kvm_release_pfn_dirty(kvm_pfn_t pfn);
-void kvm_set_pfn_dirty(kvm_pfn_t pfn);
-void kvm_set_pfn_accessed(kvm_pfn_t pfn);
-
 int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
 			int len);
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long len);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 030a08d4b21d..8b85e1130a63 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3200,61 +3200,6 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
-void kvm_release_pfn_clean(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (is_error_noslot_pfn(pfn))
-		return;
-
-	page = kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return;
-
-	kvm_release_page_clean(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
-
-void kvm_release_pfn_dirty(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (is_error_noslot_pfn(pfn))
-		return;
-
-	page = kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return;
-
-	kvm_release_page_dirty(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_pfn_dirty);
-
-/*
- * Note, checking for an error/noslot pfn is the caller's responsibility when
- * directly marking a page dirty/accessed.  Unlike the "release" helpers, the
- * "set" helpers are not to be used when the pfn might point at garbage.
- */
-void kvm_set_pfn_dirty(kvm_pfn_t pfn)
-{
-	if (WARN_ON(is_error_noslot_pfn(pfn)))
-		return;
-
-	if (pfn_valid(pfn))
-		kvm_set_page_dirty(pfn_to_page(pfn));
-}
-EXPORT_SYMBOL_GPL(kvm_set_pfn_dirty);
-
-void kvm_set_pfn_accessed(kvm_pfn_t pfn)
-{
-	if (WARN_ON(is_error_noslot_pfn(pfn)))
-		return;
-
-	if (pfn_valid(pfn))
-		kvm_set_page_accessed(pfn_to_page(pfn));
-}
-EXPORT_SYMBOL_GPL(kvm_set_pfn_accessed);
-
 static int next_segment(unsigned long len, int offset)
 {
 	if (len > PAGE_SIZE - offset)
-- 
2.46.0.rc1.232.g9752f9e123-goog

