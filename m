Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32982D8EAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 12:55:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tThr34VbzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 21:55:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tTWJ4Gn9zDqcT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 21:46:52 +1100 (AEDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 58013CFF3E76FCB7C8C4;
 Wed, 16 Oct 2019 18:46:44 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 18:46:34 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <herbert@gondor.apana.org.au>, <mpm@selenic.com>, <arnd@arndb.de>,
 <gregkh@linuxfoundation.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <f.fainelli@gmail.com>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
 <bcm-kernel-feedback-list@broadcom.com>, <eric@anholt.net>,
 <wahrenst@gmx.net>, <l.stelmach@samsung.com>, <kgene@kernel.org>,
 <krzk@kernel.org>, <khilman@baylibre.com>, <dsaxena@plexity.net>,
 <patrice.chotard@st.com>
Subject: [PATCH -next 00/13] hwrng: use devm_platform_ioremap_resource() to
 simplify code
Date: Wed, 16 Oct 2019 18:46:08 +0800
Message-ID: <20191016104621.26056-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
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
Cc: linux-samsung-soc@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

devm_platform_ioremap_resource() internally have platform_get_resource()
and devm_ioremap_resource() in it. So instead of calling them separately
use devm_platform_ioremap_resource() directly.

YueHaibing (13):
  hwrng: atmel - use devm_platform_ioremap_resource() to simplify code
  hwrng: bcm2835 - use devm_platform_ioremap_resource() to simplify code
  hwrng: exynos - use devm_platform_ioremap_resource() to simplify code
  hwrng: hisi - use devm_platform_ioremap_resource() to simplify code
  hwrng: ks-sa - use devm_platform_ioremap_resource() to simplify code
  hwrng: meson - use devm_platform_ioremap_resource() to simplify code
  hwrng: npcm - use devm_platform_ioremap_resource() to simplify code
  hwrng: omap - use devm_platform_ioremap_resource() to simplify code
  hwrng: pasemi - use devm_platform_ioremap_resource() to simplify code
  hwrng: pic32 - use devm_platform_ioremap_resource() to simplify code
  hwrng: st - use devm_platform_ioremap_resource() to simplify code
  hwrng: tx4939 - use devm_platform_ioremap_resource() to simplify code
  hwrng: xgene - use devm_platform_ioremap_resource() to simplify code

 drivers/char/hw_random/atmel-rng.c   | 4 +---
 drivers/char/hw_random/bcm2835-rng.c | 5 +----
 drivers/char/hw_random/exynos-trng.c | 4 +---
 drivers/char/hw_random/hisi-rng.c    | 4 +---
 drivers/char/hw_random/ks-sa-rng.c   | 4 +---
 drivers/char/hw_random/meson-rng.c   | 4 +---
 drivers/char/hw_random/npcm-rng.c    | 4 +---
 drivers/char/hw_random/omap-rng.c    | 4 +---
 drivers/char/hw_random/pasemi-rng.c  | 4 +---
 drivers/char/hw_random/pic32-rng.c   | 4 +---
 drivers/char/hw_random/st-rng.c      | 4 +---
 drivers/char/hw_random/tx4939-rng.c  | 4 +---
 drivers/char/hw_random/xgene-rng.c   | 4 +---
 13 files changed, 13 insertions(+), 40 deletions(-)

-- 
2.7.4


