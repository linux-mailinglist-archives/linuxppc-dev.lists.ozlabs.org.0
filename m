Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6808E2286
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 20:33:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yzXF3WPJzDqRM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 05:33:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O0V7U6xd"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yzVG445rzDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 05:31:32 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id c8so7824947pgb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QhucI9QNtNBjoT1eOT78ESBAn4mEJQ0ycZgAHsd53Fc=;
 b=O0V7U6xdxg3UJAoCsFL181e1vuQig/OWqm5AcucL89tYd3b9qkjvMM9lP+EMxIsd/D
 nULS8++93595dJ/MuPxdOiWNwPro4vx1uibpDaTFOBc/mbbfnZWArkgAkdi/1Sj4/3pn
 CnpHhKkutuirpbGJ15oFkWcPeKybaQuwdY/Oazfd9/NO6HOUG/4hvUOU/gPflhn79F4c
 jtn03qKJHmp9p9aXWAi6MaSW2jHtLl2JfuzxfmqRrM5JSt3BefvV2/wNb5KsF+eiNmTo
 9HFMS5Pxk97txKDYDYBY6kMTP4UH0oyklI+Gu8j1EQSiUodwRt97MzOGork+gaeFtCPn
 6VZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QhucI9QNtNBjoT1eOT78ESBAn4mEJQ0ycZgAHsd53Fc=;
 b=cw5hCZpjjwHoeiBKgjBIayggWSKY0n8mjRALzt8sLh/qFmcykhF/OOuxc51o+N1zIh
 LlWN8RPT1BUE04Xb2bcrcIjpNfv9W5GqPOknAWkpkyPIZoxxI60WRU/ue8Y7pvD4sgRs
 tWausIZEvWj5RRalq9P1TIzwR6rtQ1u/VeJghqqD+i1cXL68c9Y+r6HXI++J/6g1YQPJ
 1zsqgkveTlTmSs6sqj0FUmy9vo85VH7QH9YitCWGUv/+Rm1DmKouVR4bi40oDwSUFGVz
 OSZw2qg1Kq4hMn8QqhKvsS+ab58e0P9cxh4CybBc/VCRdH7Mo0KcKYXlJm22n7UNsr7z
 wj3A==
X-Gm-Message-State: APjAAAWRKfcXjc7sDSbDHrUd99QGjm9Gzgs/g+TS5l1wI4807hXOHaFV
 6mP5uqlGuHZpj0raP68oYZM=
X-Google-Smtp-Source: APXvYqxzu1oD36VJIGp854tNQIRLLmtcz4McKHR96Hyw1WByLg+NWOb5VOZ+kJaLQ35nHQjMgw5vEw==
X-Received: by 2002:aa7:8ac5:: with SMTP id b5mr12396158pfd.66.1571855488547; 
 Wed, 23 Oct 2019 11:31:28 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id z4sm30137417pfn.45.2019.10.23.11.31.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Oct 2019 11:31:28 -0700 (PDT)
Date: Wed, 23 Oct 2019 11:31:03 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_esai: Add spin lock to protect reset and stop
Message-ID: <20191023183102.GA16043@Asurada-Nvidia.nvidia.com>
References: <1571815789-15656-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571815789-15656-1-git-send-email-shengjiu.wang@nxp.com>
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

On Wed, Oct 23, 2019 at 03:29:49PM +0800, Shengjiu Wang wrote:
> xrun may happen at the end of stream, the
> trigger->fsl_esai_trigger_stop maybe called in the middle of
> fsl_esai_hw_reset, this may cause esai in wrong state
> after stop, and there may be endless xrun interrupt.

What about fsl_esai_trigger_start? It touches ESAI_xFCR_xFEN bit
that is being checked in the beginning of fsl_esai_hw_reset.

Could the scenario below be possible also?

1) ESAI TX starts
2) Xrun happens to TX
3) Starting fsl_esai_hw_reset (enabled[TX] = true; enabled[RX] = false)
4) ESAI RX starts
5) Finishing fsl_esai_hw_reset (enabled[RX] is still false)

Thanks
Nicolin

> So Add spin lock to lock these two function.
> 
> Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after xrun")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_esai.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index 37b14c48b537..6a797648b66d 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -33,6 +33,7 @@
>   * @fsysclk: system clock source to derive HCK, SCK and FS
>   * @spbaclk: SPBA clock (optional, depending on SoC design)
>   * @task: tasklet to handle the reset operation
> + * @lock: spin lock to handle reset and stop behavior
>   * @fifo_depth: depth of tx/rx FIFO
>   * @slot_width: width of each DAI slot
>   * @slots: number of slots
> @@ -56,6 +57,7 @@ struct fsl_esai {
>  	struct clk *fsysclk;
>  	struct clk *spbaclk;
>  	struct tasklet_struct task;
> +	spinlock_t lock; /* Protect reset and stop */
>  	u32 fifo_depth;
>  	u32 slot_width;
>  	u32 slots;
> @@ -676,8 +678,10 @@ static void fsl_esai_hw_reset(unsigned long arg)
>  {
>  	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
>  	bool tx = true, rx = false, enabled[2];
> +	unsigned long lock_flags;
>  	u32 tfcr, rfcr;
>  
> +	spin_lock_irqsave(&esai_priv->lock, lock_flags);
>  	/* Save the registers */
>  	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
>  	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
> @@ -715,6 +719,8 @@ static void fsl_esai_hw_reset(unsigned long arg)
>  		fsl_esai_trigger_start(esai_priv, tx);
>  	if (enabled[rx])
>  		fsl_esai_trigger_start(esai_priv, rx);
> +
> +	spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
>  }
>  
>  static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
> @@ -722,6 +728,7 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
>  {
>  	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
>  	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> +	unsigned long lock_flags;
>  
>  	esai_priv->channels[tx] = substream->runtime->channels;
>  
> @@ -734,7 +741,9 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		spin_lock_irqsave(&esai_priv->lock, lock_flags);
>  		fsl_esai_trigger_stop(esai_priv, tx);
> +		spin_unlock_irqrestore(&esai_priv->lock, lock_flags);
>  		break;
>  	default:
>  		return -EINVAL;
> @@ -1002,6 +1011,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
>  
>  	dev_set_drvdata(&pdev->dev, esai_priv);
>  
> +	spin_lock_init(&esai_priv->lock);
>  	ret = fsl_esai_hw_init(esai_priv);
>  	if (ret)
>  		return ret;
> -- 
> 2.21.0
> 
