Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB008193CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 23:46:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BTawc9n6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvsJ81zY2z3cHP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 09:46:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BTawc9n6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=jthoughton@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Svhww66c5z2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 03:29:36 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d3e4637853so81275ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 08:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703003371; x=1703608171; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mixo7iUxV6o/jYjn2ndFmri3aSLyepPelmkXRCU4Bdk=;
        b=BTawc9n6qfKCCidTXt96af02iG45l8QZPcynN40PutXEyLyZ0g0GmQj8/1eOAQLp1z
         ZehO6HSWQWNVY/t/uCGl1D5rhAIBJRruCdXEOQF7a/OIG6YGLKAjcFLfEFLUCQ6tTpIR
         BdeHwVK2ipyl7znv/+iurju9X7lSy+6ZA3cR89WJNHa69mNvMChanmCX2LDx7K87gBoh
         o52XptWUPBADtadaC0fwAMhj5M+f5l+jeTBqQwnaK52ajhV1uoYanVL2i/gtC1fwWMa8
         VbFntDYpbUpmMys1VIq7e1sSnA12w1aVhOI38YjBculr9TX39OEPDz1iLe6BD/h0pGy5
         LPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703003371; x=1703608171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mixo7iUxV6o/jYjn2ndFmri3aSLyepPelmkXRCU4Bdk=;
        b=rwdvnxOiS9CDxflBZSSL1cNfxvZzo/VKQitBguWnlxS48K7d8DBH42EOntuOju3qPX
         w4O2wAEtog+dZXsL5bp/NHPnx9FaEwnlNXCjH/qD6TNNiPxUDCIazZJ6dsd1K3fo/2Ys
         nFzrCmMRlXy0EpKKOr3G1LbKWI9iHNqLXrvFgnF9kF36RZk5VRfaXkUXqQHh64loYBLE
         COmcxNa4tsh1556xNmfUA/dVGBvOiEXpP9IEcDHPfmozOuRtUjSK4PhEPGd/ZTl5XG5C
         Fe5WLoqubWnEWCfxDL3woraecVNuln8tyFQHLESYEjvBdZMe4c3hmaMqPuPWarNAA4dX
         Io2Q==
X-Gm-Message-State: AOJu0YzHleRHNVU9qJ9mWsO1IVthMfW4ULBvbz4H7LRfevk/zmwKXryk
	RZr5+YLIRojsQVdfxsnFt4Z7Q42TJ/3GidNlRoqNjR8nzHUN
X-Google-Smtp-Source: AGHT+IHsUCKcb2E2CdUkTme7eOaB4IQH5pN/t3v8iJPHV1wyflbtqaQHKC/n6HfeqRwG5WgkpoxHQLlIZyM4Gm88XNg=
X-Received: by 2002:a17:902:e5cc:b0:1d3:7db1:388b with SMTP id
 u12-20020a170902e5cc00b001d37db1388bmr204446plf.11.1703003371391; Tue, 19 Dec
 2023 08:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20231219075538.414708-1-peterx@redhat.com> <20231219075538.414708-10-peterx@redhat.com>
In-Reply-To: <20231219075538.414708-10-peterx@redhat.com>
From: James Houghton <jthoughton@google.com>
Date: Tue, 19 Dec 2023 11:28:54 -0500
Message-ID: <CADrL8HVu8=-DdAwXN_pO91g1A1+F7bKfBRpm6jYfYMk1QZcRFA@mail.gmail.com>
Subject: Re: [PATCH 09/13] mm/gup: Cache *pudp in follow_pud_mask()
To: peterx@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 20 Dec 2023 09:46:05 +1100
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

On Tue, Dec 19, 2023 at 2:57=E2=80=AFAM <peterx@redhat.com> wrote:
>
> From: Peter Xu <peterx@redhat.com>
>
> Introduce "pud_t pud" in the function, so the code won't dereference *pud=
p
> multiple time.  Not only because that looks less straightforward, but als=
o
> because if the dereference really happened, it's not clear whether there
> can be race to see different *pudp values if it's being modified at the
> same time.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  mm/gup.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index 6c0d82fa8cc7..97e87b7a15c3 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -753,26 +753,27 @@ static struct page *follow_pud_mask(struct vm_area_=
struct *vma,
>                                     unsigned int flags,
>                                     struct follow_page_context *ctx)
>  {
> -       pud_t *pud;
> +       pud_t *pudp, pud;
>         spinlock_t *ptl;
>         struct page *page;
>         struct mm_struct *mm =3D vma->vm_mm;
>
> -       pud =3D pud_offset(p4dp, address);
> -       if (pud_none(*pud))
> +       pudp =3D pud_offset(p4dp, address);
> +       pud =3D *pudp;

I think you might want a READ_ONCE() on this so that the compiler
doesn't actually read the pud multiple times.

> +       if (pud_none(pud))
>                 return no_page_table(vma, flags, address);
> -       if (pud_devmap(*pud)) {
> -               ptl =3D pud_lock(mm, pud);
> -               page =3D follow_devmap_pud(vma, address, pud, flags, &ctx=
->pgmap);
> +       if (pud_devmap(pud)) {
> +               ptl =3D pud_lock(mm, pudp);
> +               page =3D follow_devmap_pud(vma, address, pudp, flags, &ct=
x->pgmap);
>                 spin_unlock(ptl);
>                 if (page)
>                         return page;
>                 return no_page_table(vma, flags, address);
>         }
> -       if (unlikely(pud_bad(*pud)))
> +       if (unlikely(pud_bad(pud)))
>                 return no_page_table(vma, flags, address);

Not your change, but reading this, it's not clear to me that
`pud_present(*pudp)` (and non-leaf) would necessarily be true at this
point -- like, I would prefer to see `!pud_present(pud)` instead of
`pud_bad()`. Thank you for adding that in the next patch. :)

Feel free to add:

Acked-by: James Houghton <jthoughton@google.com>
