Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D54817E00
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 00:19:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=ohBiwyth;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvG433CDTz3dTZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 10:19:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=ohBiwyth;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=savoirfairelinux.com (client-ip=208.88.110.44; helo=mail.savoirfairelinux.com; envelope-from=elinor.montmasson@savoirfairelinux.com; receiver=lists.ozlabs.org)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sv08X08PXz30hF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 23:52:12 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 89DFA9C2792;
	Mon, 18 Dec 2023 07:42:53 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id N2pfpjLJzC0y; Mon, 18 Dec 2023 07:42:52 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 66E9A9C40DD;
	Mon, 18 Dec 2023 07:42:52 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 66E9A9C40DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702903372; bh=HeMH17/3e3dpPsBU0lBJ2AfWK04qqF/RmKUslC/3Z08=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ohBiwyth66kZk9PYncO8Mhp6u1inK1FuM7IaTpjnA3QHlLsJ8q7RthsBIc3zf0jC+
	 nNTjQ7SYitQYpLZrJo4eESKSnCBlyqvCsX2Ygw5M4H2wzOcKGejLao5dx2nj1glMyk
	 tx6qz50o/oTAb6k11RUy8y9Edim5ROAFOkVblj20GBwRVu17PNB26uzky6FgBeJIEL
	 kwGXrXGHQ9kz71Y0/0e6I3I6HNJCyFcTSc0O1ju89pv823I2wiKdl52FiFHJeO663X
	 xeqeWyTG3v6C2Rj5vPTwfLGvI+tojWFN+s9ZlsMdB6ZSEW3iDxLSp9lrfqUHkFamZF
	 WGcTutAR5CpDw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id gCjW3VPIZEHm; Mon, 18 Dec 2023 07:42:52 -0500 (EST)
Received: from gerard.rennes.sfl (unknown [192.168.216.3])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 53FC99C3FCC;
	Mon, 18 Dec 2023 07:42:50 -0500 (EST)
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
Subject: [PATCHv3 RESEND 03/10] ASoC: fsl-asoc-card: add compatibility to use 2 codecs in dai-links
Date: Mon, 18 Dec 2023 13:40:51 +0100
Message-Id: <20231218124058.2047167-4-elinor.montmasson@savoirfairelinux.com>
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

Adapt the driver to work with configurations using two codecs or more.
Modify fsl_asoc_card_probe() to handle use cases where 2 codecs are
given in the device tree.
This will be needed for the generic codec case.

Use cases using one codec will ignore any given codecs other than the
first.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 233 ++++++++++++++++++++--------------
 1 file changed, 136 insertions(+), 97 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index a62f26fe9802..5dd5493cb931 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -98,7 +98,7 @@ struct fsl_asoc_card_priv {
 	struct simple_util_jack hp_jack;
 	struct simple_util_jack mic_jack;
 	struct platform_device *pdev;
-	struct codec_priv codec_priv;
+	struct codec_priv codec_priv[2];
 	struct cpu_priv cpu_priv;
 	struct snd_soc_card card;
 	u8 streams;
@@ -171,11 +171,13 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_s=
ubstream *substream,
 	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream)=
;
 	struct fsl_asoc_card_priv *priv =3D snd_soc_card_get_drvdata(rtd->card)=
;
 	bool tx =3D substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK;
-	struct codec_priv *codec_priv =3D &priv->codec_priv;
+	struct codec_priv *codec_priv;
+	struct snd_soc_dai *codec_dai;
 	struct cpu_priv *cpu_priv =3D &priv->cpu_priv;
 	struct device *dev =3D rtd->card->dev;
 	unsigned int pll_out;
 	int ret;
+	int i;
=20
 	priv->sample_rate =3D params_rate(params);
 	priv->sample_format =3D params_format(params);
@@ -207,28 +209,32 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_s=
ubstream *substream,
 	}
=20
 	/* Specific configuration for PLL */
-	if (codec_priv->pll_id >=3D 0 && codec_priv->fll_id >=3D 0) {
-		if (priv->sample_format =3D=3D SNDRV_PCM_FORMAT_S24_LE)
-			pll_out =3D priv->sample_rate * 384;
-		else
-			pll_out =3D priv->sample_rate * 256;
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		codec_priv =3D &priv->codec_priv[i];
=20
-		ret =3D snd_soc_dai_set_pll(snd_soc_rtd_to_codec(rtd, 0),
-					  codec_priv->pll_id,
-					  codec_priv->mclk_id,
-					  codec_priv->mclk_freq, pll_out);
-		if (ret) {
-			dev_err(dev, "failed to start FLL: %d\n", ret);
-			goto fail;
-		}
+		if (codec_priv->pll_id >=3D 0 && codec_priv->fll_id >=3D 0) {
+			if (priv->sample_format =3D=3D SNDRV_PCM_FORMAT_S24_LE)
+				pll_out =3D priv->sample_rate * 384;
+			else
+				pll_out =3D priv->sample_rate * 256;
=20
-		ret =3D snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0),
-					     codec_priv->fll_id,
-					     pll_out, SND_SOC_CLOCK_IN);
+			ret =3D snd_soc_dai_set_pll(codec_dai,
+						codec_priv->pll_id,
+						codec_priv->mclk_id,
+						codec_priv->mclk_freq, pll_out);
+			if (ret) {
+				dev_err(dev, "failed to start FLL: %d\n", ret);
+				goto fail;
+			}
=20
-		if (ret && ret !=3D -ENOTSUPP) {
-			dev_err(dev, "failed to set SYSCLK: %d\n", ret);
-			goto fail;
+			ret =3D snd_soc_dai_set_sysclk(codec_dai,
+						codec_priv->fll_id,
+						pll_out, SND_SOC_CLOCK_IN);
+
+			if (ret && ret !=3D -ENOTSUPP) {
+				dev_err(dev, "failed to set SYSCLK: %d\n", ret);
+				goto fail;
+			}
 		}
 	}
=20
@@ -243,28 +249,34 @@ static int fsl_asoc_card_hw_free(struct snd_pcm_sub=
stream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd =3D substream->private_data;
 	struct fsl_asoc_card_priv *priv =3D snd_soc_card_get_drvdata(rtd->card)=
;
-	struct codec_priv *codec_priv =3D &priv->codec_priv;
+	struct codec_priv *codec_priv;
+	struct snd_soc_dai *codec_dai;
 	struct device *dev =3D rtd->card->dev;
 	int ret;
+	int i;
=20
 	priv->streams &=3D ~BIT(substream->stream);
=20
-	if (!priv->streams && codec_priv->pll_id >=3D 0 && codec_priv->fll_id >=
=3D 0) {
-		/* Force freq to be free_freq to avoid error message in codec */
-		ret =3D snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0),
-					     codec_priv->mclk_id,
-					     codec_priv->free_freq,
-					     SND_SOC_CLOCK_IN);
-		if (ret) {
-			dev_err(dev, "failed to switch away from FLL: %d\n", ret);
-			return ret;
-		}
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		codec_priv =3D &priv->codec_priv[i];
=20
-		ret =3D snd_soc_dai_set_pll(snd_soc_rtd_to_codec(rtd, 0),
-					  codec_priv->pll_id, 0, 0, 0);
-		if (ret && ret !=3D -ENOTSUPP) {
-			dev_err(dev, "failed to stop FLL: %d\n", ret);
-			return ret;
+		if (!priv->streams && codec_priv->pll_id >=3D 0 && codec_priv->fll_id =
>=3D 0) {
+			/* Force freq to be free_freq to avoid error message in codec */
+			ret =3D snd_soc_dai_set_sysclk(codec_dai,
+						codec_priv->mclk_id,
+						codec_priv->free_freq,
+						SND_SOC_CLOCK_IN);
+			if (ret) {
+				dev_err(dev, "failed to switch away from FLL: %d\n", ret);
+				return ret;
+			}
+
+			ret =3D snd_soc_dai_set_pll(codec_dai,
+						codec_priv->pll_id, 0, 0, 0);
+			if (ret && ret !=3D -ENOTSUPP) {
+				dev_err(dev, "failed to stop FLL: %d\n", ret);
+				return ret;
+			}
 		}
 	}
=20
@@ -504,10 +516,11 @@ static int fsl_asoc_card_late_probe(struct snd_soc_=
card *card)
 	struct fsl_asoc_card_priv *priv =3D snd_soc_card_get_drvdata(card);
 	struct snd_soc_pcm_runtime *rtd =3D list_first_entry(
 			&card->rtd_list, struct snd_soc_pcm_runtime, list);
-	struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
-	struct codec_priv *codec_priv =3D &priv->codec_priv;
+	struct snd_soc_dai *codec_dai;
+	struct codec_priv *codec_priv;
 	struct device *dev =3D card->dev;
 	int ret;
+	int i;
=20
 	if (fsl_asoc_card_is_ac97(priv)) {
 #if IS_ENABLED(CONFIG_SND_AC97_CODEC)
@@ -526,31 +539,36 @@ static int fsl_asoc_card_late_probe(struct snd_soc_=
card *card)
 		return 0;
 	}
=20
-	ret =3D snd_soc_dai_set_sysclk(codec_dai, codec_priv->mclk_id,
-				     codec_priv->mclk_freq, SND_SOC_CLOCK_IN);
-	if (ret && ret !=3D -ENOTSUPP) {
-		dev_err(dev, "failed to set sysclk in %s\n", __func__);
-		return ret;
-	}
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		codec_priv =3D &priv->codec_priv[i];
=20
-	if (!IS_ERR_OR_NULL(codec_priv->mclk))
-		clk_prepare_enable(codec_priv->mclk);
+		ret =3D snd_soc_dai_set_sysclk(codec_dai, codec_priv->mclk_id,
+					codec_priv->mclk_freq, SND_SOC_CLOCK_IN);
+		if (ret && ret !=3D -ENOTSUPP) {
+			dev_err(dev, "failed to set sysclk in %s\n", __func__);
+			return ret;
+		}
+
+		if (!IS_ERR_OR_NULL(codec_priv->mclk))
+			clk_prepare_enable(codec_priv->mclk);
+	}
=20
 	return 0;
 }
=20
 static int fsl_asoc_card_probe(struct platform_device *pdev)
 {
-	struct device_node *cpu_np, *codec_np, *asrc_np;
+	struct device_node *cpu_np, *asrc_np;
+	struct device_node *codec_np[2];
 	struct device_node *np =3D pdev->dev.of_node;
 	struct platform_device *asrc_pdev =3D NULL;
 	struct device_node *bitclkprovider =3D NULL;
 	struct device_node *frameprovider =3D NULL;
 	struct platform_device *cpu_pdev;
 	struct fsl_asoc_card_priv *priv;
-	struct device *codec_dev =3D NULL;
+	struct device *codec_dev[2] =3D { NULL, NULL };
 	const char *codec_dai_name;
-	const char *codec_dev_name;
+	const char *codec_dev_name[2];
 	u32 asrc_fmt =3D 0;
 	u32 width;
 	int ret;
@@ -576,21 +594,25 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 		goto fail;
 	}
=20
-	codec_np =3D of_parse_phandle(np, "audio-codec", 0);
-	if (codec_np) {
-		struct platform_device *codec_pdev;
-		struct i2c_client *codec_i2c;
+	codec_np[0] =3D of_parse_phandle(np, "audio-codec", 0);
+	codec_np[1] =3D of_parse_phandle(np, "audio-codec", 1);
=20
-		codec_i2c =3D of_find_i2c_device_by_node(codec_np);
-		if (codec_i2c) {
-			codec_dev =3D &codec_i2c->dev;
-			codec_dev_name =3D codec_i2c->name;
-		}
-		if (!codec_dev) {
-			codec_pdev =3D of_find_device_by_node(codec_np);
-			if (codec_pdev) {
-				codec_dev =3D &codec_pdev->dev;
-				codec_dev_name =3D codec_pdev->name;
+	for (int i =3D 0; i < 2; i++) {
+		if (codec_np[i]) {
+			struct platform_device *codec_pdev;
+			struct i2c_client *codec_i2c;
+
+			codec_i2c =3D of_find_i2c_device_by_node(codec_np[i]);
+			if (codec_i2c) {
+				codec_dev[i] =3D &codec_i2c->dev;
+				codec_dev_name[i] =3D codec_i2c->name;
+			}
+			if (!codec_dev[i]) {
+				codec_pdev =3D of_find_device_by_node(codec_np[i]);
+				if (codec_pdev) {
+					codec_dev[i] =3D &codec_pdev->dev;
+					codec_dev_name[i] =3D codec_pdev->name;
+				}
 			}
 		}
 	}
@@ -600,12 +622,14 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 		asrc_pdev =3D of_find_device_by_node(asrc_np);
=20
 	/* Get the MCLK rate only, and leave it controlled by CODEC drivers */
-	if (codec_dev) {
-		struct clk *codec_clk =3D clk_get(codec_dev, NULL);
+	for (int i =3D 0; i < 2; i++) {
+		if (codec_dev[i]) {
+			struct clk *codec_clk =3D clk_get(codec_dev[i], NULL);
=20
-		if (!IS_ERR(codec_clk)) {
-			priv->codec_priv.mclk_freq =3D clk_get_rate(codec_clk);
-			clk_put(codec_clk);
+			if (!IS_ERR(codec_clk)) {
+				priv->codec_priv[i].mclk_freq =3D clk_get_rate(codec_clk);
+				clk_put(codec_clk);
+			}
 		}
 	}
=20
@@ -625,25 +649,27 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 	priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map);
 	priv->card.driver_name =3D DRIVER_NAME;
=20
-	priv->codec_priv.fll_id =3D -1;
-	priv->codec_priv.pll_id =3D -1;
+	for (int i =3D 0; i < 2; i++) {
+		priv->codec_priv[i].fll_id =3D -1;
+		priv->codec_priv[i].pll_id =3D -1;
+	}
=20
 	/* Diversify the card configurations */
 	if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
 		codec_dai_name =3D "cs42888";
-		priv->cpu_priv.sysclk_freq[TX] =3D priv->codec_priv.mclk_freq;
-		priv->cpu_priv.sysclk_freq[RX] =3D priv->codec_priv.mclk_freq;
+		priv->cpu_priv.sysclk_freq[TX] =3D priv->codec_priv[0].mclk_freq;
+		priv->cpu_priv.sysclk_freq[RX] =3D priv->codec_priv[0].mclk_freq;
 		priv->cpu_priv.sysclk_dir[TX] =3D SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] =3D SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.slot_width =3D 32;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBC_CFC;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-cs427x")) {
 		codec_dai_name =3D "cs4271-hifi";
-		priv->codec_priv.mclk_id =3D CS427x_SYSCLK_MCLK;
+		priv->codec_priv[0].mclk_id =3D CS427x_SYSCLK_MCLK;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-sgtl5000")) {
 		codec_dai_name =3D "sgtl5000";
-		priv->codec_priv.mclk_id =3D SGTL5000_SYSCLK;
+		priv->codec_priv[0].mclk_id =3D SGTL5000_SYSCLK;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic32x4")) =
{
 		codec_dai_name =3D "tlv320aic32x4-hifi";
@@ -659,14 +685,14 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 		priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8962")) {
 		codec_dai_name =3D "wm8962";
-		priv->codec_priv.mclk_id =3D WM8962_SYSCLK_MCLK;
-		priv->codec_priv.fll_id =3D WM8962_SYSCLK_FLL;
-		priv->codec_priv.pll_id =3D WM8962_FLL;
+		priv->codec_priv[0].mclk_id =3D WM8962_SYSCLK_MCLK;
+		priv->codec_priv[0].fll_id =3D WM8962_SYSCLK_FLL;
+		priv->codec_priv[0].pll_id =3D WM8962_FLL;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8960")) {
 		codec_dai_name =3D "wm8960-hifi";
-		priv->codec_priv.fll_id =3D WM8960_SYSCLK_AUTO;
-		priv->codec_priv.pll_id =3D WM8960_SYSCLK_AUTO;
+		priv->codec_priv[0].fll_id =3D WM8960_SYSCLK_AUTO;
+		priv->codec_priv[0].pll_id =3D WM8960_SYSCLK_AUTO;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-ac97")) {
 		codec_dai_name =3D "ac97-hifi";
@@ -698,20 +724,20 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8958")) {
 		codec_dai_name =3D "wm8994-aif1";
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
-		priv->codec_priv.mclk_id =3D WM8994_FLL_SRC_MCLK1;
-		priv->codec_priv.fll_id =3D WM8994_SYSCLK_FLL1;
-		priv->codec_priv.pll_id =3D WM8994_FLL1;
-		priv->codec_priv.free_freq =3D priv->codec_priv.mclk_freq;
+		priv->codec_priv[0].mclk_id =3D WM8994_FLL_SRC_MCLK1;
+		priv->codec_priv[0].fll_id =3D WM8994_SYSCLK_FLL1;
+		priv->codec_priv[0].pll_id =3D WM8994_FLL1;
+		priv->codec_priv[0].free_freq =3D priv->codec_priv[0].mclk_freq;
 		priv->card.dapm_routes =3D NULL;
 		priv->card.num_dapm_routes =3D 0;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-nau8822")) {
 		codec_dai_name =3D "nau8822-hifi";
-		priv->codec_priv.mclk_id =3D NAU8822_CLK_MCLK;
-		priv->codec_priv.fll_id =3D NAU8822_CLK_PLL;
-		priv->codec_priv.pll_id =3D NAU8822_CLK_PLL;
+		priv->codec_priv[0].mclk_id =3D NAU8822_CLK_MCLK;
+		priv->codec_priv[0].fll_id =3D NAU8822_CLK_PLL;
+		priv->codec_priv[0].pll_id =3D NAU8822_CLK_PLL;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBM_CFM;
-		if (codec_dev)
-			priv->codec_priv.mclk =3D devm_clk_get(codec_dev, NULL);
+		if (codec_dev[0])
+			priv->codec_priv[0].mclk =3D devm_clk_get(codec_dev[0], NULL);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
@@ -722,18 +748,30 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 	 * Allow setting mclk-id from the device-tree node. Otherwise, the
 	 * default value for each card configuration is used.
 	 */
-	of_property_read_u32(np, "mclk-id", &priv->codec_priv.mclk_id);
+	for (int i =3D 0; i < 2; i++) {
+		of_property_read_u32_index(np, "mclk-id", i,
+					&priv->codec_priv[i].mclk_id);
+	}
=20
 	/* Format info from DT is optional. */
 	snd_soc_daifmt_parse_clock_provider_as_phandle(np, NULL, &bitclkprovide=
r, &frameprovider);
 	if (bitclkprovider || frameprovider) {
 		unsigned int daifmt =3D snd_soc_daifmt_parse_format(np, NULL);
+		bool codec_bitclkprovider =3D false;
+		bool codec_frameprovider =3D false;
+
+		for (int i =3D 0; i < 2; i++) {
+			if (bitclkprovider && codec_np[i] =3D=3D bitclkprovider)
+				codec_bitclkprovider =3D true;
+			if (frameprovider && codec_np[i] =3D=3D frameprovider)
+				codec_frameprovider =3D true;
+		}
=20
-		if (codec_np =3D=3D bitclkprovider)
-			daifmt |=3D (codec_np =3D=3D frameprovider) ?
+		if (codec_bitclkprovider)
+			daifmt |=3D (codec_frameprovider) ?
 				SND_SOC_DAIFMT_CBP_CFP : SND_SOC_DAIFMT_CBP_CFC;
 		else
-			daifmt |=3D (codec_np =3D=3D frameprovider) ?
+			daifmt |=3D (codec_frameprovider) ?
 				SND_SOC_DAIFMT_CBC_CFP : SND_SOC_DAIFMT_CBC_CFC;
=20
 		/* Override dai_fmt with value from DT */
@@ -749,7 +787,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	of_node_put(bitclkprovider);
 	of_node_put(frameprovider);
=20
-	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
+	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev[0]) {
 		dev_dbg(&pdev->dev, "failed to find codec device\n");
 		ret =3D -EPROBE_DEFER;
 		goto asrc_fail;
@@ -789,7 +827,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	ret =3D snd_soc_of_parse_card_name(&priv->card, "model");
 	if (ret) {
 		snprintf(priv->name, sizeof(priv->name), "%s-audio",
-			 fsl_asoc_card_is_ac97(priv) ? "ac97" : codec_dev_name);
+			 fsl_asoc_card_is_ac97(priv) ? "ac97" : codec_dev_name[0]);
 		priv->card.name =3D priv->name;
 	}
 	priv->card.dai_link =3D priv->dai_link;
@@ -814,7 +852,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	priv->dai_link[0].codecs[0].dai_name =3D codec_dai_name;
=20
 	if (!fsl_asoc_card_is_ac97(priv))
-		priv->dai_link[0].codecs[0].of_node =3D codec_np;
+		priv->dai_link[0].codecs[0].of_node =3D codec_np[0];
 	else {
 		u32 idx;
=20
@@ -922,7 +960,8 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
=20
 asrc_fail:
 	of_node_put(asrc_np);
-	of_node_put(codec_np);
+	of_node_put(codec_np[0]);
+	of_node_put(codec_np[1]);
 	put_device(&cpu_pdev->dev);
 fail:
 	of_node_put(cpu_np);
--=20
2.25.1

