Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 744DB909D95
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2024 15:02:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=RZExeNms;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2CpX0fTHz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2024 23:02:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=RZExeNms;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=193.252.23.215; helo=msa.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 20763 seconds by postgrey-1.37 at boromir; Sun, 16 Jun 2024 23:01:33 AEST
Received: from msa.smtpout.orange.fr (msa-215.smtpout.orange.fr [193.252.23.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2Cnn3NJZz30V3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2024 23:01:30 +1000 (AEST)
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id Ik5as8CMcevLqIk5bsMq50; Sun, 16 Jun 2024 09:14:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718522060;
	bh=YP7PkSksy9wMazSXjGajDue5tMT2K7r8fSa1XkSOCMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=RZExeNmsKlRnZQBILU4YjwXErTuEql+SaccL2uFBjA6xwDM4IK1gZWon0XfW41Rqm
	 u5MS1+gNoKQaor66VozQF1NM+QzzgBYrfVf64wPAlE46LIdXavKTwO2yd6BRghSbMV
	 eOa/MT3OuABzxJ4Sv0OxMrda82F8Sl2RQFQMe0HO8TtZMCo0azizFdYtlYG0Au1tc6
	 2hIpD3IL6C3lhz5ZqV9hPwUHK8B0tIk470L/qO6oLW703+W09Zwce5vl5sALEf76uE
	 2qKjo4YMTV1HmnLgyTc8EylS+rQG2AEtQrfQeaT1JZvs9QQ+dMjV2ZzFqqEXuC8+S/
	 0O4zOexyhTUqA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 16 Jun 2024 09:14:20 +0200
X-ME-IP: 86.243.222.230
Message-ID: <de75c710-044a-45ff-9477-cf4d57f55ab1@wanadoo.fr>
Date: Sun, 16 Jun 2024 09:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-fiq: add missing MODULE_DESCRIPTION()
 macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20240615-md-arm-sound-soc-fsl-v1-1-8ed731c2f073@quicinc.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240615-md-arm-sound-soc-fsl-v1-1-8ed731c2f073@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: imx@lists.linux.dev, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 16/06/2024 à 08:42, Jeff Johnson a écrit :
> With ARCH=arm, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-fiq.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>   sound/soc/fsl/imx-pcm-fiq.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
> index 0d124002678e..5ea6dd4c89a1 100644
> --- a/sound/soc/fsl/imx-pcm-fiq.c
> +++ b/sound/soc/fsl/imx-pcm-fiq.c
> @@ -319,4 +319,5 @@ void imx_pcm_fiq_exit(struct platform_device *pdev)
>   }
>   EXPORT_SYMBOL_GPL(imx_pcm_fiq_exit);
>   
> +MODULE_DESCRIPTION("Freescle i.MX PCM FIQ handler");

Freescale? (missing 'a')

CJ

>   MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240615-md-arm-sound-soc-fsl-c598fb353e69
> 
> 
> 

