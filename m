Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1F819676
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 02:44:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=diGvaTyW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=diGvaTyW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvxDw4bn5z30ht
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 12:44:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=diGvaTyW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=diGvaTyW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvxD36mVMz2xcq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 12:43:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703036608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vjm4paNMTWlCFosQbpjmCNgYAmudj3J1TP/uI6GNhCE=;
	b=diGvaTyW6XeuU1GaY0AmpaXnCpqQvj/F25/3wbmtu8O1iQEiX2qDOJ8P37f++ny6GTH8AP
	RxuKl03fDc2v4J27hA9O3nfyP36XtpaJ83vzTh4dF4RaaGdPkTB1D5HRLJ5LMsql28f+zy
	Hgt+WhrNxVWRlHblLX2rij+ylH3ord8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703036608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vjm4paNMTWlCFosQbpjmCNgYAmudj3J1TP/uI6GNhCE=;
	b=diGvaTyW6XeuU1GaY0AmpaXnCpqQvj/F25/3wbmtu8O1iQEiX2qDOJ8P37f++ny6GTH8AP
	RxuKl03fDc2v4J27hA9O3nfyP36XtpaJ83vzTh4dF4RaaGdPkTB1D5HRLJ5LMsql28f+zy
	Hgt+WhrNxVWRlHblLX2rij+ylH3ord8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-7E_1PZZfMCyPULahNTmLvA-1; Tue, 19 Dec 2023 20:43:26 -0500
X-MC-Unique: 7E_1PZZfMCyPULahNTmLvA-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6d2fbfb1d5eso1239036b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 17:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703036605; x=1703641405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vjm4paNMTWlCFosQbpjmCNgYAmudj3J1TP/uI6GNhCE=;
        b=rr2F5KdYhmeg70EY+/J/aeUxnn7vPQEyNbUmH5rqI5mcU7nW9JmXKpnL+aTbfuxShm
         wcp1DiIXMLI6BEzZjYnNmGH6eDRkwGsfgMJjeVvu9ZXJ8Wwy8svtx7RqtFHST6BgOVY2
         rEBH33il7WzwJ5EDQHiuw8Y460MmAkLrBksO7ajMSjlQ4ycweHaPwcuv9CMcoSgNtQ7B
         +ax4d0vAU/JjaD+4ulGJbE+O8MnqWsiptQ6w0ZnTMygm4zuNyH2c/4uhdp4UI/vILRoR
         dsRM/gGfSd0yhvXAyfMDrEk+3NeMWp7LI6uBsE9/hytV5T+z9RhdKpoMhb89hSoAZctg
         vnmg==
X-Gm-Message-State: AOJu0Yyg9HCseMlP8UTgUEg7i30ZLFQ5NfKRLnX4TTojBNdE7Rl9sZrt
	3Gmpc4jmPPYuWdC/LvsVeW1EBVhMKdQNWdzS7LSBuB+CVIhp9osz7KJPsjVCsxS2nmgUMpWHsS9
	5O8fXbEOFBIkgW6/QQb001WK+QA==
X-Received: by 2002:aa7:9315:0:b0:6d9:383b:d91a with SMTP id cz21-20020aa79315000000b006d9383bd91amr3546115pfb.1.1703036605349;
        Tue, 19 Dec 2023 17:43:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjZoAHkiq7HghdaqdRhR063HFqKc6lsGbuFn9XpaDzkEyDZOV38MaudRUa/eRKBEBtF5qDgg==
X-Received: by 2002:aa7:9315:0:b0:6d9:383b:d91a with SMTP id cz21-20020aa79315000000b006d9383bd91amr3546076pfb.1.1703036604916;
        Tue, 19 Dec 2023 17:43:24 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id fe16-20020a056a002f1000b006d3dd365a76sm6585222pfb.2.2023.12.19.17.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 17:43:24 -0800 (PST)
Date: Wed, 20 Dec 2023 09:43:13 +0800
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Subject: Re: [PATCH 09/13] mm/gup: Cache *pudp in follow_pud_mask()
Message-ID: <ZYJGsUWpmF1P1Nd0@x1n>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-10-peterx@redhat.com>
 <CADrL8HVu8=-DdAwXN_pO91g1A1+F7bKfBRpm6jYfYMk1QZcRFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrL8HVu8=-DdAwXN_pO91g1A1+F7bKfBRpm6jYfYMk1QZcRFA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 19, 2023 at 11:28:54AM -0500, James Houghton wrote:
> On Tue, Dec 19, 2023 at 2:57 AM <peterx@redhat.com> wrote:
> >
> > From: Peter Xu <peterx@redhat.com>
> >
> > Introduce "pud_t pud" in the function, so the code won't dereference *pudp
> > multiple time.  Not only because that looks less straightforward, but also
> > because if the dereference really happened, it's not clear whether there
> > can be race to see different *pudp values if it's being modified at the
> > same time.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  mm/gup.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 6c0d82fa8cc7..97e87b7a15c3 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -753,26 +753,27 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
> >                                     unsigned int flags,
> >                                     struct follow_page_context *ctx)
> >  {
> > -       pud_t *pud;
> > +       pud_t *pudp, pud;
> >         spinlock_t *ptl;
> >         struct page *page;
> >         struct mm_struct *mm = vma->vm_mm;
> >
> > -       pud = pud_offset(p4dp, address);
> > -       if (pud_none(*pud))
> > +       pudp = pud_offset(p4dp, address);
> > +       pud = *pudp;
> 
> I think you might want a READ_ONCE() on this so that the compiler
> doesn't actually read the pud multiple times.

Makes sense.  I probably only did the "split" part which Christoph
requested, without thinking futher than that. :)

> 
> > +       if (pud_none(pud))
> >                 return no_page_table(vma, flags, address);
> > -       if (pud_devmap(*pud)) {
> > -               ptl = pud_lock(mm, pud);
> > -               page = follow_devmap_pud(vma, address, pud, flags, &ctx->pgmap);
> > +       if (pud_devmap(pud)) {
> > +               ptl = pud_lock(mm, pudp);
> > +               page = follow_devmap_pud(vma, address, pudp, flags, &ctx->pgmap);
> >                 spin_unlock(ptl);
> >                 if (page)
> >                         return page;
> >                 return no_page_table(vma, flags, address);
> >         }
> > -       if (unlikely(pud_bad(*pud)))
> > +       if (unlikely(pud_bad(pud)))
> >                 return no_page_table(vma, flags, address);
> 
> Not your change, but reading this, it's not clear to me that
> `pud_present(*pudp)` (and non-leaf) would necessarily be true at this
> point -- like, I would prefer to see `!pud_present(pud)` instead of
> `pud_bad()`. Thank you for adding that in the next patch. :)

I think the assumption here is it is expected to be a directory entry when
reaching here, and for a valid directory entry pud_present() should always
return true (a side note: pud_present() may not mean "PRESENT bit set", see
m68k's implementation for example).

Yeah I added that in the next patch, my intention was to check
!pud_present() for all cases without the need to take pgtable lock, though.

> 
> Feel free to add:
> 
> Acked-by: James Houghton <jthoughton@google.com>

Thanks,

-- 
Peter Xu

