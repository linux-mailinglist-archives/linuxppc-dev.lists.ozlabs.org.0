Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B21DD33FE90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 06:01:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1FHF4Zhlz3d8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 16:01:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XBg+7ubm;
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
 header.s=casper.20170209 header.b=XBg+7ubm; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1FF846gcz3c5v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 15:59:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=mqH6KDuSstLwS39mT0ePczEWX69vnztcqDBkxHzfniM=; b=XBg+7ubmm0t37QrQPz2c/WBvY8
 dtC3YDhxAjwUy5cpxnsuc7SSgT2hSLYEPvDEojx3Tu9mcNdlsPGRRKAG2Tbh6jwi43kGQuQdkFVrf
 WY+HgMNS+eg1fSCzaFR0We3k2NYO1O0rjRgFE+xXDAHiUH+5U+3QchcrRtvl/teL5iBosG83fzId1
 XpnaIH/FG+me/vASAybRjn/xx98rhf8RnRJLIKEIEZS5pmNb+2bS0TvfQvwLuhO4nO7RIKbq1vDfO
 BdEkIYSSJMqaM6ClR+wYqkb3IF3hYlVaURNyWrZlUIyhSktoDyaacNTD4I+eu9iJ1Wrd2PfjQJaGh
 0F8gRMlg==;
Received: from [2001:4bb8:18c:bb3:e1cf:ad2f:7ff7:7a0b] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lMkjp-002ZH2-Nk; Thu, 18 Mar 2021 04:58:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 06/10] MIPS: disable CONFIG_IDE in rbtx49xx_defconfig
Date: Thu, 18 Mar 2021 05:57:02 +0100
Message-Id: <20210318045706.200458-7-hch@lst.de>
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

rbtx49xx_defconfig enables CONFIG_IDE for the tx4938 and tx4939 ide
drivers, but those aren't actually used by the last known remaining user:

https://lore.kernel.org/lkml/20210107.101729.1936921832901251107.anemo@mba.ocn.ne.jp/

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/configs/rbtx49xx_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/configs/rbtx49xx_defconfig b/arch/mips/configs/rbtx49xx_defconfig
index 5e389db35fa746..69f2300107f961 100644
--- a/arch/mips/configs/rbtx49xx_defconfig
+++ b/arch/mips/configs/rbtx49xx_defconfig
@@ -44,9 +44,6 @@ CONFIG_MTD_NAND_TXX9NDFMC=m
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDE_TX4938=y
-CONFIG_BLK_DEV_IDE_TX4939=y
 CONFIG_NETDEVICES=y
 CONFIG_NE2000=y
 CONFIG_SMC91X=y
-- 
2.30.1

