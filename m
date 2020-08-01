Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DD8235119
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Aug 2020 10:02:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJc7N3qYtzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Aug 2020 18:02:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CEJxdjnQ; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJc555LPczDqBP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Aug 2020 18:00:07 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id e22so8873261pjt.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Aug 2020 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i64OqGOKUX2vRbPCdcwPu4hJ7VHYiYruzv3gOuWclhA=;
 b=CEJxdjnQCINWOcopnZ4Wu5K7tT+eBGOPqTLjCGe07JxfaHDZnQ4FDVxWeQr/je90Mf
 KYxMbtfrx6Pk8e7SeDv57mGg6JGW/Zv0G1af6LAmKB3EkEYNCfu76G86T9uIQPJ7eFgK
 0lk4PK/El+KSfNGOYoSpeflHAns3aqDX8cfwxnfv1H9pnwQnjCG0K+KVrbGmf3mFhn+2
 p6s69ml2dp/5goOx1TBru+VHAwmiAJUHKaw1d3ZP61ofCwm2XiO4mDrY08EUWMU81Fgd
 avj3VZOBOgTE2APc8mLX3jz+3T/oDph4xsU0bBFu20PGvvxrjp4cb43ZlhSapub8Kd7t
 oBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i64OqGOKUX2vRbPCdcwPu4hJ7VHYiYruzv3gOuWclhA=;
 b=FJVC9oxc+LWRcLLKWA45E9YL1URGE2abdURQTAt7wcpztjUzzRs1OzXh7q7mOeE0pY
 C523a5fwX/JPRL5Ow5VEVQ3GhfJwQ5H6LNbVZB+5Imd9whzoNlNMj/8QltBzYAoCz26+
 XZYuRZEQkiA/gkuOYDkGaIJBDTBTEYsV6+hFpSG9+rtm5DsBtsr0yJvHix6+5sfGyVKY
 FF5xHcpzEFRGKqgkBjo/stBfANvLuAW9kbMrTTa7YAK8/XdW89eYQpPuwcZteq2VrnSH
 ICNNVxUUzLJIH9ijg9+Chau8vDU8JbMCh7ylQ2xpXxdL8+Vld0WJDvnNpsu3cDtf58RA
 vvkA==
X-Gm-Message-State: AOAM530f8CFQfjKKob3rZesPI/3hFY6MLtI384UNyTMNU032GQ/UmLzP
 jngp0flN4Z19yjNsTEhPOjA=
X-Google-Smtp-Source: ABdhPJyX87jF7+C/BEL9ElATQshMUqsrjaIT8uJiXDwTgR1Lg3kd7vr7cKVtr/cp+/DBXHYU2vE0KA==
X-Received: by 2002:a17:902:7688:: with SMTP id
 m8mr6794990pll.12.1596268803816; 
 Sat, 01 Aug 2020 01:00:03 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id f6sm13342385pfa.23.2020.08.01.01.00.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 01 Aug 2020 01:00:03 -0700 (PDT)
Date: Sat, 1 Aug 2020 00:59:54 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Remove
 fsl_asoc_card_set_bias_level function
Message-ID: <20200801075954.GA19629@Asurada-Nvidia>
References: <1596102422-14010-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596102422-14010-1-git-send-email-shengjiu.wang@nxp.com>
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

Hi,

Having two nits and one question, inline:

On Thu, Jul 30, 2020 at 05:47:02PM +0800, Shengjiu Wang wrote:
> @@ -182,6 +180,69 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
>  					       cpu_priv->slot_width);
>  		if (ret && ret != -ENOTSUPP) {
>  			dev_err(dev, "failed to set TDM slot for cpu dai\n");
> +			goto out;
> +		}
> +	}
> +
> +	/* Specific configuration for PLL */
> +	if (codec_priv->pll_id && codec_priv->fll_id) {
> +		if (priv->sample_format == SNDRV_PCM_FORMAT_S24_LE)
> +			pll_out = priv->sample_rate * 384;
> +		else
> +			pll_out = priv->sample_rate * 256;
> +
> +		ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0),
> +					  codec_priv->pll_id,
> +					  codec_priv->mclk_id,
> +					  codec_priv->mclk_freq, pll_out);
> +		if (ret) {
> +			dev_err(dev, "failed to start FLL: %d\n", ret);
> +			goto out;
> +		}
> +
> +		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
> +					     codec_priv->fll_id,
> +					     pll_out, SND_SOC_CLOCK_IN);

Just came into my mind: do we need some protection here to prevent
PLL/SYSCLK reconfiguration if TX/RX end up with different values?

> +	return 0;
> +
> +out:
> +	priv->streams &= ~BIT(substream->stream);
> +	return ret;

Rather than "out:" which doesn't explicitly indicate an error-out,
"fail:" would be better, following what we used in probe().

> +static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> +	struct codec_priv *codec_priv = &priv->codec_priv;
> +	struct device *dev = rtd->card->dev;
> +	int ret;
> +
> +	priv->streams &= ~BIT(substream->stream);
> +

> +	if (!priv->streams && codec_priv->pll_id &&
> +	    codec_priv->fll_id) {

This now can fit into single line :)
