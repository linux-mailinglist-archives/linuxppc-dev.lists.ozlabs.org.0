Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD31783560
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 00:01:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ipxAnVHK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV5z02x6Pz3c4M
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 08:01:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ipxAnVHK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV5y65MF5z2xBF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 08:00:29 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fef56e85edso14255e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 15:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692655224; x=1693260024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KOwCMKv6gJICwnu0jRAkIqxjiFqWwB1qyLCAsgnqG0=;
        b=ipxAnVHK5hrxVLmvntmZQrofxIux7YPNhttG1XpTAHAPHEbJX74AyC6D4ZvDaOaFFY
         0u7VO6HQsy9Si6WU/4KQ10X3DsXebeRA9C4uF7BsmGmhr/b1m4wFOGUNBoH1rH/c96ns
         MggRJw+aieI4JfjXdgUWoV/cCP0nogIMoWDaf610sIRFm82YPcnV89QELcdfkpl7k5tb
         vj2fNyIEO+jILsmwR1cpX7MNprfnDDbjw88QMqN1iZkXUwb/wTCTWxbJP9qJIuSMBYEJ
         pJo0wONEosBk90GtUzsRO2I04ynlMXp9sa6iFVk3XLg4jUVcaNA+gfK91UV+6QJq9QkO
         icXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692655224; x=1693260024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KOwCMKv6gJICwnu0jRAkIqxjiFqWwB1qyLCAsgnqG0=;
        b=DmnGDND+FEu2KRUPQoHygO2dzb5iEqKg/XDSB4AjcOQd3QuJdR1VB6LIyClcnC/OEA
         ypyhz3A6zzrJiM/CqcaeCXG71JYdAovY50EkuQ1MFhnPHinnjs2Hfh2s3awyVNVUnBjO
         U9o9zjYAEj08u0kziZdcxXutnMfkGwKgIAEUwaMRfDKKuFFmFb7ZCQNZxzOhjxr7nIu1
         NNJSa82Od+W0gl+SaFzVF8SD4KmFxEPBl9H5BnZEy0oB5McXTbY5n2XZs4RiI9MBZauS
         IfqMAjAyAgzI9zXVBdqo+UvwLWddUpBo7WFl5Vuz/XwbvZmlqKbhMusqedXD7vvaTvqC
         rDqA==
X-Gm-Message-State: AOJu0Yz1BrHaYE8oe+yfa0klU9ZOrrY2k+hpumMcAQFsyIzl3IuGx0ED
	CsHGvQzK8thIAM1tbYGKZ6doETBUcpvi/uu1C4tCLA==
X-Google-Smtp-Source: AGHT+IH64SpGveN9dGK2zvuRPaovHVk4+hMnYMZFm087iCMpl0qOKktqy2IA+4bd+qpox23ZOFiqzmDaa1UD37turPI=
X-Received: by 2002:a05:600c:1d23:b0:3fd:e15:6d5 with SMTP id
 l35-20020a05600c1d2300b003fd0e1506d5mr45830wms.2.1692655223487; Mon, 21 Aug
 2023 15:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com>
In-Reply-To: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 21 Aug 2023 23:59:46 +0200
Message-ID: <CAG48ez1XAePj5MUG8AUmnTjRLcxKre-NGYV82kB68-X8Rh6fxA@mail.gmail.com>
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

On Mon, Aug 21, 2023 at 9:51=E2=80=AFPM Hugh Dickins <hughd@google.com> wro=
te:
> Jann Horn demonstrated how userfaultfd ioctl UFFDIO_COPY into a private
> shmem mapping can add valid PTEs to page table collapse_pte_mapped_thp()
> thought it had emptied: page lock on the huge page is enough to protect
> against WP faults (which find the PTE has been cleared), but not enough
> to protect against userfaultfd.  "BUG: Bad rss-counter state" followed.
>
> retract_page_tables() protects against this by checking !vma->anon_vma;
> but we know that MADV_COLLAPSE needs to be able to work on private shmem
> mappings, even those with an anon_vma prepared for another part of the
> mapping; and we know that MADV_COLLAPSE needs to work on shared shmem
> mappings which are userfaultfd_armed().  Whether it needs to work on
> private shmem mappings which are userfaultfd_armed(), I'm not so sure:
> but assume that it does.

I think we couldn't rely on anon_vma here anyway, since holding the
mmap_lock in read mode doesn't prevent concurrent creation of an
anon_vma?

> Just for this case, take the pmd_lock() two steps earlier: not because
> it gives any protection against this case itself, but because ptlock
> nests inside it, and it's the dropping of ptlock which let the bug in.
> In other cases, continue to minimize the pmd_lock() hold time.

Special-casing userfaultfd like this makes me a bit uncomfortable; but
I also can't find anything other than userfaultfd that would insert
pages into regions that are khugepaged-compatible, so I guess this
works?

I guess an alternative would be to use a spin_trylock() instead of the
current pmd_lock(), and if that fails, temporarily drop the page table
lock and then restart from step 2 with both locks held - and at that
point the page table scan should be fast since we expect it to usually
be empty.
