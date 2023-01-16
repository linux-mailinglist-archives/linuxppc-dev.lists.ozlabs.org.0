Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC8666C16D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 15:11:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwYqG32dpz3fP7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 01:11:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GejNquWZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GejNquWZ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwYh657k6z3fH2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 01:05:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3FB360FEA;
	Mon, 16 Jan 2023 14:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369B3C433F2;
	Mon, 16 Jan 2023 14:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673877924;
	bh=GI2SBqICcAa08mrBZ2GLpH9OZgLedzBiqDk8ACJuT/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GejNquWZl4sBqnYyAeLtZ+R7TDdujnHN1z6SEKJpng4mwm6enOriOqLHZaLFjbRuQ
	 +1QVFJjZr1XaxbeERqu5n3EOx6jOo6eUBvKG2IX7JX+wH85T1ZO/qfwL+SZOm3hVFm
	 zDOT1B4FRpTDUB9Z2iOh7bTx5okp5JvX3q5I3zoDLaJy4wVqWrQnpkh6j5o4WfUVW8
	 qEJ+nqxn/Zwfh/H7+zu5rdOeguZE3fngVxadADlKPIDfZIZMINNcGvYHnscnbFnJoh
	 E9WOYTZDnAZTRiaUDRcNi9L8K0/u1YXkSjiLpZ+avf0mTpBIPsWytMZ3F2G8g4dviL
	 4NNOgrpzrt0Fw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 02/16] ASoC: fsl_micfil: Correct the number of steps on SX controls
Date: Mon, 16 Jan 2023 09:05:05 -0500
Message-Id: <20230116140520.116257-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116140520.116257-1-sashal@kernel.org>
References: <20230116140520.116257-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chancel Liu <chancel.liu@nxp.com>

[ Upstream commit cdfa92eb90f5770b26a79824ef213ebdbbd988b1 ]

The parameter "max" of SOC_SINGLE_SX_TLV() means the number of steps
rather than maximum value. This patch corrects the minimum value to -8
and the number of steps to 15.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Link: https://lore.kernel.org/r/20230104025754.3019235-1-chancel.liu@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_micfil.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index f7f2d29f1bfe..b33746d58633 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -87,21 +87,21 @@ static DECLARE_TLV_DB_SCALE(gain_tlv, 0, 100, 0);
 
 static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 	SOC_SINGLE_SX_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(0), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH1 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(1), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH2 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(2), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH3 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(3), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH4 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(4), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH5 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(5), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH6 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(6), 0x8, 0xF, gain_tlv),
 	SOC_SINGLE_SX_TLV("CH7 Volume", REG_MICFIL_OUT_CTRL,
-			  MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0x7, gain_tlv),
+			  MICFIL_OUTGAIN_CHX_SHIFT(7), 0x8, 0xF, gain_tlv),
 	SOC_ENUM_EXT("MICFIL Quality Select",
 		     fsl_micfil_quality_enum,
 		     snd_soc_get_enum_double, snd_soc_put_enum_double),
-- 
2.35.1

