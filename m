Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D4353E1BD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 10:43:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGn8N3yFKz3dqW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 18:43:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nqkhvRnQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nqkhvRnQ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGn5v4jvgz3bqs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 18:41:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 667916125D;
	Mon,  6 Jun 2022 08:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA3DC34119;
	Mon,  6 Jun 2022 08:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654504897;
	bh=D+RdnsGxCjpna2nFhDsPH8yn1kQWXeuteyiCbSjG4Ok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nqkhvRnQT5TdcQzFwYUC5t6BbcwuV7Wpx2G1o5hTpanlR8yXaV4ODVU7ew7jL8DvO
	 l3JTVw7DKobxXEKQZ3heVLvDfhUmjB940bcalu6UvoP2LwHrYPpKg12kYzTLQS6pKT
	 kf317YxZeSp6jD/5DgCpKbSN6CjRhym31MHdvdZtORbIwmeGN1epari6VDm6Zv3KZl
	 sRRdHvKbw8lAF0HX5L+i6MurK8fE/6XIhEVBIspfhVP5cePJ7g5c65vcGINxSZpFqa
	 vlwgUpxU3YlmZrSSRp2xN6dqcrwPKgCERmeHhrZ2pBVMMXljYfaBR5K2rCGXZ4IYSq
	 D/00l/vISah5w==
From: Arnd Bergmann <arnd@kernel.org>
To: 
Subject: [PATCH 3/6] media: sta2x11: remove VIRT_TO_BUS dependency
Date: Mon,  6 Jun 2022 10:41:06 +0200
Message-Id: <20220606084109.4108188-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220606084109.4108188-1-arnd@kernel.org>
References: <20220606084109.4108188-1-arnd@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, linuxppc-dev@lists.ozlabs.org, Denis Efremov <efremov@linux.com>, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

This driver does not use the virt_to_bus() function, though it
depends on x86 specific fixups in the swiotlb code, which was
last rewritten in commit e380a0394c36 ("x86/PCI: sta2x11: use
default DMA address translation").

It is possible that the driver still fails to build on some
architectures that are missing CONFIG_VIRT_TO_BUS, but it is
always set on x86 machines with the STA2X11 platform enabled.

More likely though is that it was never meant to depend on
CONFIG_VIRT_TO_BUS, and the Kconfig dependency was kept from
an out-of-tree version when the driver was originally merged.

Fixes: efeb98b4e2b2 ("[media] STA2X11 VIP: new V4L2 driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/pci/sta2x11/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/sta2x11/Kconfig b/drivers/media/pci/sta2x11/Kconfig
index a96e170ab04e..118b922c08c3 100644
--- a/drivers/media/pci/sta2x11/Kconfig
+++ b/drivers/media/pci/sta2x11/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config STA2X11_VIP
 	tristate "STA2X11 VIP Video For Linux"
-	depends on PCI && VIDEO_DEV && VIRT_TO_BUS && I2C
+	depends on PCI && VIDEO_DEV && I2C
 	depends on STA2X11 || COMPILE_TEST
 	select GPIOLIB if MEDIA_SUBDRV_AUTOSELECT
 	select VIDEO_ADV7180 if MEDIA_SUBDRV_AUTOSELECT
-- 
2.29.2

