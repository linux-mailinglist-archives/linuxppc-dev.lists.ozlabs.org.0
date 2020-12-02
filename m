Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EFA2CC7A8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 21:24:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmVnR3fWpzDqvR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 07:24:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c17HjQZo; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmVlL36rYzDqpd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 07:22:51 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id u2so1748030pls.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Dec 2020 12:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jPXLgrfmPsVossgPwOVXqHGCtH2YsRf8UcPWK89e/XE=;
 b=c17HjQZoRSkabFcQ4upzoWsYEn2nhGmFpVMHiOWRalYsFPACNwPPlFHfRqr55n1ifW
 UIbf93b6R4dwdO/1sf1rOV1GFKBOduB4JyTWTYqkpkMr2k22teMqdR4+8cI+A1Xf+D2d
 yejUZ1H8KRnenqf603ZtkoJrhm+SiFOvH80nPnS+ngZUT0kThG9j9+fH1Qnsr6MlptDf
 0dZch+3qT+ebRiq3Qkg6r2MonVxgBYEXmxkarId8LsLmhv/3nzTeapzeuZs8ChORAnMZ
 WwgpkmAUzoNwyLhfvQ/lGRDDKg2sQNFFVAc7apcQrLmjRb2wyHRF7uhh1+K6blqtJYAL
 8Vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jPXLgrfmPsVossgPwOVXqHGCtH2YsRf8UcPWK89e/XE=;
 b=TgPOYaNHNZ29+7ZtbhpdjvU6Y/dLf9tEl8H7ItfRwpBr3poXPZP6CtbCH79t0zNn4z
 wtqmeq3aPEnfC4MXMHZdICj3Tac71wOaU2L4HWSL29maqSTNnt6uPGhpF6dbMSa0UblP
 cLzEPS/62afHWb6xHyj+KJlAUVrY3xBDJwaqLt+3qZ6pRajl+G7ks+S4jk9X2sdldxuW
 k/VSWj4O8Dvet4nQY4A8HuP8WAIu3yVpNSA9Gp0nl1t1H+8H88l8LYHj+WNPGtREek8U
 09X+PVkieCZgmZp5dLXamVbC3SFuljJTdWGiV220yMvCgj08Z5o+TTKeHEZWdjCFBqCu
 gwug==
X-Gm-Message-State: AOAM533DHIG5oxt+TEO8uNPP6EYlFxHPpxkHDxA0Pttg/kIcVTufWFUQ
 Fx8Sb6MceK+NuEZba6qqdPlF29dbL5fJQg==
X-Google-Smtp-Source: ABdhPJxyoo5uUzNVQaIgO+msO41uuAmT3ThpDEhUjZBbVx2SqAjC19UkpnvYRwGuaCRaSQqQYxOxaQ==
X-Received: by 2002:a17:902:7c8d:b029:da:625c:8218 with SMTP id
 y13-20020a1709027c8db02900da625c8218mr4161472pll.26.1606940568169; 
 Wed, 02 Dec 2020 12:22:48 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 143sm593457pfc.119.2020.12.02.12.22.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Dec 2020 12:22:47 -0800 (PST)
Date: Wed, 2 Dec 2020 12:19:56 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl: Add imx-hdmi machine driver
Message-ID: <20201202201955.GB1498@Asurada-Nvidia>
References: <1606455021-18882-1-git-send-email-shengjiu.wang@nxp.com>
 <1606455021-18882-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606455021-18882-2-git-send-email-shengjiu.wang@nxp.com>
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

On Fri, Nov 27, 2020 at 01:30:21PM +0800, Shengjiu Wang wrote:
> The driver is initially designed for sound card using HDMI
> interface on i.MX platform. There is internal HDMI IP or
> external HDMI modules connect with SAI or AUD2HTX interface.
> It supports both transmitter and receiver devices.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/Kconfig    |  12 ++
>  sound/soc/fsl/Makefile   |   2 +
>  sound/soc/fsl/imx-hdmi.c | 235 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 249 insertions(+)
>  create mode 100644 sound/soc/fsl/imx-hdmi.c

> diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
> new file mode 100644
> index 000000000000..ac164514b1b2
> --- /dev/null
> +++ b/sound/soc/fsl/imx-hdmi.c

> +static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
> +			      struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct imx_hdmi_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +	struct snd_soc_card *card = rtd->card;
> +	struct device *dev = card->dev;
> +	int ret;
> +
> +	/* set cpu DAI configuration */
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, data->cpu_priv.sysclk_id[tx],
> +				     8 * data->cpu_priv.slot_width * params_rate(params),

Looks like fixed 2 slots being used, judging by the set_tdm_slot
call below. Then...why "8 *"? Probably need a line of comments?

> +				     tx ? SND_SOC_CLOCK_OUT : SND_SOC_CLOCK_IN);
> +	if (ret && ret != -ENOTSUPP) {
> +		dev_err(dev, "failed to set cpu sysclk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0, 2, data->cpu_priv.slot_width);

May have a local variable to cache slot_width.

> +static int imx_hdmi_probe(struct platform_device *pdev)

> +	data->dai.name = "i.MX HDMI";
> +	data->dai.stream_name = "i.MX HDMI";
> +	data->dai.cpus->dai_name = dev_name(&cpu_pdev->dev);
> +	data->dai.platforms->of_node = cpu_np;
> +	data->dai.ops = &imx_hdmi_ops;
> +	data->dai.playback_only = true;
> +	data->dai.capture_only = false;
> +	data->dai.init = imx_hdmi_init;
> +
> +
> +	if (of_property_read_bool(np, "hdmi-out")) {
> +		data->dai.playback_only = true;
> +		data->dai.capture_only = false;
> +		data->dai.codecs->dai_name = "i2s-hifi";
> +		data->dai.codecs->name = "hdmi-audio-codec.1";
> +		data->dai.dai_fmt = data->dai_fmt |
> +				    SND_SOC_DAIFMT_NB_NF |
> +				    SND_SOC_DAIFMT_CBS_CFS;
> +	}
> +
> +	if (of_property_read_bool(np, "hdmi-in")) {
> +		data->dai.playback_only = false;
> +		data->dai.capture_only = true;
> +		data->dai.codecs->dai_name = "i2s-hifi";
> +		data->dai.codecs->name = "hdmi-audio-codec.2";
> +		data->dai.dai_fmt = data->dai_fmt |
> +				    SND_SOC_DAIFMT_NB_NF |
> +				    SND_SOC_DAIFMT_CBM_CFM;
> +	}
> +
> +	if ((data->dai.playback_only && data->dai.capture_only) ||
> +	    (!data->dai.playback_only && !data->dai.capture_only)) {
> +		dev_err(&pdev->dev, "Wrongly enable HDMI DAI link\n");
> +		goto fail;
> +	}

Seems that this condition check can never be true, given that:
1. By default: playback_only=true && capture_only=false
2. Conditionally overwritten: playback_only=true && capture_only=false
3. Conditionally overwritten: playback_only=false && capture_only=true

If I understand it correctly, probably should be something like:
	bool hdmi_out = of_property_read_bool(np, "hdmi-out");
	bool hdmi_in = of_property_read_bool(np, "hdmi-in");

	if ((hdmi_out && hdmi_in) || (!hdmi_out || !hdmi_in))
		// "Invalid HDMI DAI link"; goto fail;

	if (hdmi_out) {
		// ...
	} else if (hdmi_in) {
		// ...
	} else // No need of this line if two properties are exclusive

> +	data->card.num_links = 1;
> +	data->card.dai_link = &data->dai;
> +
> +	platform_set_drvdata(pdev, &data->card);

Why pass card pointer?
