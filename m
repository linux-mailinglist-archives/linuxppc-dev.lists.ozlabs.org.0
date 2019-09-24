Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA10EBD4AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 23:53:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dFM36m41zDqb9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 07:53:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PiWxYZbA"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dF8R1kmyzDqVb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 07:44:38 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id 4so1977331pgm.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 14:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8TaXClZL44x6R6m23BGIIOYUw8sFdA7SimmvF1Bs6II=;
 b=PiWxYZbA9Phtp8IDK7idRhXLPFpVl8Nivv0bnnYLe3e3GtA0prmh/cyb4fHtq4Gim9
 aqlwpu5kw/gwGvZgr1PevcKG1YZRm4NRav9JQY8t4jD9ouA1/i6jCrKJGPq1MnRdm8Za
 zcVcS52Iw7UOovvfOTsRw0smUUa/8C1pIbP5pRVkoBa2JcIuY3/NaibW6X98J/DrVnPP
 u4jagDKOIj26zhiMKPopz6CkiPG+busIukqq/hxVnslcJhWs4Uqbf5clU765/Ug97tzP
 vOBIcRr6706g6selmfD9KRihs4X4HljViLD/zguw80jjUXENnR6hn1v0FEDtWG+aN/C7
 T+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8TaXClZL44x6R6m23BGIIOYUw8sFdA7SimmvF1Bs6II=;
 b=pgrJ3oysd1gTdpKlY8742rFW2GU9WkMJwQEVpoWothCptVdkIY5LX9mE1KBIl7H2hR
 OscEesY8JAjhN2EOL98ylU54hAhzfK4rwESEz/s4YmyGqZ4w1M3jeAvC/yOhpWyAbB8U
 cEJHbV4LB29nzce+BMq9UYTp8P0u/Mr+TAdaE39uvC0U0LGnsu5UT7EVGN+EveopI0Tk
 cP290Ye8c/ngqjRaoHx5kXe7syoIkCGtHobwSB9y9WWn449ct2/asOI3CIuHw+G/z3lG
 d8GE3skOihaI3Ey+9gNsN4q6vKjOwpqP8n8D+OCVDVePeR8q1jdYd7/E3aGBw4X9ZdpH
 zA1w==
X-Gm-Message-State: APjAAAV6tjPnB05CBa/5i1caSbwMH5ZfLBQtR0MplFwsghiw+ZEBhF93
 icQ8ea9GisWEPx50wGm+wyy7uFDhZas=
X-Google-Smtp-Source: APXvYqx85giUVZhiQHsCv//r2YbURAPCdsrA+9rcufqztCRKD6LsbMJVknHc1eyohUWvf/YPUk/5ZA==
X-Received: by 2002:a65:64d5:: with SMTP id t21mr5237437pgv.43.1569361472982; 
 Tue, 24 Sep 2019 14:44:32 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id b22sm4651877pfo.85.2019.09.24.14.44.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Sep 2019 14:44:32 -0700 (PDT)
Date: Tue, 24 Sep 2019 14:43:44 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V4 4/4] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Message-ID: <20190924214343.GA964@Asurada-Nvidia.nvidia.com>
References: <cover.1569296075.git.shengjiu.wang@nxp.com>
 <b93ce3dced55bbad8e0b4b7e700cf394b1ae1551.1569296075.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b93ce3dced55bbad8e0b4b7e700cf394b1ae1551.1569296075.git.shengjiu.wang@nxp.com>
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

On Tue, Sep 24, 2019 at 06:52:35PM +0800, Shengjiu Wang wrote:
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
>  sound/soc/fsl/fsl_asrc.h     |  3 ++
>  sound/soc/fsl/fsl_asrc_dma.c | 59 +++++++++++++++++++++++++++++++-----
>  3 files changed, 56 insertions(+), 10 deletions(-)
> 
> @@ -270,12 +268,17 @@ static int fsl_asrc_dma_hw_free(struct snd_pcm_substream *substream)
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
> +	int ret = 0;
>  
>  	pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);

Sorry, I didn't catch it previously. We would need to release
this memory also for all error-out paths, as the code doesn't
have any error-out routine, prior to applying this change.

>  	if (!pair)
> @@ -285,11 +288,51 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)

> +	/* Request a dummy pair, which will be released later.
> +	 * Request pair function needs channel num as input, for this
> +	 * dummy pair, we just request "1" channel temporary.
> +	 */

"temporary" => "temporarily"

> +	ret = fsl_asrc_request_pair(1, pair);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request asrc pair\n");
> +		return ret;
> +	}
> +
> +	/* Request a dummy dma channel, which will be release later. */

"release" => "released"
