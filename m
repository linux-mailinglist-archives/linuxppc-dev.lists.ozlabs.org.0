Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDF9FC30F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 10:52:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DGwn0TCTzF3ns
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:52:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFxr1DqDzF5ZV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:08:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFxq68zfz9sRR; Thu, 14 Nov 2019 20:07:59 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a42d6ba8c5be5aa597d25dbc15e336a2eca40260
In-Reply-To: <20191024075801.22434-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v1 1/3] mm/powerpc/book3s64/radix: Remove unused code.
Message-Id: <47DFxq68zfz9sRR@ozlabs.org>
Date: Thu, 14 Nov 2019 20:07:59 +1100 (AEDT)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-10-24 at 07:57:59 UTC, "Aneesh Kumar K.V" wrote:
> mm_tlb_flush_nested change was added in the mmu gather tlb flush to handle
> the case of parallel pte invalidate happening with mmap_sem held in read
> mode. This fix was done by commit: 02390f66bd23 ("powerpc/64s/radix: Fix
> MADV_[FREE|DONTNEED] TLB flush miss problem with THP") and the problem is
> explained in detail in commit: 99baac21e458 ("mm: fix MADV_[FREE|DONTNEED] TLB
> flush miss problem")
> 
> This was later updated by commit: 7a30df49f63a ("mm: mmu_gather: remove
> __tlb_reset_range() for force flush") to do a full mm flush rather than
> a range flush. By commit: dd2283f2605e ("mm: mmap: zap pages with read mmap_sem
> in munmap") we are also now allowing a page table free in mmap_sem read mode
> which means we should do a PWC flush too. Our current full mm flush imply
> a PWC flush.
> 
> With all the above change the mm_tlb_flush_nested(mm) branch in radix__tlb_flush
> will never be taken because for the nested case we would have taken the
> if (tlb->fullmm) branch. This patch removes the unused code. Also, remove the
> gflush change in __radix__flush_tlb_range that was added to handle the range tlb
> flush code. We only check for THP there because hugetlb is flushed via a
> different code path where page size is explicitly specified
> 
> This is a partial revert of commit: 02390f66bd23 ("powerpc/64s/radix: Fix
> MADV_[FREE|DONTNEED] TLB flush miss problem with THP")
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a42d6ba8c5be5aa597d25dbc15e336a2eca40260

cheers
