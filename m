Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83B61153F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 16:57:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzQd40D0wz3cMP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 01:57:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=arTa8Hp9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=daniel.baluta@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=arTa8Hp9;
	dkim-atps=neutral
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzQc70JDvz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 01:56:37 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id t25so13524448ejb.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 07:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LQqF7mgoMpdPDEfiMU46JdqFEc964tvWxw1HB/RMwiE=;
        b=arTa8Hp9eU8CHAAKuZxCuCp9TFtlwbZW3v87Df9EtS2SMm22Eduv2F12bZhmi3qg20
         8HJmCjY+CdC+8I75dYuUqmXe2VE3oJRS1Ab7QBBuK7Ac/Ucs7NcYDqHBIzhvEcOuwBJc
         ZWvP3FVXgJzFksiq7wweonN1/pPCb7+/yCC5SAHOH+OzqHpY6JAMJMI6kG/uWEGSUQvS
         C7eqz3grRob4bZfW+oH6rwPz54fq0r8j8OQoAuLFzgYj7ghCn5PKe2DQUj7NA6U5P9N3
         bur7cp6c9yjVC9Erdf8lbNNpRTVZ1+xuAt9YjDuioE9AU6LsasEf/2ttDERdZTUyoiBv
         T8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQqF7mgoMpdPDEfiMU46JdqFEc964tvWxw1HB/RMwiE=;
        b=F99wJl0Nvr3r0ZercQXrYQfHYl8wFLUVrc5SuALpUm/w+Ol8wlfY2NxgoDTKR1siJ2
         5zmt7t2j9Lwc+IQNHCBbQDaX/GsLBlPw7bjhNXJWNkk35ly1JC1W3PfOgEbIIcahcdbO
         swQDPJ7aoSXLpZYysAsCt57vjn/bHt+cS6tggBiSQnnEFwJOwyPrsOXHjE9jiQw7Grru
         U3fz/F7onsqr1xBYWXaOlq5DxhQ5W4UdER4Xs1fYDSxwbRuw5Gn3rx6P622i2C4Rwf9V
         X4qcdVdAm+JfpZfGWqL8CYqQp3Uh+9H1tSyoBO3umMb5KZRnIq5v6J0bxyFXTp4f7jIw
         b0yQ==
X-Gm-Message-State: ACrzQf3QtofAODUDWbRznq/PgVMchon3bUKJBrYpFxG3DO/oocyLdTcM
	cpE3e0tHu9flXHA2kuHq5nzZUcS5S3xAwQsR7ys=
X-Google-Smtp-Source: AMsMyM5YEMqyGVRZ22xaHEfcgjC/wjYt3YHikBMrSXZTvnr//2VkFszSR6BbgM3ElAHwJxzJNTa8V2q3veDVgCO00eQ=
X-Received: by 2002:a17:906:9750:b0:798:9ccc:845d with SMTP id
 o16-20020a170906975000b007989ccc845dmr38539663ejy.760.1666968993915; Fri, 28
 Oct 2022 07:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221028141129.100702-1-maarten.zanders@mind.be>
In-Reply-To: <20221028141129.100702-1-maarten.zanders@mind.be>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 28 Oct 2022 17:56:22 +0300
Message-ID: <CAEnQRZDyEdJtcMd0et5=3+Q8+oX5b8zOf6o_2yfRNVxmDuxDXg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
To: Maarten Zanders <maarten.zanders@mind.be>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 28, 2022 at 5:37 PM Maarten Zanders <maarten.zanders@mind.be> wrote:
>
> When CONFIG_PM=N, pm_runtime_put_sync() returns -ENOSYS
> which breaks the probe function of these drivers.
>
> Other users of pm_runtime_put_sync() typically don't check
> the return value. In order to keep the program flow as
> intended, check for -ENOSYS.
>
> This commit is similar to commit 0434d3f (omap-mailbox.c).
>
> This commit fixes:
> cab04ab (ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk)
> 203773e (ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk)
> 2277e7e (ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk)
>
> Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
