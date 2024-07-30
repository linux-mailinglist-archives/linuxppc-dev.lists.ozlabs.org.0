Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD4694206B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 21:16:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MMXy2mAj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYQ1z5CfDz2y8d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 05:16:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MMXy2mAj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=32zupzgykddqiuqdzsweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYQ1H37Smz3cbC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 05:15:45 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-66a2aee82a0so84983067b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722366940; x=1722971740; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ISzuCdCQ1ApBdrb/imzREuT+CY1/CgtGbhMTtqRUAc=;
        b=MMXy2mAjOtnHwVnwUzOvaYOXS0kymip+ZURXv2i1/IrCV20oho6LsvAfbaTT4rPp8o
         E/aVklDT9zy4PInPq9xwabJp+j0Spp9D4IqBNXCaQ74LqJvZDMndsKD2lIqCoIs3LQsu
         3K1zSBYtwupIkUeIKNInqmpq9l2R5xBbvU1/Rri6mYH95Qy8J/QFXGwFu+HAIVMs1q7L
         6wsYrKzdI/CVwCd43JFlw++bEI8yDlJGVSqidm7o7WXTeh+7+X97nv6n/4euKgO+nsR+
         usE4cIUT/GKU0WLS6vHwAGjREBaK5P0YLZaW56j1q3qa+5SXn84VR8XnsoqrWuFAhfVw
         tBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722366940; x=1722971740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ISzuCdCQ1ApBdrb/imzREuT+CY1/CgtGbhMTtqRUAc=;
        b=ilFpyD3ONJZqshpH68oeuLDjjDI0mo6hWMDmZx2jJAcglb0vazPXt31MTqHtpm0UUA
         n6SuS8b2CpY1390hn01uYsnx20NwitFeGE723V4V+GH4u+miRB2dzqmWaJ0MX1h9BjaO
         1b8COFzppwA4UnKmkc5jaML8mZAAZ1RKUAUbuok1E1geGXINkCZCnfBo6Ws6j+alKXgK
         mqTuTrJRLEUTlkx4NAiQRpQDMdnUYHtSXjqWwGp045Xmf/YsGpiG/tMeFWhdQ/Y+xdOB
         HzUF5wVzW8ju8QseaosMbEEBWN3p7QXsyhp+FoazpvJelV/zXWsRvVg+2vmDTxMyZ5KZ
         RgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk4GKsnLaZdADII7G8TyVIUdiPyNBn5o/TVBR76AgxJXD3FCBqY4jzM1vUsr+AzZu2aH2U0eJSlXi0rGzcrDnOyTFJveDQPsdvMfaY/g==
X-Gm-Message-State: AOJu0Yx4gapIHl+YOk6cxd0odS1vMID6t5UtEAePbmovPZzIHFwcWeNj
	8DqnK4ncipI+Gw1XvnLwytuCfG5EcBK0ahTatpPCDE+QGLJ0ehHfqO2Hdj7b6BTH69xHQPZyPq8
	NhA==
X-Google-Smtp-Source: AGHT+IG9SmfuMb4gtd0Ao4BPZkLVByP1qx5TNQuKOL4wYDlOLmXqkqaZZiuA2JFi0z3WenSC5NZXiGCdyNk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2b8f:b0:e03:59e2:e82 with SMTP id
 3f1490d57ef6-e0b545a3f3dmr19046276.10.1722366939560; Tue, 30 Jul 2024
 12:15:39 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:15:38 -0700
In-Reply-To: <96df1dd5-cc31-4e84-84fd-ea75b4800be8@redhat.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-49-seanjc@google.com>
 <96df1dd5-cc31-4e84-84fd-ea75b4800be8@redhat.com>
Message-ID: <Zqk72jP1c8N0Pn1O@google.com>
Subject: Re: [PATCH v12 48/84] KVM: Move x86's API to release a faultin page
 to common KVM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:51, Sean Christopherson wrote:
> > Move KVM x86's helper that "finishes" the faultin process to common KVM
> > so that the logic can be shared across all architectures.  Note, not all
> > architectures implement a fast page fault path, but the gist of the
> > comment applies to all architectures.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/x86/kvm/mmu/mmu.c   | 24 ++----------------------
> >   include/linux/kvm_host.h | 26 ++++++++++++++++++++++++++
> >   2 files changed, 28 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 95beb50748fc..2a0cfa225c8d 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -4323,28 +4323,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
> >   static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
> >   				      struct kvm_page_fault *fault, int r)
> >   {
> > -	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
> > -			    r == RET_PF_RETRY);
> > -
> > -	if (!fault->refcounted_page)
> > -		return;
> > -
> > -	/*
> > -	 * If the page that KVM got from the *primary MMU* is writable, and KVM
> > -	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
> > -	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
> > -	 * the GFN is write-protected.  Folios can't be safely marked dirty
> > -	 * outside of mmu_lock as doing so could race with writeback on the
> > -	 * folio.  As a result, KVM can't mark folios dirty in the fast page
> > -	 * fault handler, and so KVM must (somewhat) speculatively mark the
> > -	 * folio dirty if KVM could locklessly make the SPTE writable.
> > -	 */
> > -	if (r == RET_PF_RETRY)
> > -		kvm_release_page_unused(fault->refcounted_page);
> > -	else if (!fault->map_writable)
> > -		kvm_release_page_clean(fault->refcounted_page);
> > -	else
> > -		kvm_release_page_dirty(fault->refcounted_page);
> > +	kvm_release_faultin_page(vcpu->kvm, fault->refcounted_page,
> > +				 r == RET_PF_RETRY, fault->map_writable);
> 
> Does it make sense to move RET_PF_* to common code, and avoid a bool
> argument here?

After this series, probably?  Especially if/when we make "struct kvm_page_fault"
a common structure and converge all arch code.  In this series, definitely not,
as it would require even more patches to convert other architectures, and it's
not clear that it would be a net win, at least not without even more massaging.
