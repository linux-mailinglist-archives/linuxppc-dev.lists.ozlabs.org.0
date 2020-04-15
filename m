Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4713B1AA2CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 15:10:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492N4n1q77zDqF5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 23:10:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=LK+ZCXJJ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492MHp705gzDr0x
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 22:34:46 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0056E206D5;
 Wed, 15 Apr 2020 12:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586954084;
 bh=U2YmseTlANKK+dbiJT/Rk72V3K1e4CYlnbGh0jjwpqM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=LK+ZCXJJXUKNwPGZh9RVn7FZyGdobbDn8uw2ITPIBJPuUrffuMUixz+GSojt3JRAh
 4zwqnxIH++WDh3kU1JI4/A5sIAHBWBAp3LPdJrNWxcSeXmvHSWQaL7StRXV6vLlIzB
 vFM9KjvI+wl5SQSeyiY9VB+PYStOYzVB5rfsRqBU=
Date: Wed, 15 Apr 2020 13:34:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Applied "ASoC: fsl_micfil: Omit superfluous error message in
 fsl_micfil_probe()" to the asoc tree
In-Reply-To: <20200415044513.17492-1-tangbin@cmss.chinamobile.com>
Message-Id: <applied-20200415044513.17492-1-tangbin@cmss.chinamobile.com>
X-Patchwork-Hint: ignore
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, perex@perex.cz,
 nicoleotsuka@gmail.com, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: fsl_micfil: Omit superfluous error message in fsl_micfil_probe()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 83b35f4586e235bfb785a7947b555ad8f3d96887 Mon Sep 17 00:00:00 2001
From: Tang Bin <tangbin@cmss.chinamobile.com>
Date: Wed, 15 Apr 2020 12:45:13 +0800
Subject: [PATCH] ASoC: fsl_micfil: Omit superfluous error message in
 fsl_micfil_probe()

In the function fsl_micfil_probe(), when get irq failed, the function
platform_get_irq() logs an error message, so remove redundant message here.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Link: https://lore.kernel.org/r/20200415044513.17492-1-tangbin@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_micfil.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index f7f2d29f1bfe..e73bd6570a08 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -702,10 +702,8 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	for (i = 0; i < MICFIL_IRQ_LINES; i++) {
 		micfil->irq[i] = platform_get_irq(pdev, i);
 		dev_err(&pdev->dev, "GET IRQ: %d\n", micfil->irq[i]);
-		if (micfil->irq[i] < 0) {
-			dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
+		if (micfil->irq[i] < 0)
 			return micfil->irq[i];
-		}
 	}
 
 	if (of_property_read_bool(np, "fsl,shared-interrupt"))
-- 
2.20.1

