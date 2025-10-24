Return-Path: <linuxppc-dev+bounces-13293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A74C07697
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 18:57:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctTbS6Jc1z30N8;
	Sat, 25 Oct 2025 03:57:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761325044;
	cv=none; b=AYvJ4bn6iuO0/bnH+seiazD9MurAQiMyMixwe/A9gFA14cZU6p0ic7pGej657NJGQ4B6pmYgpsk+Tf0G+BmzbVQBv7zpOqHDc5udUwvvDNFEzsXLrBIg4Ran+UQslZFSGoIIE6IVNCwqHQStDhURz/Pka+yrkItWu8UD7yNqXUQpWyJ3jJeHsaDQ9cUhOc9n7+5Gwl+BzJ5Ds3NB3UUoysgaizGtORzLcF8e3l0cYJLvZ9q3ONNsaQbN1DbsF8C21/h0fIUHs1OzLI7q7YlXnoVGngiSDryNwcec6YI1cBRVp0iAha11JrSJM+E63wBbQ0HI3MBy8UnG6BSUWPGA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761325044; c=relaxed/relaxed;
	bh=kCSFoTED+bN9czctrBnViFjaUxjZI+PzjY/BcjiPyhU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c1a4O2mJwi5bC1iHO0oSxt4SNE44MjuHm3x3FbmAnMGchZwvweS0aXu7vJIBA7o0isIRos5a88qxffAtWJFVtINrEZ+2M7KoQmNVg/4p+w7O90LlTRkR0uKOrMimSs4sNS9u3iA8jhFQ5iTFDBPTXdCnD2rxLj+i2FF4N+eAeg7FFpd12vlfet804jvH10iBXwzfWivqH++Gg9V5CZJTwnv/mx1djZBz2UUCA3TML9VRbi1jisvnJtYJQIPjTKF7S/RUWuisD8c0QWWsNK/EF8MJwddN2CyTr8EOXkoLDR3v0eaPH7hZVn5dfoWOZutjLWQb6OwPMXVXjkSg2sW1/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=l/UOjcDX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=38a_7aaykdi4aws51uy66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=l/UOjcDX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=38a_7aaykdi4aws51uy66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctTbR64kHz2xsq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 03:57:23 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33bcb779733so2075946a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761325042; x=1761929842; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCSFoTED+bN9czctrBnViFjaUxjZI+PzjY/BcjiPyhU=;
        b=l/UOjcDXC0+Vfll6GxR7wdY1PTCARyJKcb54Jp5iKLU7Oy9BL3I6T9wxV1aztWgTcq
         6hdk6569QkRD08Jfj0VYBqCy+uehE2N8cS8mhD7sVNCVt131Hmt4K/CNA5fashwpq7V1
         kuoTDg9q9+eVTKkYA/zq/ym64dNeYYVlwX98y5JqAd4Yrkbn9Pgz4iTOwQVkiM8VYl/b
         XxpZW5Y78xZpoRXUMvSyPB/wBXyLq/kDdWhuRTvV5YJ0A8Jg77R9ABT/eEKhlnk1mnTA
         3RsINXTRZAag/sTiY1cPdcUaeoPjUTXLub3EICP02efeID09kmno2LxK/cOA5uIzHvYA
         SawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761325042; x=1761929842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCSFoTED+bN9czctrBnViFjaUxjZI+PzjY/BcjiPyhU=;
        b=KefOkvR/ZzUnuu1GrZTVKWDw9oFbDO76rLOKHfTLlGtFzZ5tcwsCxd8T5dHpxKOaW1
         rrQB1ugxT8utzDI5q0hlH4fcfz8PsmVecnbIK4bNw3UrwGgqTDDigea/jwbGQ+AB8FEZ
         FFbYx/mZQ8A9c7POJLFdcLXaRvQC4ZpoakI9NBYDAFc+4JF7YKGuKx21EsPXsA+fzzcO
         qWV9MPmK/cEODu//RijPNeUWpJCjvPt5NJbC5jtvsoOFrpL4fFrP6VqU/P2M5VcxrL/T
         rtuyHdSAhxAwjSwzj8TvnOidn0T674zEpaviFuD+63/c3Sore3jrZEX0FMg5xTVDzH62
         YUZg==
X-Forwarded-Encrypted: i=1; AJvYcCXtFIXSEs8cF5ffwnOqATyWAGLNq6WpzRSgn1nAL3OlxHAEC5zbtN1dAOrPfq605J/RqlOFy4UV2fX9SfM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzvJ2TrcRCy1p9Z0akeFnLt2TpuktOo3sP4C6JBMV9HPz3/JebG
	a3ByQSJMBwU3ywpj6triYdkPtj3BdGAa0aR89arNTujHz2n3nPMCIc9JyF15qTRh5eGtxU/hRsC
	vINo5Rw==
X-Google-Smtp-Source: AGHT+IHXmSeD3kNK6POSE1hGR7Jvio0RnirzUH7WSrLaKZ09lPaFZJIUb09S/aBT/hnx0ZxmJITFzdMKVRo=
X-Received: from pjnu4.prod.google.com ([2002:a17:90a:8904:b0:339:dc19:ae5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:48c8:b0:33b:ba55:f5dd
 with SMTP id 98e67ed59e1d1-33bcf93ab88mr32766320a91.37.1761325041555; Fri, 24
 Oct 2025 09:57:21 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:57:20 -0700
In-Reply-To: <aPtOtzGLigbY0Vqw@yzhao56-desk.sh.intel.com>
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
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-25-seanjc@google.com>
 <aPtOtzGLigbY0Vqw@yzhao56-desk.sh.intel.com>
Message-ID: <aPuv8F8iDp3SLb9q@google.com>
Subject: Re: [PATCH v3 24/25] KVM: TDX: Guard VM state transitions with "all"
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
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 24, 2025, Yan Zhao wrote:
> On Thu, Oct 16, 2025 at 05:32:42PM -0700, Sean Christopherson wrote:
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
> slots_lock to prevent kvm_mmu_zap_memslot()?
> kvm_mmu_zap_all_fast() does not operate on the mirror root.

Oh, right.

> We may have missed a zap in the guest_memfd punch hole path:
> 
> The SEAMCALLs tdh_mem_range_block(), tdh_mem_track() tdh_mem_page_remove()
> in the guest_memfd punch hole path are only protected by the filemap invaliate
> lock and mmu_lock, so they could contend with v1 version of tdh_vp_init().
>
> (I'm writing a selftest to verify this, haven't been able to reproduce
> tdh_vp_init(v1) returning BUSY yet. However, this race condition should be
> theoretically possible.)
> 
> Resources              SHARED  users              EXCLUSIVE users
> ------------------------------------------------------------------------
> (1) TDR                tdh_mng_rdwr               tdh_mng_create
>                        tdh_vp_create              tdh_mng_add_cx
>                        tdh_vp_addcx               tdh_mng_init
>                        tdh_vp_init(v0)            tdh_mng_vpflushdone
>                        tdh_vp_enter               tdh_mng_key_config
>                        tdh_vp_flush               tdh_mng_key_freeid
>                        tdh_vp_rd_wr               tdh_mr_extend
>                        tdh_mem_sept_add           tdh_mr_finalize
>                        tdh_mem_sept_remove        tdh_vp_init(v1)
>                        tdh_mem_page_aug           tdh_mem_page_add
>                        tdh_mem_page_remove
>                        tdh_mem_range_block
>                        tdh_mem_track
>                        tdh_mem_range_unblock
>                        tdh_phymem_page_reclaim
> 
> Do you think we can acquire the mmu_lock for cmd KVM_TDX_INIT_VCPU?

Ugh, I'd rather not?  Refresh me, what's the story with "v1"?  Are we now on v2?
If this is effectively limited to deprecated TDX modules, my vote would be to
ignore the flaw and avoid even more complexity in KVM.

> > @@ -3155,12 +3198,13 @@ int tdx_vcpu_unlocked_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
> >  	if (r)
> >  		return r;
> >  
> > +	CLASS(tdx_vm_state_guard, guard)(kvm);
> Should we move the guard to inside each cmd? Then there's no need to acquire the
> locks in the default cases. 

No, I don't think it's a good tradeoff.  We'd also need to move vcpu_{load,put}()
into the cmd helpers, and theoretically slowing down a bad ioctl invocation due
to taking extra locks is a complete non-issue.

