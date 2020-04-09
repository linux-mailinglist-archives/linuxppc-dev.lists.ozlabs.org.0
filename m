Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1BE1A315A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 10:57:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yZmG1MrNzDrF4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 18:57:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yZkC6wkKzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 18:56:02 +1000 (AEST)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 0398s3us004063
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 9 Apr 2020 03:54:07 -0500
Message-ID: <eb48f7b6327e482ea9911b129210c0417ab48345.camel@kernel.crashing.org>
Subject: Re: [PATCH 19/28] gpu/drm: remove the powerpc hack in
 drm_legacy_sg_alloc
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Daniel Vetter <daniel@ffwll.ch>, Christoph Hellwig <hch@lst.de>
Date: Thu, 09 Apr 2020 18:54:01 +1000
In-Reply-To: <20200408122504.GO3456981@phenom.ffwll.local>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-20-hch@lst.de>
 <20200408122504.GO3456981@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
 Haiyang Zhang <haiyangz@microsoft.com>, linaro-mm-sig@lists.linaro.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-04-08 at 14:25 +0200, Daniel Vetter wrote:
> On Wed, Apr 08, 2020 at 01:59:17PM +0200, Christoph Hellwig wrote:
> > If this code was broken for non-coherent caches a crude powerpc hack
> > isn't going to help anyone else.  Remove the hack as it is the last
> > user of __vmalloc passing a page protection flag other than PAGE_KERNEL.
> 
> Well Ben added this to make stuff work on ppc, ofc the home grown dma
> layer in drm from back then isn't going to work in other places. I guess
> should have at least an ack from him, in case anyone still cares about
> this on ppc. Adding Ben to cc.

This was due to some drivers (radeon ?) trying to use vmalloc pages for
coherent DMA, which means on those 4xx powerpc's need to be non-cached.

There were machines using that (440 based iirc), though I honestly
can't tell if anybody still uses any of it.

Cheers,
Ben.

> -Daniel
> 
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  drivers/gpu/drm/drm_scatter.c | 11 +----------
> >  1 file changed, 1 insertion(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
> > index ca520028b2cb..f4e6184d1877 100644
> > --- a/drivers/gpu/drm/drm_scatter.c
> > +++ b/drivers/gpu/drm/drm_scatter.c
> > @@ -43,15 +43,6 @@
> >  
> >  #define DEBUG_SCATTER 0
> >  
> > -static inline void *drm_vmalloc_dma(unsigned long size)
> > -{
> > -#if defined(__powerpc__) && defined(CONFIG_NOT_COHERENT_CACHE)
> > -	return __vmalloc(size, GFP_KERNEL, pgprot_noncached_wc(PAGE_KERNEL));
> > -#else
> > -	return vmalloc_32(size);
> > -#endif
> > -}
> > -
> >  static void drm_sg_cleanup(struct drm_sg_mem * entry)
> >  {
> >  	struct page *page;
> > @@ -126,7 +117,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
> >  		return -ENOMEM;
> >  	}
> >  
> > -	entry->virtual = drm_vmalloc_dma(pages << PAGE_SHIFT);
> > +	entry->virtual = vmalloc_32(pages << PAGE_SHIFT);
> >  	if (!entry->virtual) {
> >  		kfree(entry->busaddr);
> >  		kfree(entry->pagelist);
> > -- 
> > 2.25.1
> > 
> 
> 

