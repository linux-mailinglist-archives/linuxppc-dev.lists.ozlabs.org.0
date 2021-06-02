Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D7C3982B2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 09:08:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw0Vs1RHmz3gSG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 17:08:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=nselector3 header.b=jDC9TnR4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=nselector3 header.b=jDC9TnR4; 
 dkim-atps=neutral
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw0K12TFdz30CS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 17:00:02 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 746AE1A1E9D;
 Wed,  2 Jun 2021 08:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com 746AE1A1E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
 s=nselector3; t=1622617197;
 bh=SWgLA9X2K6gN6TIyMw7jN/rBkJDvoZSmZ7cEH5X1U7M=;
 h=From:To:Subject:Date:From;
 b=jDC9TnR4i6xgH8zwaCPLpZl13UR9d0C4rmME9PtLbcPebgyN2/Z16g8lXrWgSZBVr
 QmTMG8LZ2Txqub8jwsN8LKB5Bn9BMi6psMj5ujnW2eVCJ4QZTIdk9GXYcnUHJiwrwf
 sKQp7FuPWdo7Ow2NzZ1jN+5SGQ3yZuxfjZkEdLFJx8ERmDV+QA7x/4lFge6td/Gl90
 Dh53wioGhYD1xeq1o/WyZSmwfm49NqKtCGtsQF62fTNa4MezD6XYbqJGvdlhBANjtc
 X1nFMI2IQ7/fKFv3O0Dj6ai5C1cYTFYS9mKqTHaVCLJ6F2eQg6xiQL0mHpzN8hRDyL
 Ow7GAcXDkaxBw==
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1050D1A1E8A;
 Wed,  2 Jun 2021 08:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com 1050D1A1E8A
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7933B4031D;
 Wed,  2 Jun 2021 14:59:47 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer probe
Date: Wed,  2 Jun 2021 14:42:12 +0800
Message-Id: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't need to print error message for defer probe

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 4f55b316cf0f..b40ba910ae9d 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -709,7 +709,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	of_node_put(framemaster);
 
 	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
-		dev_err(&pdev->dev, "failed to find codec device\n");
+		dev_dbg(&pdev->dev, "failed to find codec device\n");
 		ret = -EPROBE_DEFER;
 		goto asrc_fail;
 	}
-- 
2.27.0

