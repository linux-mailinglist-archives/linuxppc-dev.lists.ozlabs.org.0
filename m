Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 212D0BFCFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 04:02:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fZmZ2l62zDqZb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 12:02:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r9jRo5ii"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fZc54n05zDqXm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 11:54:44 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id y35so2584310pgl.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 18:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Jkv3+m25h7+mBhaDAmoi1fNnMKQwdsBy4HY8NW+mFDw=;
 b=r9jRo5iilNs2wTjYGE0eSV/p47GTFQWk4EutxtXr3Bcmzu2B+W8P2aA+zWEaQG3XpI
 q+vSIcrJCKg7pixYzCF1spux84sDxuwZJRfoBGT084K6gTz5zIkRZtrDN4YMHQPopUKX
 B61JV1lqcFDNK6jOs9Mf8k3uFulbefsTS/0H76qPF5eKIpuHQwtmhcEjBA9Al5WEl0Km
 tVZAPt23J+8MxX7V88vgWWe07RDsuuJHtlAvLVua2+UMP8f/azziJlTqrsVJNOkN0K5G
 CF7/ji92yJsZN3tG9o7/tNMZdSqOE8xjFP5EoGJBrNwCKwMQKXn2nqoQRSFFG0Y26OZo
 oGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Jkv3+m25h7+mBhaDAmoi1fNnMKQwdsBy4HY8NW+mFDw=;
 b=TcE49Ojtczicc47MkSnknuOBT1K63xSlEJ+HaPjzQkH4nD5fqrVI6nJ023n6s4DbWb
 0MQYqMzLpFxY7iffJKtJ+lhPjq6jX4p4tTk1dyoAt2NW+4qqNO+GaVlmgb8Anud89Fuz
 FiTrqEvswGXaQ7vJ5HMwHDKuu8pCFeFxAm3LRVMmlqdbXtHL84HhRF+j2h2gRDRbBSw+
 omRt6F4WDk4d4yLroVqD3oWzotSr1rJJ3aoicN+be/tmE9Zde8it536U/UQE98iwjbnQ
 cjpCr7+zSJ87SAUHApVwoNoM5FZsOi8Zulu46293FQJ1/crnxFK543P/b/SqeY11TsWG
 Eu7w==
X-Gm-Message-State: APjAAAV9FPgy/kf4q3FMRJEP0LsEvaeCzwh6+/bzUOK+0sx5cWFnEbMQ
 sdDgRx4zW1+6i/OI3u4GEc0=
X-Google-Smtp-Source: APXvYqzl/BASHUYGj0Nc0aDqh/JKm2tGMJg8oKPiZ1pYyew3VA2OEU6saze0fWlG1mYPcdifDALaLQ==
X-Received: by 2002:a63:5566:: with SMTP id f38mr6495741pgm.389.1569549279228; 
 Thu, 26 Sep 2019 18:54:39 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id x9sm9494303pje.27.2019.09.26.18.54.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 26 Sep 2019 18:54:38 -0700 (PDT)
Date: Thu, 26 Sep 2019 18:53:53 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V6 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Message-ID: <20190927015352.GA3253@Asurada-Nvidia.nvidia.com>
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
 <b6a4de2bbf960ef291ee902afe4388bd0fc1d347.1569493933.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6a4de2bbf960ef291ee902afe4388bd0fc1d347.1569493933.git.shengjiu.wang@nxp.com>
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

On Fri, Sep 27, 2019 at 09:46:12AM +0800, Shengjiu Wang wrote:
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

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  sound/soc/fsl/fsl_asrc.c     |  4 +--
>  sound/soc/fsl/fsl_asrc.h     |  3 ++
>  sound/soc/fsl/fsl_asrc_dma.c | 64 ++++++++++++++++++++++++++++++++----
>  3 files changed, 62 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 584badf956d2..0bf91a6f54b9 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -115,7 +115,7 @@ static void fsl_asrc_sel_proc(int inrate, int outrate,
>   * within range [ANCA, ANCA+ANCB-1], depends on the channels of pair A
>   * while pair A and pair C are comparatively independent.
>   */
> -static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
> +int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
>  {
>  	enum asrc_pair_index index = ASRC_INVALID_PAIR;
>  	struct fsl_asrc *asrc_priv = pair->asrc_priv;
> @@ -158,7 +158,7 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
>   *
>   * It clears the resource from asrc_priv and releases the occupied channels.
>   */
> -static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
> +void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
>  {
>  	struct fsl_asrc *asrc_priv = pair->asrc_priv;
>  	enum asrc_pair_index index = pair->index;
> diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> index 38af485bdd22..2b57e8c53728 100644
> --- a/sound/soc/fsl/fsl_asrc.h
> +++ b/sound/soc/fsl/fsl_asrc.h
> @@ -462,4 +462,7 @@ struct fsl_asrc {
>  #define DRV_NAME "fsl-asrc-dai"
>  extern struct snd_soc_component_driver fsl_asrc_component;
>  struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir);
> +int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair);
> +void fsl_asrc_release_pair(struct fsl_asrc_pair *pair);
> +
>  #endif /* _FSL_ASRC_H */
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 01052a0808b0..2a60fc6142b1 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -16,13 +16,11 @@
>  
>  #define FSL_ASRC_DMABUF_SIZE	(256 * 1024)
>  
> -static const struct snd_pcm_hardware snd_imx_hardware = {
> +static struct snd_pcm_hardware snd_imx_hardware = {
>  	.info = SNDRV_PCM_INFO_INTERLEAVED |
>  		SNDRV_PCM_INFO_BLOCK_TRANSFER |
>  		SNDRV_PCM_INFO_MMAP |
> -		SNDRV_PCM_INFO_MMAP_VALID |
> -		SNDRV_PCM_INFO_PAUSE |
> -		SNDRV_PCM_INFO_RESUME,
> +		SNDRV_PCM_INFO_MMAP_VALID,
>  	.buffer_bytes_max = FSL_ASRC_DMABUF_SIZE,
>  	.period_bytes_min = 128,
>  	.period_bytes_max = 65535, /* Limited by SDMA engine */
> @@ -270,12 +268,25 @@ static int fsl_asrc_dma_hw_free(struct snd_pcm_substream *substream)
>  
>  static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  {
> +	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
> +	struct snd_dmaengine_dai_dma_data *dma_data;
>  	struct device *dev = component->dev;
>  	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
>  	struct fsl_asrc_pair *pair;
> +	struct dma_chan *tmp_chan = NULL;
> +	u8 dir = tx ? OUT : IN;
> +	bool release_pair = true;
> +	int ret = 0;
> +
> +	ret = snd_pcm_hw_constraint_integer(substream->runtime,
> +					    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set pcm hw params periods\n");
> +		return ret;
> +	}
>  
>  	pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
>  	if (!pair)
> @@ -285,11 +296,50 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  
>  	runtime->private_data = pair;
>  
> -	snd_pcm_hw_constraint_integer(substream->runtime,
> -				      SNDRV_PCM_HW_PARAM_PERIODS);
> +	/* Request a dummy pair, which will be released later.
> +	 * Request pair function needs channel num as input, for this
> +	 * dummy pair, we just request "1" channel temporarily.
> +	 */
> +	ret = fsl_asrc_request_pair(1, pair);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request asrc pair\n");
> +		goto req_pair_err;
> +	}
> +
> +	/* Request a dummy dma channel, which will be released later. */
> +	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
> +	if (!tmp_chan) {
> +		dev_err(dev, "failed to get dma channel\n");
> +		ret = -EINVAL;
> +		goto dma_chan_err;
> +	}
> +
> +	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
> +
> +	/* Refine the snd_imx_hardware according to caps of DMA. */
> +	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
> +							dma_data,
> +							&snd_imx_hardware,
> +							tmp_chan);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to refine runtime hwparams\n");
> +		goto out;
> +	}
> +
> +	release_pair = false;
>  	snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
>  
> -	return 0;
> +out:
> +	dma_release_channel(tmp_chan);
> +
> +dma_chan_err:
> +	fsl_asrc_release_pair(pair);
> +
> +req_pair_err:
> +	if (release_pair)
> +		kfree(pair);
> +
> +	return ret;
>  }
>  
>  static int fsl_asrc_dma_shutdown(struct snd_pcm_substream *substream)
> -- 
> 2.21.0
> 
