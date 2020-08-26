Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA1253380
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 17:22:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc8k13FL7zDqBG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 01:22:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cmss.chinamobile.com (client-ip=221.176.66.79;
 helo=cmccmta1.chinamobile.com; envelope-from=tangbin@cmss.chinamobile.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cmss.chinamobile.com
X-Greylist: delayed 192 seconds by postgrey-1.36 at bilbo;
 Thu, 27 Aug 2020 01:12:25 AEST
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Bc8VK65pSzDqTX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 01:12:23 +1000 (AEST)
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35f467afd3a1-592e7;
 Wed, 26 Aug 2020 23:08:45 +0800 (CST)
X-RM-TRANSID: 2ee35f467afd3a1-592e7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.0.144.112])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee25f467afb20d-10b8c;
 Wed, 26 Aug 2020 23:08:45 +0800 (CST)
X-RM-TRANSID: 2ee25f467afb20d-10b8c
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, timur@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com
Subject: [PATCH] ASoC: fsl_spdif: Fix unnecessary check in fsl_spdif_probe()
Date: Wed, 26 Aug 2020 23:09:18 +0800
Message-Id: <20200826150918.16116-1-tangbin@cmss.chinamobile.com>
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
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tang Bin <tangbin@cmss.chinamobile.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The function fsl_spdif_probe() is only called with an openfirmware
platform device. Therefore there is no need to check that the passed
in device is NULL.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/fsl/fsl_spdif.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 7858a5499..395c50167 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1221,9 +1221,6 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 	void __iomem *regs;
 	int irq, ret, i;
 
-	if (!np)
-		return -ENODEV;
-
 	spdif_priv = devm_kzalloc(&pdev->dev, sizeof(*spdif_priv), GFP_KERNEL);
 	if (!spdif_priv)
 		return -ENOMEM;
-- 
2.20.1.windows.1



