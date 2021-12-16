Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E7D477C09
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:55:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFLsz2GThz3cVh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 05:55:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=cmarinas@kernel.org;
 receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFLsZ0fG9z2yY0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 05:55:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7BF5B825EC;
 Thu, 16 Dec 2021 18:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B52C36AE0;
 Thu, 16 Dec 2021 18:55:22 +0000 (UTC)
Date: Thu, 16 Dec 2021 18:55:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 07/10] powerpc/mm: Use
 generic_hugetlb_get_unmapped_area()
Message-ID: <YbuLlzUyWd6usvxu@arm.com>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <f292a83707b64c73fcb02a8708f18f09422f7eea.1638976229.git.christophe.leroy@csgroup.eu>
 <1639043741.e2zqhea1ix.astroid@bobo.none>
 <5393b7d1-33e0-2f5c-f2fb-84e6319698c9@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5393b7d1-33e0-2f5c-f2fb-84e6319698c9@csgroup.eu>
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
Cc: "alex@ghiti.fr" <alex@ghiti.fr>, Steve Capper <steve.capper@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 16, 2021 at 05:13:47PM +0000, Christophe Leroy wrote:
> Le 09/12/2021 à 11:02, Nicholas Piggin a écrit :
> > Excerpts from Christophe Leroy's message of December 9, 2021 3:18 am:
> >> Use the generic version of arch_hugetlb_get_unmapped_area()
> >> which is now available at all time.
> >>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> ---
> >>   arch/powerpc/include/asm/book3s/64/hugetlb.h |  4 --
> >>   arch/powerpc/mm/book3s64/radix_hugetlbpage.c | 55 --------------------
> >>   arch/powerpc/mm/hugetlbpage.c                |  4 +-
> >>   3 files changed, 1 insertion(+), 62 deletions(-)
> >>
> >> diff --git a/arch/powerpc/include/asm/book3s/64/hugetlb.h b/arch/powerpc/include/asm/book3s/64/hugetlb.h
> >> index 12e150e615b7..b37a28f62cf6 100644
> >> --- a/arch/powerpc/include/asm/book3s/64/hugetlb.h
> >> +++ b/arch/powerpc/include/asm/book3s/64/hugetlb.h
> >> @@ -8,10 +8,6 @@
> >>    */
> >>   void radix__flush_hugetlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
> >>   void radix__local_flush_hugetlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
> >> -extern unsigned long
> >> -radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
> >> -				unsigned long len, unsigned long pgoff,
> >> -				unsigned long flags);
> >>   
> >>   extern void radix__huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
> >>   						unsigned long addr, pte_t *ptep,
> >> diff --git a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
> >> index 23d3e08911d3..d2fb776febb4 100644
> >> --- a/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
> >> +++ b/arch/powerpc/mm/book3s64/radix_hugetlbpage.c
> >> @@ -41,61 +41,6 @@ void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma, unsigned long st
> >>   		radix__flush_tlb_range_psize(vma->vm_mm, start, end, psize);
> >>   }
> >>   
> >> -/*
> >> - * A vairant of hugetlb_get_unmapped_area doing topdown search
> >> - * FIXME!! should we do as x86 does or non hugetlb area does ?
> >> - * ie, use topdown or not based on mmap_is_legacy check ?
> >> - */
> >> -unsigned long
> >> -radix__hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
> >> -				unsigned long len, unsigned long pgoff,
> >> -				unsigned long flags)
> >> -{
> >> -	struct mm_struct *mm = current->mm;
> >> -	struct vm_area_struct *vma;
> >> -	struct hstate *h = hstate_file(file);
> >> -	int fixed = (flags & MAP_FIXED);
> >> -	unsigned long high_limit;
> >> -	struct vm_unmapped_area_info info;
> >> -
> >> -	high_limit = DEFAULT_MAP_WINDOW;
> >> -	if (addr >= high_limit || (fixed && (addr + len > high_limit)))
> >> -		high_limit = TASK_SIZE;
> > 
> > I wonder if generic hugetlb_get_unmapped_area needs to have the
> > arch_get_mmap_end() added.
> > 
> > arm64 has arch_get_mmap_end() and !HAVE_ARCH_HUGETLB_UNMAPPED_AREA so
> > it looks like it has broken large address hint logic for hugetlbfs
> > mappings? x86-64 defines their own and does the same hinting for
> > normal and hugetlbfs mmap.
> > 
> > If we had that and defied arch_get_mmap_end(), then this patch should
> > work.
> > 
> 
> As far as I can see, hugetlb_get_unmapped_area() variants used to be 
> very similar to get_unmapped_area() until commit 1be7107fbe18 ("mm: 
> larger stack guard gap, between vmas") and commit f6795053dac8 ("mm: 
> mmap: Allow for "high" userspace addresses")
> 
> I see no reason why those changes couldn't apply to 
> hugetlb_get_unmapped_area() as well.
> 
> Need to know what ARM64 think about it thought. Will, Catalin, any opinion ?

I think we should have fixed hugetlb_get_unmapped_area() as well when we
added support for 52-bit VA. The reason for commit f6795053dac8 was to
prevent normal mmap() from returning addresses above 48-bit by default
as some user-space had hard assumptions about this.

It's a slight ABI change if you do this for hugetlb_get_unmapped_area()
but I doubt anyone would notice. It's more likely that the current
behaviour would cause issues, so I'd rather have them consistent.

-- 
Catalin
