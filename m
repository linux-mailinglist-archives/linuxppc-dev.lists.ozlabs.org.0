Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F341A23A0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 15:53:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y5N34L6zzDr58
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 23:53:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=iTDVFh9z; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y3QB33ZGzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 22:25:15 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id h9so7574480wrc.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=S+T3eMWPDVVKjkhAMCN4OLY+AXtsqs3KpyYmqj2eyPw=;
 b=iTDVFh9zGz+cA8knHYYQ0Yf9dPIyYyDTxXa4CjSfrmLiD5i70f+PrvxbUf3+NKNs6P
 0FpMET5mzx+JLVZSzcC1hvsXM+4Tttd8dTrz+Xv2lGQ2cbnW/q88kgg5209meIQ7muh4
 h9U+2WX4Hzg6PB+HIxI6ZXmC8Lzm/Rzktbqts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=S+T3eMWPDVVKjkhAMCN4OLY+AXtsqs3KpyYmqj2eyPw=;
 b=B8wsYHD/Kvo3FajOi8pWYr3tvKNdFc47Hg/s9736m25RYBnsu3e/kZq7FTVbpD6I0L
 7tciR+CFkWcmIGohLdsrgpamjKwJPJvfUHeJ2b6i5ELbIqCBFMl4gkkNpNqZ7yIT/ahn
 u8NWAw2SLjcv/CPAlGExQHpSf3kK7hjKFEMcdpExCOka8J8oV+xMUiKflDFxLaVZEX1j
 k2joTY86rIUG4zOiQJMFvvBLanqk7i1ZFCDfq6lLpuG9Q1wrTzAy9lWD4YDaFDPFrDrJ
 E0e81GkXN/9yyT/7zrPck0rdree/b7/cYNtiBhxd7ETBuiKl7hjHHUYICmG/NAyJHndr
 CxNA==
X-Gm-Message-State: AGi0PubLQY3rdi7/YT1LOIx4DaTeBat+8JBTtBpxPXMpLP+7zDLo3Jev
 EnnKwy56wYsq2mpmsXaL950/fQ==
X-Google-Smtp-Source: APiQypJvxn06n6RmmZE3e7ZfAJg02E1DO8+MxqNnF9onm5w/+2r1QjPARt8wv7KYk/4tgJKIUOQMMQ==
X-Received: by 2002:a5d:4111:: with SMTP id l17mr8794439wrp.271.1586348708002; 
 Wed, 08 Apr 2020 05:25:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v7sm35651554wrs.96.2020.04.08.05.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 05:25:07 -0700 (PDT)
Date: Wed, 8 Apr 2020 14:25:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 19/28] gpu/drm: remove the powerpc hack in
 drm_legacy_sg_alloc
Message-ID: <20200408122504.GO3456981@phenom.ffwll.local>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, x86@kernel.org,
 David Airlie <airlied@linux.ie>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-20-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408115926.1467567-20-hch@lst.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 08, 2020 at 01:59:17PM +0200, Christoph Hellwig wrote:
> If this code was broken for non-coherent caches a crude powerpc hack
> isn't going to help anyone else.  Remove the hack as it is the last
> user of __vmalloc passing a page protection flag other than PAGE_KERNEL.

Well Ben added this to make stuff work on ppc, ofc the home grown dma
layer in drm from back then isn't going to work in other places. I guess
should have at least an ack from him, in case anyone still cares about
this on ppc. Adding Ben to cc.
-Daniel

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/drm_scatter.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
> index ca520028b2cb..f4e6184d1877 100644
> --- a/drivers/gpu/drm/drm_scatter.c
> +++ b/drivers/gpu/drm/drm_scatter.c
> @@ -43,15 +43,6 @@
>  
>  #define DEBUG_SCATTER 0
>  
> -static inline void *drm_vmalloc_dma(unsigned long size)
> -{
> -#if defined(__powerpc__) && defined(CONFIG_NOT_COHERENT_CACHE)
> -	return __vmalloc(size, GFP_KERNEL, pgprot_noncached_wc(PAGE_KERNEL));
> -#else
> -	return vmalloc_32(size);
> -#endif
> -}
> -
>  static void drm_sg_cleanup(struct drm_sg_mem * entry)
>  {
>  	struct page *page;
> @@ -126,7 +117,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
>  		return -ENOMEM;
>  	}
>  
> -	entry->virtual = drm_vmalloc_dma(pages << PAGE_SHIFT);
> +	entry->virtual = vmalloc_32(pages << PAGE_SHIFT);
>  	if (!entry->virtual) {
>  		kfree(entry->busaddr);
>  		kfree(entry->pagelist);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
