Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1EB5F7767
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 13:27:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkQxv1kRpz3f1Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 22:26:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cJidoh6H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cJidoh6H;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkMys1Cnnz3bmW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 20:12:34 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id p3-20020a17090a284300b0020a85fa3ffcso6698497pjf.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Oct 2022 02:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWfgfYA0Y7Bsea8YsJLHPPRZpIuS1ctJ2qwzsdNXRQQ=;
        b=cJidoh6H1uADw+7tISOibhEtRZw6/8LgPK8xnUPP26DeNpl86nNCrmcFETPzQcR1HU
         EeiKEtiHa/TEq2yCVbkNPAuc0vW4RKnX+gsl1ZZdlofZ75a90WDG3Vuzc+Qbf0Eo+Zf4
         txkWoGs9n/ABfCltcqS9/k5qefNE2E91YJPQeX59PyxFsA0iBom6oJW7gXuQRehm5R+4
         u79Pg1a2OJi1CJGNwWNEXpxA6O24alQwdDRv7Arndr0yRXAp2xeICJvSl9kHElUmPkl2
         afuzKnPKiHF2/N8t6hdI7rgCS5NbRQl5q0FjalEDXUOlmkHUNJaylPxO8O4zBhTsnOAY
         fWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWfgfYA0Y7Bsea8YsJLHPPRZpIuS1ctJ2qwzsdNXRQQ=;
        b=nzk6S0iDfQ1WCV+OHlo0Z7gQSd0wj43MI/oqyGvOBugb1WR2OdGXMBVMWe3S865W6L
         W0EyMuI9/rmqYHhJuBSMc3HdWZwqwNGTGro9TPW9sG8FTIduLBz5CZNqLPhPlT3uCRpB
         7itSicwWNQ6ErpvEsjUo3VCFk1yRYuyL8cuwyPQstI95/XM/XiSdImESVCD8K52OwoSF
         kekye6xx50h1HeTOyf2pl0QyDY4FzTrkRmn1UivYM3og+5pZ0rqFmAxArNg5z/oOwojH
         ytV+MMEwIyBZ/Fq970GDK11rSXBqBiRXJ+wuQ0rXqt6EDUkvFNjcjS5PyfItT9DJ48Is
         1LvQ==
X-Gm-Message-State: ACrzQf2eApi5cdRa0sY/2IumGbAuDDM/mhv5CS6UJOPeclAAgKXcaJGL
	NYrxxQJHoHnbJb/dYNAg9EMQPpxzv3wRaIcGUeoJmA==
X-Google-Smtp-Source: AMsMyM6zPtbJGyFd5+PZ/YLbHOSjqHhuMJPpmd2X/NiEKV7uyszzQEkaDQfomvJJ+WgdnhP03Ir6+teXOvtZIUZdWhs=
X-Received: by 2002:a17:903:246:b0:179:96b5:1ad2 with SMTP id
 j6-20020a170903024600b0017996b51ad2mr4017157plh.37.1665133951783; Fri, 07 Oct
 2022 02:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221006165346.73159-1-Jason@zx2c4.com>
In-Reply-To: <20221006165346.73159-1-Jason@zx2c4.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 7 Oct 2022 11:11:54 +0200
Message-ID: <CAPDyKFoTLHULeGJMgDxGKci+HvHjE6K8G1JLuYmXHCch+=WUKw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] treewide cleanup of random integer usage
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 07 Oct 2022 22:22:35 +1100
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
Cc: linux-wireless@vger.kernel.org, x86@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org, KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org, patches@lists.linux.dev, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Hugh Dick
 ins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, linux-nvme@lists.infradead.org, loongarch@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, linux-mmc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'
 o <tytso@mit.edu>, linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 Oct 2022 at 18:54, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Changes v2->v3:
> - Handle get_random_int() conversions too, which were overlooked before,
>   in the same way as the rest.
>
> Hi folks,
>
> This is a five part treewide cleanup of random integer handling. The
> rules for random integers are:
>
> - If you want a secure or an insecure random u64, use get_random_u64().
> - If you want a secure or an insecure random u32, use get_random_u32().
>   * The old function prandom_u32() has been deprecated for a while now
>     and is just a wrapper around get_random_u32(). Same for
>     get_random_int().
> - If you want a secure or an insecure random u16, use get_random_u16().
> - If you want a secure or an insecure random u8, use get_random_u8().
> - If you want secure or insecure random bytes, use get_random_bytes().
>   * The old function prandom_bytes() has been deprecated for a while now
>     and has long been a wrapper around get_random_bytes().
> - If you want a non-uniform random u32, u16, or u8 bounded by a certain
>   open interval maximum, use prandom_u32_max().
>   * I say "non-uniform", because it doesn't do any rejection sampling or
>     divisions. Hence, it stays within the prandom_* namespace.
>
> These rules ought to be applied uniformly, so that we can clean up the
> deprecated functions, and earn the benefits of using the modern
> functions. In particular, in addition to the boring substitutions, this
> patchset accomplishes a few nice effects:
>
> - By using prandom_u32_max() with an upper-bound that the compiler can
>   prove at compile-time is =E2=89=A465536 or =E2=89=A4256, internally get=
_random_u16()
>   or get_random_u8() is used, which wastes fewer batched random bytes,
>   and hence has higher throughput.
>
> - By using prandom_u32_max() instead of %, when the upper-bound is not a
>   constant, division is still avoided, because prandom_u32_max() uses
>   a faster multiplication-based trick instead.
>
> - By using get_random_u16() or get_random_u8() in cases where the return
>   value is intended to indeed be a u16 or a u8, we waste fewer batched
>   random bytes, and hence have higher throughput.
>
> So, based on those rules and benefits from following them, this patchset
> breaks down into the following five steps, which were done mostly
> manually:
>
> 1) Replace `prandom_u32() % max` and variants thereof with
>    prandom_u32_max(max).
>
> 2) Replace `(type)get_random_u32()` and variants thereof with
>    get_random_u16() or get_random_u8(). I took the pains to actually
>    look and see what every lvalue type was across the entire tree.
>
> 3) Replace remaining deprecated uses of prandom_u32() and
>    get_random_int() with get_random_u32().
>
> 4) Replace remaining deprecated uses of prandom_bytes() with
>    get_random_bytes().
>
> 5) Remove the deprecated and now-unused prandom_u32() and
>    prandom_bytes() inline wrapper functions.
>
> I was thinking of taking this through my random.git tree (on which this
> series is currently based) and submitting it near the end of the merge
> window, or waiting for the very end of the 6.1 cycle when there will be
> the fewest new patches brewing. If somebody with some treewide-cleanup
> experience might share some wisdom about what the best timing usually
> winds up being, I'm all ears.
>
> Please take a look! At "379 insertions(+), 422 deletions(-)", this
> should be a somewhat small patchset to review, despite it having the
> scary "treewide" moniker on it.
>
> Thanks,
> Jason
>
> Cc: Andreas Noever <andreas.noever@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Florian Westphal <fw@strlen.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: James E.J. Bottomley <jejb@linux.ibm.com>
> Cc: Jan Kara <jack@suse.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Jozsef Kadlecsik <kadlec@netfilter.org>
> Cc: KP Singh <kpsingh@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Pablo Neira Ayuso <pablo@netfilter.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Thomas Graf <tgraf@suug.ch>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yury Norov <yury.norov@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: kasan-dev@googlegroups.com
> Cc: kernel-janitors@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-block@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-nvme@lists.infradead.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-usb@vger.kernel.org
> Cc: linux-wireless@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: loongarch@lists.linux.dev
> Cc: netdev@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: x86@kernel.org
>
> Jason A. Donenfeld (5):
>   treewide: use prandom_u32_max() when possible
>   treewide: use get_random_{u8,u16}() when possible
>   treewide: use get_random_u32() when possible
>   treewide: use get_random_bytes when possible
>   prandom: remove unused functions
>
>  Documentation/networking/filter.rst           |  2 +-
>  arch/arm/kernel/process.c                     |  2 +-
>  arch/arm/kernel/signal.c                      |  2 +-
>  arch/arm64/kernel/process.c                   |  2 +-
>  arch/arm64/kernel/syscall.c                   |  2 +-
>  arch/loongarch/kernel/process.c               |  2 +-
>  arch/loongarch/kernel/vdso.c                  |  2 +-
>  arch/mips/kernel/process.c                    |  2 +-
>  arch/mips/kernel/vdso.c                       |  2 +-
>  arch/parisc/kernel/process.c                  |  2 +-
>  arch/parisc/kernel/sys_parisc.c               |  4 +-
>  arch/parisc/kernel/vdso.c                     |  2 +-
>  arch/powerpc/crypto/crc-vpmsum_test.c         |  2 +-
>  arch/powerpc/kernel/process.c                 |  2 +-
>  arch/s390/kernel/process.c                    |  4 +-
>  arch/s390/kernel/vdso.c                       |  2 +-
>  arch/s390/mm/mmap.c                           |  2 +-
>  arch/sparc/vdso/vma.c                         |  2 +-
>  arch/um/kernel/process.c                      |  2 +-
>  arch/x86/entry/vdso/vma.c                     |  2 +-
>  arch/x86/kernel/cpu/amd.c                     |  2 +-
>  arch/x86/kernel/module.c                      |  2 +-
>  arch/x86/kernel/process.c                     |  2 +-
>  arch/x86/mm/pat/cpa-test.c                    |  4 +-
>  block/blk-crypto-fallback.c                   |  2 +-
>  crypto/async_tx/raid6test.c                   |  2 +-
>  crypto/testmgr.c                              | 94 +++++++++----------
>  drivers/block/drbd/drbd_receiver.c            |  4 +-
>  drivers/char/random.c                         | 11 +--
>  drivers/dma/dmatest.c                         |  2 +-
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
>  drivers/gpu/drm/i915/i915_gem_gtt.c           |  6 +-
>  .../gpu/drm/i915/selftests/i915_selftest.c    |  2 +-
>  drivers/gpu/drm/selftests/test-drm_buddy.c    |  2 +-
>  drivers/gpu/drm/selftests/test-drm_mm.c       |  2 +-
>  drivers/infiniband/core/cma.c                 |  2 +-
>  drivers/infiniband/hw/cxgb4/cm.c              |  4 +-
>  drivers/infiniband/hw/cxgb4/id_table.c        |  4 +-
>  drivers/infiniband/hw/hfi1/tid_rdma.c         |  2 +-
>  drivers/infiniband/hw/hns/hns_roce_ah.c       |  5 +-
>  drivers/infiniband/hw/mlx4/mad.c              |  2 +-
>  drivers/infiniband/ulp/ipoib/ipoib_cm.c       |  2 +-
>  drivers/infiniband/ulp/rtrs/rtrs-clt.c        |  3 +-
>  drivers/md/bcache/request.c                   |  2 +-
>  drivers/md/raid5-cache.c                      |  2 +-
>  drivers/media/common/v4l2-tpg/v4l2-tpg-core.c |  2 +-
>  .../media/test-drivers/vivid/vivid-radio-rx.c |  4 +-
>  .../test-drivers/vivid/vivid-touch-cap.c      |  6 +-
>  drivers/misc/habanalabs/gaudi2/gaudi2.c       |  2 +-
>  drivers/mmc/core/core.c                       |  4 +-
>  drivers/mmc/host/dw_mmc.c                     |  2 +-
>  drivers/mtd/nand/raw/nandsim.c                |  8 +-
>  drivers/mtd/tests/mtd_nandecctest.c           | 12 +--
>  drivers/mtd/tests/speedtest.c                 |  2 +-
>  drivers/mtd/tests/stresstest.c                | 19 +---
>  drivers/mtd/ubi/debug.c                       |  2 +-
>  drivers/mtd/ubi/debug.h                       |  6 +-
>  drivers/net/bonding/bond_main.c               |  2 +-
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  2 +-
>  drivers/net/ethernet/broadcom/cnic.c          |  5 +-
>  .../chelsio/inline_crypto/chtls/chtls_cm.c    |  4 +-
>  .../chelsio/inline_crypto/chtls/chtls_io.c    |  4 +-
>  drivers/net/ethernet/rocker/rocker_main.c     |  8 +-
>  drivers/net/hamradio/baycom_epp.c             |  2 +-
>  drivers/net/hamradio/hdlcdrv.c                |  2 +-
>  drivers/net/hamradio/yam.c                    |  2 +-
>  drivers/net/phy/at803x.c                      |  2 +-
>  drivers/net/wireguard/selftest/allowedips.c   | 16 ++--
>  .../broadcom/brcm80211/brcmfmac/p2p.c         |  2 +-
>  .../broadcom/brcm80211/brcmfmac/pno.c         |  2 +-
>  .../net/wireless/intel/iwlwifi/mvm/mac-ctxt.c |  2 +-
>  .../net/wireless/marvell/mwifiex/cfg80211.c   |  4 +-
>  .../wireless/microchip/wilc1000/cfg80211.c    |  2 +-
>  .../net/wireless/quantenna/qtnfmac/cfg80211.c |  2 +-
>  drivers/net/wireless/st/cw1200/wsm.c          |  2 +-
>  drivers/net/wireless/ti/wlcore/main.c         |  2 +-
>  drivers/nvme/common/auth.c                    |  2 +-
>  drivers/scsi/cxgbi/cxgb4i/cxgb4i.c            |  4 +-
>  drivers/scsi/fcoe/fcoe_ctlr.c                 |  4 +-
>  drivers/scsi/lpfc/lpfc_hbadisc.c              |  6 +-
>  drivers/scsi/qedi/qedi_main.c                 |  2 +-
>  drivers/target/iscsi/cxgbit/cxgbit_cm.c       |  2 +-
>  drivers/thunderbolt/xdomain.c                 |  2 +-
>  drivers/video/fbdev/uvesafb.c                 |  2 +-
>  fs/ceph/inode.c                               |  2 +-
>  fs/ceph/mdsmap.c                              |  2 +-
>  fs/exfat/inode.c                              |  2 +-
>  fs/ext2/ialloc.c                              |  3 +-
>  fs/ext4/ialloc.c                              |  7 +-
>  fs/ext4/ioctl.c                               |  4 +-
>  fs/ext4/mmp.c                                 |  2 +-
>  fs/ext4/super.c                               |  7 +-
>  fs/f2fs/gc.c                                  |  2 +-
>  fs/f2fs/namei.c                               |  2 +-
>  fs/f2fs/segment.c                             |  8 +-
>  fs/fat/inode.c                                |  2 +-
>  fs/nfsd/nfs4state.c                           |  4 +-
>  fs/ntfs3/fslog.c                              |  6 +-
>  fs/ubifs/debug.c                              | 10 +-
>  fs/ubifs/journal.c                            |  2 +-
>  fs/ubifs/lpt_commit.c                         | 14 +--
>  fs/ubifs/tnc_commit.c                         |  2 +-
>  fs/xfs/libxfs/xfs_alloc.c                     |  2 +-
>  fs/xfs/libxfs/xfs_ialloc.c                    |  4 +-
>  fs/xfs/xfs_error.c                            |  2 +-
>  fs/xfs/xfs_icache.c                           |  2 +-
>  fs/xfs/xfs_log.c                              |  2 +-
>  include/linux/nodemask.h                      |  2 +-
>  include/linux/prandom.h                       | 12 ---
>  include/linux/random.h                        |  5 -
>  include/net/netfilter/nf_queue.h              |  2 +-
>  include/net/red.h                             |  2 +-
>  include/net/sock.h                            |  2 +-
>  kernel/bpf/bloom_filter.c                     |  2 +-
>  kernel/bpf/core.c                             |  6 +-
>  kernel/bpf/hashtab.c                          |  2 +-
>  kernel/bpf/verifier.c                         |  2 +-
>  kernel/kcsan/selftest.c                       |  4 +-
>  kernel/locking/test-ww_mutex.c                |  4 +-
>  kernel/time/clocksource.c                     |  2 +-
>  lib/cmdline_kunit.c                           |  4 +-
>  lib/fault-inject.c                            |  2 +-
>  lib/find_bit_benchmark.c                      |  4 +-
>  lib/kobject.c                                 |  2 +-
>  lib/random32.c                                |  4 +-
>  lib/reed_solomon/test_rslib.c                 | 12 +--
>  lib/sbitmap.c                                 |  4 +-
>  lib/test-string_helpers.c                     |  2 +-
>  lib/test_fprobe.c                             |  2 +-
>  lib/test_hexdump.c                            | 10 +-
>  lib/test_kasan.c                              |  6 +-
>  lib/test_kprobes.c                            |  2 +-
>  lib/test_list_sort.c                          |  2 +-
>  lib/test_min_heap.c                           |  6 +-
>  lib/test_objagg.c                             |  2 +-
>  lib/test_rhashtable.c                         |  6 +-
>  lib/test_vmalloc.c                            | 19 +---
>  lib/uuid.c                                    |  2 +-
>  mm/migrate.c                                  |  2 +-
>  mm/shmem.c                                    |  2 +-
>  mm/slab.c                                     |  2 +-
>  mm/slub.c                                     |  2 +-
>  net/802/garp.c                                |  2 +-
>  net/802/mrp.c                                 |  2 +-
>  net/ceph/mon_client.c                         |  2 +-
>  net/ceph/osd_client.c                         |  2 +-
>  net/core/neighbour.c                          |  2 +-
>  net/core/pktgen.c                             | 47 +++++-----
>  net/core/stream.c                             |  2 +-
>  net/dccp/ipv4.c                               |  4 +-
>  net/ipv4/datagram.c                           |  2 +-
>  net/ipv4/igmp.c                               |  6 +-
>  net/ipv4/inet_connection_sock.c               |  2 +-
>  net/ipv4/inet_hashtables.c                    |  2 +-
>  net/ipv4/ip_output.c                          |  2 +-
>  net/ipv4/route.c                              |  4 +-
>  net/ipv4/tcp_cdg.c                            |  2 +-
>  net/ipv4/tcp_ipv4.c                           |  4 +-
>  net/ipv4/udp.c                                |  2 +-
>  net/ipv6/addrconf.c                           |  8 +-
>  net/ipv6/ip6_flowlabel.c                      |  2 +-
>  net/ipv6/mcast.c                              | 10 +-
>  net/ipv6/output_core.c                        |  2 +-
>  net/mac80211/rc80211_minstrel_ht.c            |  2 +-
>  net/mac80211/scan.c                           |  2 +-
>  net/netfilter/ipvs/ip_vs_conn.c               |  2 +-
>  net/netfilter/ipvs/ip_vs_twos.c               |  4 +-
>  net/netfilter/nf_nat_core.c                   |  4 +-
>  net/netfilter/xt_statistic.c                  |  2 +-
>  net/openvswitch/actions.c                     |  2 +-
>  net/packet/af_packet.c                        |  2 +-
>  net/rds/bind.c                                |  2 +-
>  net/sched/act_gact.c                          |  2 +-
>  net/sched/act_sample.c                        |  2 +-
>  net/sched/sch_cake.c                          |  8 +-
>  net/sched/sch_netem.c                         | 22 ++---
>  net/sched/sch_pie.c                           |  2 +-
>  net/sched/sch_sfb.c                           |  2 +-
>  net/sctp/socket.c                             |  4 +-
>  net/sunrpc/auth_gss/gss_krb5_wrap.c           |  4 +-
>  net/sunrpc/cache.c                            |  2 +-
>  net/sunrpc/xprt.c                             |  2 +-
>  net/sunrpc/xprtsock.c                         |  2 +-
>  net/tipc/socket.c                             |  2 +-
>  net/unix/af_unix.c                            |  2 +-
>  net/xfrm/xfrm_state.c                         |  2 +-
>  186 files changed, 379 insertions(+), 422 deletions(-)
>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC

Kind regards
Uffe
