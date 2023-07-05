Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D8C74807E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 11:09:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QD+gfgoG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qwv471CvNz3bfK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 19:09:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QD+gfgoG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qwv3D0frMz30Kd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 19:08:37 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b6fdaf6eefso9392521fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688548109; x=1691140109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds/vxPMjy6e9Qs6QzqIDlAkBYqYxet8Enaf39dNopbw=;
        b=QD+gfgoGivCvxsG05GAV5MQjfVHMiJVwY2Nf9JAUUyjg+Fxm46GmMchtODlJtRGoLT
         LPR+bjBag/DV9YWcwbecis9HCFWjL4gFMFFNoX2QW9FgdS2lA7qeV8D0ly0vSQhK/nuy
         tMQpF+lTy5vE5lsrFPm/vCz8dEKxYm3f6lTWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688548109; x=1691140109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ds/vxPMjy6e9Qs6QzqIDlAkBYqYxet8Enaf39dNopbw=;
        b=kh4RAyOaR41a19I4zibaAwaG2T0mV78xgrRHzj4msu3THTwPC+mXWoLmkJAi8oCq8t
         V1zM8yiS9fpok4QWbtZ5SKJxcEX3Q2QEQ+swhsdmm98Rj6Tz0JgK+04buocYMQtDQx0W
         EbmWxc/vwHZVOek9w5xNJniPJKE2xcRDPVkzRYf/QbRUK24tBLMyUHGlm5Mkt5aALJSr
         hyi6Zq6fTBr8JycAjFmo/eOrKiFf5g+jkO3pML6FsLvHUtehNdTJsjNSNipS6vg28TWI
         +SKX294fE+8x+sdQN3Uvnw9Id8ItBkMfXmSveeqy25UiIZsEYG5DwuqqS+o08ooctUfk
         vyXw==
X-Gm-Message-State: ABy/qLYosWv9FbIr9Q+3dbpQhkS8+trcoM5PcZrgldk4XMffXKc34WzZ
	bAtnu5eJha81HlATRBYq60be4WVZYoQYbCocp7Z8FA==
X-Google-Smtp-Source: APBJJlFV2ZTPIEY2LRi5WO7rTUj6kHGucgpa2NKnbGiIkOh5BA0QgALZwvPrrojqf/IeHfMjcigzgWf0UgWOH8V6rFE=
X-Received: by 2002:a2e:3305:0:b0:2b6:fa92:479e with SMTP id
 d5-20020a2e3305000000b002b6fa92479emr2728526ljc.42.1688548109034; Wed, 05 Jul
 2023 02:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-3-stevensd@google.com>
 <20230705114732.000005c6.zhi.wang.linux@gmail.com>
In-Reply-To: <20230705114732.000005c6.zhi.wang.linux@gmail.com>
From: David Stevens <stevensd@chromium.org>
Date: Wed, 5 Jul 2023 18:08:17 +0900
Message-ID: <CAD=HUj4+20vtQTKiE69vWV1QVhx1o0uzRqvM+PMGn_=KGpfjHg@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] KVM: Introduce __kvm_follow_pfn function
To: Zhi Wang <zhi.wang.linux@gmail.com>
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 5, 2023 at 5:47=E2=80=AFPM Zhi Wang <zhi.wang.linux@gmail.com> =
wrote:
>
> On Tue,  4 Jul 2023 16:50:47 +0900
> David Stevens <stevensd@chromium.org> wrote:
>
> > From: David Stevens <stevensd@chromium.org>
> >
> > Introduce __kvm_follow_pfn, which will replace __gfn_to_pfn_memslot.
> > __kvm_follow_pfn refactors the old API's arguments into a struct and,
> > where possible, combines the boolean arguments into a single flags
> > argument.
> >
> > Signed-off-by: David Stevens <stevensd@chromium.org>
> > ---
> >  include/linux/kvm_host.h |  16 ++++
> >  virt/kvm/kvm_main.c      | 171 ++++++++++++++++++++++-----------------
> >  virt/kvm/kvm_mm.h        |   3 +-
> >  virt/kvm/pfncache.c      |   8 +-
> >  4 files changed, 122 insertions(+), 76 deletions(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 9d3ac7720da9..ef2763c2b12e 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -97,6 +97,7 @@
> >  #define KVM_PFN_ERR_HWPOISON (KVM_PFN_ERR_MASK + 1)
> >  #define KVM_PFN_ERR_RO_FAULT (KVM_PFN_ERR_MASK + 2)
> >  #define KVM_PFN_ERR_SIGPENDING       (KVM_PFN_ERR_MASK + 3)
> > +#define KVM_PFN_ERR_NEEDS_IO (KVM_PFN_ERR_MASK + 4)
> >
> >  /*
> >   * error pfns indicate that the gfn is in slot but faild to
> > @@ -1156,6 +1157,21 @@ unsigned long gfn_to_hva_memslot_prot(struct kvm=
_memory_slot *slot, gfn_t gfn,
> >  void kvm_release_page_clean(struct page *page);
> >  void kvm_release_page_dirty(struct page *page);
> >
> > +struct kvm_follow_pfn {
> > +     const struct kvm_memory_slot *slot;
> > +     gfn_t gfn;
> > +     unsigned int flags;
> > +     bool atomic;
> > +     /* Allow a read fault to create a writeable mapping. */
> > +     bool allow_write_mapping;
> > +
> > +     /* Outputs of __kvm_follow_pfn */
> > +     hva_t hva;
> > +     bool writable;
> > +};
> > +
> > +kvm_pfn_t __kvm_follow_pfn(struct kvm_follow_pfn *foll);
> > +
> >  kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
> >  kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault=
,
> >                     bool *writable);
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 371bd783ff2b..b13f22861d2f 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -2486,24 +2486,22 @@ static inline int check_user_page_hwpoison(unsi=
gned long addr)
> >   * true indicates success, otherwise false is returned.  It's also the
> >   * only part that runs if we can in atomic context.
> >   */
> > -static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
> > -                         bool *writable, kvm_pfn_t *pfn)
> > +static bool hva_to_pfn_fast(struct kvm_follow_pfn *foll, kvm_pfn_t *pf=
n)
> >  {
> >       struct page *page[1];
> > +     bool write_fault =3D foll->flags & FOLL_WRITE;
> >
> >       /*
> >        * Fast pin a writable pfn only if it is a write fault request
> >        * or the caller allows to map a writable pfn for a read fault
> >        * request.
> >        */
> > -     if (!(write_fault || writable))
> > +     if (!(write_fault || foll->allow_write_mapping))
> >               return false;
> >
> > -     if (get_user_page_fast_only(addr, FOLL_WRITE, page)) {
> > +     if (get_user_page_fast_only(foll->hva, FOLL_WRITE, page)) {
> >               *pfn =3D page_to_pfn(page[0]);
> > -
> > -             if (writable)
> > -                     *writable =3D true;
> > +             foll->writable =3D foll->allow_write_mapping;
> >               return true;
> >       }
> >
> > @@ -2514,35 +2512,26 @@ static bool hva_to_pfn_fast(unsigned long addr,=
 bool write_fault,
> >   * The slow path to get the pfn of the specified host virtual address,
> >   * 1 indicates success, -errno is returned if error is detected.
> >   */
> > -static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write=
_fault,
> > -                        bool interruptible, bool *writable, kvm_pfn_t =
*pfn)
> > +static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn=
)
> >  {
> > -     unsigned int flags =3D FOLL_HWPOISON;
> > +     unsigned int flags =3D FOLL_HWPOISON | FOLL_GET | foll->flags;
> >       struct page *page;
> >       int npages;
> >
> >       might_sleep();
> >
> > -     if (writable)
> > -             *writable =3D write_fault;
> > -
> > -     if (write_fault)
> > -             flags |=3D FOLL_WRITE;
> > -     if (async)
> > -             flags |=3D FOLL_NOWAIT;
> > -     if (interruptible)
> > -             flags |=3D FOLL_INTERRUPTIBLE;
> > -
> > -     npages =3D get_user_pages_unlocked(addr, 1, &page, flags);
> > +     npages =3D get_user_pages_unlocked(foll->hva, 1, &page, flags);
> >       if (npages !=3D 1)
> >               return npages;
> >
> > +     foll->writable =3D (foll->flags & FOLL_WRITE) && foll->allow_writ=
e_mapping;
> > +
> >       /* map read fault as writable if possible */
> > -     if (unlikely(!write_fault) && writable) {
> > +     if (unlikely(!foll->writable) && foll->allow_write_mapping) {
> >               struct page *wpage;
> >
> > -             if (get_user_page_fast_only(addr, FOLL_WRITE, &wpage)) {
> > -                     *writable =3D true;
> > +             if (get_user_page_fast_only(foll->hva, FOLL_WRITE, &wpage=
)) {
> > +                     foll->writable =3D true;
> >                       put_page(page);
> >                       page =3D wpage;
> >               }
> > @@ -2572,23 +2561,23 @@ static int kvm_try_get_pfn(kvm_pfn_t pfn)
> >       return get_page_unless_zero(page);
> >  }
> >
> > -static int hva_to_pfn_remapped(struct vm_area_struct *vma,
> > -                            unsigned long addr, bool write_fault,
> > -                            bool *writable, kvm_pfn_t *p_pfn)
> > +static int hva_to_pfn_remapped(struct vm_area_struct *vma, struct kvm_=
follow_pfn *foll,
> > +                            kvm_pfn_t *p_pfn)
> >  {
> >       kvm_pfn_t pfn;
> >       pte_t *ptep;
> >       spinlock_t *ptl;
> > +     bool write_fault =3D foll->flags & FOLL_WRITE;
> >       int r;
> >
> > -     r =3D follow_pte(vma->vm_mm, addr, &ptep, &ptl);
> > +     r =3D follow_pte(vma->vm_mm, foll->hva, &ptep, &ptl);
> >       if (r) {
> >               /*
> >                * get_user_pages fails for VM_IO and VM_PFNMAP vmas and =
does
> >                * not call the fault handler, so do it here.
> >                */
> >               bool unlocked =3D false;
> > -             r =3D fixup_user_fault(current->mm, addr,
> > +             r =3D fixup_user_fault(current->mm, foll->hva,
> >                                    (write_fault ? FAULT_FLAG_WRITE : 0)=
,
> >                                    &unlocked);
> >               if (unlocked)
> > @@ -2596,7 +2585,7 @@ static int hva_to_pfn_remapped(struct vm_area_str=
uct *vma,
> >               if (r)
> >                       return r;
> >
> > -             r =3D follow_pte(vma->vm_mm, addr, &ptep, &ptl);
> > +             r =3D follow_pte(vma->vm_mm, foll->hva, &ptep, &ptl);
> >               if (r)
> >                       return r;
> >       }
> > @@ -2606,8 +2595,7 @@ static int hva_to_pfn_remapped(struct vm_area_str=
uct *vma,
> >               goto out;
> >       }
> >
> > -     if (writable)
> > -             *writable =3D pte_write(*ptep);
> > +     foll->writable =3D pte_write(*ptep) && foll->allow_write_mapping;
> >       pfn =3D pte_pfn(*ptep);
> >
> >       /*
> > @@ -2652,24 +2640,22 @@ static int hva_to_pfn_remapped(struct vm_area_s=
truct *vma,
> >   * 2): @write_fault =3D false && @writable, @writable will tell the ca=
ller
> >   *     whether the mapping is writable.
> >   */
> > -kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool interruptib=
le,
> > -                  bool *async, bool write_fault, bool *writable)
> > +kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *foll)
> >  {
> >       struct vm_area_struct *vma;
> >       kvm_pfn_t pfn;
> >       int npages, r;
> >
> >       /* we can do it either atomically or asynchronously, not both */
> > -     BUG_ON(atomic && async);
> > +     BUG_ON(foll->atomic && (foll->flags & FOLL_NOWAIT));
> >
> > -     if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
> > +     if (hva_to_pfn_fast(foll, &pfn))
> >               return pfn;
> >
> > -     if (atomic)
> > +     if (foll->atomic)
> >               return KVM_PFN_ERR_FAULT;
> >
> > -     npages =3D hva_to_pfn_slow(addr, async, write_fault, interruptibl=
e,
> > -                              writable, &pfn);
> > +     npages =3D hva_to_pfn_slow(foll, &pfn);
> >       if (npages =3D=3D 1)
> >               return pfn;
> >       if (npages =3D=3D -EINTR)
> > @@ -2677,83 +2663,122 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool =
atomic, bool interruptible,
> >
> >       mmap_read_lock(current->mm);
> >       if (npages =3D=3D -EHWPOISON ||
> > -           (!async && check_user_page_hwpoison(addr))) {
> > +           (!(foll->flags & FOLL_NOWAIT) && check_user_page_hwpoison(f=
oll->hva))) {
> >               pfn =3D KVM_PFN_ERR_HWPOISON;
> >               goto exit;
> >       }
> >
> >  retry:
> > -     vma =3D vma_lookup(current->mm, addr);
> > +     vma =3D vma_lookup(current->mm, foll->hva);
> >
> >       if (vma =3D=3D NULL)
> >               pfn =3D KVM_PFN_ERR_FAULT;
> >       else if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
> > -             r =3D hva_to_pfn_remapped(vma, addr, write_fault, writabl=
e, &pfn);
> > +             r =3D hva_to_pfn_remapped(vma, foll, &pfn);
> >               if (r =3D=3D -EAGAIN)
> >                       goto retry;
> >               if (r < 0)
> >                       pfn =3D KVM_PFN_ERR_FAULT;
> >       } else {
> > -             if (async && vma_is_valid(vma, write_fault))
> > -                     *async =3D true;
> > -             pfn =3D KVM_PFN_ERR_FAULT;
> > +             if ((foll->flags & FOLL_NOWAIT) &&
> > +                 vma_is_valid(vma, foll->flags & FOLL_WRITE))
> > +                     pfn =3D KVM_PFN_ERR_NEEDS_IO;
> > +             else
> > +                     pfn =3D KVM_PFN_ERR_FAULT;
> >       }
> >  exit:
> >       mmap_read_unlock(current->mm);
> >       return pfn;
> >  }
> >
> > -kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn=
_t gfn,
> > -                            bool atomic, bool interruptible, bool *asy=
nc,
> > -                            bool write_fault, bool *writable, hva_t *h=
va)
> > +kvm_pfn_t __kvm_follow_pfn(struct kvm_follow_pfn *foll)
> >  {
> > -     unsigned long addr =3D __gfn_to_hva_many(slot, gfn, NULL, write_f=
ault);
> > -
> > -     if (hva)
> > -             *hva =3D addr;
> > +     foll->hva =3D __gfn_to_hva_many(foll->slot, foll->gfn, NULL,
> > +                                   foll->flags & FOLL_WRITE);
> >
> > -     if (addr =3D=3D KVM_HVA_ERR_RO_BAD) {
> > -             if (writable)
> > -                     *writable =3D false;
> > +     if (foll->hva =3D=3D KVM_HVA_ERR_RO_BAD)
> >               return KVM_PFN_ERR_RO_FAULT;
> > -     }
> >
>
> Can you explain why updating foll->writable =3D false (previously *writea=
ble
> =3D false) is omitted here?
>
> In the caller where the struct kvm_follow_pfn is initialized, e.g.
> __gfn_to_pfn_memslot()/gfn_to_pfn_prot(), .writable is not initialized.
> IIUC, they expect __kvm_follow_pfn() to update it and return .writable to
> upper caller.
>
> As the one of the output, it would be better to initalize it either in th=
e
> caller or update it in __kvm_follow_pfn(). Or
> __gfn_to_pfn_memslot()/gfn_to_pfn_prot() will return random data in the
> stack to the caller via bool *writable. It doesn't sound nice.

Entries omitted from an initializer are initialized to zero, so
.writable does get initialized in all of the patches in this series
via designated initializers. Although you're right that explicitly
setting it to false is a good idea, in case someday someone adds a
caller that doesn't use an initializer when declaring its
kvm_follow_pfn.

-David
