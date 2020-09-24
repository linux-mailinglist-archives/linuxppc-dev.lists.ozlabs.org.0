Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFE1276792
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 06:14:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxhXF668ZzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 14:14:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+004c9619e75dbad284dd+6241+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=ok8HIlG2; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxhVZ0khyzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 14:13:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=FU6oRrPplZmyDsu20sYhT2qTH9puwdhmDJjBRkEjTfg=; b=ok8HIlG29qfixZOaEUSVt6os1U
 WD1m0uNIlV/6LMGz8lNwj3P9NrD12J4Gk6IeHxUxNHAxm954vmS0lokk3CFJEzmvjFVyn7WxuzQr1
 CsFPO5frfSCPpzQLJBecBmGQaRbd9WREliXSoer82kQ5J/rKavPDbnBDXuBQ1YydzJXRNBwENd/i3
 8YlnBCRv55gU20ArxS6i+Ag+WG4xA/bbERtH0vgoN1RogOGozDvHlEw1zDWFufgMmMIv/RJUBBHUo
 1Wsgf8SorBsv94UmLG3NhZZZ/R6YxzPqboCeFfhKaXmTIEgh+RXmP8CUjQ67C6bQN1+nhUyrdcEhZ
 oP1Kn2bA==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLId5-0001XK-QF; Thu, 24 Sep 2020 04:13:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: switch 85xx defconfigs from legacy ide to libata
Date: Thu, 24 Sep 2020 06:13:10 +0200
Message-Id: <20200924041310.520970-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Switch the 85xx defconfigs from the soon to be removed legacy ide
driver to libata.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/configs/85xx/mpc85xx_cds_defconfig | 6 +++---
 arch/powerpc/configs/85xx/tqm8540_defconfig     | 6 +++---
 arch/powerpc/configs/85xx/tqm8541_defconfig     | 6 +++---
 arch/powerpc/configs/85xx/tqm8555_defconfig     | 6 +++---
 arch/powerpc/configs/85xx/tqm8560_defconfig     | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/configs/85xx/mpc85xx_cds_defconfig b/arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
index 0683d8c292a89b..cea72e85ed2614 100644
--- a/arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
+++ b/arch/powerpc/configs/85xx/mpc85xx_cds_defconfig
@@ -29,9 +29,9 @@ CONFIG_SYN_COOKIES=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=32768
-CONFIG_IDE=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_VIA82CXXX=y
+CONFIG_ATA=y
+CONFIG_ATA_GENERIC=y
+CONFIG_PATA_VIA=y
 CONFIG_NETDEVICES=y
 CONFIG_GIANFAR=y
 CONFIG_E1000=y
diff --git a/arch/powerpc/configs/85xx/tqm8540_defconfig b/arch/powerpc/configs/85xx/tqm8540_defconfig
index 98982a0e82d804..bbf040aa1f9aa7 100644
--- a/arch/powerpc/configs/85xx/tqm8540_defconfig
+++ b/arch/powerpc/configs/85xx/tqm8540_defconfig
@@ -30,9 +30,9 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=32768
-CONFIG_IDE=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_VIA82CXXX=y
+CONFIG_ATA=y
+CONFIG_ATA_GENERIC=y
+CONFIG_PATA_VIA=y
 CONFIG_NETDEVICES=y
 CONFIG_GIANFAR=y
 CONFIG_E100=y
diff --git a/arch/powerpc/configs/85xx/tqm8541_defconfig b/arch/powerpc/configs/85xx/tqm8541_defconfig
index a6e21db1dafe3a..523ad8dcfd9d08 100644
--- a/arch/powerpc/configs/85xx/tqm8541_defconfig
+++ b/arch/powerpc/configs/85xx/tqm8541_defconfig
@@ -30,9 +30,9 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=32768
-CONFIG_IDE=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_VIA82CXXX=y
+CONFIG_ATA=y
+CONFIG_ATA_GENERIC=y
+CONFIG_PATA_VIA=y
 CONFIG_NETDEVICES=y
 CONFIG_GIANFAR=y
 CONFIG_E100=y
diff --git a/arch/powerpc/configs/85xx/tqm8555_defconfig b/arch/powerpc/configs/85xx/tqm8555_defconfig
index ca1de3979474ba..0032ce1e8c9cbf 100644
--- a/arch/powerpc/configs/85xx/tqm8555_defconfig
+++ b/arch/powerpc/configs/85xx/tqm8555_defconfig
@@ -30,9 +30,9 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=32768
-CONFIG_IDE=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_VIA82CXXX=y
+CONFIG_ATA=y
+CONFIG_ATA_GENERIC=y
+CONFIG_PATA_VIA=y
 CONFIG_NETDEVICES=y
 CONFIG_GIANFAR=y
 CONFIG_E100=y
diff --git a/arch/powerpc/configs/85xx/tqm8560_defconfig b/arch/powerpc/configs/85xx/tqm8560_defconfig
index ca3b8c8ef30f9c..a80b971f7d6e0b 100644
--- a/arch/powerpc/configs/85xx/tqm8560_defconfig
+++ b/arch/powerpc/configs/85xx/tqm8560_defconfig
@@ -30,9 +30,9 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=32768
-CONFIG_IDE=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_VIA82CXXX=y
+CONFIG_ATA=y
+CONFIG_ATA_GENERIC=y
+CONFIG_PATA_VIA=y
 CONFIG_NETDEVICES=y
 CONFIG_GIANFAR=y
 CONFIG_E100=y
-- 
2.28.0

