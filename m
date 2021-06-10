Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF413A240F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 07:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0tKL04xbz3bx6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 15:47:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UiwYBJ+2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.12.11; helo=m12-11.163.com; envelope-from=hbut_tan@163.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=UiwYBJ+2; dkim-atps=neutral
X-Greylist: delayed 992 seconds by postgrey-1.36 at boromir;
 Thu, 10 Jun 2021 14:17:47 AEST
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by lists.ozlabs.org (Postfix) with ESMTP id 4G0rL30f7Jz2ymH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 14:17:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=5+CyZ
 obPKR0nHlvAJFBUdKCJc3XZdSIYzi6QIkkecus=; b=UiwYBJ+2v9yeqwmhb+jXQ
 lxD/hPTkJYIsXPnyKZNowU/abEUi533IQ2z8lHlu2v8uBaKWEHqznkoYUpbwLkbF
 KPDXsmKRXCfR5MV69V6b//hMoQrAxprWYOzyQOs+ZhnHr7dnrantnco5iht9XSam
 UjipjAIv5AN9Yvx2NeVLzU=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp7 (Coremail) with SMTP id C8CowAB3YYl3jsFgVPzJhA--.907S2;
 Thu, 10 Jun 2021 12:00:57 +0800 (CST)
From: =?UTF-8?q?=C2=A0Zhongjun=20Tan?= <hbut_tan@163.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, shengjiu.wang@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC:fsl_spdif:Remove superfluous error message around
 platform_get_irq()
Date: Thu, 10 Jun 2021 12:00:37 +0800
Message-Id: <20210610040037.1064-1-hbut_tan@163.com>
X-Mailer: git-send-email 2.30.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowAB3YYl3jsFgVPzJhA--.907S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrykKFy7tryDZw1fKF4kJFb_yoWfCrb_G3
 4kCws5uFWxXrWjqF98Zw42yw1xXrsrGr4UXF42qF12v345Jrs5Wa18Jrn5uFsYvw48K34r
 W3WrWrWSyrn3GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5e89tUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: xkex3sxwdqqiywtou0bp/xtbBqBitxl75dK+TcgAAsG
X-Mailman-Approved-At: Thu, 10 Jun 2021 15:46:55 +1000
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
 linux-kernel@vger.kernel.org, Tan Zhongjun <tanzhongjun@yulong.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tan Zhongjun <tanzhongjun@yulong.com>

The platform_get_irq() prints error message telling that interrupt is
missing, hence there is no need to duplicated that message.

Signed-off-by: Tan Zhongjun <tanzhongjun@yulong.com>
---
 sound/soc/fsl/fsl_spdif.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 2a76714eb8e6..29cefd459241 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1368,10 +1368,8 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 
 	for (i = 0; i < spdif_priv->soc->interrupts; i++) {
 		irq = platform_get_irq(pdev, i);
-		if (irq < 0) {
-			dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
+		if (irq < 0)
 			return irq;
-		}
 
 		ret = devm_request_irq(&pdev->dev, irq, spdif_isr, 0,
 				       dev_name(&pdev->dev), spdif_priv);
-- 
2.17.1

