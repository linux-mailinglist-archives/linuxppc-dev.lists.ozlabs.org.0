Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF927237B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 08:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb0tl0fFZz3fB0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 16:29:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ULW8wPRi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ULW8wPRi;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb0sx2qTsz3bkm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 16:28:36 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-568ba7abc11so72124657b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 23:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686032913; x=1688624913;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lh4nTYVvP2xhbTqzCFThdJwLmWrtDo6cCYu0K1MEaUc=;
        b=ULW8wPRikckM9LELAx9UpWle2Lb4WwZxPIXEDt1lR9wQIO5cxXakH/8jTLMBuZw8wx
         Uh47SeunW4Tp+pyb/wTLCC6nZMEC4nTofGf4XUgb3BlgvfEFnDLECsk+JtbDPIEYi26x
         9vZZ874SZy4X8WigJ/C8mjXXdDbReJrV0R4WIGr0mh0A5ZnrYuJU6h/Cw9u/zsQYaDk7
         mLxWS2XDJjEOTgncPyb98NRz5neLtObTpcxFngkG2w0fp+AzoZOrYLnFHTWNsS7we8ze
         5+dQOLu1Iwg73UmL89hyYzq5nExeBAcTkTsnwBDNieMk9P3B3h923KXyo65p9UTdz89t
         Xo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686032913; x=1688624913;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lh4nTYVvP2xhbTqzCFThdJwLmWrtDo6cCYu0K1MEaUc=;
        b=CREUUt3jXF+tJ2syOl+QkGchMwxiLPfOq71Z/8Dlk9otQO4EcdXmE2Zn2W2VjA6iuf
         smBKwR2XZHZJBCP3oWjpd2G9squ+8KPXdIvcaZHPSmR1rYOsGmgqXuXvpbfQ5rVPTOpJ
         GPeid+e1qw7Ir+vxfncHuuZ8DopXsBTGvMKTH9CpkprIFoEypfwczMSK8eZ3AnPHkpon
         uuKgpo9Z64aROAx2MlDwYmto8oG3m2eFJA5y+Pke4KNbMQNSifYYfu9XDwxK1/vBAE9+
         0GMKagXWZqrcJEpj9U6bXSF0/n7v2SHbntPfmRtlXVrS460g0J7wT1mMMtC8Sj1qYq6s
         vrAg==
X-Gm-Message-State: AC+VfDwtUTcOhOQdBYCFOrEqhGWCtaSd9U84nb8XFM/i71vSbzdj1+Ob
	KA0VM0wTEI8O3rRF07JFLH0hgw==
X-Google-Smtp-Source: ACHHUZ7idIXR3XCuKUN9DZBZ124U2LyUkc47jWZoQiMKnSHKdPcQWeTsiAJumin9N7U+fFXlqtOy5g==
X-Received: by 2002:a0d:dd0f:0:b0:565:a3e6:1b7b with SMTP id g15-20020a0ddd0f000000b00565a3e61b7bmr1184720ywe.18.1686032912712;
        Mon, 05 Jun 2023 23:28:32 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id u127-20020a818485000000b00569e0490babsm626769ywf.16.2023.06.05.23.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 23:28:32 -0700 (PDT)
Date: Mon, 5 Jun 2023 23:28:27 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 00/12] mm: free retracted page table by RCU
In-Reply-To: <CAG48ez1Yua=6ztK6Urc-BZj9ku14MWbOKP8iBUK6_F5VzRXP-A@mail.gmail.com>
Message-ID: <99fadcf-3979-a493-2664-291c5fbce19e@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <CAG48ez0pCqfRdVSnJz7EKtNvMR65=zJgVB-72nTdrNuhtJNX2Q@mail.gmail.com> <3a33b59f-47c1-9dea-209a-9f77eec3cb1@google.com> <CAG48ez1Yua=6ztK6Urc-BZj9ku14MWbOKP8iBUK6_F5VzRXP-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463760895-360064877-1686032912=:3708"
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

---1463760895-360064877-1686032912=:3708
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 2 Jun 2023, Jann Horn wrote:
> On Fri, Jun 2, 2023 at 6:37=E2=80=AFAM Hugh Dickins <hughd@google.com> wr=
ote:
>=20
> > The most obvious vital thing (in the split ptlock case) is that it
> > remains a struct page with a usable ptl spinlock embedded in it.
> >
> > The question becomes more urgent when/if extending to replacing the
> > pagetable pmd by huge pmd in one go, without any mmap_lock: powerpc
> > wants to deposit the page table for later use even in the shmem/file
> > case (and all arches in the anon case): I did work out the details once
> > before, but I'm not sure whether I would still agree with myself; and w=
as
> > glad to leave replacement out of this series, to revisit some time late=
r.
> >
> > >
> > > So in particular, in handle_pte_fault() we can reach the "if
> > > (unlikely(!pte_same(*vmf->pte, entry)))" with vmf->pte pointing to a
> > > detached zeroed page table, but we're okay with that because in that
> > > case we know that !pte_none(vmf->orig_pte)&&pte_none(*vmf->pte) ,
> > > which implies !pte_same(*vmf->pte, entry) , which means we'll bail
> > > out?
> >
> > There is no current (even at end of series) circumstance in which we
> > could be pointing to a detached page table there; but yes, I want to
> > allow for that, and yes I agree with your analysis.
>=20
> Hmm, what am I missing here?

I spent quite a while trying to reconstruct what I had been thinking,
what meaning of "detached" or "there" I had in mind when I asserted so
confidently "There is no current (even at end of series) circumstance
in which we could be pointing to a detached page table there".

But had to give up and get on with more useful work.
Of course you are right, and that is what this series is about.

Hugh

>=20
> static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
> {
>   pte_t entry;
>=20
>   if (unlikely(pmd_none(*vmf->pmd))) {
>     [not executed]
>   } else {
>     /*
>      * A regular pmd is established and it can't morph into a huge
>      * pmd by anon khugepaged, since that takes mmap_lock in write
>      * mode; but shmem or file collapse to THP could still morph
>      * it into a huge pmd: just retry later if so.
>      */
>     vmf->pte =3D pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
>              vmf->address, &vmf->ptl);
>     if (unlikely(!vmf->pte))
>       [not executed]
>     // this reads a present readonly PTE
>     vmf->orig_pte =3D ptep_get_lockless(vmf->pte);
>     vmf->flags |=3D FAULT_FLAG_ORIG_PTE_VALID;
>=20
>     if (pte_none(vmf->orig_pte)) {
>       [not executed]
>     }
>   }
>=20
>   [at this point, a concurrent THP collapse operation detaches the page t=
able]
>   // vmf->pte now points into a detached page table
>=20
>   if (!vmf->pte)
>     [not executed]
>=20
>   if (!pte_present(vmf->orig_pte))
>     [not executed]
>=20
>   if (pte_protnone(vmf->orig_pte) && vma_is_accessible(vmf->vma))
>     [not executed]
>=20
>   spin_lock(vmf->ptl);
>   entry =3D vmf->orig_pte;
>   // vmf->pte still points into a detached page table
>   if (unlikely(!pte_same(*vmf->pte, entry))) {
>     update_mmu_tlb(vmf->vma, vmf->address, vmf->pte);
>     goto unlock;
>   }
>   [...]
> }
---1463760895-360064877-1686032912=:3708--
