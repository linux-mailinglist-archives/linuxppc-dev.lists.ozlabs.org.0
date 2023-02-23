Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2F46A021F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 05:46:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMgT72QcSz3cDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 15:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KldsSOrZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e2a; helo=mail-vs1-xe2a.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KldsSOrZ;
	dkim-atps=neutral
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMgRN0VnZz3cMK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 15:44:31 +1100 (AEDT)
Received: by mail-vs1-xe2a.google.com with SMTP id a3so137563vsi.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 20:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKMjr7Rxqbv+CnGa/A6QjHWJcmQnXCdCgOjEl0O2AyY=;
        b=KldsSOrZ+whK6GS8ItSI8GbaPaoingpbkITCbC8iP5Na/f3qE/94VIvTGsXwpStTyv
         ddVVxE76Gx+CXC/H2DcqfgLyyTBpBHBW5mzkGI2ZnS6m0IzP/tDpXvfGxtyfGFilFaKj
         OTTPcr8H+2ptLKE6RF/rfsTjbPNX+q6CK6ONaeEAXLmImm1NN78/Lbrtaa6+3h5ipNHO
         sHF4B3yOY/jqYcmshXwQeMtLBPsbrZ/cL1JBO+1pEwI8mNxyoNXQ0K5rkZDljelRyozy
         U7mIOiWqy2V7XOTkoLzOhwaDPQvmoQfBh3wSTsduMBudpdNMgB9FZIgyrubGZL7RBld3
         WCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKMjr7Rxqbv+CnGa/A6QjHWJcmQnXCdCgOjEl0O2AyY=;
        b=I6YFU+Nv9O3iT2Va21g+G0TqnQcDZahRwRREvUcEGoJtfYcP+pDah6Dr1R7ZSnIPLw
         JtYN3aDSRdhTd3eD0RE4AsRTNm8oMirFAsgNzFeFgOncKSWcwpMhNTfOxh+lvl0LpA0k
         s1wNLrTobORiWfhC1V+hN+SDuQdIK8z7gUZdvBuYVd8dkGHSxXmqYnm4dQtGQIeX2kqP
         R0lKDEvi94s00YrWJXWh/6/TrU7PaA9xxW32xfBg2/Ni9uGJBDI6rXC2rlr8DCQcFddf
         HqBTFxOTx7SrBhvFJXgqr5WwvF0myrgmolCeKbHCmKMEdOk+4H3xO2yyaAnPAK2+qQTi
         l8dA==
X-Gm-Message-State: AO0yUKUJrPmc7ivS7oamU15zeWhknV7iGNx7ViFXetoJkow6UZ8MyuTZ
	I1PUR+4KQlKAb0pxenehL9rmLs5GujB64YEhWqH2mA==
X-Google-Smtp-Source: AK7set/jYL42RVs45A2l6N3tK6qvlX8e/whXZCANHirepJNMIs4VP2TB3H12vFITACk4sHqNPjUBk2Ol9OD0H+8R24k=
X-Received: by 2002:a05:6102:108f:b0:41e:d8b5:ee40 with SMTP id
 s15-20020a056102108f00b0041ed8b5ee40mr545448vsr.26.1677127467563; Wed, 22 Feb
 2023 20:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-4-yuzhao@google.com>
 <Y+9EUeUIS/ZUe2vw@linux.dev>
In-Reply-To: <Y+9EUeUIS/ZUe2vw@linux.dev>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 22 Feb 2023 21:43:51 -0700
Message-ID: <CAOUHufa9UEPVZTKUfm2UAOAkQ+abSwhupdX_7_=vZAQSqs8yng@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 3/5] kvm/arm64: add kvm_arch_test_clear_young()
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023 at 2:09=E2=80=AFAM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> Hi Yu,
>
> scripts/get_maintainers.pl is your friend for getting the right set of
> emails for a series :) Don't know about others, but generally I would
> prefer to be Cc'ed on an entire series (to gather context) than just an
> individual patch.

Will do. Thank you.

> On Thu, Feb 16, 2023 at 09:12:28PM -0700, Yu Zhao wrote:
> > This patch adds kvm_arch_test_clear_young() for the vast majority of
> > VMs that are not pKVM and run on hardware that sets the accessed bit
> > in KVM page tables.
> >
> > It relies on two techniques, RCU and cmpxchg, to safely test and clear
> > the accessed bit without taking the MMU lock. The former protects KVM
> > page tables from being freed while the latter clears the accessed bit
> > atomically against both the hardware and other software page table
> > walkers.
> >
> > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h       |  7 +++
> >  arch/arm64/include/asm/kvm_pgtable.h    |  8 +++
> >  arch/arm64/include/asm/stage2_pgtable.h | 43 ++++++++++++++
> >  arch/arm64/kvm/arm.c                    |  1 +
> >  arch/arm64/kvm/hyp/pgtable.c            | 51 ++--------------
> >  arch/arm64/kvm/mmu.c                    | 77 ++++++++++++++++++++++++-
> >  6 files changed, 141 insertions(+), 46 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm=
/kvm_host.h
> > index 35a159d131b5..572bcd321586 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -1031,4 +1031,11 @@ static inline void kvm_hyp_reserve(void) { }
> >  void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
> >  bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
> >
> > +/* see the comments on the generic kvm_arch_has_test_clear_young() */
> > +#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
> > +static inline bool kvm_arch_has_test_clear_young(void)
> > +{
> > +     return IS_ENABLED(CONFIG_KVM) && cpu_has_hw_af() && !is_protected=
_kvm_enabled();
> > +}
>
> Why does the lack of FEAT_HAFDBS preclude the use of the test-and-clear
> notifier?

This all comes down to the return on investment. We could
theoretically make it work but the complexity and the poor performance
would outweigh the benefits -- VM memory overcommit mostly happens in
Cloud and none of the major Cloud vendors use pre v8.2 [1].

[1] https://lore.kernel.org/linux-mm/CAOUHufbbs2gG+DPvSOw_N_Kx7FWdZvpdJUvLz=
ko-BDQ8vfd6Xg@mail.gmail.com/

> On implementations without FEAT_HAFDBS, hardware will generate a data
> abort for software to set the access flag. Regardless of whether
> software or hardware is responsible for updating the PTE that
> information is available in the page tables.

Agreed, the s/w emulation of the A-bit has poor performance. With the
forward looking in mind, businesses who wish to overcommit host memory
will eventually all move onto v8.2 and later. This is another reason
not to worry about pre v8.2 (or 32-bit for that matter).

> Also, I'm at a loss for why we'd need to test if CONFIG_KVM is enabled.
> My expectation is that we should provide an implementation that returns
> false if !CONFIG_KVM, avoiding the need to repeat that bit in every
> single implementation of the function.

We do have that default implementation. But we still need to disable
this implementation when !CONFIG_KVM (it isn't protected by #ifdef
CONFIG_KVM).

> > +
> >  #endif /* __ARM64_KVM_HOST_H__ */
> > diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/=
asm/kvm_pgtable.h
> > index 63f81b27a4e3..8c9a04388c88 100644
> > --- a/arch/arm64/include/asm/kvm_pgtable.h
> > +++ b/arch/arm64/include/asm/kvm_pgtable.h
> > @@ -105,6 +105,7 @@ static inline bool kvm_level_supports_block_mapping=
(u32 level)
> >   * @put_page:                        Decrement the refcount on a page.=
 When the
> >   *                           refcount reaches 0 the page is automatica=
lly
> >   *                           freed.
> > + * @put_page_rcu:            RCU variant of put_page().
> >   * @page_count:                      Return the refcount of a page.
> >   * @phys_to_virt:            Convert a physical address into a virtual
> >   *                           address mapped in the current context.
> > @@ -122,6 +123,7 @@ struct kvm_pgtable_mm_ops {
> >       void            (*free_removed_table)(void *addr, u32 level);
> >       void            (*get_page)(void *addr);
> >       void            (*put_page)(void *addr);
> > +     void            (*put_page_rcu)(void *addr);
>
> Why do we need this? We already defer dropping the last reference count
> on a page to an RCU callback. Have you observed issues with the existing
> implementation?

That's on the reader path, i.e., collapsing PTEs into a PMD, which
RCU-frees the PTE table.

On the writer path, unmapping wasn't protected by RCU before this
patch, and put_page_rcu() makes it so.

> >       int             (*page_count)(void *addr);
> >       void*           (*phys_to_virt)(phys_addr_t phys);
> >       phys_addr_t     (*virt_to_phys)(void *addr);
> > @@ -188,6 +190,12 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 add=
r, u64 end,
> >   *                                   children.
> >   * @KVM_PGTABLE_WALK_SHARED:         Indicates the page-tables may be =
shared
> >   *                                   with other software walkers.
> > + *
> > + * kvm_arch_test_clear_young() is a special case. It relies on two
> > + * techniques, RCU and cmpxchg, to safely test and clear the accessed
> > + * bit without taking the MMU lock. The former protects KVM page table=
s
> > + * from being freed while the latter clears the accessed bit atomicall=
y
> > + * against both the hardware and other software page table walkers.
> >   */
> >  enum kvm_pgtable_walk_flags {
> >       KVM_PGTABLE_WALK_LEAF                   =3D BIT(0),
> > diff --git a/arch/arm64/include/asm/stage2_pgtable.h b/arch/arm64/inclu=
de/asm/stage2_pgtable.h
> > index c8dca8ae359c..350437661d4b 100644
> > --- a/arch/arm64/include/asm/stage2_pgtable.h
> > +++ b/arch/arm64/include/asm/stage2_pgtable.h
> > @@ -30,4 +30,47 @@
> >   */
> >  #define kvm_mmu_cache_min_pages(kvm) (kvm_stage2_levels(kvm) - 1)
> >
> > +#define KVM_PTE_TYPE                 BIT(1)
> > +#define KVM_PTE_TYPE_BLOCK           0
> > +#define KVM_PTE_TYPE_PAGE            1
> > +#define KVM_PTE_TYPE_TABLE           1
> > +
> > +#define KVM_PTE_LEAF_ATTR_LO         GENMASK(11, 2)
> > +
> > +#define KVM_PTE_LEAF_ATTR_LO_S1_ATTRIDX      GENMASK(4, 2)
> > +#define KVM_PTE_LEAF_ATTR_LO_S1_AP   GENMASK(7, 6)
> > +#define KVM_PTE_LEAF_ATTR_LO_S1_AP_RO        3
> > +#define KVM_PTE_LEAF_ATTR_LO_S1_AP_RW        1
> > +#define KVM_PTE_LEAF_ATTR_LO_S1_SH   GENMASK(9, 8)
> > +#define KVM_PTE_LEAF_ATTR_LO_S1_SH_IS        3
> > +#define KVM_PTE_LEAF_ATTR_LO_S1_AF   BIT(10)
> > +
> > +#define KVM_PTE_LEAF_ATTR_LO_S2_MEMATTR      GENMASK(5, 2)
> > +#define KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R       BIT(6)
> > +#define KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W       BIT(7)
> > +#define KVM_PTE_LEAF_ATTR_LO_S2_SH   GENMASK(9, 8)
> > +#define KVM_PTE_LEAF_ATTR_LO_S2_SH_IS        3
> > +#define KVM_PTE_LEAF_ATTR_LO_S2_AF   BIT(10)
> > +
> > +#define KVM_PTE_LEAF_ATTR_HI         GENMASK(63, 51)
> > +
> > +#define KVM_PTE_LEAF_ATTR_HI_SW              GENMASK(58, 55)
> > +
> > +#define KVM_PTE_LEAF_ATTR_HI_S1_XN   BIT(54)
> > +
> > +#define KVM_PTE_LEAF_ATTR_HI_S2_XN   BIT(54)
> > +
> > +#define KVM_PTE_LEAF_ATTR_S2_PERMS   (KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R |=
 \
> > +                                      KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W |=
 \
> > +                                      KVM_PTE_LEAF_ATTR_HI_S2_XN)
> > +
> > +#define KVM_INVALID_PTE_OWNER_MASK   GENMASK(9, 2)
> > +#define KVM_MAX_OWNER_ID             1
> > +
> > +/*
> > + * Used to indicate a pte for which a 'break-before-make' sequence is =
in
> > + * progress.
> > + */
> > +#define KVM_INVALID_PTE_LOCKED               BIT(10)
> > +
>
> If there is a need to do these sort of moves, please do it in a separate
> patch. It pollutes the context of the functional change you're making.
>
> >  #endif       /* __ARM64_S2_PGTABLE_H_ */
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 9c5573bc4614..6770bc47f5c9 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -191,6 +191,7 @@ vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcp=
u, struct vm_fault *vmf)
> >   */
> >  void kvm_arch_destroy_vm(struct kvm *kvm)
> >  {
> > +     kvm_free_stage2_pgd(&kvm->arch.mmu);
> >
> >       bitmap_free(kvm->arch.pmu_filter);
> >       free_cpumask_var(kvm->arch.supported_cpus);
> >
>
> [...]
>
> > +struct test_clear_young_arg {
> > +     struct kvm_gfn_range *range;
> > +     gfn_t lsb_gfn;
> > +     unsigned long *bitmap;
> > +};
> > +
> > +static int stage2_test_clear_young(const struct kvm_pgtable_visit_ctx =
*ctx,
> > +                                enum kvm_pgtable_walk_flags flags)
> > +{
> > +     struct test_clear_young_arg *arg =3D ctx->arg;
> > +     gfn_t gfn =3D ctx->addr / PAGE_SIZE;
> > +     kvm_pte_t new =3D ctx->old & ~KVM_PTE_LEAF_ATTR_LO_S2_AF;
> > +
> > +     VM_WARN_ON_ONCE(!page_count(virt_to_page(ctx->ptep)));
> > +     VM_WARN_ON_ONCE(gfn < arg->range->start || gfn >=3D arg->range->e=
nd);
>
> Do we really need to be _this_ pedantic about sanity checking?

Will remove them. (My experience with the world's large fleets is that
Murphy's law is always true.)

> > +     if (!kvm_pte_valid(new))
> > +             return 0;
> > +
> > +     if (new =3D=3D ctx->old)
> > +             return 0;
> > +
> > +     /* see the comments on the generic kvm_arch_has_test_clear_young(=
) */
> > +     if (__test_and_change_bit(arg->lsb_gfn - gfn, arg->bitmap))
> > +             cmpxchg64(ctx->ptep, ctx->old, new);
>
> Why not use stage2_try_set_pte()? Not only is it idiomatic with the rest
> of the stage-2 code, it also will 'do the right thing' according to the
> locking scheme of the caller if we decide to change it at some point.

It's not exported. Do you prefer it to be exported?

> > +     return 0;
> > +}
> > +
> > +bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *=
range,
> > +                            gfn_t lsb_gfn, unsigned long *bitmap)
> > +{
> > +     u64 start =3D range->start * PAGE_SIZE;
> > +     u64 end =3D range->end * PAGE_SIZE;
> > +     struct test_clear_young_arg arg =3D {
> > +             .range          =3D range,
> > +             .lsb_gfn        =3D lsb_gfn,
> > +             .bitmap         =3D bitmap,
> > +     };
> > +     struct kvm_pgtable_walker walker =3D {
> > +             .cb             =3D stage2_test_clear_young,
> > +             .arg            =3D &arg,
> > +             .flags          =3D KVM_PGTABLE_WALK_LEAF,
> > +     };
> > +
> > +     BUILD_BUG_ON(is_hyp_code());
>
> See prior comment about sanity checking.
>
> > +     if (WARN_ON_ONCE(!kvm_arch_has_test_clear_young()))
> > +             return false;
>
> Same here...
>
> > +     /* see the comments on kvm_pgtable_walk_flags */
> > +     rcu_read_lock();
> > +
> > +     kvm_pgtable_walk(kvm->arch.mmu.pgt, start, end - start, &walker);
> > +
> > +     rcu_read_unlock();
>
> The rcu_read_{lock,unlock}() is entirely superfluous.

Not really. I didn't use the KVM_PGTABLE_WALK_SHARED flag above. Yes,
it would be more consistent with the rest of the ARM code. My POV is
that it would be less consistent with other archs, which I fully
expect you to disagree :)

I could add it and remove rcu_read_{lock,unlock}() if you prefer that way.

> Of course, it is somewhat hidden by the fact that we must use
> abstractions to support host and EL2 use of the page table code, but we
> already make use of RCU to protect the stage-2 of a 'regular' VM.
>
> > +     return true;
> > +}
> > +
> >  bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> >  {
> >       if (!kvm->arch.mmu.pgt)
> > @@ -1848,7 +1924,6 @@ void kvm_arch_memslots_updated(struct kvm *kvm, u=
64 gen)
> >
> >  void kvm_arch_flush_shadow_all(struct kvm *kvm)
> >  {
> > -     kvm_free_stage2_pgd(&kvm->arch.mmu);
> >  }
>
> Doesn't this become a blatant correctness issue? This entirely fails to
> uphold the exact expectations of the call.

I moved kvm_free_stage2_pgd() into kvm_arch_destroy_vm()  above so
that the mmu notifer SRCU will protect pgd at destruction. Don't worry
about this for now. I refactor this change and put_page_rcu() into a
separate patch to make it more clearer -- without them, RCU page table
walkers won't be safe against VM destruction and unmap.
