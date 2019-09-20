Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB16B9AAF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 01:28:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZqdS4TFczF3nc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 09:27:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sv0ycOVZ"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zqbp1M4DzF3Nl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 09:26:27 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id q24so3870482plr.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 16:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CA6mH2s7/mQqbWPAIxBYkadhzeqMoOn4kmubZpmIYQA=;
 b=sv0ycOVZPEhTBxFw+PhY1TKXnOl5DVN2Av+2c6JW39gGUGeaaPf9JWdZpzhfhjyDvO
 tHo5pFIxpbHshEplJahmcB28BZVO66DXVbj2Etn1qVpN/UyRaEys8guhMCBUGWa3Pdps
 RwEUfv849KjqGBzz5YzRqXMYHsE2hTKKND/lC1Ak9mBG11lytDDhN+YuEfWxOa7G7DG2
 70IUKQm0VRf3zc5GtNZG2Sz8i3JA1ZgYokOXQL3Rp2Nl2Ri/jFFw2/ckRuCEF/dQ2nF8
 FRjZ4M/463RnpHE6i+2XVRXIkNXaaQzojkcpObFvr65CCoiwweYS2QoO8s5RYoJnpHod
 fXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CA6mH2s7/mQqbWPAIxBYkadhzeqMoOn4kmubZpmIYQA=;
 b=EpEx9VzpdpTNCAsTeP005l3vSL2Vf//bhlTj1Eci6otGr9YZ2PC4YK3/9225EQFG8f
 CfzSpc4kfaG0iD34SCkLKqurG6CnCIJuMyO9bL6FqElOR29djpiVCrskz1Iqy0uzeWbI
 7+ruskph/gM60Xa5ifrCszJuqXGXHmiFq2HDATsb+kNC5NCe3l+pcFqjS9tdBKi0IIj5
 8sZqc0b8pcJr8v8Cj23wXD3ibz4+g50/3SepYcK15erD+yo2AmK00yAvH5mKvJ/HZ+Pm
 da2/z6IBPFejuZsemzK5dUOGPtp1M45QY+MASmHM+kU7gWAyMn+u69N1oMY1i/M58z1z
 73JA==
X-Gm-Message-State: APjAAAVe3qIajbuzihmd/tJme8357XgG63TfYgp/CB5wbd7nvhvDaOED
 mvjLc565MT5y5R4ad0EYH/4=
X-Google-Smtp-Source: APXvYqwAW5gxV9v80zvEtG/jnR4oL2FMp5gqh40w1OPjkDMijYj5VxPtPws76h5RT0qlX41fhMzS0g==
X-Received: by 2002:a17:902:8f8c:: with SMTP id
 z12mr17751680plo.2.1569021985410; 
 Fri, 20 Sep 2019 16:26:25 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id k5sm3716946pfp.109.2019.09.20.16.26.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Sep 2019 16:26:25 -0700 (PDT)
Date: Fri, 20 Sep 2019 16:25:33 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V3 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Message-ID: <20190920232533.GA29851@Asurada-Nvidia.nvidia.com>
References: <cover.1568861098.git.shengjiu.wang@nxp.com>
 <0fe619f4c8f0898cf51c7324c9a0784c5782ed91.1568861098.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fe619f4c8f0898cf51c7324c9a0784c5782ed91.1568861098.git.shengjiu.wang@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Shengjiu,

One issue for error-out and some nit-pickings inline. Thanks.

On Thu, Sep 19, 2019 at 08:11:42PM +0800, Shengjiu Wang wrote:
> There is error "aplay: pcm_write:2023: write error: Input/output error"
> on i.MX8QM/i.MX8QXP platform for S24_3LE format.
> 
> In i.MX8QM/i.MX8QXP, the DMA is EDMA, which don't support 24bit
> sample, but we didn't add any constraint, that cause issues.
> 
> So we need to query the caps of dma, then update the hw parameters
> according to the caps.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c     |  4 +--
>  sound/soc/fsl/fsl_asrc.h     |  3 +++
>  sound/soc/fsl/fsl_asrc_dma.c | 52 +++++++++++++++++++++++++++++++-----
>  3 files changed, 50 insertions(+), 9 deletions(-)
> 
> @@ -276,6 +274,11 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  	struct device *dev = component->dev;
>  	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
>  	struct fsl_asrc_pair *pair;
> +	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> +	u8 dir = tx ? OUT : IN;
> +	struct dma_chan *tmp_chan;
> +	struct snd_dmaengine_dai_dma_data *dma_data;

Nit: would it be possible to reorganize these a bit? Usually
we put struct things together unless there is a dependency,
similar to fsl_asrc_dma_hw_params().

> @@ -285,9 +288,44 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  
>  	runtime->private_data = pair;
>  
> +	/* Request a temp pair, which is release in the end */

Nit: "which will be released later" or "and will release it
later"? And could we use a work like "dummy"? Or at least I
would love to see the comments explaining the parameter "1"
in the function call below.

> +	ret = fsl_asrc_request_pair(1, pair);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request asrc pair\n");
> +		return ret;
> +	}
> +
> +	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
> +	if (!tmp_chan) {
> +		dev_err(dev, "can't get dma channel\n");

Could we align with other error messages using "failed to"?

> +	ret = snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
> +	if (ret)
> +		return ret;
> +
[...]
> +	dma_release_channel(tmp_chan);
> +	fsl_asrc_release_pair(pair);

I think we need an "out:" here for those error-out routines
to goto. Otherwise, it'd be a pair leak?

> +

Could we drop this? There is a blank line below already :)

>  
>  	return 0;
>  }
> -- 
> 2.21.0
> 
