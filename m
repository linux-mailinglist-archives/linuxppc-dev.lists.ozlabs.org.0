Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4CF329F87
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 13:53:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqcWk2K83z3cT9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 23:53:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cmss.chinamobile.com (client-ip=221.176.66.80;
 helo=cmccmta2.chinamobile.com; envelope-from=tangbin@cmss.chinamobile.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 184 seconds by postgrey-1.36 at boromir;
 Tue, 02 Mar 2021 23:53:36 AEDT
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com
 [221.176.66.80])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DqcWN4WFDz3cK7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 23:53:36 +1100 (AEDT)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.19]) by
 rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee8603e347f287-90771;
 Tue, 02 Mar 2021 20:50:09 +0800 (CST)
X-RM-TRANSID: 2ee8603e347f287-90771
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.112.105.130])
 by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea603e347d2a6-1de80;
 Tue, 02 Mar 2021 20:50:09 +0800 (CST)
X-RM-TRANSID: 2eea603e347d2a6-1de80
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: fsl_xcvr: Use devm_platform_ioremap_resource_byname()
 to simplify code
Date: Tue,  2 Mar 2021 20:50:02 +0800
Message-Id: <20210302125002.23900-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In this function, devm_platform_ioremap_resource_byname() should be 
suitable to simplify code.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/fsl/fsl_xcvr.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 6dd0a5fcd455..5e8284db857b 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1131,7 +1131,7 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct fsl_xcvr *xcvr;
-	struct resource *ram_res, *regs_res, *rx_res, *tx_res;
+	struct resource *rx_res, *tx_res;
 	void __iomem *regs;
 	int ret, irq;
 
@@ -1166,13 +1166,11 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 		return PTR_ERR(xcvr->pll_ipg_clk);
 	}
 
-	ram_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ram");
-	xcvr->ram_addr = devm_ioremap_resource(dev, ram_res);
+	xcvr->ram_addr = devm_platform_ioremap_resource_byname(pdev, "ram");
 	if (IS_ERR(xcvr->ram_addr))
 		return PTR_ERR(xcvr->ram_addr);
 
-	regs_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
-	regs = devm_ioremap_resource(dev, regs_res);
+	regs = devm_platform_ioremap_resource_byname(pdev, "regs");
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-- 
2.18.2



