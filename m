Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7467139F2AB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 11:42:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzldx5sgcz30JY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 19:42:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=u3Oe4L5r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=u3Oe4L5r; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzldS2qPwz2xYx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 19:42:18 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id m21so15366464lfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UbrlioUAOAIyVAz7Y1adXjaiDjtyUMWku2wdnzCdoiE=;
 b=u3Oe4L5rvuo3QWAa2Fa/oNFoEr5gQFIiNX0Bc578VqkXIRhova6+7Rw2hLzmfC+3UP
 fSLu6F/51qzyA6Aaal9PU1+i7QWP4G2jxT2LxOGlqFxgcyUp03swE7NAbDyHXbLx53xK
 yXmxz3cEtQGVnR1sABRznZ+WRD/Txxj8wM2iyjxg8dVe680h46fwqWyQnGPWRfN+jfi1
 yUGxtWvgDpaAWUYzN+LLqdgcmqamN8cAV4cK3j+J1LTxhW1Jt/eOR34KEhcColGMlUfn
 g05WvF9IexXPHSuFfjzUzg0cNXjQHYRwc2Y0Ik9M/rVQT23Sf7+54B9V9PjaojzswBHD
 lhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UbrlioUAOAIyVAz7Y1adXjaiDjtyUMWku2wdnzCdoiE=;
 b=iZXluobE4VuO5rNy39jQA1H0eZr5mui5O3/oqKg+m9p/TzQEjOGez3Hdrql6Wi2i/V
 QGmiw+YxCALX4MnrOt+6O9sO0iwYgtCC9HDAKPQQTNPR/L8FQKBWQjvEOA+AD6mm5Mul
 bnioaFU5iMaq86ntxe3TetCwEq8TjcrTgaWHy7yPOySNLvgbYtwu0HNTWnlaSOMn+NmA
 CrsuQnih2SAk0f4yjUbFTJNAz9cS4Ie5xo8NA3trKtCze1yVmaUALwHyvtPQC2PP3Kmq
 qktWA6jSJfX14VqT1O7qJyOapGlJTYTXek6UWNzPQ1nvmw89Igv7QdWl45mT0N3aLpgu
 S7rQ==
X-Gm-Message-State: AOAM533k6SzdmkK4Ba1S2Eb0WBOwTbd9/3Gk2kfTZOJ93LGjfm3MgV5h
 r0LCJPicebHckGTj5NKUlf507g==
X-Google-Smtp-Source: ABdhPJzgUi/RGM4e/IJ++ZPnpBCtMa6QQYdBS/7ExIydcQEbhUkmVcoJhLqj/XAeQnHuMoLW0F9k2A==
X-Received: by 2002:ac2:5493:: with SMTP id t19mr15220380lfk.145.1623145328659; 
 Tue, 08 Jun 2021 02:42:08 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id v18sm993397ljg.114.2021.06.08.02.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:42:07 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id ABB01102717; Tue,  8 Jun 2021 12:42:22 +0300 (+03)
Date: Tue, 8 Jun 2021 12:42:22 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 01/11] mm/mremap: Fix race between MOVE_PMD mremap and
 pageout
Message-ID: <20210608094222.xcpvlc3kaq5j5sh3@box.shutemov.name>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
 <20210607055131.156184-2-aneesh.kumar@linux.ibm.com>
 <f789af6-8924-3b83-6f82-c662175af126@google.com>
 <87o8cgokso.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8cgokso.fsf@linux.ibm.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, npiggin@gmail.com, linux-mm@kvack.org,
 kaleshsingh@google.com, joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 08, 2021 at 01:22:23PM +0530, Aneesh Kumar K.V wrote:
> 
> Hi Hugh,
> 
> Hugh Dickins <hughd@google.com> writes:
> 
> > On Mon, 7 Jun 2021, Aneesh Kumar K.V wrote:
> >
> >> CPU 1				CPU 2					CPU 3
> >> 
> >> mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one
> >> 
> >> mmap_write_lock_killable()
> >> 
> >> 				addr = old_addr
> >> 				lock(pte_ptl)
> >> lock(pmd_ptl)
> >> pmd = *old_pmd
> >> pmd_clear(old_pmd)
> >> flush_tlb_range(old_addr)
> >> 
> >> *new_pmd = pmd
> >> 									*new_addr = 10; and fills
> >> 									TLB with new addr
> >> 									and old pfn
> >> 
> >> unlock(pmd_ptl)
> >> 				ptep_clear_flush()
> >> 				old pfn is free.
> >> 									Stale TLB entry
> >> 
> >> Fix this race by holding pmd lock in pageout. This still doesn't handle the race
> >> between MOVE_PUD and pageout.
> >> 
> >> Fixes: 2c91bd4a4e2e ("mm: speed up mremap by 20x on large regions")
> >> Link: https://lore.kernel.org/linux-mm/CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >
> > This seems very wrong to me, to require another level of locking in the
> > rmap lookup, just to fix some new pagetable games in mremap.
> >
> > But Linus asked "Am I missing something?": neither of you have mentioned
> > mremap's take_rmap_locks(), so I hope that already meets your need.  And
> > if it needs to be called more often than before (see "need_rmap_locks"),
> > that's probably okay.
> >
> > Hugh
> >
> 
> Thanks for reviewing the change. I missed the rmap lock in the code
> path. How about the below change?
> 
>     mm/mremap: hold the rmap lock in write mode when moving page table entries.
>     
>     To avoid a race between rmap walk and mremap, mremap does take_rmap_locks().
>     The lock was taken to ensure that rmap walk don't miss a page table entry due to
>     PTE moves via move_pagetables(). The kernel does further optimization of
>     this lock such that if we are going to find the newly added vma after the
>     old vma, the rmap lock is not taken. This is because rmap walk would find the
>     vmas in the same order and if we don't find the page table attached to
>     older vma we would find it with the new vma which we would iterate later.
>     The actual lifetime of the page is still controlled by the PTE lock.
>     
>     This patch updates the locking requirement to handle another race condition
>     explained below with optimized mremap::
>     
>     Optmized PMD move
>     
>         CPU 1                           CPU 2                                   CPU 3
>     
>         mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one
>     
>         mmap_write_lock_killable()
>     
>                                         addr = old_addr
>                                         lock(pte_ptl)
>         lock(pmd_ptl)
>         pmd = *old_pmd
>         pmd_clear(old_pmd)
>         flush_tlb_range(old_addr)
>     
>         *new_pmd = pmd
>                                                                                 *new_addr = 10; and fills
>                                                                                 TLB with new addr
>                                                                                 and old pfn
>     
>         unlock(pmd_ptl)
>                                         ptep_clear_flush()
>                                         old pfn is free.
>                                                                                 Stale TLB entry
>     
>     Optmized PUD move:
>     
>         CPU 1                           CPU 2                                   CPU 3
>     
>         mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one
>     
>         mmap_write_lock_killable()
>     
>                                         addr = old_addr
>                                         lock(pte_ptl)
>         lock(pud_ptl)
>         pud = *old_pud
>         pud_clear(old_pud)
>         flush_tlb_range(old_addr)
>     
>         *new_pud = pud
>                                                                                 *new_addr = 10; and fills
>                                                                                 TLB with new addr
>                                                                                 and old pfn
>     
>         unlock(pud_ptl)
>                                         ptep_clear_flush()
>                                         old pfn is free.
>                                                                                 Stale TLB entry
>     
>     Both the above race condition can be fixed if we force mremap path to take rmap lock.
>     
>     Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Looks like it should be enough to address the race.

It would be nice to understand what is performance overhead of the
additional locking. Is it still faster to move single PMD page table under
these locks comparing to moving PTE page table entries without the locks?

-- 
 Kirill A. Shutemov
