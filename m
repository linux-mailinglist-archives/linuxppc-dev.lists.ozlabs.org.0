Return-Path: <linuxppc-dev+bounces-2148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC3F99B368
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 13:26:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQh5l11k4z2yMD;
	Sat, 12 Oct 2024 22:26:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728732395;
	cv=none; b=Tq3d8LnOVsw3SBWM9d2BZrQI2QXBYV744OHp2ireevu/YbNKSUT0wlAA4NoREqnt+H0ZfxvfPj1dkJaTgILaVVYDZx6/E6NSG/C5wZDp55OXFWDczZBL8gd5RGhsaLjCZWz2T7FtKLB775yz1O53RD1xGtM9g5zZG0FSwTpayFvMLZgp3WNgDU+Ag/wX7+YPd9JbaK1dMnZQD/vq63BiGDY5pxCZA7GnnR3CaoGomNvLiSXY04U6djS0Jtc/bbSNH2y6MBSb22oy3dbUDDBsviYIeNcwKi8wFkZO58SUPpKgz60+BXpRuWDOZd1PlUPn6QM/kiFdfQcX+5Qil3EpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728732395; c=relaxed/relaxed;
	bh=jvPgfwxm7tmU6n8TbOaKgJsWc5pBQcU/rhkDyd/11c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8B52nOQF8gbmlg6+ybItF8i6oOjLgks2/D1STJMT8tZVChZxcoo1SliakdZoiS4WsxiTW0/7J15CLcFSq9OFhye07ZLA5l2EwU2jCEMw4pJxJKWC6q5a2mTBtwf/Bkplwvj+u/9n2ixZvr1nbN/GKcK7eWR407mSywbdSiuQE68xaLXv9lRwRmi3EXSZ6AxyZUTsNhpzXOzfwoDmFQ+S28CaQ9ujSWqpjc62jCdelVHQVbRbc9XYaiYULqsgSDUGXl6cpgbAu6qrat1mCwOtpSepxCoJSJ0s6N2e/QmbZBHAIWGtiu728Xdj93doZDPqyjNhZLRfiPpJcxRI6jY3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=blfphoUl; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=blfphoUl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQh5j6Pdvz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 22:26:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C16FCA405B1;
	Sat, 12 Oct 2024 11:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BE6C4CEC6;
	Sat, 12 Oct 2024 11:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728732389;
	bh=0auhR6tsRLm+DbOTp+TCsOMxuPCwJ8l84lQU6dR4RCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=blfphoUlkZ1cHv2bJX8EKaKl9DaCma3bXTUjcHY7qv2k6C4rPMxyGmK5sE+foWXF/
	 tm1A+MpfUvclhj38TDB/jet6AHjI0JEGPQlWBEGQmtSdBiC375nY/tV+0Kq/a1fnDY
	 8DHEPBP2NrzDb/ansGy3LXKbJzQXFUGYKoP7y161T0H3Pg8RPx9YDu/RKgayglLocP
	 PCM6QiB9pGdy0arYWXhSTjoMw6NGQ46Ukr7bziQd2qw0GMJX/1ZQIhKG+6NfLL7gEt
	 8ek+qD6Jz5Inh6IqMd1ixeyrxPeXA67+U7sYWUZW7FN3FUjpLTIcV+1RASWjjLfdo1
	 z6h+Di94E+KZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 04/16] ASoC: fsl_sai: Enable 'FIFO continue on error' FCONT bit
Date: Sat, 12 Oct 2024 07:26:00 -0400
Message-ID: <20241012112619.1762860-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241012112619.1762860-1-sashal@kernel.org>
References: <20241012112619.1762860-1-sashal@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.3
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit 72455e33173c1a00c0ce93d2b0198eb45d5f4195 ]

FCONT=1 means On FIFO error, the SAI will continue from the
same word that caused the FIFO error to set after the FIFO
warning flag has been cleared.

Set FCONT bit in control register to avoid the channel swap
issue after SAI xrun.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://patch.msgid.link/1727676508-22830-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_sai.c | 5 ++++-
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d03b0172b8ad2..a1f03c97b7bb8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -613,6 +613,9 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	val_cr4 |= FSL_SAI_CR4_FRSZ(slots);
 
+	/* Set to avoid channel swap */
+	val_cr4 |= FSL_SAI_CR4_FCONT;
+
 	/* Set to output mode to avoid tri-stated data pins */
 	if (tx)
 		val_cr4 |= FSL_SAI_CR4_CHMOD;
@@ -699,7 +702,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
-			   FSL_SAI_CR4_CHMOD_MASK,
+			   FSL_SAI_CR4_CHMOD_MASK | FSL_SAI_CR4_FCONT_MASK,
 			   val_cr4);
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
 			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index dadbd16ee3945..9c4d19fe22c65 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -137,6 +137,7 @@
 
 /* SAI Transmit and Receive Configuration 4 Register */
 
+#define FSL_SAI_CR4_FCONT_MASK	BIT(28)
 #define FSL_SAI_CR4_FCONT	BIT(28)
 #define FSL_SAI_CR4_FCOMB_SHIFT BIT(26)
 #define FSL_SAI_CR4_FCOMB_SOFT  BIT(27)
-- 
2.43.0


