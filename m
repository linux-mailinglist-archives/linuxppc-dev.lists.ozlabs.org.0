Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 882A58871CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 18:15:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cp+0MqbN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1TVq2Cwrz3w50
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 04:15:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cp+0MqbN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sj@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1TTz6KbQz3dWk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 04:15:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B25E0CE0C47;
	Fri, 22 Mar 2024 17:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE9BC433F1;
	Fri, 22 Mar 2024 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711127699;
	bh=C8GD9fG22TLIZK0yuUnEPTKbqHoBiCuXP/x09X9W/Os=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cp+0MqbN/avd7Y97uUQSY5e3e9KLVDxkhGPn+yWRI0D04F60iun6Ic766AOtiq+Md
	 hbLUwftVGSSMtsA0ZZKPudwZqFCd+lo0SsIZJB1oXC/WFV4GXZB8YLu5zC2yPiOhjr
	 5BMLpXMMG1ZsWtHf0qcbGDiiKeFIJqzhIDyOUzJVdE/6IImQGRiyzKh9HaM766Mex1
	 s+nFrDQl3Y7IMmiSt07qyqGMJr3O/WR4llweHd32XwKcWLG0J7BQM/mZ/iBnSlmSeA
	 p28TSop2p+oI1SaFWDwF3ryu/RLJndxMfx3mRvQNCX5A2N3t/GOQPwJibZJp9E2p5n
	 mg6iv/YIR0f1w==
From: SeongJae Park <sj@kernel.org>
To: peterx@redhat.com
Subject: Re: [PATCH v3 03/12] mm: Make HPAGE_PXD_* macros even if !THP
Date: Fri, 22 Mar 2024 10:14:56 -0700
Message-Id: <20240322171456.118997-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240321220802.679544-4-peterx@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,

On Thu, 21 Mar 2024 18:07:53 -0400 peterx@redhat.com wrote:

> From: Peter Xu <peterx@redhat.com>
> 
> These macros can be helpful when we plan to merge hugetlb code into generic
> code.  Move them out and define them even if !THP.
> 
> We actually already defined HPAGE_PMD_NR for other reasons even if !THP.
> Reorganize these macros.
> 
> Reviewed-by: Christoph Hellwig <hch@infradead.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/huge_mm.h | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index de0c89105076..3bcdfc7e5d57 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -64,9 +64,6 @@ ssize_t single_hugepage_flag_show(struct kobject *kobj,
>  				  enum transparent_hugepage_flag flag);
>  extern struct kobj_attribute shmem_enabled_attr;
>  
> -#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
> -#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
> -
>  /*
>   * Mask of all large folio orders supported for anonymous THP; all orders up to
>   * and including PMD_ORDER, except order-0 (which is not "huge") and order-1
> @@ -87,14 +84,19 @@ extern struct kobj_attribute shmem_enabled_attr;
>  #define thp_vma_allowable_order(vma, vm_flags, smaps, in_pf, enforce_sysfs, order) \
>  	(!!thp_vma_allowable_orders(vma, vm_flags, smaps, in_pf, enforce_sysfs, BIT(order)))
>  
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define HPAGE_PMD_SHIFT PMD_SHIFT
>  #define HPAGE_PMD_SIZE	((1UL) << HPAGE_PMD_SHIFT)
>  #define HPAGE_PMD_MASK	(~(HPAGE_PMD_SIZE - 1))
> +#define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
> +#define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
>  
>  #define HPAGE_PUD_SHIFT PUD_SHIFT
>  #define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
>  #define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
> +#define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
> +#define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)

I just found latest mm-unstable fails one of my build configurations[1] with
below error.  'git bisect' says this is the first patch set started the
failure.  I haven't looked in deep, but just reporting first.

    In file included from .../include/linux/mm.h:1115,
                     from .../mm/vmstat.c:14:
    .../mm/vmstat.c: In function 'zoneinfo_show_print':
    .../include/linux/huge_mm.h:87:25: error: 'PMD_SHIFT' undeclared (first use in this function); did you mean 'PUD_SHIFT'?
       87 | #define HPAGE_PMD_SHIFT PMD_SHIFT
          |                         ^~~~~~~~~

[1] https://github.com/awslabs/damon-tests/blob/next/corr/tests/build_m68k.sh


Thanks,
SJ

[...]
