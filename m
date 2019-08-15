Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D9B8F6C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 00:04:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468gV30vtKzDrBd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 08:04:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=robdclark@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="LL9gmWZ1";
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Scy6x1vzDr3N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 23:54:55 +1000 (AEST)
Received: by mail-oi1-x242.google.com with SMTP id l12so2049936oil.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X5MHSVxjVbFw14gqG5FUXdzsIwvacO5ycoZ+KZncf0s=;
 b=LL9gmWZ1h+OhDYg38xhyOFgY6h1JTL7+BEI+M4/66SAuy+YS17/1GNt2LFCYlFwHgS
 I2ORea3QECg5t802K1/kXe+MYRWXHFLGsmZw9w0b0C4PQffYsKhMpRJ5RWFKi2c56Q5H
 lbZZv26jqw/MHeMc//ARtg43BTEsBpT31y1nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5MHSVxjVbFw14gqG5FUXdzsIwvacO5ycoZ+KZncf0s=;
 b=T1VQ6XB67hts8JOjPYkiKETWOUTsnZ44GNJ+vxPAKu1RBfmShmyddbCPoMG6Pixbzy
 oDLQP4OV2CXnAWMKfsGXBgbYmM+FW5PUuHD/B2wfKwyndWP8Qilh5HR3KpgSgvgQ8CXC
 HVvm2T1BGyeqnrBDa7mF39nog0qOT8FYmAe51k/2QR5LIBDuBh/CSN15MoBRNcQ6EEJS
 2aJNRi91/jr0eOcVUZkoLZK1qYl8fJjUA/sNVwG9ecUH8LwbBGmQeXFO/GctltlTDrY2
 c131LAYrVz8D9ItpX8F4bM4XINqTfv3yDn/8MYmd77EGAROXd9N97jrnTZW7xTbc1N5v
 G0AQ==
X-Gm-Message-State: APjAAAXXrOJu2GUBhgQ4AdmrFdz3S3o+3BIfjGTYhTl/udD7AVE9AfxC
 6dQUSoRX0Q0hYdlXBlRzHNVe+4bwlCN+ADfR9TmXtA==
X-Google-Smtp-Source: APXvYqzxa6k1RXxyRnJ7m1wF7wJgwzc+l90Oa2P6408VZnjT7yIceyBMmq0y0ocLrushHIzYfzfGRi1TZ2X58HUfSGc=
X-Received: by 2002:a02:770a:: with SMTP id g10mr4932288jac.15.1565877291690; 
 Thu, 15 Aug 2019 06:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
In-Reply-To: <20190815065117.GA23761@lst.de>
From: Rob Clark <robdclark@chromium.org>
Date: Thu, 15 Aug 2019 06:54:39 -0700
Message-ID: <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm+dma: cache support for arm, etc
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 16 Aug 2019 08:03:08 +1000
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14, 2019 at 11:51 PM Christoph Hellwig <hch@lst.de> wrote:
>
> As said before I don't think these low-level helpers are the
> right API to export, but even if they did you'd just cover a tiny
> subset of the architectures.

Are you thinking instead something like:

void dma_sync_sg_for_{cpu,device}(struct device *dev, struct scatterlist *sgl,
                                  int nents, enum dma_data_direction dir)
{
    for_each_sg(sgl, sg, nents, i) {
        arch_sync_dma_for_..(dev, sg_phys(sg), sg->length, dir);
    }
}
EXPORT_SYMBOL_GPL(dma_sync_sg_for_..)

or did you have something else in mind?

I guess something like this would avoid figuring out *which* archs
actually build drm..


> Also to distil the previous thread - if you remap memory to uncached
> the helper to use is arch_dma_prep_coherent, which does a writeback+
> invalidate everywhere, and there is no need to clean up after a
> long-term uncached mapping.  We might still get speculations into
> that area, if we don't remap the direct mapping, but it isn't like
> invalidting that just before freeing the memory is going to help
> anyone.

hmm, IIUC the aarch64 cache instructions, what I'm doing now is equiv
to what I would get with dma_map_sg(DMA_BIDIRECTIONAL) and
arch_dma_prep_coherent() is equiv to what I'd get w/ DMA_FROM_DEVICE
(but a single pass instead of separate inv+clean passes)..

but I can respin this with a single dma_prep_coherent_sg() which uses
arch_dma_prep_coherent()..

> Also it seems like patches 5 and 6 are missing in my inbox.

Hmm, not entirely sure why.. you should be on the cc list for each
individual patch.

But here is the patchwork link if you want to see them:

https://patchwork.freedesktop.org/series/65211/

BR,
-R
