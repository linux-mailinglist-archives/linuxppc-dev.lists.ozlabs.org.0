Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D6F2E7EA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Dec 2020 09:14:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D61CJ22ryzDqLq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Dec 2020 19:14:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12c;
 helo=mail-il1-x12c.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OkZtmlJL; dkim-atps=neutral
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D619b5MgVzDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Dec 2020 19:12:49 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id v3so16833625ilo.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Dec 2020 00:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t3sCvs+FLAqfEmFOY3gSWy3C5FD079L2BEMz5q0+2bY=;
 b=OkZtmlJLPwpYGEBhlMTlxC1UNnPNxBb2enYNiFsvCETew052T/SM529w00lcZ0fkU5
 DxiAtfdG8AYnhPcUYDCLhQw30Pb+ngkdcM6cwNWgNn8pByZaN2K3aSG2A9pRE/bJ8/z8
 5qv7tFwZyFVcLOVEXFxINtfell5leVzCMDegQwV63WYi8gfCDuh/Cp1qG/tCa/z+FSwh
 BK5joIczA34jFH5vo97p8k0BzClO9gA1LZSYgRuBJDRZJkkPar5IE905+skQb43AJvoA
 7Etsuhic3bu54GcaoTvgKEG6C8epT7F+fos6MZ/LRuETJImDYOBGc0QFIkj2G4G2FRz5
 3WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t3sCvs+FLAqfEmFOY3gSWy3C5FD079L2BEMz5q0+2bY=;
 b=j6vOCpjZ+s1HVI9+0skvOAHSbuPIFLwzvyl86kGq4x0TZjMaRtka8cLfs/zvf1WxE7
 faHqZ8FUiuo5lwWNeoAcINJBesZl6/JbbfRZoPMSdbZwCMqXzvIFMTzhWypo+/Hd8J0v
 Fnn1QkHvUqwzDEyV1xdtFb0ikzs3hbuH6Mw02Nvt6EErH41tlRIFng4ERwXonEVptl12
 X9r9oCbuQ0VpHEqqXxTCJwj95Qxs1Wc0T6qjuHyIU/eWxI+SUMOjsuTRW7VUKmISzm1y
 alxJx5NLU5gTCOMpTwAb0nuqgB7o0skhiDuqvljdE7OWAukICt+jCg3RNveQc/No2VOY
 0QDg==
X-Gm-Message-State: AOAM530y01PzXX6OLar9WqMVwzJk4fH+bu9fiNSEqTxlHdbXNziz6UeW
 fMu8lSzd3ijrHbUeeYczDnw=
X-Google-Smtp-Source: ABdhPJzulMTF8nMMBl5A1e/hD/tt98OHBQ06c26gifLgedLyKNUPLiTG4n2V5ZcJIbzuF8Inj5bFxA==
X-Received: by 2002:a92:8404:: with SMTP id l4mr54964892ild.49.1609402363602; 
 Thu, 31 Dec 2020 00:12:43 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id r10sm32437881ilo.34.2020.12.31.00.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 00:12:42 -0800 (PST)
Date: Thu, 31 Dec 2020 01:12:40 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: fix -Wmaybe-uninitialized warning
Message-ID: <20201231081240.GB1970946@ubuntu-m3-large-x86>
References: <20201230154443.656997-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230154443.656997-1-arnd@kernel.org>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Timur Tabi <timur@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, clang-built-linux@googlegroups.com,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 30, 2020 at 04:44:15PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Clang points out a code path that returns an undefined value
> in an error case:
> 
> sound/soc/fsl/imx-hdmi.c:165:6: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsom
> etimes-uninitialized]
>         if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/fsl/imx-hdmi.c:212:9: note: uninitialized use occurs here
>         return ret;
> 
> The driver returns -EINVAL for other broken DT properties, so do
> it the same way here.
> 
> Fixes: 6a5f850aa83a ("ASoC: fsl: Add imx-hdmi machine driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  sound/soc/fsl/imx-hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
> index 2c2a76a71940..ede4a9ad1054 100644
> --- a/sound/soc/fsl/imx-hdmi.c
> +++ b/sound/soc/fsl/imx-hdmi.c
> @@ -164,6 +164,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
>  
>  	if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
>  		dev_err(&pdev->dev, "Invalid HDMI DAI link\n");
> +		ret = -EINVAL;
>  		goto fail;
>  	}
>  
> -- 
> 2.29.2
> 
