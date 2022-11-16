Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D062BA05
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 11:49:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC0Dc0Kbcz3f7j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 21:49:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=VJ17UkTN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ffwll.ch (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256 header.s=google header.b=VJ17UkTN;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC0Ch4Z4Hz2xml
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 21:49:03 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id gv23so10355054ejb.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 02:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSCwvxDUrivspPm0mWYSEKkrMB19obOv39RUwyA0PH0=;
        b=VJ17UkTNHUXDMc38lOye7y2paGd4FOYHBRYpe2vgelPuC55Z4g5rnX+xNi0NFRGTrN
         mdMUVKijrbkJJfn3y8Tm8vf3pLdF4omxIOM6UM8S6CVz2p3NrVUPvz4FNRN3RF3rQ/lN
         9z9ibLXy5LDPJfO5cF7QIpPDKsW5E+659K7gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OSCwvxDUrivspPm0mWYSEKkrMB19obOv39RUwyA0PH0=;
        b=2gouWEQ5zS+YCg551IQygwnK5fTDzOnzOalg+tQtprfg7t7aCxV7RDt59qQODcxljA
         twY1of+ec+3fxZ8rELeq+En0izM8cOREmV+CJxecfBKnZkcLwxzPpI9EjCB6EIQ7GdhI
         LxiBQuV54ZQN5Pe4wr719VSG01HgYQnqfoWgN6b4vhsK96Tg0LD5K7P5No8hzbJldVHL
         7M+RUSKjZmHhVh4TEWVmzxpBbf8+ZdmVNTF408Mi+VN5MrSoM9rJ1a6B5tESJ50jzaL/
         YGyko9J6dKwRrdWsbbnK6mOwmPmY/rlkqbq0+oNyaqEK+6opF6yO8wCt9lsxW2wtb8Hz
         2xmw==
X-Gm-Message-State: ANoB5pkyLhexCQcIVzxxTroMIq0wx8UzCrhX2niNAQEh60qofc7YE0cx
	rPW6dQJ+3lVGx0CABO6wLJ0nEg==
X-Google-Smtp-Source: AA0mqf6lc5lrEzUlEqYgu67h96R4r19JtBnDlqqKBl9ey0VuIf1EYIOTKVPSxvCTipQmxuaB88n35Q==
X-Received: by 2002:a17:906:970e:b0:7ad:ccae:a30d with SMTP id k14-20020a170906970e00b007adccaea30dmr18079730ejx.704.1668595739329;
        Wed, 16 Nov 2022 02:48:59 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id g13-20020a50ec0d000000b0045b3853c4b7sm7352935edr.51.2022.11.16.02.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:48:58 -0800 (PST)
Date: Wed, 16 Nov 2022 11:48:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH mm-unstable v1 13/20] media: videobuf-dma-sg: remove
 FOLL_FORCE usage
Message-ID: <Y3TAGAUIo/IR+tAa@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Andrea Arcangeli <aarcange@redhat.com>,
	linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, Hugh Dickins <hughd@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
	linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
	etnaviv@lists.freedesktop.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Muchun Song <songmuchun@bytedance.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-14-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116102659.70287-14-david@redhat.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: linux-ia64@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oded Gabbay <ogabbay@kernel.org>, Linus Torvalds <torvalds@linu
 x-foundation.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16, 2022 at 11:26:52AM +0100, David Hildenbrand wrote:
> GUP now supports reliable R/O long-term pinning in COW mappings, such
> that we break COW early. MAP_SHARED VMAs only use the shared zeropage so
> far in one corner case (DAXFS file with holes), which can be ignored
> because GUP does not support long-term pinning in fsdax (see
> check_vma_flags()).
> 
> Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
> for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
> using FOLL_FORCE, which is really only for ptrace access.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

I looked at this a while ago when going through some of the follow_pfn
stuff, so

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/media/v4l2-core/videobuf-dma-sg.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/videobuf-dma-sg.c b/drivers/media/v4l2-core/videobuf-dma-sg.c
> index f75e5eedeee0..234e9f647c96 100644
> --- a/drivers/media/v4l2-core/videobuf-dma-sg.c
> +++ b/drivers/media/v4l2-core/videobuf-dma-sg.c
> @@ -151,17 +151,16 @@ static void videobuf_dma_init(struct videobuf_dmabuf *dma)
>  static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
>  			int direction, unsigned long data, unsigned long size)
>  {
> +	unsigned int gup_flags = FOLL_LONGTERM;
>  	unsigned long first, last;
> -	int err, rw = 0;
> -	unsigned int flags = FOLL_FORCE;
> +	int err;
>  
>  	dma->direction = direction;
>  	switch (dma->direction) {
>  	case DMA_FROM_DEVICE:
> -		rw = READ;
> +		gup_flags |= FOLL_WRITE;
>  		break;
>  	case DMA_TO_DEVICE:
> -		rw = WRITE;
>  		break;
>  	default:
>  		BUG();
> @@ -177,14 +176,11 @@ static int videobuf_dma_init_user_locked(struct videobuf_dmabuf *dma,
>  	if (NULL == dma->pages)
>  		return -ENOMEM;
>  
> -	if (rw == READ)
> -		flags |= FOLL_WRITE;
> -
>  	dprintk(1, "init user [0x%lx+0x%lx => %lu pages]\n",
>  		data, size, dma->nr_pages);
>  
> -	err = pin_user_pages(data & PAGE_MASK, dma->nr_pages,
> -			     flags | FOLL_LONGTERM, dma->pages, NULL);
> +	err = pin_user_pages(data & PAGE_MASK, dma->nr_pages, gup_flags,
> +			     dma->pages, NULL);
>  
>  	if (err != dma->nr_pages) {
>  		dma->nr_pages = (err >= 0) ? err : 0;
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
