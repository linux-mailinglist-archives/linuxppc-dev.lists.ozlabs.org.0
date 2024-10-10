Return-Path: <linuxppc-dev+bounces-1994-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3E9998FED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:25:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTk0mh6z3blZ;
	Fri, 11 Oct 2024 05:25:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584714;
	cv=none; b=MGaG9a/ao9fnTYUAcx25QDR1cebdNHyzEpqGWxDer4exUTLqvmVSqtkQptCXhoXqvfecC+ZDF7l3vYvqUfztOnmhkkPd8nfa5Fy9jy2hw6qdoV9z4j9tbyIp96cnW/XEWwM7+1ABB9tezk8El58VAZcKz70lwieL3eG375vfXk/0tKec+AT2Ta0vsIHzoMqIpvCQmSSBzPiN6BdFiPPXRcGJfiIrx1Rfq9u7F79kbqBhyUMq/J4PvFw1DfpFMbGF/E53AzsCW+FsYQ5uWU+W8TxJMeBntOYn4tD6LtgWoFuhGmI9FleeDcFp/qe9F86vuodC6Mpc+9sRkiCN5cRpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584714; c=relaxed/relaxed;
	bh=0ix/Xs4/Qn/2DvOT3Bh000Q598gzWwOGIiO61AJ4Bto=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UaW80+TTFHBeNHjC/PoU76pfVhiSsIpxKRcuF6HUzhF95JZOpIT3YWRNaYMgUNAZ6ZwJYo0a9lj5WEmt5DL0H94BxGCvMDks8VPgFh2rR0BHZcZChx5/1X2JxCAItMB15Ce8qzZyrfiR/BxN/Qr6AI99ldQrRPAVJ8ZeiUGUhllBmj3n4lVZfpIzBFz+rdBkdkp8TIrrkoIv+VI4Fc/yYOimlal8wWa3LYI2v+xpjTQhycRybsRxX4gdMhLb2JXlGkg/3LvFmJefY1PIWwgEpwsVJt8bH+zXkBaC/abATLUcF6V/VKz0PCShYkb6sDtMTmqd9LmItRDd62742Lk5Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kq7Tzy/l; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3bxwizwykdj4qc8lhaemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kq7Tzy/l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3bxwizwykdj4qc8lhaemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTj0Tpqz3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:13 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e1fbe2a6b1so23249397b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584711; x=1729189511; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ix/Xs4/Qn/2DvOT3Bh000Q598gzWwOGIiO61AJ4Bto=;
        b=kq7Tzy/lmwDLmCw+D/g4lx8X5+BuuAdMd/yIH3cuJ3UnWLlvsKSl4F0zSHGDS/Zy60
         vYVNh7UJnE2yDogYxdmZ9nTY1BBulI5biEWWtDMwjGB9oJEpryLTz8HRRcbAVcXRxG7U
         eRWZhV1q6cmXcZZCHRzv6sHAIteR0rHfy5hLjw30KGKh1bNv/azUnxofNodzkIXjMWWt
         g9q0aEkPNR0mkVEYEewkk+Ht1YOHVgdcdAbcXffcg+vUOIfqPNcEVW8jLAmsV+Sfk9ut
         Ced4ENvveqzYq4chEv0teiuhw7coKa06KsYzRve587DGNvdFymzMMg0LCLeMZMrKEtR5
         lbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584711; x=1729189511;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ix/Xs4/Qn/2DvOT3Bh000Q598gzWwOGIiO61AJ4Bto=;
        b=Bqqr6sUJdSoRDG7dEt23zRZ8M2bXscaUof+O274cDpb3KPDZzJGW01UUMxBp+aMkKD
         J45CNKXrSNaUrK6oHkdmeEDxJRKd5wM+41Rk12MPS6RqyIkWbc80kt+WiEXyNvWohowW
         oAwPBm2YO6H1TgbkMR00wE3vqzJydQiY+1HeQgZLWQysUBe/jzAvPWMKvODNv3OOYvQg
         t1e1aILNhF4/UISCVpGjcT8ulzP0L+W6yvzFYG7eEfqvrDfkpB/lZubYXLo4kmDRRcWK
         wlBNsZRybzOIWq4Bvo3hE1MbIwRM/HyYwSwHJLr2dcLcATHdps4tXgub4P+DjS1Lbyop
         S4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2G5noCtm756A3JwomDRVp1lYGX8sFVtIbrGtQsATrVc0T5L8tMrehrIHJ0H7sDyYBzrFbWrU5Y/dNVvw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8g6uGELylR1yMTAu6rEhDQmNdKS0ySlNW0uguB+IccQn5kQbf
	iKdr4IF22c5GwooWRsfie+zSCmZp5YpDEw0ETOiWuqiMdaYypp8tBxdzsChskA6FUVJmodVNrih
	nIw==
X-Google-Smtp-Source: AGHT+IGD2TfP2dloLIlDYfRlI1lvmWPD7YUtu8EYW3dxRXY7JxJbZQIAJnuRF8jcBfCYGhk25T1qJs7AAuY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:5b41:b0:6db:c6ac:62a0 with SMTP id
 00721157ae682-6e322305467mr243067b3.5.1728584711093; Thu, 10 Oct 2024
 11:25:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:11 -0700
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
Message-ID: <20241010182427.1434605-10-seanjc@google.com>
Subject: [PATCH v13 09/85] KVM: x86/mmu: Mark page/folio accessed only when
 zapping leaf SPTEs
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

Now that KVM doesn't clobber Accessed bits of shadow-present SPTEs,
e.g. when prefetching, mark folios as accessed only when zapping leaf
SPTEs, which is a rough heuristic for "only in response to an mmu_notifier
invalidation".  Page aging and LRUs are tolerant of false negatives, i.e.
KVM doesn't need to be precise for correctness, and re-marking folios as
accessed when zapping entire roots or when zapping collapsible SPTEs is
expensive and adds very little value.

E.g. when a VM is dying, all of its memory is being freed; marking folios
accessed at that time provides no known value.  Similarly, because KVM
marks folios as accessed when creating SPTEs, marking all folios as
accessed when userspace happens to delete a memslot doesn't add value.
The folio was marked access when the old SPTE was created, and will be
marked accessed yet again if a vCPU accesses the pfn again after reloading
a new root.  Zapping collapsible SPTEs is a similar story; marking folios
accessed just because userspace disable dirty logging is a side effect of
KVM behavior, not a deliberate goal.

As an intermediate step, a.k.a. bisection point, towards *never* marking
folios accessed when dropping SPTEs, mark folios accessed when the primary
MMU might be invalidating mappings, as such zappings are not KVM initiated,
i.e. might actually be related to page aging and LRU activity.

Note, x86 is the only KVM architecture that "double dips"; every other
arch marks pfns as accessed only when mapping into the guest, not when
mapping into the guest _and_ when removing from the guest.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/locking.rst | 76 +++++++++++++++---------------
 arch/x86/kvm/mmu/mmu.c             |  4 +-
 arch/x86/kvm/mmu/tdp_mmu.c         |  7 ++-
 3 files changed, 43 insertions(+), 44 deletions(-)

diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/lo=
cking.rst
index 20a9a37d1cdd..3d8bf40ca448 100644
--- a/Documentation/virt/kvm/locking.rst
+++ b/Documentation/virt/kvm/locking.rst
@@ -147,49 +147,51 @@ Then, we can ensure the dirty bitmaps is correctly se=
t for a gfn.
=20
 2) Dirty bit tracking
=20
-In the origin code, the spte can be fast updated (non-atomically) if the
+In the original code, the spte can be fast updated (non-atomically) if the
 spte is read-only and the Accessed bit has already been set since the
 Accessed bit and Dirty bit can not be lost.
=20
 But it is not true after fast page fault since the spte can be marked
 writable between reading spte and updating spte. Like below case:
=20
-+------------------------------------------------------------------------+
-| At the beginning::                                                     |
-|                                                                        |
-|	spte.W =3D 0                                                       |
-|	spte.Accessed =3D 1                                                |
-+------------------------------------+-----------------------------------+
-| CPU 0:                             | CPU 1:                            |
-+------------------------------------+-----------------------------------+
-| In mmu_spte_clear_track_bits()::   |                                   |
-|                                    |                                   |
-|  old_spte =3D *spte;                 |                                  =
 |
-|                                    |                                   |
-|                                    |                                   |
-|  /* 'if' condition is satisfied. */|                                   |
-|  if (old_spte.Accessed =3D=3D 1 &&     |                                =
   |
-|       old_spte.W =3D=3D 0)             |                                =
   |
-|     spte =3D 0ull;                   |                                  =
 |
-+------------------------------------+-----------------------------------+
-|                                    | on fast page fault path::         |
-|                                    |                                   |
-|                                    |    spte.W =3D 1                    =
 |
-|                                    |                                   |
-|                                    | memory write on the spte::        |
-|                                    |                                   |
-|                                    |    spte.Dirty =3D 1                =
 |
-+------------------------------------+-----------------------------------+
-|  ::                                |                                   |
-|                                    |                                   |
-|   else                             |                                   |
-|     old_spte =3D xchg(spte, 0ull)    |                                  =
 |
-|   if (old_spte.Accessed =3D=3D 1)      |                                =
   |
-|     kvm_set_pfn_accessed(spte.pfn);|                                   |
-|   if (old_spte.Dirty =3D=3D 1)         |                                =
   |
-|     kvm_set_pfn_dirty(spte.pfn);   |                                   |
-|     OOPS!!!                        |                                   |
-+------------------------------------+-----------------------------------+
++-------------------------------------------------------------------------=
+
+| At the beginning::                                                      =
|
+|                                                                         =
|
+|	spte.W =3D 0                                                            =
  |
+|	spte.Accessed =3D 1                                                     =
  |
++-------------------------------------+-----------------------------------=
+
+| CPU 0:                              | CPU 1:                            =
|
++-------------------------------------+-----------------------------------=
+
+| In mmu_spte_update()::              |                                   =
|
+|                                     |                                   =
|
+|  old_spte =3D *spte;                  |                                 =
  |
+|                                     |                                   =
|
+|                                     |                                   =
|
+|  /* 'if' condition is satisfied. */ |                                   =
|
+|  if (old_spte.Accessed =3D=3D 1 &&      |                               =
    |
+|       old_spte.W =3D=3D 0)              |                               =
    |
+|     spte =3D new_spte;                |                                 =
  |
++-------------------------------------+-----------------------------------=
+
+|                                     | on fast page fault path::         =
|
+|                                     |                                   =
|
+|                                     |    spte.W =3D 1                   =
  |
+|                                     |                                   =
|
+|                                     | memory write on the spte::        =
|
+|                                     |                                   =
|
+|                                     |    spte.Dirty =3D 1               =
  |
++-------------------------------------+-----------------------------------=
+
+|  ::                                 |                                   =
|
+|                                     |                                   =
|
+|   else                              |                                   =
|
+|     old_spte =3D xchg(spte, new_spte);|                                 =
  |
+|   if (old_spte.Accessed &&          |                                   =
|
+|       !new_spte.Accessed)           |                                   =
|
+|     flush =3D true;                   |                                 =
  |
+|   if (old_spte.Dirty &&             |                                   =
|
+|       !new_spte.Dirty)              |                                   =
|
+|     flush =3D true;                   |                                 =
  |
+|     OOPS!!!                         |                                   =
|
++-------------------------------------+-----------------------------------=
+
=20
 The Dirty bit is lost in this case.
=20
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 1ae823ebd12b..04228a7da69a 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -542,10 +542,8 @@ static bool mmu_spte_update(u64 *sptep, u64 new_spte)
 	 * to guarantee consistency between TLB and page tables.
 	 */
=20
-	if (is_accessed_spte(old_spte) && !is_accessed_spte(new_spte)) {
+	if (is_accessed_spte(old_spte) && !is_accessed_spte(new_spte))
 		flush =3D true;
-		kvm_set_pfn_accessed(spte_to_pfn(old_spte));
-	}
=20
 	if (is_dirty_spte(old_spte) && !is_dirty_spte(new_spte))
 		flush =3D true;
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 517b384473c1..8aa0d7a7602b 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -520,10 +520,6 @@ static void handle_changed_spte(struct kvm *kvm, int a=
s_id, gfn_t gfn,
 	if (was_present && !was_leaf &&
 	    (is_leaf || !is_present || WARN_ON_ONCE(pfn_changed)))
 		handle_removed_pt(kvm, spte_to_child_pt(old_spte, level), shared);
-
-	if (was_leaf && is_accessed_spte(old_spte) &&
-	    (!is_present || !is_accessed_spte(new_spte) || pfn_changed))
-		kvm_set_pfn_accessed(spte_to_pfn(old_spte));
 }
=20
 static inline int __must_check __tdp_mmu_set_spte_atomic(struct tdp_iter *=
iter,
@@ -865,6 +861,9 @@ static bool tdp_mmu_zap_leafs(struct kvm *kvm, struct k=
vm_mmu_page *root,
=20
 		tdp_mmu_iter_set_spte(kvm, &iter, SHADOW_NONPRESENT_VALUE);
=20
+		if (is_accessed_spte(iter.old_spte))
+			kvm_set_pfn_accessed(spte_to_pfn(iter.old_spte));
+
 		/*
 		 * Zappings SPTEs in invalid roots doesn't require a TLB flush,
 		 * see kvm_tdp_mmu_zap_invalidated_roots() for details.
--=20
2.47.0.rc1.288.g06298d1525-goog


