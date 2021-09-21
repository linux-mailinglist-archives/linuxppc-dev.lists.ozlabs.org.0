Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74486413C16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:12:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDYyk2ynRz306F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:11:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ct/epNrz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ct/epNrz; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYy76lHjz2yP0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:11:27 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC36261211;
 Tue, 21 Sep 2021 21:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632258685;
 bh=zSHBaEge3vIffxUMJGRccMptS+Nr4Yr8WQuKISPrvVI=;
 h=From:To:Cc:Subject:Date:From;
 b=ct/epNrzkQmnSnMxonGErrOp/QZVEaNhSQbCRjdCHaNAA1gi1j2DkTL7Yns28QQpb
 PDXOyMMn6OzB2yeNLnitJus96FtwKGWmAc8qzGHbE7aCZxBjgIrH4/LcLo3zN4eXWX
 o04e65caFex96H//m+77IxrOJrPwH4gzfyZkcAk+nBQ1RoLvMaSd47/36Q3CCNCGy7
 iPmSIq1yLUCIFB5X6lC+D5TbM12U2r6d39Ai+/yQQ5fgUwYagng0dgIWIkIZZsvyx2
 Abu6ZAq6GR7tMWo6cpQM1D5ULb6sL+qgsoPh0rDMI23RmmhtbVzrLLVke+4vlR1WFE
 vA7iZ28sYtRKQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 01/16] ASoC: eureka-tlv320: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:10:25 +0100
Message-Id: <20210921211040.11624-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; h=from:subject;
 bh=zSHBaEge3vIffxUMJGRccMptS+Nr4Yr8WQuKISPrvVI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSknbj/RSRUcVVBm/LLpoHGroCue6wcCm71p7LgUe
 WE1IRW2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpJ2wAKCRAk1otyXVSH0JuDB/
 9IvULyXNpryV6KS+Qr/RWVSc51PvQdZ8MoHr+5G70pOzWBEvNhgPG4jFfKOiHXDcYu0LBZxQw4SJgC
 9Zsu7PU+CAKe7IO3d/IEI88a7MLpGzdPrkOhd9y3lmodAFNjUev4ARL52eq3UD+4UUFAhb94J3yjn9
 HbzjgiQXQ1Qg2fwGKN0gsWMqQCjehPTetC0ScZUQSPzMFdPNZUCyyuTJPRUpRTm1/LlEstdq/kyDbt
 CZT5ifot9tQnk3plaLGrpZZ3XG1Ef7UPB4M/Rh1MTNe3iri4JEkcMJxFD5PiU3YOZdHgv6APriv6db
 fh/ex1a4LLFZy2ZqTShw0PZBTHdgvo
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
the eureka-tlv320 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/eukrea-tlv320.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index e13271ea84de..8b61582753c8 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -70,7 +70,7 @@ static struct snd_soc_dai_link eukrea_tlv320_dai = {
 	.name		= "tlv320aic23",
 	.stream_name	= "TLV320AIC23",
 	.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			  SND_SOC_DAIFMT_CBM_CFM,
+			  SND_SOC_DAIFMT_CBP_CFP,
 	.ops		= &eukrea_tlv320_snd_ops,
 	SND_SOC_DAILINK_REG(hifi),
 };
-- 
2.20.1

