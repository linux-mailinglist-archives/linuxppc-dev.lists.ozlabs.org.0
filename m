Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CD63955CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 09:13:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FtmjP5n31z302m
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 17:13:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Tp9Af5PZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Tp9Af5PZ; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ftmhz3KcTz2xgL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 17:13:06 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id a15so7384579qta.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 00:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yPnIo42plkwFrQDyxV2qx/s2cknNkAGZDVtx3wbOgvs=;
 b=Tp9Af5PZOT1pgH/udgKZCP5uYa6IETW7cLxSNlICLKoZBpazH6eoBaMbErfh4PiY69
 ZoKenJXw/hfXSNe3QTHHJUOulDCKS4mckM2v7xUz0AOKJN1X9z60aWCOU0dQq64zOmPb
 0OpX/Ls4vxYX6evECby6KGRXXXDYsg+Xr9cRcYcNtFWyxrBv2DUM7dToHqzcGahi2O1d
 mBWjAiXxxToWo7fkbaCA9oZRU/qc0/TATOekuO6BMXH+cKvTks/F+m3jJvi06JOFV2A3
 y1r3BKbP6+Ws0j3BfJkL/fwFd2tT8q48cSXfLZOh9/s4RQkhqPwK01T/4grlfIVPRV8C
 0T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yPnIo42plkwFrQDyxV2qx/s2cknNkAGZDVtx3wbOgvs=;
 b=n4mVNOrHww2rz/dp4hnc6fVSjekExxcKOBOLyiE3XkPXmq5tKpNICSsN3M+vXe9Ar7
 R9HKw1krGHpSn0VabRxJrMajdnGcVdh+24Jq4VJU/j9OLxptVmCQnQrXV6eGSqp/am41
 L3Q8KKcKfyfexcAIzmRCKimPVeJ1bA8JkqZGoyEo36PV+XOo+7Knwi72LN0JpfDSFj2M
 gdPHfaoyLHyU/lIf6n2ngwHuNLNeud12i3Pj6A8anepNRkNLWCEn80truyml0K6RnOAt
 Q6S+1ASY9uWTYfwF8qmV68c971PEj49HBuAej75CfOhOhHztfIFOfywcPRQTzMqdmFp4
 lJOg==
X-Gm-Message-State: AOAM532M+ZFC4+SqEHmpYsugzHPjlFmEKgMufbEXj5LEKkSymliij/qU
 e7xcs/fGfIFZECHXy46TFVRKvsNrBrenJeT1tjE=
X-Google-Smtp-Source: ABdhPJwqutod0yLild77qYJkxAUuP6UWl9+wI+5CsvXM3euJPYCcMm5SprLhD6u2aBWc3gjpwazA7aQ94EnX1pITFQc=
X-Received: by 2002:ac8:5197:: with SMTP id c23mr13620903qtn.292.1622445183449; 
 Mon, 31 May 2021 00:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210527163409.22049-1-nicolas.cavallari@green-communications.fr>
In-Reply-To: <20210527163409.22049-1-nicolas.cavallari@green-communications.fr>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 31 May 2021 15:12:52 +0800
Message-ID: <CAA+D8APeigNMB4gTNTTVE4-vj0J9y5DEh+3P7p9iTZq1KdGuPg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Set .owner attribute when
 registering card.
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 28, 2021 at 12:35 AM Nicolas Cavallari
<nicolas.cavallari@green-communications.fr> wrote:
>
> Otherwise, when compiled as module, a WARN_ON is triggered:
>
> WARNING: CPU: 0 PID: 5 at sound/core/init.c:208 snd_card_new+0x310/0x39c [snd]
> [...]
> CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.10.39 #1
> Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> Workqueue: events deferred_probe_work_func
> [<c0111988>] (unwind_backtrace) from [<c010c8ac>] (show_stack+0x10/0x14)
> [<c010c8ac>] (show_stack) from [<c092784c>] (dump_stack+0xdc/0x104)
> [<c092784c>] (dump_stack) from [<c0129710>] (__warn+0xd8/0x114)
> [<c0129710>] (__warn) from [<c0922a48>] (warn_slowpath_fmt+0x5c/0xc4)
> [<c0922a48>] (warn_slowpath_fmt) from [<bf0496f8>] (snd_card_new+0x310/0x39c [snd])
> [<bf0496f8>] (snd_card_new [snd]) from [<bf1d7df8>] (snd_soc_bind_card+0x334/0x9c4 [snd_soc_core])
> [<bf1d7df8>] (snd_soc_bind_card [snd_soc_core]) from [<bf1e9cd8>] (devm_snd_soc_register_card+0x30/0x6c [snd_soc_core])
> [<bf1e9cd8>] (devm_snd_soc_register_card [snd_soc_core]) from [<bf22d964>] (fsl_asoc_card_probe+0x550/0xcc8 [snd_soc_fsl_asoc_card])
> [<bf22d964>] (fsl_asoc_card_probe [snd_soc_fsl_asoc_card]) from [<c060c930>] (platform_drv_probe+0x48/0x98)
> [...]
>
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

> ---
>  sound/soc/fsl/fsl-asoc-card.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index c62bfd1c3ac7..4f55b316cf0f 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -744,6 +744,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>         /* Initialize sound card */
>         priv->pdev = pdev;
>         priv->card.dev = &pdev->dev;
> +       priv->card.owner = THIS_MODULE;
>         ret = snd_soc_of_parse_card_name(&priv->card, "model");
>         if (ret) {
>                 snprintf(priv->name, sizeof(priv->name), "%s-audio",
> --
> 2.32.0.rc0
>
