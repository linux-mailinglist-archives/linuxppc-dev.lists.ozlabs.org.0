Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 885368E045
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 00:04:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4683Wy05FDzDr1Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 08:04:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=robdclark@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QsFDkKja"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4683V82QhPzDqt0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 08:02:37 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id b24so193102pfp.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 15:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3oPlzvlPf3Rzc4cpgcIkobJmF5pbYWdwPlsySxjkAj0=;
 b=QsFDkKjaHSdT6ZUi+JJ7HPBAsxs4M45zVvakOMVd/f1v8yDy4Pe2ktVQIi6TcbQGs4
 +0rdap1k9RPnLJwD5sJG3RNHYDxiRp0DpzJa5rPFrWQYYZMFBDR8URhlW4LyWGSqLgDi
 v3nOVWGRXtObRIix2efxPL/FTSeXBV1Vh2bbPdS8+IInFkXk++Du4gd7sLVkXZIY9UIM
 oYSDp2D5AqVVqNwWUutnIu0wP3/+nwxYcTorj1iRwjtVLn7UIscolWVJf7FLpK6z/dax
 WEJZB9Z60/rNmcFNC4/QIfBMeYoSOqxs+6j8XIafhDh0BI51LPUU+2Cx0JIDhTMJ/+No
 RmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3oPlzvlPf3Rzc4cpgcIkobJmF5pbYWdwPlsySxjkAj0=;
 b=ixnQFrl/CjqzRycYuLvlGzW0g2rHDwYgMRG4RYgJIyMxAe/r+m/Q4+xAKSiK+0MrkM
 k5StfKkI/ADhj7iHK5DFr+nlP3YUWyuJWvhjc6iKDz2NKfNujVQgwmL+3j1/HX8FHQnk
 ANwBJs7/vVPF+RuRo79HwEdxc3xWXjd17g41gHtN9F2AdJbaSrcP0zdHoHElyLP4DiWS
 Kcw8V8m/juBgtDQmUkrW1PwsLYhBWMQe02ir2K6Wvr0987yUs1Z+pMLq3U8voG1r/iyU
 3BaSCCgSJf70hukV6Fk7pK6ehsgciidq2Ctw5z86JnWQvRW1MCch2qCq5AwyRAdCQNyw
 GMRg==
X-Gm-Message-State: APjAAAX8eXdQ8pyyGAc7UkeIbtAqycCidg9bs2lCDCFaj0T6p1CvsFeE
 R1oSn2Cpm6e3fIvLa8m6K8c=
X-Google-Smtp-Source: APXvYqzCBQPKmpeFEXKLaI6VKfcy6SgcaxLxPzYa/x4WSu39Iu3WSkxBPKAcusu6di8joy6ZTM5XDQ==
X-Received: by 2002:a62:4e09:: with SMTP id c9mr2268787pfb.130.1565820153895; 
 Wed, 14 Aug 2019 15:02:33 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id d129sm896504pfc.168.2019.08.14.15.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 15:02:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm+dma: cache support for arm, etc
Date: Wed, 14 Aug 2019 14:59:55 -0700
Message-Id: <20190814220011.26934-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Chris Wilson <chris@chris-wilson.co.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "moderated list:ARM64 PORT AARCH64 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Deepak Sharma <deepak.sharma@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Doug Anderson <armlinux@m.disordat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Enrico Weigelt <info@metux.net>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Rob Clark <robdclark@chromium.org>

This is a replacement for a previous patches[1] that was adding arm64
support for drm_clflush.  I've also added a patch to solve a similar
cache issue in vgem.

The first few patches just export arch_sync_dma_for_*().  Possibly
instead the EXPORT_SYMBOL_GPL() should be somewere central, rather
than per-arch (but where would make sense?)

The fourth adds (and exports) these ops for arch/arm.  (Arnd Bergmann
mentioned on IRC that Christoph Hellwig was working on this already
for arch/arm which could replace the fourth patch.)

The last two patches actually fix things.

[1] https://patchwork.freedesktop.org/series/64732/

Rob Clark (6):
  arm64: export arch_sync_dma_for_*()
  mips: export arch_sync_dma_for_*()
  powerpc: export arch_sync_dma_for_*()
  arm: add arch_sync_dma_for_*()
  drm/msm: stop abusing DMA API
  drm/vgem: fix cache synchronization on arm/arm64 (take two)

 arch/arm/Kconfig                  |   2 +
 arch/arm/mm/dma-mapping-nommu.c   |  14 +++
 arch/arm/mm/dma-mapping.c         |  28 ++++++
 arch/arm64/mm/dma-mapping.c       |   2 +
 arch/arm64/mm/flush.c             |   2 +
 arch/mips/mm/dma-noncoherent.c    |   2 +
 arch/powerpc/mm/dma-noncoherent.c |   2 +
 drivers/gpu/drm/drm_cache.c       |  20 ++++-
 drivers/gpu/drm/msm/msm_gem.c     |  37 +++-----
 drivers/gpu/drm/vgem/vgem_drv.c   | 145 ++++++++++++++++++++----------
 include/drm/drm_cache.h           |   4 +
 11 files changed, 182 insertions(+), 76 deletions(-)

-- 
2.21.0

