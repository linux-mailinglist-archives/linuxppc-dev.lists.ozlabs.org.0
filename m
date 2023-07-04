Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B76B74760F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 18:04:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1G5ZKRpQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwSKf17tKz3btX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 02:04:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1G5ZKRpQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwSJj0175z307y
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 02:03:47 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-57712d00cc1so71020087b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688486622; x=1691078622;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ThWaRfiQI9Y2zPB0jOGll+3lvvzwKEYuVB5/fEadW24=;
        b=1G5ZKRpQvMi6W+jmE8ub5dJeJlxbYBL30Dld2sGE0jGIh4pBJkparpgbY6X3koq/jZ
         9g+w0TuaYGHZl27XCXZmG+7CPzvq555V/M1u4Q1o6K8x8Ny1PLqYZEoRKCUHyb+Y70dI
         uBRHmI/rt4y3gkCQlfmPG1mrv6Vp0NRaNPnW3xuq6LBs3vpTAK9mFbzVtQjSJdhDF3gn
         OJOlc2lgtywf5qtUGf5eClnJ/DlUSgDiVgxe4+xMH66lLR9gKhagSbS7FM4N2TW1Ak9a
         q7fzTwEYYTKo4YcVc/r5tuNaJO9KBQwhVG9584Mvf2RQ2kUyvk+4ApeeGd9aS7kq6QuH
         tlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688486622; x=1691078622;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThWaRfiQI9Y2zPB0jOGll+3lvvzwKEYuVB5/fEadW24=;
        b=RiGRt364rAjDKim47o/GrIbtWHyiVTKQbM9RieeA6gSafz/7VudkdnmcuZS0Ay2nLn
         RuG5QBgXSDzmsP1pv9IXBCH/ZU7XsegrKnF11l/zuyUGQHUjj/Nwp7JPdUQyjqzjShU8
         CFeHyrtKInGkRBAuq0qu3gQs0eLqR6N69FAMbnBv1Q3TGOjm3Wye0xBnjvk5cP3RTJL5
         kybc8xqKLhmBpCXf0e2Y/TykmHt3rvaCmN1xn03AMt66vVPCFdLcdWbLhH3EmzayN+ym
         ehcLoBY2vWvNC5nsVUFYvDHjpPfyoAZj/TE6xKTbqMbPrhN3oE1NoTHT/mwjbUSwP6tC
         1sTw==
X-Gm-Message-State: ABy/qLaE/OOldedIMsjxqB69HEjEzTPqrbulcFpTH8p88CVgoqcKprN1
	VqiwisycS0TM96e7YiwRsH9sGw==
X-Google-Smtp-Source: APBJJlFQKEt+GJy0q7ZaawYolC37LR4/HdrndIBCrzGqd8RmTfZQfh9o4zEhy6GGc4uBo5NvU6StNw==
X-Received: by 2002:a25:2307:0:b0:c16:8d80:227d with SMTP id j7-20020a252307000000b00c168d80227dmr13176783ybj.65.1688486622226;
        Tue, 04 Jul 2023 09:03:42 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id v11-20020a25848b000000b00bf3438d6301sm4519026ybk.0.2023.07.04.09.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:03:41 -0700 (PDT)
Date: Tue, 4 Jul 2023 09:03:29 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <ZKQhW2aHJHsnkJhv@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Message-ID: <c8aeb847-3d91-b5e5-48d1-20d411b58574@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com> <20230628211624.531cdc58@thinkpad-T15> <cd7c2851-1440-7220-6c53-16b343b1474@google.com> <ZJ2hsM5Tn+yUZ5ZV@ziepe.ca> <20230629175645.7654d0a8@thinkpad-T15>
 <edaa96f-80c1-1252-acbb-71c4f045b035@google.com> <7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com> <ZKQhW2aHJHsnkJhv@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.co
 m>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Jul 2023, Alexander Gordeev wrote:
> On Sat, Jul 01, 2023 at 09:32:38PM -0700, Hugh Dickins wrote:
> > On Thu, 29 Jun 2023, Hugh Dickins wrote:
> 
> Hi Hugh,
> 
> ...
> > No, not quite the same rules as before: I came to realize that using
> > list_add_tail() for the HH pages would be liable to put a page on the
> > list which forever blocked reuse of PP list_add_tail() pages after it
> > (could be solved by a list_move() somewhere, but we have agreed to
> > prefer simplicity).
> 
> Just to make things more clear for me: do I understand correctly that this
> was an attempt to add HH fragments to pgtable_list from pte_free_defer()?

Yes, from page_table_free() called from pte_free_defer(): I had claimed
they could be put on the list (or not) without needing to consider their
HH-ness, apart from wanting to list_add_tail() rather than list_add() them.

But then realized that this category of list_add_tail() pages would block
access to the others.

But I think I was mistaken then to say "could be solved by a list_move()
somewhere"; because "somewhere" would have had to be __tlb_remove_table()
when it removes PP-bits, which would bring us back to the issues of
getting a spinlock from an mm which might already be freed.

Hugh
