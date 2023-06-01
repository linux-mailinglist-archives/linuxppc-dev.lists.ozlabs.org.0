Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1B719E48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 15:33:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX6Wx2lcPz3dxv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 23:33:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=nEb7UmLM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=nEb7UmLM;
	dkim-atps=neutral
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX6W70R87z2xKj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 23:32:17 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-33bf12b5fb5so107355ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685626333; x=1688218333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3KtCSrqEVqtyrflNCykZkj5UeocsByaRl8X7IPAFn8=;
        b=nEb7UmLMNlSokluULHqM3r9qwDnoeTuCxbhZyiHecz0usOSPC/uyqdsHZ7xd6QBUyR
         idkWN5F64EAtBjPj19+RTFg6iXWGBP25dJZ/WHKJSbI78Nf4B6FKQFfIZx5W/5QST0fZ
         jSi5W+oz4+pxH8RukzegUQ49sfyvxL8hY8S1I+HgSUT+fLqfWNHs8rfhFuGCycq2YTEj
         /BaEsJfjqqPeuuslkWBUjfkGO32PnKAsvZU64ZLopJ+ej2ZPg07X13JKU5z1UjszHkqe
         qWbHkQ3YufXGR4Y0zjyJFUrHwGjq1B+NSYDQtViYyV9Vj3OQjylmZh1M9WPLSLCrP5HB
         BULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685626333; x=1688218333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3KtCSrqEVqtyrflNCykZkj5UeocsByaRl8X7IPAFn8=;
        b=kvEwKRzhbTmIvdkRCoBJETayAl+8EigGxhzYIGVRwOnkPVcmRVyOfrc+HcsHPGgz0i
         IaoLh+131s20mGQjcRCHu/TgxOp21ffFp7++Ec9mkmmWVYWKxlOpJ6P/tTz1cKSekZfZ
         DbdcFuYiTLRYVoCtTF+MB/3Dn+W6gA1AWANnvxjJlGV8v8ErDakDz4zxPlANYWuki4MM
         sB/wJbAtwRvfdl/g4PfHSY1AV37s+k4cJqEQnZQQ9sIdvJd/+Xlv3+koi+pLA+mxRazK
         cwglA9jZketobW7Ipm38iD3jWVgrsaT5tYkh4EQ2aVFDXrlIeG8bmWbiWc/51zFjQDmU
         a3uw==
X-Gm-Message-State: AC+VfDy/3etsUwNRi6EMwwIc73nHK3maxUy4a4f0rBC6wusweNax6WYb
	/HPxRXqUGArFxa8VuPmVTUwo4QejmBRepC6WqSYiqg==
X-Google-Smtp-Source: ACHHUZ4V/FtCLljGT1xoWt7C/8p0Y5SAaWQZYLw6rhFmZV3z+bByMi+y3Ckgjp10pBE5s1R58cJTrfBhSTUq11iJoX4=
X-Received: by 2002:a05:6e02:b2c:b0:32a:642d:2a13 with SMTP id
 e12-20020a056e020b2c00b0032a642d2a13mr216220ilu.6.1685626333553; Thu, 01 Jun
 2023 06:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <739964d-c535-4db4-90ec-2166285b4d47@google.com>
In-Reply-To: <739964d-c535-4db4-90ec-2166285b4d47@google.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 1 Jun 2023 15:31:37 +0200
Message-ID: <CAG48ez26qh_ZYuKoOQt-ci6SHt2R=5+bPgHCaZrG_TBfbPHq8g@mail.gmail.com>
Subject: Re: [PATCH 08/12] mm/pgtable: add pte_free_defer() for pgtable as page
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

On Mon, May 29, 2023 at 8:23=E2=80=AFAM Hugh Dickins <hughd@google.com> wro=
te:
> Add the generic pte_free_defer(), to call pte_free() via call_rcu().
> pte_free_defer() will be called inside khugepaged's retract_page_tables()
> loop, where allocating extra memory cannot be relied upon.  This version
> suits all those architectures which use an unfragmented page for one page
> table (none of whose pte_free()s use the mm arg which was passed to it).

Pages that have been scheduled for deferred freeing can still be
locked, right? So struct page's members "ptl" and "rcu_head" can now
be in use at the same time? If that's intended, it would probably be a
good idea to add comments in the "/* Page table pages */" part of
struct page to point out that the first two members can be used by the
rcu_head while the page is still used as a page table in some
contexts, including use of the ptl.
