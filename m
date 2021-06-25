Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B23B4304
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 14:17:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBGGf0MDnz3bsS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 22:17:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=V1Hs0sYl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.12.14; helo=m12-14.163.com;
 envelope-from=13145886936@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=V1Hs0sYl; dkim-atps=neutral
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GBGGD66SYz3brt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 22:17:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Ll5wP
 2RKhdsiju9OyGOyhweozs4U8+CZxPAsBohFRCY=; b=V1Hs0sYlL5KZVdtxOFYU+
 SzxieUkk44Dwk8s9xYNGepXzKWhoJC60060K0EUP2B/hGLg5cy1Aa4ZrBP0AfeJ3
 bRe6gVvmcAXJ3bk1zF80ruvf6CD1tC/HUupE1Mw13B6qBFCKpLGQrT/JHN5AWK0/
 m5bCICrKBNXgNKJ4zWjYRo=
Received: from ubuntu.localdomain (unknown [218.17.89.92])
 by smtp10 (Coremail) with SMTP id DsCowACnrCguydVgUprnQg--.54887S2;
 Fri, 25 Jun 2021 20:16:46 +0800 (CST)
From: 13145886936@163.com
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_xcvr: remove unnecessary print function dev_err()
Date: Fri, 25 Jun 2021 05:16:36 -0700
Message-Id: <20210625121636.453231-1-13145886936@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowACnrCguydVgUprnQg--.54887S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWUCF45ur1kKr4UGrWruFg_yoW3Crb_tw
 10kwnYq3yrJryIva4kGw43AFy7XwsrCFWUWrs8KF17J345Jw4rXa4UGF4kurs8uw4xA34x
 WFyYvrZ3Cr1SyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5JR67UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5zrdx5xxdq6xppld0qqrwthudrp/xtbBzh+8g1QHNBM05gAAsI
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 gushengxian <gushengxian@yulong.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: gushengxian <gushengxian@yulong.com>

The print function dev_err() is redundant because
platform_get_irq() already prints an error.

Signed-off-by: gushengxian <gushengxian@yulong.com>
---
 sound/soc/fsl/fsl_xcvr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 6cb558165848..e34d57ad66fb 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1189,10 +1189,8 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 
 	/* get IRQs */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "no irq[0]: %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(dev, irq, irq0_isr, 0, pdev->name, xcvr);
 	if (ret) {
-- 
2.25.1

