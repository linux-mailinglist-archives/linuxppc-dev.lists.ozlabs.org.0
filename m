Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A97BCD95
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 11:39:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dkkXRF2i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3HDK6FWvz3dhR
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 20:38:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dkkXRF2i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3HCT1MKZz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Oct 2023 20:38:11 +1100 (AEDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-351437112c1so15171835ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Oct 2023 02:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696757886; x=1697362686; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fYiXpHzdursWStkJtczyobJvyoVD92PbbCoVYotrfY=;
        b=dkkXRF2iKwwTihZDK6aV2liM5G6WokOMnR5xO/j5RD5YlLxTY5WhR2SVkuREUCuk//
         wafiCu9Dh8u3oDZ3AU/A1/mEJhxeNSFqwDpyalHsxfYdvxYL8xC7+7DWRWL9O9AoXAgc
         PtSJrKNFwGuL9ETcsb97L4NSeGw0R/kecrYCZzjrZr78reybQyGlh+Dl0TNebz1p9EtB
         dF9Z+MB4N2MJi/rsY1u8pEOOXTzoIQr4Yvy+Pi3LfANFU1ntZE9qYdlr10xwlyt7WW0V
         /l0Ojhn9FED4TsMbsfgMjOCA1cwDaRouufkVFnwMwAxYYieYTCeVnqfEndb8+Twi4JFR
         36IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696757886; x=1697362686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fYiXpHzdursWStkJtczyobJvyoVD92PbbCoVYotrfY=;
        b=LmvRZnCcFIhZkFYGDLV5aJy2xb2Aa21xw4csndQpa0UyU4cno6HeURfaP89c2H+uaE
         NtMuYyMG83PSf0uhfD1JKsCOVIPDCiqF8ttcbl/KwCH//nsfK5tXUl2fc2eMXPH2kAQX
         uI80rWpZ78g1T7/OVr7M281PE9iEYlFju3wcBfHtsWVIlMzeRa/MfbwbT6yS+mnqjmcD
         zfEhTAKgRE9JpdEczA1tlIi3xJRnGWtppaaA8GWeqMW0mtyv2vlsZjPRS3c1tIzgpCBm
         PBXKemnxh0kW6zAg9g9xfxsgGu5GzmQoab191QYaaoQzt+dgGinQJVHRW1+S/vKCZMGJ
         XbzQ==
X-Gm-Message-State: AOJu0YwQjpdTqiS43sPHFZ/sADNDCM2Cs3YENWZsdRHwHQRRxXOMmkCC
	lxwUyTFz+qaunt/ntMDpRcXM4XW/yBB+RLzD8ew=
X-Google-Smtp-Source: AGHT+IFOPXqa1g6fZGD/2vL4Ek92lAQIZ3j/sZIBurFiKkx5uCP6NxLrJQ6ZaN6RV8gr8K1oXMJbJlZME8c7U+Lw4uA=
X-Received: by 2002:a05:6e02:184f:b0:349:3020:d103 with SMTP id
 b15-20020a056e02184f00b003493020d103mr15718726ilv.25.1696757886364; Sun, 08
 Oct 2023 02:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_681B0528D436898B1B945A8B2D46300C0F07@qq.com>
In-Reply-To: <tencent_681B0528D436898B1B945A8B2D46300C0F07@qq.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 8 Oct 2023 17:37:54 +0800
Message-ID: <CAA+D8ANxyQbZDp0DuaxzvucHWvuU9N-ckWQYAEa89LAD7-whUA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Fix PM disable depth imbalance in fsl_easrc_probe
To: Zhang Shurong <zhang_shurong@foxmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 4, 2023 at 3:12=E2=80=AFPM Zhang Shurong <zhang_shurong@foxmail=
.com> wrote:
>
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.
>

Please add a Fixes tag.
Thanks.

Best regards
Wang Shengjiu

> Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
> ---
>  sound/soc/fsl/fsl_easrc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index ba62995c909a..ec53bda46a46 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1966,17 +1966,21 @@ static int fsl_easrc_probe(struct platform_device=
 *pdev)
>                                               &fsl_easrc_dai, 1);
>         if (ret) {
>                 dev_err(dev, "failed to register ASoC DAI\n");
> -               return ret;
> +               goto err_pm_disable;
>         }
>
>         ret =3D devm_snd_soc_register_component(dev, &fsl_asrc_component,
>                                               NULL, 0);
>         if (ret) {
>                 dev_err(&pdev->dev, "failed to register ASoC platform\n")=
;
> -               return ret;
> +               goto err_pm_disable;
>         }
>
>         return 0;
> +
> +err_pm_disable:
> +       pm_runtime_disable(&pdev->dev);
> +       return ret;
>  }
>
>  static void fsl_easrc_remove(struct platform_device *pdev)
> --
> 2.30.2
>
