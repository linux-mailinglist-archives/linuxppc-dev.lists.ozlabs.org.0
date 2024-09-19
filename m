Return-Path: <linuxppc-dev+bounces-1432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 123FC97C2AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 03:44:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8JH25JCdz2xX3;
	Thu, 19 Sep 2024 11:44:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726710286;
	cv=none; b=FFnMoz5Zcmoi4L1grYn2UI8YP+N4iNiLQRQEXYkbETwLqAwczYjHh/dHYXH+XdAYyt98P1N1ry7HkoDe33A59F3C3hK41RASHDdTQkAudbhqC4OUvU5bPLwNLjwSdOUKqIjXp7u5e7++PXlmfzK8cFHyZnBsKapjeyYdTY2CY7yqIjGIGM17dAgWfPJ3tAOX1hdVmFJRkjhSaXCTVVRxMe18n8fEYrDmim+JxgdD6gf4Ufnx6UmUExi9ZMI8sScKBfACXcLnJdNCUcibdLOfqISmkMxI357cpvdmWn9vrF7D6LfI5FEpJ+qpaXaPdcYKTi8febl9kDn2MJfDUZpZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726710286; c=relaxed/relaxed;
	bh=DX8B0AVGc1Jcf/sZuX/Lm5rKGNOWSa7SVLWhBKf+5LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRB6/HVQRWSKhF+RSjd6Ix4wD2JM3K3xrMfT5slDT2lSCltmGr2jSnKVtH08oJmFUyEzn0WTh3miggX24bqgGMK3Wn6difihAiMPqTjf7wDYQ7ApdFuVPaoLZ8AQ6dMnIZUqF9Omw2sUTjpujKHKnz3yq6V5JBGJmSk6c44/hryjUu3kXvnl0k9CZRzXEl54/XUZ0A9GUNQhIHtyMaFDG3BPcS1moy1vPyMrwaA8b8lJ1BWfq7pfw3WUUtLVn536zE3P54W1KnIna8VvLcIpg7y9Jk1oHfalvNuKK1KsUV5rkcgb1L+GoBvRY85QFo+DEzo3UgwscXB+aLDGKgj0Dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GSmRv034; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GSmRv034;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8JH205xlz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 11:44:45 +1000 (AEST)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a09af86744so1334315ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 18:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726710282; x=1727315082; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DX8B0AVGc1Jcf/sZuX/Lm5rKGNOWSa7SVLWhBKf+5LU=;
        b=GSmRv034XRBtSfe3JsDjZMZUqc6j7tCL99gD3oh81ilngf0ZhgxSClmLJGRyLjDD6T
         fTD83JkiaIV6wb6+DANYyxeUpvgImReDIrS6a5GMcOJJTvKEBuCShRnDFNLJ6QWFw9vl
         Go3D187RJkMmcwDHTvRQZEwMav+Z3gQzfkvjhJKBRvs7l0Hhu72vcctjj/EVSpgWcpD2
         acmNGcocuIsJTsPLIT1hXKppHqVDLS7DU4kRCMaNvGbiwenCSQDg34XIdeZXDSD/vC7c
         prTP9opXgRceRFxtJ9HPCD4UgYap9cfclRS0Va7dIZUPrB8Hfr+7ZnjnwjWkbdyt9Tcy
         Y66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726710282; x=1727315082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DX8B0AVGc1Jcf/sZuX/Lm5rKGNOWSa7SVLWhBKf+5LU=;
        b=dFB1UO0G8Hf3krnnOmyhMHykRFHwVKgmGIkMQYikp6sjmWRXJ/aiLgIYAuvX/azDhl
         lJVrv2F98u4cM+I4SwE1tQ1AIRJ5Xzdvt7xVp3wEjVFNu2L0jfhmTQH7pB5FcP8a3r0f
         q2QKtCW8kxeUy/iuwBWHBlAiBqCy1EHmu9rlSY3iuh0U2ADLEq5ocggvkwBafjapFJQx
         v8B/7AFqiwni4e+HyVejcD82ohW26mNGo+hvAwGSH1R4V27ytZKtyyKvjo7nvprfkDyU
         Ct9v/tMJiAnvbVWx2+hOMoKgI+9RKTURGo3Y8lvY0F1nEZ2KXT8jfUXkMHum6jntxMz6
         vl6w==
X-Forwarded-Encrypted: i=1; AJvYcCV6gNllzFWiLGBVHu7ck3iAjH6PrOUuiNDR+/GaHmJSQshpo4B9qP4hZsX8eeEmcIyZOnfcoOIml2nG8RE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yztb//NYBoKXx01iui5mTSOQzhDryM5MG7Lc9ya0daCvzA0AF4Q
	liEdGgjTzpwHa9Txc8Ai8NwLtzNeLMIPNBq/Q9KmYOr0LZgUoe/JOeCr0w7/vWjATVzKA+6uTuG
	pthkb+Mrn31HPrA7bIOwenPJStx4=
X-Google-Smtp-Source: AGHT+IFvWrciDr6mTn/0jLlxcfQLFJaLJCVtLl6E6HMysiz+7fvxdv5D3t/y67xbPvsZHZCxSp+6BBa6yDCK4/1bo5U=
X-Received: by 2002:a05:6e02:13a2:b0:39f:6180:afca with SMTP id
 e9e14a558f8ab-3a08491196bmr275534325ab.13.1726710282105; Wed, 18 Sep 2024
 18:44:42 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <1725615837-24872-1-git-send-email-shengjiu.wang@nxp.com> <CAA+D8AOkQOanya6RViXfk_=CmNmCWx-N3cb-0SjMhSy0AA7LeA@mail.gmail.com>
In-Reply-To: <CAA+D8AOkQOanya6RViXfk_=CmNmCWx-N3cb-0SjMhSy0AA7LeA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 19 Sep 2024 09:44:31 +0800
Message-ID: <CAA+D8ANFn6yD=gV+uMYXyQ_7TmOoBnmJtMZ70qPOS_dHn8OkPA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] ASoC: fsl: add memory to memory function for ASRC
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jaroslav

On Fri, Sep 13, 2024 at 10:29=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
>
> On Fri, Sep 6, 2024 at 6:05=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
> >
> > This function is base on the accelerator implementation
> > for compress API:
> > https://patchwork.kernel.org/project/alsa-devel/patch/20240731083843.59=
911-1-perex@perex.cz/
>
> Hi Jaroslav
>
>     Shall I add this patch to my patch set next time? Last time I
> reported an issue
> about "list_for_each_entry_safe_reverse", I can help to add it.  or
> will you send
> another version by yourself?

A gentle reminder, look forward to your reply.
Thanks.

Best regards
Shengjiu Wang

>
> Best regards
> Shengjiu Wang
>
> >
> > Audio signal processing also has the requirement for memory to
> > memory similar as Video.
> >
> > This asrc memory to memory (memory ->asrc->memory) case is a non
> > real time use case.
> >
> > User fills the input buffer to the asrc module, after conversion, then =
asrc
> > sends back the output buffer to user. So it is not a traditional ALSA p=
layback
> > and capture case.
> >
> > Because we had implemented the "memory -> asrc ->i2s device-> codec"
> > use case in ALSA.  Now the "memory->asrc->memory" needs
> > to reuse the code in asrc driver, so the patch 1 and patch 2 is for ref=
ining
> > the code to make it can be shared by the "memory->asrc->memory"
> > driver.
> >
> > Other change is to add memory to memory support for two kinds of i.MX A=
SRC
> > modules.
> >
> > changes in v3:
> > - use Jaroslav's suggestion for header file compress_params.h (PATCH 01=
)
> > - remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
> > - remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
> >   Will wait Jaroslav's update or other better method in the future.
> > - Address some comments from Pierre.
> >
> > changes in v2:
> > - Remove the changes in compress API
> > - drop the SNDRV_COMPRESS_SRC_RATIO_MOD
> > - drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
> > - define private metadata key value
> >   ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD
> >
> > Shengjiu Wang (6):
> >   ALSA: compress: Add output rate and output format support
> >   ASoC: fsl_asrc: define functions for memory to memory usage
> >   ASoC: fsl_easrc: define functions for memory to memory usage
> >   ASoC: fsl_asrc_m2m: Add memory to memory function
> >   ASoC: fsl_asrc: register m2m platform device
> >   ASoC: fsl_easrc: register m2m platform device
> >
> >  include/uapi/sound/compress_params.h |  23 +-
> >  sound/soc/fsl/Kconfig                |   1 +
> >  sound/soc/fsl/Makefile               |   2 +-
> >  sound/soc/fsl/fsl_asrc.c             | 179 ++++++-
> >  sound/soc/fsl/fsl_asrc.h             |   2 +
> >  sound/soc/fsl/fsl_asrc_common.h      |  70 +++
> >  sound/soc/fsl/fsl_asrc_m2m.c         | 727 +++++++++++++++++++++++++++
> >  sound/soc/fsl/fsl_easrc.c            | 261 +++++++++-
> >  sound/soc/fsl/fsl_easrc.h            |   4 +
> >  9 files changed, 1260 insertions(+), 9 deletions(-)
> >  create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c
> >
> > --
> > 2.34.1
> >

