Return-Path: <linuxppc-dev+bounces-1989-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C3998FE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:25:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTR43d6z2yNc;
	Fri, 11 Oct 2024 05:24:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584699;
	cv=none; b=GXTyf2ol09gMUaFJGCe0L61/BbloVBoOP8xeC7mS8jHe3EsswPkAiR/otPw5a6/q4tQH3dvnZJsiqHTZyBRByRiwFggbeCaSZW7xuELiJHh8cXQpp1DbMCQ6E7yElDQbuw2X5C/d3FyQmPdHx5P4fftUyz7M4rY7kXky9jJAcSnnOGEuxoqE4XXSX2Wu7aOGW1zRrvduaHud/lUSN59v3rISPgLO06n6sd6esfw/qJLUsh+hI/xJM7vOCh9jl3LksFRY+HbCz1w29mE5N3FW47ujliebivReMq7X02DhsTyoJ4g0JBsBtXmJyUHlI2c1VnI26kXgMXOcbxseGjHkoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584699; c=relaxed/relaxed;
	bh=X4CpCR2xmh5xLGpBn2Bl3P0Y4RCeyU3sCMc2ynGYEmk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FtBf2S+4ZHH4RBtynDe0grpsNpbuZZzC9i0xUdYJq8z9xBCpTIYUiTmQ3HyMPl40jQmWOeiZvSQ4zN8BlWmhOuBnSuQf18pcHAFMGU5U+y+0V/gzZqGSN1GPPDzXRQ6gUdijae2U5dgvPh5x6/9c7tesGFCcYFwc8cBSEGUVAyfPGX9+boVZu8gQ6zCPx191O8ygvhVKLjRZe4il61C7LnMqLRK/ontGWTfNmcOhwVgt+Yba4EkvXocAueHFHeljS8CbUQyXi2fAoV+Id+ikPnCLZn3WoKi+sZMZubWGGY8vVCRvtiAt66DeMUYbypjQ+JlxE/qtBzhB1UjSfsbfkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VrBPQKtO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3-bsizwykdi8bxt62vz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VrBPQKtO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3-bsizwykdi8bxt62vz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTQ5Xblz3blZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:24:58 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-690404fd230so25155637b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584697; x=1729189497; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4CpCR2xmh5xLGpBn2Bl3P0Y4RCeyU3sCMc2ynGYEmk=;
        b=VrBPQKtOBZL4j4eEuaxDJhHAV4gt7PxBVLm3S43BXOHCshZrWNtRpwrOf3r21DgIcP
         Yjys3J7PjIuErVd9KFX4x3EGqh1D5ElGPXmrttb57GNdVsHBt5eHqRDSFR4l/L0Gqux8
         MJsmPm9NzAyRaKVtFkr6mC9RwbxhY7QEV63HZpS1AY9mZqz2I8TP1O+RfF3wjQthl2e7
         FhArB+Zr2YAxkfEADtdMFxK+B89iv/S6i76vwQ3wRmYl+ZLYeRcTc5UoTQ4zv+fBfBOI
         sSVJCE/j6PR4nYoTV+7plKZniXL5SrhfdD3+7TZ/iaL6h1KTvr1X+OL8qpmSD7aH6b+g
         R4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584697; x=1729189497;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X4CpCR2xmh5xLGpBn2Bl3P0Y4RCeyU3sCMc2ynGYEmk=;
        b=ADtDy+UpV+KLieXy1mUWVM5xPoIEufcUmMd+WG1r6vn8tx4Y/qA60aHdC9K2fQ+Gze
         7CIYPxWNkEHzKJqZs0loMdI8OB1CPCgs4rzjlW+2gg7k0gnQv+rl2i0cz6zVtwrVeNdd
         aTlA0GDx/XhhynWuqjRcnEqQIOCKOSCF1RjLl35EnsZY6nnVUxVPZpd985mxj4wE6gtT
         UHm3UvZY6K4rzb+Leon/By0dKYCko3hFV/tC8avwJRfVHpKYe/So7/JOhnjIq7uD2c4P
         At1wQI4/Qx/ucpYalzLxsBmDGnwcixKjgTSXgRr97dfP6x9hlcO+pZfb5FjqWt47pokv
         edzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs6AubYygASkTQ4GEV0twudi5RHUZM8xJQl0hkhBo0sEy+NBsYQ0VmInegIT+g7U0FzbYCH4HeCxZpo5A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw95IzOS29I4IfsUUupJ6buOfourQd7xLjsNUfZ+1XiV61EXRh4
	1zBV+iLyyJW7bRGl6LpeEmAVCuDPsoJ77gtoBm4Qy57H5v8+yt9rnGHwliVQOrLym10FFuI00th
	1gw==
X-Google-Smtp-Source: AGHT+IGrULPD5dT5NWC9dFAfgTsoL9JIWGzHU9t8+6e7flVyO5QHPCRlr/jDUZCu+nhXBHYl+WGzejB3KuQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a0d:e486:0:b0:6e2:371f:4aef with SMTP id
 00721157ae682-6e322168931mr204147b3.3.1728584696651; Thu, 10 Oct 2024
 11:24:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:06 -0700
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
Message-ID: <20241010182427.1434605-5-seanjc@google.com>
Subject: [PATCH v13 04/85] KVM: x86/mmu: Skip the "try unsync" path iff the
 old SPTE was a leaf SPTE
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

Apply make_spte()'s optimization to skip trying to unsync shadow pages if
and only if the old SPTE was a leaf SPTE, as non-leaf SPTEs in direct MMUs
are always writable, i.e. could trigger a false positive and incorrectly
lead to KVM creating a SPTE without write-protecting or marking shadow
pages unsync.

This bug only affects the TDP MMU, as the shadow MMU only overwrites a
shadow-present SPTE when synchronizing SPTEs (and only 4KiB SPTEs can be
unsync).  Specifically, mmu_set_spte() drops any non-leaf SPTEs *before*
calling make_spte(), whereas the TDP MMU can do a direct replacement of a
page table with the leaf SPTE.

Opportunistically update the comment to explain why skipping the unsync
stuff is safe, as opposed to simply saying "it's someone else's problem".

Cc: stable@vger.kernel.org
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/spte.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 8f7eb3ad88fc..5521608077ec 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -226,12 +226,20 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_=
page *sp,
 		spte |=3D PT_WRITABLE_MASK | shadow_mmu_writable_mask;
=20
 		/*
-		 * Optimization: for pte sync, if spte was writable the hash
-		 * lookup is unnecessary (and expensive). Write protection
-		 * is responsibility of kvm_mmu_get_page / kvm_mmu_sync_roots.
-		 * Same reasoning can be applied to dirty page accounting.
+		 * When overwriting an existing leaf SPTE, and the old SPTE was
+		 * writable, skip trying to unsync shadow pages as any relevant
+		 * shadow pages must already be unsync, i.e. the hash lookup is
+		 * unnecessary (and expensive).
+		 *
+		 * The same reasoning applies to dirty page/folio accounting;
+		 * KVM will mark the folio dirty using the old SPTE, thus
+		 * there's no need to immediately mark the new SPTE as dirty.
+		 *
+		 * Note, both cases rely on KVM not changing PFNs without first
+		 * zapping the old SPTE, which is guaranteed by both the shadow
+		 * MMU and the TDP MMU.
 		 */
-		if (is_writable_pte(old_spte))
+		if (is_last_spte(old_spte, level) && is_writable_pte(old_spte))
 			goto out;
=20
 		/*
--=20
2.47.0.rc1.288.g06298d1525-goog


