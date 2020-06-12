Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 751E81F7DA3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 21:31:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49k9pJ3KwlzDqxF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 05:31:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MrnP4M4K; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49k9m80vdzzDqwV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jun 2020 05:29:59 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id z63so3841110pfb.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a4a2Pl1CFSq1GWe8QgYdCA4ph+xymGtgDfDZzT+4IG4=;
 b=MrnP4M4KchL7FJOLTbUbPeOpodea9cEMKXenI/A9XfvsliD4gdI1bSGbPo1HCq+PeH
 oUhU47XbIwNvM0D9ph7ctwVBwr6W40VlCNZqs43FVd5nzcvHLD8M3/uHBHRYkXCtQEHA
 cxH82FsGLEeN7WqHFmUaIBmBaCyCejKE+QWjR20w+l2Bu/ILF2kFdtUMYtYx8UjGpkZN
 wUnCINgTl53WsnF/rjdzmuwWp7QCP+QFIaJdK85+DncHWScwDNghqbdUEfYwLtmHe+XC
 MiRMHphwN+URaJvMgL+HNSAasFx3k3VYwsdevmtFcSaot4+UFugcdAPD0ynpq9es6vxi
 WVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a4a2Pl1CFSq1GWe8QgYdCA4ph+xymGtgDfDZzT+4IG4=;
 b=Y0H7/RZ8OYf8S5HEKlvjNHG4E/6PlONn7Dvp4SxV1j+9WVITGy2/1toqUyfyfh4jV0
 4o31DZDCQyY61X90SZPqQgd73wOHNxzFEslF5Dt0x6+Tpg27jC6Gbx7tjzAyYDQkwyIb
 s+eo+5nrfzjfKSzDhN4ZuA5ZosIjbmzNkP7UGjP6nkrQM1xmH5MZmEQgSU3AVz+HPoNC
 btkady/woDw7kxlRpj2TVf1L4H1Wy11++O7GpzmpKUQ9GPivLp8rjGXgv9QkYuk3w5Iz
 LD+Adu+BbjEpt/sdt5b+ByuDcX4uSaJWvEE4QgffnPB//ScUTJfyV8QhyRcUvfADQQPc
 CWxg==
X-Gm-Message-State: AOAM533hIWsGEI6uja57g6bt1C+nF97BUbkt6zUFR5JanfEevDqEO/eP
 XRIznHnp7Q3i58Y4zZ8G3kU=
X-Google-Smtp-Source: ABdhPJwseWqOvjBDHGRP7yoAe1UiXi1K4/GCKgBeAGhWekH7P5Vblc/Zm0oGbIJRoz6jgvwLhh+5gA==
X-Received: by 2002:a65:5349:: with SMTP id w9mr12392157pgr.281.1591990194780; 
 Fri, 12 Jun 2020 12:29:54 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id c1sm6977123pfo.197.2020.06.12.12.29.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Jun 2020 12:29:54 -0700 (PDT)
Date: Fri, 12 Jun 2020 12:29:43 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_ssi: Fix bclk calculation for mono channel
Message-ID: <20200612192942.GA26587@Asurada-Nvidia>
References: <1591690768-1691-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591690768-1691-1-git-send-email-shengjiu.wang@nxp.com>
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

On Tue, Jun 09, 2020 at 04:19:28PM +0800, Shengjiu Wang wrote:
> For mono channel, ssi will switch to normal mode. In normal
> mode, the Word Length Control bits control the word length
> divider in clock generator, which is different with I2S master
> mode, the word length is fixed to 32bit.
> 
> So we refine the famula for mono channel, otherwise there
> will be sound issue for S24_LE.
> 
> Fixes: b0a7043d5c2c ("ASoC: fsl_ssi: Caculate bit clock rate using slot number and width")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_ssi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> index bad89b0d129e..e347776590f7 100644
> --- a/sound/soc/fsl/fsl_ssi.c
> +++ b/sound/soc/fsl/fsl_ssi.c
> @@ -695,6 +695,11 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
>  	/* Generate bit clock based on the slot number and slot width */
>  	freq = slots * slot_width * params_rate(hw_params);
>  
> +	/* The slot_width is not fixed to 32 for normal mode */
> +	if (params_channels(hw_params) == 1)

This function has a local variable that you can reuse here:
	unsigned int slots = params_channels(hw_params);

> +		freq = (slots <= 1 ? 2 : slots) * params_width(hw_params) *
> +		       params_rate(hw_params);

We have a small section of slots and slot_width calculation
at the top of this function where we can squash these in.
