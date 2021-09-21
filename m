Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A29BB413CC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:42:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZdj3vytz3bXt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:42:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qA08s/wx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qA08s/wx; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZWn40cJz3c91
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:37:09 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F19C661159;
 Tue, 21 Sep 2021 21:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260227;
 bh=7aZeUplfK5FIw57TTz+BqraFodfiICmaUpVRsJfChZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qA08s/wx8q3dFLMOFErpwMkr6mYz1UsNnw00dnHKS11X3oqmdlWvg4xf8VNYJbK23
 YGJ86c6ofhwtyaUDRfICsXx5VH9adsKloxHWsnbuHIIMBDvritVG+jb2D4unn4zazK
 Dv4k3hztCwh/tR/QQUpT6acxdMVxPqEYuaWsmMGSu02JNQBwgG0DyU0pBb683ygjER
 zM5ysrrb6Gg1mSlIl4qjB0NIVi0pW8sweyvHKi2DYZxri5eimr0d7ZmL1tyHovtgYK
 VsZkm93hM92dhQiL8fPRWCBqk2GVH60817z6XFWRu0Xm9XJEuq1edvZtw4cLYaD9US
 z0PUdvBDWzW1w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 09/16] ASoC: imx-card: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:35:35 +0100
Message-Id: <20210921213542.31688-9-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; h=from:subject;
 bh=7aZeUplfK5FIw57TTz+BqraFodfiICmaUpVRsJfChZE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8Z5y01gwCdTS5VjWmRZez9dl1P2h1FuUCCfjJ0
 SQkUd8KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPGQAKCRAk1otyXVSH0LErB/
 4oaUZCM3nnbVzSi86egkGj1gDDHIyt1qlhyjKZUsv4DiIPkK8R88NkCV2bBAzWVJHvzxNt41mY4uaz
 WG6Bai1SGTW3KcfpxsZI6FjrpopdFGX4VqYOY0TtdsJa3NI53C3BhzfImCzlykkaIcYmuxjt7Ah2lb
 OWekcV4hHp8wRwJyiaaJ/keljvzvatp43ESfsdCc7j6On9RqUteZupFr2zakJY9BSN2Ptjd8pN8yeH
 aTXtxWawedMeoU8PhYkESWsDn+KdqudUqVGnNcbsSw5vjtgIPaOPbZueRLi6V8h84d9qGpeYAbexYL
 zAkmKnFgXOdAULh/IgxFkLlc3ApCAZ
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
the imx-card driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 58fd0639a069..e9fe3fc2f261 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -652,7 +652,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 					       NULL, &link->dai_fmt);
 		if (ret)
 			link->dai_fmt = SND_SOC_DAIFMT_NB_NF |
-					SND_SOC_DAIFMT_CBS_CFS |
+					SND_SOC_DAIFMT_CBC_CFC |
 					SND_SOC_DAIFMT_I2S;
 
 		/* Get tdm slot */
-- 
2.20.1

