Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B471FC2F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 02:50:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mmhB4BLnzDqq5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 10:50:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=andbOErg; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mmfT3GQrzDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 10:49:05 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id s23so280949pfh.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 17:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Qm0blJqnv9I61KRJJiBPA33J2Aw0IBsqKNB8aVPh6EU=;
 b=andbOErg6vHaVvZwsZ5AQQOmi8cnqX78ltCWGPVM0y3E4tFLZGGOK6qjkD7yGu0Hxn
 OohchWNrpk77aQXwkddEUJKsh/OkVMqWgcGUL0dVmqsKNzutldsaMZkAPZtcnJdLF25M
 b6JDWGZcCyvi2lCTvhIz9wnNdetyiOWupqtdp2uMI6KXIr0kVueuVJ3zc55kYZw/50Nr
 SfMjqQ+xj3MEVowUilpsfvy3rDZeVwhvHroSWywepJ+MG9kRywebgbm03v6eo+ij+LhA
 jSBP+uXU+K5y1+7NmJBqLV2YesfQF6fdnMmZ4oVAuoIjs/iHgi5h9P30gsTPtML8Kx6b
 8byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qm0blJqnv9I61KRJJiBPA33J2Aw0IBsqKNB8aVPh6EU=;
 b=VoQdqhFn0gNtLsJjFOSrO5rCCoCsLq+HkuuwQ4JmLTGSoZyfKO3L7fOhLyQc8zKesh
 OlZXujvVHGF2c4463J+QjJORgN57vWU7RU2kDBqElrknd3zOETg7eisESvJILlqmbd+l
 KMARcNwF3zVNrJmt2EmE7us7SHlk2b/ZyL0lOgkkUmnGqsOv1fXOqL02wEDFLUwzLxBI
 Mrn4FV4dlkX4JM1f6FHNGZL+qhkNbxI9wj1MQaR8aEiPErVAfrfLNn52Mi55nDYhO6Hs
 2kq8wUQ4kxaq2y2PQHnyIx61NLr+pMFSj2mY/6gdMHG4C4m2tPP7kCl6M4k+LVEnAB1b
 q4sg==
X-Gm-Message-State: AOAM533nKUigOg94SpuKGkc4su/ZDY97+273B5zVgAka7gbKBe6yFeBj
 Vhg5gxZSgqkbF6ZwuPMMTHk=
X-Google-Smtp-Source: ABdhPJz65jhSqLsQAU9g8oW3jm/d4pDNC49/CvWZhBX+8bG7IjvN5c7fILW3zJY3g7Bev/JmV1mBMQ==
X-Received: by 2002:a63:5b04:: with SMTP id p4mr4356358pgb.315.1592354943128; 
 Tue, 16 Jun 2020 17:49:03 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id i196sm1591208pgc.55.2020.06.16.17.49.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 17:49:02 -0700 (PDT)
Date: Tue, 16 Jun 2020 17:48:47 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl-asoc-card: Add MQS support
Message-ID: <20200617004845.GB19896@Asurada-Nvidia>
References: <1592292637-25734-1-git-send-email-shengjiu.wang@nxp.com>
 <1592292637-25734-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592292637-25734-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 16, 2020 at 03:30:37PM +0800, Shengjiu Wang wrote:
> The MQS codec isn't an i2c device, so add a new platform device for it.
> 
> MQS only support playback, so add a new audio map.
> 
> Add there maybe "model" property or no "audio-routing" property insertions

"Add" => "And"

> devicetree, so add some enhancement for these two property.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 70 ++++++++++++++++++++++++++---------
>  1 file changed, 52 insertions(+), 18 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 00be73900888..2ac8cb9ddd10 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c

> @@ -482,6 +489,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  {
>  	struct device_node *cpu_np, *codec_np, *asrc_np;
>  	struct device_node *np = pdev->dev.of_node;
> +	struct platform_device *codec_pdev = NULL; /* used for non i2c device*/

Having both codec_pdev and codec_dev duplicates things. Actually
only a couple of places really need "codec_dev" -- most of them
need codec_dev->dev pointer instead. So we could have a cleanup:

-	struct i2c_client *codec_dev;
+	struct device *codec_dev = NULL;

> @@ -512,10 +520,13 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  	}
>  
>  	codec_np = of_parse_phandle(np, "audio-codec", 0);
> -	if (codec_np)
> +	if (codec_np) {
>  		codec_dev = of_find_i2c_device_by_node(codec_np);
> -	else
> +		if (!codec_dev)
> +			codec_pdev = of_find_device_by_node(codec_np);
> +	} else {
>  		codec_dev = NULL;
> +	}

Here can have something like (feel free to simplify):

	if (codec_np) {
		struct platform_device *codec_pdev;
		struct i2c_client *codec_i2c;

		codec_i2c = of_find_i2c_device_by_node(codec_np);
		if (codec_i2c)
			codec_dev = &codec_i2c->dev;

		if (!codec_dev) {
			codec_pdev = of_find_device_by_node(codec_np);
			codec_dev = &codec_pdev->dev;
		}
	}
>  	asrc_np = of_parse_phandle(np, "audio-asrc", 0);
>  	if (asrc_np)
> @@ -525,6 +536,13 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  	if (codec_dev) {
>  		struct clk *codec_clk = clk_get(&codec_dev->dev, NULL);

Then here:

-  		struct clk *codec_clk = clk_get(&codec_dev->dev, NULL);
+  		struct clk *codec_clk = clk_get(codec_dev, NULL);

> @@ -538,6 +556,11 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  	/* Assign a default DAI format, and allow each card to overwrite it */
>  	priv->dai_fmt = DAI_FMT_BASE;
>  
> +	memcpy(priv->dai_link, fsl_asoc_card_dai,
> +	       sizeof(struct snd_soc_dai_link) * ARRAY_SIZE(priv->dai_link));

> @@ -573,13 +596,25 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  		codec_dai_name = "ac97-hifi";
>  		priv->card.set_bias_level = NULL;
>  		priv->dai_fmt = SND_SOC_DAIFMT_AC97;
> +		priv->card.dapm_routes = audio_map_ac97;
> +		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_ac97);
> +	} else if (of_device_is_compatible(np, "fsl,imx-audio-mqs")) {
> +		codec_dai_name = "fsl-mqs-dai";
> +		priv->card.set_bias_level = NULL;
> +		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
> +				SND_SOC_DAIFMT_CBS_CFS |
> +				SND_SOC_DAIFMT_NB_NF;
> +		priv->dai_link[1].dpcm_playback = 1;
> +		priv->dai_link[2].dpcm_playback = 1;

dpcm_playback = 1? That's the default value in fsl_asoc_card_dai.

> @@ -601,19 +636,18 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  		priv->cpu_priv.sysclk_id[0] = FSL_SAI_CLK_MAST1;
>  	}
>  
> -	snprintf(priv->name, sizeof(priv->name), "%s-audio",
> -		 fsl_asoc_card_is_ac97(priv) ? "ac97" :
> -		 codec_dev->name);
> -
>  	/* Initialize sound card */
>  	priv->pdev = pdev;
>  	priv->card.dev = &pdev->dev;
> -	priv->card.name = priv->name;
> +	ret = snd_soc_of_parse_card_name(&priv->card, "model");
> +	if (ret) {
> +		snprintf(priv->name, sizeof(priv->name), "%s-audio",
> +			 fsl_asoc_card_is_ac97(priv) ? "ac97" :
> +			 (codec_dev ? codec_dev->name : codec_pdev->name));

We can just use dev_name() if codec_dev is struct device *
Or having a codec_dev_name to cache codec_pdev/i2c->name.

> -	ret = snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
> -		goto asrc_fail;
> +	if (of_property_read_bool(np, "audio-routing")) {
> +		ret = snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
> +			goto asrc_fail;

Hmm...audio-routing is a required property in DT binding doc.
So you might need to update that too.
