Return-Path: <linuxppc-dev+bounces-1306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 313F39776E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 04:29:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4dYW6RQgz2xpl;
	Fri, 13 Sep 2024 12:29:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726194575;
	cv=none; b=HnkwbbFilbWZ8cKKcpIoHXQcz5Nf42B1nfCmyp0gktdz2X3XIka8fiAG5+WRWicJnp1C4beg8/Sl7kvTZv6L5Mo7SEXZuLq+VFqwNDwvwwJ0tkDnR+2uQsc+pFOYk+RxcGgMgx4y0hiMMyQQRsi3ZzpCRZ2WsPDIMu/PhaG5HkERjA4IYnNRCNJrnVL/Qv6yeMpBRz/Cemls/hs1Z546H6N0DCeXoel6i+OPc4wpnuG0RxBLMtC39kfr2S/op42tWSmEwrkj2pB/Dr6gmnQKuEESkKAXncRNEt3Rqf8TgZWshpC7hWDUMZwbnEWnkbwgwE/Jg5qu8JhgmeRiUf+KIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726194575; c=relaxed/relaxed;
	bh=PTMhgEbsFwO+pBfHozMIUKTCxeSJ9rkkx6pXiVEJYI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rbo0lGHp4uexrWKXys7dhigdXz/QSzRSuG3GUfqU+kJvq5kE3ROA9E9MqAmIDWev23Zub6DIF3oaVYk9aH6QXv4ydCiX/KgHHK7QkmMGXGklyfL6zUajwY7M+hpsXiQJvpuv5URmeOzdnnbV2coPO0kSTiFivNzM42XbL61U06KABBEtbhFD65iJyZebNPKCqyPZE6rX6FpcoDHmfrQi3rZ4Y4mwOU0MXzBYzR7NUJsFTuph7ol3hr3IqAmTFOKsDZ/b45711G8xqRIeeU69wBWOLXNCG1MluZ59m1t61bYBddAxSLN/ZZUE+UADPFZ+AMKs5277S/E9icIqMqwKkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WMXEM9LZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WMXEM9LZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4dYV6wD9z2xKQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 12:29:34 +1000 (AEST)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-39d2e4d73bcso6779695ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 19:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726194569; x=1726799369; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTMhgEbsFwO+pBfHozMIUKTCxeSJ9rkkx6pXiVEJYI4=;
        b=WMXEM9LZKjQkfsJrKs20rygfR1J7XOtowbR+DrUKl69y0RohJzTFHD+Exw2Wwqk7H4
         uLs8Y5PFEUTsuukQSfykGjjEPj+CLaX/Q16M9F8BFf8mqADe8op847POCFk5mcualmhT
         G1PfsRoswKqsB2XY797I1J/iN8j1fcTaC5HyBEbZUS7bVuCOM7RNww5iYuK6xru6kUd4
         rehKo5ST2LhQBbZNCfkJ9trbHTncouPySWZ1vRGpkEeEDx4S0cNXKQ5YIz0JWoH6VLQ8
         UfYxWTKAAyelxkMP3yiulf08jsPdqWNk8SSokaVCrT6mc4MYfmuw8OS+6s2N5wk9Cu2i
         H9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726194569; x=1726799369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTMhgEbsFwO+pBfHozMIUKTCxeSJ9rkkx6pXiVEJYI4=;
        b=W2V6zBxbuKzRyUY9uK/mEjTmPT/FYvhp4e7UsbeB8qnqisSpjeWRfzyp20k91lmkF5
         5pPV6Hql0NcGxNXhsi8o4LzoB+9IPtricYByEi3yT15+d195uIZES+98DadEcy0awPuU
         Q2zL8kOkwK4KI5zo6x61/K9wCtP8uG8uoPkjyOkAaZ1cl16htjhkQ/THwPIplf47DDuB
         If84Yd66O7XcqoAA2xHZenBJQ8Yv9R8fRntKLIfzq76xqqFBtye49I2zOtltCgThxmpG
         U0c0gf5sd3alm+2XqVS+LlMK9pJmu0lAcLT707zkcZomldf+ytocDjZcjCK9rydau7PY
         dqWw==
X-Forwarded-Encrypted: i=1; AJvYcCXzd80DyoZQQofFg78gpLN6HNEHCOHPcfnPSGo1FjRVEprWP2ifhYH6lMU+qPujMOblU/3NWtH8uveqrB4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuaGn2w4clj8fWiamhS7obal2F4n9sEO1hdcJteiYZp/GiSVV7
	dnWU9jhQ6TDW/ppoGbM3lDMy+t6UbXyBrg//FSNvEHi4VQtiOhxcpHYEaREvJgrnd+Yn+YMppjc
	guB0f+HueLALyuSiV8m7MFfKlJo0=
X-Google-Smtp-Source: AGHT+IENKLUdj9+ZkJdPontbPGNcWKf/93O8fVsmGBQhknsCe7sTxPjA/0aEHZIrgYGLHSh2qlW9DaOFsfh/RDk3zVc=
X-Received: by 2002:a05:6e02:12c5:b0:39f:5efe:ae73 with SMTP id
 e9e14a558f8ab-3a0848eb2admr53336035ab.5.1726194569381; Thu, 12 Sep 2024
 19:29:29 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <1725615837-24872-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1725615837-24872-1-git-send-email-shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 13 Sep 2024 10:29:13 +0800
Message-ID: <CAA+D8AOkQOanya6RViXfk_=CmNmCWx-N3cb-0SjMhSy0AA7LeA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] ASoC: fsl: add memory to memory function for ASRC
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 6:05=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> This function is base on the accelerator implementation
> for compress API:
> https://patchwork.kernel.org/project/alsa-devel/patch/20240731083843.5991=
1-1-perex@perex.cz/

Hi Jaroslav

    Shall I add this patch to my patch set next time? Last time I
reported an issue
about "list_for_each_entry_safe_reverse", I can help to add it.  or
will you send
another version by yourself?

Best regards
Shengjiu Wang

>
> Audio signal processing also has the requirement for memory to
> memory similar as Video.
>
> This asrc memory to memory (memory ->asrc->memory) case is a non
> real time use case.
>
> User fills the input buffer to the asrc module, after conversion, then as=
rc
> sends back the output buffer to user. So it is not a traditional ALSA pla=
yback
> and capture case.
>
> Because we had implemented the "memory -> asrc ->i2s device-> codec"
> use case in ALSA.  Now the "memory->asrc->memory" needs
> to reuse the code in asrc driver, so the patch 1 and patch 2 is for refin=
ing
> the code to make it can be shared by the "memory->asrc->memory"
> driver.
>
> Other change is to add memory to memory support for two kinds of i.MX ASR=
C
> modules.
>
> changes in v3:
> - use Jaroslav's suggestion for header file compress_params.h (PATCH 01)
> - remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
> - remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
>   Will wait Jaroslav's update or other better method in the future.
> - Address some comments from Pierre.
>
> changes in v2:
> - Remove the changes in compress API
> - drop the SNDRV_COMPRESS_SRC_RATIO_MOD
> - drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
> - define private metadata key value
>   ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD
>
> Shengjiu Wang (6):
>   ALSA: compress: Add output rate and output format support
>   ASoC: fsl_asrc: define functions for memory to memory usage
>   ASoC: fsl_easrc: define functions for memory to memory usage
>   ASoC: fsl_asrc_m2m: Add memory to memory function
>   ASoC: fsl_asrc: register m2m platform device
>   ASoC: fsl_easrc: register m2m platform device
>
>  include/uapi/sound/compress_params.h |  23 +-
>  sound/soc/fsl/Kconfig                |   1 +
>  sound/soc/fsl/Makefile               |   2 +-
>  sound/soc/fsl/fsl_asrc.c             | 179 ++++++-
>  sound/soc/fsl/fsl_asrc.h             |   2 +
>  sound/soc/fsl/fsl_asrc_common.h      |  70 +++
>  sound/soc/fsl/fsl_asrc_m2m.c         | 727 +++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_easrc.c            | 261 +++++++++-
>  sound/soc/fsl/fsl_easrc.h            |   4 +
>  9 files changed, 1260 insertions(+), 9 deletions(-)
>  create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c
>
> --
> 2.34.1
>

