Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1327A794B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 12:32:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrFFx4db7z3ccV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 20:32:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=b5sv=fe=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrFFQ1DTQz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 20:31:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3D0361B5A;
	Wed, 20 Sep 2023 10:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA096C433C8;
	Wed, 20 Sep 2023 10:31:31 +0000 (UTC)
Message-ID: <7b3c5c8e-7b8b-43c1-8059-13e7c2f2b262@xs4all.nl>
Date: Wed, 20 Sep 2023 12:31:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 01/11] ASoC: fsl_asrc: define functions for memory
 to memory usage
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1695202370-24678-1-git-send-email-shengjiu.wang@nxp.com>
 <1695202370-24678-2-git-send-email-shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <1695202370-24678-2-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/09/2023 11:32, Shengjiu Wang wrote:
> ASRC can be used on memory to memory case, define several
> functions for m2m usage.
> 
> m2m_start_part_one: first part of the start steps
> m2m_start_part_two: second part of the start steps
> m2m_stop_part_one: first part of stop steps
> m2m_stop_part_two: second part of stop steps, optional
> m2m_check_format: check format is supported or not
> m2m_calc_out_len: calculate output length according to input length
> m2m_get_maxburst: burst size for dma
> m2m_pair_suspend: suspend function of pair, optional.
> m2m_pair_resume: resume function of pair
> get_output_fifo_size: get remaining data size in FIFO
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c        | 150 ++++++++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_asrc.h        |   2 +
>  sound/soc/fsl/fsl_asrc_common.h |  42 +++++++++
>  3 files changed, 194 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index b793263291dc..f9d830e0957f 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -1063,6 +1063,145 @@ static int fsl_asrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
>  	return REG_ASRDx(dir, index);
>  }
>  
> +/* Get sample numbers in FIFO */
> +static unsigned int fsl_asrc_get_output_fifo_size(struct fsl_asrc_pair *pair)
> +{
> +	struct fsl_asrc *asrc = pair->asrc;
> +	enum asrc_pair_index index = pair->index;
> +	u32 val;
> +
> +	regmap_read(asrc->regmap, REG_ASRFST(index), &val);
> +
> +	val &= ASRFSTi_OUTPUT_FIFO_MASK;
> +
> +	return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> +}
> +
> +static int fsl_asrc_m2m_start_part_one(struct fsl_asrc_pair *pair)
> +{
> +	struct fsl_asrc_pair_priv *pair_priv = pair->private;
> +	struct fsl_asrc *asrc = pair->asrc;
> +	struct device *dev = &asrc->pdev->dev;
> +	struct asrc_config config;
> +	int ret;
> +
> +	/* fill config */
> +	config.pair = pair->index;
> +	config.channel_num = pair->channels;
> +	config.input_sample_rate = pair->rate[IN];
> +	config.output_sample_rate = pair->rate[OUT];
> +	config.input_format = pair->sample_format[IN];
> +	config.output_format = pair->sample_format[OUT];
> +	config.inclk = INCLK_NONE;
> +	config.outclk = OUTCLK_ASRCK1_CLK;
> +
> +	pair_priv->config = &config;
> +	ret = fsl_asrc_config_pair(pair, true);
> +	if (ret) {
> +		dev_err(dev, "failed to config pair: %d\n", ret);
> +		return ret;
> +	}
> +
> +	fsl_asrc_start_pair(pair);
> +
> +	return 0;
> +}
> +
> +static int fsl_asrc_m2m_start_part_two(struct fsl_asrc_pair *pair)
> +{
> +	/*
> +	 * Clear DMA request during the stall state of ASRC:
> +	 * During STALL state, the remaining in input fifo would never be
> +	 * smaller than the input threshold while the output fifo would not
> +	 * be bigger than output one. Thus the DMA request would be cleared.
> +	 */
> +	fsl_asrc_set_watermarks(pair, ASRC_FIFO_THRESHOLD_MIN,
> +				ASRC_FIFO_THRESHOLD_MAX);
> +
> +	/* Update the real input threshold to raise DMA request */
> +	fsl_asrc_set_watermarks(pair, ASRC_M2M_INPUTFIFO_WML,
> +				ASRC_M2M_OUTPUTFIFO_WML);
> +
> +	return 0;
> +}
> +
> +static int fsl_asrc_m2m_stop_part_one(struct fsl_asrc_pair *pair)
> +{
> +	fsl_asrc_stop_pair(pair);
> +
> +	return 0;
> +}
> +
> +static int fsl_asrc_m2m_check_format(u8 dir, u32 format)
> +{
> +	u64 support_format = FSL_ASRC_FORMATS;
> +
> +	if (dir == IN)
> +		support_format |= SNDRV_PCM_FMTBIT_S8;
> +
> +	if (!(1 << format & support_format))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int fsl_asrc_m2m_check_rate(u8 dir, u32 rate)
> +{
> +	if (rate < 5512 || rate > 192000)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int fsl_asrc_m2m_check_channel(u8 dir, u32 channels)
> +{
> +	if (channels < 1 || channels > 10)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/* calculate capture data length according to output data length and sample rate */
> +static int fsl_asrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
> +{
> +	unsigned int in_width, out_width;
> +	unsigned int channels = pair->channels;
> +	unsigned int in_samples, out_samples;
> +	unsigned int out_length;
> +
> +	in_width = snd_pcm_format_physical_width(pair->sample_format[IN]) / 8;
> +	out_width = snd_pcm_format_physical_width(pair->sample_format[OUT]) / 8;
> +
> +	in_samples = input_buffer_length / in_width / channels;
> +	out_samples = pair->rate[OUT] * in_samples / pair->rate[IN];
> +	out_length = (out_samples - ASRC_OUTPUT_LAST_SAMPLE) * out_width * channels;
> +
> +	return out_length;
> +}
> +
> +static int fsl_asrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
> +{
> +	struct fsl_asrc *asrc = pair->asrc;
> +	struct fsl_asrc_priv *asrc_priv = asrc->private;
> +	int wml = (dir == IN) ? ASRC_M2M_INPUTFIFO_WML : ASRC_M2M_OUTPUTFIFO_WML;
> +
> +	if (!asrc_priv->soc->use_edma)
> +		return wml * pair->channels;
> +	else
> +		return 1;
> +}
> +
> +static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
> +{
> +	struct fsl_asrc *asrc = pair->asrc;
> +	int i;
> +
> +	for (i = 0; i < pair->channels * 4; i++)
> +		regmap_write(asrc->regmap, REG_ASRDI(pair->index), 0);
> +
> +	return 0;
> +}
> +
>  static int fsl_asrc_runtime_resume(struct device *dev);
>  static int fsl_asrc_runtime_suspend(struct device *dev);
>  
> @@ -1147,6 +1286,17 @@ static int fsl_asrc_probe(struct platform_device *pdev)
>  	asrc->get_fifo_addr = fsl_asrc_get_fifo_addr;
>  	asrc->pair_priv_size = sizeof(struct fsl_asrc_pair_priv);
>  
> +	asrc->m2m_start_part_one = fsl_asrc_m2m_start_part_one;
> +	asrc->m2m_start_part_two = fsl_asrc_m2m_start_part_two;
> +	asrc->m2m_stop_part_one = fsl_asrc_m2m_stop_part_one;
> +	asrc->get_output_fifo_size = fsl_asrc_get_output_fifo_size;
> +	asrc->m2m_check_format = fsl_asrc_m2m_check_format;
> +	asrc->m2m_check_rate = fsl_asrc_m2m_check_rate;
> +	asrc->m2m_check_channel = fsl_asrc_m2m_check_channel;
> +	asrc->m2m_calc_out_len = fsl_asrc_m2m_calc_out_len;
> +	asrc->m2m_get_maxburst = fsl_asrc_m2m_get_maxburst;
> +	asrc->m2m_pair_resume = fsl_asrc_m2m_pair_resume;
> +
>  	if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
>  		asrc_priv->clk_map[IN] = input_clk_map_imx35;
>  		asrc_priv->clk_map[OUT] = output_clk_map_imx35;
> diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> index 86d2422ad606..1c492eb237f5 100644
> --- a/sound/soc/fsl/fsl_asrc.h
> +++ b/sound/soc/fsl/fsl_asrc.h
> @@ -12,6 +12,8 @@
>  
>  #include  "fsl_asrc_common.h"
>  
> +#define ASRC_M2M_INPUTFIFO_WML		0x4
> +#define ASRC_M2M_OUTPUTFIFO_WML		0x2
>  #define ASRC_DMA_BUFFER_NUM		2
>  #define ASRC_INPUTFIFO_THRESHOLD	32
>  #define ASRC_OUTPUTFIFO_THRESHOLD	32
> diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> index 7e1c13ca37f1..7f7e725075fe 100644
> --- a/sound/soc/fsl/fsl_asrc_common.h
> +++ b/sound/soc/fsl/fsl_asrc_common.h
> @@ -34,6 +34,11 @@ enum asrc_pair_index {
>   * @pos: hardware pointer position
>   * @req_dma_chan: flag to release dev_to_dev chan
>   * @private: pair private area
> + * @complete: dma task complete
> + * @sample_format: format of m2m
> + * @rate: rate of m2m
> + * @buf_len: buffer length of m2m
> + * @req_pair: flag for request pair
>   */
>  struct fsl_asrc_pair {
>  	struct fsl_asrc *asrc;
> @@ -49,6 +54,13 @@ struct fsl_asrc_pair {
>  	bool req_dma_chan;
>  
>  	void *private;
> +
> +	/* used for m2m */
> +	struct completion complete[2];
> +	snd_pcm_format_t sample_format[2];
> +	unsigned int rate[2];
> +	unsigned int buf_len[2];
> +	bool req_pair;
>  };
>  
>  /**
> @@ -72,6 +84,19 @@ struct fsl_asrc_pair {
>   * @request_pair: function pointer
>   * @release_pair: function pointer
>   * @get_fifo_addr: function pointer
> + * @m2m_start_part_one: function pointer
> + * @m2m_start_part_two: function pointer
> + * @m2m_stop_part_one: function pointer
> + * @m2m_stop_part_two: function pointer
> + * @m2m_check_format: function pointer
> + * @m2m_check_rate: function pointer
> + * @m2m_check_channel: function pointer
> + * @m2m_calc_out_len: function pointer
> + * @m2m_get_maxburst: function pointer
> + * @m2m_pair_suspend: function pointer
> + * @m2m_pair_resume: function pointer
> + * @m2m_set_ratio_mod: function pointer
> + * @get_output_fifo_size: function pointer
>   * @pair_priv_size: size of pair private struct.
>   * @private: private data structure
>   */
> @@ -97,6 +122,23 @@ struct fsl_asrc {
>  	int (*request_pair)(int channels, struct fsl_asrc_pair *pair);
>  	void (*release_pair)(struct fsl_asrc_pair *pair);
>  	int (*get_fifo_addr)(u8 dir, enum asrc_pair_index index);
> +
> +	int (*m2m_start_part_one)(struct fsl_asrc_pair *pair);
> +	int (*m2m_start_part_two)(struct fsl_asrc_pair *pair);
> +	int (*m2m_stop_part_one)(struct fsl_asrc_pair *pair);
> +	int (*m2m_stop_part_two)(struct fsl_asrc_pair *pair);
> +
> +	int (*m2m_check_format)(u8 dir, u32 format);

I think it will be easier if this just returns the u64 with the supported formats
for the given direction. That will be helpful for enum_fmt.

> +	int (*m2m_check_rate)(u8 dir, u32 rate);

This should just map the rate to something that is valid. V4L2 allows drivers
to modify the requested format to whatever is valid, and that can be used here.

> +	int (*m2m_check_channel)(u8 dir, u32 channels);

This can do the same (i.e., map to a valid number of channels).

Regards,

	Hans

> +
> +	int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input_buffer_length);
> +	int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> +	int (*m2m_pair_suspend)(struct fsl_asrc_pair *pair);
> +	int (*m2m_pair_resume)(struct fsl_asrc_pair *pair);
> +	int (*m2m_set_ratio_mod)(struct fsl_asrc_pair *pair, int val);
> +
> +	unsigned int (*get_output_fifo_size)(struct fsl_asrc_pair *pair);
>  	size_t pair_priv_size;
>  
>  	void *private;

