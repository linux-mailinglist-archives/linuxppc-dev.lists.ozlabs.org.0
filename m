Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 449DDAE228
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 03:54:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S7PX1mVvzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 11:54:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="shhRrPrh"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S7Mc6q0szDqPW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 11:52:44 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id x3so7649429plr.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 18:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qfJzXboXCRBNelkZrAt1/0iVQ/ZKJddQGja1BPXvviM=;
 b=shhRrPrhXyTGuEalYtMpzidF6Xec5xOUTNWtJZ8Aw9uAAWIAQzY+cVEcanTfT+K/7u
 4jPUgRAvrc7wBB/b/a/T25241nVrKuEmf3imAKfhq37779giWrBIH+aQ2Q7z+kpUtbu2
 ZmNynhByaa33d+K8JjQH3AhWwv55nS/MItOSJl0CGlaYtgycsCu7TbykdbDRYCcPcYSZ
 jWkZr1qAh/Y+VAs/oe5HhV4xjc0yKHTifQFFC5CXWW1G1TOS94Kr6fTKVDGgNG49aqJu
 4K3L/z9FH/1pyHqv9gFTjxMSgCna/iMDh99gcUv9dprDXwoaiTO+9AjXWe8XWgUDJCYz
 YdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qfJzXboXCRBNelkZrAt1/0iVQ/ZKJddQGja1BPXvviM=;
 b=pPYgf3J1Q4wKd8/Gn+mdDFe58O5Ub/Fy5IFbgRNkYxX8OmCzxLJLAlNDH31jLkkVQE
 MVWokBVUO35Ixi0a4Idrjr6tpV3Uxer1BuaZnbdNbd6+6HUFXYPqCMwY71bR58VmRrl4
 b3kxTVsvnpEw8BfYpTRonHi4+NnsV4Ky0xiigN4ynJYqp1X/6KHi5fzipqcEvBRekx4e
 AdcVkJBPZt5hqBnmo9n92GEsSQqeLtggB6V6xtY13avBm+PXSbelE4OyvpPRhpM6YzGf
 eaCimQHBtlA9b4R28b9anVEMyx4/2ypwaH2RXD/bUDame4u8WINjsdOCw+wTC+Jub3FP
 rX+w==
X-Gm-Message-State: APjAAAVRcBBY+y9aa1B05GC7Y2qLzXVy/PvSe7xz77vNWRUZAgJTdkrz
 ZyFr3Map15RfL4kNaizK2Sg=
X-Google-Smtp-Source: APXvYqysAsbMGI3zdULC6/X/imQskDG3HnEoqSyFcHk5MkIVU7u1IpRc4H845OVvdTppQVmg1Rq9Pg==
X-Received: by 2002:a17:902:5c3:: with SMTP id
 f61mr26049403plf.98.1568080359475; 
 Mon, 09 Sep 2019 18:52:39 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 19sm714031pjc.25.2019.09.09.18.52.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Sep 2019 18:52:39 -0700 (PDT)
Date: Mon, 9 Sep 2019 18:52:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc: Fix error with S24_3LE format
 bitstream in i.MX8
Message-ID: <20190910015212.GA16760@Asurada-Nvidia.nvidia.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <2b6e028ca27b8569da4ab7868d7b90ff8c3225d0.1568025083.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b6e028ca27b8569da4ab7868d7b90ff8c3225d0.1568025083.git.shengjiu.wang@nxp.com>
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

On Mon, Sep 09, 2019 at 06:33:21PM -0400, Shengjiu Wang wrote:
> There is error "aplay: pcm_write:2023: write error: Input/output error"
> on i.MX8QM/i.MX8QXP platform for S24_3LE format.
> 
> In i.MX8QM/i.MX8QXP, the DMA is EDMA, which don't support 24bit
> sample, but we didn't add any constraint, that cause issues.
> 
> So we need to query the caps of dma, then update the hw parameters
> according to the caps.

> @@ -285,8 +293,81 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  
>  	runtime->private_data = pair;
>  
> -	snd_pcm_hw_constraint_integer(substream->runtime,
> -				      SNDRV_PCM_HW_PARAM_PERIODS);
> +	ret = snd_pcm_hw_constraint_integer(substream->runtime,
> +					    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set pcm hw params periods\n");
> +		return ret;
> +	}
> +
> +	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
> +
> +	/* Request a temp pair, which is release in the end */
> +	fsl_asrc_request_pair(1, pair);

Not sure if it'd be practical, but a pair request could fail. Will
probably need to check return value.

And a quick feeling is that below code is mostly identical to what
is in the soc-generic-dmaengine-pcm.c file. So I'm wondering if we
could abstract a helper function somewhere in the ASoC core: Mark?

Thanks
Nicolin

> +	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
> +	if (!tmp_chan) {
> +		dev_err(dev, "can't get dma channel\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = dma_get_slave_caps(tmp_chan, &dma_caps);
> +	if (ret == 0) {
> +		if (dma_caps.cmd_pause)
> +			snd_imx_hardware.info |= SNDRV_PCM_INFO_PAUSE |
> +						 SNDRV_PCM_INFO_RESUME;
> +		if (dma_caps.residue_granularity <=
> +			DMA_RESIDUE_GRANULARITY_SEGMENT)
> +			snd_imx_hardware.info |= SNDRV_PCM_INFO_BATCH;
> +
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +			addr_widths = dma_caps.dst_addr_widths;
> +		else
> +			addr_widths = dma_caps.src_addr_widths;
> +	}
> +
> +	/*
> +	 * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
> +	 * hw.formats set to 0, meaning no restrictions are in place.
> +	 * In this case it's the responsibility of the DAI driver to
> +	 * provide the supported format information.
> +	 */
> +	if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
> +		/*
> +		 * Prepare formats mask for valid/allowed sample types. If the
> +		 * dma does not have support for the given physical word size,
> +		 * it needs to be masked out so user space can not use the
> +		 * format which produces corrupted audio.
> +		 * In case the dma driver does not implement the slave_caps the
> +		 * default assumption is that it supports 1, 2 and 4 bytes
> +		 * widths.
> +		 */
> +		for (i = 0; i <= SNDRV_PCM_FORMAT_LAST; i++) {
> +			int bits = snd_pcm_format_physical_width(i);
> +
> +			/*
> +			 * Enable only samples with DMA supported physical
> +			 * widths
> +			 */
> +			switch (bits) {
> +			case 8:
> +			case 16:
> +			case 24:
> +			case 32:
> +			case 64:
> +				if (addr_widths & (1 << (bits / 8)))
> +					snd_imx_hardware.formats |= (1LL << i);
> +				break;
> +			default:
> +				/* Unsupported types */
> +				break;
> +			}
> +		}
> +
> +	if (tmp_chan)
> +		dma_release_channel(tmp_chan);
> +	fsl_asrc_release_pair(pair);
> +
>  	snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
>  
>  	return 0;
> -- 
> 2.21.0
> 
