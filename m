Return-Path: <linuxppc-dev+bounces-13214-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7500BC0207F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 17:14:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csqLn3CVQz3bfZ;
	Fri, 24 Oct 2025 02:14:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761232449;
	cv=none; b=bzOXsEzbipfPUOu2q7I8+W99sa+r88kRtSLgmDMa57WiYFhblByvAG4cujmXWXW4F1Y+ehWMcjKszCt+2ZxClNfTmedWERgAKjtKxAgVzrdUTAtD385JFU/Cav1qGi/AARiqCjotPbiSzlBA2WZfwr5+PHZCjGNc8OpJ3aY2Lw/r0i5QH8yheVAxk3JZqkBlQsIETEGs+SIK9VJ+6jWUO9C+ivGutqw7uVSauOdc0gSZa+SZL1Xjfucw4GnWadSRWSk2a3UkukfmYOVSJWuwS8C309w0u/4puy753xWm8Nu6k5WVo5bI/VKQA7WFR7lfA6sh3QQlFSuWUsn+bcbYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761232449; c=relaxed/relaxed;
	bh=eGj/4U8Cjm7Jzuo0N797IrKS+KWnd9Al6qyj+0gj5DU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Aes68x6DFqqd1TxCIJztSHDzw1hTiHFpsyO0SjBWScoh6b7oPh+0aIpjC8h1bHIds6auxbtHWcDGkNIfUC6LU2W9c1uIdVP4jpwQO80vlYiQ/Np6aH/qhsYQlIYYBt9sqp533+LJtw5ckxA3Za9BZgqZnu9dz98Tbgl8thYMmFpeH1QnWCBUAar5X3v7V0JcohsCD8AFbdnuDJAD1CrHfa/tx7xklvCVdI2pHqz+0hL/bp2IZfoQFjOeb5IloPpyzPkIaX0tLzO3JQA34yu9G63NGxVH1LNYeYXKgufzNsdXJriyyaa4BJVjPaslYQ1w2cZVpL4fFA1rsrUoUwo7lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eolEinAa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3pkb6aaykdamvhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eolEinAa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3pkb6aaykdamvhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csqLm4YzNz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 02:14:07 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-332560b7171so1720012a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 08:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761232446; x=1761837246; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGj/4U8Cjm7Jzuo0N797IrKS+KWnd9Al6qyj+0gj5DU=;
        b=eolEinAaDtiJnv4XXayzpJkfny/DBW48jqsehSNrxbd3aT3colYN9Xnfcj813rbw6A
         4t2bCfv2XxxM4YZ7R7Em4pJgUPMw4uw92sQ49IwBAyqg2Qk7RejoVyiCsZHzmZEdKkyG
         uiXHVwNpQtFazINbp/yuNFhqLKJ4RDQDOUdd/sBHnw3jzkOP/418rcbJ9r9MQbGbb+Pu
         HzDtKomwBOMKcb8x6Y5f7wBnwngTo+IvSAD8ODlnrvnTzbZiEOK/ojW6Dlr5tpaVZaaC
         EXq/l+FVgm2NaOHOnsYJxuXwlwKE+Oi2TViTqGphtOV2bp/DORp8RsfsWGqOd/5h9qnL
         ysWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761232446; x=1761837246;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGj/4U8Cjm7Jzuo0N797IrKS+KWnd9Al6qyj+0gj5DU=;
        b=Wl80VJXwRsIWGGEv/qGusauS4LGr42XlGOY/fNZOI/jHuswt9TlUOpn0kxXIpKvpbC
         wnFxAVf2/3X33K0mRZCD4sIMEHu1dDfi1dbcE8BFKxYYujSsUHxv9c5REL8hcfkjy2Ij
         I1ERjtPFuQq5slTY5gmimCe/+dAYAubn8JgSM0mToNoMAiDys4HlQr+2UVHow7mBcWyW
         zy0FVkL3Vh9vgjPaYp7tsAxkK5Eb7shixcnun07YqynTGOsI7pwONjZKvpUWMMhvgw5k
         YME62eJGyRXhAnA+lGRNA+iXznYuE9rPJDnHrxQCpEHsV5ItXsL0fKdha0QguYFMA2BJ
         mT8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoiVT1YEeLPzZUZ3KE+kRnVJqeKp7FBrUD9sWup/FpXnaHHU/G6z8NsPH4BY2xkCbzTZ942WMShh0O8g8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywuki47eU3KUxqTXB7xnP0AV/s11i0J60rWwImXCJWsDrXXASoM
	SKaLvwjgVexVPzFzfr8g+wpVKL9kbxbjU+EVcSovIJkDpFKETV993dUbRam2ncxQKxUZcg+/w+d
	U6t3DCQ==
X-Google-Smtp-Source: AGHT+IGyk+8DKCi3tYCJowX0kgLUyc4PpyLVM16G5qza1KYeH4GEBaOP8pzea9wQFWKumE2t1taaAoPvn3M=
X-Received: from pjbrm7.prod.google.com ([2002:a17:90b:3ec7:b0:330:6c04:207])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:570e:b0:32e:7ff6:6dbd
 with SMTP id 98e67ed59e1d1-33e21dedc9fmr9424992a91.0.1761232446100; Thu, 23
 Oct 2025 08:14:06 -0700 (PDT)
Date: Thu, 23 Oct 2025 08:14:04 -0700
In-Reply-To: <aPnbIDxGlcAyI9vy@yzhao56-desk.sh.intel.com>
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
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-20-seanjc@google.com>
 <aPnbIDxGlcAyI9vy@yzhao56-desk.sh.intel.com>
Message-ID: <aPpGPF8McvI3-OO7@google.com>
Subject: Re: [PATCH v3 19/25] KVM: TDX: Assert that mmu_lock is held for write
 when removing S-EPT entries
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025, Yan Zhao wrote:
> On Thu, Oct 16, 2025 at 05:32:37PM -0700, Sean Christopherson wrote:
> > Unconditionally assert that mmu_lock is held for write when removing S-EPT
> > entries, not just when removing S-EPT entries triggers certain conditions,
> > e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
> > Conditionally asserting implies that it's safe to hold mmu_lock for read
> > when those paths aren't hit, which is simply not true, as KVM doesn't
> > support removing S-EPT entries under read-lock.
> > 
> > Only two paths lead to remove_external_spte(), and both paths asserts that
> > mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
> > handle_removed_pt() via KVM_BUG_ON()).
> > 
> > Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
> > that wait_for_sept_zap is guarded by holding mmu_lock for write.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/vmx/tdx.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index e517ad3d5f4f..f6782b0ffa98 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -1711,8 +1711,6 @@ static void tdx_track(struct kvm *kvm)
> >  	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
> >  		return;
> >  
> > -	lockdep_assert_held_write(&kvm->mmu_lock);
> Could we also deliberately leave lockdep assertion for tdx_track()?

Can do.

> This is because if we allow removing S-EPT entries while holding mmu_lock for
> read in future, tdx_track() needs to be protected by a separate spinlock to
> ensure serialization of tdh_mem_track() and vCPUs kick-off (kicking off vCPUs
> must follow each tdh_mem_track() to unblock the next tdh_mem_track()).

Does this look/sound right?

From: Sean Christopherson <seanjc@google.com>
Date: Thu, 28 Aug 2025 17:06:17 -0700
Subject: [PATCH] KVM: TDX: Assert that mmu_lock is held for write when
 removing S-EPT entries

Unconditionally assert that mmu_lock is held for write when removing S-EPT
entries, not just when removing S-EPT entries triggers certain conditions,
e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
Conditionally asserting implies that it's safe to hold mmu_lock for read
when those paths aren't hit, which is simply not true, as KVM doesn't
support removing S-EPT entries under read-lock.

Only two paths lead to remove_external_spte(), and both paths asserts that
mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
handle_removed_pt() via KVM_BUG_ON()).

Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
that wait_for_sept_zap is guarded by holding mmu_lock for write, and keep
the conditional assert in tdx_track() as well, but with a comment to help
explain why holding mmu_lock for write matters (above and beyond why
tdx_sept_remove_private_spte()'s requirements).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index dca9e2561270..899051c64faa 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1715,6 +1715,11 @@ static void tdx_track(struct kvm *kvm)
 	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
 		return;
 
+	/*
+	 * The full sequence of TDH.MEM.TRACK and forcing vCPUs out of guest
+	 * mode must be serialized, as TDH.MEM.TRACK will fail if the previous
+	 * tracking epoch hasn't completed.
+	*/
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
 	err = tdh_mem_track(&kvm_tdx->td);
@@ -1762,6 +1767,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
 
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
 	/*
 	 * HKID is released after all private pages have been removed, and set
 	 * before any might be populated. Warn if zapping is attempted when

base-commit: 69564844a116861ebea4396894005c8b4e48f870
--

