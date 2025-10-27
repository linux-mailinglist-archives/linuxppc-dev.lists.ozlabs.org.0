Return-Path: <linuxppc-dev+bounces-13350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F2EC10CB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 20:20:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwNcw4gPrz2yyd;
	Tue, 28 Oct 2025 06:20:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761592816;
	cv=none; b=aNCVKLx5f7sJjV8UfkgPy97edtoM5GLETXf0P58NNlnCfxWNgsTQiUsOchPdWad3s+YKUGhxffACLHQKJZmzwHbqJFZ06/P6iKOjSlq7LmG7VB+aiUAC7Oym37/Oose7noYNjsxLmxfgk93ePzoY+5R6rfJbJNonBCD+bgptyHdzqAurvBdqLRi5B1ZLP3eILMgwu9AT96cLhYAnMUc/yNaxfmnL7mkOI0uJy2ehddnP+fh7k4JaLWiRYPozKgxz+6+VumtVZ8Q8RCC4sL0r6fbZvN9VmGJPTPJuHqwGZSIT9UYi2YMbe15eqTp2+M1k+bIqZK70j0nL4xV4K/+NCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761592816; c=relaxed/relaxed;
	bh=GJ/ihzhnBg2h+OIog5s51f1nDJzu1yBHwy2SCCUQ1bo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fBb5uYNABl3ZEyvs61OYEmDpmyt3LUd94ksTtLei3Ogx+vJ1mWrb9Ap3UYESwXLJnqzKSAj8xPUz+nUYzP9PW7mJDXGkLeH6C+3BqSLzwRRtYSseRH9PlvU1tnz/9o+ek1wmJV+As4A6FNeI9lOHiTLRLKnX/1rN6acEk1lkTaV8Jh2YmGfm6GZje3CUI+Lgiyzy2BSOs3tS8+5MiThWK9dH1TLGrYp6Zn07i7tdCN6DbpfA6XU1cMS+h1112McqTss4Qs0JiNb9cl47NpUrjFehNbQKQ9eIiUKcDJuK7zprJZ0wuKYkNBZ0N3855+xFdZ31ckpHhv8mXyvzMGErcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=k7k9SGQ9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=368x_aaykdmq2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=k7k9SGQ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=368x_aaykdmq2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwNcv4Mpdz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 06:20:14 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-28c58e009d1so108170615ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 12:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761592812; x=1762197612; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ/ihzhnBg2h+OIog5s51f1nDJzu1yBHwy2SCCUQ1bo=;
        b=k7k9SGQ9XVYosfKe1an/nkws8YkYl9Vzhp23c0cvZiU3j8YABwizAobsB72+jHYUfg
         bCTg0HJqi46AnxJbrUapzo/yoFkjSSgMTyUKd4NNoFl+TGQWCvgvvVVqAS1LgNTt+vRt
         SFLub0VXBRAc2CQ2Ae7YPs+cZSFO/uHO5wv/Scc7V3z0C8vFdcORHq14dXOedsgukT8I
         oM5DTtcVaN15iv1U/E1OvwcKgvp4bIVcfepzjJWQM2ZlXgro3YRWwSZY5Gc4Nd89LMBH
         FT84i52u2I5pCaqgEuekOx18MrUtPwFsjwC1CQseTcDLtIckkqWZDk1xAV9NvviX3fd5
         X1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761592812; x=1762197612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJ/ihzhnBg2h+OIog5s51f1nDJzu1yBHwy2SCCUQ1bo=;
        b=gNLjoNh0CzbOsyiheRyXf4lAJ0k6oZZfvKGFukeL1+m8zt5Nt2ki1cy7Pbr3HajgJv
         Wv0AFsgPOocNCEC9bdypvY5nvuGwQEChJae9o/LROEY72PCP/UCIZWnA9NWJ8EjAnHBC
         4npcQCIaPnugo7TKUWxeFsRj9Spx4C4fdeBLbvX2XkUh1Sr2Um6bXHlji3gbJJuZTh9J
         A2ruF+4XGmJq0ObRUnKlqdWMSx1+mAErSTcoO1uF931sT10XQyJYXuPy3ZRNaM3r/GEF
         cFRDCuFEGt92gWr6SXGvchF3ozpD9rogJPF6RuHHWaDd0WsrgWL0Xy0HpY11FjO+TkNh
         inhg==
X-Forwarded-Encrypted: i=1; AJvYcCVk+q3oYrcEViKk8TKJv9e7Hag6y/jKGMqzkjzEaxKyV3bFKaoGRPNoJI1oeESToVL+RFokJE7wKrj5hSs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxlzzblhW25ynVaotF/7sjKXsa75WXVjRiShCgvtm7DjYM5Ry3N
	+YlHcKMyjQ6YU482+wuavu4T97m7GlsZqT69ErEa/BR1ghrikGJ8iSq2fcTU32kgEZ0yLYfbcj7
	tsg9bLQ==
X-Google-Smtp-Source: AGHT+IGEzxKOsu0TIx9JeJ8jo0iJqVMcVQCTPniC3ps1TgJ3BGzDUda18OgqbILlA0+mvKP7+G2jd9/+Iec=
X-Received: from pjbrs15.prod.google.com ([2002:a17:90b:2b8f:b0:33b:51fe:1a73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5c4:b0:25d:1640:1d59
 with SMTP id d9443c01a7336-294cb378610mr8002455ad.8.1761592811798; Mon, 27
 Oct 2025 12:20:11 -0700 (PDT)
Date: Mon, 27 Oct 2025 12:20:10 -0700
In-Reply-To: <4809644b0ba02d0987ac56f4be7c426d0724cdef.camel@intel.com>
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
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-21-seanjc@google.com>
 <4809644b0ba02d0987ac56f4be7c426d0724cdef.camel@intel.com>
Message-ID: <aP_F6tmzomRtdbpU@google.com>
Subject: Re: [PATCH v3 20/25] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Vishal Annapurve <vannapurve@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 24, 2025, Kai Huang wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > Add a macro to handle kicking vCPUs out of the guest and retrying
> > SEAMCALLs on -EBUSY instead of providing small helpers to be used by each
> > SEAMCALL.  Wrapping the SEAMCALLs in a macro makes it a little harder to
> > tease out which SEAMCALL is being made, but significantly reduces the
> > amount of copy+paste code and makes it all but impossible to leave an
> > elevated wait_for_sept_zap.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/vmx/tdx.c | 72 ++++++++++++++----------------------------
> >  1 file changed, 23 insertions(+), 49 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > index f6782b0ffa98..2e2dab89c98f 100644
> > --- a/arch/x86/kvm/vmx/tdx.c
> > +++ b/arch/x86/kvm/vmx/tdx.c
> > @@ -294,25 +294,24 @@ static inline void tdx_disassociate_vp(struct kvm_vcpu *vcpu)
> >  	vcpu->cpu = -1;
> >  }
> >  
> > -static void tdx_no_vcpus_enter_start(struct kvm *kvm)
> > -{
> > -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
> > -
> > -	lockdep_assert_held_write(&kvm->mmu_lock);
> > -
> > -	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, true);
> > -
> > -	kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
> > -}
> > -
> > -static void tdx_no_vcpus_enter_stop(struct kvm *kvm)
> > -{
> > -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
> > -
> > -	lockdep_assert_held_write(&kvm->mmu_lock);
> > -
> > -	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, false);
> > -}
> > +#define tdh_do_no_vcpus(tdh_func, kvm, args...)					\
> > +({										\
> > +	struct kvm_tdx *__kvm_tdx = to_kvm_tdx(kvm);				\
> > +	u64 __err;								\
> > +										\
> > +	lockdep_assert_held_write(&kvm->mmu_lock);				\
> > +										\
> > +	__err = tdh_func(args);							\
> > +	if (unlikely(tdx_operand_busy(__err))) {				\
> > +		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, true);			\
> > +		kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);	\
> > +										\
> > +		__err = tdh_func(args);						\
> > +										\
> > +		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, false);		\
> > +	}									\
> > +	__err;									\
> > +})
> 
> The comment which says "the second retry should succeed" is lost, could we
> add it to tdh_do_no_vcpus()?

+1, definitely needs a comment.

/*
 * Execute a SEAMCALL related to removing/blocking S-EPT entries, with a single
 * retry (if necessary) after forcing vCPUs to exit and wait for the operation
 * to complete.  All flows that remove/block S-EPT entries run with mmu_lock
 * held for write, i.e. are mutually exlusive with each other, but they aren't
 * mutually exclusive with vCPUs running (because that would be overkill), and
 * so can fail with "operand busy" if a vCPU acquires a required lock in the
 * TDX-Module.
 *
 * Note, the retry is guaranteed to succeed, absent KVM and/or TDX-Module bugs.
 */
 
> Also, perhaps we can just TDX_BUG_ON() inside tdh_do_no_vcpus() when the
> second call of tdh_func() fails?

Heh, this also caught my eye when typing up the comment.  Unfortunately, I don't
think it's worth doing the TDX_BUG_ON() inside the macro as that would require
plumbing in the UPPERCASE name, and doesn't work well with the variadic arguments,
e.g. TRACK wants TDX_BUG_ON(), but REMOVE and BLOCK want TDX_BUG_ON_2().

Given that REMOVE and BLOCK need to check the return value, getting the TDX_BUG_ON()
call into the macro wouldn't buy that much.

