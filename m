Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 567B37ABBCC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 00:32:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n1uzRuV1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rsn8D1syXz3cds
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 08:32:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n1uzRuV1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=axelrasmussen@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rsf0016y1z3dDk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 03:09:51 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso294501066b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695402587; x=1696007387; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZMr1kN15ref1wUYr4E6kS3JTBkLGuuuWxsn4v7voMQ=;
        b=n1uzRuV1augAwmUCVQWCHEEQaxTdpToVCZjOgmC66dBgM68srJNTiMoN9ECpmCRBO0
         K8S6+2wqj21y8AH8ruZLwvg1olg8XpB43LrCYK3d51lfHjjt/js3X9HHKQJbxpjPV1Cf
         nBnTYhTTPQf1OhM0h6ZyKohkP0LbgD/mUogguVpnRN3YVgRygDSI2/OdsYu7VY7PwVra
         uoBQBMY0ntFsG3hYXDS+mWb1yrHDXI+cvMdUFvzaQ+XjQmtEDhf6ZJbP9pi4NpP2lx+t
         JoMc2L68+4Tp63jcWS5Z8casbaFGbl0fPxQ1BQyUQJXxyeVOtJCLMwOOSBP1r1QiCTxa
         0FCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695402587; x=1696007387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZMr1kN15ref1wUYr4E6kS3JTBkLGuuuWxsn4v7voMQ=;
        b=t4G/A9n2Lae6YYDTofLTjvFbRhPv9Fvzfads/MXjiO9vTJX+TKw6B9CYCUTbS7J4t1
         Nrdfni0X5l7LUp3DfUPpvcIdqRczmow96wA61R2KErWBQHjhbKTpNv4KPwSWM7xhz1jr
         05HmZazidUA1m55zppWtu5kdNYJSlEI+K+p0a+w7imOIZ17MLjGOW5ZVLtWP8qh0kaON
         nceRo3ApVtT3hTqalOl0IWuZ6WJFN3iQJ35cU156OM3eaNVleFryCRqleUn1hzCbQeKi
         TpDqyB2zqUV8paeBt3d329cu2I4FljEe1FnpKPdPO3ndkYMRAFgZCsOxqMYRuTpHq0XQ
         IhEQ==
X-Gm-Message-State: AOJu0Yz3RoweL0k/rXnAmRit3va9fhJCckuli7VFWaM6f+G1oTRSDit6
	OevAV2fKKKdH42iL2HcLU9/fxOeMN2N+UE9RKrx+eQ==
X-Google-Smtp-Source: AGHT+IH4/kuj4pc7LLnOeIo2zssiCuHuC210f94Y24I1r6FA5L9LiUH2koVLT71RUpM7wLJf6p3XQNKYGbF6emeCse8=
X-Received: by 2002:a17:907:985b:b0:9a2:1ce5:1243 with SMTP id
 jj27-20020a170907985b00b009a21ce51243mr7710566ejc.60.1695402586369; Fri, 22
 Sep 2023 10:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230922115804.2043771-1-ryan.roberts@arm.com>
 <20230922115804.2043771-3-ryan.roberts@arm.com> <20230922161404.GA23332@willie-the-truck>
 <32052cb7-91f1-461d-a226-2cd2fcf34ad2@arm.com>
In-Reply-To: <32052cb7-91f1-461d-a226-2cd2fcf34ad2@arm.com>
From: Axel Rasmussen <axelrasmussen@google.com>
Date: Fri, 22 Sep 2023 10:09:08 -0700
Message-ID: <CAJHvVcgq9mJFgy=M1J546XboTu2=SWMdbQM457xUtD1kba4xew@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: hugetlb: Fix set_huge_pte_at() to work with
 all swap entries
To: Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 23 Sep 2023 08:31:44 +1000
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Helge Deller <deller@gmx.de>, Christoph Hellwig <hch@infradead.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org
 , stable@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks correct to me - thanks for the fix!

Reviewed-by: Axel Rasmussen <axelrasmussen@google.com>

On Fri, Sep 22, 2023 at 9:41=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> On 22/09/2023 17:14, Will Deacon wrote:
> > On Fri, Sep 22, 2023 at 12:58:04PM +0100, Ryan Roberts wrote:
> >> When called with a swap entry that does not embed a PFN (e.g.
> >> PTE_MARKER_POISONED or PTE_MARKER_UFFD_WP), the previous implementatio=
n
> >> of set_huge_pte_at() would either cause a BUG() to fire (if
> >> CONFIG_DEBUG_VM is enabled) or cause a dereference of an invalid addre=
ss
> >> and subsequent panic.
> >>
> >> arm64's huge pte implementation supports multiple huge page sizes, som=
e
> >> of which are implemented in the page table with multiple contiguous
> >> entries. So set_huge_pte_at() needs to work out how big the logical pt=
e
> >> is, so that it can also work out how many physical ptes (or pmds) need
> >> to be written. It previously did this by grabbing the folio out of the
> >> pte and querying its size.
> >>
> >> However, there are cases when the pte being set is actually a swap
> >> entry. But this also used to work fine, because for huge ptes, we only
> >> ever saw migration entries and hwpoison entries. And both of these typ=
es
> >> of swap entries have a PFN embedded, so the code would grab that and
> >> everything still worked out.
> >>
> >> But over time, more calls to set_huge_pte_at() have been added that se=
t
> >> swap entry types that do not embed a PFN. And this causes the code to =
go
> >> bang. The triggering case is for the uffd poison test, commit
> >> 99aa77215ad0 ("selftests/mm: add uffd unit test for UFFDIO_POISON"),
> >> which causes a PTE_MARKER_POISONED swap entry to be set, coutesey of
> >> commit 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for
> >> hugetlbfs") - added in v6.5-rc7. Although review shows that there are
> >> other call sites that set PTE_MARKER_UFFD_WP (which also has no PFN),
> >> these don't trigger on arm64 because arm64 doesn't support UFFD WP.
> >>
> >> Arguably, the root cause is really due to commit 18f3962953e4 ("mm:
> >> hugetlb: kill set_huge_swap_pte_at()"), which aimed to simplify the
> >> interface to the core code by removing set_huge_swap_pte_at() (which
> >> took a page size parameter) and replacing it with calls to
> >> set_huge_pte_at() where the size was inferred from the folio, as
> >> descibed above. While that commit didn't break anything at the time, i=
t
> >> did break the interface because it couldn't handle swap entries withou=
t
> >> PFNs. And since then new callers have come along which rely on this
> >> working. But given the brokeness is only observable after commit
> >> 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs"),
> >> that one gets the Fixes tag.
> >>
> >> Now that we have modified the set_huge_pte_at() interface to pass the
> >> huge page size in the previous patch, we can trivially fix this issue.
> >>
> >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >> Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for huget=
lbfs")
> >> Cc: <stable@vger.kernel.org> # 6.5+
> >> ---
> >>  arch/arm64/mm/hugetlbpage.c | 17 +++--------------
> >>  1 file changed, 3 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> >> index a7f8c8db3425..13fd592228b1 100644
> >> --- a/arch/arm64/mm/hugetlbpage.c
> >> +++ b/arch/arm64/mm/hugetlbpage.c
> >> @@ -241,13 +241,6 @@ static void clear_flush(struct mm_struct *mm,
> >>      flush_tlb_range(&vma, saddr, addr);
> >>  }
> >>
> >> -static inline struct folio *hugetlb_swap_entry_to_folio(swp_entry_t e=
ntry)
> >> -{
> >> -    VM_BUG_ON(!is_migration_entry(entry) && !is_hwpoison_entry(entry)=
);
> >> -
> >> -    return page_folio(pfn_to_page(swp_offset_pfn(entry)));
> >> -}
> >> -
> >>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> >>                          pte_t *ptep, pte_t pte, unsigned long sz)
> >>  {
> >> @@ -257,13 +250,10 @@ void set_huge_pte_at(struct mm_struct *mm, unsig=
ned long addr,
> >>      unsigned long pfn, dpfn;
> >>      pgprot_t hugeprot;
> >>
> >> -    if (!pte_present(pte)) {
> >> -            struct folio *folio;
> >> -
> >> -            folio =3D hugetlb_swap_entry_to_folio(pte_to_swp_entry(pt=
e));
> >> -            ncontig =3D num_contig_ptes(folio_size(folio), &pgsize);
> >> +    ncontig =3D num_contig_ptes(sz, &pgsize);
> >>
> >> -            for (i =3D 0; i < ncontig; i++, ptep++)
> >> +    if (!pte_present(pte)) {
> >> +            for (i =3D 0; i < ncontig; i++, ptep++, addr +=3D pgsize)
> >>                      set_pte_at(mm, addr, ptep, pte);
> >
> > Our set_pte_at() doesn't use 'addr' for anything and the old code didn'=
t
> > even bother to increment it here! I'm fine adding that, but it feels
> > unrelated to the issue which this patch is actually fixing.
>
> True. I agree its not strictly necessary and will presumably be optimized=
 out.
> But I'm not sure that having knowledge that the implementation doesn't us=
e it is
> a good reason not to call the interface correctly. I'll leave it as I've =
done it
> if that's ok.
>
> >
> > Either way:
> >
> > Acked-by: Will Deacon <will@kernel.org>
>
> Thanks!
>
> >
> > Will
>
