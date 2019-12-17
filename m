Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 069311225CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 08:49:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cVfD321hzDqcm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 18:49:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.23.249; helo=lelv0142.ext.ti.com;
 envelope-from=peter.ujfalusi@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.b="aXtLu1vI"; 
 dkim-atps=neutral
X-Greylist: delayed 615 seconds by postgrey-1.36 at bilbo;
 Tue, 17 Dec 2019 18:47:57 AEDT
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cVcF28FkzDqHb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 18:47:55 +1100 (AEDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBH7bHKH006897;
 Tue, 17 Dec 2019 01:37:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576568237;
 bh=uq4M6dCHylxyKFwJawgtPdUJOCVELJz3UBxlL6ZzTc4=;
 h=From:To:CC:Subject:Date;
 b=aXtLu1vIsWEzIZHmnvQmu8h9BoCJ7bOLYEp7+YCA8ruweISoRJN9RUSppN+8xgdAR
 rbiNl66Cym8qNXjnce+7+fMXBVS2AK5xtMAWCRB61/gtrLSouZi7CIGfHI7NZZFLo+
 tqpUTjJTh+W5LybMSsFKRQClTes/VlL+AB3og8ag=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBH7bHn7111365
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Dec 2019 01:37:17 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 01:37:17 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 01:37:17 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBH7bFQB068169;
 Tue, 17 Dec 2019 01:37:15 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <agust@denx.de>
Subject: [PATCH] powerpc/512x: Use dma_request_chan() instead
 dma_request_slave_channel()
Date: Tue, 17 Dec 2019 09:37:30 +0200
Message-ID: <20191217073730.21249-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: vkoul@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dma_request_slave_channel() is a wrapper on top of dma_request_chan()
eating up the error code.

By using dma_request_chan() directly the driver can support deferred
probing against DMA.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
index 13631f35cd14..04bf6ecf7d55 100644
--- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
+++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
@@ -434,9 +434,9 @@ static int mpc512x_lpbfifo_probe(struct platform_device *pdev)
 	memset(&lpbfifo, 0, sizeof(struct lpbfifo_data));
 	spin_lock_init(&lpbfifo.lock);
 
-	lpbfifo.chan = dma_request_slave_channel(&pdev->dev, "rx-tx");
-	if (lpbfifo.chan == NULL)
-		return -EPROBE_DEFER;
+	lpbfifo.chan = dma_request_chan(&pdev->dev, "rx-tx");
+	if (IS_ERR(lpbfifo.chan))
+		return PTR_ERR(lpbfifo.chan);
 
 	if (of_address_to_resource(pdev->dev.of_node, 0, &r) != 0) {
 		dev_err(&pdev->dev, "bad 'reg' in 'sclpc' device tree node\n");
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

