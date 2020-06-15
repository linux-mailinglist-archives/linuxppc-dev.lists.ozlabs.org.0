Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A581FA3EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 01:11:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m6Xm4qJCzDqb1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 09:11:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s8SbpV8W; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m6V55PlszDqTx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 09:09:33 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id v24so7483056plo.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 16:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CZIooZOYrM4oHys2Fguf/RcobpmlQgsMJE5D3+t8a3E=;
 b=s8SbpV8WwE+0uXdhNI+KLlpCRXLu8JhAicTSsZd0QWEyp3xzmM+kv6/b09cNFeZR9b
 NyDyr9O3fHTyZZJbC35tGVkkhhhK4fQrNJKWcNsYu1cqWPa2Nz8U4H8G8oMx1/titCIq
 vcri45A7ClhV3TX54H+qbPHW+B7ZDeh0gkkggjoSwyWs2jF2GB8i5k3qHHKv8cndJBg+
 TLQZ+Rmd/pUaljPEbAAPV2TfUCqTa10psxgQqGI6kclZPUFV4zdvu09hIwCikTBLrFqD
 fjjTXYau6ovMG3DnPd9pHdBQcwxKgHebLUrUIckOzZroEG5NFovC9Qt/FA7t3JC07Dax
 8ZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CZIooZOYrM4oHys2Fguf/RcobpmlQgsMJE5D3+t8a3E=;
 b=VJnS+U9Fv/JpuaNydB46mymxxjwON7bM334GoQJQhK2gBuhYPtMuWbQ8/JYQrNt2Mk
 v8MQpLQLhjlh2ToUWPfr1xRspfqNFTtwigMPhHeg5vMTPL08YpSAITX2x6z0NLKfTKGW
 pvoPjVa4MKDDul4TYEfzZz1SO2kP9aYckkihTNaUZ7D1Q9p1xiZfmLWcwqpbUrb08AYx
 HKh+Qyad7YT63LW8UQoPDYds3ImUyMx8GaoLoTjLx3BcSBcmLPr+FzPn7PMW6alDITUO
 ZllBvMMQsQHczK3pQR7osCK6G7lSNphWPbGr/scpr/sLK0hDye0Qgf82C+3Up119h+Be
 k4hQ==
X-Gm-Message-State: AOAM530ib6RsGoJqWGYYXRYIf5T8y3hitN5tgtw25M0HcEMT582hzFSQ
 xrs15Q/zPyudF9fh4bd01Lw=
X-Google-Smtp-Source: ABdhPJzYmMCqNo7Tvi3y7s2FcqEPRPMQmasSc/gLlXeb0diBiZXjM3JRbdNbuH7POcVtectfAliYtA==
X-Received: by 2002:a17:90b:18c:: with SMTP id t12mr218974pjs.53.1592262570188; 
 Mon, 15 Jun 2020 16:09:30 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id u4sm466277pjn.42.2020.06.15.16.09.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Jun 2020 16:09:29 -0700 (PDT)
Date: Mon, 15 Jun 2020 16:09:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_ssi: Fix bclk calculation for mono channel
Message-ID: <20200615230912.GA16681@Asurada-Nvidia>
References: <b5cf5e3cc39c62f6bb3660b7588b037ffc57f780.1592200690.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5cf5e3cc39c62f6bb3660b7588b037ffc57f780.1592200690.git.shengjiu.wang@nxp.com>
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
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, perex@perex.cz,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 01:56:18PM +0800, Shengjiu Wang wrote:
> For mono channel, SSI will switch to Normal mode.
> 
> In Normal mode and Network mode, the Word Length Control bits
> control the word length divider in clock generator, which is
> different with I2S Master mode (the word length is fixed to
> 32bit), it should be the value of params_width(hw_params).
> 
> The condition "slots == 2" is not good for I2S Master mode,
> because for Network mode and Normal mode, the slots can also
> be 2. Then we need to use (ssi->i2s_net & SSI_SCR_I2S_MODE_MASK)
> to check if it is I2S Master mode.

The fsl_ssi_set_bclk is only called when fsl_ssi_is_i2s_master,
though I agree that that line of comments sounds confusing now.

> So we refine the famula for mono channel, otherwise there

famula => formula?

> will be sound issue for S24_LE.
> 
> Fixes: b0a7043d5c2c ("ASoC: fsl_ssi: Caculate bit clock rate using slot number and width")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2
> - refine patch for Network mode and Normal mode.
> 
>  sound/soc/fsl/fsl_ssi.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> index bad89b0d129e..cbf67d132fda 100644
> --- a/sound/soc/fsl/fsl_ssi.c
> +++ b/sound/soc/fsl/fsl_ssi.c
> @@ -678,7 +678,8 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
>  	struct regmap *regs = ssi->regs;
>  	u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
>  	unsigned long clkrate, baudrate, tmprate;
> -	unsigned int slots = params_channels(hw_params);
> +	unsigned int channels = params_channels(hw_params);
> +	unsigned int slots;
>  	unsigned int slot_width = 32;
>  	u64 sub, savesub = 100000;
>  	unsigned int freq;
> @@ -688,9 +689,15 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
>  	/* Override slots and slot_width if being specifically set... */
>  	if (ssi->slots)
>  		slots = ssi->slots;
> -	/* ...but keep 32 bits if slots is 2 -- I2S Master mode */
> -	if (ssi->slot_width && slots != 2)
> -		slot_width = ssi->slot_width;
> +	else
> +		/* Apply two slots for mono channel, because DC = 2 */
> +		slots = (channels == 1) ? 2 : channels;
> +
> +	/* ...but keep 32 bits if I2S Master mode */
> +	if ((ssi->i2s_net & SSI_SCR_I2S_MODE_MASK) != SSI_SCR_I2S_MODE_MASTER ||
> +	    channels == 1)
> +		slot_width = ssi->slot_width ? ssi->slot_width :

This looks very complicated...can you review and try mine?
(Basically, take 32-bit out of default but force it later)

@@ -678,8 +678,9 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
        struct regmap *regs = ssi->regs;
        u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
        unsigned long clkrate, baudrate, tmprate;
-       unsigned int slots = params_channels(hw_params);
-       unsigned int slot_width = 32;
+       unsigned int channels = params_channels(hw_params);
+       unsigned int slot_width = params_width(hw_params);
+       unsigned int slots = 2;
        u64 sub, savesub = 100000;
        unsigned int freq;
        bool baudclk_is_used;
@@ -688,10 +689,16 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
        /* Override slots and slot_width if being specifically set... */
        if (ssi->slots)
                slots = ssi->slots;
-       /* ...but keep 32 bits if slots is 2 -- I2S Master mode */
-       if (ssi->slot_width && slots != 2)
+       if (ssi->slot_width)
                slot_width = ssi->slot_width;
 
+       /*
+        * ...but force 32 bits for stereo audio. Note that mono audio is also
+        * sent in 2 slots via NORMAL mode, so check both slots and channels.
+        */
+       if (slots == 2 && channels == 2)
+               slot_width = 32;
+
        /* Generate bit clock based on the slot number and slot width */
        freq = slots * slot_width * params_rate(hw_params);
 
