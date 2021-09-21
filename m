Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE691413C34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:17:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZ4l6pN7z3ck3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:17:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WQbRVDe4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WQbRVDe4; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYyX4pVSz2yfb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:11:48 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B61B61186;
 Tue, 21 Sep 2021 21:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258706;
 bh=7aZeUplfK5FIw57TTz+BqraFodfiICmaUpVRsJfChZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WQbRVDe4WvqDZA4ffxruKWJglpyB6dcfnWG0XGgZyC1HgUunTwpfzYybyW/aSoo5J
 SVCukBxp4U96twUUGaYNQbEcSx6yjMM20tveE7OgQjWzpXMUT5NKwhjsF9Si7pPb8h
 v1jej0+PstTomnQgmC/fk82pisHMxU8BcLAgnauv9BRbu5kUgn5o9e7PnGbBwcTWzl
 BAbM9wulk2D4XS1wTj9RSMFqAvUOcBvAPs1AaKlk64noAkYwqS9HvmCZ3c522HRAPQ
 CWSDYflhh3C5l52OprCS87X+BW/j4DxKPkJulPAa0494lnfTPbzYYpBLNj+8xxKipc
 gXIbrU/h4nDFg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 09/16] ASoC: imx-card: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:10:33 +0100
Message-Id: <20210921211040.11624-9-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921211040.11624-1-broonie@kernel.org>
References: <20210921211040.11624-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; h=from:subject;
 bh=7aZeUplfK5FIw57TTz+BqraFodfiICmaUpVRsJfChZE=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhkQvz0fPdU2bGeb66oX2Zk5MffO3LNb/lqzrToemOqMST06R
 8kOdjMYsDIxcDLJiiixrn2WsSg+X2Dr/0fxXMINYmUCmMHBxCsBEhMPZ/4p9XvysPDHv8AvFdLVua5
 ODSx+2u8jJGcg/S1jx8kxN0QknX964Kcyn5QvMf60x/6x10XvSbf4VPa9nXJFgeGx5yFd84/RnXyqD
 7fysd/N9fV36b+7asHkHuJfF6NmfXFue/UTg5+xKg5wVWy0PWHZcq9XZ6G1b/Ki9e0lf5pkSUyP+C6
 zlp86/qlsWvXBqzP5dk1623lWPMD++5m9mll96nlS7whnnr3EcS+u2f18ksIEtilNUxGKSxDpV1sQH
 Ml5ci4KuPhOKSs3nVONqC9AtXFD2UD8oy8m9Z5nurW1vBSe43Y25Lxd7z8yk1nLX+f4DTCzTk5sWZM
 VotMt2l1b0KPyIu3btytKZ3Q+sAA==
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

