Return-Path: <linuxppc-dev+bounces-2026-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 950FC999036
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:29:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdW024Dgz3bpt;
	Fri, 11 Oct 2024 05:26:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584780;
	cv=none; b=gxwEveLWKACoRYuA0SPdEivbkAjUpNEcOBKz9lv6VBmZnjn5xYsWq4HBGaFsJ7bpqWpM4PUjghkS4j7gBeEO1qw4XmA4AWiPl7falKOUh6+5FB8XtXrYQOSlBhRUuEsnYP5B1sr+iGkEZ0GQ2YinOXZv7t9gqK6ZY07eANRutXIuoPnk0tG89Ft7hk3BAX9IQe7wIaETBta+Uck+q4oAhqPIxUGs6yqhBn9gm9Cl01Jc+5+EaPOj7xGAJJjUXFUMhooHPQH5GNGfainZYDnQVBw0IxQnFiIQHmrOSYcCSPewDAJnCAJkRfvFq3dHlJfYpzpYrDBmnI0diHNr1GmRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584780; c=relaxed/relaxed;
	bh=sgK+YcjRpEQ+YhbfYv/o4akq/yPA2qNOXCMP41gc9EY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dnefkwyYAGc1Qz2GBtDVQMG79ts89aRbPP1YHgXEc+atI3Rqc9rNedUkIDyntpI6aV5J7kfGloyQxP+PQb+OkTWwg/sAjpLMZjuCxsNTj/jc4X5bdyTGXZAVYVychPmzpQrntOJ8bUsTNmvzTCyT7v8P4ihIswgVelBHuqcVWhxZY6Yn2jw6WAbTuDdhCE/Bd9j16wLXeLel9JDbzTM3BIjYDptDsXrWUcmavXCLcFPSvvKu5IW+rCEt+QECS5UuOUmytW/jHS7e0Au2PpqGtMqKnJ+matqKPHNfPtDuI3Ny3zEzglr3pEOGEo4SC9GGQZii8SNG15SpzE/Bfr1I7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AKltLbQH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3srwizwykdoaugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=AKltLbQH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3srwizwykdoaugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVz2jqsz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:19 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-20b6144cc2aso12174615ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584778; x=1729189578; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgK+YcjRpEQ+YhbfYv/o4akq/yPA2qNOXCMP41gc9EY=;
        b=AKltLbQHQgxvslglyzBqxgWiZ0p18Kzi5cIMdbblS5FCtZvofQAQQGIti1U9jQQU+R
         rxnLWE7rWAtPibmHisE0ALUg+8A4ynZGGJgSZPle0l8E6rSobdNyk5G8Dt5Ym9UlgGva
         1c1S3PQQfgsR33FogmQRq9fg3WMjk6Z6lRws84mfK9kKYiqpHUwphAk9Qktvm7MN6Eku
         dTnLYOcP7PbWwTZ1diUjRoYYojkYTKC8Uywyb/SAxBprszItRJ7WKvVPi9qKKk8al84b
         /7oEYQdw2AyTi8w8bOw6oL5lSLy4zlhtbtQGF8RQHpdf5ZQm/fZjxSNvihhfAIeoX/3b
         Y11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584778; x=1729189578;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sgK+YcjRpEQ+YhbfYv/o4akq/yPA2qNOXCMP41gc9EY=;
        b=Fk3vExntHbuh4vHeIbA6YbYnExCtgSpovPJXhp1Jjz24+ziAMju9phqo7SRwX8S51B
         z+IykSMzxaRT/VzrwvDYZFrVAyWXqc5Syj9VdCbyFTRriuITvehwkn2T0/Nf0/LaNBpC
         lizvREgzM2ypjmgXhL6LEb6gNaMMqVc4GSQ4sHaEHoi1oOdDD6ytNf3adOdGyku+PebF
         5DMH12P+TlNxTzzZ/hkRq9gdL6vLOd9e8nwv7G23NzimyVAqFNTD7uURMuJxOkbQlaex
         i2npM74LoexniatWFOg0cS2aH4SRKMULaMClDEfpaY/7U/7pI+uknltZ68vfSa2V49VY
         7uLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzmECfVNpo64Y9XxxLAhOcl8UaqImns1FaHs1tVZBcrZnJjpeJtwt7WaMviH420NgXZPhHFW5DV4LM+Nw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPwSago1QeRJMoqAomEIfDimyWPGIZYxN1s4gVwZVVv+mSsbva
	EAPRBBBMxNc760d7q9E73BLmA9wgx+5rLrDPXx61viFhFjY2f+MqfmZxQclNtCqNg9Mxe4R2NxW
	bgg==
X-Google-Smtp-Source: AGHT+IHgES02wxBmUBuw4MXImaMxOgBvLS6HzbS699NHinso/VI3SIlimd+hdhb5F/AgwxmTSyUtUzYKtBo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:ec85:b0:20b:7bfa:ac0f with SMTP id
 d9443c01a7336-20ca037f212mr485ad.1.1728584777475; Thu, 10 Oct 2024 11:26:17
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:43 -0700
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
Message-ID: <20241010182427.1434605-42-seanjc@google.com>
Subject: [PATCH v13 41/85] KVM: x86/mmu: Mark pages/folios dirty at the origin
 of make_spte()
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

Move the marking of folios dirty from make_spte() out to its callers,
which have access to the _struct page_, not just the underlying pfn.
Once all architectures follow suit, this will allow removing KVM's ugly
hack where KVM elevates the refcount of VM_MIXEDMAP pfns that happen to
be struct page memory.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 30 ++++++++++++++++++++++++++++--
 arch/x86/kvm/mmu/paging_tmpl.h |  5 +++++
 arch/x86/kvm/mmu/spte.c        | 11 -----------
 3 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 31a6ae41a6f4..f730870887dd 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2964,7 +2964,17 @@ static bool kvm_mmu_prefetch_sptes(struct kvm_vcpu *=
vcpu, gfn_t gfn, u64 *sptep,
 	for (i =3D 0; i < nr_pages; i++, gfn++, sptep++) {
 		mmu_set_spte(vcpu, slot, sptep, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
-		kvm_release_page_clean(pages[i]);
+
+		/*
+		 * KVM always prefetches writable pages from the primary MMU,
+		 * and KVM can make its SPTE writable in the fast page handler,
+		 * without notifying the primary MMU.  Mark pages/folios dirty
+		 * now to ensure file data is written back if it ends up being
+		 * written by the guest.  Because KVM's prefetching GUPs
+		 * writable PTEs, the probability of unnecessary writeback is
+		 * extremely low.
+		 */
+		kvm_release_page_dirty(pages[i]);
 	}
=20
 	return true;
@@ -4360,7 +4370,23 @@ static u8 kvm_max_private_mapping_level(struct kvm *=
kvm, kvm_pfn_t pfn,
 static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				      struct kvm_page_fault *fault, int r)
 {
-	kvm_release_pfn_clean(fault->pfn);
+	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
+			    r =3D=3D RET_PF_RETRY);
+
+	/*
+	 * If the page that KVM got from the *primary MMU* is writable, and KVM
+	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
+	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
+	 * the GFN is write-protected.  Folios can't be safely marked dirty
+	 * outside of mmu_lock as doing so could race with writeback on the
+	 * folio.  As a result, KVM can't mark folios dirty in the fast page
+	 * fault handler, and so KVM must (somewhat) speculatively mark the
+	 * folio dirty if KVM could locklessly make the SPTE writable.
+	 */
+	if (!fault->map_writable || r =3D=3D RET_PF_RETRY)
+		kvm_release_pfn_clean(fault->pfn);
+	else
+		kvm_release_pfn_dirty(fault->pfn);
 }
=20
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.=
h
index 35d0c3f1a789..f4711674c47b 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -954,6 +954,11 @@ static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, str=
uct kvm_mmu_page *sp, int
 		  spte_to_pfn(spte), spte, true, true,
 		  host_writable, &spte);
=20
+	/*
+	 * There is no need to mark the pfn dirty, as the new protections must
+	 * be a subset of the old protections, i.e. synchronizing a SPTE cannot
+	 * change the SPTE from read-only to writable.
+	 */
 	return mmu_spte_update(sptep, spte);
 }
=20
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 8e8d6ee79c8b..f1a50a78badb 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -277,17 +277,6 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_p=
age *sp,
 		mark_page_dirty_in_slot(vcpu->kvm, slot, gfn);
 	}
=20
-	/*
-	 * If the page that KVM got from the primary MMU is writable, i.e. if
-	 * it's host-writable, mark the page/folio dirty.  As alluded to above,
-	 * folios can't be safely marked dirty in the fast page fault handler,
-	 * and so KVM must (somewhat) speculatively mark the folio dirty even
-	 * though it isn't guaranteed to be written as KVM won't mark the folio
-	 * dirty if/when the SPTE is made writable.
-	 */
-	if (host_writable)
-		kvm_set_pfn_dirty(pfn);
-
 	*new_spte =3D spte;
 	return wrprot;
 }
--=20
2.47.0.rc1.288.g06298d1525-goog


