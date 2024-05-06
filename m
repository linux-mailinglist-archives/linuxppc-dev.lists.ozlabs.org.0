Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E694F8BCA01
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 10:50:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O3fiGYgV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXw923MF8z30VM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 18:50:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O3fiGYgV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXw8F3TSJz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2024 18:49:47 +1000 (AEST)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-36c90b7f4a5so2850815ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2024 01:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714985382; x=1715590182; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+P/KjeibrFZWEkv6+L8YPxuHh9mJNgbeY/rfKylmy8=;
        b=O3fiGYgVxxvQbSTWECRiJ5B98rc43o6fGCEiuqbwmmxOUusUjZmQ1uNXBdfGdXXFW0
         3YxESsXRyhs8HCi7qMMjaZx7WjvIBHBgR6+Z7hmLnPUYXE59DyHWDFPrJbSheXuZAmyc
         aha8go3eTITTS90ABOSpD3dgUcbrwYqSXmKeVRV1Tv+HLkPcpSxn2inVyfyh7M8/mfbN
         TrqpP/jKQTE0ri1O4nPEjx1OGZMpV2GK9BTtkUzTgmht+cAuBcfBx82KlMSp/63p/ty6
         9Hh/jwD3eD8LrOfCHFOO6mg6inA0tjrb7mc8HnnQlKnPQqsKsLsrTcnpv4WdzS3GXa/R
         m6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714985382; x=1715590182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+P/KjeibrFZWEkv6+L8YPxuHh9mJNgbeY/rfKylmy8=;
        b=LJXizUDG4MpsC5IO0itDrQL8RFDu0/ObPo19uK9k9d951lR6frKmtdzD3kK0GgeNc0
         mDgvCXgYyidMSMZ7h9XDrDuEtZk3KdP7zNktb5jcvOEPZPZz2Hbn72Z/GZasfyZG6r/d
         o3JWAlJSs5p4U9X539U7c3W/WYYo1oc4/rla2uofC1dJBNYxzUz0qANRJFUvcnbRuOLw
         ScVcKXg7zbZCmiWa34pdHZKLQhXL8PxpNW1TBWuSTkzVZ9txQ4ivDwlPwKkDkugDSOVD
         LaMlAnXDNGVif5U0hhEIZRZP2bZzPh+XLMqSt5a/X8atQRhThW2j6h3BlBJEj21qUl/u
         qMVw==
X-Forwarded-Encrypted: i=1; AJvYcCVe+Pa3DrqkgNLOW31KnVU6KKEJqtVcyONd0ifMd1Qx+RN4mJ76LfEtnoYEav5ANODyaeaEdHNZgepbBWpz3I2bH2OApYeF8XRiHnUzJA==
X-Gm-Message-State: AOJu0YzldWQOcCFCPInF5Y+Ah9jnHw720diSCX3XpvbYubboY1fP+meI
	hm2UrsZZZFfAAJooSgF00oSluKGpazNxgpCsrwNt4dAmZr4SPoOwMKe2t05pq7N/7FY5R402HM8
	ixaSUS9aZlPBosiH6zgUzjCWBRWk=
X-Google-Smtp-Source: AGHT+IGeec60Vp1v6lhrn7gTHN4m70j+7lgJkd7vr44lhHOV5xgWp2a2fsbD89DvpBkVDZJvLlaoq3wNcAZT4wuEZSs=
X-Received: by 2002:a05:6e02:1c0d:b0:36b:aae:613 with SMTP id
 l13-20020a056e021c0d00b0036b0aae0613mr10103474ilh.10.1714985382163; Mon, 06
 May 2024 01:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310> <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan> <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk> <20240503094225.47fe4836@sal.lan>
In-Reply-To: <20240503094225.47fe4836@sal.lan>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 May 2024 16:49:31 +0800
Message-ID: <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: Mauro Carvalho Chehab <mchehab@kernel.org>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, perex@perex.cz, linux-media@vger.kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 3, 2024 at 4:42=E2=80=AFPM Mauro Carvalho Chehab <mchehab@kerne=
l.org> wrote:
>
> Em Fri, 3 May 2024 10:47:19 +0900
> Mark Brown <broonie@kernel.org> escreveu:
>
> > On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
> > > Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >
> > > > There are still time control associated with it, as audio and video
> > > > needs to be in sync. This is done by controlling the buffers size
> > > > and could be fine-tuned by checking when the buffer transfer is don=
e.
> >
> > ...
> >
> > > Just complementing: on media, we do this per video buffer (or
> > > per half video buffer). A typical use case on cameras is to have
> > > buffers transferred 30 times per second, if the video was streamed
> > > at 30 frames per second.
> >
> > IIRC some big use case for this hardware was transcoding so there was a
> > desire to just go at whatever rate the hardware could support as there
> > is no interactive user consuming the output as it is generated.
>
> Indeed, codecs could be used to just do transcoding, but I would
> expect it to be a border use case. See, as the chipsets implementing
> codecs are typically the ones used on mobiles, I would expect that
> the major use cases to be to watch audio and video and to participate
> on audio/video conferences.
>
> Going further, the codec API may end supporting not only transcoding
> (which is something that CPU can usually handle without too much
> processing) but also audio processing that may require more
> complex algorithms - even deep learning ones - like background noise
> removal, echo detection/removal, volume auto-gain, audio enhancement
> and such.
>
> On other words, the typical use cases will either have input
> or output being a physical hardware (microphone or speaker).
>

All, thanks for spending time to discuss, it seems we go back to
the start point of this topic again.

Our main request is that there is a hardware sample rate converter
on the chip, so users can use it in user space as a component like
software sample rate converter. It mostly may run as a gstreamer plugin.
so it is a memory to memory component.

I didn't find such API in ALSA for such purpose, the best option for this
in the kernel is the V4L2 memory to memory framework I found.
As Hans said it is well designed for memory to memory.

And I think audio is one of 'media'.  As I can see that part of Radio
function is in ALSA, part of Radio function is in V4L2. part of HDMI
function is in DRM, part of HDMI function is in ALSA...
So using V4L2 for audio is not new from this point of view.

Even now I still think V4L2 is the best option, but it looks like there
are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
a duplication of code (bigger duplication that just add audio support
in V4L2 I think).

Best regards
Shengjiu Wang.

> > > I would assume that, on an audio/video stream, the audio data
> > > transfer will be programmed to also happen on a regular interval.
> >
> > With audio the API is very much "wake userspace every Xms".
