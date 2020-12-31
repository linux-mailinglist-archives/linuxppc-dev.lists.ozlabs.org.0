Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6EC2E81E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Dec 2020 21:09:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D6K4B61x8zDqMh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jan 2021 07:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q4OSIz/J; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D6K2b13jPzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jan 2021 07:07:49 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id lj6so5340613pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Dec 2020 12:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LUdKDlLlflhborB/8hVdW+VgkZLtdJkIlQCMkULEfnY=;
 b=q4OSIz/JkJT0Z+P9uVNEenQw9LCMicx+csh5V1YclMspc2ubhEGsY9l8aXWn/1o2D2
 tqsq+6zRnIEQMwGOBhYBOR9pibQi2htQPQreoUST292qXMsKVsAGim3LKXZ9E+zMie7M
 52pwQiP+QDRiqEfB5yLl54UhEeUJ60jgAJwDEmxEkbKliBbXL/avFooqe6pFZMd1QB1x
 f3/SsfSySDPPrUOV8ywWsXStpQTqui22/EZnyTuI7YSk7qzrBY3irhTo5l7yn6rfj/Vz
 GGe2OnNRSe4tThPrYvn4loOQr6sb0xPyFqSteoIbplYoQzmBYtJfo/gJZzG5cX1u/qXP
 c+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LUdKDlLlflhborB/8hVdW+VgkZLtdJkIlQCMkULEfnY=;
 b=RTChnN6EHu/03t1ztSlU3pdJO2BrZsll4hnNf6m210MmARO3l3jifPVxf1jafCStuN
 vZfh5Ff2tek/exnan6enYVpvjZYR8JgzWVe6QK3nip62TmGg5Jkkzf3b3J3GPCaJZKlY
 zf6b1eAWevrffccg9/I/GIV3hHlP0EdWqbDaWH6xAy1MB3655lt7JZ8NY3whWLb3xCEV
 Cd+CCE6XGKOQwJxcgIm5GMdDuvKyhNUgSi9QAy8eAOUk646EtPcOI5YKRaIJxM67v10X
 iI2T7of1/gB7oO4g53+6EG9gfQM7SHmvmy6a/GND8KRUZ0VR74SunJnNIxi3wBVzkyBW
 K3fw==
X-Gm-Message-State: AOAM533TCWNo6oTITuliDDhif//In0fmMsgfg/VJsTteDe7FVHH4z97A
 f5w69TF6cspRqC3GRgM3wIs=
X-Google-Smtp-Source: ABdhPJzl+Fbw2ZK/0YW+xvW1opW2piy82XGq/LFQSMQzdbhXDr9nGtRYASFfPXeTVmyCnl65miZT/w==
X-Received: by 2002:a17:902:6b0a:b029:dc:31af:8dc3 with SMTP id
 o10-20020a1709026b0ab02900dc31af8dc3mr36249199plk.41.1609445265935; 
 Thu, 31 Dec 2020 12:07:45 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id y189sm44418568pfb.155.2020.12.31.12.07.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 31 Dec 2020 12:07:45 -0800 (PST)
Date: Thu, 31 Dec 2020 12:07:57 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: fix -Wmaybe-uninitialized warning
Message-ID: <20201231200756.GA15207@Asurada-Nvidia>
References: <20201230154443.656997-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230154443.656997-1-arnd@kernel.org>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Timur Tabi <timur@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 clang-built-linux@googlegroups.com, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Nathan Chancellor <natechancellor@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org
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

I think Mark has already applied a fix :)
https://lkml.org/lkml/2020/12/16/275
