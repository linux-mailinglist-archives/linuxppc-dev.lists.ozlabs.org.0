Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EDB93DC0B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:13:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zRaUEqnb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4pM1tvlz3fq6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:13:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zRaUEqnb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3atekzgykddwqcylhaemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Ml3LP7z3d8K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:39 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d1a9bad5dso1374030b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038018; x=1722642818; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hlhq7We3LF/Ul7sqre1CZocM6x6KNUXlB6LyC83BMPc=;
        b=zRaUEqnbCqneixmR3oT5+ocHRvdCG4BOLin13OSdTbIZayTybzBtNptcx8MgB1LPwU
         FzlrORsiVnZP9tLegW1dnImuWVcziYrsuxh2Sg/OU5gj3A1n7e8NHg7RF7y4fadd6XhH
         hUy17SnPX8n36AlGwA5zfmnsAW4Cmi4q1q7/AzHFiCAcl6GI1TM4MMCBu4Wvw8qOyDu3
         FrSBpJTCUglBTJsTfgxZl+yi/OHrA/u1DK1esc201I7ygDf/e+sQVVRTE+MiNzLpOkzV
         zybsGBXuL0IMlrNflLr2wWz33cURPOrQUrt87Z9H41AlRCSyIKBSabnq/3XOGF1ozuvl
         HXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038018; x=1722642818;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlhq7We3LF/Ul7sqre1CZocM6x6KNUXlB6LyC83BMPc=;
        b=br3bDtTbOhKOqKhUm/gZJowodLX3mye4hw+goPB3DISFXXFnGH/atw8NfVK8KADCJM
         pYaXi1yekbCygpFpbcJbxulk6D+PcqKQqJoLpu327+fBZAXDdgdUdbzelvgUgG0KHYKf
         dpcXZUa9qk6g82u/c72oqczyPJuLQ3Eo4amyfyD0Js/MgsTbMJPvmyqyIMMN177Nd2+v
         kURSVEof3Jn905dDrxwJKw+jkwh3zt2KDTkirmKLm1KD0y2HAlKf2hxAPs74QwNo4nvT
         qnoj71aO1LtAHo1CXg2CB+KJUCSO9iW+7EMdiMyI5cwOqLQYbR9c2UWktSXq970ikJxY
         XqLg==
X-Forwarded-Encrypted: i=1; AJvYcCW8aVybOvjFzcysLgZ+p6WCN/VO7A4VZLO8AGqiu/KNvcQ5tmwuaBtF7Ekmb+SHkHRHXPS3ppWeoYTJJew6dEAcdjNOuN+QR/ZwSjshEw==
X-Gm-Message-State: AOJu0YwArq6kkY3VFBu6yKZLzCyKIP1lwXO69LX5ZnU7CExRBxvQOUFp
	obS/4JU86mKlHBgP36sKxs4G2VSddDefE8d73kLJ60c5tieGigVR7NxLcAX4+n7d8cnw2PmBUYK
	gng==
X-Google-Smtp-Source: AGHT+IHh1dyWiT0um9sPElrkv3mBIH4IG/eZ2ITHeKZHWjYM95v4ERaP3jgKxmY1KlRL2J6TSkYz8SuqfJg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2f10:b0:70e:9de1:9edf with SMTP id
 d2e1a72fcca58-70ece9fc2c1mr8667b3a.1.1722038017517; Fri, 26 Jul 2024 16:53:37
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:38 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-30-seanjc@google.com>
Subject: [PATCH v12 29/84] KVM: Pin (as in FOLL_PIN) pages during kvm_vcpu_map()
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

Pin, as in FOLL_PIN, pages when mapping them for direct access by KVM.
As per Documentation/core-api/pin_user_pages.rst, writing to a page that
was gotten via FOLL_GET is explicitly disallowed.

  Correct (uses FOLL_PIN calls):
      pin_user_pages()
      write to the data within the pages
      unpin_user_pages()

  INCORRECT (uses FOLL_GET calls):
      get_user_pages()
      write to the data within the pages
      put_page()

Unfortunately, FOLL_PIN is a "private" flag, and so kvm_follow_pfn must
use a one-off bool instead of being able to piggyback the "flags" field.

Link: https://lwn.net/Articles/930667
Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  2 +-
 virt/kvm/kvm_main.c      | 54 +++++++++++++++++++++++++++++-----------
 virt/kvm/kvm_mm.h        |  7 ++++++
 3 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 8b5ac3305b05..3d4094ece479 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -280,7 +280,7 @@ struct kvm_host_map {
 	 * can be used as guest memory but they are not managed by host
 	 * kernel).
 	 */
-	struct page *refcounted_page;
+	struct page *pinned_page;
 	struct page *page;
 	void *hva;
 	kvm_pfn_t pfn;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 255cbed83b40..4a9b99c11355 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2824,9 +2824,12 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
 	 */
 	if (pte) {
 		pfn = pte_pfn(*pte);
-		page = kvm_pfn_to_refcounted_page(pfn);
-		if (page && !get_page_unless_zero(page))
-			return KVM_PFN_ERR_FAULT;
+
+		if (!kfp->pin) {
+			page = kvm_pfn_to_refcounted_page(pfn);
+			if (page && !get_page_unless_zero(page))
+				return KVM_PFN_ERR_FAULT;
+		}
 	} else {
 		pfn = page_to_pfn(page);
 	}
@@ -2845,16 +2848,24 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
 static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
 	struct page *page;
+	bool r;
 
 	/*
-	 * Fast pin a writable pfn only if it is a write fault request
-	 * or the caller allows to map a writable pfn for a read fault
-	 * request.
+	 * Try the fast-only path when the caller wants to pin/get the page for
+	 * writing.  If the caller only wants to read the page, KVM must go
+	 * down the full, slow path in order to avoid racing an operation that
+	 * breaks Copy-on-Write (CoW), e.g. so that KVM doesn't end up pointing
+	 * at the old, read-only page while mm/ points at a new, writable page.
 	 */
 	if (!((kfp->flags & FOLL_WRITE) || kfp->map_writable))
 		return false;
 
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
+	if (kfp->pin)
+		r = pin_user_pages_fast(kfp->hva, 1, FOLL_WRITE, &page) == 1;
+	else
+		r = get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page);
+
+	if (r) {
 		*pfn = kvm_resolve_pfn(kfp, page, NULL, true);
 		return true;
 	}
@@ -2883,10 +2894,21 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 	struct page *page, *wpage;
 	int npages;
 
-	npages = get_user_pages_unlocked(kfp->hva, 1, &page, flags);
+	if (kfp->pin)
+		npages = pin_user_pages_unlocked(kfp->hva, 1, &page, flags);
+	else
+		npages = get_user_pages_unlocked(kfp->hva, 1, &page, flags);
 	if (npages != 1)
 		return npages;
 
+	/*
+	 * Pinning is mutually exclusive with opportunistically mapping a read
+	 * fault as writable, as KVM should never pin pages when mapping memory
+	 * into the guest (pinning is only for direct accesses from KVM).
+	 */
+	if (WARN_ON_ONCE(kfp->map_writable && kfp->pin))
+		goto out;
+
 	/* map read fault as writable if possible */
 	if (!(flags & FOLL_WRITE) && kfp->map_writable &&
 	    get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
@@ -2895,6 +2917,7 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 		flags |= FOLL_WRITE;
 	}
 
+out:
 	*pfn = kvm_resolve_pfn(kfp, page, NULL, flags & FOLL_WRITE);
 	return npages;
 }
@@ -3119,10 +3142,11 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 		.slot = gfn_to_memslot(vcpu->kvm, gfn),
 		.gfn = gfn,
 		.flags = FOLL_WRITE,
-		.refcounted_page = &map->refcounted_page,
+		.refcounted_page = &map->pinned_page,
+		.pin = true,
 	};
 
-	map->refcounted_page = NULL;
+	map->pinned_page = NULL;
 	map->page = NULL;
 	map->hva = NULL;
 	map->gfn = gfn;
@@ -3159,16 +3183,16 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 	if (dirty)
 		kvm_vcpu_mark_page_dirty(vcpu, map->gfn);
 
-	if (map->refcounted_page) {
+	if (map->pinned_page) {
 		if (dirty)
-			kvm_release_page_dirty(map->refcounted_page);
-		else
-			kvm_release_page_clean(map->refcounted_page);
+			kvm_set_page_dirty(map->pinned_page);
+		kvm_set_page_accessed(map->pinned_page);
+		unpin_user_page(map->pinned_page);
 	}
 
 	map->hva = NULL;
 	map->page = NULL;
-	map->refcounted_page = NULL;
+	map->pinned_page = NULL;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index d3ac1ba8ba66..acef3f5c582a 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -30,6 +30,13 @@ struct kvm_follow_pfn {
 	/* FOLL_* flags modifying lookup behavior, e.g. FOLL_WRITE. */
 	unsigned int flags;
 
+	/*
+	 * Pin the page (effectively FOLL_PIN, which is an mm/ internal flag).
+	 * The page *must* be pinned if KVM will write to the page via a kernel
+	 * mapping, e.g. via kmap(), mremap(), etc.
+	 */
+	bool pin;
+
 	/*
 	 * If non-NULL, try to get a writable mapping even for a read fault.
 	 * Set to true if a writable mapping was obtained.
-- 
2.46.0.rc1.232.g9752f9e123-goog

