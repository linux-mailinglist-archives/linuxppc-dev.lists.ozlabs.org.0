Return-Path: <linuxppc-dev+bounces-6111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 514ABA31D12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 04:49:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt4711srYz2ypV;
	Wed, 12 Feb 2025 14:49:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739332141;
	cv=none; b=ZxFD8CboUlgw6YqdrdAqzef6MlA+wCiiQ/vWVe9Xe/kKzsKp83mjHlagopBW/TXelFa1iyMJyBoB0MBc8LCiUWkDl0kJLL4xTcCwEctL9j/p9qitgfoq8plRu18kkMiRr4kRz634RAwsZmB9D+ukGDRKWRzOWT/iFnWwDQH5FYZH5DRh5EmNY1TqUQbKA5S6XxNQwEAtHaSajoHVeA874ZrqPapJT5qNbBfilfOfeY1s4494aPgVm37NKhVfVVXlHUu8KyfQq88LThjsjECkm3gybbgRWlEw/j6vfJHlQig4h5IaaZD/JTkF4GgrnNy8me5XyIyAwXXVtwf8OT8yuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739332141; c=relaxed/relaxed;
	bh=vcryBZKe0HwOZ15GXClthjY5efiSUbIeZQ+SYJvbj2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMfzPruuSWRrANK3M5/bxbfEO09dKOnHat9JH6G8acsHHVHJbP3XCRy0ea4AXYiX6SusQkCxt/t4zx2kaPJ6fx1IUESxMWQbvKaWzUFwU0rLJZSdPc3BdzVDkHD8xq2D8OZJoVMeFYlu1+3ImrtzJrxNbT8i+Rn4+kIu8oruqAK05NbE5C/ByCxPUgs3smD58PAT+PHAtZccdhqdvIukiJH6+90iNKLe8NFfJLK54G2pLF+Dup5ORBLK7MjQ2uCGb/u1UGsLQImO1llO4sm36B6b7OUnx0cJr3sFpwgFtoTBEyd89Txm3kZfymheW1FhSx8vgt4GLLFQAtaLik/ARw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jK+ru2rs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jK+ru2rs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yt46z5gqpz2ypP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 14:48:58 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d04932a36cso55493865ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 19:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739332136; x=1739936936; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcryBZKe0HwOZ15GXClthjY5efiSUbIeZQ+SYJvbj2k=;
        b=jK+ru2rsRRw6UX039/AwDX6B8a4RYfF56maYDpR4a1GiN/0QPBKkhIZSLksoBDFzAe
         aDwuJT/kLXppPozzlgJn8HVTXfIJicug/z9XqNhALKZ30B+W3prFfHqOLXqXmzijU2ir
         NvXDu6OBpoANrVxYAKpU+XiYV4Hiltl0DKefn4q4SN2ZekBbxMle4kULavMe8nimY5gZ
         Yqf1uz0znZ4+iY8DWqsgZY+LFWQto8QAcUYcbL9VUy1PZw0rGZXPMng7E25jqeu6bE2E
         jwaFkkJ5zn9Pu3yBU47WWYFXixZ1V6zggdDpMbUM3aCikev/oDds24tZGL/sTHmCOEYg
         2UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739332136; x=1739936936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcryBZKe0HwOZ15GXClthjY5efiSUbIeZQ+SYJvbj2k=;
        b=cA/hZwbkWplSNkyLAWt7LmmGULnz5e2ihrTTRgXIc0L/IgvmuSlg4/CVly9X87XS6u
         S7SKCnwqsxGkkJrJF7hBpd+BgPgX6FOY77TjNHESknLK7zI7kbMjHEIdNZo7oReTGTkB
         zNA71RAM0Mvu7Z9nwHSu5MQPxfGIekPzaQc+L/y57hJIXw+dD0Ur8H2SuHygcsRAo40A
         u2bDuHkQXbBnw3RvCgCwANr0SHsvzi28U/WQog2dqhbbcgnvhA4BHuSEMJo0sjY0XVzF
         gCssFeBZkVZERXmWc+/5wfIGKrS36SCPe6vzYczC3aUF8FYvEDk1had2hGbk3yu2/tEC
         w4zw==
X-Forwarded-Encrypted: i=1; AJvYcCVmir7oUSb/V/hAMfhalPzjB3JrSr2aGIoPI/KbJF1Po2sl0yKez+NT/mPiti4LEzPnvskd3rqvUnV48MM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzfLm/PBY2onWzE0NqW3kaNv+xFjINPQBqLuDFFQwHdP9oIOczB
	Q8nuTjzb4Vo/3i4VE9fYAOPtF1yJJuBhG5OcgDClXHXTfBfZApIcbB4fDdxfy5MyzINFdkanbP+
	nZN1wsIuqryaV1OgPEPfmEOAM0VA=
X-Gm-Gg: ASbGnctIGLmN6ZvkdJrL2xzso6HsX9rL3wInaydigxt5TZ/dUTsswIQN181YqLkfGPM
	Z1qExFgFqROlHWa09TXVi0E+fECLGj6gTf5smvyXKacxA8uS+YI+ukc4YtDeQqEis0dvQB3zV
X-Google-Smtp-Source: AGHT+IFCnz4li/5IWRttFgFQdRpTdkwg/3j1LKC5VF8mycMo5avGb6iiANRdvRcmxPBkiquPSP6pJyx2R6uQlujKUaw=
X-Received: by 2002:a92:c54e:0:b0:3cf:cd87:1bf9 with SMTP id
 e9e14a558f8ab-3d17c21cd04mr17637315ab.22.1739332135646; Tue, 11 Feb 2025
 19:48:55 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
 <20250211035737.3886974-3-shengjiu.wang@nxp.com> <Z6tuFp9nZFMJMgDa@lizhi-Precision-Tower-5810>
In-Reply-To: <Z6tuFp9nZFMJMgDa@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 12 Feb 2025 11:48:43 +0800
X-Gm-Features: AWEUYZnXrLA9vESn8DWyjyXL304FuAyCkB66xQG7feWsbb8dSRpLkjhc6mEjDb8
Message-ID: <CAA+D8AMyXVdAWOTGHtrOyXjSLiMioAhZ1awepX3nproom87azQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: imx-card: Add playback_only or capture_only support
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 11, 2025 at 11:34=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 11, 2025 at 11:57:37AM +0800, Shengjiu Wang wrote:
> > With the DPCM case, the backend only support capture or
> > playback, then the linked frontend can only support
> > capture or playback, but frontend can't automatically
> > enable only capture or playback, it needs the input
> > from dt-binding.
>
> wrap at 75 chars

On my side, there are in 75 chars...

>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/imx-card.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
> > index ac043ad367ac..905294682996 100644
> > --- a/sound/soc/fsl/imx-card.c
> > +++ b/sound/soc/fsl/imx-card.c
> > @@ -518,6 +518,7 @@ static int imx_card_parse_of(struct imx_card_data *=
data)
> >       struct snd_soc_dai_link *link;
> >       struct dai_link_data *link_data;
> >       struct of_phandle_args args;
> > +     bool playback_only, capture_only;
> >       int ret, num_links;
> >       u32 asrc_fmt =3D 0;
> >       u32 width;
> > @@ -679,6 +680,10 @@ static int imx_card_parse_of(struct imx_card_data =
*data)
> >                       link->ops =3D &imx_aif_ops;
> >               }
> >
> > +             graph_util_parse_link_direction(np, &playback_only, &capt=
ure_only);
> > +             link->playback_only =3D playback_only;
> > +             link->capture_only =3D capture_only;
> > +
>
> if only use once, needn't local variable.
>
> graph_util_parse_link_direction(np, &link->playback_only, &link->capture_=
only)

sound/soc/fsl/imx-card.c:683:53: error: cannot take address of
bit-field =E2=80=98playback_only=E2=80=99
  683 |                 graph_util_parse_link_direction(np,
&link->playback_only, &link->capture_only);
      |                                                     ^
sound/soc/fsl/imx-card.c:683:75: error: cannot take address of
bit-field =E2=80=98capture_only=E2=80=99
  683 |                 graph_util_parse_link_direction(np,
&link->playback_only, &link->capture_only);

There are errors with it.

best regards
Shengjiu Wang
>
> Frank
>
> >               /* Get dai fmt */
> >               ret =3D simple_util_parse_daifmt(dev, np, codec,
> >                                              NULL, &link->dai_fmt);
> > --
> > 2.34.1
> >

