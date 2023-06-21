Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C219E73785B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 02:39:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=0kug6R+G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qm4QL4rVGz30hW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 10:39:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=0kug6R+G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qm4PT2FTFz309J
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 10:38:52 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-3ff242aae7aso63621cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687307928; x=1689899928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbeEtUy9SR2M7k28TLFp+3oTL4iFQyUyRuoTI6dZXb8=;
        b=0kug6R+GWSxgd5hSxLlcycwxHzz/P0efqWWmQ0XJGjPTw0p18ICZI+ckgtCD2EgDM0
         tpETl0tLYLIg0uN3zbUrotFafJfZ99YCdjPSCVmb8+2eqsLu2yK2G6zzoy2tS7GGZGS6
         FkCkh37ZJEcrXrkFNC8KktqvO9y1ghN5ZT05cmxNTPiRsvVHDwzcUsXc+UtzA2a9Q6+t
         7jJbW0Wafek2eGbY7aWKk2RLY7wgWd175TmL/pFPlLDjbat4owzU/m1qg7mJTSxvGJpY
         BmQyB24jIDfoMSdHUCS1pi/9MXSiZo79glRZ8ODdRwUIngU3r17N7qtKchHOQMg1ICkb
         aGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687307928; x=1689899928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbeEtUy9SR2M7k28TLFp+3oTL4iFQyUyRuoTI6dZXb8=;
        b=k1S5o+srH1jJs2Ii/2Bv+/tKphcE/Meifgiqt2m7ZtEdNYBXJgPJZOKOGEOGgesBTa
         95lfNYx+p7j9DDtBi8kDD/IxXM3eFAhPMX6/m7Hp4k1r6gMODFs0uY4i6hWzlfRg0eul
         eeJN2KXOszmBBeq3OjlGD1ZFfnqt1S+Dc/3pMRXyb2H4IiZ2O/4qihcVpsucdmM8qiVx
         g99+AOxI6MNJfW9DysFCY6dU/jJEPRlwuo0F3j4s9ostMid5bxZDFpe6ty3lliP0GZWG
         BJanSAaHbAzMav4LT4I7FDjiN1NgMzWVdyr/pDnPDkRuwCrIiouzJMiUgAQ8Vqr/Q6XH
         0kng==
X-Gm-Message-State: AC+VfDyrP9YCuW+V6Ki3unClzfm7SE0SrLJi5346ePNp6Oyw9CJjB1Ky
	h8mcdHLBQoUqhW4jHbz8CpqxAQGx/FdfhzuMvILpJA==
X-Google-Smtp-Source: ACHHUZ7DuWH27EJU0J2gyK8ww3GkEqCk3IcP9Lpwqnc/rAmLtX0jV9Bm68MFgueqO2IKbOsYe97TGNyxr+bVvBWc0gU=
X-Received: by 2002:ac8:7f93:0:b0:3ef:404a:b291 with SMTP id
 z19-20020ac87f93000000b003ef404ab291mr397682qtj.7.1687307928570; Tue, 20 Jun
 2023 17:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230526234435.662652-8-yuzhao@google.com>
 <CTHB6A4EL3IH.3UJFAJ4LV85X6@wheely>
In-Reply-To: <CTHB6A4EL3IH.3UJFAJ4LV85X6@wheely>
From: Yu Zhao <yuzhao@google.com>
Date: Tue, 20 Jun 2023 18:38:12 -0600
Message-ID: <CAOUHufaEpyXjr-zPRXRsGdiJV9ZDo2qxA32swcJ30=7Nmyg3vQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 07/10] kvm/powerpc: add kvm_arch_test_clear_young()
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 20, 2023 at 1:48=E2=80=AFAM Nicholas Piggin <npiggin@gmail.com>=
 wrote:
>
> On Sat May 27, 2023 at 9:44 AM AEST, Yu Zhao wrote:
> > Implement kvm_arch_test_clear_young() to support the fast path in
> > mmu_notifier_ops->test_clear_young().
> >
> > It focuses on a simple case, i.e., radix MMU sets the accessed bit in
> > KVM PTEs and VMs are not nested, where it can rely on RCU and
> > pte_xchg() to safely clear the accessed bit without taking
> > kvm->mmu_lock. Complex cases fall back to the existing slow path
> > where kvm->mmu_lock is then taken.
> >
> > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > ---
> >  arch/powerpc/include/asm/kvm_host.h    |  8 ++++
> >  arch/powerpc/include/asm/kvm_ppc.h     |  1 +
> >  arch/powerpc/kvm/book3s.c              |  6 +++
> >  arch/powerpc/kvm/book3s.h              |  1 +
> >  arch/powerpc/kvm/book3s_64_mmu_radix.c | 59 ++++++++++++++++++++++++++
> >  arch/powerpc/kvm/book3s_hv.c           |  5 +++
> >  6 files changed, 80 insertions(+)
> >
> > diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include=
/asm/kvm_host.h
> > index 14ee0dece853..75c260ea8a9e 100644
> > --- a/arch/powerpc/include/asm/kvm_host.h
> > +++ b/arch/powerpc/include/asm/kvm_host.h
> > @@ -883,4 +883,12 @@ static inline void kvm_arch_sched_in(struct kvm_vc=
pu *vcpu, int cpu) {}
> >  static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
> >  static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
> >
> > +#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
> > +static inline bool kvm_arch_has_test_clear_young(void)
> > +{
> > +     return IS_ENABLED(CONFIG_KVM_BOOK3S_HV_POSSIBLE) &&
> > +            cpu_has_feature(CPU_FTR_HVMODE) && cpu_has_feature(CPU_FTR=
_ARCH_300) &&
> > +            radix_enabled();
>
> This could probably be radix_enabled() && !kvmhv_on_pseries().

Will do. (I used !kvmhv_on_pseries() in v1 but had second thoughts on
moving kvmhv_on_pseries() into this file.)

> Although unclear why not nested hypervisor... I'd have to think about it =
a bit
> more. Do you have any idea what might go wrong, or just didn't have the
> time to consider it? (Not just powerpc nested but any others).

Yes, this series excludes nested KVM support on all architures. The
common reason for such a decision on powerpc and x86 (aarch64 doesn't
support nested yet) is that it's quite challenging to make the rmap, a
complex data structure that maps one PFN to multiple GFNs, lockless.
(See kvmhv_insert_nest_rmap().) It might be possible, however, the
potential ROI would be in question.

> > +}
> > +
> >  #endif /* __POWERPC_KVM_HOST_H__ */
> > diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/=
asm/kvm_ppc.h
> > index 79a9c0bb8bba..ff1af6a7b44f 100644
> > --- a/arch/powerpc/include/asm/kvm_ppc.h
> > +++ b/arch/powerpc/include/asm/kvm_ppc.h
> > @@ -287,6 +287,7 @@ struct kvmppc_ops {
> >       bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *ra=
nge);
> >       bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> >       bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range=
);
> > +     bool (*test_clear_young)(struct kvm *kvm, struct kvm_gfn_range *r=
ange);
> >       bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range=
);
> >       void (*free_memslot)(struct kvm_memory_slot *slot);
> >       int (*init_vm)(struct kvm *kvm);
> > diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> > index 686d8d9eda3e..37bf40b0c4ff 100644
> > --- a/arch/powerpc/kvm/book3s.c
> > +++ b/arch/powerpc/kvm/book3s.c
> > @@ -899,6 +899,12 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_=
gfn_range *range)
> >       return kvm->arch.kvm_ops->test_age_gfn(kvm, range);
> >  }
> >
> > +bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *=
range)
> > +{
> > +     return !kvm->arch.kvm_ops->test_clear_young ||
> > +            kvm->arch.kvm_ops->test_clear_young(kvm, range);
> > +}
> > +
> >  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> >  {
> >       return kvm->arch.kvm_ops->set_spte_gfn(kvm, range);
> > diff --git a/arch/powerpc/kvm/book3s.h b/arch/powerpc/kvm/book3s.h
> > index 58391b4b32ed..fa2659e21ccc 100644
> > --- a/arch/powerpc/kvm/book3s.h
> > +++ b/arch/powerpc/kvm/book3s.h
> > @@ -12,6 +12,7 @@ extern void kvmppc_core_flush_memslot_hv(struct kvm *=
kvm,
> >  extern bool kvm_unmap_gfn_range_hv(struct kvm *kvm, struct kvm_gfn_ran=
ge *range);
> >  extern bool kvm_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *rang=
e);
> >  extern bool kvm_test_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range =
*range);
> > +extern bool kvm_test_clear_young_hv(struct kvm *kvm, struct kvm_gfn_ra=
nge *range);
> >  extern bool kvm_set_spte_gfn_hv(struct kvm *kvm, struct kvm_gfn_range =
*range);
> >
> >  extern int kvmppc_mmu_init_pr(struct kvm_vcpu *vcpu);
> > diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/=
book3s_64_mmu_radix.c
> > index 3b65b3b11041..0a392e9a100a 100644
> > --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> > @@ -1088,6 +1088,65 @@ bool kvm_test_age_radix(struct kvm *kvm, struct =
kvm_memory_slot *memslot,
> >       return ref;
> >  }
> >
> > +bool kvm_test_clear_young_hv(struct kvm *kvm, struct kvm_gfn_range *ra=
nge)
> > +{
> > +     bool err;
> > +     gfn_t gfn =3D range->start;
> > +
> > +     rcu_read_lock();
> > +
> > +     err =3D !kvm_is_radix(kvm);
> > +     if (err)
> > +             goto unlock;
> > +
> > +     /*
> > +      * Case 1:  This function          kvmppc_switch_mmu_to_hpt()
> > +      *
> > +      *          rcu_read_lock()
> > +      *          Test kvm_is_radix()    kvm->arch.radix =3D 0
> > +      *          Use kvm->arch.pgtable  synchronize_rcu()
> > +      *          rcu_read_unlock()
> > +      *                                 kvmppc_free_radix()
> > +      *
> > +      *
> > +      * Case 2:  This function          kvmppc_switch_mmu_to_radix()
> > +      *
> > +      *                                 kvmppc_init_vm_radix()
> > +      *                                 smp_wmb()
> > +      *          Test kvm_is_radix()    kvm->arch.radix =3D 1
> > +      *          smp_rmb()
> > +      *          Use kvm->arch.pgtable
> > +      */
> > +     smp_rmb();
>
> Comment could stand to expand slightly on what you are solving, in
> words.

Will do.

> If you use synchronize_rcu() on both sides, you wouldn't need the
> barrier, right?

Case 2 is about memory ordering, which is orthogonal to case 1 (RCU
freeing). So we need the r/w barrier regardless.

> > +     while (gfn < range->end) {
> > +             pte_t *ptep;
> > +             pte_t old, new;
> > +             unsigned int shift;
> > +
> > +             ptep =3D find_kvm_secondary_pte_unlocked(kvm, gfn * PAGE_=
SIZE, &shift);
> > +             if (!ptep)
> > +                     goto next;
> > +
> > +             VM_WARN_ON_ONCE(!page_count(virt_to_page(ptep)));
>
> Not really appropriate at the KVM level. mm enforces this kind of
> thing (with notifiers).

Will remove this.

> > +
> > +             old =3D READ_ONCE(*ptep);
> > +             if (!pte_present(old) || !pte_young(old))
> > +                     goto next;
> > +
> > +             new =3D pte_mkold(old);
> > +
> > +             if (kvm_should_clear_young(range, gfn))
> > +                     pte_xchg(ptep, old, new);
>
> *Probably* will work. I can't think of a reason why not at the
> moment anyway :)

My reasoning:
* It should work if we only change the dedicated A bit, i.e., not
shared for other purposes, because races are safe (the case here).
* It may not work for x86 EPT without the A bit (excluded in this
series) where accesses are trapped by the R/X bits, because races in
changing the R/X bits can be unsafe.

> > +next:
> > +             gfn +=3D shift ? BIT(shift - PAGE_SHIFT) : 1;
> > +     }
> > +unlock:
> > +     rcu_read_unlock();
> > +
> > +     return err;
> > +}
> > +
> >  /* Returns the number of PAGE_SIZE pages that are dirty */
> >  static int kvm_radix_test_clear_dirty(struct kvm *kvm,
> >                               struct kvm_memory_slot *memslot, int page=
num)
> > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.=
c
> > index 130bafdb1430..20a81ec9fde8 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -5262,6 +5262,8 @@ int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
> >       spin_lock(&kvm->mmu_lock);
> >       kvm->arch.radix =3D 0;
> >       spin_unlock(&kvm->mmu_lock);
> > +     /* see the comments in kvm_test_clear_young_hv() */
>
> I'm guilty of such comments at times, but it wouldn't hurt to say
>         /* Finish concurrent kvm_test_clear_young_hv access to page table=
s */
>
> Then you know where to look for more info and you have a vague
> idea what it's for.

Will do.

> > +     synchronize_rcu();
>
> >       kvmppc_free_radix(kvm);
> >
> >       lpcr =3D LPCR_VPM1;
> > @@ -5286,6 +5288,8 @@ int kvmppc_switch_mmu_to_radix(struct kvm *kvm)
> >       if (err)
> >               return err;
> >       kvmppc_rmap_reset(kvm);
> > +     /* see the comments in kvm_test_clear_young_hv() */
> > +     smp_wmb();
> >       /* Mutual exclusion with kvm_unmap_gfn_range etc. */
> >       spin_lock(&kvm->mmu_lock);
> >       kvm->arch.radix =3D 1;
> > @@ -6185,6 +6189,7 @@ static struct kvmppc_ops kvm_ops_hv =3D {
> >       .unmap_gfn_range =3D kvm_unmap_gfn_range_hv,
> >       .age_gfn =3D kvm_age_gfn_hv,
> >       .test_age_gfn =3D kvm_test_age_gfn_hv,
> > +     .test_clear_young =3D kvm_test_clear_young_hv,
> >       .set_spte_gfn =3D kvm_set_spte_gfn_hv,
> >       .free_memslot =3D kvmppc_core_free_memslot_hv,
> >       .init_vm =3D  kvmppc_core_init_vm_hv,
>
> Thanks for looking at the powerpc conversion!

Thanks for reviewing!
