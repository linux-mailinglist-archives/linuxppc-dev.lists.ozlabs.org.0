Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D9D78448B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 16:41:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=OIlW5unF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVX8n2wRXz3c3s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 00:41:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=OIlW5unF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVX7s6wGyz2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 00:40:24 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5232ce75e26so10931a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692715221; x=1693320021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C3quYQxeFIPsrSFnkoQ66g6yHaIAyBnzAc9BMpYipc=;
        b=OIlW5unFzV7NWOV6TmLpbogd3cj66r1HwrEAEgnOF/ZkPVlYd9eVUxDfxmFaXHg08Z
         +WZDP1byYy7Gdu80MZ3Qu2k2pNdEoCOyB6ATO//CRJGvDD5AorBPal+hvU31QZLFCMBJ
         6e4zzSDy/w4RB03LeKCvDfLUw5YRCZ28WtCzWt2Vbng2AJDEzISlqMA6jYWoMUXyaL1K
         qPhxmkouE6NH0WXVEhbblWYZd/uH//lE0dz/pdeDr5wClUDPBLh7bplFMBpzoPs4OvzL
         8leJoRVtJ826ssAKqPLkH9r1rGZxyXZwvlP1wBqLPNiDz5aY4+PZ0CiZ1yMzuJTRBRsk
         3e/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692715221; x=1693320021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C3quYQxeFIPsrSFnkoQ66g6yHaIAyBnzAc9BMpYipc=;
        b=Q/bWJLOiMNN2mrcieNBAUM9CLIIrneqMRne64kG5YtDwrHlPyk/KvBUb5RJYdpBUKv
         44xobAL8RdgAReCvk3meGTMvFflMSzeppHLDpnknBXK8brNU1Cahom4/7dkK06OUuRcs
         kZ5dA+xY3VqWvBIZwwAcsepiuhztlrEj6NLMVcp5lygvl7bDEQb5kgrYMQ2lAUqnC63N
         3ooM/yGw9wbTgtRzaWjFeMjsKQGtzvv0XVddo+Cu0wZ/6kjSXjVz28unlBnbuwK8j+YV
         h39T3BOt0LkCuArv9i885uDeb8lpOg4hcHOPbZjUNww9Fjb+mO6ZWK/wxUHRKJElWecE
         XY1w==
X-Gm-Message-State: AOJu0YwJPeEmXyzJ4OOlVDFE9uZdzlU04l4cC1j0IKBsX/gBJyWGKkw1
	sYlr0/dPGygfp0fgGdLHWfknMwcVP+A6H2LFPABLbw==
X-Google-Smtp-Source: AGHT+IF6H9w5RaJ7PE+MBKpDky923+JUzdrwmx+So9M6hSjxTrf0I+zQW7oUyRqPX7VRVw66ynmMZa9PJ/Zeqq91bQo=
X-Received: by 2002:a50:f690:0:b0:523:d5bc:8424 with SMTP id
 d16-20020a50f690000000b00523d5bc8424mr108311edn.5.1692715220567; Tue, 22 Aug
 2023 07:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com>
 <CAG48ez1XAePj5MUG8AUmnTjRLcxKre-NGYV82kB68-X8Rh6fxA@mail.gmail.com> <f2dc6d6b-c516-932-1598-a58e2afffe9a@google.com>
In-Reply-To: <f2dc6d6b-c516-932-1598-a58e2afffe9a@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 22 Aug 2023 16:39:43 +0200
Message-ID: <CAG48ez0S-RjAapaDiJ+oZXpn1vs9niWx54iqzusUScS-BYu0hw@mail.gmail.com>
Subject: Re: [PATCH mm-unstable] mm/khugepaged: fix collapse_pte_mapped_thp()
 versus uffd
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.
 hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Zach O'Keefe <zokeefe@google.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 22, 2023 at 4:51=E2=80=AFAM Hugh Dickins <hughd@google.com> wro=
te:
> On Mon, 21 Aug 2023, Jann Horn wrote:
> > On Mon, Aug 21, 2023 at 9:51=E2=80=AFPM Hugh Dickins <hughd@google.com>=
 wrote:
> > > Just for this case, take the pmd_lock() two steps earlier: not becaus=
e
> > > it gives any protection against this case itself, but because ptlock
> > > nests inside it, and it's the dropping of ptlock which let the bug in=
.
> > > In other cases, continue to minimize the pmd_lock() hold time.
> >
> > Special-casing userfaultfd like this makes me a bit uncomfortable; but
> > I also can't find anything other than userfaultfd that would insert
> > pages into regions that are khugepaged-compatible, so I guess this
> > works?
>
> I'm as sure as I can be that it's solely because userfaultfd breaks
> the usual rules here (and in fairness, IIRC Andrea did ask my permission
> before making it behave that way on shmem, COWing without a source page).
>
> Perhaps something else will want that same behaviour in future (it's
> tempting, but difficult to guarantee correctness); for now, it is just
> userfaultfd (but by saying "_armed" rather than "_missing", I'm half-
> expecting uffd to add more such exceptional modes in future).

Hm, yeah, sounds okay. (I guess we'd also run into this if we ever
wanted to make it possible to reliably install PTE markers with
madvise() or something like that, which might be nice for allowing
userspace to create guard pages without unnecessary extra VMAs...)

> > I guess an alternative would be to use a spin_trylock() instead of the
> > current pmd_lock(), and if that fails, temporarily drop the page table
> > lock and then restart from step 2 with both locks held - and at that
> > point the page table scan should be fast since we expect it to usually
> > be empty.
>
> That's certainly a good idea, if collapse on userfaultfd_armed private
> is anything of a common case (I doubt, but I don't know).  It may be a
> better idea anyway (saving a drop and retake of ptlock).

I was thinking it also has the advantage that it would still perform
okay if we got rid of the userfaultfd_armed() condition at some point
- though I realize that designing too much for hypothetical future
features is an antipattern.

> I gave it a try, expecting to end up with something that would lead
> me to say "I tried it, but it didn't work out well"; but actually it
> looks okay to me.  I wouldn't say I prefer it, but it seems reasonable,
> and no more complicated (as Peter rightly observes) than the original.
>
> It's up to you and Peter, and whoever has strong feelings about it,
> to choose between them: I don't mind (but I shall be sad if someone
> demands that I indent that comment deeper - I'm not a fan of long
> multi-line comments near column 80).

I prefer this version because it would make it easier to remove the
"userfaultfd_armed()" check in the future if we have to, but I guess
we could also always change it later if that becomes necessary, so I
don't really have strong feelings on it at this point.
