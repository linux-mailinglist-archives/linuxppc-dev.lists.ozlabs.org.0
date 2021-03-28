Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1AC34C053
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:04:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t9f6yhYz3fHM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:04:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lhF2PkYe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lhF2PkYe; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t1V0Y3nz3c1S
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:57:33 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id y5so10920354qkl.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CRQ66svHtz0NbMeMT9Zx0iC/2wAaIP+Km/fepuW/VfI=;
 b=lhF2PkYeKxZ0OGzjM1bBzGIAbKjSfHQkFcs2C27Ecdb0THCTBERC5T8aj/+CORXigi
 n616eugbkVpcCcWOibNxul8RyH5dqWEqKKkgEPag7IAtO1wIHraKQFrl6zJF1poQ+l/b
 l4gr6oRHPIYD9JSm8bV8I4eaJ/HWeZreeqN1heEG18VeXYvPGT7mIxrkvRUKeCBCctG6
 kwu9TfPac45671YXZgPWyFX6uZIgmzX1lHqm9rWuWRszCfTaoym5DsDyvHsArK4pope4
 2V++RpddLlJAODW8ec9vU7dCOvdwVpIAwPI0KLCpB4FbC0QCvF/clKntX08Z9XocOVxl
 t/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CRQ66svHtz0NbMeMT9Zx0iC/2wAaIP+Km/fepuW/VfI=;
 b=dMHu2a70OZu1mKC3Bo0dYhmtt6h08ZOU5skJ9eR3PpqlREKXrmu5QnookdGdHUGZiQ
 fsUEwX7rR1qRAL//79mqW5Natarb3M4QJzENGvYXgyq0LO0dbFdaoDITRd2rHVJxXkNR
 89qNgl6GFBRYL5WUOoLxwuemYWbXGzP+fkEhQqCsctMHsdZ4lfIDG974mt7pHHurZaKJ
 h1hOM48mG+uvm36Nka7l85x/3NQPt3YYk/2iufG8gWreWJGnDIK3f7IlpHMU3vNcxVQR
 /KdXIXi6JWYRbZiePOaGTOtsV3rXwaoi8I5I6w91pzAcFWtw7eN4Z3uiCmGZIaz5uuqW
 SyHQ==
X-Gm-Message-State: AOAM531/lcIvhewfMcLV1SiOcRzl2VLTb22OzIkGewP10Rr1biABXddZ
 rqO6pnV1ZvSV2ttmRDGkBOg=
X-Google-Smtp-Source: ABdhPJz562Hr6JC/eu+femI5ulDAe6zWcMiureMKHuCOy+N3i/aJwFXT/YJj4Ol1H2CmKTh/PKph0g==
X-Received: by 2002:a05:620a:31a:: with SMTP id
 s26mr23223111qkm.355.1616975851673; 
 Sun, 28 Mar 2021 16:57:31 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:31 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 19/30] xgene-dma.c: Few spello fixes
Date: Mon, 29 Mar 2021 05:23:15 +0530
Message-Id: <4703d96a617c2244e2753d579790edbbb49382ab.1616971780.git.unixbhaskar@gmail.com>
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

s/definations/definitions/   ....two different places.
s/Configue/Configure/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/xgene-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index 3589b4ef50b8..9b0010b6e033 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -23,7 +23,7 @@

 #include "dmaengine.h"

-/* X-Gene DMA ring csr registers and bit definations */
+/* X-Gene DMA ring csr registers and bit definitions */
 #define XGENE_DMA_RING_CONFIG			0x04
 #define XGENE_DMA_RING_ENABLE			BIT(31)
 #define XGENE_DMA_RING_ID			0x08
@@ -102,7 +102,7 @@
 #define XGENE_DMA_BLK_MEM_RDY_VAL		0xFFFFFFFF
 #define XGENE_DMA_RING_CMD_SM_OFFSET		0x8000

-/* X-Gene SoC EFUSE csr register and bit defination */
+/* X-Gene SoC EFUSE csr register and bit definition */
 #define XGENE_SOC_JTAG1_SHADOW			0x18
 #define XGENE_DMA_PQ_DISABLE_MASK		BIT(13)

@@ -1741,7 +1741,7 @@ static int xgene_dma_probe(struct platform_device *pdev)
 	/* Initialize DMA channels software state */
 	xgene_dma_init_channels(pdma);

-	/* Configue DMA rings */
+	/* Configure DMA rings */
 	ret = xgene_dma_init_rings(pdma);
 	if (ret)
 		goto err_clk_enable;
--
2.26.3

