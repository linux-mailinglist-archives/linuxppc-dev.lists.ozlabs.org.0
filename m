Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5760774F75F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 19:38:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZlSOMyCU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0p561hslz3cNl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 03:38:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZlSOMyCU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=zhi.wang.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0p3g48Ndz3bws
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 03:37:35 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f14e14dc00so1620408e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 10:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689097051; x=1691689051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cv62ArNC/CwadYNaaU3XzD3RlSlBF2qlSerbg7scL98=;
        b=ZlSOMyCUA+rrWges8bQq5t4m1k0P/qa2oHJx8MfJslVtrT35aMmTx56/mlNhFEyfeF
         C1B/UwHBy4UiQI61syXJJY7z+5EixgHVB+VPrJPfNQ7dQmFlzBJlXfw1jrd6ZC6ebIIZ
         nakyQv6S+K24LtJOx6aIj+k6fcIzK2XUsfSh5t7n2GkaaXALpCWjJcOfX+9LZzWH1Pfz
         /wuhAmICF3OlZcURIVGV/bssJ0isJbW3YurB3cNCwUp+vO2wSOpBDl2pTQsBMQPZV0s+
         2kZByD7fVhJ0eYzNyZ30MavpFDmxdAEX+4zIMh9B+HAbpvZfNLL03GH9qCTOdLMyUk9X
         DsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689097051; x=1691689051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cv62ArNC/CwadYNaaU3XzD3RlSlBF2qlSerbg7scL98=;
        b=UFqmsG5jenirepLcK206RFi6N7BJ8vYmb1w3CzEVjR87YyldUEs//aIilLVGJbgHpG
         xbqWYcYKS/+wex9bduZI16QvDzxwKTdF0AlruxMxTEjFollE6SAuQTPTgSJhAeQ1woSa
         g8dZDhZqIw6Q+TFqHy71YN4Pwv/T23zZi6AYgf1USHF3TkWSJCNzT706AGy/U+tzUGs3
         73sZt1b6HHeEGGUoaV6KHYvzYADpYvK79B3pF4SLrah28TlyuIxo9VEay49ID4hwxn6+
         GCTVpcX+HE2sbK1hD0RfU90zz0XJhGRPK2fZXDapl4Dzwmp77tT4mI2uHVG0gHltBKxb
         p95A==
X-Gm-Message-State: ABy/qLaEBL7bTas3fq11Bhz9g4GuSgob3hIurKH6H4yki/GNkYCA7XtF
	mKfbnZpUC2uY7DjKQUT6KAE=
X-Google-Smtp-Source: APBJJlGAnzsZkM84N+kUYLTNvLgyhb+/ll7cd8ty2w0Cqxzeoi0K2l/eyRRNb4fN33t4GwGGrJKjOw==
X-Received: by 2002:ac2:4359:0:b0:4f9:6091:be99 with SMTP id o25-20020ac24359000000b004f96091be99mr10925241lfl.1.1689097050626;
        Tue, 11 Jul 2023 10:37:30 -0700 (PDT)
Received: from localhost (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
        by smtp.gmail.com with ESMTPSA id t10-20020ac2548a000000b004fbbd81856asm394170lfk.143.2023.07.11.10.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 10:37:30 -0700 (PDT)
Date: Tue, 11 Jul 2023 20:37:25 +0300
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 2/8] KVM: Introduce __kvm_follow_pfn function
Message-ID: <20230711203725.0000453c.zhi.wang.linux@gmail.com>
In-Reply-To: <CAD=HUj4+20vtQTKiE69vWV1QVhx1o0uzRqvM+PMGn_=KGpfjHg@mail.gmail.com>
References: <20230704075054.3344915-1-stevensd@google.com>
	<20230704075054.3344915-3-stevensd@google.com>
	<20230705114732.000005c6.zhi.wang.linux@gmail.com>
	<CAD=HUj4+20vtQTKiE69vWV1QVhx1o0uzRqvM+PMGn_=KGpfjHg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 5 Jul 2023 18:08:17 +0900
David Stevens <stevensd@chromium.org> wrote:

> On Wed, Jul 5, 2023 at 5:47___PM Zhi Wang <zhi.wang.linux@gmail.com> wrote:
> >
> > On Tue,  4 Jul 2023 16:50:47 +0900
> > David Stevens <stevensd@chromium.org> wrote:
> >  
> > > From: David Stevens <stevensd@chromium.org>
> > >
> > > Introduce __kvm_follow_pfn, which will replace __gfn_to_pfn_memslot.
> > > __kvm_follow_pfn refactors the old API's arguments into a struct and,
> > > where possible, combines the boolean arguments into a single flags
> > > argument.
> > >
> > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > > ---
> > >  include/linux/kvm_host.h |  16 ++++
> > >  virt/kvm/kvm_main.c      | 171 ++++++++++++++++++++++-----------------
> > >  virt/kvm/kvm_mm.h        |   3 +-
> > >  virt/kvm/pfncache.c      |   8 +-
> > >  4 files changed, 122 insertions(+), 76 deletions(-)
> > >
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index 9d3ac7720da9..ef2763c2b12e 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -97,6 +97,7 @@
> > >  #define KVM_PFN_ERR_HWPOISON (KVM_PFN_ERR_MASK + 1)
> > >  #define KVM_PFN_ERR_RO_FAULT (KVM_PFN_ERR_MASK + 2)
> > >  #define KVM_PFN_ERR_SIGPENDING       (KVM_PFN_ERR_MASK + 3)
> > > +#define KVM_PFN_ERR_NEEDS_IO (KVM_PFN_ERR_MASK + 4)
> > >
> > >  /*
> > >   * error pfns indicate that the gfn is in slot but faild to
> > > @@ -1156,6 +1157,21 @@ unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
> > >  void kvm_release_page_clean(struct page *page);
> > >  void kvm_release_page_dirty(struct page *page);
> > >
> > > +struct kvm_follow_pfn {
> > > +     const struct kvm_memory_slot *slot;
> > > +     gfn_t gfn;
> > > +     unsigned int flags;
> > > +     bool atomic;
> > > +     /* Allow a read fault to create a writeable mapping. */
> > > +     bool allow_write_mapping;
> > > +
> > > +     /* Outputs of __kvm_follow_pfn */
> > > +     hva_t hva;
> > > +     bool writable;
> > > +};
> > > +
> > > +kvm_pfn_t __kvm_follow_pfn(struct kvm_follow_pfn *foll);
> > > +
> > >  kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
> > >  kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
> > >                     bool *writable);
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index 371bd783ff2b..b13f22861d2f 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -2486,24 +2486,22 @@ static inline int check_user_page_hwpoison(unsigned long addr)
> > >   * true indicates success, otherwise false is returned.  It's also the
> > >   * only part that runs if we can in atomic context.
> > >   */
> > > -static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
> > > -                         bool *writable, kvm_pfn_t *pfn)
> > > +static bool hva_to_pfn_fast(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
> > >  {
> > >       struct page *page[1];
> > > +     bool write_fault = foll->flags & FOLL_WRITE;
> > >
> > >       /*
> > >        * Fast pin a writable pfn only if it is a write fault request
> > >        * or the caller allows to map a writable pfn for a read fault
> > >        * request.
> > >        */
> > > -     if (!(write_fault || writable))
> > > +     if (!(write_fault || foll->allow_write_mapping))
> > >               return false;
> > >
> > > -     if (get_user_page_fast_only(addr, FOLL_WRITE, page)) {
> > > +     if (get_user_page_fast_only(foll->hva, FOLL_WRITE, page)) {
> > >               *pfn = page_to_pfn(page[0]);
> > > -
> > > -             if (writable)
> > > -                     *writable = true;
> > > +             foll->writable = foll->allow_write_mapping;
> > >               return true;
> > >       }
> > >
> > > @@ -2514,35 +2512,26 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
> > >   * The slow path to get the pfn of the specified host virtual address,
> > >   * 1 indicates success, -errno is returned if error is detected.
> > >   */
> > > -static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
> > > -                        bool interruptible, bool *writable, kvm_pfn_t *pfn)
> > > +static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
> > >  {
> > > -     unsigned int flags = FOLL_HWPOISON;
> > > +     unsigned int flags = FOLL_HWPOISON | FOLL_GET | foll->flags;
> > >       struct page *page;
> > >       int npages;
> > >
> > >       might_sleep();
> > >
> > > -     if (writable)
> > > -             *writable = write_fault;
> > > -
> > > -     if (write_fault)
> > > -             flags |= FOLL_WRITE;
> > > -     if (async)
> > > -             flags |= FOLL_NOWAIT;
> > > -     if (interruptible)
> > > -             flags |= FOLL_INTERRUPTIBLE;
> > > -
> > > -     npages = get_user_pages_unlocked(addr, 1, &page, flags);
> > > +     npages = get_user_pages_unlocked(foll->hva, 1, &page, flags);
> > >       if (npages != 1)
> > >               return npages;
> > >
> > > +     foll->writable = (foll->flags & FOLL_WRITE) && foll->allow_write_mapping;
> > > +
> > >       /* map read fault as writable if possible */
> > > -     if (unlikely(!write_fault) && writable) {
> > > +     if (unlikely(!foll->writable) && foll->allow_write_mapping) {
> > >               struct page *wpage;
> > >
> > > -             if (get_user_page_fast_only(addr, FOLL_WRITE, &wpage)) {
> > > -                     *writable = true;
> > > +             if (get_user_page_fast_only(foll->hva, FOLL_WRITE, &wpage)) {
> > > +                     foll->writable = true;
> > >                       put_page(page);
> > >                       page = wpage;
> > >               }
> > > @@ -2572,23 +2561,23 @@ static int kvm_try_get_pfn(kvm_pfn_t pfn)
> > >       return get_page_unless_zero(page);
> > >  }
> > >
> > > -static int hva_to_pfn_remapped(struct vm_area_struct *vma,
> > > -                            unsigned long addr, bool write_fault,
> > > -                            bool *writable, kvm_pfn_t *p_pfn)
> > > +static int hva_to_pfn_remapped(struct vm_area_struct *vma, struct kvm_follow_pfn *foll,
> > > +                            kvm_pfn_t *p_pfn)
> > >  {
> > >       kvm_pfn_t pfn;
> > >       pte_t *ptep;
> > >       spinlock_t *ptl;
> > > +     bool write_fault = foll->flags & FOLL_WRITE;
> > >       int r;
> > >
> > > -     r = follow_pte(vma->vm_mm, addr, &ptep, &ptl);
> > > +     r = follow_pte(vma->vm_mm, foll->hva, &ptep, &ptl);
> > >       if (r) {
> > >               /*
> > >                * get_user_pages fails for VM_IO and VM_PFNMAP vmas and does
> > >                * not call the fault handler, so do it here.
> > >                */
> > >               bool unlocked = false;
> > > -             r = fixup_user_fault(current->mm, addr,
> > > +             r = fixup_user_fault(current->mm, foll->hva,
> > >                                    (write_fault ? FAULT_FLAG_WRITE : 0),
> > >                                    &unlocked);
> > >               if (unlocked)
> > > @@ -2596,7 +2585,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
> > >               if (r)
> > >                       return r;
> > >
> > > -             r = follow_pte(vma->vm_mm, addr, &ptep, &ptl);
> > > +             r = follow_pte(vma->vm_mm, foll->hva, &ptep, &ptl);
> > >               if (r)
> > >                       return r;
> > >       }
> > > @@ -2606,8 +2595,7 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
> > >               goto out;
> > >       }
> > >
> > > -     if (writable)
> > > -             *writable = pte_write(*ptep);
> > > +     foll->writable = pte_write(*ptep) && foll->allow_write_mapping;
> > >       pfn = pte_pfn(*ptep);
> > >
> > >       /*
> > > @@ -2652,24 +2640,22 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
> > >   * 2): @write_fault = false && @writable, @writable will tell the caller
> > >   *     whether the mapping is writable.
> > >   */
> > > -kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool interruptible,
> > > -                  bool *async, bool write_fault, bool *writable)
> > > +kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *foll)
> > >  {
> > >       struct vm_area_struct *vma;
> > >       kvm_pfn_t pfn;
> > >       int npages, r;
> > >
> > >       /* we can do it either atomically or asynchronously, not both */
> > > -     BUG_ON(atomic && async);
> > > +     BUG_ON(foll->atomic && (foll->flags & FOLL_NOWAIT));
> > >
> > > -     if (hva_to_pfn_fast(addr, write_fault, writable, &pfn))
> > > +     if (hva_to_pfn_fast(foll, &pfn))
> > >               return pfn;
> > >
> > > -     if (atomic)
> > > +     if (foll->atomic)
> > >               return KVM_PFN_ERR_FAULT;
> > >
> > > -     npages = hva_to_pfn_slow(addr, async, write_fault, interruptible,
> > > -                              writable, &pfn);
> > > +     npages = hva_to_pfn_slow(foll, &pfn);
> > >       if (npages == 1)
> > >               return pfn;
> > >       if (npages == -EINTR)
> > > @@ -2677,83 +2663,122 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool atomic, bool interruptible,
> > >
> > >       mmap_read_lock(current->mm);
> > >       if (npages == -EHWPOISON ||
> > > -           (!async && check_user_page_hwpoison(addr))) {
> > > +           (!(foll->flags & FOLL_NOWAIT) && check_user_page_hwpoison(foll->hva))) {
> > >               pfn = KVM_PFN_ERR_HWPOISON;
> > >               goto exit;
> > >       }
> > >
> > >  retry:
> > > -     vma = vma_lookup(current->mm, addr);
> > > +     vma = vma_lookup(current->mm, foll->hva);
> > >
> > >       if (vma == NULL)
> > >               pfn = KVM_PFN_ERR_FAULT;
> > >       else if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
> > > -             r = hva_to_pfn_remapped(vma, addr, write_fault, writable, &pfn);
> > > +             r = hva_to_pfn_remapped(vma, foll, &pfn);
> > >               if (r == -EAGAIN)
> > >                       goto retry;
> > >               if (r < 0)
> > >                       pfn = KVM_PFN_ERR_FAULT;
> > >       } else {
> > > -             if (async && vma_is_valid(vma, write_fault))
> > > -                     *async = true;
> > > -             pfn = KVM_PFN_ERR_FAULT;
> > > +             if ((foll->flags & FOLL_NOWAIT) &&
> > > +                 vma_is_valid(vma, foll->flags & FOLL_WRITE))
> > > +                     pfn = KVM_PFN_ERR_NEEDS_IO;
> > > +             else
> > > +                     pfn = KVM_PFN_ERR_FAULT;
> > >       }
> > >  exit:
> > >       mmap_read_unlock(current->mm);
> > >       return pfn;
> > >  }
> > >
> > > -kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
> > > -                            bool atomic, bool interruptible, bool *async,
> > > -                            bool write_fault, bool *writable, hva_t *hva)
> > > +kvm_pfn_t __kvm_follow_pfn(struct kvm_follow_pfn *foll)
> > >  {
> > > -     unsigned long addr = __gfn_to_hva_many(slot, gfn, NULL, write_fault);
> > > -
> > > -     if (hva)
> > > -             *hva = addr;
> > > +     foll->hva = __gfn_to_hva_many(foll->slot, foll->gfn, NULL,
> > > +                                   foll->flags & FOLL_WRITE);
> > >
> > > -     if (addr == KVM_HVA_ERR_RO_BAD) {
> > > -             if (writable)
> > > -                     *writable = false;
> > > +     if (foll->hva == KVM_HVA_ERR_RO_BAD)
> > >               return KVM_PFN_ERR_RO_FAULT;
> > > -     }
> > >  
> >
> > Can you explain why updating foll->writable = false (previously *writeable
> > = false) is omitted here?
> >
> > In the caller where the struct kvm_follow_pfn is initialized, e.g.
> > __gfn_to_pfn_memslot()/gfn_to_pfn_prot(), .writable is not initialized.
> > IIUC, they expect __kvm_follow_pfn() to update it and return .writable to
> > upper caller.
> >
> > As the one of the output, it would be better to initalize it either in the
> > caller or update it in __kvm_follow_pfn(). Or
> > __gfn_to_pfn_memslot()/gfn_to_pfn_prot() will return random data in the
> > stack to the caller via bool *writable. It doesn't sound nice.  
> 
> Entries omitted from an initializer are initialized to zero, so
> .writable does get initialized in all of the patches in this series
> via designated initializers. Although you're right that explicitly
> setting it to false is a good idea, in case someday someone adds a
> caller that doesn't use an initializer when declaring its
> kvm_follow_pfn.
>

Nice trick and nice to know that. :) Agreed on improving readability and
preventing a risk from the caller. 

> -David

