Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D385AB986
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 22:39:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK8sz5Flsz3c25
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 06:39:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=izfspim2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=izfspim2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=izfspim2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=izfspim2;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK8sF1XBrz2yS0
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 06:39:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662151150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xJ0Qu9XWFO4UUk4rWqs9r8O8v+oRQvUvbXP0h2FgBJE=;
	b=izfspim21vDPLupFqueqrPW667+f/C6/3ewkOm4ko9xHknZytG2H/QejfgaWNKf833ASvO
	AFtZsAvlUqo6XA7Kgf87/aC9NXhUSLI55nEeBrHiTUzNiwzgD8yPhgUQtWy76xktQL7G5A
	EEVpkGYe2ER9J4qGetvKSHNPk10/17c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662151150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xJ0Qu9XWFO4UUk4rWqs9r8O8v+oRQvUvbXP0h2FgBJE=;
	b=izfspim21vDPLupFqueqrPW667+f/C6/3ewkOm4ko9xHknZytG2H/QejfgaWNKf833ASvO
	AFtZsAvlUqo6XA7Kgf87/aC9NXhUSLI55nEeBrHiTUzNiwzgD8yPhgUQtWy76xktQL7G5A
	EEVpkGYe2ER9J4qGetvKSHNPk10/17c=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-104-AqjhXBqrOFy6_38CXp6Uiw-1; Fri, 02 Sep 2022 16:39:07 -0400
X-MC-Unique: AqjhXBqrOFy6_38CXp6Uiw-1
Received: by mail-qt1-f198.google.com with SMTP id z6-20020ac875c6000000b0034454b14c91so2387925qtq.15
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 13:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=xJ0Qu9XWFO4UUk4rWqs9r8O8v+oRQvUvbXP0h2FgBJE=;
        b=BMkxiUbn2wdxS9ReWpu1U7JSGpkwKbOgnfE8cwOjwUvwU3X//saxIGjkN0JWYKbMsA
         BbU8Tsxmgl6UP3ahAiALemlOuUENPIR7Cu6sylQQilLErbigXQtY1OGqCatJN+N+vEVe
         WoA6Bv72HBXc6v4vxWViS4D80n7zM7tjcfZWmjNdWZUtcUI1dRElWSYZCkxAsHyJnIWc
         D7gzUa3Mxv6+6II9CCuPEy2LlpAQMu3yLQf0Oaot1v+UjgxqFdT5kdOyyhFEjRIlHLrK
         XImzGNh2D+jswhWOLQPdEiGXvVZlY204YUaTqLTh/ato4PRlOUoxNTF8a5nv/c7ijERw
         Ve9w==
X-Gm-Message-State: ACgBeo0ybM2Qcdh9WK+g2pjBNdUa8LY83vi/e6t5szex/HnVqnRd/g2o
	wfFvipgSUpzJhzjxl77i8Ake991qi05X6aTtZQCo0a0RYpxcbXeeqbIMsoFS1UvuFrBa1mZUNEg
	hFHgPk3pyCbY5wj+QVf43eCoDCQ==
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id kd5-20020a056214400500b004743c94cdc2mr30020621qvb.17.1662151147439;
        Fri, 02 Sep 2022 13:39:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7YMrtikm013gR4JTLQQoN5gVOE4hUudLnV6FSgJBznRd/8l8hCsLr/ALJPQCQnci+l7e2+tQ==
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id kd5-20020a056214400500b004743c94cdc2mr30020592qvb.17.1662151147191;
        Fri, 02 Sep 2022 13:39:07 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id l3-20020ac80783000000b00342fcdc2d46sm1725995qth.56.2022.09.02.13.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 13:39:06 -0700 (PDT)
Date: Fri, 2 Sep 2022 16:39:04 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v4 2/4] mm/migrate_device.c: Add missing
 flush_cache_page()
Message-ID: <YxJp6GiGjHZ+ehyf@xz-m1.local>
References: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
 <5676f30436ab71d1a587ac73f835ed8bd2113ff5.1662078528.git-series.apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <5676f30436ab71d1a587ac73f835ed8bd2113ff5.1662078528.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 02, 2022 at 10:35:52AM +1000, Alistair Popple wrote:
> Currently we only call flush_cache_page() for the anon_exclusive case,
> however in both cases we clear the pte so should flush the cache.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
> Cc: stable@vger.kernel.org

This is the patch to start collide with David's.

David's patch has also unified both paths with ptep_get_and_clear(), but
this patch itself is also correct to me.

It'll probably just become no-diff after rebase, though.. I'm not sure how
the ordering would be at last, but anyway I think this patch stands as its
own too..

Acked-by: Peter Xu <peterx@redhat.com>

Thanks for tolerant with my nitpickings,

> 
> ---
> 
> New for v4
> ---
>  mm/migrate_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 6a5ef9f..4cc849c 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -193,9 +193,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			bool anon_exclusive;
>  			pte_t swp_pte;
>  
> +			flush_cache_page(vma, addr, pte_pfn(*ptep));
>  			anon_exclusive = PageAnon(page) && PageAnonExclusive(page);
>  			if (anon_exclusive) {
> -				flush_cache_page(vma, addr, pte_pfn(*ptep));
>  				ptep_clear_flush(vma, addr, ptep);
>  
>  				if (page_try_share_anon_rmap(page)) {
> -- 
> git-series 0.9.1
> 

-- 
Peter Xu

