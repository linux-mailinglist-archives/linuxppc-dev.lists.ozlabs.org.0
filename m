Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E590718BAC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:14:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWhq05Dfjz3fNX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:14:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=kHJHBx69;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=kHJHBx69;
	dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWhnX6kfJz3fDg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:13:19 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3f804665702so72161cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685567596; x=1688159596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+2qoqODzznlrzJdzN64MjbCVNNnQuwRRtJuX4ggbCU=;
        b=kHJHBx69u6844yWRg+bdMx0m0tvgPlagRdL9WAIhqNvPpu8LX6GMuzHUHixyWgd9Mf
         qMY0qxpAkEmOxYZNrn0heIVjfGWpYgIwlgNcz8wlOeZnnk3GSZB4NDa6DPPoQDzEoBo0
         lR6HimNkut+XEN2CfKEthgqEw9XODXPnFgApD2MocwWQg3P600hpjTCFdeQ/aa4jxYoA
         id1X9co22nLUO5CFxyBWnUvevyXMChC/vrSNZ3kgUh9Qq84ljrXGo9BVv2lPuo5FhPmW
         R5vkwByRhT5602h6iBd8eMi2T7L9oJexCh5hLLcf6GpQ/OcBRYje/jyno1z0YmKsVGx1
         h3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685567596; x=1688159596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+2qoqODzznlrzJdzN64MjbCVNNnQuwRRtJuX4ggbCU=;
        b=fphpfzJTadKmpHCgxBApLuZ5peOrAG7A90wKB9Injr2nfDhM7kRSZZzSXmiTiqMTOv
         zb0/X8hi2F6hLIx+8K5C8ikI+XF0DieJgmlmhBu8MS1bBGDViYSETOHHRkRImxNLPd2D
         eI6atc9qiaJ8P4QpZE10e52NKb/eHXtMs3DNX+IoSbC3jRvGA9cl4RfuI9vaOkvUnt/5
         F0FesxH9kXLcxH0d+q05M6s9mQml8e9SCrzvWX0aXwIPVRBWsiMOoNnuHRPu/Z3ma7P+
         jqUwATKJSysuRHiE82vLMr06+voKszRYCgLgyPG6TJ1xo4aLzSkRSF8eXkPyMYJlRw7l
         DvAw==
X-Gm-Message-State: AC+VfDzlMFK07pCsPpquJKFAzTwFJCpUHx8xDPqvKXoGezPVzrQoWVFw
	1ulyOuWUtl9i69+mEQjDtispskQf3gbXzwOpV8S30g==
X-Google-Smtp-Source: ACHHUZ5WfYJ6eA2+oGfutrPzowugKbbUX/q/GiLW+TIRlZfdD7OeKd4PuotxSoDS0rqsIQKlsK37axqyrYA0yyXPG+Q=
X-Received: by 2002:a05:622a:1a11:b0:3f8:3065:7fc5 with SMTP id
 f17-20020a05622a1a1100b003f830657fc5mr7534qtb.1.1685567595969; Wed, 31 May
 2023 14:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230526234435.662652-6-yuzhao@google.com>
 <ZHemUc3DiSbxQbxJ@linux.dev>
In-Reply-To: <ZHemUc3DiSbxQbxJ@linux.dev>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 31 May 2023 15:12:39 -0600
Message-ID: <CAOUHufa8+NZcctoYXOZQXNdvKTUxAMDF3sC=X+3mv4juMUyrLA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 05/10] kvm/arm64: add kvm_arch_test_clear_young()
To: Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fab
 iano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 31, 2023 at 1:56=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> Hi Yu,
>
> On Fri, May 26, 2023 at 05:44:30PM -0600, Yu Zhao wrote:
> > Implement kvm_arch_test_clear_young() to support the fast path in
> > mmu_notifier_ops->test_clear_young().
> >
> > It focuses on a simple case, i.e., hardware sets the accessed bit in
> > KVM PTEs and VMs are not protected, where it can rely on RCU and
> > cmpxchg to safely clear the accessed bit without taking
> > kvm->mmu_lock. Complex cases fall back to the existing slow path
> > where kvm->mmu_lock is then taken.
> >
> > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h |  6 ++++++
> >  arch/arm64/kvm/mmu.c              | 36 +++++++++++++++++++++++++++++++
> >  2 files changed, 42 insertions(+)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm=
/kvm_host.h
> > index 7e7e19ef6993..da32b0890716 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1113,4 +1113,10 @@ static inline void kvm_hyp_reserve(void) { }
> >  void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
> >  bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
> >
> > +#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
> > +static inline bool kvm_arch_has_test_clear_young(void)
> > +{
> > +     return cpu_has_hw_af() && !is_protected_kvm_enabled();
> > +}
>
> I would *strongly* suggest you consider supporting test_clear_young on
> systems that do software Access Flag management. FEAT_HAFDBS is an
> *optional* extension to the architecture, so we're going to support
> software AF management for a very long time in KVM. It is also a valid
> fallback option in the case of hardware errata which render HAFDBS
> broken.

Hi Oliver,

It's not about willingness but resources. Ideally we want to make
everything perfect, but in reality, we can only move forward one step
a time.

If I looked at your request from ARM's POV, I would agree with you.
But my goal is to lay the foundation for all architectures that could
benefit, so I may not be able to cover a lot for each architecture.
Specifically, I don't have the bandwidth to test the !FEAT_HAFDBS case
for ARM.

So here are some options I could offer, ordered by my preferences:
1. We proceed as it is for now. I *will* find someone from my team (or
yours) to follow up -- this way we can make sure !FEAT_HAFDBS is well
tested.
2. I drop the cpu_has_hw_af() check above. Not that I think there is
much risk, I'm just trying to be cautious.
3. I drop the entire ARM support (and include the RISC-V support which
I previously deprioritized). We revisit after the test is done.

Sounds reasonable?

> So, we should expect (and support) systems of all shapes and sizes that
> do software AF. I'm sure we'll hear about more in the not-too-distant
> future...
>
> For future reference (even though I'm suggesting you support software
> AF), decisions such of these need an extremely verbose comment
> describing the rationale behind the decision.
>
> > +
> >  #endif /* __ARM64_KVM_HOST_H__ */
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index c3b3e2afe26f..26a8d955b49c 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
>
> Please do not implement page table walkers outside of hyp/pgtable.c
>
> > @@ -1678,6 +1678,42 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kv=
m_gfn_range *range)
> >                                          range->start << PAGE_SHIFT);
> >  }
> >
> > +static int stage2_test_clear_young(const struct kvm_pgtable_visit_ctx =
*ctx,
> > +                                enum kvm_pgtable_walk_flags flags)
> > +{
> > +     kvm_pte_t new =3D ctx->old & ~KVM_PTE_LEAF_ATTR_LO_S2_AF;
> > +
> > +     VM_WARN_ON_ONCE(!page_count(virt_to_page(ctx->ptep)));
>
> This sort of sanity checking is a bit excessive. Isn't there a risk of
> false negatives here too? IOW, if we tragically mess up RCU in the page
> table code, what's stopping a prematurely freed page from being
> allocated to another user?

Yes, but from my aforementioned POV (the breadth I'm focusing on),
this is a good practice. I can live without this assertion if you feel
strongly about it.

> > +     if (!kvm_pte_valid(new))
> > +             return 0;
> > +
> > +     if (new =3D=3D ctx->old)
> > +             return 0;
> > +
> > +     if (kvm_should_clear_young(ctx->arg, ctx->addr / PAGE_SIZE))
> > +             stage2_try_set_pte(ctx, new);
> > +
> > +     return 0;
> > +}
> > +
> > +bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *=
range)
> > +{
> > +     u64 start =3D range->start * PAGE_SIZE;
> > +     u64 end =3D range->end * PAGE_SIZE;
> > +     struct kvm_pgtable_walker walker =3D {
> > +             .cb     =3D stage2_test_clear_young,
> > +             .arg    =3D range,
> > +             .flags  =3D KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_SHAR=
ED,
> > +     };
> > +
> > +     BUILD_BUG_ON(is_hyp_code());
>
> Delete this assertion.

Will do.
