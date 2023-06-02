Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D93D971F962
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 06:38:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXVcw40ggz3f03
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 14:38:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=hLiVWg2v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=hLiVWg2v;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXVc54vc7z3cKv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 14:37:56 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bad142be0ebso1723399276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 21:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685680673; x=1688272673;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jJxGCGn41BvabvDFNoHM5AnkkTjflqlE1qMNlE8NrT0=;
        b=hLiVWg2vLRCGga9dPaoBmb31J4RQXoKrnLyjofX4nrluqzG+krMZEBkG963VV3+V4S
         s+8cFe/GC9jT+mttHRcUgLqdAWaNK+4XJfOsKmkfRyxraldoFeK3u0aDrpHHDFy8+geA
         I+BVR4akDprVaJTfkU3zr7Uc//8VHDpcHsKp892pLRDmIDEe7dHVOra7Xn0lK7TCCWon
         b3GYtV2/SVVlBXw+4utgS9GHQrb+vEIMWNAyb6VxBnHIWrXHPzYDBTAmo8nwbHBXjTfw
         wghXDbSao4T2gtOYNqjy91CEhqjmEc3+JG5hRAUqAvMS4wRt8RVjEj6zljJFtyHOjo50
         ZEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685680673; x=1688272673;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJxGCGn41BvabvDFNoHM5AnkkTjflqlE1qMNlE8NrT0=;
        b=Y0BcHlC0VXGCT9oKKJ3T+61up5xPbybdwcUstbXOh9JRqwNKFGABGsFGgKCagI43+7
         oEdjVyibLHBcOBg3ibxUU1IvvmKXarhZwWPc6iPxierSn29ifGrw41R+K00KEyv8GZjx
         EUajWpydtkz7kBPPezl71UsDalMs7jJ8jN5PC1sPhUHY9FxHT9VVtQdtd5XaEDDkhMOu
         F1BX6pB6PsPqEgCbpBe1vXqOKYXpi2RCGdzBWsyW+yTn/CiprPyTNfTKrOLigxVwHaO8
         UIGPCFEh7pucSSgj4q+s6ucZAv2xf82he/a3oiAAxz646oYc3KbgEvbM61MrxWrWAWyN
         t61A==
X-Gm-Message-State: AC+VfDxbuu0YyXWbgEE0CsJSWfBb7s/SBQRdiU7t+3FO23MrXN30Kbyc
	YWezT3DCBaT9kVn5ZewagNaX1Q==
X-Google-Smtp-Source: ACHHUZ62Kcn2qr9AiBqyelJYmBklj7AUuE+DPbUEEozY9Og2nI55kjXOuHw2dqOrnNWIFBw/8cuzPg==
X-Received: by 2002:a25:2b09:0:b0:b69:8770:9d95 with SMTP id r9-20020a252b09000000b00b6987709d95mr2183916ybr.17.1685680672998;
        Thu, 01 Jun 2023 21:37:52 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 194-20020a2503cb000000b00ba8c2f3e1a4sm64190ybd.56.2023.06.01.21.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 21:37:52 -0700 (PDT)
Date: Thu, 1 Jun 2023 21:37:38 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 00/12] mm: free retracted page table by RCU
In-Reply-To: <CAG48ez0pCqfRdVSnJz7EKtNvMR65=zJgVB-72nTdrNuhtJNX2Q@mail.gmail.com>
Message-ID: <3a33b59f-47c1-9dea-209a-9f77eec3cb1@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <CAG48ez0pCqfRdVSnJz7EKtNvMR65=zJgVB-72nTdrNuhtJNX2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463760895-147145368-1685680672=:27841"
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

---1463760895-147145368-1685680672=:27841
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 31 May 2023, Jann Horn wrote:
> On Mon, May 29, 2023 at 8:11=E2=80=AFAM Hugh Dickins <hughd@google.com> w=
rote:
> > Here is the third series of patches to mm (and a few architectures), ba=
sed
> > on v6.4-rc3 with the preceding two series applied: in which khugepaged
> > takes advantage of pte_offset_map[_lock]() allowing for pmd transitions=
=2E
>=20
> To clarify: Part of the design here is that when you look up a user
> page table with pte_offset_map_nolock() or pte_offset_map() without
> holding mmap_lock in write mode, and you later lock the page table
> yourself, you don't know whether you actually have the real page table
> or a detached table that is currently in its RCU grace period, right?

Right.  (And I'd rather not assume anything of mmap_lock, but there are
one or two or three places that may still do so.)

> And detached tables are supposed to consist of only zeroed entries,
> and we assume that no relevant codepath will do anything bad if one of
> these functions spuriously returns a pointer to a page table full of
> zeroed entries?

(Nit that I expect you're well aware of: IIRC "zeroed" isn't 0 on s390.)

If someone is using pte_offset_map() without lock, they must be prepared
to accept page-table-like changes.  The limits of pte_offset_map_nolock()
with later spin_lock(ptl): I'm still exploring: there's certainly an
argument that one ought to do a pmd_same() check before proceeding,
but I don't think anywhere needs that at present.

Whether the page table has to be full of zeroed entries when detached:
I believe it is always like that at present (by the end of the series,
when the collapse_pte_offset_map() oddity is fixed), but whether it needs
to be so I'm not sure.  Quite likely it will need to be; but I'm open to
the possibility that all it needs is to be still a page table, with
perhaps new entries from a new usage in it.

The most obvious vital thing (in the split ptlock case) is that it
remains a struct page with a usable ptl spinlock embedded in it.

The question becomes more urgent when/if extending to replacing the
pagetable pmd by huge pmd in one go, without any mmap_lock: powerpc
wants to deposit the page table for later use even in the shmem/file
case (and all arches in the anon case): I did work out the details once
before, but I'm not sure whether I would still agree with myself; and was
glad to leave replacement out of this series, to revisit some time later.

>=20
> So in particular, in handle_pte_fault() we can reach the "if
> (unlikely(!pte_same(*vmf->pte, entry)))" with vmf->pte pointing to a
> detached zeroed page table, but we're okay with that because in that
> case we know that !pte_none(vmf->orig_pte)&&pte_none(*vmf->pte) ,
> which implies !pte_same(*vmf->pte, entry) , which means we'll bail
> out?

There is no current (even at end of series) circumstance in which we
could be pointing to a detached page table there; but yes, I want to
allow for that, and yes I agree with your analysis.  But with the
interesting unanswered question for the future, of what if the same
value could be found there: would that imply it's safe to proceed,
or would some further prevention be needed?

>=20
> If that's the intent, it might be good to add some comments, because
> at least to me that's not very obvious.

That's a very fair request; but I shall have difficulty deciding where
to place such comments.  I shall have to try, then you redirect me.

And I think we approach this in opposite ways: my nature is to put some
infrastructure in place, and then look at it to see what we can get away
with; whereas your nature is to define upfront what the possibilities are.
We can expect some tussles!

Thanks,
Hugh
---1463760895-147145368-1685680672=:27841--
