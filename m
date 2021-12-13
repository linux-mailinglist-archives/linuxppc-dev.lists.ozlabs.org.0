Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D1473612
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 21:37:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCYGy2dZNz3cXZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 07:37:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.173;
 helo=mail-oi1-f173.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCYGX0vJ7z2ypV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 07:37:24 +1100 (AEDT)
Received: by mail-oi1-f173.google.com with SMTP id be32so24707839oib.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 12:37:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZgfptJ9Nc5V7IoyX3trjYNyQOy+R5xm/7NE8jjO7OEA=;
 b=5Wr5Kv5eXIIUz3oV67avdfJfe4ZHAfM9NNFleH0U4443FGof1AuUcBKAqPLqorFs27
 0WejKb4tUouVMRJbEvu4jQ268GIDf/d3dQV9Eq1N+pvSJ1r7MyHmE67F3TnnxO9QJib6
 NcodGk52o8K9yZiNZqTOX+dn+KG3SoYAflxfSEI9LXTHVtbnyVDXjA954jiYB7oXO7V0
 pkgOaOYFngcdXZuQUH2BFdwHFepXI1rfq+qhFm2Aa1o9yKn0eDAeMHI+qw9VS9fjrRzr
 wb5XRUr8rnkDrNzbhKfRcoMtZotYqcSbEwOXsV3hW3Y6kWsLSN0tJ0V/1ZvfdbfP53mM
 cjbw==
X-Gm-Message-State: AOAM53007ShseRdpi7C721KryP8IZS+0Wkqg5wMtZJc5kx7oQHCZiw1L
 OGw4E9DFB/Vm6DwbGuJphw==
X-Google-Smtp-Source: ABdhPJxRGFl7/TuYODUdC0OyJhloj38Cvr/IgqWq5bUIDnUkSaz8Q/Vd7zdWNvdsGQ+H/NDCpJzSSA==
X-Received: by 2002:a05:6808:20a5:: with SMTP id
 s37mr28661250oiw.127.1639427841508; 
 Mon, 13 Dec 2021 12:37:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d8sm2915081oiw.24.2021.12.13.12.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 12:37:20 -0800 (PST)
Received: (nullmailer pid 1529335 invoked by uid 1000);
 Mon, 13 Dec 2021 20:37:19 -0000
Date: Mon, 13 Dec 2021 14:37:19 -0600
From: Rob Herring <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [PATCH 3/4] ASoC: fsl-asoc-card: Add optional dt property for
 setting mclk-id
Message-ID: <Ybeu/1vsUzvAg2Ya@robh.at.kernel.org>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
 <20211203134930.128703-4-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203134930.128703-4-ariel.dalessandro@collabora.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 michael@amarulasolutions.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 bcousson@baylibre.com, perex@perex.cz, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 03, 2021 at 10:49:29AM -0300, Ariel D'Alessandro wrote:
> Sound cards may allow using different main clock inputs. In the generic
> fsl-asoc-card driver, these values are hardcoded for each specific card
> configuration.
> 
> Let's make it more flexible, allowing setting mclk-id from the
> device-tree node. Otherwise, the default value for each card
> configuration is used.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl-asoc-card.txt | 1 +
>  sound/soc/fsl/fsl-asoc-card.c                             | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
> index 23d83fa7609f..b219626a5403 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
> @@ -82,6 +82,7 @@ Optional properties:
>    - dai-format		: audio format, for details see simple-card.yaml.
>    - frame-inversion	: dai-link uses frame clock inversion, for details see simple-card.yaml.
>    - bitclock-inversion	: dai-link uses bit clock inversion, for details see simple-card.yaml.
> +  - mclk-id		: main clock id, specific for each card configuration.

Ahh, there it is. This change and the header defines should be 1 patch 
and driver changes another.

>  
>  Optional unless SSI is selected as a CPU DAI:
>  
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 90cbed496f98..bb962e04d40b 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -693,6 +693,12 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  		goto asrc_fail;
>  	}
>  
> +	/*
> +	 * Allow setting mclk-id from the device-tree node. Otherwise, the
> +	 * default value for each card configuration is used.
> +	 */
> +	of_property_read_u32(np, "mclk-id", &priv->codec_priv.mclk_id);
> +
>  	/* Format info from DT is optional. */
>  	snd_soc_daifmt_parse_clock_provider_as_phandle(np, NULL, &bitclkprovider, &frameprovider);
>  	if (bitclkprovider || frameprovider) {
> -- 
> 2.30.2
> 
> 
