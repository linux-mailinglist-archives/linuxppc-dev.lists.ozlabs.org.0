Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC61956FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 13:17:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pgp32mvpzDr80
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 23:16:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=monstr.eu
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=monstr@monstr.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=monstr-eu.20150623.gappssmtp.com
 header.i=@monstr-eu.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Q6jkqOCl; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pgj94wvkzDr70
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 23:12:39 +1100 (AEDT)
Received: by mail-wm1-x343.google.com with SMTP id g62so12095436wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 05:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hu2wO3xqKJ9lAvcooNTrI/b8de0qGuxf2k7JbWd4Z40=;
 b=Q6jkqOCl9MKMuj7vToMTE8rlnHdmKPXfMdFa71ZYlGAi8tYooU25WC0zBNxvt8ugre
 JKckVbhTVb20SPsGPwIXRIbTrIefzGABtntSmF/8WooFaYXdfhUDFxOyeEKvbr41sHZl
 yZowdsHRWSPWXRZYVZHHoNriqZKMx3xG5kzsuLd1a8NPslgWUKm2YSfeuPtzi+68Wv2a
 ARaxJsgxVlidZ/u6U0LFttsTbPh0ChR7n/ZlhrjX5SLmvqsHsN9Waj4iXwHSJEUY+6nf
 SztK0OtmzOGUqZU/1cppOBYodGLZENJ87u6tkK4qIG9GhDUKCqoUZ4CXwnbcguoT7K7Y
 KRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hu2wO3xqKJ9lAvcooNTrI/b8de0qGuxf2k7JbWd4Z40=;
 b=DVI+V+7cBVppEdttVVsc9XBEIigOf51aIDE0drQhByMvX0WOIOM6tkJobiXbgYBG6J
 ZxrfayZ03YGiLi8EVAO5QA6Gah1B16LsMt1k5if4hgHy+xxT8RsnjSV+OPRY1yR5LxI5
 wiSSWZNUacSjCcmRo2447eERyklNrgyIT3Vb8GBKCxYPoUClW9oJtpL6g3havetDSJ5n
 qkz99QC6hLRxMCmo/MAg76WVJypNFawzOFEaABZSB6uWr+XP8MJcYwHfOp6UaG2bZVzX
 q9IXpysjbAVOov31dBCkbLuwxWYIOIOh6UrylR9dnZZiKwQ5MgRi8H2PYWQv5kL+kmMO
 6crg==
X-Gm-Message-State: ANhLgQ0apZwwgmEYJRm/+vlgaaM5yr16ugwYfoWpouCwJsoYnBIOetMv
 rpG7t0ucys5Nzv5mNBDmexiEFw==
X-Google-Smtp-Source: ADFU+vsPQ8HhY6iOzEkZp/Z+//NczVx5VEWwgI18HebHQy0Av5+Y7ASAetl9QrHODkVtgQzkfKPdHQ==
X-Received: by 2002:a05:600c:234f:: with SMTP id
 15mr4996664wmq.24.1585311155571; 
 Fri, 27 Mar 2020 05:12:35 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id s11sm8399792wrw.58.2020.03.27.05.12.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 05:12:34 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, sfr@canb.auug.org.au, marc.zyngier@arm.com
Subject: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx platforms
Date: Fri, 27 Mar 2020 13:12:20 +0100
Message-Id: <cover.1585311091.git.michal.simek@xilinx.com>
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
 linux-arm-kernel@lists.infradead.org, Leonardo Bras <leonardo@linux.ibm.com>,
 devicetree@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>, Wei Hu <weh@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
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
 arch/powerpc/xmon/ppc-dis.c                  |    6 -
 arch/powerpc/xmon/ppc-opc.c                  |   23 -
 arch/powerpc/xmon/ppc.h                      |    5 -
 drivers/char/Kconfig                         |    2 +-
 drivers/video/fbdev/Kconfig                  |    2 +-
 sound/drivers/Kconfig                        |   12 -
 sound/drivers/Makefile                       |    2 -
 sound/drivers/ml403-ac97cr.c                 | 1298 ------------------
 40 files changed, 7 insertions(+), 3305 deletions(-)
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

-- 
2.26.0

