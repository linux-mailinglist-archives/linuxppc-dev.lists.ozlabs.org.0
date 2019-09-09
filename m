Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 362BBADFC4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 22:04:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rzdf538xzDqRR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 06:04:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IrWT20fb"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RzbV4ZwwzDqQB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 06:02:23 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id q5so9919178pfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 13:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xW7EQcr0CjNApYbCMIe6HxKaG8AfbdjFuus/B7ASN4M=;
 b=IrWT20fbQOnXyNKinqp5OPc/kpar1wnCgipwXSgm71GIDrbS2sjQCkbzspksAGbCLH
 4i0o33F7A44k9WtSfCrUbvTAdNcg3yrKovUufCA2dtKvHtVka28le5119zq+0Cv2CIWw
 SwA5UHo9Bu1YXk+jtQsx6EU71AtPmYqSFsiV3rZRmVdSPmwGZOoVtugLG/3yN4Uzq/NH
 F70FnGSjwOeI1SAuHwBy0cn7IF+ly5AHiE6egoYGKDxl/UTvW4OhZrq2uoLTkkHAsbsE
 t/EQefOrA5vf7HPDMVmHT7ohO9JVZk/JS38HeqYsWcb/4D4mGO9/C7EwUDIy1zRNq2KV
 E0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xW7EQcr0CjNApYbCMIe6HxKaG8AfbdjFuus/B7ASN4M=;
 b=O/dPB+w6bKkVGIPJOCdusUlV3p4PZsiYv9TWdkkGPYMrmJISnY9YtTEDhD/2Bqmysq
 rZCEGtji4K4wGEqSHujpWp7/rH5O4K0sgKm4JLtzmdE1V/z61fIeAcxcGENOPSHCAUMt
 lRk3X01lffocyx7l1n1zUTdx1rLRTJO0KdGodeOB+0sC5jdsNefui4Jgco+gISN+JUGd
 reAOjrZi0N3JFIxHHTBjDja30tFt7sjcahlI1c0OS+wAey5mwS0yE3kOXt1TW0R6TSRo
 l1gOPvFt0eqy2N2uml4m9uI1zeg9gTGKwByIyyAUAv6NjQ2/LsXbi6eBPg5YxEWEGfs7
 U1dw==
X-Gm-Message-State: APjAAAXBGdMTfrmKnf5JRWeCUO+GSuHv7Uzrra8gjTqLlL1ufCs1oPSM
 rH4Qq46/JHvSfln9UKjoIG4=
X-Google-Smtp-Source: APXvYqzTkwJBa3F0RxKnqmT5gOH5RbcRfdaf81JN1nzvoeP3MdObNZQOet8DwV8ZjCgD7GTvPLYVBA==
X-Received: by 2002:a63:3c5:: with SMTP id 188mr23042649pgd.394.1568059341642; 
 Mon, 09 Sep 2019 13:02:21 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id p17sm16111267pff.27.2019.09.09.13.02.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Sep 2019 13:02:21 -0700 (PDT)
Date: Mon, 9 Sep 2019 13:01:57 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_asrc: Use in(out)put_format instead of
 in(out)put_word_width
Message-ID: <20190909200156.GB10344@Asurada-Nvidia.nvidia.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <65e96ca15afd4a282b122f3ea8b13642cf4614c7.1568025083.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65e96ca15afd4a282b122f3ea8b13642cf4614c7.1568025083.git.shengjiu.wang@nxp.com>
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 09, 2019 at 06:33:19PM -0400, Shengjiu Wang wrote:
> snd_pcm_format_t is more formal than enum asrc_word_width, which has
> two property, width and physical width, which is more accurate than
> enum asrc_word_width. So it is better to use in(out)put_format
> instead of in(out)put_word_width.

Hmm...I don't really see the benefit of using snd_pcm_format_t
here...I mean, I know it's a generic one, and would understand
if we use it as a param for a common API. But this patch merely
packs the "width" by intentionally using this snd_pcm_format_t
and then adds another translation to unpack it.. I feel it's a
bit overcomplicated. Or am I missing something?

And I feel it's not necessary to use ALSA common format in our
own "struct asrc_config" since it is more IP/register specific. 

Thanks
Nicolin

> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c | 56 +++++++++++++++++++++++++++-------------
>  sound/soc/fsl/fsl_asrc.h |  4 +--
>  2 files changed, 40 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index cfa40ef6b1ca..4d3804a1ea55 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -265,6 +265,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  	struct asrc_config *config = pair->config;
>  	struct fsl_asrc *asrc_priv = pair->asrc_priv;
>  	enum asrc_pair_index index = pair->index;
> +	enum asrc_word_width input_word_width;
> +	enum asrc_word_width output_word_width;
>  	u32 inrate, outrate, indiv, outdiv;
>  	u32 clk_index[2], div[2];
>  	int in, out, channels;
> @@ -283,9 +285,32 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  		return -EINVAL;
>  	}
>  
> -	/* Validate output width */
> -	if (config->output_word_width == ASRC_WIDTH_8_BIT) {
> -		pair_err("does not support 8bit width output\n");
> +	switch (snd_pcm_format_width(config->input_format)) {
> +	case 8:
> +		input_word_width = ASRC_WIDTH_8_BIT;
> +		break;
> +	case 16:
> +		input_word_width = ASRC_WIDTH_16_BIT;
> +		break;
> +	case 24:
> +		input_word_width = ASRC_WIDTH_24_BIT;
> +		break;
> +	default:
> +		pair_err("does not support this input format, %d\n",
> +			 config->input_format);
> +		return -EINVAL;
> +	}
> +
> +	switch (snd_pcm_format_width(config->output_format)) {
> +	case 16:
> +		output_word_width = ASRC_WIDTH_16_BIT;
> +		break;
> +	case 24:
> +		output_word_width = ASRC_WIDTH_24_BIT;
> +		break;
> +	default:
> +		pair_err("does not support this output format, %d\n",
> +			 config->output_format);
>  		return -EINVAL;
>  	}
>  
> @@ -383,8 +408,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  	/* Implement word_width configurations */
>  	regmap_update_bits(asrc_priv->regmap, REG_ASRMCR1(index),
>  			   ASRMCR1i_OW16_MASK | ASRMCR1i_IWD_MASK,
> -			   ASRMCR1i_OW16(config->output_word_width) |
> -			   ASRMCR1i_IWD(config->input_word_width));
> +			   ASRMCR1i_OW16(output_word_width) |
> +			   ASRMCR1i_IWD(input_word_width));
>  
>  	/* Enable BUFFER STALL */
>  	regmap_update_bits(asrc_priv->regmap, REG_ASRMCR(index),
> @@ -497,13 +522,13 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
>  				  struct snd_soc_dai *dai)
>  {
>  	struct fsl_asrc *asrc_priv = snd_soc_dai_get_drvdata(dai);
> -	int width = params_width(params);
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct fsl_asrc_pair *pair = runtime->private_data;
>  	unsigned int channels = params_channels(params);
>  	unsigned int rate = params_rate(params);
>  	struct asrc_config config;
> -	int word_width, ret;
> +	snd_pcm_format_t format;
> +	int ret;
>  
>  	ret = fsl_asrc_request_pair(channels, pair);
>  	if (ret) {
> @@ -513,15 +538,10 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
>  
>  	pair->config = &config;
>  
> -	if (width == 16)
> -		width = ASRC_WIDTH_16_BIT;
> -	else
> -		width = ASRC_WIDTH_24_BIT;
> -
>  	if (asrc_priv->asrc_width == 16)
> -		word_width = ASRC_WIDTH_16_BIT;
> +		format = SNDRV_PCM_FORMAT_S16_LE;
>  	else
> -		word_width = ASRC_WIDTH_24_BIT;
> +		format = SNDRV_PCM_FORMAT_S24_LE;
>  
>  	config.pair = pair->index;
>  	config.channel_num = channels;
> @@ -529,13 +549,13 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
>  	config.outclk = OUTCLK_ASRCK1_CLK;
>  
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		config.input_word_width   = width;
> -		config.output_word_width  = word_width;
> +		config.input_format   = params_format(params);
> +		config.output_format  = format;
>  		config.input_sample_rate  = rate;
>  		config.output_sample_rate = asrc_priv->asrc_rate;
>  	} else {
> -		config.input_word_width   = word_width;
> -		config.output_word_width  = width;
> +		config.input_format   = format;
> +		config.output_format  = params_format(params);
>  		config.input_sample_rate  = asrc_priv->asrc_rate;
>  		config.output_sample_rate = rate;
>  	}
> diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> index c60075112570..38af485bdd22 100644
> --- a/sound/soc/fsl/fsl_asrc.h
> +++ b/sound/soc/fsl/fsl_asrc.h
> @@ -342,8 +342,8 @@ struct asrc_config {
>  	unsigned int dma_buffer_size;
>  	unsigned int input_sample_rate;
>  	unsigned int output_sample_rate;
> -	enum asrc_word_width input_word_width;
> -	enum asrc_word_width output_word_width;
> +	snd_pcm_format_t input_format;
> +	snd_pcm_format_t output_format;
>  	enum asrc_inclk inclk;
>  	enum asrc_outclk outclk;
>  };
> -- 
> 2.21.0
> 
