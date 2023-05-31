Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3D67188F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 20:00:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWcWN07c9z3fFC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 04:00:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=sNHcscEz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=sNHcscEz;
	dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWcVT0CzHz3bkm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 03:59:59 +1000 (AEST)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-33baee0235cso12985ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 10:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685555997; x=1688147997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB39BX9t2bk69eR34cuPtTrtH3iMrtwgLqGN0anXQzs=;
        b=sNHcscEzF5oIXlbzrKvF04KLUYw1WT7sMRVqG8QGy8XIgG11atPlAKnpx5jKGtpy6a
         a+jCVG2eG9BX6mHRsSpbaugSwkATgdYQoWfvZd+ALZ/Jy6Mauf49PzdPffe5WmNZPR4Z
         WAFrsIXSEXKtDxjryc6yB0Z+hcuRTBy1nOpSqzMGFFGOJoYlv2FFuEbQe/FRb7W1B+KV
         0tTSBe6RpqLXei52V6g9ZxrdXeXwUXD4CalXMcTtAUE4wynrS414dVRH12lnDs0RZxQf
         mSOnJt6GA5r/CNqCC7dCE5XlEFmkMml+h5K7Z1ZJnauFHk0x4Zj6P4zxqfq+t5LPRE9b
         dxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685555997; x=1688147997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gB39BX9t2bk69eR34cuPtTrtH3iMrtwgLqGN0anXQzs=;
        b=U4jw52BN3h5Km2+jFUIeVtpEzg+t3otGjdAHRm8aVr7efn9lDQnS3UFGYDc4HSZaH1
         zICcigS4cIYQY41cwokYSNUMB5MePvhWgDaxZidSBeX/ofyb/YS8vd7ebhlXJjAWLdAR
         96OgY25g4iQKCzc6egAxITGFIb9M39+AdQnKXWSD/v2XZqD16Tf9t1acfS/dXoMvcktP
         73oku7OBwyLJurpYpmKeTQD2k+hUdAUbT4qAiDPDZjQ+/YkCXR8oELJbwfEAPDuTJz3z
         TnEdCh5jYmL89gM1HfVJ6lrQ7OT7H6rN3dEPhLl8pm3yC3V8jD1i5gIunJ9kPhzoiaP3
         RwDw==
X-Gm-Message-State: AC+VfDwTccSogt5BYBN9SBaA08vVcPi0Ug1DxafIq05Lw3hnVtVDCrAB
	P0sm4akgl1MWY9VvhqgLs3vINJG5k8mYsB7xRZ+dpA==
X-Google-Smtp-Source: ACHHUZ4G84rWJ4iQu8mReQkW8t0DG4yhWskE8/AflvFlAC8RqDIUu08YD8bIx3gECDchUWXdvk6aMUCK5QJkPh4jMtw=
X-Received: by 2002:a05:6e02:b2e:b0:33b:5343:c1be with SMTP id
 e14-20020a056e020b2e00b0033b5343c1bemr174970ilu.29.1685555996652; Wed, 31 May
 2023 10:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
In-Reply-To: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 31 May 2023 19:59:20 +0200
Message-ID: <CAG48ez0pCqfRdVSnJz7EKtNvMR65=zJgVB-72nTdrNuhtJNX2Q@mail.gmail.com>
Subject: Re: [PATCH 00/12] mm: free retracted page table by RCU
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

On Mon, May 29, 2023 at 8:11=E2=80=AFAM Hugh Dickins <hughd@google.com> wro=
te:
> Here is the third series of patches to mm (and a few architectures), base=
d
> on v6.4-rc3 with the preceding two series applied: in which khugepaged
> takes advantage of pte_offset_map[_lock]() allowing for pmd transitions.

To clarify: Part of the design here is that when you look up a user
page table with pte_offset_map_nolock() or pte_offset_map() without
holding mmap_lock in write mode, and you later lock the page table
yourself, you don't know whether you actually have the real page table
or a detached table that is currently in its RCU grace period, right?
And detached tables are supposed to consist of only zeroed entries,
and we assume that no relevant codepath will do anything bad if one of
these functions spuriously returns a pointer to a page table full of
zeroed entries?

So in particular, in handle_pte_fault() we can reach the "if
(unlikely(!pte_same(*vmf->pte, entry)))" with vmf->pte pointing to a
detached zeroed page table, but we're okay with that because in that
case we know that !pte_none(vmf->orig_pte)&&pte_none(*vmf->pte) ,
which implies !pte_same(*vmf->pte, entry) , which means we'll bail
out?

If that's the intent, it might be good to add some comments, because
at least to me that's not very obvious.
