Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C04331A35CF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 16:24:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yk115StdzDqkZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 00:24:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=alexdeucher@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BC90dwXA; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yjvp6sjPzDqkZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 00:19:45 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id k1so12171798wrm.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Apr 2020 07:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZUmhXgHoG6HvjILgsbXz8GHCgll+LOxrRpBdz13V/lg=;
 b=BC90dwXA5AK4WR90ooTtvULwZnu4ZsRVQnQLV9NzDFZ7lKqicRXsEGPNedNOxy+3QI
 a1kmoOXSFteeDxdRL+7e8P62DjjD9bQZg3s3fofRhJoe7L1J9a46LbUxrQ6AtBTORXKV
 NDIKSoT9CEStlFz6MiX3tbzgvTr7KX9SEjLdYBH0eiP7EZNSClTpfzc0SSPSYynPiChj
 rYQTfJjtkntOCwrv+a6GMvAsCqYj/CQkd4PMEIkllHf9XhpKzORn/6xDs0+pafSbvmxv
 oU2GBI4+6mAQrXmQRuIHv6FAH1pdnq+zGKXLFmqILm/RS3QETgMEHnp/o0W7dlcGkPIh
 SqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZUmhXgHoG6HvjILgsbXz8GHCgll+LOxrRpBdz13V/lg=;
 b=JNPL5doQsBAG87dcliXUIrZ5lJmY+4TSlYaDl1c4u0wFduWa10bHDo5sm5EzSwKuRI
 jz2GPaLoMdDWYgxSQDZcEYZ1FUxkGLrCDv55RCyHqo8LYv9htl4gaOcJSyna3jG3Iy0Y
 hRBnvWypsas0zRrzXz2EdjN5AOgZHe4H7CPgMP+mwOmTQtQoBnJozmGNHb/KuBdQWW/U
 6bWkKwwj4MrNsK2hzjcJt5u8sUtcIgmab4B0690pLWRfdBpDpSd5jtGYkBJARgfpcfo9
 wudpcN0WCCZwb/WcROZVF1fxbSAlYThm8AEoRZJvdOwmtfai5YmW0cx1Pt8JBXfQhh1R
 Jj8Q==
X-Gm-Message-State: AGi0PuZuMvgr8lG/QOUW0bRcB1JWtTDG6APIX9ka8nXFRHEwi8Ps+IzJ
 k4VeNToMbqPqV3/MxFCwdOJ8z5df3H0DWPmjtPE=
X-Google-Smtp-Source: APiQypLOoBbfys5GjBpuB2sw0gQny4RebKmCrdoglSc09SupmnqmNJDVTgB3bGVTn0oBHL2+TIHKXrenRgwfEr3zhLg=
X-Received: by 2002:a5d:4145:: with SMTP id c5mr9091691wrq.362.1586441981450; 
 Thu, 09 Apr 2020 07:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-20-hch@lst.de>
 <20200408122504.GO3456981@phenom.ffwll.local>
 <eb48f7b6327e482ea9911b129210c0417ab48345.camel@kernel.crashing.org>
 <CAKMK7uHtkLvdsWFGiAtkzVa5mpnDvXkn3CHZQ6bgJ_enbyAc8A@mail.gmail.com>
In-Reply-To: <CAKMK7uHtkLvdsWFGiAtkzVa5mpnDvXkn3CHZQ6bgJ_enbyAc8A@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Apr 2020 10:19:30 -0400
Message-ID: <CADnq5_MjTSm6j=_8huVQ854H6jXY5Rg36wc31QDfOpfjfscWxA@mail.gmail.com>
Subject: Re: [PATCH 19/28] gpu/drm: remove the powerpc hack in
 drm_legacy_sg_alloc
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Christoph Hellwig <hch@lst.de>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, X86 ML <x86@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, bpf <bpf@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 9, 2020 at 5:41 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Apr 9, 2020 at 10:54 AM Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> >
> > On Wed, 2020-04-08 at 14:25 +0200, Daniel Vetter wrote:
> > > On Wed, Apr 08, 2020 at 01:59:17PM +0200, Christoph Hellwig wrote:
> > > > If this code was broken for non-coherent caches a crude powerpc hack
> > > > isn't going to help anyone else.  Remove the hack as it is the last
> > > > user of __vmalloc passing a page protection flag other than PAGE_KERNEL.
> > >
> > > Well Ben added this to make stuff work on ppc, ofc the home grown dma
> > > layer in drm from back then isn't going to work in other places. I guess
> > > should have at least an ack from him, in case anyone still cares about
> > > this on ppc. Adding Ben to cc.
> >
> > This was due to some drivers (radeon ?) trying to use vmalloc pages for
> > coherent DMA, which means on those 4xx powerpc's need to be non-cached.
> >
> > There were machines using that (440 based iirc), though I honestly
> > can't tell if anybody still uses any of it.
>
> agp subsystem still seems to happily do that (vmalloc memory for
> device access), never having been ported to dma apis (or well
> converted to iommu drivers, which they kinda are really). So I think
> this all still works exactly as back then, even with the kms radeon
> drivers. Question really is whether we have users left, and I have no
> clue about that either.
>
> Now if these boxes didn't ever have agp then I think we can get away
> with deleting this, since we've already deleted the legacy radeon
> driver. And that one used vmalloc for everything. The new kms one does
> use the dma-api if the gpu isn't connected through agp.

All radeons have a built in remapping table to handle non-AGP systems.
On the earlier radeons it wasn't quite as performant as AGP, but it
was always more reliable because AGP is AGP.  Maybe it's time to let
AGP go?

Alex

> -Daniel
>
> > Cheers,
> > Ben.
> >
> > > -Daniel
> > >
> > > >
> > > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > > ---
> > > >  drivers/gpu/drm/drm_scatter.c | 11 +----------
> > > >  1 file changed, 1 insertion(+), 10 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_scatter.c b/drivers/gpu/drm/drm_scatter.c
> > > > index ca520028b2cb..f4e6184d1877 100644
> > > > --- a/drivers/gpu/drm/drm_scatter.c
> > > > +++ b/drivers/gpu/drm/drm_scatter.c
> > > > @@ -43,15 +43,6 @@
> > > >
> > > >  #define DEBUG_SCATTER 0
> > > >
> > > > -static inline void *drm_vmalloc_dma(unsigned long size)
> > > > -{
> > > > -#if defined(__powerpc__) && defined(CONFIG_NOT_COHERENT_CACHE)
> > > > -   return __vmalloc(size, GFP_KERNEL, pgprot_noncached_wc(PAGE_KERNEL));
> > > > -#else
> > > > -   return vmalloc_32(size);
> > > > -#endif
> > > > -}
> > > > -
> > > >  static void drm_sg_cleanup(struct drm_sg_mem * entry)
> > > >  {
> > > >     struct page *page;
> > > > @@ -126,7 +117,7 @@ int drm_legacy_sg_alloc(struct drm_device *dev, void *data,
> > > >             return -ENOMEM;
> > > >     }
> > > >
> > > > -   entry->virtual = drm_vmalloc_dma(pages << PAGE_SHIFT);
> > > > +   entry->virtual = vmalloc_32(pages << PAGE_SHIFT);
> > > >     if (!entry->virtual) {
> > > >             kfree(entry->busaddr);
> > > >             kfree(entry->pagelist);
> > > > --
> > > > 2.25.1
> > > >
> > >
> > >
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
