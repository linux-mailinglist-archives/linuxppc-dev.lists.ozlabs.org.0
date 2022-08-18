Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4019A597DA4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 06:42:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7XKn10WZz3cFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 14:42:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UCQPCkZx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=ritesh.list@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UCQPCkZx;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7XK92PZJz2yMK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 14:41:31 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id l64so429651pge.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 21:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=vBRqm9P3PucMWPQft7rdPQr1jzE78rWkm5My0QOmYqo=;
        b=UCQPCkZxgSVgVfRvBD0lBiCJunMG+AZUrfKK6u3u6vnAu8eN28E04dT7SORQZDT/VM
         geGH1MvNA8tLwbmpRVGFoYKnjvPZwZC5qqcwyGIc9K4Qur/gDNaayEpYMhGFdnxYfWxF
         eQ/VY6GbHcM2BV3Zl1TwZFSNOAWDstV+t2e3HMxeSbbtAQYAAIC6gWlk8t7RX+H8MKWq
         AjuvHOKJO/KH9jqWv1uwDRKFw6yCvW/qsEjgb3Kcri68s4VYK664rvNBFtgAubzsUut+
         QoD4UyyjK+RFDsMPOokQ2YSz4OnQ9a7r/9/G7bAil8/StmX0pYp8aLW5CnHvmbOSTxZN
         t+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=vBRqm9P3PucMWPQft7rdPQr1jzE78rWkm5My0QOmYqo=;
        b=FtP5jdLJuZnogRR2hCMyMs5CssubxB6jjgvZE/TaNXM+PtuZDfnz4LT/Tq0UviELx7
         8fMjXOQh1oOQCAcWLBfihfQ+Mhj3WacEWytPapoG1reJavGXmc0WcwYSoaqK2yvoRPjo
         Eq0J080DoB4RNlNAkfCI8OxSzPhlN+UWm7dZZCHWKMBh1jCQ5vpaNGtyR627rxmoOFj4
         oWwx4oI+y0fZo2bOGUub78/jXvrpvLxWvuKcJafvy63mkM7ykvEqQweN5OkdAleDJXsD
         p38570tVpgUgj5JXoYxzbxrb1Kq8zqByBwTNbnz/7YPGdEMgD4f26sE9SLRZHG4Q8472
         3ODg==
X-Gm-Message-State: ACgBeo04oJC5LajfZMx9LnNc8jpUOILnPYFTedeVaQjxXDVWArx4qGkp
	xfBEa5C+i/MimoEM0J6feRCITsG+8zs=
X-Google-Smtp-Source: AA6agR7ueq3jiFzDIJuD4hrbZTfz4hqe2+zWTcQBHHHcnXdOG0+5px+2XucU7nxCfUvB3L77RDBKfQ==
X-Received: by 2002:a63:6b81:0:b0:41c:3a8c:b4fe with SMTP id g123-20020a636b81000000b0041c3a8cb4femr1186114pgc.84.1660797689286;
        Wed, 17 Aug 2022 21:41:29 -0700 (PDT)
Received: from localhost ([2406:7400:63:e947:599c:6cd1:507f:801e])
        by smtp.gmail.com with ESMTPSA id r12-20020aa7962c000000b0052e988c1630sm411044pfg.138.2022.08.17.21.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 21:41:28 -0700 (PDT)
Date: Thu, 18 Aug 2022 10:11:23 +0530
From: Ritesh Harjani <ritesh.list@gmail.com>
To: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
Subject: Re: [PATCH v2 1/4] Make place for common balloon code
Message-ID: <20220818044123.q5yzdaszcxl7mcl6@riteshh-domain>
References: <20220816094117.3144881-1-alexander.atanasov@virtuozzo.com>
 <20220816094117.3144881-2-alexander.atanasov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816094117.3144881-2-alexander.atanasov@virtuozzo.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@openvz.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/08/16 12:41PM, Alexander Atanasov wrote:
> File already contains code that is common along balloon
> drivers so rename it to reflect its contents.
> mm/balloon_compaction.c -> mm/balloon_common.c
>
> Signed-off-by: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
> ---
>  MAINTAINERS                                              | 4 ++--
>  arch/powerpc/platforms/pseries/cmm.c                     | 2 +-
>  drivers/misc/vmw_balloon.c                               | 2 +-
>  drivers/virtio/virtio_balloon.c                          | 2 +-
>  include/linux/{balloon_compaction.h => balloon_common.h} | 2 +-
>  mm/Makefile                                              | 2 +-
>  mm/{balloon_compaction.c => balloon_common.c}            | 4 ++--

>  mm/migrate.c                                             | 2 +-
>  mm/vmscan.c                                              | 2 +-
I think we don't need balloon headers in above two files at all.
I don't see any references of balloon functions in them.

I guess this commit removed it -

commit b1123ea6d3b3da25af5c8a9d843bd07ab63213f4
Author: Minchan Kim <minchan@kernel.org>
Date:   Tue Jul 26 15:23:09 2016 -0700

    mm: balloon: use general non-lru movable page feature

    Now, VM has a feature to migrate non-lru movable pages so balloon
    doesn't need custom migration hooks in migrate.c and compaction.c.

    Instead, this patch implements the page->mapping->a_ops->
    {isolate|migrate|putback} functions.

    With that, we could remove hooks for ballooning in general migration
    functions and make balloon compaction simple.

Since I don't often look into this side of code, it's better to confirm :)

-ritesh
