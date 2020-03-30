Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F76A197D1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 15:39:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rYTx4qB5zDqM7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 00:39:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=monstr.eu
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=monstr@monstr.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=monstr-eu.20150623.gappssmtp.com
 header.i=@monstr-eu.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=tPtDy92F; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rYKh0Ts4zDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 00:32:23 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id h15so21613347wrx.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 06:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GReVM19GqlV7E1aqnFYm2Dbl1ANbJ9X/aCuGV6MPAK4=;
 b=tPtDy92FT4caRu0Go0j/xtotMfvEW73iVr1JrhXGYFiODgBmlFD4UkSG+eIhOelQ1v
 5NRavlh2gpcX1SlyM069vAdFaI3ZKdD9dSDvHljVLXWJ3JkIk5JipREpSGpx2KYJNL4B
 lUKNx7pIs3PB00N271P+OpF96/RhRouVe8Fq8IyQc6F/UKTWr5TiEVqCAe5hFUEcrP3e
 p82QUd/MGQfMz6nnMwrnGuqjrjrCFNMxq3SCpeTiEHUITZEDcO7W4FMwXpNINYDSQyH9
 M0LnX8G76+Yfc770nfxdsIFAUDW4aTKkAK5nSUe36Qpjmck2pmAr7lx+SXJc8Sz7JhQ/
 sDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GReVM19GqlV7E1aqnFYm2Dbl1ANbJ9X/aCuGV6MPAK4=;
 b=Z44+Wc4NwSIHaiT6tidDU4JCwWGRCSJjh5pCMOKvmq5VUCxC/ZfZZlE4XtosrlhdMK
 tfUQrMnAkSvO2ESGiquaUGyLCrFkEcVt4+XVYj9SCJQWNtneuK5cbq7UtTx0ACfABzzb
 GvShdDFDi6+S9dvBD4LvTnEukyGmOrGI6/c4qfplw9ZrkcnZXuBuJFLA/ff/cE+rtH4G
 xzYJ1ch+PzhyiSLGs0AFuWLUXWIhiHSDWZSwrmaPY99GCK3/f3KFFmjM10mM/FpE0LHd
 l34Gcf9CIZYhPgJ9LjBJr6lQejWDvdj6CCUkEx6hczi79n7uvMJYz63Nj2YXdRmNyLa9
 ++kQ==
X-Gm-Message-State: ANhLgQ2q/cdKXPZuKzvimTPNnq+PwBFTONzVrCEfdTvLJpDzFsFD0zwq
 CY903ljl4zRz5o0U+d5Akc4Fpg==
X-Google-Smtp-Source: ADFU+vukZhm8tPUtLxOs/XW+LNo5gAR+llcU4X818GoCkrWfN2kr6XBx/zvgubTDyo9BIxw/lYRumQ==
X-Received: by 2002:adf:bc12:: with SMTP id s18mr4492529wrg.220.1585575139439; 
 Mon, 30 Mar 2020 06:32:19 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id x6sm4823230wmi.2.2020.03.30.06.32.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 06:32:18 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, sfr@canb.auug.org.au, maz@kernel.org
Subject: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx platforms
Date: Mon, 30 Mar 2020 15:32:15 +0200
Message-Id: <cover.1585575111.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.26.0
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
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Wei Hu <weh@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

recently we wanted to update xilinx intc driver and we found that function
which we wanted to remove is still wired by ancient Xilinx PowerPC
platforms. Here is the thread about it.
https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/

I have been talking about it internally and there is no interest in these
platforms and it is also orphan for quite a long time. None is really
running/testing these platforms regularly that's why I think it makes sense
to remove them also with drivers which are specific to this platform.

U-Boot support was removed in 2017 without anybody complain about it
https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed

Based on current ppc/next.

If anyone has any objection about it, please let me know.

Thanks,
Michal

Changes in v2:
- Remove also sound/drivers/pcm-indirect2.[ch] files
  Reported-by: Takashi Iwai <tiwai@suse.de>
- Based on my chat with Arnd I removed arch/powerpc/xmon/ changes done in
  v1 to keep them the same as before. (kbuild reported some issues with it
  too)

Michal Simek (2):
  sound: ac97: Remove sound driver for ancient platform
  powerpc: Remove Xilinx PPC405/PPC440 support

 Documentation/devicetree/bindings/xilinx.txt |  143 --
 Documentation/powerpc/bootwrapper.rst        |   28 +-
 MAINTAINERS                                  |    6 -
 arch/powerpc/Kconfig.debug                   |    2 +-
 arch/powerpc/boot/Makefile                   |    7 +-
 arch/powerpc/boot/dts/Makefile               |    1 -
 arch/powerpc/boot/dts/virtex440-ml507.dts    |  406 ------
 arch/powerpc/boot/dts/virtex440-ml510.dts    |  466 -------
 arch/powerpc/boot/ops.h                      |    1 -
 arch/powerpc/boot/serial.c                   |    5 -
 arch/powerpc/boot/uartlite.c                 |   79 --
 arch/powerpc/boot/virtex.c                   |   97 --
 arch/powerpc/boot/virtex405-head.S           |   31 -
 arch/powerpc/boot/wrapper                    |    8 -
 arch/powerpc/configs/40x/virtex_defconfig    |   75 -
 arch/powerpc/configs/44x/virtex5_defconfig   |   74 -
 arch/powerpc/configs/ppc40x_defconfig        |    8 -
 arch/powerpc/configs/ppc44x_defconfig        |    8 -
 arch/powerpc/include/asm/xilinx_intc.h       |   16 -
 arch/powerpc/include/asm/xilinx_pci.h        |   21 -
 arch/powerpc/kernel/cputable.c               |   39 -
 arch/powerpc/platforms/40x/Kconfig           |   31 -
 arch/powerpc/platforms/40x/Makefile          |    1 -
 arch/powerpc/platforms/40x/virtex.c          |   54 -
 arch/powerpc/platforms/44x/Kconfig           |   37 -
 arch/powerpc/platforms/44x/Makefile          |    2 -
 arch/powerpc/platforms/44x/virtex.c          |   60 -
 arch/powerpc/platforms/44x/virtex_ml510.c    |   30 -
 arch/powerpc/platforms/Kconfig               |    4 -
 arch/powerpc/sysdev/Makefile                 |    2 -
 arch/powerpc/sysdev/xilinx_intc.c            |   88 --
 arch/powerpc/sysdev/xilinx_pci.c             |  132 --
 drivers/char/Kconfig                         |    2 +-
 drivers/video/fbdev/Kconfig                  |    2 +-
 sound/drivers/Kconfig                        |   12 -
 sound/drivers/Makefile                       |    2 -
 sound/drivers/ml403-ac97cr.c                 | 1298 ------------------
 sound/drivers/pcm-indirect2.c                |  560 --------
 sound/drivers/pcm-indirect2.h                |  127 --
 39 files changed, 7 insertions(+), 3958 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/virtex440-ml507.dts
 delete mode 100644 arch/powerpc/boot/dts/virtex440-ml510.dts
 delete mode 100644 arch/powerpc/boot/uartlite.c
 delete mode 100644 arch/powerpc/boot/virtex.c
 delete mode 100644 arch/powerpc/boot/virtex405-head.S
 delete mode 100644 arch/powerpc/configs/40x/virtex_defconfig
 delete mode 100644 arch/powerpc/configs/44x/virtex5_defconfig
 delete mode 100644 arch/powerpc/include/asm/xilinx_intc.h
 delete mode 100644 arch/powerpc/include/asm/xilinx_pci.h
 delete mode 100644 arch/powerpc/platforms/40x/virtex.c
 delete mode 100644 arch/powerpc/platforms/44x/virtex.c
 delete mode 100644 arch/powerpc/platforms/44x/virtex_ml510.c
 delete mode 100644 arch/powerpc/sysdev/xilinx_intc.c
 delete mode 100644 arch/powerpc/sysdev/xilinx_pci.c
 delete mode 100644 sound/drivers/ml403-ac97cr.c
 delete mode 100644 sound/drivers/pcm-indirect2.c
 delete mode 100644 sound/drivers/pcm-indirect2.h

-- 
2.26.0

