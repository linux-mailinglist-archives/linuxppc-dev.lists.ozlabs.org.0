Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A09490EBA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:11:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcz356tRWz3fTP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 04:11:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fIlGG2+H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fIlGG2+H; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcyqY6dBbz3ck0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 04:01:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 49E3F6120A;
 Mon, 17 Jan 2022 17:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3955C36AED;
 Mon, 17 Jan 2022 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438904;
 bh=huBJE9+l2qjWsYgu4trs0SBLj5tSgk3OSGlpb5Ca0FM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fIlGG2+HBnY7tZVNfGp/411ALYZlQ2OOUbco6tqgATb2oMCSBdNXmzKVG9U+F5TpZ
 e6T6AXtVvpXBDbzesSJ7ICBPhRBNDV3R+TpcEeY2DVovaLf3k7Xdyve+M8TIPsosJa
 Hl3Dkh+o+D/+YeSMsyizQs8NlNbzy0Pzk9kYBx8cjrp4Mbjp10mr+mLeD+/13Z7J2x
 lYFstEQmad4oNTLh3ylR+YDSJzGgTcGY4TlMt8R6RzHoRzvjaPUqi4zSmnzjk9XL2o
 ettJagrq+N/wbBrujrKAJ0Q4rDrn9ZsxAxJk3cppAV0hFhKzKtTqdRoFTsCI8xM3As
 wsjtyhFXSeRUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 07/44] ASoC: imx-hdmi: add put_device() after
 of_find_device_by_node()
Date: Mon, 17 Jan 2022 12:00:50 -0500
Message-Id: <20220117170127.1471115-7-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170127.1471115-1-sashal@kernel.org>
References: <20220117170127.1471115-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, Mark Brown <broonie@kernel.org>,
 Ye Guojin <ye.guojin@zte.com.cn>, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ye Guojin <ye.guojin@zte.com.cn>

[ Upstream commit f670b274f7f6f4b2722d7f08d0fddf606a727e92 ]

This was found by coccicheck:
./sound/soc/fsl/imx-hdmi.c,209,1-7,ERROR  missing put_device; call
of_find_device_by_node on line 119, but without a corresponding object
release within this function.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
Link: https://lore.kernel.org/r/20211110002910.134915-1-ye.guojin@zte.com.cn
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/imx-hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index 34a0dceae6216..ef8d7a65ebc61 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -145,6 +145,8 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 	data->dai.capture_only = false;
 	data->dai.init = imx_hdmi_init;
 
+	put_device(&cpu_pdev->dev);
+
 	if (of_node_name_eq(cpu_np, "sai")) {
 		data->cpu_priv.sysclk_id[1] = FSL_SAI_CLK_MAST1;
 		data->cpu_priv.sysclk_id[0] = FSL_SAI_CLK_MAST1;
-- 
2.34.1

