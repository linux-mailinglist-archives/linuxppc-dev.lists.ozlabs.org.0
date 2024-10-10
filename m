Return-Path: <linuxppc-dev+bounces-1992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFFB998FEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:25:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTd6zlMz3bnr;
	Fri, 11 Oct 2024 05:25:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584709;
	cv=none; b=eHTCDkdN7K+o9D3J/Zl0LLbUds5/8ct+MuFWA0Ws1rQdnsgLeY0BterwmSLoGY7WJYDAtXwgiBVyD82yOrda+FQAVVN06SN2CG3G+VrnnNTENtBN6ZHgJ+iEAQ9AXgZqoj1Z7jRBJ2cYi4TroMIDEI50BslItvWt8lOo+fGn4GG7oZUfCBsyagkEsQzRYbafWRTEOPqmqMt/+Flud4IxcjWbz0fT41MmSZB8hD3P0in1buZ8Nkq7mInvosocDSpEpt3q3iupldxAAFEEZ/r58Bisnt5qZht/6HAV2qjmznaxshrwsuHGIVhSl5klpsM6B3vQw67VP4apFdYxzz9niA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584709; c=relaxed/relaxed;
	bh=GZoCfd92gqYHwqsSYOai9KQfQ7K6dxh+JWKccmiJTPU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PpYYL3YCMkaZi1767SplbD+HcuBl/GExJC/wqGPId6lrqpKY/RMJ/siX45LRoEsZQ0MrS9ZXYGzfloZPS1lqpXQMgAvH2UK3w10SL+50aDWZ3DsV2MoVISvGnt052ecJZbFUGjKDXxgBg2m+91hX9wZ4sEhrO/hEXF/RJLkAnjuZduM3nzQblAaJ/0S/7iv6ZmYKjiCNCLC7v/Ceq/P1nLa7+SfJHqtdIQluetKSToJDho2K4qbNq8gnnDTcQQ3awAPr1EjDScxo0R7WY7tR8oXUEEm4gEmkzmp4mnp7Spq8P8nFkiJ15WkjaJyWN9zeC6b+60ZuVvziQNFZArQpVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=l+4jVIlr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3arwizwykdjgk62fb48gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=l+4jVIlr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3arwizwykdjgk62fb48gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTd1HQ8z3blZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:09 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2e2ca403f5dso1037018a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584707; x=1729189507; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=GZoCfd92gqYHwqsSYOai9KQfQ7K6dxh+JWKccmiJTPU=;
        b=l+4jVIlrMl9rNMW1lItZAN+0DrB5mAjjdmFq4ppTBPm9VSAJCp44uKMMXX1U3VV8A2
         o5AUpNr3j5wEkBbqO6mKuUN0fdiKf0RuRSXdzF6xe/YVR4zb/wD7rFAAZSXFUAmGMojj
         jFJoKYyT5xNLdnehG6+W+hentuiUqQuusJ8jjwu2L79X9tbIoCmD4dkMGkiD/eOTgfUJ
         Nu1MGOBNnp41Vt+hAtnKOOWGIWcs0Els1emFRvnDwiuj3AbwRz0Or6jl29WT76d+LMGu
         QxE5R/ASYN5S1krrYPW69JpkU3sxlInUObV7Qurk74y7sWOnNJak34Ycq8wlUIQ2eKYh
         IjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584707; x=1729189507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZoCfd92gqYHwqsSYOai9KQfQ7K6dxh+JWKccmiJTPU=;
        b=GIuAJFuRxlQijNTy8ZSFis0iWgFwSLXY7iXBUnClobU0RkvtH5lZMHXzICaAKcUKiH
         v2LBnLwkq6SsbGYkdLjvpxJj5G8NDJaDT6UYrTbCTJN9LWih8GzSsB3mCcFpkRHvoNUV
         sam/ol7aKi0tnNwk3/pW/30KG/26zR4Z/I5WtbDq4isnefPgf7VURw8EUfjU1X2x/f1o
         /uw6gIq7Gt5HQGyU0yzCcVEOXPnFJa3qK4ILJXjGjCSAMm+TEQqG3MvjkPC1Fr+5vJqa
         nbjz/qqB7aiIk1SFtvFwXb/bjZFs4kkFAWxeZxy3927E5Shpuf6qmeBjjxcrMUHf3Ykc
         iriQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfX4Ml3VYSV5UHpEn1EnaLllAzxASl66KAC8XrBUylnLXC9uDr3NW7qFLvHE0TNLKlbLiuCyjnpIqs0MI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyk3Z97IVoQgw5nAyMndqeFzS5h2xRpwFj04hXQgWTg4U+bKmgr
	W3jECY/2Igq8IIENjtCZkNPI6ovEQhHevJvSNN35IDDYJgX43nqKvSYmPuFmEQFrdbbGd6AuxqU
	MjQ==
X-Google-Smtp-Source: AGHT+IH8UDk7ruln14ZDsSWqbj1uDcx7028dIle1wpc1As3ec3XNWN4cizl8I1jAsp9rsgJdiTjtCNc1iNw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:fa84:b0:2e2:da81:40c6 with SMTP id
 98e67ed59e1d1-2e2f0a524d4mr44a91.2.1728584705592; Thu, 10 Oct 2024 11:25:05
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:09 -0700
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
Message-ID: <20241010182427.1434605-8-seanjc@google.com>
Subject: [PATCH v13 07/85] KVM: x86/mmu: Mark new SPTE as Accessed when
 synchronizing existing SPTE
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
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Set the Accessed bit when making a "new" SPTE during SPTE synchronization,
as _clearing_ the Accessed bit is counter-productive, and even if the
Accessed bit wasn't set in the old SPTE, odds are very good the guest will
access the page in the near future, as the most common case where KVM
synchronizes a shadow-present SPTE is when the guest is making the gPTE
read-only for Copy-on-Write (CoW).

Preserving the Accessed bit will allow dropping the logic that propagates
the Accessed bit to the underlying struct page when overwriting an existing
SPTE, without undue risk of regressing page aging.

Note, KVM's current behavior is very deliberate, as SPTE synchronization
was the only "speculative" access type as of commit 947da5383069 ("KVM:
MMU: Set the accessed bit on non-speculative shadow ptes").

But, much has changed since 2008, and more changes are on the horizon.
Spurious clearing of the Accessed (and Dirty) was mitigated by commit
e6722d9211b2 ("KVM: x86/mmu: Reduce the update to the spte in
FNAME(sync_spte)"), which changed FNAME(sync_spte) to only overwrite SPTEs
if the protections are actually changing.  I.e. KVM is already preserving
Accessed information for SPTEs that aren't dropping protections.

And with the aforementioned future change to NOT mark the page/folio as
accessed, KVM's SPTEs will become the "source of truth" so to speak, in
which case clearing the Accessed bit outside of page aging becomes very
undesirable.

Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/spte.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 0e47fea1a2d9..618059b30b8b 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -178,7 +178,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		spte |= SPTE_TDP_AD_WRPROT_ONLY;
 
 	spte |= shadow_present_mask;
-	if (!prefetch)
+	if (!prefetch || synchronizing)
 		spte |= spte_shadow_accessed_mask(spte);
 
 	/*
@@ -259,7 +259,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		spte |= spte_shadow_dirty_mask(spte);
 
 out:
-	if (prefetch)
+	if (prefetch && !synchronizing)
 		spte = mark_spte_for_access_track(spte);
 
 	WARN_ONCE(is_rsvd_spte(&vcpu->arch.mmu->shadow_zero_check, spte, level),
-- 
2.47.0.rc1.288.g06298d1525-goog


