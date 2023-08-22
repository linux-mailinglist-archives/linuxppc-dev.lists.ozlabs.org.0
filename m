Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F36B784A02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 21:11:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=5JwyMFYv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVf921Tw3z3c3k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 05:11:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=5JwyMFYv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVf860FNMz2xdT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 05:11:01 +1000 (AEST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-570c51530e5so1884809eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 12:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692731458; x=1693336258;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IQel4RgNhxgk/AAhqW/nAOn0kPiLXQfoLmnalyqIi64=;
        b=5JwyMFYvi0OD4mdojayyGpwSZHcbAytYeAtnE7MibV1tAF6SgoCLsB//DV/hGRQAf7
         c4C+blWdMkYvJc5z/BVKEJ5IO13eri+1BtevVsKnvLaTD0O1oCgAeAaOVhrQvoXQwzUi
         FBC2QlGTF5PlDsr4019zQfHrYKg/N1lROVz9wLA9UOxemfMjOKuBFTyvg9J6UQWemZqh
         EC71Try8JOZukw4l9uc4A684zGu0e0Yg8X2MzLul5fftKIL4CdzSe+XLcMUDEEtfVtw9
         faYRmXMRMpla6ypOplKeSvwwVw7kQ3+VXDlAxf9mlnlIrodzJQQoglYgHfUHMzTtX58w
         +8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692731458; x=1693336258;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQel4RgNhxgk/AAhqW/nAOn0kPiLXQfoLmnalyqIi64=;
        b=Ls+KND6UZ0FtyZ00/LEuink7Ae3/n6JaVG64huBQjLIy2skjnSn/IO6+JQ2oT69hiB
         WY1wxQSkTg+Xzqf3dcZrJ0/QIOm5JhzPoOE51DDBhLfPNLwP2vRnKR3BdVREKRAHg50E
         EmpKWuLcsTW4FUn4vw8ti0PkZlOgkDK9nGCGNkqT2Iel8U725qttoqj7Bgbzug262jU+
         sX7yaN3xYooFJAgxOMnx+/aTKgXoxalKY9ymJweRbZXc6B8L8hP7oulSkhR3RwBY64sR
         q0ZnDzR21N8Q0qLg7sCt84N0iwPgwCg7JfC/53MUSyo7bNQp6ZKYWUVgOLSgwQ3RmFjs
         21sg==
X-Gm-Message-State: AOJu0YzUF88AckMvONYPQBkg4K5bxVX5IcbPdz093tN9nicxjNsBapST
	P2blNQkBc8U5JyeCYxm3d0YA0g==
X-Google-Smtp-Source: AGHT+IEBm3m/LaDBf/1DgkyNDU6zxtVn+hbaxrHnTVvmv8dzjr9ChOJoftygo0pLRcze1/DlIgis3g==
X-Received: by 2002:a05:6358:33a2:b0:135:99fa:a125 with SMTP id i34-20020a05635833a200b0013599faa125mr10540178rwd.1.1692731458157;
        Tue, 22 Aug 2023 12:10:58 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d74-20020a25e64d000000b00d7360e0b240sm2487223ybh.31.2023.08.22.12.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:10:57 -0700 (PDT)
Date: Tue, 22 Aug 2023 12:10:46 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH mm-unstable] mm/khugepaged: fix collapse_pte_mapped_thp()
 versus uffd
In-Reply-To: <ZOUCVRxM8aPH6fva@casper.infradead.org>
Message-ID: <3f926b9-ee3c-5cae-d7ad-9b3e1986bcbf@google.com>
References: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com> <CAG48ez1XAePj5MUG8AUmnTjRLcxKre-NGYV82kB68-X8Rh6fxA@mail.gmail.com> <f2dc6d6b-c516-932-1598-a58e2afffe9a@google.com> <ZOTGvfO31pleXrPF@x1n> <1b7c7056-d742-86bf-fec-fdb024b2381@google.com>
 <ZOUCVRxM8aPH6fva@casper.infradead.org>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Anshuman Khandual <anshuman.khandual@arm.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger
 @linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Jann Horn <jannh@google.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Zach O'Keefe <zokeefe@google.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com
 >
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 22 Aug 2023, Matthew Wilcox wrote:
> On Tue, Aug 22, 2023 at 11:34:19AM -0700, Hugh Dickins wrote:
> > (Yes, the locking is a bit confusing: but mainly for the unrelated reason,
> > that with the split locking configs, we never quite know whether this lock
> > is the same as that lock or not, and so have to be rather careful.)
> 
> Is it time to remove the PTE split locking config option?  I believe all
> supported architectures have at least two levels of page tables, so if we
> have split ptlocks, ptl and pml are always different from each other (it's
> just that on two level machines, pmd == pud == p4d == pgd).  With huge
> thread counts now being the norm, it's hard to see why anybody would want
> to support SMP and !SPLIT_PTE_PTLOCKS.  To quote the documentation ...
> 
>   Split page table lock for PTE tables is enabled compile-time if
>   CONFIG_SPLIT_PTLOCK_CPUS (usually 4) is less or equal to NR_CPUS.
>   If split lock is disabled, all tables are guarded by mm->page_table_lock.
> 
> You can barely buy a wrist-watch without eight CPUs these days.

Whilst I'm still happy with my 0-CPU wrist-watch, I do think you're right:
that SPLIT_PTLOCK_CPUS business was really just a safety-valve for when
introducing split ptlock in the first place, 4 pulled out of a hat, and
the unsplit ptlock path quite under-tested.

But I'll leave it to someone else do the job of removing it whenever.

Hugh
