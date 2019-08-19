Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B18691C75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 07:25:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bj7L01GtzDr9W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 15:25:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bj5G0hzDzDqnR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 15:23:45 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 736F768B02; Mon, 19 Aug 2019 07:23:37 +0200 (CEST)
Date: Mon, 19 Aug 2019 07:23:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 0/6] drm+dma: cache support for arm, etc
Message-ID: <20190819052337.GA16622@lst.de>
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
 <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
 <20190815175346.GA19839@lst.de>
 <CAJs_Fx6am7TeDFSG=CcTT=4KwhqrZX_jnn56NaWcDkGVizuakg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJs_Fx6am7TeDFSG=CcTT=4KwhqrZX_jnn56NaWcDkGVizuakg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Emil Velikov <emil.velikov@collabora.com>,
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

On Fri, Aug 16, 2019 at 02:04:35PM -0700, Rob Clark wrote:
> I don't disagree about needing an API to get uncached memory (or
> ideally just something outside of the linear map).  But I think this
> is a separate problem.
> 
> What I was hoping for, for v5.4, is a way to stop abusing dma_map/sync
> for cache ops to get rid of the hack I had to make for v5.3.  And also
> to fix vgem on non-x86.  (Unfortunately changing vgem to used cached
> mappings breaks x86 CI, but fixes CI on arm/arm64..)  We can do that
> without any changes in allocation.  There is still the possibility for
> problems due to cached alias, but that has been a problem this whole
> time, it isn't something new.

But that just means we start exposing random low-level APIs that
people will quickly abuse..  In fact even your simple plan to some
extent already is an abuse of the intent of these functions, and
it also requires a lot of knowledge in the driver that in the normal
cases drivers can't know (e.g. is the device dma coherent or not).
