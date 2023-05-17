Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EDB70748D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 23:51:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QM6J10lLSz3fDs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 07:51:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=PPBehuov;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=PPBehuov;
	dkim-atps=neutral
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QM6H74FcBz3cJg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 07:50:42 +1000 (AEST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-561d5b34e10so10333367b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 14:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684360239; x=1686952239;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CYrqZZXifWUb49UwqN4ktjCYYTpIiyxjiceM91X1owo=;
        b=PPBehuovPkLBa6/NGbQAXn/eE0OjqEyROrqLX97nN6jBSNnfJoc5x6zVzWooSZlBuR
         ygh7zMisKFOdApdpWLXdE38Ez48wbdl6bRgelI1M2q7oF1fjbdo+FT/cryTh0RkA2PgM
         PVNv73NfYOacgZraULasH6MPisPmrZxBB5SdyINIUR+rCWC/xGGFoY/3V4eCh48ezelN
         vlspmk4A/B3orH5IwCfSCJfMbueYznmKfST0fzCY2VeJqOWgXVBfHyrQGp7gwU4xxk/e
         4DAXLkf7AssRwZV1LOldxmp7mNGGXTey4IiHanP7lOcu21DjwGEEnizw4Nh4dLrJMR0W
         24RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684360239; x=1686952239;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYrqZZXifWUb49UwqN4ktjCYYTpIiyxjiceM91X1owo=;
        b=AAhQuqthzcjOR8u1t4J9BPVbBdk1viKmUM3GZ+coNoYi0g7oxwr+TYAX+10ItDXwqz
         Syx3toGwd7NaVtz9Ez7Jw1sZRWaw+Sxaf5HCpNN7E7/YE01q0U3k2JpqsqovenrxdxSV
         EU86Gs1Rwd6XTcLKGU6Ri7t8dHQZk/Y1T+aFg1zOi/NdnxEBYEk7KBcczp3eYIxFeprg
         HMbsRpSfq1bov9+YvminmjC51WMA09KB2rYS3ehITNrq1VvNp7zNTnoTCoFcl0Ny0ie+
         bY5wurKnPqV22f4CmpxUKbuSM9cUnduDGjWws3jaIp98Fy9aDPkxOT6OS/4VJI5V/zEh
         MDNw==
X-Gm-Message-State: AC+VfDxcIBmmVQDBYP8GGf4dmYyW/UEGZGI+ZLnwH42nFun4OaSjgUxj
	L8jHCXk0ykdrlI2RpmWdfk1aoQ==
X-Google-Smtp-Source: ACHHUZ5K1W6BqH54lP1fyWtEUpWwZ0lmy+14bsbtce6I/HyB5LShp2aTZ/lznkrMNM/kuQdbHXvf0A==
X-Received: by 2002:a81:6744:0:b0:55a:af:2486 with SMTP id b65-20020a816744000000b0055a00af2486mr2691032ywc.18.1684360239031;
        Wed, 17 May 2023 14:50:39 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 129-20020a251187000000b00ba6ffc7ef35sm785837ybr.65.2023.05.17.14.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:50:38 -0700 (PDT)
Date: Wed, 17 May 2023 14:50:28 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH 15/23] s390: allow pte_offset_map_lock() to fail
In-Reply-To: <20230517123546.672fb9b0@p-imbrenda>
Message-ID: <4a15dbaa-1614-ce-ce1f-f73959cef895@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <94aec8fe-383f-892-dcbf-d4c14e460a7@google.com> <20230517123546.672fb9b0@p-imbrenda>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.
 eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 May 2023, Claudio Imbrenda wrote:
> On Tue, 9 May 2023 22:01:16 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
> 
> > In rare transient cases, not yet made possible, pte_offset_map() and
> > pte_offset_map_lock() may not find a page table: handle appropriately.
> > 
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> >  arch/s390/kernel/uv.c  |  2 ++
> >  arch/s390/mm/gmap.c    |  2 ++
> >  arch/s390/mm/pgtable.c | 12 +++++++++---
> >  3 files changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/s390/kernel/uv.c b/arch/s390/kernel/uv.c
> > index cb2ee06df286..3c62d1b218b1 100644
> > --- a/arch/s390/kernel/uv.c
> > +++ b/arch/s390/kernel/uv.c
> > @@ -294,6 +294,8 @@ int gmap_make_secure(struct gmap *gmap, unsigned long gaddr, void *uvcb)
> >  
> >  	rc = -ENXIO;
> >  	ptep = get_locked_pte(gmap->mm, uaddr, &ptelock);
> > +	if (!ptep)
> > +		goto out;

You may or may not be asking about this instance too.  When I looked at
how the code lower down handles -ENXIO (promoting it to -EFAULT if an
access fails, or to -EAGAIN to ask for a retry), this looked just right
(whereas using -EAGAIN here would be wrong: that expects a "page" which
has not been initialized at this point).

> >  	if (pte_present(*ptep) && !(pte_val(*ptep) & _PAGE_INVALID) && pte_write(*ptep)) {
> >  		page = pte_page(*ptep);
> >  		rc = -EAGAIN;
> > diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
> > index dc90d1eb0d55..d198fc9475a2 100644
> > --- a/arch/s390/mm/gmap.c
> > +++ b/arch/s390/mm/gmap.c
> > @@ -2549,6 +2549,8 @@ static int __zap_zero_pages(pmd_t *pmd, unsigned long start,
> >  		spinlock_t *ptl;
> >  
> >  		ptep = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
> > +		if (!ptep)
> > +			break;
> 
> so if pte_offset_map_lock fails, we abort and skip both the failed
> entry and the rest of the entries?

Yes.

> 
> can pte_offset_map_lock be retried immediately if it fails? (consider
> that we currently don't allow THP with KVM guests)
> 
> Would something like this:
> 
> do {
> 	ptep = pte_offset_map_lock(...);
> 	mb();	/* maybe? */
> } while (!ptep);
> 
> make sense?

No.  But you're absolutely right to be asking: thank you for looking
into it so carefully - and I realize that it's hard at this stage to
judge what's appropriate, when I've not yet even posted the endpoint
of these changes, the patches which make it possible not to find a
page table here.  And I'm intentionally keeping that vague, because
although I shall only introduce a THP case, I do expect it to be built
upon later in reclaiming empty page tables: it would be nice not to
have to change the arch code again when extending further.

My "rare transient cases" phrase may be somewhat misleading: one thing
that's wrong with your tight pte_offset_map_lock() loop above is that
the pmd entry pointing to page table may have been suddenly replaced by
a pmd_none() entry; and there's nothing in your loop above to break out
if that is so.

But if a page table is suddenly removed, that would be because it was
either empty, or replaced by a THP entry, or easily reconstructable on
demand (by that, I probably mean it was only mapping shared file pages,
which can just be refaulted if needed again).

The case you're wary of, is if the page table were removed briefly,
then put back shortly after: and still contains zero pages further down.
That's not something mm does now, nor at the end of my several series,
nor that I imagine us wanting to do in future: but I am struggling to
find a killer argument to persuade you that it could never be done -
most pages in a page table do need rmap tracking, which will BUG if
it's broken, but that argument happens not to apply to the zero page.

(Hmm, there could be somewhere, where we would find it convenient to
remove a page table with intent to do ...something, then validation
of that isolated page table fails, so we just put it back again.)

Is it good enough for me to promise you that we won't do that?

There are several ways in which we could change __zap_zero_pages(),
but I don't see them as actually dealing with the concern at hand.

One change, I've tended to make at the mm end but did not dare
to interfere here: it would seem more sensible to do a single
pte_offset_map_lock() outside the loop, return if that fails,
increment ptep inside the loop, pte_unmap_unlock() after the loop.

But perhaps you have preemption reasons for not wanting that; and
although it would eliminate the oddity of half-processing a page
table, it would not really resolve the problem at hand: because,
what if this page table got removed just before __zap_zero_pages()
tries to take the lock, then got put back just after?

Another change: I see __zap_zero_pages() is driven by walk_page_range(),
and over at the mm end I'm usually setting walk->action to ACTION_AGAIN
in these failure cases; but thought that an unnecessary piece of magic
here, and cannot see how it could actually help.  Your "retry the whole
walk_page_range()" suggestion below would be a heavier equivalent of
that: but neither way gives confidence, if a page table could actually
be removed then reinserted without mmap_write_lock().

I think I want to keep this s390 __zap_zero_pages() issue in mind, it is
important and thank you for raising it; but don't see any change to the
patch as actually needed.

Hugh

> 
> 
> otherwise maybe it's better to return an error and retry the whole
> walk_page_range() in s390_enable_sie() ? it's a slow path anyway.
> 
> >  		if (is_zero_pfn(pte_pfn(*ptep)))
> >  			ptep_xchg_direct(walk->mm, addr, ptep, __pte(_PAGE_INVALID));
> >  		pte_unmap_unlock(ptep, ptl);
> 
> [...]
