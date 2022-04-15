Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DAA502F23
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 21:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kg5XW43jlz3cGd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 05:11:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cweHab1G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cweHab1G; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kg5TN5RzVz3bWG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 05:08:40 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFA1A61BAC;
 Fri, 15 Apr 2022 19:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7C9C385A4;
 Fri, 15 Apr 2022 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650049716;
 bh=o4MX8UK2Ayi2FU0PSYzgH1W7goqrO0bs8RfgMd3gAVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cweHab1Gdg6zDAzegVfOlAcwLW0ZwyDacOnsclAJlJquxFoXV6FmDWc3aQd5lF7UK
 BCj2JeCoOaAm0MV5HhGtowfZX5F/tpn4QARtoxmMlDxgFzQr3KWzQOHH9Zv6W34+Ez
 uNkS2GjiA9M5zDb41OTuhdLm6hl1safKJ+7xyYZyNWUPI8UwsntYxXmlul+LZVXL5/
 6TLKtRMfgV0r8kxWTabiWAdVZHYscdPBqfySCuuha7mxFzQ9t60jFezg3F9f+tqhsV
 mFqTtjcCEbIr4trxsLK8ztpzsoa9De11Z2III0lnWhLbz2LgR9UQpK60LlFOKjysH2
 SxpHeGecr7ioA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Chas Williams <3chas3@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH 3/7] net: remove comments that mention obsolete __SLOW_DOWN_IO
Date: Fri, 15 Apr 2022 14:08:13 -0500
Message-Id: <20220415190817.842864-4-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415190817.842864-1-helgaas@kernel.org>
References: <20220415190817.842864-1-helgaas@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/atm/nicstarmac.c                     | 5 -----
 drivers/net/ethernet/dec/tulip/winbond-840.c | 2 --
 drivers/net/ethernet/natsemi/natsemi.c       | 2 --
 3 files changed, 9 deletions(-)

diff --git a/drivers/atm/nicstarmac.c b/drivers/atm/nicstarmac.c
index e0dda9062e6b..791f69a07ddf 100644
--- a/drivers/atm/nicstarmac.c
+++ b/drivers/atm/nicstarmac.c
@@ -14,11 +14,6 @@ typedef void __iomem *virt_addr_t;
 
 #define CYCLE_DELAY 5
 
-/*
-   This was the original definition
-#define osp_MicroDelay(microsec) \
-    do { int _i = 4*microsec; while (--_i > 0) { __SLOW_DOWN_IO; }} while (0)
-*/
 #define osp_MicroDelay(microsec) {unsigned long useconds = (microsec); \
                                   udelay((useconds));}
 /*
diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index 86b1d23eba83..1db19463fd46 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -474,8 +474,6 @@ static int w840_probe1(struct pci_dev *pdev, const struct pci_device_id *ent)
    No extra delay is needed with 33Mhz PCI, but future 66Mhz access may need
    a delay.  Note that pre-2.0.34 kernels had a cache-alignment bug that
    made udelay() unreliable.
-   The old method of using an ISA access as a delay, __SLOW_DOWN_IO__, is
-   deprecated.
 */
 #define eeprom_delay(ee_addr)	ioread32(ee_addr)
 
diff --git a/drivers/net/ethernet/natsemi/natsemi.c b/drivers/net/ethernet/natsemi/natsemi.c
index 82a22711ce45..50bca486a244 100644
--- a/drivers/net/ethernet/natsemi/natsemi.c
+++ b/drivers/net/ethernet/natsemi/natsemi.c
@@ -989,8 +989,6 @@ static int natsemi_probe1(struct pci_dev *pdev, const struct pci_device_id *ent)
    No extra delay is needed with 33Mhz PCI, but future 66Mhz access may need
    a delay.  Note that pre-2.0.34 kernels had a cache-alignment bug that
    made udelay() unreliable.
-   The old method of using an ISA access as a delay, __SLOW_DOWN_IO__, is
-   deprecated.
 */
 #define eeprom_delay(ee_addr)	readl(ee_addr)
 
-- 
2.25.1

