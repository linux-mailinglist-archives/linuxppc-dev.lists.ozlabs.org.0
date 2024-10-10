Return-Path: <linuxppc-dev+bounces-2012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6467B999017
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:27:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVR6KtKz3c2K;
	Fri, 11 Oct 2024 05:25:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584751;
	cv=none; b=QKDGetBSQoaacyTk3UCT0IWchp+RU3hn/jANf07fLAwZKSQLNjAiCYI+PL/KzfOT2g/cXGmgzwMV5eJ2I9QKVvHxYS3pF5QdGT/WcAn5OfybBObFe1b5NHqTD879AXCU3zqpM8RIY9DN2v9gWsKhs99vLnqGA/TrGIbE0a+nlxn/qb2IpAIbff8tGxGfRRRy+3uL/A/53SPLJJAfik1vG/Zr5soJN+KtGvWmiI3bRDg4vqaiG2OmNiDsobKxVc+8y/E3/NJt34bQVLrtPN3WfRAozFEgN5GAbbuXaUAOBSHsGhhxO4oXS4rvWL4DnQ/qk2VapOz28OYvoClUqA8b+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584751; c=relaxed/relaxed;
	bh=txhtY6exXDaGFQAWYGvmt09bjeoYz319F03IR2k/C3M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BVY47ZEp2l3ZgYFEBdD46C8jJF0uK5aiHOgQh1KS0SshD4doYwi1kDcuX/V4Yd0UOv5RNZVbuTLi9sJCinvNCraWb89uAeG9+jBLUk602DhDmK6NcfyYLiN3gZXIpwfLZWPBG9woUJ8MFShiKE3u0X01aBm618kHM1Hck5cqA8KC5AKVR1DkVzOluI0n5jM7M1MfDN7BkKzweAGee/H5nBu2t+wNoyZar8a8A9bTUkn4QLS+xjA6ddx1UpIeNYQczuTsN7jsqyaHoK8pvQZ5Mmlo7SvoQupckYiuzC+vgTzWqzfXDKhS8CLEZgS1NFqWWKbN1QWjNPzQ+JIBejZGag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DKIBKDKk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3lrwizwykdmq2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=DKIBKDKk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3lrwizwykdmq2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVQ6vymz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:50 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71e01bfe040so1421847b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584749; x=1729189549; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txhtY6exXDaGFQAWYGvmt09bjeoYz319F03IR2k/C3M=;
        b=DKIBKDKkOmsZm6raSMqaIAU0DJT8NknDeTzJaQWsfCXmNDPqgN0a5TwjBZFmuI46HK
         Ukdv5tjwv6pexxq9xErIcl9xTBY3VG9/ByGXgRYgOnd3C4Cd5+q7GzuFcK49dEFPvJzi
         cYaahv2ORlUTBJqd0gEUuc5n5vcDVJ4s5fA8iQfBgiwhn1er1OFs/zcF36kz3H7Uw4Pb
         /N5qm2aTVE4ujxFDQ94N/xPjH8MnmwwYW9nfm5TyLA2nm1lw6ijw00Ye+erxrD/YbEjN
         uWIpYQR8Sc62coM72SzxFvqjStzEk2nOOGevd5Kelg4kCGBMaaTiIobSFM9X9G91Vg+V
         U+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584749; x=1729189549;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=txhtY6exXDaGFQAWYGvmt09bjeoYz319F03IR2k/C3M=;
        b=PEF2N7ch8xxsvnO0gkdCgA8TZ0+2Cj7LKCNhEChddhOISmpZWuSCEc6KeBmzYTd+eb
         dF4JQnc9JqoORc3en/LNCyb1hq3xAi3avqMiHMQBysh3dLhuUatLmlMN6Lz+B3g3Ctca
         JQVf0xmfaxAbAyP4R2lNdbG5S7RBovPDMZBK3Gq5V+Kwop6e+vOuKtvlT24Ao8Pxm5tG
         fXh1lL0J98pF6XMI3z1De0XWwcP0LRvmsYd+hkzBUkWWa5KGiTonC+ALK0Ktot2jOTfk
         s165Az3IvPoRRR/WTMAO9j+ujBiD+Oimb+utMolwpnzO9LpK0LDeERXAgFX0B4ckMjVz
         FU1A==
X-Forwarded-Encrypted: i=1; AJvYcCVxW29gorsRQ4291Gu5DpRQGYnLhlW6EXIQOzOf/neWD+qSAqBMZpO5qEseXHphKZiin7By5ua0Sk6oveo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyP8acc91eESDurRyZpjtSgogx+STQREx+s/INNVcESfHTWoYda
	aWTAdYaE7EWj8lT4XPwKfJecRwx0Da+g9nfPbwfkAQ8PLA83zAPwm/oHsHzjxLURom3vtOcZbkL
	wjw==
X-Google-Smtp-Source: AGHT+IE/uLa8aldzd4vJMnq+De69DiThAuVt+3q8zF6rqxlBj2/ZKo7+FHCoJyy45GpCD4mZjJfGV3U05Tk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d8a:b0:71d:f1f9:b982 with SMTP id
 d2e1a72fcca58-71e1dc00b9cmr38199b3a.6.1728584749206; Thu, 10 Oct 2024
 11:25:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:29 -0700
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
Message-ID: <20241010182427.1434605-28-seanjc@google.com>
Subject: [PATCH v13 27/85] KVM: Provide refcounted page as output field in
 struct kvm_follow_pfn
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

Add kvm_follow_pfn.refcounted_page as an output for the "to pfn" APIs to
"return" the struct page that is associated with the returned pfn (if KVM
acquired a reference to the page).  This will eventually allow removing
KVM's hacky kvm_pfn_to_refcounted_page() code, which is error prone and
can't detect pfns that are valid, but aren't (currently) refcounted.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 99 +++++++++++++++++++++------------------------
 virt/kvm/kvm_mm.h   |  9 +++++
 2 files changed, 56 insertions(+), 52 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d3e48fcc4fb0..e29f78ed6f48 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2746,6 +2746,46 @@ unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vc=
pu *vcpu, gfn_t gfn, bool *w
 	return gfn_to_hva_memslot_prot(slot, gfn, writable);
 }
=20
+static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *=
page,
+				 struct follow_pfnmap_args *map, bool writable)
+{
+	kvm_pfn_t pfn;
+
+	WARN_ON_ONCE(!!page =3D=3D !!map);
+
+	if (kfp->map_writable)
+		*kfp->map_writable =3D writable;
+
+	/*
+	 * FIXME: Remove this once KVM no longer blindly calls put_page() on
+	 *	  every pfn that points at a struct page.
+	 *
+	 * Get a reference for follow_pte() pfns if they happen to point at a
+	 * struct page, as KVM will ultimately call kvm_release_pfn_clean() on
+	 * the returned pfn, i.e. KVM expects to have a reference.
+	 *
+	 * Certain IO or PFNMAP mappings can be backed with valid struct pages,
+	 * but be allocated without refcounting, e.g. tail pages of
+	 * non-compound higher order allocations.  Grabbing and putting a
+	 * reference to such pages would cause KVM to prematurely free a page
+	 * it doesn't own (KVM gets and puts the one and only reference).
+	 * Don't allow those pages until the FIXME is resolved.
+	 */
+	if (map) {
+		pfn =3D map->pfn;
+		page =3D kvm_pfn_to_refcounted_page(pfn);
+		if (page && !get_page_unless_zero(page))
+			return KVM_PFN_ERR_FAULT;
+	} else {
+		pfn =3D page_to_pfn(page);
+	}
+
+	if (kfp->refcounted_page)
+		*kfp->refcounted_page =3D page;
+
+	return pfn;
+}
+
 /*
  * The fast path to get the writable pfn which will be stored in @pfn,
  * true indicates success, otherwise false is returned.
@@ -2763,9 +2803,7 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *kf=
p, kvm_pfn_t *pfn)
 		return false;
=20
 	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
-		*pfn =3D page_to_pfn(page);
-		if (kfp->map_writable)
-			*kfp->map_writable =3D true;
+		*pfn =3D kvm_resolve_pfn(kfp, page, NULL, true);
 		return true;
 	}
=20
@@ -2797,23 +2835,15 @@ static int hva_to_pfn_slow(struct kvm_follow_pfn *k=
fp, kvm_pfn_t *pfn)
 	if (npages !=3D 1)
 		return npages;
=20
-	if (!kfp->map_writable)
-		goto out;
-
-	if (kfp->flags & FOLL_WRITE) {
-		*kfp->map_writable =3D true;
-		goto out;
-	}
-
 	/* map read fault as writable if possible */
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
-		*kfp->map_writable =3D true;
+	if (!(flags & FOLL_WRITE) && kfp->map_writable &&
+	    get_user_page_fast_only(kfp->hva, FOLL_WRITE, &wpage)) {
 		put_page(page);
 		page =3D wpage;
+		flags |=3D FOLL_WRITE;
 	}
=20
-out:
-	*pfn =3D page_to_pfn(page);
+	*pfn =3D kvm_resolve_pfn(kfp, page, NULL, flags & FOLL_WRITE);
 	return npages;
 }
=20
@@ -2828,22 +2858,11 @@ static bool vma_is_valid(struct vm_area_struct *vma=
, bool write_fault)
 	return true;
 }
=20
-static int kvm_try_get_pfn(kvm_pfn_t pfn)
-{
-	struct page *page =3D kvm_pfn_to_refcounted_page(pfn);
-
-	if (!page)
-		return 1;
-
-	return get_page_unless_zero(page);
-}
-
 static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 			       struct kvm_follow_pfn *kfp, kvm_pfn_t *p_pfn)
 {
 	struct follow_pfnmap_args args =3D { .vma =3D vma, .address =3D kfp->hva =
};
 	bool write_fault =3D kfp->flags & FOLL_WRITE;
-	kvm_pfn_t pfn;
 	int r;
=20
 	r =3D follow_pfnmap_start(&args);
@@ -2867,37 +2886,13 @@ static int hva_to_pfn_remapped(struct vm_area_struc=
t *vma,
 	}
=20
 	if (write_fault && !args.writable) {
-		pfn =3D KVM_PFN_ERR_RO_FAULT;
+		*p_pfn =3D KVM_PFN_ERR_RO_FAULT;
 		goto out;
 	}
=20
-	if (kfp->map_writable)
-		*kfp->map_writable =3D args.writable;
-	pfn =3D args.pfn;
-
-	/*
-	 * Get a reference here because callers of *hva_to_pfn* and
-	 * *gfn_to_pfn* ultimately call kvm_release_pfn_clean on the
-	 * returned pfn.  This is only needed if the VMA has VM_MIXEDMAP
-	 * set, but the kvm_try_get_pfn/kvm_release_pfn_clean pair will
-	 * simply do nothing for reserved pfns.
-	 *
-	 * Whoever called remap_pfn_range is also going to call e.g.
-	 * unmap_mapping_range before the underlying pages are freed,
-	 * causing a call to our MMU notifier.
-	 *
-	 * Certain IO or PFNMAP mappings can be backed with valid
-	 * struct pages, but be allocated without refcounting e.g.,
-	 * tail pages of non-compound higher order allocations, which
-	 * would then underflow the refcount when the caller does the
-	 * required put_page. Don't allow those pages here.
-	 */
-	if (!kvm_try_get_pfn(pfn))
-		r =3D -EFAULT;
+	*p_pfn =3D kvm_resolve_pfn(kfp, NULL, &args, args.writable);
 out:
 	follow_pfnmap_end(&args);
-	*p_pfn =3D pfn;
-
 	return r;
 }
=20
diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
index d5a215958f06..d3ac1ba8ba66 100644
--- a/virt/kvm/kvm_mm.h
+++ b/virt/kvm/kvm_mm.h
@@ -35,6 +35,15 @@ struct kvm_follow_pfn {
 	 * Set to true if a writable mapping was obtained.
 	 */
 	bool *map_writable;
+
+	/*
+	 * Optional output.  Set to a valid "struct page" if the returned pfn
+	 * is for a refcounted or pinned struct page, NULL if the returned pfn
+	 * has no struct page or if the struct page is not being refcounted
+	 * (e.g. tail pages of non-compound higher order allocations from
+	 * IO/PFNMAP mappings).
+	 */
+	struct page **refcounted_page;
 };
=20
 kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp);
--=20
2.47.0.rc1.288.g06298d1525-goog


