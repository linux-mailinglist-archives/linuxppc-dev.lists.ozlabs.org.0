Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCF4817DFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 00:18:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=A1cKtatz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvG362jtQz3vj8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 10:18:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=A1cKtatz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sv08X0LdCz3bZK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 23:52:12 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A68539C31CC;
	Mon, 18 Dec 2023 07:43:14 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Z2HT4vLoBD6V; Mon, 18 Dec 2023 07:43:14 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 53F209C335A;
	Mon, 18 Dec 2023 07:43:14 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 53F209C335A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702903394; bh=3qPcaZHdj1kfz+pc5ad/l6BFAvniuOuBLv61aSrT+ic=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=A1cKtatzptEFyfbWxiNdgAOzT9yvvqzzrNPrmrSTSxM3esRuzRv0V5jwwCWwNuV1Z
	 zhBrUKFEGIjHw3Q3UZ5TYXztgjMcecpfLuCWnBJrjyJCTfkMCU4JxXG8TjNwhv+SJ3
	 aHKUyket3qK42sN6weGZ8soRQKPjPhfU/fweFWqFVBop1zeA0BmCtiGx1WeCep4tfo
	 xDFfQ33H5kKo/e9g3azCcAnKpq4oZFpKTHlN3WtO1OB8Unlpj64PKJ+KiUDvHAmPfg
	 kWF6CEOCH/xEGSB8XJZ2m6L1sgnId/LSJOHE8MkAADTQYh1z0GTnszgID/KaZbdwlQ
	 1lSogOMlAWpLw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id kx59VGcxw8Q3; Mon, 18 Dec 2023 07:43:14 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 51EA89C31CC;
	Mon, 18 Dec 2023 07:43:12 -0500 (EST)
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
Subject: [PATCHv3 RESEND 08/10] ASoC: fsl-asoc-card: add dts properties "cpu-sysclk-freq"
Date: Mon, 18 Dec 2023 13:40:56 +0100
Message-Id: <20231218124058.2047167-9-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 19 Dec 2023 10:10:16 +1100
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add new optional dts property "cpu-sysclk-freq" to set
custom sysclk frequencies for the CPU DAI with the generic codec.
The way values are used is up to the CPU DAI driver implementation.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 6f6cc8bd3acd..7b0d7df7ae27 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -747,6 +747,10 @@ static int fsl_asoc_card_probe(struct platform_devic=
e *pdev)
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 		of_property_read_u32(np, "cpu-slot-width", &priv->cpu_priv.slot_width)=
;
 		of_property_read_u32(np, "cpu-slot-num", &priv->cpu_priv.slot_num);
+		of_property_read_u32(np, "cpu-sysclk-freq-rx",
+					(u32 *)&priv->cpu_priv.sysclk_freq[RX]);
+		of_property_read_u32(np, "cpu-sysclk-freq-tx",
+					(u32 *)&priv->cpu_priv.sysclk_freq[TX]);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.25.1

