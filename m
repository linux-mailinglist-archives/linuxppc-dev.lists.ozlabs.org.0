Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C603A0533
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 22:40:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G02Db0bPFz3bvm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 06:40:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=P0J8aPQ5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=hughd@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=P0J8aPQ5; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G02D25q1tz302G
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 06:39:44 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so21648589otp.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 13:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=/Vau67rqJqIJV/JlbpSB1L5gmvFWJB/QxlM86hWxPw0=;
 b=P0J8aPQ5c4Qpb6jAVSYATiAf1XHIqe3KnyZDVvujxPuyB7ttzsPqXIrdgpUC9Fw7aB
 hXafs0qppWHHCIPr2JU3YHt2jE26+fJP7r4v0bZTb0ukRNbhJSslVtLb78J/W/Y+uJTQ
 xjlHN2xlFyZjODwQRs/u19ujB/39T4dC6SMKYr+TyA+IX4DBKSnxxWDKEvMkHu1EJ+7g
 v2EsjUJaL6FauL2LeoZM+41SGkc+ekWhq619fLY2xKaKDbE8T5jjtxMyK4aPq2+ZU2L1
 r0Iui1fvlVNthaBMyyuB0a+DZ2TDEfymyH6ZS2T5wCQzv6b/Asw2TlG7zPGpd8ytDkk7
 FaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=/Vau67rqJqIJV/JlbpSB1L5gmvFWJB/QxlM86hWxPw0=;
 b=Ou7fbW3o1W/3M/HpkjTaKMIfikaglP07LiEyIYzxqgOkIWlE54zlVmEwtKgI9zWt7h
 dz3zPWnoKGcVrvldlcd7chQQH516HYJx3YQOzitiNnGBB0JPqoiyCg3EPnjEtji6Nb21
 jGBmK97VznMYDCaEU2KJyiDyCCnws1xTQ/o3rbEjooKEdbNafavUoFmuTCdFuPg9wYBP
 ixAXXoYskbG5RhAnfr6iqQ1DRUVm6EIbY9VYSm3A6K6MlhLXTYl6JBt+JKRek9J3QCjy
 9Wr/Vzne3UMBlWtdnOUP6XmZSaX0SI4ezHmC1cQdJ23rTp5CBBbiEHYFdsS1MTNuF6Xk
 MjYA==
X-Gm-Message-State: AOAM532WRYEBIzuHNWYesuh1shsj9G4GcpY0dpbZSc9lnuIS1zvAo24K
 DVXgJYjNVQqKJSh8Phrba/tSpw==
X-Google-Smtp-Source: ABdhPJxTLve2XhVz5mdc87D0DaqevrYVEv0HDDR9j9MQMj462zht4A7FeB3yw4CNw2LGlFiTVtuTpA==
X-Received: by 2002:a9d:39a4:: with SMTP id y33mr11426711otb.84.1623184779320; 
 Tue, 08 Jun 2021 13:39:39 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id x31sm3285630ota.24.2021.06.08.13.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 13:39:38 -0700 (PDT)
Date: Tue, 8 Jun 2021 13:39:36 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 01/11] mm/mremap: Fix race between MOVE_PMD mremap
 and pageout
In-Reply-To: <87o8cgokso.fsf@linux.ibm.com>
Message-ID: <295f37a-655f-81fb-7935-be652b8c655@google.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
 <20210607055131.156184-2-aneesh.kumar@linux.ibm.com>
 <f789af6-8924-3b83-6f82-c662175af126@google.com>
 <87o8cgokso.fsf@linux.ibm.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, npiggin@gmail.com, linux-mm@kvack.org,
 kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Jun 2021, Aneesh Kumar K.V wrote:
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

The PUD example below is mainly a waste a space and time:
"Optimized PUD move suffers from a similar race." would be better.

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

Don't forget the Fixes and Link you had in the previous version:
Fixes: 2c91bd4a4e2e ("mm: speed up mremap by 20x on large regions")
Link: https://lore.kernel.org/linux-mm/CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com

>     Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Thanks, this is orders of magnitude better!
Acked-by: Hugh Dickins <hughd@google.com>

> 
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 9cd352fb9cf8..f12df630fb37 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -517,7 +517,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
>  		} else if (IS_ENABLED(CONFIG_HAVE_MOVE_PUD) && extent == PUD_SIZE) {
>  
>  			if (move_pgt_entry(NORMAL_PUD, vma, old_addr, new_addr,
> -					   old_pud, new_pud, need_rmap_locks))
> +					   old_pud, new_pud, true))
>  				continue;
>  		}
>  
> @@ -544,7 +544,7 @@ unsigned long move_page_tables(struct vm_area_struct *vma,
>  			 * moving at the PMD level if possible.
>  			 */
>  			if (move_pgt_entry(NORMAL_PMD, vma, old_addr, new_addr,
> -					   old_pmd, new_pmd, need_rmap_locks))
> +					   old_pmd, new_pmd, true))
>  				continue;
>  		}
>  
> 
