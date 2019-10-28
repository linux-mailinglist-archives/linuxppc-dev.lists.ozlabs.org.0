Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE23E74D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 16:18:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471yyb2L2GzDrQJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 02:17:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471ywW0b7szDqSY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 02:16:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J/eopTmx"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 471ywV5SfDz8t1Z
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 02:16:10 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 471ywV3j0kz9sPK; Tue, 29 Oct 2019 02:16:10 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sirena.co.uk (client-ip=172.104.155.198;
 helo=heliosphere.sirena.org.uk; envelope-from=broonie@sirena.co.uk;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J/eopTmx"; dkim-atps=neutral
X-Greylist: delayed 1165 seconds by postgrey-1.36 at bilbo;
 Tue, 29 Oct 2019 02:16:09 AEDT
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 471ywT4qWrz9sPT;
 Tue, 29 Oct 2019 02:16:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ayhWuIRk5G3JoYC0+eItJEUm0KsYBGtWrfEHFIWOfGI=; b=J/eopTmx08dP
 Gn2R0iyfVwHXLAPcXiu8TJGiAc03+2NbUjFDRL/AeJpTXQevErvZ5eNpX0H5DEcC3W20NqShBUcJM
 SnU5jTQ6t8+sFN2XY1toDYKNn48nNmKI1qzGH13XCVCpdRDWUDvQxxmpEqhPHf21OPsxfr4eE/YZl
 M9/Ao=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rj-0008Rn-Bv; Mon, 28 Oct 2019 14:56:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8735D2741458; Mon, 28 Oct 2019 14:56:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Applied "ASoC: fsl: fsl_dma: fix build failure" to the asoc tree
In-Reply-To: <20191025051353.2878-1-mpe@ellerman.id.au>
X-Patchwork-Hint: ignore
Message-Id: <20191028145637.8735D2741458@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:37 +0000 (GMT)
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
Cc: linuxppc-dev@ozlabs.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kuninori.morimoto.gx@renesas.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: fsl: fsl_dma: fix build failure

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From d3de1eb461e5bac0b07f5c785e6e0d959915df96 Mon Sep 17 00:00:00 2001
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 25 Oct 2019 16:13:53 +1100
Subject: [PATCH] ASoC: fsl: fsl_dma: fix build failure
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 4ac85de9977e ("ASoC: fsl: fsl_dma: remove snd_pcm_ops") removed
fsl_dma_ops but left a usage, leading to a build error for some
configs, eg. mpc85xx_defconfig:

  sound/soc/fsl/fsl_dma.c: In function ‘fsl_soc_dma_probe’:
  sound/soc/fsl/fsl_dma.c:905:18: error: ‘fsl_dma_ops’ undeclared (first use in this function)
    dma->dai.ops = &fsl_dma_ops;
                    ^~~~~~~~~~~

Remove the usage to fix the build.

Fixes: 4ac85de9977e ("ASoC: fsl: fsl_dma: remove snd_pcm_ops")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191025051353.2878-1-mpe@ellerman.id.au
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index a092726510d4..2868c4f97cb2 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -901,7 +901,6 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 	}
 
 	dma->dai.name = DRV_NAME;
-	dma->dai.ops = &fsl_dma_ops;
 	dma->dai.open = fsl_dma_open;
 	dma->dai.close = fsl_dma_close;
 	dma->dai.ioctl = snd_soc_pcm_lib_ioctl;
-- 
2.20.1

