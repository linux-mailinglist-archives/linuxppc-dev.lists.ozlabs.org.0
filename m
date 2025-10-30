Return-Path: <linuxppc-dev+bounces-13577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D135C2221C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:10:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFb462W5z3chX;
	Fri, 31 Oct 2025 07:10:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855008;
	cv=none; b=L1uJHm+gb7EVHWdImosGaVVmApooDiUsKRYW1MeCo8aF7xpPz9quImp9jJ40nSNUwjRdqMepD3O6eO4gLne0HaK2oz0bwaE7Q/O8J7lI9JAudfzbFOMmuZMPfv6AhYjbNdyqiXSOzA9Y7LJnwwpfzbbZd/d+dEcYT5smgyKB8hVbHI7IoJ8JKQFYR9+h+4tSVSNeEz5d3xdvyQ63u01iL2QXHrImzTJkOJSJ5adN7dixTCUFMgGiU5ZNoYzJOe/W2X2Tp3x4sPHv3KdOOOfbB/j8ggWnIFTjfOh+5vbPzWg/bDn8NvoKW3H1vSrqJiDwbcMivYEx1af0+AGaI/4kNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855008; c=relaxed/relaxed;
	bh=TnV5Uo4WEDSyHqNRydChmPWwv04NNnacTlgMSv81cvQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NMsc7NR3oSS2qszY/yNS7g6CHWPi/iO2c7GBcXqCoJSjBb1aGBvjvAXdHl1GMBIfgLswvlZMBc1p6L4RcHikHIYKUovT3YM0PCoUaSzVnoWees6RAJxB+jjyfjekQ9p03WgQYhXaitGboJGtwHTorv0zLfw8zJf5xFjHkQyzjMOrQiLz8I6IXnOdCDWx6iT0IupJ6vY9TadmU25M9v/lCKIBFY96KfaHak2Qm1vgl1Fms3zunnaHLSJNv7Rr6nchM4Yp40bqYyPQXaFZt5hgGiqJf6WnJNjMCDAX2/Vhj6kiY3AC6INC+9aVRLzhgSfKTZFXGOaaPMi1ZiFUftYe9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=w2Odb1gh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3hsydaqykdak1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=w2Odb1gh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3hsydaqykdak1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFb41rVlz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:08 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-295093f614cso9160665ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855007; x=1762459807; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TnV5Uo4WEDSyHqNRydChmPWwv04NNnacTlgMSv81cvQ=;
        b=w2Odb1ghQoWcQFZ0yQww5G4vwvQGrTSY4P9fhNhFs4odS5GUz2WdT7I7Rur9tePkzO
         uhezhs4+cQXP6Dge1R5KIyMsySrD07ONmVcPO9y8y0HIPEmCFwVrH4zcyxiplkorLmUh
         R7ugjXp/VJdU/OA14GOyYJI5EThcZEqYpyTNKyI2+7hq4hXAmNYsiLVPZfZDmafiwBuA
         k+eoAyPen2CcEH/X2hLfW5QyPakT7KmdBtYrXsNah2FG9i6xHqKq79rnalBfq3PuICwt
         /GudCqpA+EEJ7BqrLgFabdeO76Zu51u/2GvLGD1ruKoEaxl4qj86E6aKHgb3RZBfXcqs
         t0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855007; x=1762459807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnV5Uo4WEDSyHqNRydChmPWwv04NNnacTlgMSv81cvQ=;
        b=YNIkdN5ZILRTRyYDtOvVkWbzR/RMi5DnGGVt+NjHgSqfZS9tbIZ7rLxAaww9DGnmFB
         vzyId7JD/iWky0vrVfmo+03vliWxdrmpUMJdtqKGylYPceyQjCgkX+JoIjWLAtSH7EXd
         HpEo6vKIDXQo5cXIjLY4CKdlkjg5Axh94KWkug7oKCkZ/Y1/Ei3zsLJH535kalalTLjw
         ztQ9p9Wv5IRc5EapbEOoTz3PF7N4Yczle4AHwdkkaaQbJhdt5oiEei5KQCJPNDQfySxx
         hDuYbRtq7aOSB2qtU5KYjqwXcKyEwVZZIUzw4sK80zeZvbZ0vhi47Df9KwMVueWveTTH
         gt4w==
X-Forwarded-Encrypted: i=1; AJvYcCUtgfqmgPrPowXtvZ4JcOEa971PiyfLZvwphA+f0LXaTQfeaYG3J4Hp6lNL3Krml/9RMMgr5dm3KVTfPeM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJM6cfoKQS/w0a0skfX8UFh/vO6bP4pEUG0V9YKVBXaPEfLveD
	b65X9pp6qChIKyL86PRfVbLpIq9jNbdLPd6DOuuc6/D8W1vtNM8BUVOIIv3O5jHs21abhBnxoZA
	A2ixVTQ==
X-Google-Smtp-Source: AGHT+IFGhHo2Di0bU/Eld4A49PARSXoqPeeyu/ySpV1D9gJIOdjNn1G+WqeVqdSQrN5R+YSZ+ehbNpIGVJQ=
X-Received: from plow8.prod.google.com ([2002:a17:903:1b08:b0:267:cd3d:3446])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54c:b0:295:134:9ae5
 with SMTP id d9443c01a7336-29519b9f27cmr11657375ad.24.1761855006488; Thu, 30
 Oct 2025 13:10:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:26 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-4-seanjc@google.com>
Subject: [PATCH v4 03/28] KVM: TDX: Drop PROVE_MMU=y sanity check on
 to-be-populated mappings
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Drop TDX's sanity check that a mirror EPT mapping isn't zapped between
creating said mapping and doing TDH.MEM.PAGE.ADD, as the check is
simultaneously superfluous and incomplete.  Per commit 2608f1057601
("KVM: x86/tdp_mmu: Add a helper function to walk down the TDP MMU"), the
justification for introducing kvm_tdp_mmu_gpa_is_mapped() was to check
that the target gfn was pre-populated, with a link that points to this
snippet:

 : > One small question:
 : >
 : > What if the memory region passed to KVM_TDX_INIT_MEM_REGION hasn't been pre-
 : > populated?  If we want to make KVM_TDX_INIT_MEM_REGION work with these regions,
 : > then we still need to do the real map.  Or we can make KVM_TDX_INIT_MEM_REGION
 : > return error when it finds the region hasn't been pre-populated?
 :
 : Return an error.  I don't love the idea of bleeding so many TDX details into
 : userspace, but I'm pretty sure that ship sailed a long, long time ago.

But that justification makes little sense for the final code, as the check
on nr_premapped after TDH.MEM.PAGE.ADD will detect and return an error if
KVM attempted to zap a S-EPT entry (tdx_sept_zap_private_spte() will fail
on TDH.MEM.RANGE.BLOCK due lack of a valid S-EPT entry).  And as evidenced
by the "is mapped?" code being guarded with CONFIG_KVM_PROVE_MMU=y, KVM is
NOT relying on the check for general correctness.

The sanity check is also incomplete in the sense that mmu_lock is dropped
between the check and TDH.MEM.PAGE.ADD, i.e. will only detect KVM bugs that
zap SPTEs in a very specific window (note, this also applies to the check
on nr_premapped).

Removing the sanity check will allow removing kvm_tdp_mmu_gpa_is_mapped(),
which has no business being exposed to vendor code, and more importantly
will pave the way for eliminating the "pre-map" approach entirely in favor
of doing TDH.MEM.PAGE.ADD under mmu_lock.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 326db9b9c567..4c3014befe9f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3181,20 +3181,6 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	if (ret < 0)
 		goto out;
 
-	/*
-	 * The private mem cannot be zapped after kvm_tdp_map_page()
-	 * because all paths are covered by slots_lock and the
-	 * filemap invalidate lock.  Check that they are indeed enough.
-	 */
-	if (IS_ENABLED(CONFIG_KVM_PROVE_MMU)) {
-		scoped_guard(read_lock, &kvm->mmu_lock) {
-			if (KVM_BUG_ON(!kvm_tdp_mmu_gpa_is_mapped(vcpu, gpa), kvm)) {
-				ret = -EIO;
-				goto out;
-			}
-		}
-	}
-
 	ret = 0;
 	err = tdh_mem_page_add(&kvm_tdx->td, gpa, pfn_to_page(pfn),
 			       src_page, &entry, &level_state);
-- 
2.51.1.930.gacf6e81ea2-goog


