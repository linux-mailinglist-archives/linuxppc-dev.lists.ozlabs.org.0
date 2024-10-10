Return-Path: <linuxppc-dev+bounces-1990-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0053998FE6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:25:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTW6Tnmz3bmY;
	Fri, 11 Oct 2024 05:25:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584703;
	cv=none; b=MYz7IyzLAKuWdeMB4sm1TCQoY7l/kjw4i7V8HHhHcQH5pmjlO8+dzHc+Er+1HLJsBN2uGKUKAjMEJBBl5PCmKyk1Ge36SRS0es9SoLYTEJXL0LqaRZM66bwYDTwgASvuh5Hb2L20PVABxP6xVciJRt6Ncb4jQ/fBwpYu5tzUr1BuexjURqnu1noer5/23WlE2bo90Ry1SLiYWxCesfsIVXOdMSuIZQQdxGQ5lqxxMBZy99iG0P5r14MqKaVnaVSsLFu0ZXZNsK6aapi0ApWEC2aYJ8PGYBRvE+O55Kg7wOk+4VERSncYJnBsIGAg4epSEEd9aZumCfi+UlYwWnbxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584703; c=relaxed/relaxed;
	bh=pPAj0F/7+N3G0fgp8rSBmKqwV8uR3Qu6XgX2gyD+fUo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iKd8lyqcJKD6n1J3FOy8sQqM4LVoC/38Aq+u1VyxHFaYP+TQpJLSvsXP1ELQcRwBYNph1V5GYH4DficgY7W71IdRIHkSX3gC4d8P/fUGj/CAUWrYoLc8h4Yj+TubnWUcT4lSL1i2J++BnhupvqmuWjgLRvqX6MzvYpQSezcK3hGt8fCti4kCXqQOscjaNhtBIr5Bh86rUo2D/c09qchDRVPajUIK4R+S9xByGCeeHdYjYQdMOPPdUIIYIt/f/Lfm6SnxW2hjE1YZ8o2BnFXPFcm/AiFZHSvgHlPY0ASXFtUy/nNFs0mwBrG68ulBD2l98LXF3au4fTfdeMPjBxbBjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VOBeqC8w; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3_bsizwykdjmf1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VOBeqC8w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3_bsizwykdjmf1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTW0bJHz3blZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:03 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e2d1860a62so23425307b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584701; x=1729189501; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pPAj0F/7+N3G0fgp8rSBmKqwV8uR3Qu6XgX2gyD+fUo=;
        b=VOBeqC8wldRQLyj+qCmeYxf2CNa8IcG/lfDxmmxil9YrR+bGYVtXIBTucOubeo8S8I
         pZn6iPRLuymMjYNqBng7H+SorUN3RcfgwX5BuvVqbT8kx+8Bd0cv/1z9guxZvfrTQwNX
         csSRyxRGqG4UtTTKf6K18sQ4ag4I8tivncXrTz2KL/TGtsbOPOegTas56Wiyy2OceckH
         Phn+IkTRf8BJfI5IhwgV9dM6KZfDyuLUcxu2AOcDnKY6MA2bnOvKVwv84ZWJhZF3+WS9
         jK84jDlGRsudO0TsowBhBSGlOk8B/iTYqxo1WBHhGOxy8rrW3QrsRIxUQUROl6smT+s4
         SwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584701; x=1729189501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPAj0F/7+N3G0fgp8rSBmKqwV8uR3Qu6XgX2gyD+fUo=;
        b=Stgfhsr7w1Xl2K7YppGxPVpVDDBM6egXL+ATk4m5+VnzMRuGkPOtmWPv94YZxy2nOl
         CAePEGwmiZX9Q4oj5pG2yhbJ/SmU90M/MCgJDzmp7Nx+tav3vpu+G8iG3Fy46mr28KsX
         EQV0mhArp2hevlm5IL0TijAG+JdXQ/dRw5+a8Xi3sWLGKY6zvDnoaTC+JUYUu82u29SB
         mn/tZ/gik9F/34zld0SU4mXRDq3cZVfGWo1/lDYqemB9UCTF9UQWf6wg4YWeJhnGGT5S
         +QJi52NYj5CwVwuiB2CQzjrKmEsSNHJtMNFFvGeJChRzORwMBgD9tM9etBttG6d+viO1
         D5WA==
X-Forwarded-Encrypted: i=1; AJvYcCVmDDVKsRcrSfJo1FK1s5IoKILFgUwV1oLDRfPiN8vzt97jm6iJRGMS+x5gE5DiAqM49f0zZBfLqcXXuxc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyabMfmI2BFceq/TRbpzejZOxSxMRp+YaL02WPgMbDlsZRPPykT
	AaowK7chMBEWP08jk6veCc/g0bVfkqCtbtF2Jk6L8eYbNWj7/nKrvTodvN8otIvykQRk63XB5Hi
	l7A==
X-Google-Smtp-Source: AGHT+IHQgMXiDY3ifHkkle2NgOnYNSR5nXtws6LnwLsJ4J6Fqip1dtdD5j5lAqBgp/4MJdCcEXFALInKEMI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:69c3:0:b0:e1a:9ed2:67f4 with SMTP id
 3f1490d57ef6-e28fe4313ffmr4949276.2.1728584700890; Thu, 10 Oct 2024 11:25:00
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:07 -0700
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
Message-ID: <20241010182427.1434605-6-seanjc@google.com>
Subject: [PATCH v13 05/85] KVM: x86/mmu: Don't overwrite shadow-present MMU
 SPTEs when prefaulting
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

Treat attempts to prefetch/prefault MMU SPTEs as spurious if there's an
existing shadow-present SPTE, as overwriting a SPTE that may have been
create by a "real" fault is at best confusing, and at worst potentially
harmful.  E.g. mmu_try_to_unsync_pages() doesn't unsync when prefetching,
which creates a scenario where KVM could try to replace a Writable SPTE
with a !Writable SPTE, as sp->unsync is checked prior to acquiring
mmu_unsync_pages_lock.

Note, this applies to three of the four flavors of "prefetch" in KVM:

  - KVM_PRE_FAULT_MEMORY
  - Async #PF (host or PV)
  - Prefetching

The fourth flavor, SPTE synchronization, i.e. FNAME(sync_spte), _only_
overwrites shadow-present SPTEs when calling make_spte().  But SPTE
synchronization specifically uses mmu_spte_update(), and so naturally
avoids the @prefetch check in mmu_set_spte().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 3 +++
 arch/x86/kvm/mmu/tdp_mmu.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a9a23e058555..a8c64069aa89 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2919,6 +2919,9 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 	}
 
 	if (is_shadow_present_pte(*sptep)) {
+		if (prefetch)
+			return RET_PF_SPURIOUS;
+
 		/*
 		 * If we overwrite a PTE page pointer with a 2MB PMD, unlink
 		 * the parent of the now unreachable PTE.
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 3b996c1fdaab..3c6583468742 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1026,6 +1026,9 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
 	if (WARN_ON_ONCE(sp->role.level != fault->goal_level))
 		return RET_PF_RETRY;
 
+	if (fault->prefetch && is_shadow_present_pte(iter->old_spte))
+		return RET_PF_SPURIOUS;
+
 	if (unlikely(!fault->slot))
 		new_spte = make_mmio_spte(vcpu, iter->gfn, ACC_ALL);
 	else
-- 
2.47.0.rc1.288.g06298d1525-goog


