Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1B134C058
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:06:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7tD64V6cz3fh5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:06:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZLnI2Hw3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZLnI2Hw3; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t1y4T4jz3c9w
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:57:58 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id l6so26397qtq.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rk0U560xdi7ATXezYweBgD2EUyZ4bnHBlHOPTcEoREY=;
 b=ZLnI2Hw3GmiFb+BW4FldFixdVOm0/gTAYYcPGeNweT29zSncqaCxQl2ULX/m3x6yjk
 FlPvPCq6g1oh13jD6EQyG1JSSdz9G8bm3HGZ2akxZG2GJMQ9BC7QedLKEm34PtSwYA9Q
 9GLpxWPlLC/j45fuB1CB2u0k+GONoOh9eOlRvew+eCtM4IXd3/dem3muwmJ2LGUvv9pZ
 rKataNLRCg25wm/swBsArGMvPBDO2BXQknOCELLoUmLYNgIAwbOCOSxAGx2PbdugPEc1
 E84l/Bt6cNoKU6NHkm/vCejz/HyOc3AwND0Z16aeHxg7CDZpOR9OV5YCqN3yJaJzc09z
 OoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rk0U560xdi7ATXezYweBgD2EUyZ4bnHBlHOPTcEoREY=;
 b=VUyilvV4jBnCFB06UZxLlhBevVUfZZEvzSLFN1EOWOTtO/aZl0OA7mr+0Z6r1Ewr3x
 2oHP+1+2m5Qq/IYa1ws7cjjTIRaxNBE5Neq0IjJy0OI1o3uGxC2Ucxg9iN3s8c4Tp47S
 dRYKi7eX7scwivN64SVeBtOExu/QVVc9sh8yeYkIQGuelyDqA51qaao5++Wum/ZCHBky
 VTEpb/JAOS004pczpXWc+Rj1iwoGEXP+tj5dBNneioxjXpoCYvh/hTmaBucOH8ZBi1IF
 PUc6y0o/EhnWtj8ilMnTaEvQZ4HU5GUvs0IZRdnn8K4H+2fAHW/tc1P7SyPQg/HVHkfZ
 T/Fw==
X-Gm-Message-State: AOAM533U8oEvFwCT43s+nj7/MwgU/VUpS4k0fMcbNVsvVEmj46aZYI5M
 634GaN/TSpGEUW5OkcU8ETA=
X-Google-Smtp-Source: ABdhPJzfb/lAvD1VavVqudcTSNWwFXh9v8R3VckD2GeZAMNUEqCjOYPLz+1Z1e0dwqaRcAS+cSxIlw==
X-Received: by 2002:ac8:7e95:: with SMTP id w21mr19593417qtj.244.1616975876781; 
 Sun, 28 Mar 2021 16:57:56 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:56 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 24/30] Kconfig: Change Synopsys to Synopsis
Date: Mon, 29 Mar 2021 05:23:20 +0530
Message-Id: <1262e9e62498f961e5172205e66a9ef7c6f0f69d.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s/Synopsys/Synopsis/  .....two different places.

..and for some unknown reason it introduce a empty line deleted and added
back.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 0c2827fd8c19..30e8cc26f43b 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -170,15 +170,15 @@ config DMA_SUN6I
 	  Support for the DMA engine first found in Allwinner A31 SoCs.

 config DW_AXI_DMAC
-	tristate "Synopsys DesignWare AXI DMA support"
+	tristate "Synopsis DesignWare AXI DMA support"
 	depends on OF || COMPILE_TEST
 	depends on HAS_IOMEM
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-	  Enable support for Synopsys DesignWare AXI DMA controller.
+	  Enable support for Synopsis DesignWare AXI DMA controller.
 	  NOTE: This driver wasn't tested on 64 bit platform because
-	  of lack 64 bit platform with Synopsys DW AXI DMAC.
+	  of lack 64 bit platform with Synopsis DW AXI DMAC.

 config EP93XX_DMA
 	bool "Cirrus Logic EP93xx DMA support"
@@ -394,7 +394,7 @@ config MOXART_DMA
 	select DMA_VIRTUAL_CHANNELS
 	help
 	  Enable support for the MOXA ART SoC DMA controller.
-
+
 	  Say Y here if you enabled MMP ADMA, otherwise say N.

 config MPC512X_DMA
--
2.26.3

