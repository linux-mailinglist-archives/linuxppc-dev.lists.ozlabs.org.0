Return-Path: <linuxppc-dev+bounces-2016-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4C199901F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:28:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVd2tTzz3c3x;
	Fri, 11 Oct 2024 05:26:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584761;
	cv=none; b=NrZ4AEnYKwydT/rNypyhFLibrSZOkqPNJdP7sRbj+SNx36+dE00XJYTZihKRzNeGQucmxTJWw7xEw6Y78pOCxrytz+IyARy3fO7/raIMdUixx5pq9CYWN+zRCD9WAIdpDG+zxlo2rpiVElKrHp8AuUj11uat6kr989CSM6DKlJbGAft204857kRwsBH1rBgbYMUdXDKUjun2VddZbrCNxUyK84DiF+korqjJAiOYmy/wZyWVP3xO3WEJL2XQ0/FESNHs0QGz0Vti/zzHj/gYn+sknhQA3FFoDPZLyoD5NZ/3imZ7TRfzxmXmR2bon6LlG0u6gKkVBkVibmbd1QZlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584761; c=relaxed/relaxed;
	bh=dQaiAwtn89tr8uPQzQfay17fvGV3F3WPslUlHA+BgDY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o0QaL+KDeGjrFRW8BgSMNsJt0c2JpQVbYtzKPSoJDpMMmgW018SCVATcNYb9tMJObcrwYzqw85z8CZkFWfBfYIJHIzR6ETu59rDwYOerIQbYOJPNFfoJCdUXlGfT6l1S0TaWC8g90QjiYnIpqOWPAV5vxN708QIraKcRcc89H1dskMMMx7M09hbcSPujyIcoYk+/Tda7SSmjTIeDMndao8uxnr1bSRL1uTu2inpNdcnRP/01K/huXU+fTyJF0XtTs6sh9Fm2koNHe58XcS1YiIhHUTHnsTBNA1lLWWCu0kmovLRxkrYAggt0DOSfIF652dPbM0iTD3/QWK/H4sij1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Txtljg+z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3nrwizwykdmwaws51uy66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Txtljg+z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3nrwizwykdmwaws51uy66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVb2H2bz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:59 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e2605ce4276so2180323276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584757; x=1729189557; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQaiAwtn89tr8uPQzQfay17fvGV3F3WPslUlHA+BgDY=;
        b=Txtljg+z0S51jZhwpgdZzCxniCqRvw4FuTqHg+06gXg9QT5D5Hx1k+Laa8mnNU+1Il
         yDNZD4MMJFyDO6q5baHQx1ymtrw8drgO2SWv/VZob2qHhzA3j83VIQaxzECI6REuYcS5
         ubi9Sz7KjKi3gIkBgNIZQ3g09YFU4dIWzEvty0bExwKErvKC5sdO4lf2LmCJTB/7ngrG
         cBnfIhYTkz1DmZeHvF/bxB2HiqOLrlMUhVVwPGpHM3dl2g7vvZv0DxNRWOP1Igtsa2aM
         LXr90LxqUPuVF9IWUkA/BjNrAUJMjwVjion44poAxcT/BV8e3qGd54qGPUpVCDcTjQ67
         JnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584757; x=1729189557;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQaiAwtn89tr8uPQzQfay17fvGV3F3WPslUlHA+BgDY=;
        b=X204bZYxCVH6cKi2YRRXOdqi9iVOmWBrfd5epqVSJdzRvH1UertYgfpYRJyEnTZKat
         sB/OvP9NgS1t9Zk2xSfogqF6LJWOzWKZvXo47EjPl5rlH8DOgrY48I8Qn6UAgCszh2EP
         V3XyFocfirSKEhlQB+wjzvf8R2UsuJjWeKqBOetzxa2c3Hd8UqOGtTf9R8KmRq6TuZ1+
         nf7FyG+5MbRhfTYCEH099LnZEgAsn+0SrXfzAlEdlaQbrFpzAREpvD2G9lU5NkcJ4j5C
         ck2z1AjHa7x8erP6CMfrxpfEKbp15dmjob8my5AFHtxpvea2VHBYZgl8R8VYqSwJuBIv
         y5QA==
X-Forwarded-Encrypted: i=1; AJvYcCUY9yFeQDyOO+gsEBW4ACr/2h8zxZy7BO0aC+ywHAL+03CMN2XVQkrzKbxkYqPItE2h30K/v2bUYQG4RHY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyw1Ml4vUiqUgNxNNDJL+ohDGGGqt3aFuWNyxUuguN7lx1JyuwX
	2bfmQObPtA4K1tLbCjXZ+NOQSeD/Ba5MnxEvyu5hETKgc4dmIv6otixVFOelD3mYzp9OG9hb+nK
	AxA==
X-Google-Smtp-Source: AGHT+IHY0yNiFmgeAXsfVKl7EbEBY2R3q1IXvjRBHtSPoxXhe2HbHq4twyB0Huv0R+/OHvP6V1ZW3nZzpzQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:80cb:0:b0:e20:2502:be14 with SMTP id
 3f1490d57ef6-e28fe410672mr4860276.7.1728584757233; Thu, 10 Oct 2024 11:25:57
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:33 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-32-seanjc@google.com>
Subject: [PATCH v13 31/85] KVM: Pin (as in FOLL_PIN) pages during kvm_vcpu_map()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  2 +-
 virt/kvm/kvm_main.c      | 54 +++++++++++++++++++++++++++++-----------
 virt/kvm/kvm_mm.h        |  7 ++++++
 3 files changed, 47 insertions(+), 16 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 02ab3a657aa6..8739b905d85b 100644
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
index b1c1b7e4f33a..40a59526d466 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2814,9 +2814,12 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_p=
fn *kfp, struct page *page,
 	 */
 	if (map) {
 		pfn =3D map->pfn;
-		page =3D kvm_pfn_to_refcounted_page(pfn);
-		if (page && !get_page_unless_zero(page))
-			return KVM_PFN_ERR_FAULT;
+
+		if (!kfp->pin) {
+			page =3D kvm_pfn_to_refcounted_page(pfn);
+			if (page && !get_page_unless_zero(page))
+				return KVM_PFN_ERR_FAULT;
+		}
 	} else {
 		pfn =3D page_to_pfn(page);
 	}
@@ -2834,16 +2837,24 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_=
pfn *kfp, struct page *page,
 static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
 	struct page *page;
+	bool r;
=20
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
=20
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
+	if (kfp->pin)
+		r =3D pin_user_pages_fast(kfp->hva, 1, FOLL_WRITE, &page) =3D=3D 1;
+	else
+		r =3D get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page);
+
+	if (r) {
 		*pfn =3D kvm_resolve_pfn(kfp, page, NULL, true);
 		return true;
 	}
@@ -2872,10 +2883,21 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *k=
fp, kvm_pfn_t *pfn)
 	struct page *page, *wpage;
 	int npages;
=20
-	npages =3D get_user_pages_unlocked(kfp->hva, 1, &page, flags);
+	if (kfp->pin)
+		npages =3D pin_user_pages_unlocked(kfp->hva, 1, &page, flags);
+	else
+		npages =3D get_user_pages_unlocked(kfp->hva, 1, &page, flags);
 	if (npages !=3D 1)
 		return npages;
=20
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
@@ -2884,6 +2906,7 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *kfp=
, kvm_pfn_t *pfn)
 		flags |=3D FOLL_WRITE;
 	}
=20
+out:
 	*pfn =3D kvm_resolve_pfn(kfp, page, NULL, flags & FOLL_WRITE);
 	return npages;
 }
@@ -3099,10 +3122,11 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, =
struct kvm_host_map *map)
 		.slot =3D gfn_to_memslot(vcpu->kvm, gfn),
 		.gfn =3D gfn,
 		.flags =3D FOLL_WRITE,
-		.refcounted_page =3D &map->refcounted_page,
+		.refcounted_page =3D &map->pinned_page,
+		.pin =3D true,
 	};
=20
-	map->refcounted_page =3D NULL;
+	map->pinned_page =3D NULL;
 	map->page =3D NULL;
 	map->hva =3D NULL;
 	map->gfn =3D gfn;
@@ -3139,16 +3163,16 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct k=
vm_host_map *map, bool dirty)
 	if (dirty)
 		kvm_vcpu_mark_page_dirty(vcpu, map->gfn);
=20
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
=20
 	map->hva =3D NULL;
 	map->page =3D NULL;
-	map->refcounted_page =3D NULL;
+	map->pinned_page =3D NULL;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
=20
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index d3ac1ba8ba66..acef3f5c582a 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -30,6 +30,13 @@ struct kvm_follow_pfn {
 	/* FOLL_* flags modifying lookup behavior, e.g. FOLL_WRITE. */
 	unsigned int flags;
=20
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
--=20
2.47.0.rc1.288.g06298d1525-goog


