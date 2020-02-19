Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E845F163910
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 02:10:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MfmX27WjzDqcn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 12:10:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GOTYxNs9; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MfkK06jLzDqYj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 12:08:56 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id 6so11854968pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 17:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=F7nw5RZ2QNeJp9maCrezYJITdIyGySj2oDhIQYUXndA=;
 b=GOTYxNs9+eq213hUjZ/4gW7JkPKDM9kqrDuPbi+X9nq3IeKGNkjjJvFEVsdPeLzH7i
 TN9UuPWFqdF+j3wEbxRU7xeqTtyWVu0pzvEgC5w/mlOO1CKQnts/BAW6apuCMFz6EYaz
 HlNVBncgYm6KNkAJalL8e3FUBhsLBdVm37yV4LrG4wMBXbC9QmeNTNQADTdz3oqhnp6b
 b0hQqGumF51FAjgF37sTwjoQY9Rxj6AKsRjoVVsKBBDSYw/pyEu8CWFTUdN26vS9MDP+
 97xfQXyyGSHJcjrNpF/W5qXGWD1KWCO1B+/SQXAxnB8Jem66+l3UtGnQSMVyXmD2fgH3
 TX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=F7nw5RZ2QNeJp9maCrezYJITdIyGySj2oDhIQYUXndA=;
 b=a4r7s71bt90lR/GwgAFB36U5mLIIDx5ePjsLtyy4gpSYGXki5qxi9lLzbMhwb1ySws
 fkSU0clTFjC5weJLdmBijRJrSADHCdazWHIiu9g/WjyupjDCRwWO2/G71bd8urfXWHtj
 vns6ixdscEphB8kqTjwDaJ6FMHyDMxctsz9DpAsIyRweX0fdyCxeTy4TXd7ckJ15iOts
 znGK8hLBsBwjgzS5sHJ1TwlMNGIVNYju1rCnfVFP2HKnj/RbaOf+EDlxVMnohlMYSrr9
 95CpLvzFWLC93fgPyh0OzJ8uPemAFGxUBsi0Q7g2oHyg7uzE63Zc53/SpRiFLusq8HeG
 DJvQ==
X-Gm-Message-State: APjAAAU9ANmER0cABgLw95w+1+iuxvlP8Vdij8JBVfRHKaFFaKX16070
 vL+NjcJuDSXsANXMndeZRD8=
X-Google-Smtp-Source: APXvYqy6/qmgpZiAyG1aKdQVMoIuZapQP0zjCLdz9E1bHg/xvZJqaCGGENk35MWrqXy2amh+Y9S0+Q==
X-Received: by 2002:a63:be09:: with SMTP id l9mr3761152pgf.439.1582074533862; 
 Tue, 18 Feb 2020 17:08:53 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id z30sm216932pff.131.2020.02.18.17.08.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Feb 2020 17:08:53 -0800 (PST)
Date: Tue, 18 Feb 2020 17:09:05 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 3/3] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and
 platform drivers
Message-ID: <20200219010905.GB32720@Asurada-Nvidia.nvidia.com>
References: <cover.1582007379.git.shengjiu.wang@nxp.com>
 <cea88cec3e32759a49d44c41cb615a839f689937.1582007379.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cea88cec3e32759a49d44c41cb615a839f689937.1582007379.git.shengjiu.wang@nxp.com>
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
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 18, 2020 at 02:39:37PM +0800, Shengjiu Wang wrote:
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new IP module
> found on i.MX8MN. It is different with old ASRC module.
> 
> The primary features for the EASRC are as follows:
> - 4 Contexts - groups of channels with an independent time base
> - Fully independent and concurrent context control
> - Simultaneous processing of up to 32 audio channels
> - Programmable filter charachteristics for each context
> - 32, 24, 20, and 16-bit fixed point audio sample support
> - 32-bit floating point audio sample support
> - 8kHz to 384kHz sample rate
> - 1/16 to 8x sample rate conversion ratio
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/Kconfig           |   10 +
>  sound/soc/fsl/Makefile          |    2 +
>  sound/soc/fsl/fsl_asrc_common.h |    1 +
>  sound/soc/fsl/fsl_easrc.c       | 2265 +++++++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_easrc.h       |  668 +++++++++
>  sound/soc/fsl/fsl_easrc_dma.c   |  440 ++++++

I see a 90% similarity between fsl_asrc_dma and fsl_easrc_dma files.
Would it be possible reuse the existing code? Could share structures
from my point of view, just like it reuses "enum asrc_pair_index", I
know differentiating "pair" and "context" is a big point here though.

A possible quick solution for that, off the top of my head, could be:

1) in fsl_asrc_common.h

	struct fsl_asrc {
		....
	};

	struct fsl_asrc_pair {
		....
	};

2) in fsl_easrc.h

	/* Renaming shared structures */
	#define fsl_easrc fsl_asrc
	#define fsl_easrc_context fsl_asrc_pair

May be a good idea to see if others have some opinion too.

> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> new file mode 100644
> index 000000000000..6fe2953317f2
> --- /dev/null
> +++ b/sound/soc/fsl/fsl_easrc.c
> +
> +/* set_rs_ratio
> + *
> + * According to the resample taps, calculate the resample ratio
> + */
> +static int set_rs_ratio(struct fsl_easrc_context *ctx)

"fsl_easrc_" prefix? Would be nice to have a formula in the comments.

> +/* resets the pointer of the coeff memory pointers */
> +static int fsl_coeff_mem_ptr_reset(struct fsl_easrc *easrc,
> +				   unsigned int ctx_id, int mem_type)
> +{
> +	/*  To reset the write pointer back to zero, the register field
> +	 *  ASRC_CTX_CTRL_EXT1x[PF_COEFF_MEM_RST] can be toggled from
> +	 *  0x0 to 0x1 to 0x0.
> +	 */

Please use the style:
	/*
	 * xxx
	 */

> +static int fsl_easrc_resampler_config(struct fsl_easrc *easrc)
> +{
> +	for (i = 0; i < hdr->interp_scen; i++) {
> +		if ((interp[i].num_taps - 1) ==
> +				bits_taps_to_val(easrc->rs_num_taps)) {

Could do below to save some indentations from the rest of the routine:
+		if ((interp[i].num_taps - 1) !=
+		    bits_taps_to_val(easrc->rs_num_taps))
+			continue;

> +			arr = interp[i].coeff;
> +			selected_interp = &interp[i];
> +			dev_dbg(dev, "Selected interp_filter: %u taps - %u phases\n",
> +				selected_interp->num_taps,
> +				selected_interp->num_phases);
> +			break;

> +/*****************************************************************************
> + *  Scale filter coefficients (64 bits float)
> + *  For input float32 normalized range (1.0,-1.0) -> output int[16,24,32]:
> + *      scale it by multiplying filter coefficients by 2^31
> + *  For input int[16, 24, 32] -> output float32
> + *      scale it by multiplying filter coefficients by 2^-15, 2^-23, 2^-31
> + *  input:
> + *      easrc:  Structure pointer of fsl_easrc
> + *      infilter : Pointer to non-scaled input filter
> + *      shift:  The multiply factor
> + *  output:
> + *      outfilter: scaled filter
> + *****************************************************************************/
> +static int NormalizedFilterForFloat32InIntOut(struct fsl_easrc *easrc,
> +					      u64 *infilter,
> +					      u64 *outfilter,
> +					      int shift)

Coding style looks very different, at comments and function naming.

> +{
> +	struct device *dev = &easrc->pdev->dev;
> +	u64 coef = *infilter;
> +	s64 exp  = (coef & 0x7ff0000000000000ll) >> 52;
> +	u64 outcoef;
> +
> +	/*
> +	 * If exponent is zero (value == 0), or 7ff (value == NaNs)
> +	 * dont touch the content
> +	 */
> +	if (((coef & 0x7ff0000000000000ll) == 0) ||
> +	    ((coef & 0x7ff0000000000000ll) == ((u64)0x7ff << 52))) {
> +		*outfilter = coef;
> +	} else {
> +		if ((shift > 0 && (shift + exp) >= 2047) ||
> +		    (shift < 0 && (exp + shift) <= 0)) {
> +			dev_err(dev, "coef error\n");
> +			return -EINVAL;
> +		}
> +
> +		/* coefficient * 2^shift ==>  coefficient_exp + shift */
> +		exp += shift;
> +		outcoef = (u64)(coef & 0x800FFFFFFFFFFFFFll) +
> +					((u64)exp << 52);
> +		*outfilter = outcoef;
> +	}
> +
> +	return 0;
> +}
> +
> +static int write_pf_coeff_mem(struct fsl_easrc *easrc, int ctx_id,
> +			      u64 *arr, int n_taps, int shift)

Function naming.

> +static int fsl_easrc_prefilter_config(struct fsl_easrc *easrc,
> +				      unsigned int ctx_id)
> +{
> +	struct fsl_easrc_context *ctx;
> +	struct asrc_firmware_hdr *hdr;
> +	struct prefil_params *prefil, *selected_prefil = NULL;
> +	struct device *dev;
> +	u32 inrate, outrate, offset = 0;
> +	int ret, i;
> +
> +	/* to modify prefilter coeficients, the user must perform
> +	 * a write in ASRC_PRE_COEFF_FIFO[COEFF_DATA] while the
> +	 * RUN_EN for that context is set to 0
> +	 */
> +	if (!easrc)
> +		return -ENODEV;

Hmm..I don't see the relationship between the comments and the code.

> +	if (ctx->out_params.sample_rate >= ctx->in_params.sample_rate) {
> +		if (ctx->out_params.sample_rate == ctx->in_params.sample_rate)
> +			regmap_update_bits(easrc->regmap,
> +					   REG_EASRC_CCE1(ctx_id),
> +					   EASRC_CCE1_RS_BYPASS_MASK,
> +					   EASRC_CCE1_RS_BYPASS);
> +
> +		if (ctx->in_params.sample_format == SNDRV_PCM_FORMAT_FLOAT_LE &&
> +		    ctx->out_params.sample_format != SNDRV_PCM_FORMAT_FLOAT_LE) {
> +			ctx->st1_num_taps = 1;
> +			ctx->st1_coeff    = &easrc->const_coeff;
> +			ctx->st1_num_exp  = 1;
> +			ctx->st2_num_taps = 0;
> +			ctx->st1_addexp = 31;
> +		} else if (ctx->in_params.sample_format != SNDRV_PCM_FORMAT_FLOAT_LE &&
> +			   ctx->out_params.sample_format == SNDRV_PCM_FORMAT_FLOAT_LE) {
> +			ctx->st1_num_taps = 1;
> +			ctx->st1_coeff    = &easrc->const_coeff;
> +			ctx->st1_num_exp  = 1;
> +			ctx->st2_num_taps = 0;
> +			ctx->st1_addexp -= ctx->in_params.fmt.addexp;
> +		} else {
> +			ctx->st1_num_taps = 1;
> +			ctx->st1_coeff    = &easrc->const_coeff;
> +			ctx->st1_num_exp  = 1;
> +			ctx->st2_num_taps = 0;

The first four lines of each path are completely duplicated. Probably
only needs to diff st1_addexp?

> +	} else {
> +		inrate = ctx->in_params.norm_rate;
> +		outrate = ctx->out_params.norm_rate;
> +
> +		hdr = easrc->firmware_hdr;
> +		prefil = easrc->prefil;
> +
> +		for (i = 0; i < hdr->prefil_scen; i++) {
> +			if (inrate == prefil[i].insr && outrate == prefil[i].outsr) {

Could do below to save indentations:
+			if (inrate != prefil[i].insr ||
+			    outrate != prefil[i].outsr)
+				continue;

> +		if (!selected_prefil) {
> +			dev_err(dev, "Conversion from in ratio %u(%u) to out ratio %u(%u) is not supported\n",
> +				ctx->in_params.sample_rate,
> +				inrate,
> +				ctx->out_params.sample_rate, outrate);

Could fit into single lines:
+				ctx->in_params.sample_rate, inrate,
+				ctx->out_params.sample_rate, outrate);

> +static int fsl_easrc_config_one_slot(struct fsl_easrc_context *ctx,
> +				     struct fsl_easrc_slot *slot,
> +				     unsigned int slot_idx,
> +				     unsigned int reg0,
> +				     unsigned int reg1,
> +				     unsigned int reg2,
> +				     unsigned int reg3,
> +				     unsigned int *req_channels,
> +				     unsigned int *start_channel,
> +				     unsigned int *avail_channel)

There could be some simplification for the parameters here:
1) slot_idx could be a part of struct fsl_easrc_slot?
2) reg0->reg3 could be a part of struct too, or use some macro
   calculating from slot_idx?

> +{
> +	struct fsl_easrc *easrc = ctx->easrc;
> +	int st1_chanxexp, st1_mem_alloc = 0, st2_mem_alloc = 0;
> +	unsigned int addr;
> +
> +	if (*req_channels <= *avail_channel) {
> +		slot->num_channel = *req_channels;
> +		slot->min_channel = *start_channel;
> +		slot->max_channel = *start_channel + *req_channels - 1;
> +		slot->ctx_index = ctx->index;
> +		slot->busy = true;
> +		*start_channel += *req_channels;
> +		*req_channels = 0;
> +	} else {
> +		slot->num_channel = *avail_channel;
> +		slot->min_channel = *start_channel;
> +		slot->max_channel = *start_channel + *avail_channel - 1;
> +		slot->ctx_index = ctx->index;
> +		slot->busy = true;
> +		*start_channel += *avail_channel;
> +		*req_channels -= *avail_channel;
> +	}

Could merge duplicated parts:
+	if (*req_channels <= *avail_channel) {
+		slot->num_channel = *req_channels;
+		*req_channels = 0;
+	} else {
+		slot->num_channel = *req_channels;
+		*req_channels -= *avail_channel;
+	};
+
+	slot->min_channel = *start_channel;
+	slot->max_channel = *start_channel + slot->num_channel - 1;
+	slot->ctx_index = ctx->index;
+	slot->busy = true;
+	*start_channel += slot->num_channel;

> +	if (ctx->st1_num_taps > 0) {
> +		if (ctx->st2_num_taps > 0)
> +			st1_mem_alloc =
> +				(ctx->st1_num_taps - 1) * slot->num_channel *
> +				ctx->st1_num_exp + slot->num_channel;
> +		else
> +			st1_mem_alloc = ctx->st1_num_taps * slot->num_channel;
> +
> +		slot->pf_mem_used = st1_mem_alloc;
> +		regmap_update_bits(easrc->regmap, reg2,
> +				   EASRC_DPCS0R2_ST1_MA_MASK,
> +				   EASRC_DPCS0R2_ST1_MA(st1_mem_alloc));
> +
> +		if (slot_idx == 1)
> +			addr = 0x1800 - st1_mem_alloc;

Where is this 0x1800 coming from?

> +int fsl_easrc_start_context(struct fsl_easrc_context *ctx)
> +{
> +			   EASRC_CC_FWMDE_MASK,
> +			   EASRC_CC_FWMDE);

> +			   EASRC_COC_FWMDE_MASK,
> +			   EASRC_COC_FWMDE);

> +			   EASRC_CC_EN_MASK,
> +			   EASRC_CC_EN);

They could fit into single lines.

> +static const struct regmap_config fsl_easrc_regmap_config = {
> +	.readable_reg = fsl_easrc_readable_reg,
> +	.volatile_reg = fsl_easrc_volatile_reg,
> +	.writeable_reg = fsl_easrc_writeable_reg,

Can we use regmap_range and regmap_access_table?

> +void easrc_dump_firmware(struct fsl_easrc *easrc)

fsl_easrc_dump_firmware?

> +{
> +	dev_dbg(dev, "Firmware v%u dump:\n", firm->firmware_version);
> +	pr_debug("Num prefitler scenarios: %u\n", firm->prefil_scen);
> +	pr_debug("Num interpolation scenarios: %u\n", firm->interp_scen);
> +	pr_debug("\nInterpolation scenarios:\n");

dev_dbg vs. pr_debug?

> +int easrc_get_firmware(struct fsl_easrc *easrc)

fsl_easrc_get_firmware?

> +static int fsl_easrc_probe(struct platform_device *pdev)
> +{
> +	/*Set default value*/

White space in the comments

> +	ret = of_property_read_u32(np, "fsl,asrc-rate",
> +				   &easrc->easrc_rate);

Could fit into one line.

> +	ret = of_property_read_u32(np, "fsl,asrc-width",
> +				   &width);

Ditto

> +static int fsl_easrc_runtime_resume(struct device *dev)
> +{
> +}
> +#endif /*CONFIG_PM*/

White space in the comments

> diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
> new file mode 100644
> index 000000000000..205f6ef3e1e3
> --- /dev/null
> +++ b/sound/soc/fsl/fsl_easrc.h
> @@ -0,0 +1,668 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 NXP
> + */
> +
> +#ifndef _FSL_EASRC_H
> +#define _FSL_EASRC_H
> +
> +#include <sound/asound.h>
> +#include <linux/miscdevice.h>

For miscdevice...

> +/**
> + * fsl_easrc: EASRC private data
> + *
> + * @pdev: platform device pointer
> + * @regmap: regmap handler
> + * @dma_params_rx: DMA parameters for receive channel
> + * @dma_params_tx: DMA parameters for transmit channel
> + * @ctx:  context pointer
> + * @slot: slot setting
> + * @mem_clk: clock source to access register
> + * @firmware_hdr:  the header of firmware
> + * @interp: pointer to interpolation filter coeff
> + * @prefil: pointer to prefilter coeff
> + * @fw: firmware of coeff table
> + * @fw_name: firmware name
> + * @paddr: physical address to the base address of registers
> + * @rs_num_taps:  resample filter taps, 32, 64, or 128
> + * @bps_i2c958: bits per sample of iec958
> + * @chn_avail: available channels, maximum 32
> + * @lock: spin lock for resource protection
> + * @easrc_rate: default sample rate for ASoC Back-Ends
> + * @easrc_format: default sample format for ASoC Back-Ends
> + */
> +
> +struct fsl_easrc {
> +	struct platform_device *pdev;
> +	struct regmap *regmap;
> +	struct miscdevice easrc_miscdev;

This is not being described in the comments area nor used in the
driver. Should probably stay downstream, or be added later when
the downstream feature gets upstream.
