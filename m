Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD0493DCC5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:51:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bvSJ3yWW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5fN70Vdz3fsf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:51:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bvSJ3yWW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3czekzgykdk4gsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Px4crKz3fRk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:55:33 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70e9ea89b42so1344881b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038132; x=1722642932; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=diuq/5OTzA7KvKsX4AEile2HlGAF4SgNWi1szy67iaM=;
        b=bvSJ3yWWCRDEEjXlrwQUaYXWy5p0XyhtsUiWfyQixm0HsQmZJ712goGlkYQkDF1VTv
         51mPWwQUbUq/U+qpHGlV3BJ3xjrTAgtH4Yuk40yMQErrUJuZlVwygzwA3SM/g07ouT2W
         H/tGg70Ka/ka6d74twgswVKUkFwVr3RyAHy0L9m6WG0U+d5iIO/yV7Tup3aEKfzx/7Lo
         PgirRm7VG9t8fiGH04oKauei2XgP+ZqrbSnqtaEXRj4uvUZkvCtGQCYyQb01Cd41E5Ii
         T21oSvdMkqdwkkKnt2vnfoa3D/usZmUm4VkVdRzSfy49Hs6hcs59bQ3pFWZoDkUZteRz
         6gLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038132; x=1722642932;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=diuq/5OTzA7KvKsX4AEile2HlGAF4SgNWi1szy67iaM=;
        b=mn0YZKIJuh6GBK2cQijP/UkE0VKMxbL9d2moYPGKsL89XTLYpt3lIyTmOBEYx4nmtg
         erdFjfZ5ImoB3qdkCC3oJTSSPrhbU2s8xOP3Wk1xYAiNWlFZzXQ0I72inVLsWMUnCo/v
         NuMijJntqmwHqAZD6Ag0YAf5CPbwOBhkYDTvCHPDHJls4OqBydJtk0mMF/gQXry3tXKm
         dGYxgddThDQwkNmvqU3LjRfaz9h6pIuUZ1dXB59l5mctwNAnVSkLnqHe88SupxhM3WGz
         vH74q5JgLWxIHOLM+qHgOe42TCMvA6U+jie9gzPZTaxfXc0TDV5OkFmy7CMGXX9yovO/
         KVHw==
X-Forwarded-Encrypted: i=1; AJvYcCUw6V7peg/YInz6MT7XstK2aCq4lG15x6DT4rPxw3CTaakwgpG6zzdOnB9KBx6rBUVRXCdgG4PJB23w9KH7vH+u1/QOyja/tIwb34CDBA==
X-Gm-Message-State: AOJu0YwSfRx4oWbF+5bk1SjmLGgRWa86MuP87GF11LpucZiiSx3YC/q2
	QiCTNWx1n7H7egLDfXv78Bh1FKmYEq0Hvzz91M7V1Sqp/aO834dxhuMlklAURIriData2rmP8wj
	foA==
X-Google-Smtp-Source: AGHT+IHhZHDOMBimQWMolk5T4YvfOEDeWobwSpVEA59XfGWHoVcD5oY/zbLuHzkbg8Phg0CxGQdxohIyYms=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:66e5:b0:70d:27ca:96b8 with SMTP id
 d2e1a72fcca58-70ece926ad1mr25428b3a.0.1722038131828; Fri, 26 Jul 2024
 16:55:31 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:33 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-85-seanjc@google.com>
Subject: [PATCH v12 84/84] KVM: Don't grab reference on VM_MIXEDMAP pfns that
 have a "struct page"
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

Now that KVM no longer relies on an ugly heuristic to find its struct page
references, i.e. now that KVM can't get false positives on VM_MIXEDMAP
pfns, remove KVM's hack to elevate the refcount for pfns that happen to
have a valid struct page.  In addition to removing a long-standing wart
in KVM, this allows KVM to map non-refcounted struct page memory into the
guest, e.g. for exposing GPU TTM buffers to KVM guests.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  3 --
 virt/kvm/kvm_main.c      | 75 ++--------------------------------------
 2 files changed, 2 insertions(+), 76 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 87d61f16a449..d4513ffaf2e1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1702,9 +1702,6 @@ void kvm_arch_sync_events(struct kvm *kvm);
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu);
 
-struct page *kvm_pfn_to_refcounted_page(kvm_pfn_t pfn);
-bool kvm_is_zone_device_page(struct page *page);
-
 struct kvm_irq_ack_notifier {
 	struct hlist_node link;
 	unsigned gsi;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8b85e1130a63..e279140f2425 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -160,52 +160,6 @@ __weak void kvm_arch_guest_memory_reclaimed(struct kvm *kvm)
 {
 }
 
-bool kvm_is_zone_device_page(struct page *page)
-{
-	/*
-	 * The metadata used by is_zone_device_page() to determine whether or
-	 * not a page is ZONE_DEVICE is guaranteed to be valid if and only if
-	 * the device has been pinned, e.g. by get_user_pages().  WARN if the
-	 * page_count() is zero to help detect bad usage of this helper.
-	 */
-	if (WARN_ON_ONCE(!page_count(page)))
-		return false;
-
-	return is_zone_device_page(page);
-}
-
-/*
- * Returns a 'struct page' if the pfn is "valid" and backed by a refcounted
- * page, NULL otherwise.  Note, the list of refcounted PG_reserved page types
- * is likely incomplete, it has been compiled purely through people wanting to
- * back guest with a certain type of memory and encountering issues.
- */
-struct page *kvm_pfn_to_refcounted_page(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (!pfn_valid(pfn))
-		return NULL;
-
-	page = pfn_to_page(pfn);
-	if (!PageReserved(page))
-		return page;
-
-	/* The ZERO_PAGE(s) is marked PG_reserved, but is refcounted. */
-	if (is_zero_pfn(pfn))
-		return page;
-
-	/*
-	 * ZONE_DEVICE pages currently set PG_reserved, but from a refcounting
-	 * perspective they are "normal" pages, albeit with slightly different
-	 * usage rules.
-	 */
-	if (kvm_is_zone_device_page(page))
-		return page;
-
-	return NULL;
-}
-
 /*
  * Switches to specified vcpu, until a matching vcpu_put()
  */
@@ -2814,35 +2768,10 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
 	if (kfp->map_writable)
 		*kfp->map_writable = writable;
 
-	/*
-	 * FIXME: Remove this once KVM no longer blindly calls put_page() on
-	 *	  every pfn that points at a struct page.
-	 *
-	 * Get a reference for follow_pte() pfns if they happen to point at a
-	 * struct page, as KVM will ultimately call kvm_release_pfn_clean() on
-	 * the returned pfn, i.e. KVM expects to have a reference.
-	 *
-	 * Certain IO or PFNMAP mappings can be backed with valid struct pages,
-	 * but be allocated without refcounting, e.g. tail pages of
-	 * non-compound higher order allocations.  Grabbing and putting a
-	 * reference to such pages would cause KVM to prematurely free a page
-	 * it doesn't own (KVM gets and puts the one and only reference).
-	 * Don't allow those pages until the FIXME is resolved.
-	 *
-	 * Don't grab a reference for pins, callers that pin pages are required
-	 * to check refcounted_page, i.e. must not blindly release the pfn.
-	 */
-	if (pte) {
+	if (pte)
 		pfn = pte_pfn(*pte);
-
-		if (!kfp->pin) {
-			page = kvm_pfn_to_refcounted_page(pfn);
-			if (page && !get_page_unless_zero(page))
-				return KVM_PFN_ERR_FAULT;
-		}
-	} else {
+	else
 		pfn = page_to_pfn(page);
-	}
 
 	*kfp->refcounted_page = page;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

