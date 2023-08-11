Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E38E8778D0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 13:06:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=e84JtWSP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMgwS60ttz3c3X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 21:06:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=e84JtWSP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMgvX5hwXz2ydR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 21:06:00 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6bd3317144fso233500a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 04:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691751955; x=1692356755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjQ64ZZGN8T91hWpEGceC0siZ3jwdNTZpdGZAQGJRUY=;
        b=e84JtWSPLLE8xUm4/YbusYDp8Qw2ketFjAVF3ddE+8kfIdnZ5s8aThtpsF6Q7BvgNM
         U+wNgXBuNao0FbknM/n6HfcA14pvgn3TY1CxpY1Qj0fN1ZYftiy12G6ihc+DvPFAPFvd
         cucy2tx+xucCIgmikT9YOZvJcl5Wt+8NMfQpgUVJPFxd3/rAtAPzDQ6hgCxjRdOTSL9X
         asGQFpsB0XiP/E//fDfpno6jFiuZGwGBNi92GsP1BVY4njp5RlUVPzfaDtMC3uJv0GFn
         RNnXKhS3I3sCiy20tXOHzJFbTb6NLPO5SKfunIrmfz3OpIC+7e3AFcFGtP8S40j5S1iV
         mV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691751955; x=1692356755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjQ64ZZGN8T91hWpEGceC0siZ3jwdNTZpdGZAQGJRUY=;
        b=Qb0Hm+hQ7VpT6lcKiGqwasBS50hgrtiVPnHcE0CIrFxwjS+GQ+aDERV5hWZ5MQ5EIx
         BRr4D2MSsprdql0115HMVRTYoFtuGrMkK3b09xrFIS3ZmpJq3mIOGX2h1YLl7IacKboh
         tHpObR2eX4OMkCDwMlbUf0u2D9EmV6ffTIHO4uvWtqa9iUpBq84WYtTz00R6HhdjnAuX
         MMYE0AW/8nxjTxkznLZlL6ThSiZlwTBv0nEtNgM8FYQOdnfhrbo4rKdeOWJszp9sin5e
         JmjecNYHCoP0zkc9xjGxFDtLvWk5vpLTJYyPdT+4PIGCEh4rRZcz6RDg5M+URV+V7yD7
         c8ww==
X-Gm-Message-State: AOJu0Yye3OfgGLBCxn2VsroqjRuhL9MzCySyQXFMzaYlOSD+0qBGw+zL
	opjsVqnh+dLqTLnnaWpDstg+2DzALVzdDaHVFkM=
X-Google-Smtp-Source: AGHT+IFpk41pz9ENDJNApolHi9hRFlr6B19DWPyJgpvXFEB+phtk7CHmvJj6RBn+wXmTBbnSP9W9WmfQXqmH5n8Tpdw=
X-Received: by 2002:a05:6870:c58e:b0:1b7:670e:ad7a with SMTP id
 ba14-20020a056870c58e00b001b7670ead7amr1728203oab.43.1691751955035; Fri, 11
 Aug 2023 04:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl> <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de> <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk> <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
In-Reply-To: <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 11 Aug 2023 19:05:43 +0800
Message-ID: <CAA+D8AMriHO60SD2OqQSDMmi7wm=0MkoW6faR5nyve-j2Q5AEQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
To: Mark Brown <broonie@kernel.org>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark, Takashi

On Thu, Aug 3, 2023 at 9:11=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Thu, Aug 3, 2023 at 1:28=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
> >
> > On Wed, Aug 02, 2023 at 10:41:43PM +0800, Shengjiu Wang wrote:
> >
> > > Currently the ASRC in ALSA is to connect to another I2S device as
> > > a sound card.  But we'd like to the ASRC can be used by user space di=
rectly
> > > that user space application can get the output after conversion from =
ASRC.
> >
> > That sort of use case would be handled via DPCM at the minute, though
> > persuading it to connect two front ends together might be fun (which is
> > the sort of reason why we want to push digital information down into
> > DAPM and make everything a component).
>
> Thanks.
>
> ASRC M2M case needs to run as fast as possible, no sync clock control.
> If use sound card to handle ASRC M2M case,  the user application
> should be aplay/arecord, then we need to consider xrun issue, buffer
> may timeout, sync between aplay and arecord,  these should't be
> considered by pure memory to memory operation.
>
> DPCM may achitect all the audio things in components and sound
> card,  it is good. but for the M2M case, it is complcated. not sure
> it is doable.
>

Beside the concern in previous mail,

DPCM needs to separate ASRC to be two substreams (playback and capture).

But the ASRC needs the sample rate & format of input and output first
then start conversion.

If the playback controls the rate & format of input,  capture substream
controls the rate & format of output,  as a result
one substream needs to get information(dma buffer address, size...
rate, format) from another substream, then start both substreams in the
last substream. How to synchronize these two substreams is a problem.
One stream can be released but another stream doesn't know .

So I don't think it is a good idea to use DPCM for pure M2M case.

So can I persuade you to consider the V4L2 solution?

Best regards
Wang Shengjiu
