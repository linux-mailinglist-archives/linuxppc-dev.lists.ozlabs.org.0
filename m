Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986B700EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 15:21:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sj1k3HN9zDqL4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 23:21:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=pengutronix.de
 (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de;
 envelope-from=l.stach@pengutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
X-Greylist: delayed 291 seconds by postgrey-1.36 at bilbo;
 Mon, 22 Jul 2019 23:01:33 AEST
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45shZP3HnzzDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 23:01:33 +1000 (AEST)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hpXwN-0005n3-Uu; Mon, 22 Jul 2019 15:01:19 +0200
Message-ID: <1563800477.2311.12.camel@pengutronix.de>
Subject: Re: [PATCH 07/10] ASoC: fsl_sai: Add support for FIFO combine mode
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, broonie@kernel.org
Date: Mon, 22 Jul 2019 15:01:17 +0200
In-Reply-To: <20190722124833.28757-8-daniel.baluta@nxp.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-8-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, perex@perex.cz, nicoleotsuka@gmail.com,
 linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am Montag, den 22.07.2019, 15:48 +0300 schrieb Daniel Baluta:
> FIFO combining mode allows the separate FIFOs for multiple data
> channels
> to be used as a single FIFO for either software accesses or a single
> data
> channel or both.
> 
> FIFO combined mode is described in chapter 13.10.3.5.4 from i.MX8MQ
> reference manual [1].
> 
> For each direction (RX/TX) fifo combine mode is read from fsl,fcomb-
> mode
> DT property. By default, if no property is specified fifo combine
> mode
> is disabled.
> 
> [1]https://cache.nxp.com/secured/assets/documents/en/reference-manual
> /IMX8MDQLQRM.pdf?__gda__=1563728701_38bea7f0f726472cc675cb141b91bec7&
> fileExt=.pdf
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 37 +++++++++++++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_sai.h |  9 +++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index d0fa02188b7c..140014901fce 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -475,6 +475,35 @@ static int fsl_sai_hw_params(struct
> snd_pcm_substream *substream,
>  		}
>  	}
>  
> +	switch (sai->soc_data->fcomb_mode[tx]) {
> +	case FSL_SAI_FCOMB_NONE:
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
> +				   FSL_SAI_CR4_FCOMB_SOFT |
> +				   FSL_SAI_CR4_FCOMB_SHIFT, 0);
> +		break;
> +	case FSL_SAI_FCOMB_SHIFT:
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
> +				   FSL_SAI_CR4_FCOMB_SOFT |
> +				   FSL_SAI_CR4_FCOMB_SHIFT,
> +				   FSL_SAI_CR4_FCOMB_SHIFT);
> +		break;
> +	case FSL_SAI_FCOMB_SOFT:
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
> +				   FSL_SAI_CR4_FCOMB_SOFT |
> +				   FSL_SAI_CR4_FCOMB_SHIFT,
> +				   FSL_SAI_CR4_FCOMB_SOFT);
> +		break;
> +	case FSL_SAI_FCOMB_BOTH:
> +		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
> +				   FSL_SAI_CR4_FCOMB_SOFT |
> +				   FSL_SAI_CR4_FCOMB_SHIFT,
> +				   FSL_SAI_CR4_FCOMB_SOFT |
> +				   FSL_SAI_CR4_FCOMB_SHIFT);
> +		break;
> +	default:
> +		break;
> +	}

This would probably look less redundant if you only select the bits to
set in the switch statement and move the regmap_update_bits after the
switch.

Regards,
Lucas

>  	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
>  			   FSL_SAI_CR4_SYWD_MASK |
> FSL_SAI_CR4_FRSZ_MASK,
>  			   val_cr4);
> @@ -887,6 +916,14 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>  		}
>  	}
>  
> +	/* FIFO combine mode for TX/RX, defaults to disabled */
> +	sai->fcomb_mode[RX] = FSL_SAI_FCOMB_NONE;
> +	sai->fcomb_mode[TX] = FSL_SAI_FCOMB_NONE;
> +	of_property_read_u32_index(np, "fsl,fcomb-mode", RX,
> +				   &sai->fcomb_mode[RX]);
> +	of_property_read_u32_index(np, "fsl,fcomb-mode", TX,
> +				   &sai->fcomb_mode[TX]);
> +
>  	/* active data lines mask for TX/RX, defaults to 1 (only the
> first
>  	 * data line is enabled
>  	 */
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index 6d32f0950ec5..abf140951187 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -115,6 +115,8 @@
>  #define FSL_SAI_CR3_WDFL_MASK	0x1f
>  
>  /* SAI Transmit and Receive Configuration 4 Register */
> +#define FSL_SAI_CR4_FCOMB_SHIFT BIT(26)
> +#define FSL_SAI_CR4_FCOMB_SOFT  BIT(27)
>  #define FSL_SAI_CR4_FRSZ(x)	(((x) - 1) << 16)
>  #define FSL_SAI_CR4_FRSZ_MASK	(0x1f << 16)
>  #define FSL_SAI_CR4_SYWD(x)	(((x) - 1) << 8)
> @@ -155,6 +157,12 @@
>  #define FSL_SAI_MAXBURST_TX 6
>  #define FSL_SAI_MAXBURST_RX 6
>  
> +/* FIFO combine modes */
> +#define FSL_SAI_FCOMB_NONE     0
> +#define FSL_SAI_FCOMB_SHIFT    1
> +#define FSL_SAI_FCOMB_SOFT     2
> +#define FSL_SAI_FCOMB_BOTH     3
> +
>  struct fsl_sai_soc_data {
>  	bool use_imx_pcm;
>  	unsigned int fifo_depth;
> @@ -177,6 +185,7 @@ struct fsl_sai {
>  	unsigned int slot_width;
>  
>  	unsigned int dl_mask[2];
> +	unsigned int fcomb_mode[2];
>  
>  	const struct fsl_sai_soc_data *soc_data;
>  	struct snd_dmaengine_dai_dma_data dma_params_rx;
