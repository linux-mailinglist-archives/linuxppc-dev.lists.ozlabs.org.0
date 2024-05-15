Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A814C8C6837
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 16:04:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=vMUehRHq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfZhp3PrPz3g4H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 00:04:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=vMUehRHq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 421 seconds by postgrey-1.37 at boromir; Thu, 16 May 2024 00:01:28 AEST
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfZdh3lQxz3cXQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 00:01:27 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 11B5E9C58F8;
	Wed, 15 May 2024 09:54:35 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id m0WPzNXEVoGy; Wed, 15 May 2024 09:54:34 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7355B9C590D;
	Wed, 15 May 2024 09:54:34 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 7355B9C590D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715781274; bh=nu7o1F7oIEou/u3jOCXnPY2pTDR7854IaHJOM1bAKP4=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=vMUehRHqDDVo2kj6Ju1ueqGjelf7gRGlQjYT41d1N5scjrS/yPZncD7lJpd0rskuZ
	 aKA2TboPx3OhWky3irxzrgBJaVT0AhZ1ayReBG+MTLcdC78rKeXljQkpOsZZOqLLTe
	 5XNdlIn4DM92AuShphnCosh5Fppeeq+KM1l86nYSAnR4q4L+c3hgTlXg29X3yZva9o
	 V7H38tcxbD+bXEUEINMgjRFwJPtmIgjft3RikVE9R3kpNdZ8O2G6daWBOCLp1xN2qx
	 TR0+85Y8BP+vYEKlW2GYvYHs6z5e32G+EQFhDEpmfbAULRrxm++rfkBLbJ9gElic12
	 +gEiYF8UrfjQQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id DnxX3Sr4PIu7; Wed, 15 May 2024 09:54:34 -0400 (EDT)
Received: from gerard.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 78EC19C58F8;
	Wed, 15 May 2024 09:54:32 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCHv4 7/9] ASoC: fsl-asoc-card: add DT clock "cpu_sysclk" with generic codec
Date: Wed, 15 May 2024 15:54:09 +0200
Message-Id: <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add an optional DT clock "cpu_sysclk" to get the CPU DAI system-clock
frequency when using the generic codec.
It is set for both Tx and Rx.
The way the frequency value is used is up to the CPU DAI driver
implementation.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 9aca8ad15372..c7fc9c16f761 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -754,6 +754,12 @@ static int fsl_asoc_card_probe(struct platform_device =
*pdev)
 		snd_soc_of_parse_tdm_slot(np, NULL, NULL,
 						&priv->cpu_priv.slot_num,
 						&priv->cpu_priv.slot_width);
+		struct clk *cpu_sysclk =3D clk_get(&pdev->dev, "cpu_sysclk");
+		if (!IS_ERR(cpu_sysclk)) {
+			priv->cpu_priv.sysclk_freq[TX] =3D clk_get_rate(cpu_sysclk);
+			priv->cpu_priv.sysclk_freq[RX] =3D priv->cpu_priv.sysclk_freq[TX];
+			clk_put(cpu_sysclk);
+		}
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.34.1

