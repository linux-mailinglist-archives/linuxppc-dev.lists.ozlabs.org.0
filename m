Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F43692769
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 16:48:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BxcR0gHTzDqVm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 00:48:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=robdclark@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="G1P7027e";
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BxQj5C4XzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 00:39:41 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id p12so2335169iog.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uihSuMZgomyGZANDE8KD/f274IaYbI03Q2f2KOfxM+I=;
 b=G1P7027eiopfDNG6P5YZ9VLMsznbA4z4vedgr8lIVKSFnae2VedRHZ6nX8k5yHQCUK
 KT2VGNI0tUXnWAj13PW27yUJ1Je5CbSjrJc4637U4Q++6YLy84df+X0IxMvBMxp8Ga5J
 gsL2kdXf74WAqz9w/dKETVrKY5fhbOpIzd3+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uihSuMZgomyGZANDE8KD/f274IaYbI03Q2f2KOfxM+I=;
 b=dWhQoLJHQX42HFpTywHJ4jDzRkyPiOUy2x1yf2GZL+dvE8EUCHonX+qzCNP7J7Mnxe
 9my2f09YELPRFCyIWJVrc6OPoyYiucx64PoaLrQskidocdQfX/vI5P+eA4wX25XE/yZl
 Ocrz4atUi04AGxKe/E78EXbEGVikFsouoHwBWoGxU1i4spT/C1c84BgRFrixeq7dwUSs
 bT8wzHL8ceYBiEjKsfHITVKcVgZrgwcrBjRt0UIZajADZjiEyEd9+B1sM9r8vqqF8r2r
 l6Bvzi7hzoFLSkeSXi4DQKFnVqUdIU67r/U94Jmyf1hZdSAnKgD5rx49arta6JMU5gZn
 3dag==
X-Gm-Message-State: APjAAAWE+vYoviIrPFMDNhdDOvyrqahndx1j/K42KjjCHkPesstuuLLc
 xUA7hsJRf94XBK9lX3ecQM/PMQ/yNQMedVqIbL9HUA==
X-Google-Smtp-Source: APXvYqz6Nv2dbwOe9HSAvOxPraz8WQBelvTJmAdxSGjJxMIvJwbUVb+lNapnG//etYvf72f9eR76xtLaC0ncZuslMFg=
X-Received: by 2002:a02:495:: with SMTP id 143mr26534114jab.94.1566225579086; 
 Mon, 19 Aug 2019 07:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
 <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
 <20190815175346.GA19839@lst.de>
 <CAJs_Fx6am7TeDFSG=CcTT=4KwhqrZX_jnn56NaWcDkGVizuakg@mail.gmail.com>
 <20190819052337.GA16622@lst.de>
In-Reply-To: <20190819052337.GA16622@lst.de>
From: Rob Clark <robdclark@chromium.org>
Date: Mon, 19 Aug 2019 07:39:28 -0700
Message-ID: <CAJs_Fx4YfU8iqN+t-h-HxsWRd-KAasHcQaV-9p4Wz=A--5Epew@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm+dma: cache support for arm, etc
To: Christoph Hellwig <hch@lst.de>
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

On Sun, Aug 18, 2019 at 10:23 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Aug 16, 2019 at 02:04:35PM -0700, Rob Clark wrote:
> > I don't disagree about needing an API to get uncached memory (or
> > ideally just something outside of the linear map).  But I think this
> > is a separate problem.
> >
> > What I was hoping for, for v5.4, is a way to stop abusing dma_map/sync
> > for cache ops to get rid of the hack I had to make for v5.3.  And also
> > to fix vgem on non-x86.  (Unfortunately changing vgem to used cached
> > mappings breaks x86 CI, but fixes CI on arm/arm64..)  We can do that
> > without any changes in allocation.  There is still the possibility for
> > problems due to cached alias, but that has been a problem this whole
> > time, it isn't something new.
>
> But that just means we start exposing random low-level APIs that
> people will quickly abuse..  In fact even your simple plan to some
> extent already is an abuse of the intent of these functions, and
> it also requires a lot of knowledge in the driver that in the normal
> cases drivers can't know (e.g. is the device dma coherent or not).

I can agree that most drivers should use the higher level APIs.. but
not that we must prevent *all* drivers from using them.  Most of what
DMA API is trying to solve doesn't apply to a driver like drm/msm..
which is how we ended up with hacks to try and misuse the high level
API to accomplish what we need.

Perhaps we can protect the prototypes with #ifdef LOWLEVEL_DMA_API /
#endif type thing to make it more obvious to other drivers that it
probably isn't the API they should use?

BR,
-R
