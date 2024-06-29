Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4DF91CF33
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 23:29:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VnqFJx5g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WBQRy615fz3cTf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2024 07:29:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VnqFJx5g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WBQRG6gHpz30TK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2024 07:28:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D148ECE10B9;
	Sat, 29 Jun 2024 21:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CE9C2BBFC;
	Sat, 29 Jun 2024 21:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719696533;
	bh=HtXt70x632jQVkvZVa5+viDAiEo/vLpbpyG46HWBjMw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VnqFJx5ghuBk4Ih3CVJjWYCN0/ZeQE4bA9dgueRtqlOBnEj9bpHIblRRQS9pvQOq9
	 e1eHFjHr5+rNv2dGIMrkk3IAZlqwsKX7p+rD1r1vmjoqPl5r2aEZGCjwsQpiy3/x6B
	 ysyxPdOQzeo0ZX9VEzv6T9NJsfU8dcWOxpkFNYAWzY/LBU0zuLZ2xf3++9jGcptCb1
	 Xp8Voz7uHR8O3pq3w/ncYUPGbyyGG5MBfyicJ+oqDiGO1BzaG9nKTI9pT87K9/QPad
	 WGmS2gB4YANsUc/hqolrWiMuZCznLg98Ov/R1hZ8gbO540njo89EbUIDosTqYlZeua
	 vy2FDJBTYP9+A==
Date: Sat, 29 Jun 2024 16:28:51 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 02/13] pci/p2pdma: Don't initialise page refcount to one
Message-ID: <20240629212851.GA1484889@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c66cc5c5142813049ffdf9af75302f5064048241.1719386613.git-series.apopple@nvidia.com>
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, jack@suse.cz, david@redhat.com, djwong@kernel.org, dave.hansen@linux.intel.com, david@fromorbit.com, peterx@redhat.com, linux-mm@kvack.org, will@kernel.org, hch@lst.de, dave.jiang@intel.com, vishal.l.verma@intel.com, linux-doc@vger.kernel.org, willy@infradead.org, jgg@ziepe.ca, catalin.marinas@arm.com, linux-ext4@vger.kernel.org, ira.weiny@intel.com, jhubbard@nvidia.com, npiggin@gmail.com, linux-cxl@vger.kernel.org, bhelgaas@google.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2024 at 10:54:17AM +1000, Alistair Popple wrote:
> The reference counts for ZONE_DEVICE private pages should be
> initialised by the driver when the page is actually allocated by the
> driver allocator, not when they are first created. This is currently
> the case for MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT pages
> but not MEMORY_DEVICE_PCI_P2PDMA pages so fix that up.

If you tag the subject line with PCI, please run "git log --oneline
drivers/pci/p2pdma.c" and make yours look like previous ones
("PCI/P2PDMA").

Also recast it to say something semantically useful about what it
*does*, not what it *doesn't* do.  Maybe something about initializing
the refcount where the page is allocated?  Especially since the only
p2pdma.c change here is to "set_page_count(..., 1)", which looks like
exactly the opposite of "don't initialize refcount to one".

> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  drivers/pci/p2pdma.c | 2 ++
>  mm/memremap.c        | 8 ++++----
>  mm/mm_init.c         | 4 +++-
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index 4f47a13..1e9ea32 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -128,6 +128,8 @@ static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
>  		goto out;
>  	}
>  
> +	set_page_count(virt_to_page(kaddr), 1);
> +
>  	/*
>  	 * vm_insert_page() can sleep, so a reference is taken to mapping
>  	 * such that rcu_read_unlock() can be done before inserting the
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 40d4547..caccbd8 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -488,15 +488,15 @@ void free_zone_device_folio(struct folio *folio)
>  	folio->mapping = NULL;
>  	folio->page.pgmap->ops->page_free(folio_page(folio, 0));
>  
> -	if (folio->page.pgmap->type != MEMORY_DEVICE_PRIVATE &&
> -	    folio->page.pgmap->type != MEMORY_DEVICE_COHERENT)
> +	if (folio->page.pgmap->type == MEMORY_DEVICE_PRIVATE ||
> +	    folio->page.pgmap->type == MEMORY_DEVICE_COHERENT)
> +		put_dev_pagemap(folio->page.pgmap);
> +	else if (folio->page.pgmap->type != MEMORY_DEVICE_PCI_P2PDMA)
>  		/*
>  		 * Reset the refcount to 1 to prepare for handing out the page
>  		 * again.
>  		 */
>  		folio_set_count(folio, 1);
> -	else
> -		put_dev_pagemap(folio->page.pgmap);
>  }
>  
>  void zone_device_page_init(struct page *page)
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 3ec0493..b7e1599 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -6,6 +6,7 @@
>   * Author Mel Gorman <mel@csn.ul.ie>
>   *
>   */
> +#include "linux/memremap.h"
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/kobject.h>
> @@ -1014,7 +1015,8 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>  	 * which will set the page count to 1 when allocating the page.
>  	 */
>  	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
> -	    pgmap->type == MEMORY_DEVICE_COHERENT)
> +	    pgmap->type == MEMORY_DEVICE_COHERENT ||
> +	    pgmap->type == MEMORY_DEVICE_PCI_P2PDMA)
>  		set_page_count(page, 0);
>  }
>  
> -- 
> git-series 0.9.1
