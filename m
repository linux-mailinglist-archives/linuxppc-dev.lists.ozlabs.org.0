Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E737871F89A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 04:51:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXSDx4N5wz3dyj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 12:51:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=CxDFRuGf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=CxDFRuGf;
	dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXSD251rKz3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 12:50:25 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-565bdae581eso16907667b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 19:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685674220; x=1688266220;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CkFBZ6Z26PEaI+Jgv/5bWGu+0hTm1SzRb6kODNNBn+M=;
        b=CxDFRuGfcYOWRd6VMHq3ar2M1xRSdWVVRTOsF6xQ0mdly8R3+o2A6R0v/aETwVkb3P
         6b58l7Ni9XRQdArFtwuFCZ5arCMLCFw+LE0g4/MaXwrjvut1vrEBPVcT+W6pSsdHU+oi
         fjJ5UIEWmivzq31pCg6nsnlxQ0kE76d7AibcK5E6hVfvFaaxgiawOUnXccTx0uAP3pHm
         Idl5hOTvyvy2EPX+52qQ1cF3H5O7fhiSRn3bhB/j26+Hz+Q41PkPVp08UWJRUageIgFV
         GSVHYv6GOPwAxU0jH5OD/WRtBlcd1wSFGZtdCmsng+zRGOD1mVzbdt39IXv/0dJztfSK
         LnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685674220; x=1688266220;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CkFBZ6Z26PEaI+Jgv/5bWGu+0hTm1SzRb6kODNNBn+M=;
        b=Bo2IMMW5E2J/adSw30Re2BKogpZz+MaCdbHpgXFvEaIfNSQOv81Jj757ynBebJNKuR
         E+szFIKTXfBBkhn2DhcYKf8qdiuXwgM4fjOFDukc0Me4h/pWTODLfgIDEqGrtUwleU9e
         l1BHPn6FlgI1aPCNaWFVPcwRrDMJ0a/26XrKBztnMBUZP13MXDL2u7jhbm4znMshqR/Z
         FUZY1lPdg8l1+Csi1RMzHGrhuHHrMGkHypGELKYp0qvEg6Eq9Sw7C09W1zih3VLdBfzf
         A9Mt0e7K2AydO+JJNhwAW7Tx80aqsDQRDVDP82oX24cTZ7shEShFa+ZvZ/E2BH8TIXcw
         EXqg==
X-Gm-Message-State: AC+VfDw75JFZYjostgYq0S39oOkPXk909PiBqfms6iz1RyMhQVQZPhlL
	X5GLoWAbgDqh9UKvENCSohpA9g==
X-Google-Smtp-Source: ACHHUZ6dtqdDIUgghSG7BNv1ykA9dzLFfcixbLHtolx08NZCshtI3n5qAtyBLAY0i0F+pIWOM2tKpQ==
X-Received: by 2002:a81:5247:0:b0:565:d40b:f695 with SMTP id g68-20020a815247000000b00565d40bf695mr10827576ywb.48.1685674220390;
        Thu, 01 Jun 2023 19:50:20 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id u5-20020a0deb05000000b0055a07585a91sm72029ywe.11.2023.06.01.19.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:50:19 -0700 (PDT)
Date: Thu, 1 Jun 2023 19:50:15 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 01/12] mm/pgtable: add rcu_read_lock() and
 rcu_read_unlock()s
In-Reply-To: <CAG48ez0tnYTVjr7zw3Vp4GTcQ=960EodatjqE5bM9a3EVYM16Q@mail.gmail.com>
Message-ID: <de1e37c-354c-fb98-1598-7ce6d415f257@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <88c445ae-552-5243-31a4-2674bac62d4d@google.com> <CAG48ez0tnYTVjr7zw3Vp4GTcQ=960EodatjqE5bM9a3EVYM16Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463760895-2117762585-1685674219=:27216"
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@solee
 n.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463760895-2117762585-1685674219=:27216
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 31 May 2023, Jann Horn wrote:
> On Mon, May 29, 2023 at 8:15=E2=80=AFAM Hugh Dickins <hughd@google.com> w=
rote:
> > Before putting them to use (several commits later), add rcu_read_lock()
> > to pte_offset_map(), and rcu_read_unlock() to pte_unmap().  Make this a
> > separate commit, since it risks exposing imbalances: prior commits have
> > fixed all the known imbalances, but we may find some have been missed.
> [...]
> > diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> > index c7ab18a5fb77..674671835631 100644
> > --- a/mm/pgtable-generic.c
> > +++ b/mm/pgtable-generic.c
> > @@ -236,7 +236,7 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long a=
ddr, pmd_t *pmdvalp)
> >  {
> >         pmd_t pmdval;
> >
> > -       /* rcu_read_lock() to be added later */
> > +       rcu_read_lock();
> >         pmdval =3D pmdp_get_lockless(pmd);
> >         if (pmdvalp)
> >                 *pmdvalp =3D pmdval;
>=20
> It might be a good idea to document that this series assumes that the
> first argument to __pte_offset_map() is a pointer into a second-level
> page table (and not a local copy of the entry) unless the containing
> VMA is known to not be THP-eligible or the page table is detached from
> the page table hierarchy or something like that. Currently a bunch of
> places pass references to local copies of the entry, and while I think
> all of these are fine, it would probably be good to at least document
> why these are allowed to do it while other places aren't.

Thanks Jann: but I have to guess that here you are showing awareness of
an important issue that I'm simply ignorant of.

I have been haunted by a dim recollection that there is one architecture
(arm-32?) which is fussy about the placement of the pmdval being examined
(deduces info missing from the arch-independent interface, by following
up the address?), but I couldn't track it down when I tried.

Please tell me more; or better, don't spend your time explaining to me,
but please just send a link to a good reference on the issue.  I'll be
unable to document what you ask there, without educating myself first.

Thanks,
Hugh

>=20
> $ vgrep 'pte_offset_map(&'
> Index File                  Line Content
>     0 arch/sparc/mm/tlb.c    151 pte =3D pte_offset_map(&pmd, vaddr);
>     1 kernel/events/core.c  7501 ptep =3D pte_offset_map(&pmd, addr);
>     2 mm/gup.c              2460 ptem =3D ptep =3D pte_offset_map(&pmd, a=
ddr);
>     3 mm/huge_memory.c      2057 pte =3D pte_offset_map(&_pmd, haddr);
>     4 mm/huge_memory.c      2214 pte =3D pte_offset_map(&_pmd, haddr);
>     5 mm/page_table_check.c  240 pte_t *ptep =3D pte_offset_map(&pmd, add=
r);
---1463760895-2117762585-1685674219=:27216--
