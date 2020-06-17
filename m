Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 694991FC622
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 08:26:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mw8B32TjzDqpk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 16:26:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uQiJm1Kv; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mw6V2DmqzDqld
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 16:25:20 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id b16so597828pfi.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 23:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g3cuqw1MSyXPgpwfSctF0q4VjJu4I8Z3M0GkPzhFPXI=;
 b=uQiJm1KvSqhA+U+Rmq7T3vkBhQwaFWZe2j+ocuj3Vyq/u5pzs6ioJ5ccCn8x/fmbEk
 D+mupFc9PdPKhEnu1tBz8N1ZZRdzgRAEzCjKOiA97ngMztK5FiGeVm4aRe75tjg0YbGp
 beCEtKsmaET3KAIu2Hhw5+9wPy8altJfh0fqp+zladWB7rbFOuJgZu/BoqesFJSj9yPO
 wS3XiFM3c2jEVKpX3kaEDLiFyLTovbRh7asyxqnc+wiPfm/W6LdLkaHS+6KTKCpVYBx9
 +NzUfWKIgMxbggZA7xXMfMp1PDcG7A/ZMLCuz5MZ2NHbTeEPgcU8cJUvsmuASmXRA+X8
 HHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g3cuqw1MSyXPgpwfSctF0q4VjJu4I8Z3M0GkPzhFPXI=;
 b=IX0a5bxkIpifdD1sFStBMCDhFI2T3gkzETyIgXr5LsFDDklOM93HobK/1I4+Owr/zX
 frSwUFx76jM0g9+RfkNBhiByb4aYqR/fpPZ6iUyjijvPlrllwQcRE5ikjLPfeC7O8BlT
 QRzrHu9EMyxtqVZviJbdycjPkzjghxl1TjMcNkEdeON80y9dGr/qi8+CpqNlIgs5hGGn
 gEFqfDgqepIyDBU/dS0Bf1Zpn2l2rbBc7nL0YFb6KSaZXOPZcPL4F77Yd7fX0b3EI9za
 tGhxAKkVUgyL2c/Mgtl52PRscUP2+aFFZnMPETCPhwoLHyvatag4r88b7+i9tJWnAQZC
 cBUQ==
X-Gm-Message-State: AOAM533pKF/mJPwn7rQpSBbVDrXUCbePYdLG7SQL0qgSpRGwS9Rc5Cpp
 v5N/oxVNUh89JUAECLhr1j0=
X-Google-Smtp-Source: ABdhPJw1gU2G4M0g+SAUSO6VDblRQx1jBiF2PJ3y6iajq5no77C2746qSL/0k/jfXmN6z06pyK6esA==
X-Received: by 2002:aa7:9aee:: with SMTP id y14mr5269735pfp.105.1592375116437; 
 Tue, 16 Jun 2020 23:25:16 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id j36sm3305919pgj.39.2020.06.16.23.25.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 23:25:16 -0700 (PDT)
Date: Tue, 16 Jun 2020 23:24:58 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_spdif: Add support for imx6sx platform
Message-ID: <20200617062457.GA6411@Asurada-Nvidia>
References: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592368322.git.shengjiu.wang@nxp.com>
 <53a969a83999de91f3ff2809d78335c3f0cc1ee3.1592368322.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53a969a83999de91f3ff2809d78335c3f0cc1ee3.1592368322.git.shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 17, 2020 at 12:30:17PM +0800, Shengjiu Wang wrote:
> The one difference on imx6sx platform is that the root clock
> is shared with ASRC module, so we add a new flags
> "shared_root_clock" which means the root clock is independent,

"shared" means "not independent", against "independent" ;)

> then we will not do the clk_set_rate and clk_round_rate to avoid
> impact ASRC module usage.
> 
> As add a new flags, we include the soc specific data struct.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Can add this once fixing the remaining comments:

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>

> +static inline bool fsl_spdif_can_set_clk_rate(struct fsl_spdif_priv *spdif,
> +					      int clk)

Can actually merge into single line as kernel has 100-character
limit now, though 80-char is still preferable for a good coding
style. But I think this one wouldn't be too bad at all.

> @@ -421,7 +456,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
>  	sysclk_df = spdif_priv->sysclk_df[rate];
>  
>  	/* Don't mess up the clocks from other modules */

We can drop this comments now as it's out-of-date and the name of
the new helper function is straightforward enough.

> -	if (clk != STC_TXCLK_SPDIF_ROOT)
> +	if (!fsl_spdif_can_set_clk_rate(spdif_priv, clk))
>  		goto clk_set_bypass;
>  
>  	/* The S/PDIF block needs a clock of 64 * fs * txclk_df */
