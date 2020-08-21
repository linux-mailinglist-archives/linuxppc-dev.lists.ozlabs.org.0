Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9D024CD6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 07:51:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXrHw3Mw4zDr3h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 15:51:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+a718def99972ac67df6e+6207+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=wC3e5XpW; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXrBD5N4GzDqxZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 15:47:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VGKvwxaQDiLZ+z37bijIYhoz/siCPi3OExDmTDYH7nw=; b=wC3e5XpWvIWwRrMAoxzR+b2PiV
 z2iL40tRUvmYqeJL2njjkYiwldy8/QjNlLBDodSEkKhGdYnKN+vfERf/y3xYrBq4ZN7A41b5VPdpu
 hW2w9ZlKXGK2YdMyBoy0Oi8JSF3D1n00ROt/mOGgHUmLSBvsS5Coq6GgAfXqp9rIPBcG/YnVzJqJ+
 9EDBa2dkPeYJ2+ptbTxuV7fSkwS/vspYT7qYRufcu8LzH2tLSyCmOPdyc0aqp1C5YrycPg8+S2SZU
 hHFGfai1g55qIDHxdfEzT9/QAHI+fyvVw9kTqpJ53Lw2DuU9H/qoc5FgqUAUyrAQCEAz3DUEM4SYv
 i7VMp5PA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k8zt7-0007aH-FN; Fri, 21 Aug 2020 05:46:53 +0000
Date: Fri, 21 Aug 2020 06:46:53 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 6/8] mm: Move vmap_range from lib/ioremap.c to
 mm/vmalloc.c
Message-ID: <20200821054653.GD28291@infradead.org>
References: <20200821044427.736424-1-npiggin@gmail.com>
 <20200821044427.736424-7-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821044427.736424-7-npiggin@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 21, 2020 at 02:44:25PM +1000, Nicholas Piggin wrote:
> This is a generic kernel virtual memory mapper, not specific to ioremap.

lib/ioremap doesn't exist any more.

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  include/linux/vmalloc.h |   2 +
>  mm/ioremap.c            | 192 ----------------------------------------
>  mm/vmalloc.c            | 191 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 193 insertions(+), 192 deletions(-)
> 
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index 787d77ad7536..e3590e93bfff 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -181,6 +181,8 @@ extern struct vm_struct *remove_vm_area(const void *addr);
>  extern struct vm_struct *find_vm_area(const void *addr);
>  
>  #ifdef CONFIG_MMU
> +extern int vmap_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
> +			unsigned int max_page_shift);

Please avoid the pointlessly long line.  And don't add the pointless
extern.
