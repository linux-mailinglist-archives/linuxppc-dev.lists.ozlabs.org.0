Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6321F716B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 02:33:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jhXW3lX2zDqtd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 10:33:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oqqdgIag; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jhVK5Fs6zDqsM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 10:31:19 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id x207so3453195pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 17:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ynp2Ywh0TeTSOhhf2AKkRBib7Iyqqnx9iZi2CH+BUCI=;
 b=oqqdgIagHUplXQwh3jjLPuNuFgwozom5py97t6fCsmiZOq8/fv4dP9+MJgxl43mXvr
 QaX6sN+IZnyzFc/n3w+Y7KKijtlKv2vLa9Jk+9BADSe83oALF69CYmhRFvO3r0pvAaK5
 qsD4pvbeEv4nN5OUfK22rP8jHN3WfhXBXtQNbXVXUoc5FfH9bceomRRBmOhYXUCaxIwn
 BuL6sJI8UF0bawkkdFJGigJ2F4NzmjCaXTvz9d4SmoPVC6wIV38tgWV8r1tBMk/QHi3i
 d9dGsyvL/zcNmOYFWhaR3UMpfSqfPJc9M7gOCVOEBWsl6LCfm+fmzlgqKYktAvasOsIl
 h6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ynp2Ywh0TeTSOhhf2AKkRBib7Iyqqnx9iZi2CH+BUCI=;
 b=Yygyj5ew07WYjlN7sZ3UhjdzOBvyRiRmKOf5iL1sOz7AfwZhQl7qvktCmiy/Bqncbg
 On1prdspVSVGBYmzDdyJeqwMaFYbkVUjde/4MFFZtW09jEtYpvWGw3w+68c5miwZiP+R
 /EgjZKhwj4Ejvjrw1Ptbpl9neo6w+eyY/pfOlmFGvydaYHGLRGtwS+7d0xDpO0zhDYC+
 Pw5+89n0uOJN7CSNpeEivAAjaXpCEJTzVItt3XCV23IbbT5n4R6htZYKwvkO8ukWIIjl
 Jh49F8Uwz87jNFB8U99do+0+N0Z3BiDytfEVNMxOHedNiS69yKZUnB0mIf6KYiRKTiBj
 XVpA==
X-Gm-Message-State: AOAM530HaqsOeIqbeQ433DR055NHMMt8szZSi2k6SZCN9B3A8ylUZoGV
 xW/Ser8IvVW738tdSUe5UxQ=
X-Google-Smtp-Source: ABdhPJxcyJcM/ByQW/MIW6ihwmGi9lSpmej6qKyCH4YVIojXhzyJ5iHr4J9FyCeeOy3rh95fFAZnyQ==
X-Received: by 2002:a62:fc86:: with SMTP id e128mr9855537pfh.133.1591921875669; 
 Thu, 11 Jun 2020 17:31:15 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id y6sm4433379pfp.144.2020.06.11.17.31.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Jun 2020 17:31:15 -0700 (PDT)
Date: Thu, 11 Jun 2020 17:31:04 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v2 3/3] ASoC: fsl_asrc_dma: Reuse the dma channel if
 available in Back-End
Message-ID: <20200612003103.GA28228@Asurada-Nvidia>
References: <cover.1591783089.git.shengjiu.wang@nxp.com>
 <0473d4191ae04ab711d63c5c875e47f45f598137.1591783089.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0473d4191ae04ab711d63c5c875e47f45f598137.1591783089.git.shengjiu.wang@nxp.com>
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
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, tiwai@suse.com,
 broonie@kernel.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 10, 2020 at 06:05:49PM +0800, Shengjiu Wang wrote:
> The dma channel has been requested by Back-End cpu dai driver already.
> If fsl_asrc_dma requests dma chan with same dma:tx symlink, then
> there will be below warning with SDMA.
> 
> [   48.174236] fsl-esai-dai 2024000.esai: Cannot create DMA dma:tx symlink
> 
> or with EDMA the request operation will fail for EDMA channel
> can only be requested once.
> 
> So If we can reuse the dma channel of Back-End, then the issue can be
> fixed.
> 
> In order to get the dma channel which is already requested in Back-End.
> we use the exported two functions (snd_soc_lookup_component_nolocked
> and soc_component_to_pcm). If we can get the dma channel, then reuse it,
> if can't, then request a new one.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc_common.h |  2 ++
>  sound/soc/fsl/fsl_asrc_dma.c    | 52 +++++++++++++++++++++++++--------
>  2 files changed, 42 insertions(+), 12 deletions(-)

> diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> index 77665b15c8db..09512bc79b80 100644
> --- a/sound/soc/fsl/fsl_asrc_common.h
> +++ b/sound/soc/fsl/fsl_asrc_common.h
> @@ -32,6 +32,7 @@ enum asrc_pair_index {
>   * @dma_chan: inputer and output DMA channels
>   * @dma_data: private dma data
>   * @pos: hardware pointer position
> + * @req_dma_chan_dev_to_dev: flag for release dev_to_dev chan

Since we only have dma_request call for back-end only:
+ * @req_dma_chan: flag to release back-end dma chan

> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index d6a3fc5f87e5..5ecb77d466d3 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -160,6 +161,9 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>  		substream_be = snd_soc_dpcm_get_substream(be, stream);
>  		dma_params_be = snd_soc_dai_get_dma_data(dai, substream_be);
>  		dev_be = dai->dev;
> +		component_be = snd_soc_lookup_component_nolocked(dev_be, SND_DMAENGINE_PCM_DRV_NAME);
> +		if (component_be)
> +			tmp_chan = soc_component_to_pcm(component_be)->chan[substream->stream];

Should we use substream_be->stream or just substream->stream?

And would be better to add these lines right before we really use
tmp_chan because there's still some distance till it reaches that
point. And would be better to have a line of comments too.

> @@ -205,10 +209,14 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>  	 */
>  	if (!asrc->use_edma) {
>  		/* Get DMA request of Back-End */
> -		tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
> +		if (!tmp_chan) {
> +			tmp_chan_new = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
> +			tmp_chan = tmp_chan_new;

This is a bit confusing...though I finally got it :)
So probably better to have a line of comments.

> @@ -220,9 +228,26 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>  
>  		pair->dma_chan[dir] =
>  			dma_request_channel(mask, filter, &pair->dma_data);
> +		pair->req_dma_chan_dev_to_dev = true;
>  	} else {
> -		pair->dma_chan[dir] =
> -			asrc->get_dma_channel(pair, dir);
> +		/*
> +		 * With EDMA, there is two dma channels can be used for p2p,
> +		 * one is from ASRC, one is from another peripheral
> +		 * (ESAI or SAI). Previously we select the dma channel of ASRC,
> +		 * but find an issue for ideal ratio case, there is no control
> +		 * for data copy speed, the speed is faster than sample
> +		 * frequency.
> +		 *
> +		 * So we switch to use dma channel of peripheral (ESAI or SAI),
> +		 * that copy speed of DMA is controlled by data consumption
> +		 * speed in the peripheral FIFO.
> +		 */

This sounds like a different issue and should be fixed separately?
If you prefer not to, better to move this one to commit log, other
than having a changelog here, in my opinion.

Since it no longer uses get_dma_channel() for EDMA case, we should
update the comments at the top as well.

> +		pair->req_dma_chan_dev_to_dev = false;
> +		pair->dma_chan[dir] = tmp_chan;
> +		if (!pair->dma_chan[dir]) {
> +			pair->dma_chan[dir] = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
> +			pair->req_dma_chan_dev_to_dev = true;
> +		}
>  	}

Now there are some duplicated lines between these if-else routines, so
combining my previous comments, we can do (sample change, not tested):

@@ -197,18 +199,29 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	dma_cap_set(DMA_SLAVE, mask);
 	dma_cap_set(DMA_CYCLIC, mask);
 
+	/*
+	 * The Back-End device might have already requested a DMA channel,
+	 * so try to reuse it first, and then request a new one upon NULL.
+	 */
+	component_be = snd_soc_lookup_component_nolocked(dev_be, SND_DMAENGINE_PCM_DRV_NAME);
+	if (component_be)	// should probably error out if !component_be?
+		tmp_chan = be_chan = soc_component_to_pcm(component_be)->chan[substream->stream];
+	if (!tmp_chan)
+		tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
+
 	/*
 	 * An EDMA DEV_TO_DEV channel is fixed and bound with DMA event of each
 	 * peripheral, unlike SDMA channel that is allocated dynamically. So no
-	 * need to configure dma_request and dma_request2, but get dma_chan via
-	 * dma_request_slave_channel directly with dma name of Front-End device
+	 * need to configure dma_request and dma_request2, but get dma_chan of
+	 * Back-End device directly via dma_request_slave_channel.
 	 */
 	if (!asrc->use_edma) {
 		/* Get DMA request of Back-End */
-		tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
 		tmp_data = tmp_chan->private;
 		pair->dma_data.dma_request = tmp_data->dma_request;
-		dma_release_channel(tmp_chan);
+		/* Do not release tmp_chan if we are reusing the Back-End one */
+		if (!be_chan)
+			dma_release_channel(tmp_chan);
 
 		/* Get DMA request of Front-End */
 		tmp_chan = asrc->get_dma_channel(pair, dir);
@@ -220,9 +233,11 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 
 		pair->dma_chan[dir] =
 			dma_request_channel(mask, filter, &pair->dma_data);
+		pair->req_dma_chan = true;
 	} else {
-		pair->dma_chan[dir] =
-			asrc->get_dma_channel(pair, dir);
+		pair->dma_chan[dir] = tmp_chan;
+		/* Do not flag to release if we are reusing the Back-End one */
+		pair->req_dma_chan = !be_chan;
 	}
 
 	if (!pair->dma_chan[dir]) {

> @@ -273,19 +299,21 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>  static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
>  				struct snd_pcm_substream *substream)
>  {
> +	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct fsl_asrc_pair *pair = runtime->private_data;
> +	u8 dir = tx ? OUT : IN;
>  
>  	snd_pcm_set_runtime_buffer(substream, NULL);
>  
> -	if (pair->dma_chan[IN])
> -		dma_release_channel(pair->dma_chan[IN]);
> +	if (pair->dma_chan[!dir])
> +		dma_release_channel(pair->dma_chan[!dir]);
>  
> -	if (pair->dma_chan[OUT])
> -		dma_release_channel(pair->dma_chan[OUT]);
> +	if (pair->dma_chan[dir] && pair->req_dma_chan_dev_to_dev)
> +		dma_release_channel(pair->dma_chan[dir]);

Why we only apply this to one direction?
