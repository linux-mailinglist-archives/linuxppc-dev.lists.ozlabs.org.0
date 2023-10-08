Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8167BCFF7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 22:03:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3Y4g3ycpz3vbC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 07:03:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3Y3c5x1jz308M
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 07:02:19 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyS-0001Rz-A6; Sun, 08 Oct 2023 22:02:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyL-000Ez8-3z; Sun, 08 Oct 2023 22:01:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyK-00Bezw-PY; Sun, 08 Oct 2023 22:01:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 00/20] mtd: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:23 +0200
Message-Id: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4139; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=aa6SE3gWpaHTuyfq4v/sxGd7EehqufNhl2EDrrsJWOQ=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlRlrnLPoKUeQvyaTxuFWZ/OXFizKe5m/A+PtikJ0Ukdr qwXpBI6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZiISDD7PyWTOakmExfPWSyu v9voS6C7FXdan5pmyQrjiye/v9j25eHul21Nr2RPvF76tXMKo7r99v6sA01L3h1JfFq5xXyKZmz nubtHmtecskjM6rgf+/OK9MalV7taHt85zWKwpYQ3O960UJNNvLPf4JKPp3xLzIVQ2ZltTqVbmL xX9YS5JehVlj55ynxmpmKm2jJreyNnmeueYaK7xPdoyE9a7fj14LSCk9xc86dd8zDZ8vlH9/aa9 JRi9qb7k79lncjhuLcg5IK1HNunIy3HVfa4JC4ubfZ2MmYt/LjfwOmxmAOH2Y4T1mGGdafFjjme 2fEw+XFkwDdzR96WbSda7tWGiq1heTfNPzBV0e5R8Kt5AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: David Woodhouse <David.Woodhouse@intel.com>, Hui Tang <tanghui20@huawei.com>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Li Zetao <lizetao1@huawei.com>, Zheng Yongjun <zhengyongjun3@huawei.com>, linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Yangtao Li <frank.li@vivo.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kbuild@vger.kernel.org, Joern Engel <joern@lazybastard.org>, Nicholas Piggin <npiggin@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-arm-kernel@lists.infradead.org, Michael Walle <michael@walle.cc>, kernel@pengutronix.de, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Pratyush Yadav <pratyush@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

this series converts all platform drivers below drivers/mtd to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver
core doesn't (and cannot) cope for errors during remove. The only effect
of a non-zero return value in .remove() is that the driver core emits a
warning. The device is removed anyhow and an early return from .remove()
usually yields resource leaks and/or use-after-free bugs.

All drivers touched here returned zero unconditionally in their remove
callback, so they could all be converted trivially to .remove_new().

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

As an added bonus the series starts with a minor fix and a
simplification of the txx9ndfmc driver.

The only interdependencies in this series is between the three txx9ndfmc
patches. As there are still quite a few drivers to convert, I'm happy
about every patch that makes it in. So even if there is a merge conflict
with one patch until you apply (or a different concern that doesn't
apply to all patches), please apply the remainder of this series anyhow.
I'll come back to the part that you (maybe) skipped at a later point.

Best regards
Uwe

Uwe Kleine-König (20):
  mtd: rawnand: txx9ndfmc: Mark driver struct with __refdata to prevent
    section mismatch warning
  mtd: rawnand: txx9ndfmc: Drop if block with always false condition
  mtd: bcm47xxsflash: Convert to platform remove callback returning void
  mtd: docg3: Convert to platform remove callback returning void
  mtd: phram: Convert to platform remove callback returning void
  mtd: powernv_flash: Convert to platform remove callback returning void
  mtd: spear_smi: Convert to platform remove callback returning void
  mtd: st_spi_fsm: Convert to platform remove callback returning void
  mtd: hyperbus: hbmc-am654: Convert to platform remove callback
    returning void
  mtd: hyperbus: rpc-if: Convert to platform remove callback returning
    void
  mtd: lpddr2_nvm: Convert to platform remove callback returning void
  mtd: maps: lantiq-flash: Convert to platform remove callback returning
    void
  mtd: maps: physmap-core: Convert to platform remove callback returning
    void
  mtd: maps: plat-ram: Convert to platform remove callback returning
    void
  mtd: maps: pxa2xx-flash: Convert to platform remove callback returning
    void
  mtd: maps: sa1100-flash: Convert to platform remove callback returning
    void
  mtd: maps: sun_uflash: Convert to platform remove callback returning
    void
  mtd: rawnand: txx9ndfmc: Convert to platform remove callback returning
    void
  mtd: spi-nor: hisi-sfc: Convert to platform remove callback returning
    void
  mtd: spi-nor: nxp-spifi: Convert to platform remove callback returning
    void

 drivers/mtd/devices/bcm47xxsflash.c         |  6 ++----
 drivers/mtd/devices/docg3.c                 |  5 ++---
 drivers/mtd/devices/phram.c                 |  6 ++----
 drivers/mtd/devices/powernv_flash.c         |  6 ++----
 drivers/mtd/devices/spear_smi.c             |  6 ++----
 drivers/mtd/devices/st_spi_fsm.c            |  6 ++----
 drivers/mtd/hyperbus/hbmc-am654.c           |  6 ++----
 drivers/mtd/hyperbus/rpc-if.c               |  6 ++----
 drivers/mtd/lpddr/lpddr2_nvm.c              |  6 ++----
 drivers/mtd/maps/lantiq-flash.c             |  6 ++----
 drivers/mtd/maps/physmap-core.c             |  5 ++---
 drivers/mtd/maps/plat-ram.c                 |  8 +++-----
 drivers/mtd/maps/pxa2xx-flash.c             |  5 ++---
 drivers/mtd/maps/sa1100-flash.c             |  6 ++----
 drivers/mtd/maps/sun_uflash.c               |  6 ++----
 drivers/mtd/nand/raw/txx9ndfmc.c            | 15 +++++++++------
 drivers/mtd/spi-nor/controllers/hisi-sfc.c  |  5 ++---
 drivers/mtd/spi-nor/controllers/nxp-spifi.c |  6 ++----
 18 files changed, 44 insertions(+), 71 deletions(-)


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.40.1

