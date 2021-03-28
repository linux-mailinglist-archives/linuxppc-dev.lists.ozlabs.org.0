Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF1234C05A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 02:07:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7tF31YTqz3frD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 11:07:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YL9DmbE2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YL9DmbE2; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t292BJnz3c9w
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:58:09 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id l6so26571qtq.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NJwGboF3RRjxp++ZERmPQjReWWVKr/czZXPuA+ZJx80=;
 b=YL9DmbE2fe0BApSWAt2uHCdURo+Rz+Rr5GPOuD10WlMJxvjxgDIyyDM3ifIcvvFf0U
 gcHFBmE54d+3KH4GKg8iBAbwJWZlANd7lr6vJAYD4G9J3iSs9fFEc0DzrVMnX38/kG6P
 RJbrTE5VSk49lSyEs8UvPXBlWiDPiTcK4eOBOcIgR1St56TAKdCSryZn0q84c3m+KGM7
 s8XD83myVeBcsZjrO6SlOUShzdK8/g4TPaF96Oa/YASCcUSk06hFuZSxlBgiMcaJpQKm
 i06egdkTzyqoTyu9lUskiJSdlxdgPxtUPgPXwD0kgeJVE3IOcizvkW/yV7TLUyM+fCMH
 j1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJwGboF3RRjxp++ZERmPQjReWWVKr/czZXPuA+ZJx80=;
 b=VPlD4avxicWQslElOrC5NCQyk9vUWcm9qdpHlQBctNXeJKDAEOZap+ORnBrCJUMExk
 kPhQZ3P86DAwzf8JsOKn8PfciNfqXiwj8hIuoYERyWp0GlWjeqc4XTgDWBtxKX8GWfcc
 stsEMeVSjpy9LMaEAih44xMEeyyAWK/HSwC4iE47A/4V7OshxUQKYhOY+YlmNmj/3paK
 Ndjb35D/QE75DNa2HWcJdNsitb8TZjr1CsRWEB7KpddjQR2qjbTQ+YbdeVaWSu+e6gDe
 2zN668J/Yp8APWr4uYWBOghUSp198NC3Z7EhjPM+dOInWLID4BzIoliNvTbhVySurxYt
 cxog==
X-Gm-Message-State: AOAM532YbmMsbWGvgAm0AnIFn51JS1RS90R+MO3yzvYd7gBBS2E5FaWA
 djNLMWVKSHlJKxnyOUrpXmQ=
X-Google-Smtp-Source: ABdhPJx9IaqtHu2JrNlJIS8s9C3nSt+b7/qaYIDs+xEjbuoo0gr+h5DM6WDJ9l2kCetRDAOn+2QZpA==
X-Received: by 2002:ac8:46cc:: with SMTP id h12mr21317176qto.105.1616975886810; 
 Sun, 28 Mar 2021 16:58:06 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:06 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 26/30] dw-axi-dmac-platform.c: Few typos fixed
Date: Mon, 29 Mar 2021 05:23:22 +0530
Message-Id: <01f2fed34eca736091a46dfee38381882e5dc5e9.1616971780.git.unixbhaskar@gmail.com>
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

s/configurarion/configuration/
s/inerrupts/interrupts/
s/chanels/channels/  ....two different places.
s/Synopsys/Synopsis/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index d9e4ac3edb4e..ef4da10361a7 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -35,7 +35,7 @@
 /*
  * The set of bus widths supported by the DMA controller. DW AXI DMAC supports
  * master data bus width up to 512 bits (for both AXI master interfaces), but
- * it depends on IP block configurarion.
+ * it depends on IP block configuration.
  */
 #define AXI_DMA_BUSWIDTHS		  \
 	(DMA_SLAVE_BUSWIDTH_1_BYTE	| \
@@ -1056,10 +1056,10 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)

 	u32 status, i;

-	/* Disable DMAC inerrupts. We'll enable them after processing chanels */
+	/* Disable DMAC interrupts. We'll enable them after processing channels */
 	axi_dma_irq_disable(chip);

-	/* Poll, clear and process every chanel interrupt status */
+	/* Poll, clear and process every channel interrupt status */
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
 		status = axi_chan_irq_read(chan);
@@ -1511,5 +1511,5 @@ static struct platform_driver dw_driver = {
 module_platform_driver(dw_driver);

 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Synopsys DesignWare AXI DMA Controller platform driver");
+MODULE_DESCRIPTION("Synopsis DesignWare AXI DMA Controller platform driver");
 MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>");
--
2.26.3

