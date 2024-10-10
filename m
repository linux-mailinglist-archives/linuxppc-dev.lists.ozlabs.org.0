Return-Path: <linuxppc-dev+bounces-2067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D3D99908A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:34:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXj3VzKz3cVV;
	Fri, 11 Oct 2024 05:27:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584869;
	cv=none; b=UTKvSkpQbTCihAywUkQnuGHKM90E3CRD4rwQVTjYmp/dZTUFuMynT13ErAEiA8WDgu88PiiTsjqtmbomCJB7ixhM2WvnYkLY5PMHak6GJSTN01Y1htYOYMsN++qEbEfQdun3nSykAga2E9NVvClGvbttO6MapZlLkuU0mYzX4erpNKvHDpB8wd/xI+aFWTZStI5q5e8G91BoHevIrdM5Ts/9q53HD7iEvCgyGvsMF3koYmAgmsKkA5tk/Dk9gP1omROZXrbRmc4BMYLtZLgEJdAPkIqG5mKlcdDvI93PwzFX9Y5JW8iBajJH9ZjuzKyy8z2SfvoA+/DaI5uAXSh/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584869; c=relaxed/relaxed;
	bh=l0R/snR1lBsefu+Gd9v26W9gBjpskR/lINZXMlcZUSs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kkK+2TIuMVt+RsafPyHBX6MgNtFc3q+UYbYxbUvGNn+JGTs4CtXjpSMN3SXhg5phNELwGzbMIoDmsFwgfhnwoSAJdKzdyk+GLjBTqjUISpspJHx4YreQmOFt2INf2FXSSlOmldk2TkccDyiLva6FFYXvdR5bmXvYb4JTR29Z7kUHjZtyTZMgIIsoRdo0q2vsydd2fqdyXrKX4MUI8Bj5hKIswa6kBwQv2teSRQAGFkiJM3gtuwQbIZiYo9K3c/OU/lw+tV93Ljd9b7xaHLLCQh5W3MMRbWDiYjsC4awGvEi1IVFCe2+LyDvkbuZjYyb5/fQ6vXDDnH9doiaJIGgZKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xBw20qAX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ohwizwykddspbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xBw20qAX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ohwizwykddspbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXh4DSyz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:48 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e2e5e376fcso26578357b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584866; x=1729189666; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0R/snR1lBsefu+Gd9v26W9gBjpskR/lINZXMlcZUSs=;
        b=xBw20qAXh/tLDCs6oeIeyOsGtxSYyBoGZEVl0g+KVKytMoVVjzZ/dCDIOcBJXTdfF8
         RqVtUOg+8lJq60kMzUopchM9Lh1IsBr4o0fN4dgQmvDhHalN4sChTPqlGjLEC5VIbjwx
         FiMI/hUiWvwrQD3iwng9LlR4wA/kWb2mSooODPq20ZwCddpuxR7wiW725x7x/vy+MEc+
         5eND6Of9Qzath+M6xCBJ5XZwQ2IiBle9zWusTL38/6MELnjdoKE/VGuL/HjBjet08DIS
         Bvx9Vju1itLJZdLsSdxnNVCkNTRRXQ/F710UPLp+Zc/QgrjiFDzWAnAqF1rRAj5JfFai
         8QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584866; x=1729189666;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l0R/snR1lBsefu+Gd9v26W9gBjpskR/lINZXMlcZUSs=;
        b=jv8nkszuuN3bZp0UXPAdzybBNrNBujBFF2DWGaUqqBC3tu5QvSN9yaRfC2rqdnVmxQ
         N9FGvDJj0nz634bhztJN5Rc8FqfBjbjfdcKkejuakUZ2DNpAQO0oztLdZXoqUMLeOfuo
         8NMtIDdOaz/HSmeqmO1fEJ5GOCtRz/LrIe8Fyv1/yQtoBaZQT8wcRTlz6dr+XX8lxXHx
         4jJxOscpKkM9yowMW7QlxzeC+V9NIJFHqZsiu7ytLhhzJ6RblcNsANuQLMqj7MEU33xQ
         YYfBOoMliUPXxZZMECGZG89KCkmz1sNCHi3mhBkLTDxNh+JE59PFXapGua8EKUyQRt7S
         hCMA==
X-Forwarded-Encrypted: i=1; AJvYcCXgvOjRHNYZl8H7oj4bQwJIyQjb4DjHEWq07eeSiCMLsgtPfiIJ9XyjCv8gpx9LXyw/ZFMskx+WHoFZSmA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyirNVxqhtX64NzJsZWS695mZqFHqCXCHoG2EtULvH4GIiuIUss
	zfnexncXUgOqTESsucqpgyp1Erf4ssjlltim3D69youcrtthgETcDXSCaa/J+pfIgZDuLZK4ETN
	eYw==
X-Google-Smtp-Source: AGHT+IE49fRlqLzz+ddXUJ4fW719WQNIEaF+exc+KxAZEodOOT6YKCh59uZdX+xzyPwnVHJ15Mb6QwFZ+jU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:470f:b0:6e3:39e5:f0e8 with SMTP id
 00721157ae682-6e339e5f461mr119227b3.6.1728584866570; Thu, 10 Oct 2024
 11:27:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:24 -0700
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
Message-ID: <20241010182427.1434605-83-seanjc@google.com>
Subject: [PATCH v13 82/85] KVM: x86/mmu: Don't mark "struct page" accessed
 when zapping SPTEs
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

Don't mark pages/folios as accessed in the primary MMU when zapping SPTEs,
as doing so relies on kvm_pfn_to_refcounted_page(), and generally speaking
is unnecessary and wasteful.  KVM participates in page aging via
mmu_notifiers, so there's no need to push "accessed" updates to the
primary MMU.

And if KVM zaps a SPTe in response to an mmu_notifier, marking it accessed
_after_ the primary MMU has decided to zap the page is likely to go
unnoticed, i.e. odds are good that, if the page is being zapped for
reclaim, the page will be swapped out regardless of whether or not KVM
marks the page accessed.

Dropping x86's use of kvm_set_pfn_accessed() also paves the way for
removing kvm_pfn_to_refcounted_page() and all its users.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 17 -----------------
 arch/x86/kvm/mmu/tdp_mmu.c |  3 ---
 2 files changed, 20 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 5acdaf3b1007..55eeca931e23 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -559,10 +559,8 @@ static bool mmu_spte_update(u64 *sptep, u64 new_spte)
  */
 static u64 mmu_spte_clear_track_bits(struct kvm *kvm, u64 *sptep)
 {
-	kvm_pfn_t pfn;
 	u64 old_spte =3D *sptep;
 	int level =3D sptep_to_sp(sptep)->role.level;
-	struct page *page;
=20
 	if (!is_shadow_present_pte(old_spte) ||
 	    !spte_has_volatile_bits(old_spte))
@@ -574,21 +572,6 @@ static u64 mmu_spte_clear_track_bits(struct kvm *kvm, =
u64 *sptep)
 		return old_spte;
=20
 	kvm_update_page_stats(kvm, level, -1);
-
-	pfn =3D spte_to_pfn(old_spte);
-
-	/*
-	 * KVM doesn't hold a reference to any pages mapped into the guest, and
-	 * instead uses the mmu_notifier to ensure that KVM unmaps any pages
-	 * before they are reclaimed.  Sanity check that, if the pfn is backed
-	 * by a refcounted page, the refcount is elevated.
-	 */
-	page =3D kvm_pfn_to_refcounted_page(pfn);
-	WARN_ON_ONCE(page && !page_count(page));
-
-	if (is_accessed_spte(old_spte))
-		kvm_set_pfn_accessed(pfn);
-
 	return old_spte;
 }
=20
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 8aa0d7a7602b..91caa73a905b 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -861,9 +861,6 @@ static bool tdp_mmu_zap_leafs(struct kvm *kvm, struct k=
vm_mmu_page *root,
=20
 		tdp_mmu_iter_set_spte(kvm, &iter, SHADOW_NONPRESENT_VALUE);
=20
-		if (is_accessed_spte(iter.old_spte))
-			kvm_set_pfn_accessed(spte_to_pfn(iter.old_spte));
-
 		/*
 		 * Zappings SPTEs in invalid roots doesn't require a TLB flush,
 		 * see kvm_tdp_mmu_zap_invalidated_roots() for details.
--=20
2.47.0.rc1.288.g06298d1525-goog


