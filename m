Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB775413C98
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:37:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZWv6HK9z3cCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:37:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QE3tkfRq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QE3tkfRq; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZWM12Wqz2xXn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:36:47 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C86661019;
 Tue, 21 Sep 2021 21:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260204;
 bh=zSHBaEge3vIffxUMJGRccMptS+Nr4Yr8WQuKISPrvVI=;
 h=From:To:Cc:Subject:Date:From;
 b=QE3tkfRqdrpvu4/J+U4l1kfFvGlrZ/TetTh61VdLQSpG/bqzQn7r7wtMOC7VQNoFT
 EC+iCQkUJhqvwi6VAwq2FgWxWu1c9IME0bamhsoLMpAFH3S9BMUbT7TZd5LMgXdw0V
 NPf9G5JEzU2S/VoX3b58IqqbffG6jbDWVAp2Pe3GhvrPGc7QkBNY4M+i4GYJOYaQP+
 3Bhu/elseJx688PjMhHncg9siEWW4Zdyi8II2QjyAe2OV88hwBn74pX8SxwCt9wnd9
 u8YEjqoQkTKJl00U570EoWqEMK/0mcKR8/2hpojmvx9DEs6FWjMeYzwqe5ltPFQG+Y
 sGkeZkfEx+BBQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 01/16] ASoC: eureka-tlv320: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:35:27 +0100
Message-Id: <20210921213542.31688-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; h=from:subject;
 bh=zSHBaEge3vIffxUMJGRccMptS+Nr4Yr8WQuKISPrvVI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8Tj/RSRUcVVBm/LLpoHGroCue6wcCm71p7LgUe
 WE1IRW2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPEwAKCRAk1otyXVSH0PsDB/
 wPGrHwKlNnv8ILxr+P+yYJoKt3z0rK88YqhlaCIYMLIFd5i40Omj/VUnO5UBmZkd6hKQTNXi+PeXop
 fjCW0QgmA9l+MhpBBZwM6P+xzTqBb/5d7C3AzFnggdqi+0wnsBzI1UAbgnbByIZWqsoIBHFIzMqHSI
 7w6wKkvL47rMjLZoC9PbqRot3MeEkJX2G0I3OrPuj/Ux7HrbHeb4nLCYASAQaEKFHsdg1jx0pX8Sdv
 1yR5pJM+UbqeoYB277UVQlFTv6RQyxLUfNGAvGD+GQl5varbYXTDMfI9II+Iioy/8U0maNlkrnzUJR
 GM9qWKeHRqJ4YRxJmyRHwr4joGa+9b
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

