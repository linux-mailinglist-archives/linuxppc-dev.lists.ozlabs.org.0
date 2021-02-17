Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6E831DF6F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Feb 2021 20:12:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgnXN3N5Mz3cXt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 06:12:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GOByrHDK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GOByrHDK; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgnWx6Qthz3cGN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 06:11:56 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id 2so6833444qvd.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Feb 2021 11:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=u4lbCYpxz+ZW5VAXp7OqgJphBLt/2DDRqGDYxIl7pCc=;
 b=GOByrHDKbf0jo9325LAy11eGu9UdGoSHB9Zh3C2GU4OV/B8tgkmYuHvwtkbTuvmyyY
 U0iWJrYrbndtqw4mZNoFuuSH+XfX+AxOt60BsjIpkbFcGN1EfT5XIUtYgZViurCXoHPt
 uxsld3bU42RukC+lugT01ll25f246GpKu4SK+ccgEWbbWxEGCzc5sRGUieFMkKmmOe09
 PfBzvCeykj3h1u7qDabvXa33UAR53LQXQjk5POzozIK21xxmwHqKclqdX0vK1GyUxVLH
 5LbF+osfrOegLt2XKCfyAb5XAbbfC/JzSjfwN/M6AnHdbZy/PDXfN2AB8yxBJCO5KF0f
 lIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=u4lbCYpxz+ZW5VAXp7OqgJphBLt/2DDRqGDYxIl7pCc=;
 b=ABPx0UBiwBehXA6MIhd6A9ONaIYWJiSuXJRqbmhRvFi02FYOj2AztRwqH90zGuypdp
 r8g1jcVGf6tCOyxM9SsscWY2V61arMpN7bC3h4NFKxHHz9y8p9CjIF2nw2bDXrHvYxk5
 K7ubOSJDT3PmYJJwdiCDanHon5V5rB3Bev4NjSPRDJQU5zKHE/vxaBy3Pc0PU8kei9m9
 Y/Ls72tcEmD2jshgmAQ9gcAcEEu7f08NE/rIbr4YBuGjLRRTa101G7H/HJ2Rwxrtv1oG
 x8/GeIL5dod7pRWHDUxeORJhcG+n/Zhes3qzj0yIn5uhqwgyLVnC11IddNCeXLe/q7pO
 FQqA==
X-Gm-Message-State: AOAM5326sajaD0zkWLmpVbwROx1urZ/vDowU9G8kuN5wUwBTabUnq/Av
 b00FEuB3yFQVWrg9/kBN3Sw=
X-Google-Smtp-Source: ABdhPJwDTvge1o7b1Uh8lOtIDvJQAvRXNImlZe19CNHjy6g6sOnFGEudFsgHsOfPSYgA80H+olQJlA==
X-Received: by 2002:a0c:e085:: with SMTP id l5mr769758qvk.38.1613589113366;
 Wed, 17 Feb 2021 11:11:53 -0800 (PST)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 (177-131-90-207.dynamic.desktop.com.br. [177.131.90.207])
 by smtp.gmail.com with ESMTPSA id s14sm1782694qtq.97.2021.02.17.11.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 11:11:52 -0800 (PST)
Message-ID: <05859751d16e39500cf16641f5578ec5e294afb5.camel@gmail.com>
Subject: Re: [PATCH kernel 1/2] powerpc/iommu: Allocate it_map by vmalloc
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 17 Feb 2021 16:11:48 -0300
In-Reply-To: <20210216033307.69863-2-aik@ozlabs.ru>
References: <20210216033307.69863-1-aik@ozlabs.ru>
 <20210216033307.69863-2-aik@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
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
Cc: kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-02-16 at 14:33 +1100, Alexey Kardashevskiy wrote:
> The IOMMU table uses the it_map bitmap to keep track of allocated DMA
> pages. This has always been a contiguous array allocated at either
> the boot time or when a passed through device is returned to the host OS.
> The it_map memory is allocated by alloc_pages() which allocates
> contiguous physical memory.
> 
> Such allocation method occasionally creates a problem when there is
> no big chunk of memory available (no free memory or too fragmented).
> On powernv/ioda2 the default DMA window requires 16MB for it_map.
> 
> This replaces alloc_pages_node() with vzalloc_node() which allocates
> contiguous block but in virtual memory. This should reduce changes of
> failure but should not cause other behavioral changes as it_map is only
> used by the kernel's DMA hooks/api when MMU is on.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

It looks a very good change, and also makes code much simpler to read.

FWIW:

Reviewed-by: Leonardo Bras <leobras.c@gmail,com>

> ---
>  arch/powerpc/kernel/iommu.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index c00214a4355c..8eb6eb0afa97 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -719,7 +719,6 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
>  {
>  	unsigned long sz;
>  	static int welcomed = 0;
> -	struct page *page;
>  	unsigned int i;
>  	struct iommu_pool *p;
>  
> 
> 
> 
> @@ -728,11 +727,9 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
>  	/* number of bytes needed for the bitmap */
>  	sz = BITS_TO_LONGS(tbl->it_size) * sizeof(unsigned long);
>  
> 
> 
> 
> -	page = alloc_pages_node(nid, GFP_KERNEL, get_order(sz));
> -	if (!page)
> +	tbl->it_map = vzalloc_node(sz, nid);
> +	if (!tbl->it_map)
>  		panic("iommu_init_table: Can't allocate %ld bytes\n", sz);
> -	tbl->it_map = page_address(page);
> -	memset(tbl->it_map, 0, sz);
>  
> 
> 
> 
>  	iommu_table_reserve_pages(tbl, res_start, res_end);
>  
> 
> 
> 
> @@ -774,8 +771,6 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
>  
> 
> 
> 
>  static void iommu_table_free(struct kref *kref)
>  {
> -	unsigned long bitmap_sz;
> -	unsigned int order;
>  	struct iommu_table *tbl;
>  
> 
> 
> 
>  	tbl = container_of(kref, struct iommu_table, it_kref);
> @@ -796,12 +791,8 @@ static void iommu_table_free(struct kref *kref)
>  	if (!bitmap_empty(tbl->it_map, tbl->it_size))
>  		pr_warn("%s: Unexpected TCEs\n", __func__);
>  
> 
> 
> 
> -	/* calculate bitmap size in bytes */
> -	bitmap_sz = BITS_TO_LONGS(tbl->it_size) * sizeof(unsigned long);
> -
>  	/* free bitmap */
> -	order = get_order(bitmap_sz);
> -	free_pages((unsigned long) tbl->it_map, order);
> +	vfree(tbl->it_map);
>  
> 
> 
> 
>  	/* free table */
>  	kfree(tbl);


