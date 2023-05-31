Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D580718811
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 19:07:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWbLC4yVhz3fF3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 03:07:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ODuuigJH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ODuuigJH;
	dkim-atps=neutral
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWbKN1FTZz3cf8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 03:07:02 +1000 (AEST)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-33bf12b5fb5so4345ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685552819; x=1688144819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bgji1uyhymXXLfgjn7ITXdRgSIEcIf2KB/asRIvGKOw=;
        b=ODuuigJHK5p3BMHUC1m9S8L86uxhrUd+EUWNMkyrJEBnUXHeQxiEVNfM6SO3YkVpaf
         ndXjbLCLqzJ7g3A6CBeKBOBIpKZJ8oKUs6e64JWOnao6pAIZuWY6pLI1Gk5cMkVe11ku
         3ioQGLObRRUlNXy2iKn7acx9C/gUEtuQG0pvI7TP/qZYbfE5k5T+ypUHcu3dTEyZLweh
         I1YZ4kQxS8hABPCEpBrqjjPqZMycm3vlbOcgjELpkpea4zxlaNVxdzEU8yX/l9mowUQ9
         tAa7I6e+H6SKOo7nsmvpAUoYeKR3LIqzvhKRAkQH/JXauQIRQwr5rXbFuZVqunOH331S
         5Qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685552819; x=1688144819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bgji1uyhymXXLfgjn7ITXdRgSIEcIf2KB/asRIvGKOw=;
        b=C/n9Az3wKzzJEjQsS6o5GpXy6ZGgsxib0G7gUOxsjTe5AWeMiu+lRIEi6oSV8gto+3
         rIE/GSBHpooAp/jgygHzC1VP3auQDXPWB/E3Pv+ntrJ/QkOJ92raBoFsSkKRX3i3o0Eu
         CugDalyPmIZA+weEhWc3OWSUqf+hwC+0pPZ2u32FvI7sSS+GQgOvtrDTrtL2WXeSdEhT
         08RHH/izmlxdfzpqLek9Szqlaq7wBzTDjVLyr76Jp8pO9raQEVdxPfNT8vQftkNk57SV
         AdTw+Y3slJRBZdX0KbRzd9nMvlccl12EHQdVr446TSY9eQJ95pLSvWyoo6/a0t7WQxRi
         wFGQ==
X-Gm-Message-State: AC+VfDwOidjR5ZAncXX+JhfWCfgSIc0mt2vHis9sM+4IQuq39pFJy2EF
	+xH5mU4bkKeh/yEO8O/XTO66dH6OmmqcQ4aiIiFAlA==
X-Google-Smtp-Source: ACHHUZ4lBY+ZnFXYMuCa1tPn8bTKD9ClBQYGyuHfrtLAgOzl/Bx5jTe0zz5tpOLgvVRCnZM9JEXo01XssNv7NEWMOtQ=
X-Received: by 2002:a05:6e02:b2e:b0:32f:7715:4482 with SMTP id
 e14-20020a056e020b2e00b0032f77154482mr212194ilu.4.1685552819433; Wed, 31 May
 2023 10:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <88c445ae-552-5243-31a4-2674bac62d4d@google.com>
In-Reply-To: <88c445ae-552-5243-31a4-2674bac62d4d@google.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 31 May 2023 19:06:23 +0200
Message-ID: <CAG48ez0tnYTVjr7zw3Vp4GTcQ=960EodatjqE5bM9a3EVYM16Q@mail.gmail.com>
Subject: Re: [PATCH 01/12] mm/pgtable: add rcu_read_lock() and rcu_read_unlock()s
To: Hugh Dickins <hughd@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Ca
 rstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 29, 2023 at 8:15=E2=80=AFAM Hugh Dickins <hughd@google.com> wro=
te:
> Before putting them to use (several commits later), add rcu_read_lock()
> to pte_offset_map(), and rcu_read_unlock() to pte_unmap().  Make this a
> separate commit, since it risks exposing imbalances: prior commits have
> fixed all the known imbalances, but we may find some have been missed.
[...]
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index c7ab18a5fb77..674671835631 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -236,7 +236,7 @@ pte_t *__pte_offset_map(pmd_t *pmd, unsigned long add=
r, pmd_t *pmdvalp)
>  {
>         pmd_t pmdval;
>
> -       /* rcu_read_lock() to be added later */
> +       rcu_read_lock();
>         pmdval =3D pmdp_get_lockless(pmd);
>         if (pmdvalp)
>                 *pmdvalp =3D pmdval;

It might be a good idea to document that this series assumes that the
first argument to __pte_offset_map() is a pointer into a second-level
page table (and not a local copy of the entry) unless the containing
VMA is known to not be THP-eligible or the page table is detached from
the page table hierarchy or something like that. Currently a bunch of
places pass references to local copies of the entry, and while I think
all of these are fine, it would probably be good to at least document
why these are allowed to do it while other places aren't.

$ vgrep 'pte_offset_map(&'
Index File                  Line Content
    0 arch/sparc/mm/tlb.c    151 pte =3D pte_offset_map(&pmd, vaddr);
    1 kernel/events/core.c  7501 ptep =3D pte_offset_map(&pmd, addr);
    2 mm/gup.c              2460 ptem =3D ptep =3D pte_offset_map(&pmd, add=
r);
    3 mm/huge_memory.c      2057 pte =3D pte_offset_map(&_pmd, haddr);
    4 mm/huge_memory.c      2214 pte =3D pte_offset_map(&_pmd, haddr);
    5 mm/page_table_check.c  240 pte_t *ptep =3D pte_offset_map(&pmd, addr)=
;
