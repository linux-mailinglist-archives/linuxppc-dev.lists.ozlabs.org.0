Return-Path: <linuxppc-dev+bounces-13648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86734C26605
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 18:34:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyp5X37v3z2xxS;
	Sat,  1 Nov 2025 04:34:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761932096;
	cv=none; b=kHljzVX9/YUbKOY7RDiP/5moDyENP71c2X1lGRY0Y4Uasy/LUWdfdctf8PuG8S9siJWGtcCkNds6ApZqOcIZWQhbiRR8NwC0rSiUKp6NbVMx82mBORbi2Zrh7hDEfadmCsbUGv/O+oc1vVRCdjbB3DC/MgvW813erhwHtk6wL0t05LXfKw96K7hJA/devopt+5Y/MwffSD9/1cRAuByjGDG9gxOn7q9TvrFnoJOJcWrlBilbcB9qVt+nxJPF9i6Hau1WY2KkYEvIMCdeZtctTnxef++WdGh/OKkPx9T0Z+s3f80Uxi9abdgs7VDZVvss9hQVGJFDeZriEK5Fe6ustQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761932096; c=relaxed/relaxed;
	bh=LtnXaqdbVR8gOvpEPR+6l9cfgKr6bsCXJtfhHUXOVv8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jcEmiJx8XA5equazN9e3VfNNQlUyTORL9ss2ChYG1YFI2feq+5CykPakprwqtHI2mGkosDkCUdwbskDh/L3u+8H/J5dlw1yJ8z3/BgQIEzbg1Z3Bxf7B90k8x2PfQsUSRQWJABj3Yolkj8ePyKmB6CMO/Xm2EZj8adq6Jns83ClLuvgJ81ym1aVtSVyonjokZdY1FVgB6PQVL3kwN8hPCEH5qWz/0ga2ZN4iQCT1aDEJXsUKhS+MJsA0ItAp1X8MMO70cQk8SUTJPxFbiWycynM64kvewmv1EjY7O3Y5BlEcmY+6Q2hlMuXXaIjR2FQwgP63/fZM+SMPOcLb2MoIrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Lh/ojIM0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3ppmeaqykdiu1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Lh/ojIM0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3ppmeaqykdiu1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyp5W3ZKRz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 04:34:54 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33baf262850so2926889a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 10:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761932093; x=1762536893; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtnXaqdbVR8gOvpEPR+6l9cfgKr6bsCXJtfhHUXOVv8=;
        b=Lh/ojIM08bc5j+OAc2uGWJn51pLz/LfG/ElozaFk/nP01N9hpcPYyNDpiYaDw+dqeo
         +3ec1Th4euZFXFxYQ0AYJxDyKz7GAwQ/mCQ8xcrthl9tUFRI1bB3LjNqfrrD1sEMba8p
         +0fCofHjZF0K8tLVfACOLO8kvLCL0uat+J51kvO0Gn2VayzmMj2MbS1UW8QQZZFRECLw
         XP8byyp5htcocj1gIPQYGQVaqJ6CXTu1J4JejQ6odaeUUNo6PaM1980+HdBdAmUh3I4J
         im+FzVtlGtdHhAKXxztErkgTFjnE+mSS2HZd81Q8qxUeks7D9dgHKdyX4g0fnIyBklTj
         P8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761932093; x=1762536893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtnXaqdbVR8gOvpEPR+6l9cfgKr6bsCXJtfhHUXOVv8=;
        b=A9uUFYkVJ5HGgmVhBfE8nPkgN8t4TENtj9u8LsB5F3XoWW4uOoatf7dXDMe97pTZte
         PdVQa+plVsvxQ9q7sYvuOH/GCM23IMPQUzSQWus7SJvy4QWYBysFBlicE2eiBsKRs6Ic
         Q6mSbHKCyCMrRl5kQRr7/nXiO2hyAOPEyIFo58JYENoxtItbx57M4aCqrzuSRiGe55MF
         6zDCjdYNSk5xUkqCe1X85ZvJ3p+tTZ89Tc+bReV5UvlxPmiC1mc/IoUTVoJBnl5yapgW
         7NjXZ3QsR/fopVbXgYstakf2S9KRW7C4RwVycRrC4qlICChQ01OUkFt9nWWj2PWWfJZl
         VRcw==
X-Forwarded-Encrypted: i=1; AJvYcCUj1INAh2tgDDuDk+PdISWZzsbIRP11LWlZoTHrlIAChr0PFf8ATjHolnaSYUQCrzNsG8+/yExuwsGdlY0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFIFfsM81FKGwuBKp05+h1vYHV5/4xXDLHUV5siPJR9rdwlg8W
	rQeu4B1tFR4qqH+Xt/HekJZVSi5NWDrucRxT7qecDFpr8UlpvEf/kNqEpCrI2bpX+DOpVIg2WOf
	UpF86NA==
X-Google-Smtp-Source: AGHT+IEhd62pQuR9tjnc3Il5ckB3BFxieNfGOf0XAASHT7mISEiuLVbYaHxfkZsCDA/umOxHYLwWX5NLxe4=
X-Received: from pjbmg14.prod.google.com ([2002:a17:90b:370e:b0:33e:34c2:1e17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc4b:b0:32e:5646:d43f
 with SMTP id 98e67ed59e1d1-3408306e65fmr6078929a91.19.1761932092859; Fri, 31
 Oct 2025 10:34:52 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:34:51 -0700
In-Reply-To: <aQRyyieyDrZZMpIt@yzhao56-desk.sh.intel.com>
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
References: <20251030200951.3402865-1-seanjc@google.com> <20251030200951.3402865-27-seanjc@google.com>
 <aQRyyieyDrZZMpIt@yzhao56-desk.sh.intel.com>
Message-ID: <aQTzO7D1O02zQbcD@google.com>
Subject: Re: [PATCH v4 26/28] KVM: TDX: Guard VM state transitions with "all"
 the locks
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
	Binbin Wu <binbin.wu@linux.intel.com>, Michael Roth <michael.roth@amd.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 31, 2025, Yan Zhao wrote:
> On Thu, Oct 30, 2025 at 01:09:49PM -0700, Sean Christopherson wrote:
> > Acquire kvm->lock, kvm->slots_lock, and all vcpu->mutex locks when
> > servicing ioctls that (a) transition the TD to a new state, i.e. when
> > doing INIT or FINALIZE or (b) are only valid if the TD is in a specific
> > state, i.e. when initializing a vCPU or memory region.  Acquiring "all"
> > the locks fixes several KVM_BUG_ON() situations where a SEAMCALL can fail
> > due to racing actions, e.g. if tdh_vp_create() contends with either
> > tdh_mr_extend() or tdh_mr_finalize().
> > 
> > For all intents and purposes, the paths in question are fully serialized,
> > i.e. there's no reason to try and allow anything remotely interesting to
> > happen.  Smack 'em with a big hammer instead of trying to be "nice".
> > 
> > Acquire kvm->lock to prevent VM-wide things from happening, slots_lock to
> > prevent kvm_mmu_zap_all_fast(), and _all_ vCPU mutexes to prevent vCPUs
> s/kvm_mmu_zap_all_fast/kvm_mmu_zap_memslot

Argh!  Third time's a charm?  Hopefully...

> > @@ -3170,7 +3208,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
> >  
> >  int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
> >  {
> > -	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
> > +	struct kvm *kvm = vcpu->kvm;
> > +	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
> reverse xmas tree ?

No, because the shorter line generates an input to the longer line.  E.g. we could
do this if we really, really want an xmas tree:

	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
	struct kvm *kvm = vcpu->kvm;

but this won't compile

	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
	struct kvm *kvm = vcpu->kvm;

