Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B938733FE60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 05:58:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1FCz5Xv5z3bqS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 15:58:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=X95wITBp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+3da9058682ed8a08391b+6416+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=X95wITBp; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1FCX4sNwz302S
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 15:58:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=irMBtb7DVN+4DAt49ti86ySGojmNnEJPOicBjBj4cMY=; b=X95wITBpAeF+TpRKQnFFC7lKIj
 OQanKRWqqfl5U/Ln26avaZ6H2sYIRG2/CJKWq4WXKPVdZY+O3R2Y033lN7LGuxJhIcTpwkp9aDr4B
 FA9+IOOkxQ6k0hMvPrEVU7OwZ8T/M+JVdZjxCLw6lRUAZpqWD2Kbw8B/LFbj5eg+V9X9zhxGznL5J
 RLsSjSaUggUMbrarHqo8GPQm8xvT75w8ZfwuwgH3DZZHquSFYAEx6u8xFX1SiSCiO6tmjjI5xswqV
 oS9E5uQbvyCss4KBtY7eFDu3TpPAjR+sSEJ/qnsISz9WHtbenqaui2e39bz0LOxGquU/oTOJAu/Rb
 LE/p5Qng==;
Received: from [2001:4bb8:18c:bb3:e1cf:ad2f:7ff7:7a0b] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMkii-002ZBU-Ou; Thu, 18 Mar 2021 04:57:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 01/10] alpha: use libata instead of the legacy ide driver
Date: Thu, 18 Mar 2021 05:56:57 +0100
Message-Id: <20210318045706.200458-2-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Switch the alpha defconfig from the legacy ide driver to libata.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/configs/defconfig | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/configs/defconfig b/arch/alpha/configs/defconfig
index 724c4075df408e..dd2dd9f0861f18 100644
--- a/arch/alpha/configs/defconfig
+++ b/arch/alpha/configs/defconfig
@@ -25,19 +25,18 @@ CONFIG_PNP=y
 CONFIG_ISAPNP=y
 CONFIG_BLK_DEV_FD=y
 CONFIG_BLK_DEV_LOOP=m
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_ALI15X3=y
-CONFIG_BLK_DEV_CMD64X=y
-CONFIG_BLK_DEV_CY82C693=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_SCSI_AIC7XXX=m
 CONFIG_AIC7XXX_CMDS_PER_DEVICE=253
 # CONFIG_AIC7XXX_DEBUG_ENABLE is not set
+CONFIG_ATA=y
+# CONFIG_SATA_PMP is not set
+CONFIG_PATA_ALI=y
+CONFIG_PATA_CMD64X=y
+CONFIG_PATA_CYPRESS=y
+CONFIG_ATA_GENERIC=y
 CONFIG_NETDEVICES=y
 CONFIG_DUMMY=m
 CONFIG_NET_ETHERNET=y
-- 
2.30.1

