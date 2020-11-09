Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF92AC3C5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 19:25:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVKDD1WcNzDqNf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 05:25:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Pxyzv6hb; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVK8t1GS9zDqXS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 05:22:19 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id b8so9810519wrn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Nov 2020 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4P2xmgevp6DARNoI93TPQjmwkxCbh1dSMEz+Iq7USWQ=;
 b=Pxyzv6hbcgjcrX05VpRCx6Ets2223lXot8ZTbClQRJLprCn0ly07zluqvcckUwBv2G
 NIq6z87PB5x9f1wUlv638Irwanc+OCehWWNhnOFFti+l0O7APSHjCjOl9+k8Py5fD6m9
 eUpg7v2rXyNZtFFFL5AWVl1eAmjGjlADa7/4FvXsH5K8UheAwCD+/fH3EMyvjWDiOJnR
 o/SHANbbNGirUUevHyRC0LQBOS2jxr2hOW4gi0YMIrz48DvJrVIRIgs8jWlx4/g9EeoX
 e4kt601ZYAkpa0jtbL1BheC/y7YKMhB1t8j8y3TcDYijFThVu98lbFsKHZPh0lS2XuxR
 q3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4P2xmgevp6DARNoI93TPQjmwkxCbh1dSMEz+Iq7USWQ=;
 b=BwvdyyMvOOxwgtt9GHjCX0cjrb0uYC1nc7DFeT1J66bpZMlt4GTIuCTvX6UXTJlf9L
 q2PnDM1kUIAYMqAy20SaHQnS233vbyOrJlm30qeGANW3NsI5qau2SoQU+F/Z4IGtVyz9
 tClbxk+GlL2w4I0IKJRFrQfphIi7k5uvnX52ovUA/JJydJPSA+R2STCMJt0xdViQt06g
 +te6rRzZtvd8lJiA98bdfj4igUiyngn4cRiXpymelw/BhYHBm3IMlGAXvLads6PdnHRa
 5PnftqSUnbgDZr35m4lFbSMLZUPcktFVYPhd9LEhitF+5X8u9vdlGpzD1TbRVv2adZ0w
 ax/A==
X-Gm-Message-State: AOAM531GXhCNBd05rnYJGhEYUgS4pRRbotnZSFP8yiuWEVuaBKpkickU
 gC/7fasFeczXShltpCzz8+9AFA==
X-Google-Smtp-Source: ABdhPJxhRwyrEVueE23+RLeJQ/TbrawEL5WZ/GkvIUQxW/l/GeVywuz/qg1kBRs7igqCfZa2ZMZnvw==
X-Received: by 2002:adf:de85:: with SMTP id w5mr4447254wrl.90.1604946133526;
 Mon, 09 Nov 2020 10:22:13 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:12 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 00/23] Rid W=1 warnings in MTD
Date: Mon,  9 Nov 2020 18:21:43 +0000
Message-Id: <20201109182206.3037326-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sergey Lapin <slapin@ossfans.org>,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Choudary Kalluri <punnaia@xilinx.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Sumit Semwal <sumit.semwal@linaro.org>, Paul Mackerras <paulus@samba.org>,
 Dan Brown <dan_brown@ieee.org>, linux-samsung-soc@vger.kernel.org,
 Adrian Hunter <ext-adrian.hunter@nokia.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Gleixner <gleixner@linutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-media@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Dmitriy B <rzk333@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Jochen=20Sch=C3=A4uble?= <psionic@psionic.de>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>,
 Nicolas Pitre <nico@fluxnic.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Richard Weinberger <richard@nod.at>,
 Jian Zhang <jzhang@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

v2 => v3:
  - Reworded subject lines

v1 => v2:
  - Added tags
  - Satisfied Miquel's review comments
  
Lee Jones (23):
  mtd: mtdpart: Fix misdocumented function parameter 'mtd'
  mtd: devices: phram: File headers are not good candidates for
    kernel-doc
  mtd: onenand: onenand_base: Fix expected kernel-doc formatting
  mtd: devices: docg3: Fix kernel-doc 'bad line' and 'excessive doc'
    issues
  mtd: Fix misspelled function parameter 'section'
  mtd: onenand: onenand_bbt: Fix expected kernel-doc formatting
  mtd: spi-nor: hisi-sfc: Demote non-conformant kernel-doc
  mtd: ubi: build: Document 'ubi_num' in struct mtd_dev_param
  mtd: spinand: toshiba: Demote non-conformant kernel-doc header
  mtd: ubi: kapi: Correct documentation for 'ubi_leb_read_sg's 'sgl'
    parameter
  mtd: ubi: eba: Fix a couple of misdocumentation issues
  mtd: ubi: wl: Fix a couple of kernel-doc issues
  mtd: rawnand: brcmnand: Demote non-conformant kernel-doc headers
  mtd: ubi: gluebi: Fix misnamed function parameter documentation
  mtd: rawnand: diskonchip: Marking unused variables as __always_unused
  mtd: rawnand: cafe_nand: Remove superfluous param doc and add another
  mtd: rawnand: s3c2410: Add documentation for 2 missing struct members
  mtd: rawnand: omap_elm: Finish half populated function header, demote
    empty ones
  mtd: rawnand: omap2: Fix a bunch of kernel-doc misdemeanours
  mtd: rawnand: sunxi: Document 'sunxi_nfc's 'caps' member
  mtd: rawnand: arasan: Document 'anfc_op's 'buf' member
  mtd: onenand: Fix some kernel-doc misdemeanours
  mtd: devices: powernv_flash: Add function names to headers and fix
    'dev'

 drivers/mtd/devices/docg3.c                   |   5 +-
 drivers/mtd/devices/phram.c                   |   2 +-
 drivers/mtd/devices/powernv_flash.c           |   5 +-
 drivers/mtd/mtdcore.c                         |   2 +-
 drivers/mtd/mtdpart.c                         |   2 +-
 drivers/mtd/nand/onenand/onenand_base.c       | 444 +++++++++---------
 drivers/mtd/nand/onenand/onenand_bbt.c        |  32 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c |   1 +
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      |   6 +-
 drivers/mtd/nand/raw/cafe_nand.c              |   2 +-
 drivers/mtd/nand/raw/diskonchip.c             |   4 +-
 drivers/mtd/nand/raw/omap2.c                  |  18 +-
 drivers/mtd/nand/raw/omap_elm.c               |   7 +-
 drivers/mtd/nand/raw/s3c2410.c                |   4 +-
 drivers/mtd/nand/raw/sunxi_nand.c             |   1 +
 drivers/mtd/nand/spi/toshiba.c                |   2 +-
 drivers/mtd/spi-nor/controllers/hisi-sfc.c    |   2 +-
 drivers/mtd/ubi/build.c                       |   1 +
 drivers/mtd/ubi/eba.c                         |   3 +-
 drivers/mtd/ubi/gluebi.c                      |   2 +-
 drivers/mtd/ubi/kapi.c                        |   2 +-
 drivers/mtd/ubi/wl.c                          |   3 +-
 22 files changed, 278 insertions(+), 272 deletions(-)

Cc: Adrian Hunter <ext-adrian.hunter@nokia.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Choudary Kalluri <punnaia@xilinx.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Dan Brown <dan_brown@ieee.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Dmitriy B <rzk333@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Jian Zhang <jzhang@ti.com>
Cc: "Jochen Schäuble" <psionic@psionic.de>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-media@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Sergey Lapin <slapin@ossfans.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Gleixner <gleixner@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
-- 
2.25.1

