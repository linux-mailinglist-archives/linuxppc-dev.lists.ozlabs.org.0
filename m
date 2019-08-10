Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3266088781
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 03:27:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4654GK0TjCzDrQ7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 11:27:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=hslester96@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rnqIjeWa"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4654DZ4Q76zDrDy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 11:25:34 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id h8so8798051edv.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 18:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NDyGTNUlAIJSsd2gHGS97/3RJOYDdm2ReyWWRSQNAzg=;
 b=rnqIjeWamgRoNEkmSdp39pB4BHD1ZMt45SlShR8HNFjMDhN+EjIZH1x028jBcpwUZ6
 nLlNFlMHMSmS09IR7hdl4AwWuxn2f9bznUcheJibNXsHTnIPa5U1ZnYDe5ZhsHaG2g0/
 QrjOwGHUGFrU7n5Ql8hjNRdhxosQw6mXCZTobGXWy3uL8PEvoeTagZpF/z7265RjkQY8
 +48uZNT0js6SJ6a9DZ+P03EMdxBDq8PghuHSRJ5m1wG3LFSWCf2qnGw8KR5lMA+swFeh
 Mg8qAgV32mMdpMrXPhIzqOKGMvQT9EFULGegNcmGFzuCKNkEfuinPRrZr2vIfo80Gssz
 l8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NDyGTNUlAIJSsd2gHGS97/3RJOYDdm2ReyWWRSQNAzg=;
 b=EDqBM/cCS2Ovj3K62MRzVoOPnXru5GD6keInJ/DQupiGv7nwfDwJNZDvY5i3Yq/9oL
 nkl5/TnLDHhMzRXMQx5lISFLpGiHrTGmlkRkYVPjVsRyzV1gg5Z/dENVELoPkkQHDVW0
 w5rD7rTy83TAfx+h6MoDRHSl7Fhsk4xZM8/L3yrn2R9wn3DWcSe3T/sK88xsfdWdA3Z1
 f9WwEXO/mJvWI37TP5wiKXsVXRbSBHdZ0VjkOpYBG6SOlejODhbaAkI9I6N4CrDRKyxk
 mXQwfYL8YZL5xmTmNSDfZcHvOIMwP5CLHo7xJYG07fieDP6sP4DVLK8sPa5PjgB5erYJ
 2gjw==
X-Gm-Message-State: APjAAAWXjFhjssWBhgfKcPtQGKKNY/GcL30JSxCgzJ2Uj/iKQ8JtpBic
 1w0z/b5ZwgfcYrxDidhGAAYUf+9eqVYad6ydXAA=
X-Google-Smtp-Source: APXvYqzWyFYDx6zcjLqAejhETmd/jBdE6rJma6bcs3NyI8MGZ5uR1f65UlvFOn7nFq6uMf2yTdb4UOQup4s6tdjBgOU=
X-Received: by 2002:aa7:cf8e:: with SMTP id z14mr25154937edx.40.1565400330482; 
 Fri, 09 Aug 2019 18:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190808071808.6531-1-hslester96@gmail.com>
 <87y302segw.fsf@concordia.ellerman.id.au>
In-Reply-To: <87y302segw.fsf@concordia.ellerman.id.au>
From: Chuhong Yuan <hslester96@gmail.com>
Date: Sat, 10 Aug 2019 09:25:19 +0800
Message-ID: <CANhBUQ3VpwxyMpQ29kphcowgmpPPTBLtBV19tBGVX82uUs=Wmw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/mm: Use refcount_t for refcount
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 9, 2019 at 8:36 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Chuhong Yuan <hslester96@gmail.com> writes:
> > Reference counters are preferred to use refcount_t instead of
> > atomic_t.
> > This is because the implementation of refcount_t can prevent
> > overflows and detect possible use-after-free.
> > So convert atomic_t ref counters to refcount_t.
> >
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
>
> Thanks.
>
> We don't have a fast implementation of refcount_t, so I'm worried this
> could cause a measurable performance regression.
>
> Did you benchmark it at all?
>

I did not benchmark it and I don't have the testing environment...

> cheers
>
> > diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
> > index 2d0cb5ba9a47..f836fd5a6abc 100644
> > --- a/arch/powerpc/mm/book3s64/mmu_context.c
> > +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> > @@ -231,7 +231,7 @@ static void pmd_frag_destroy(void *pmd_frag)
> >       /* drop all the pending references */
> >       count = ((unsigned long)pmd_frag & ~PAGE_MASK) >> PMD_FRAG_SIZE_SHIFT;
> >       /* We allow PTE_FRAG_NR fragments from a PTE page */
> > -     if (atomic_sub_and_test(PMD_FRAG_NR - count, &page->pt_frag_refcount)) {
> > +     if (refcount_sub_and_test(PMD_FRAG_NR - count, &page->pt_frag_refcount)) {
> >               pgtable_pmd_page_dtor(page);
> >               __free_page(page);
> >       }
> > diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> > index 7d0e0d0d22c4..40056896ce4e 100644
> > --- a/arch/powerpc/mm/book3s64/pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/pgtable.c
> > @@ -277,7 +277,7 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
> >               return NULL;
> >       }
> >
> > -     atomic_set(&page->pt_frag_refcount, 1);
> > +     refcount_set(&page->pt_frag_refcount, 1);
> >
> >       ret = page_address(page);
> >       /*
> > @@ -294,7 +294,7 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
> >        * count.
> >        */
> >       if (likely(!mm->context.pmd_frag)) {
> > -             atomic_set(&page->pt_frag_refcount, PMD_FRAG_NR);
> > +             refcount_set(&page->pt_frag_refcount, PMD_FRAG_NR);
> >               mm->context.pmd_frag = ret + PMD_FRAG_SIZE;
> >       }
> >       spin_unlock(&mm->page_table_lock);
> > @@ -317,8 +317,7 @@ void pmd_fragment_free(unsigned long *pmd)
> >  {
> >       struct page *page = virt_to_page(pmd);
> >
> > -     BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
> > -     if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> > +     if (refcount_dec_and_test(&page->pt_frag_refcount)) {
> >               pgtable_pmd_page_dtor(page);
> >               __free_page(page);
> >       }
> > diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
> > index a7b05214760c..4ef8231b677f 100644
> > --- a/arch/powerpc/mm/pgtable-frag.c
> > +++ b/arch/powerpc/mm/pgtable-frag.c
> > @@ -24,7 +24,7 @@ void pte_frag_destroy(void *pte_frag)
> >       /* drop all the pending references */
> >       count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
> >       /* We allow PTE_FRAG_NR fragments from a PTE page */
> > -     if (atomic_sub_and_test(PTE_FRAG_NR - count, &page->pt_frag_refcount)) {
> > +     if (refcount_sub_and_test(PTE_FRAG_NR - count, &page->pt_frag_refcount)) {
> >               pgtable_page_dtor(page);
> >               __free_page(page);
> >       }
> > @@ -71,7 +71,7 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
> >                       return NULL;
> >       }
> >
> > -     atomic_set(&page->pt_frag_refcount, 1);
> > +     refcount_set(&page->pt_frag_refcount, 1);
> >
> >       ret = page_address(page);
> >       /*
> > @@ -87,7 +87,7 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
> >        * count.
> >        */
> >       if (likely(!pte_frag_get(&mm->context))) {
> > -             atomic_set(&page->pt_frag_refcount, PTE_FRAG_NR);
> > +             refcount_set(&page->pt_frag_refcount, PTE_FRAG_NR);
> >               pte_frag_set(&mm->context, ret + PTE_FRAG_SIZE);
> >       }
> >       spin_unlock(&mm->page_table_lock);
> > @@ -110,8 +110,7 @@ void pte_fragment_free(unsigned long *table, int kernel)
> >  {
> >       struct page *page = virt_to_page(table);
> >
> > -     BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
> > -     if (atomic_dec_and_test(&page->pt_frag_refcount)) {
> > +     if (refcount_dec_and_test(&page->pt_frag_refcount)) {
> >               if (!kernel)
> >                       pgtable_page_dtor(page);
> >               __free_page(page);
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 3a37a89eb7a7..7fe23a3faf95 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -14,6 +14,7 @@
> >  #include <linux/uprobes.h>
> >  #include <linux/page-flags-layout.h>
> >  #include <linux/workqueue.h>
> > +#include <linux/refcount.h>
> >
> >  #include <asm/mmu.h>
> >
> > @@ -147,7 +148,7 @@ struct page {
> >                       unsigned long _pt_pad_2;        /* mapping */
> >                       union {
> >                               struct mm_struct *pt_mm; /* x86 pgds only */
> > -                             atomic_t pt_frag_refcount; /* powerpc */
> > +                             refcount_t pt_frag_refcount; /* powerpc */
> >                       };
> >  #if ALLOC_SPLIT_PTLOCKS
> >                       spinlock_t *ptl;
> > --
> > 2.20.1
