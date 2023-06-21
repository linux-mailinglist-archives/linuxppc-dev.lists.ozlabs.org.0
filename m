Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 292B773795F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 04:52:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=J9rhQVz1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qm7Mv6JlLz3bPG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 12:52:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=J9rhQVz1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qm7Ly3KXSz305g
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 12:51:53 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6b46e540326so2699082a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 19:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687315909; x=1689907909;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJNr1vyPvHbMEk8O8XldE8NbrEXH2idSMvV3eZDgIT4=;
        b=J9rhQVz1R8lKDLiKwNIPca+zvG5Tv3NsIAj1Ji/wwJWZ5NGPo67uNji7TMbGfymVWO
         GMr37w69IFJ1a/xO2A5DmceFjN0O32RpzdAIssyO44XqTHGckAF25peyXSxvQDN3Hon3
         nm7yK6UQvcoGWP40qbNg1er6nj4r5UQsT0ym99rNBvogtZMf2i5gafTMS+lgcgzNQGKq
         aoUmdiGQ3/vjF0fTi0Y3GwgVLDETdD79PdEDbQpGXiviLmWKyCtsFqxqvYfIKO+j7cmH
         1dwMi6f30X6ti1+jJ2sfUBHAIRnjtvhicwwWnFeGYhp7QveaAM4i9Fm9K8L5dJwflH0T
         aPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687315909; x=1689907909;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qJNr1vyPvHbMEk8O8XldE8NbrEXH2idSMvV3eZDgIT4=;
        b=F2bmMQ8n9sKSj5i8kuL9CWBEL4hbF3fkbEq9yunImzK9+bn9pj0lkFcOapcdzlo1Nf
         LyiweDru8/mnlTkxuirsoOiYJNS15v4yfTqMwnYb1oHd03D6Yasu2aM+DNTj5cJu4sg/
         I5s+gwvGnRnwBj4IkwzlUEkIYF9joeq1tXVqyuaM/laKnLM2zwe7++Bg+c0OY26mPhDW
         6s1l1WescXjiiwLFEuwLXXvUgjFgS7dLYNoCD3LwGZtYUHdZ6mxA3qUdTP7ZRT6yVV3O
         NQr1WHnt7oDPlx8QK/75P4COK4+DBvKTUNH+SNstvzsss05CCNdZmyM/Fud11d7GI0Ud
         5xmg==
X-Gm-Message-State: AC+VfDwoOWgMjmqLqg26hc44x7QA9exT6CzRSNUvBw/IwQ4yTOzTW4kr
	bHHklogZa/XKsa8AiMCYk/g=
X-Google-Smtp-Source: ACHHUZ4vmFcBnDcvLrBXtT15BOX4k0uY1EIRYfrVxGT80rydywp/6szlGIEPs7lB1lYg1S65G5/lLQ==
X-Received: by 2002:a05:6359:a26:b0:12c:9960:ec1e with SMTP id el38-20020a0563590a2600b0012c9960ec1emr8123207rwb.19.1687315909090;
        Tue, 20 Jun 2023 19:51:49 -0700 (PDT)
Received: from localhost (193-116-203-37.tpgi.com.au. [193.116.203.37])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902bd8f00b001a5fccab02dsm2246983pls.177.2023.06.20.19.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 19:51:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jun 2023 12:51:31 +1000
Message-Id: <CTHZKBJCQRHR.11CFMPICJ8XQP@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Yu Zhao" <yuzhao@google.com>
Subject: Re: [PATCH mm-unstable v2 07/10] kvm/powerpc: add
 kvm_arch_test_clear_young()
X-Mailer: aerc 0.14.0
References: <20230526234435.662652-1-yuzhao@google.com>
 <20230526234435.662652-8-yuzhao@google.com>
 <CTHB6A4EL3IH.3UJFAJ4LV85X6@wheely>
 <CAOUHufaEpyXjr-zPRXRsGdiJV9ZDo2qxA32swcJ30=7Nmyg3vQ@mail.gmail.com>
In-Reply-To: <CAOUHufaEpyXjr-zPRXRsGdiJV9ZDo2qxA32swcJ30=7Nmyg3vQ@mail.gmail.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc
 Zyngier <maz@kernel.org>, "H. Peter
 Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas
 Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver
 Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jun 21, 2023 at 10:38 AM AEST, Yu Zhao wrote:
> On Tue, Jun 20, 2023 at 1:48=E2=80=AFAM Nicholas Piggin <npiggin@gmail.co=
m> wrote:
> >
> > On Sat May 27, 2023 at 9:44 AM AEST, Yu Zhao wrote:
> > > Implement kvm_arch_test_clear_young() to support the fast path in
> > > mmu_notifier_ops->test_clear_young().
> > >
> > > It focuses on a simple case, i.e., radix MMU sets the accessed bit in
> > > KVM PTEs and VMs are not nested, where it can rely on RCU and
> > > pte_xchg() to safely clear the accessed bit without taking
> > > kvm->mmu_lock. Complex cases fall back to the existing slow path
> > > where kvm->mmu_lock is then taken.
> > >
> > > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > > ---
> > >  arch/powerpc/include/asm/kvm_host.h    |  8 ++++
> > >  arch/powerpc/include/asm/kvm_ppc.h     |  1 +
> > >  arch/powerpc/kvm/book3s.c              |  6 +++
> > >  arch/powerpc/kvm/book3s.h              |  1 +
> > >  arch/powerpc/kvm/book3s_64_mmu_radix.c | 59 ++++++++++++++++++++++++=
++
> > >  arch/powerpc/kvm/book3s_hv.c           |  5 +++
> > >  6 files changed, 80 insertions(+)
> > >
> > > diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/inclu=
de/asm/kvm_host.h
> > > index 14ee0dece853..75c260ea8a9e 100644
> > > --- a/arch/powerpc/include/asm/kvm_host.h
> > > +++ b/arch/powerpc/include/asm/kvm_host.h
> > > @@ -883,4 +883,12 @@ static inline void kvm_arch_sched_in(struct kvm_=
vcpu *vcpu, int cpu) {}
> > >  static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> > >  static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {=
}
> > >
> > > +#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
> > > +static inline bool kvm_arch_has_test_clear_young(void)
> > > +{
> > > +     return IS_ENABLED(CONFIG_KVM_BOOK3S_HV_POSSIBLE) &&
> > > +            cpu_has_feature(CPU_FTR_HVMODE) && cpu_has_feature(CPU_F=
TR_ARCH_300) &&
> > > +            radix_enabled();
> >
> > This could probably be radix_enabled() && !kvmhv_on_pseries().
>
> Will do. (I used !kvmhv_on_pseries() in v1 but had second thoughts on
> moving kvmhv_on_pseries() into this file.)

That should be okay. kvmhv_on_pseries is a property of the host so it
seems reasonable to move it here if needed.

> > Although unclear why not nested hypervisor... I'd have to think about i=
t a bit
> > more. Do you have any idea what might go wrong, or just didn't have the
> > time to consider it? (Not just powerpc nested but any others).
>
> Yes, this series excludes nested KVM support on all architures. The
> common reason for such a decision on powerpc and x86 (aarch64 doesn't
> support nested yet) is that it's quite challenging to make the rmap, a
> complex data structure that maps one PFN to multiple GFNs, lockless.
> (See kvmhv_insert_nest_rmap().) It might be possible, however, the
> potential ROI would be in question.

Okay just wondering. rmap (at least the powerpc one) is just a list
I think, with a few details. If that is all it is, it might not be
so hard to make that lock-free or a fine-grained lock on the rmap
chains maybe. But fine to ignore it to start with.

> > > +}
> > > +
> > >  #endif /* __POWERPC_KVM_HOST_H__ */
> > > diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/includ=
e/asm/kvm_ppc.h
> > > index 79a9c0bb8bba..ff1af6a7b44f 100644
> > > --- a/arch/powerpc/include/asm/kvm_ppc.h
> > > +++ b/arch/powerpc/include/asm/kvm_ppc.h
> > > @@ -287,6 +287,7 @@ struct kvmppc_ops {
> > >       bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *=
range);
> > >       bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> > >       bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *ran=
ge);
> > > +     bool (*test_clear_young)(struct kvm *kvm, struct kvm_gfn_range =
*range);
> > >       bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *ran=
ge);
> > >       void (*free_memslot)(struct kvm_memory_slot *slot);
> > >       int (*init_vm)(struct kvm *kvm);
> > > diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> > > index 686d8d9eda3e..37bf40b0c4ff 100644
> > > --- a/arch/powerpc/kvm/book3s.c
> > > +++ b/arch/powerpc/kvm/book3s.c
> > > @@ -899,6 +899,12 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kv=
m_gfn_range *range)
> > >       return kvm->arch.kvm_ops->test_age_gfn(kvm, range);
> > >  }
> > >
> > > +bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range=
 *range)
> > > +{
> > > +     return !kvm->arch.kvm_ops->test_clear_young ||
> > > +            kvm->arch.kvm_ops->test_clear_young(kvm, range);
> > > +}
> > > +
> > >  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> > >  {
> > >       return kvm->arch.kvm_ops->set_spte_gfn(kvm, range);
> > > diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
> > > index 58391b4b32ed..fa2659e21ccc 100644
> > > --- a/arch/powerpc/kvm/book3s.h
> > > +++ b/arch/powerpc/kvm/book3s.h
> > > @@ -12,6 +12,7 @@ extern void kvmppc_core_flush_memslot_hv(struct kvm=
 *kvm,
> > >  extern bool kvm_unmap_gfn_range_hv(struct kvm *kvm, struct kvm_gfn_r=
ange *range);
> > >  extern bool kvm_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *ra=
nge);
> > >  extern bool kvm_test_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_rang=
e *range);
> > > +extern bool kvm_test_clear_young_hv(struct kvm *kvm, struct kvm_gfn_=
range *range);
> > >  extern bool kvm_set_spte_gfn_hv(struct kvm *kvm, struct kvm_gfn_rang=
e *range);
> > >
> > >  extern int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu);
> > > diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kv=
m/book3s_64_mmu_radix.c
> > > index 3b65b3b11041..0a392e9a100a 100644
> > > --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > > +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > > @@ -1088,6 +1088,65 @@ bool kvm_test_age_radix(struct kvm *kvm, struc=
t kvm_memory_slot *memslot,
> > >       return ref;
> > >  }
> > >
> > > +bool kvm_test_clear_young_hv(struct kvm *kvm, struct kvm_gfn_range *=
range)
> > > +{
> > > +     bool err;
> > > +     gfn_t gfn =3D range->start;
> > > +
> > > +     rcu_read_lock();
> > > +
> > > +     err =3D !kvm_is_radix(kvm);
> > > +     if (err)
> > > +             goto unlock;
> > > +
> > > +     /*
> > > +      * Case 1:  This function          kvmppc_switch_mmu_to_hpt()
> > > +      *
> > > +      *          rcu_read_lock()
> > > +      *          Test kvm_is_radix()    kvm->arch.radix =3D 0
> > > +      *          Use kvm->arch.pgtable  synchronize_rcu()
> > > +      *          rcu_read_unlock()
> > > +      *                                 kvmppc_free_radix()
> > > +      *
> > > +      *
> > > +      * Case 2:  This function          kvmppc_switch_mmu_to_radix()
> > > +      *
> > > +      *                                 kvmppc_init_vm_radix()
> > > +      *                                 smp_wmb()
> > > +      *          Test kvm_is_radix()    kvm->arch.radix =3D 1
> > > +      *          smp_rmb()
> > > +      *          Use kvm->arch.pgtable
> > > +      */
> > > +     smp_rmb();
> >
> > Comment could stand to expand slightly on what you are solving, in
> > words.
>
> Will do.
>
> > If you use synchronize_rcu() on both sides, you wouldn't need the
> > barrier, right?
>
> Case 2 is about memory ordering, which is orthogonal to case 1 (RCU
> freeing). So we need the r/w barrier regardless.

RCU can take care of memory ordering too though. If you had
synchronize_rcu() where smp_wmb() is, then no smp_rmb() neeed here.

>
> > > +     while (gfn < range->end) {
> > > +             pte_t *ptep;
> > > +             pte_t old, new;
> > > +             unsigned int shift;
> > > +
> > > +             ptep =3D find_kvm_secondary_pte_unlocked(kvm, gfn * PAG=
E_SIZE, &shift);
> > > +             if (!ptep)
> > > +                     goto next;
> > > +
> > > +             VM_WARN_ON_ONCE(!page_count(virt_to_page(ptep)));
> >
> > Not really appropriate at the KVM level. mm enforces this kind of
> > thing (with notifiers).
>
> Will remove this.
>
> > > +
> > > +             old =3D READ_ONCE(*ptep);
> > > +             if (!pte_present(old) || !pte_young(old))
> > > +                     goto next;
> > > +
> > > +             new =3D pte_mkold(old);
> > > +
> > > +             if (kvm_should_clear_young(range, gfn))
> > > +                     pte_xchg(ptep, old, new);
> >
> > *Probably* will work. I can't think of a reason why not at the
> > moment anyway :)
>
> My reasoning:
> * It should work if we only change the dedicated A bit, i.e., not
> shared for other purposes, because races are safe (the case here).
> * It may not work for x86 EPT without the A bit (excluded in this
> series) where accesses are trapped by the R/X bits, because races in
> changing the R/X bits can be unsafe.

(For the benefit of others reading, it works because powerpc's pte_xchg
is actually a cmpxchg, for some reason which we really should fix).
Although it can fail to clear the bit if the cmpxchg fails.

I think pte_xchg is only used on with hash MMU in Linux before this
change. I think we may want to keep it that way and use something
like kvmppc_radix_update_pte() here to clear out the bit. But don't
worry too much about fine details so much before sorting out the
core changes I will have a better look after that.

Thanks,
Nick
