Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF55390BC4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 02:33:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469LlZ6rVdzDsNZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 10:33:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=robdclark@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="VV8Vh+kn";
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 469G6W2QFWzDrp4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 07:04:49 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id j6so8914322ioa.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 14:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s2ZBxhaoOWF4XzyIdX2Kvd1IcJ2ogm2WPdSG/NZ+cHk=;
 b=VV8Vh+knqRuk7GUG0+3pbm/YBPF2frCSqVFkN4P+uFmixSZ6gHA3fDaN4RsFw9h5CW
 2TmqnBG2qqz370eAeG53IhA7Zzjk6eSYUhoNdAdlHGWLJQfz3owLOgHbX3JGmMIO8WW+
 LJGMhINHoWDCJY1O7+5wM6fUKA1BZS+Jvfs3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s2ZBxhaoOWF4XzyIdX2Kvd1IcJ2ogm2WPdSG/NZ+cHk=;
 b=B2IoHTeC7ClbSi5tGUK2fZpyB1oPE3b5LwfdiQSr/2mm4lGfET0NOJFqZbaeXFWA9t
 5lptEZoU2B79LfA6DDXRzOE744jQJqxzKUJ1Y+SYmZq2iv+5WzyrFL1HPNNwIyU6HyoS
 Zb2mGL0EKHBcrELiTXixRuTQgJ/JnDfE/E5SrIShzhMpc84w1nk9nVVHvVuSvMgzOaUi
 Hxs9aIyud6UcM4GeJyl2/dcErWXr2Tv4Kra4YYqvv9V2pSbYg4Axz2ZJ5jDhRNEkmGPw
 BsA1SgjQZYO184IoRl3YVce0lb5hXzudb/mlt0vtbdA4kvHDRaZmlVBBG1fADl8ExhYf
 +uOw==
X-Gm-Message-State: APjAAAUQG17n+y6Ars6/MXoy0K4eDhtwItJLb5KepdKHsvfMcA/bXa7J
 2kYsqVKA7nv19v0hmGyxebipxctARV9khP4gfdl0Xw==
X-Google-Smtp-Source: APXvYqwts082qPcfW8wQcKhac77m+kiLOKGgwLXDG/PpCvgImNQcMwgioRdTR9BSptcdU3ElXfdZLAB34kkoF2ZHZKA=
X-Received: by 2002:a5e:924d:: with SMTP id z13mr12554582iop.247.1565989486594; 
 Fri, 16 Aug 2019 14:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
 <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
 <20190815175346.GA19839@lst.de>
In-Reply-To: <20190815175346.GA19839@lst.de>
From: Rob Clark <robdclark@chromium.org>
Date: Fri, 16 Aug 2019 14:04:35 -0700
Message-ID: <CAJs_Fx6am7TeDFSG=CcTT=4KwhqrZX_jnn56NaWcDkGVizuakg@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm+dma: cache support for arm, etc
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 17 Aug 2019 10:32:17 +1000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Maciej W. Rozycki" <macro@linux-mips.org>, Eric Biggers <ebiggers@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Imre Deak <imre.deak@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, Emil Velikov <emil.velikov@collabora.com>,
 Deepak Sharma <deepak.sharma@amd.com>, Paul Burton <paul.burton@mips.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Doug Anderson <armlinux@m.disordat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Enrico Weigelt <info@metux.net>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 christian.koenig@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 15, 2019 at 10:53 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Aug 15, 2019 at 06:54:39AM -0700, Rob Clark wrote:
> > On Wed, Aug 14, 2019 at 11:51 PM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > As said before I don't think these low-level helpers are the
> > > right API to export, but even if they did you'd just cover a tiny
> > > subset of the architectures.
> >
> > Are you thinking instead something like:
> >
> > void dma_sync_sg_for_{cpu,device}(struct device *dev, struct scatterlist *sgl,
> >                                   int nents, enum dma_data_direction dir)
> > {
> >     for_each_sg(sgl, sg, nents, i) {
> >         arch_sync_dma_for_..(dev, sg_phys(sg), sg->length, dir);
> >     }
> > }
> > EXPORT_SYMBOL_GPL(dma_sync_sg_for_..)
> >
> > or did you have something else in mind?
>
> No.  We really need an interface thay says please give me uncached
> memory (for some definition of uncached that includes that grapics
> drivers call write combine), and then let the architecture do the right
> thing.  Basically dma_alloc_coherent with DMA_ATTR_NO_KERNEL_MAPPING
> is superficially close to what you want, except that the way the drm
> drivers work you can't actually use it.

I don't disagree about needing an API to get uncached memory (or
ideally just something outside of the linear map).  But I think this
is a separate problem.

What I was hoping for, for v5.4, is a way to stop abusing dma_map/sync
for cache ops to get rid of the hack I had to make for v5.3.  And also
to fix vgem on non-x86.  (Unfortunately changing vgem to used cached
mappings breaks x86 CI, but fixes CI on arm/arm64..)  We can do that
without any changes in allocation.  There is still the possibility for
problems due to cached alias, but that has been a problem this whole
time, it isn't something new.

BR,
-R

> The reason for that is if we can we really need to not create another
> uncachable alias, but instead change the page attributes in place.
> On x86 we can and must do that for example, and based on the
> conversation with Will arm64 could do that fairly easily.  arm32 can
> right now only do that for CMA, though.
>
> The big question is what API do we want.  I had a pretty similar
> discussion with Christian on doing such an allocation for amdgpu,
> where the device normally is cache coherent, but they actually want
> to turn it into non-coherent by using PCIe unsnooped transactions.
>
> Here is my high level plan, which still has a few lose end:
>
>  (1) provide a new API:
>
>         struct page *dma_alloc_pages(struct device *dev, unsigned nr_pages,
>                         gfp_t gfp, unsigned long flags);
>         void dma_free_pages(struct device *dev, unsigned nr_pages,
>                         unsigned long flags);
>
>      These give you back page backed memory that is guaranteed to be
>      addressable by the device (no swiotlb or similar).  The memory can
>      then be mapped using dma_map*, including unmap and dma_sync to
>      bounce ownership around.  This is the replacement for the current
>      dma_alloc_attrs with DMA_ATTR_NON_CONSISTENT API, that is rather
>      badly defined.
>
>  (2) Add support for DMA_ATTR_NO_KERNEL_MAPPING to this new API instead
>      of dma_alloc_attrs.  The initial difference with that flag is just
>      that we allow highmem, but in the future we could also unmap this
>      memory from the kernel linear mapping entirely on architectures
>      where we can easily do that.
>
>  (3) Add a dma_pages_map/dma_pages_unmap or similar API that allows you
>      to get a kernel mapping for parts or all of a
>      DMA_ATTR_NO_KERNEL_MAPPING allocation.  This is to replace things
>      like your open-coded vmap in msm (or similarly elsewhere in dma-buf
>      providers).
>
>  (4) Add support for a DMA_ATTR_UNCACHABLE flags (or similar) to the new
>      API, that maps the pages as uncachable iff they have a kernel
>      mapping, including invalidating the caches at time of this page
>      attribute change (or creation of a new mapping).  This API will fail
>      if the architecture does not allow in-place remapping.  Note that for
>      arm32 we could always dip into the CMA pool if one is present to not
>      fail.  We'll also need some helper to map from the DMA_ATTR_* flags
>      to a pgprot for mapping the page to userspace.  There is also a few
>      other weird bits here, e.g. on architectures like mips that use an
>      uncached segment we'll have to fail use with the plain
>      DMA_ATTR_UNCACHABLE flag, but it could be supported with
>      DMA_ATTR_UNCACHABLE | DMA_ATTR_NO_KERNEL_MAPPING.
>
> I was hoping to get most of this done for this merge window, but I'm
> probably lucky if I get at least parts done.  Too much distraction.
>
> > Hmm, not entirely sure why.. you should be on the cc list for each
> > individual patch.
>
> They finally made it, although even with the delay they only ended up
> in the spam mailbox.  I still can't see them on the various mailing
> lists.
