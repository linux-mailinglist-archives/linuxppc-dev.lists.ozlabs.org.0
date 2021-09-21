Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EA9413C3E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:19:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZ6v71hGz3dfG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:19:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a5jWUBXq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a5jWUBXq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYyh0yY2z3058
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:11:56 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DD9A61186;
 Tue, 21 Sep 2021 21:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258714;
 bh=ndW6JLnsPPrjKQ932C1Mn3KiDfrgW/GYFDGEKcx9/Y0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a5jWUBXqC9WxdOcxxjue14bmoy5Xc0CTINOhUgGqNsuODMkeJdWYg1gm+hUpwOnLV
 J4pmDT5CfL2X1HHKJOlv40s01GiBg/R3ncDlPqe9XJzMdUzGbC8VUDKG243p0YDusf
 rLOgfpTelQFEImdLcTjaCc44M2Zi/P1gIBNWBWCexgLieEE2vuZhMabmiTBimw2K99
 OuTQxA5KcwMtJP/v5RIwCxM3p39jmb1t/fpyQEa6jPJocQ8ks0i/q303jlKYSgivM/
 3kprg0DL31SsZVdfWsbsW0+Olnx/3zaJaydHVG5HWXz6E10onVcqLIu7tguh5QEKW5
 meQfl0hHjZIEw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 12/16] ASoC: imx-rpmsg: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:36 +0100
Message-Id: <20210921211040.11624-12-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=838; h=from:subject;
 bh=ndW6JLnsPPrjKQ932C1Mn3KiDfrgW/GYFDGEKcx9/Y0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknkc4E4mSomofqAFk5UnxTqcP6GbNg1W968mi1x
 ptA+SNaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ5AAKCRAk1otyXVSH0DKfB/
 93vQb4IRMFzXxh39ImutnDkNxQyHEOYLvxmd9+SKxYUVsLHeE9KFcQTeP71xChfKHG134+eT0FFbEA
 cgEYksdQu6SHBbYAzdphmll9Jzx/M63RuaQihvhOTGWUzDPWXB9J3WHHFsWrv2zZkLqbX7vk/O4+F9
 dkT4xTc2Zy356cBviQD3SZxIDVVyTXS5qr3+0fCT6YWkj/tTAZzBJVe8lcrRLxPRPayd4RFcQdOKt/
 GpDPjGGXXSfQDK+WzDhUyJLzCWkjCqNyuS+0XuAdBiSDIgMItD+8BiOUBvE8ceh6YL7mhXfT32/Edt
 gqhsRLP2OoaQFm7PnYCa4dEZlTGZQL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of moving to remove the old style defines for the bus clocks update
the imx-rpmsg driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index f96fe4ff8425..2e117311e582 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -64,7 +64,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->dai.stream_name = "rpmsg hifi";
 	data->dai.dai_fmt = SND_SOC_DAIFMT_I2S |
 			    SND_SOC_DAIFMT_NB_NF |
-			    SND_SOC_DAIFMT_CBS_CFS;
+			    SND_SOC_DAIFMT_CBC_CFC;
 
 	/* Optional codec node */
 	ret = of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0, &args);
-- 
2.20.1

