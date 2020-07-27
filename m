Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A86C22E38F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 02:58:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFLyZ2prBzF132
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 10:58:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qECpGkVD; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFLws3Dk2zF0c0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 10:56:44 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id f9so2156666pju.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 17:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9VytBfcaiiwF/SVBWcvrj4CgGXad34ZD6/IzLtTN6BY=;
 b=qECpGkVDv2cow+e4GmXBbUtYwC2BxMmasbbOkXzXC7gU3EnKJiQrQUcAu0XkqsTpOC
 fNV/XKKsMoVQazhJZMbF13OfNde2LKYJ6yZgLqG4SvH2h/tpIP1KXfgtpxmSHrAchFwH
 WUkP2EXnU4NOvRq9EO84tuWkBUbCqLK6kVzooFZTCZQAHOF6QjQ+UyFvv2sTqqvoGNDR
 6WwJ1U7hbYF2979H608Y7jli0PJGd7skrHfasilFDLh77gMysD4ADYn4sRaxLkkIZ3pz
 AiOM3jwD1JYr1H/cguYxLEcWe/x+pbdfnBGoIzt6NYAz66CXYDgTaz693+Cuz7d3jcdv
 OMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9VytBfcaiiwF/SVBWcvrj4CgGXad34ZD6/IzLtTN6BY=;
 b=r55SaI67z/w/eHHlOLn1gHIvbFWIEJjLsmIXNdYRMbmOLC4Pzj0Sm78Fcdl6Y2Uyr9
 UxRz7D9Wmixf8H14nAP3veQeSd9fBeKNuNMrO001MwWuvEZHbNQ3yTj50n0JBeiJ17kg
 55/dMAFNMTsvI731qikIMZ6KxufGuQ2aFrYdxjH46SmI8WHjWZuy7+TXCFvuWnodU4ww
 JpktyZGULlo9JW1xMAlKp/UNcks5ZqwYQK4khhBqLHmKj5kETKO5CPdirz3XAqQifewp
 UWIw/t4zgjCioW4eo3XhA8+Og7Udv8pkoWQPli9MD6MrvnqxnHqGm3WGmb9DNzfL/gUn
 yB5A==
X-Gm-Message-State: AOAM533riH8up92igCyij13/UDZyhRRLW9/sWTyKmCLF7qwlRBXQ7INe
 efQbD0Zg8UaAtQSciqcJsMY=
X-Google-Smtp-Source: ABdhPJxjbwFwZRPOhq8ClPjborSekOfOe3pyNf+GPEnnAFAc44svuxU+ktHfX7yMtMp1WpWUDb709Q==
X-Received: by 2002:a17:902:988b:: with SMTP id
 s11mr16232999plp.229.1595811399410; 
 Sun, 26 Jul 2020 17:56:39 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id k23sm12499712pgb.92.2020.07.26.17.56.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 Jul 2020 17:56:39 -0700 (PDT)
Date: Sun, 26 Jul 2020 17:55:59 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Remove fsl_asoc_card_set_bias_level
 function
Message-ID: <20200727005558.GA30124@Asurada-Nvidia>
References: <1595762417-2190-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595762417-2190-1-git-send-email-shengjiu.wang@nxp.com>
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

On Sun, Jul 26, 2020 at 07:20:17PM +0800, Shengjiu Wang wrote:
> With this case:
> aplay -Dhw:x 16khz.wav 24khz.wav
> There is sound distortion for 24khz.wav. The reason is that setting
> PLL of WM8962 with set_bias_level function, the bias level is not
> changed when 24khz.wav is played, then the PLL won't be reset, the
> clock is not correct, so distortion happens.
> 
> The resolution of this issue is to remove fsl_asoc_card_set_bias_level.
> Move PLL configuration to hw_params and hw_free.

Hmm...using set_bias_level() instead of hw_params/hw_free() was
strongly suggested by Mark when I got imx-wm8962 machine driver
upstream. So we will need his input here, although I personally
don't have a problem with it...

> After removing fsl_asoc_card_set_bias_level, also test WM8960 case,
> it can work.
> 
> Fixes: 708b4351f08c ("ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 149 +++++++++++++++-------------------
>  1 file changed, 66 insertions(+), 83 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 4848ba61d083..0517dbb3e908 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -73,6 +73,7 @@ struct cpu_priv {
>   * @codec_priv: CODEC private data
>   * @cpu_priv: CPU private data
>   * @card: ASoC card structure
> + * @is_stream_in_use: flags for release resource in hw_free

Would love to see something shorter... Could we reuse similar
one below, borrowing from fsl_ssi driver?

 * @streams: Mask of current active streams: BIT(TX) and BIT(RX)

>  static int fsl_asoc_card_audmux_init(struct device_node *np,
>  				     struct fsl_asoc_card_priv *priv)
>  {
> @@ -611,7 +600,6 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  	/* Diversify the card configurations */
>  	if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
>  		codec_dai_name = "cs42888";
> -		priv->card.set_bias_level = NULL;

Can check if set_bias_level is still being used with this change.
