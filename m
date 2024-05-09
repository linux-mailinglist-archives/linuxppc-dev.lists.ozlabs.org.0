Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 448EF8C0E08
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 12:13:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O8iUeM63;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZns65smVz3cQq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 20:13:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O8iUeM63;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZnrL47hfz3c0H
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 20:12:33 +1000 (AEST)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-36c826d6edeso3181145ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 03:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715249551; x=1715854351; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeeOhJExMaeOPonFZLuLoibUPLJlD+uSiqsEeJXK218=;
        b=O8iUeM639fqntdFB2k04bQacxEn3Kt5SsHnxkIOG/rJir7k7mOBBWI35XpaUi5WCgp
         6R5Gg+6U9RcLUQC9VgBgs6CmOwT/QzfgM/c+h/OyJmMEC0MbX5ZcLBGG8eGikAxwCE9d
         QyVEKq6aXgJc4iR3ZPQ2nGSHq9xydnY+6ZUa99q6jYtEKsyh6Q2fdanqiLwKqNHCmhjJ
         02VzcuZHwvvu7e77BL+VD7WDDL416RMHlwiIb9FLjmJSogsNhB+cU5Vig+tZzkDKocnK
         MEU53tsI3N3CMA3Ces97PklQAesmUAqexluZAL6LTGPQL4VYrGW0blYb3nlXKsXAfhbr
         EY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715249551; x=1715854351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qeeOhJExMaeOPonFZLuLoibUPLJlD+uSiqsEeJXK218=;
        b=EexydTh8rk+cm7DWYLejSUXVs9UEPmqtGufzfeocxSKOmmPL/QDXUlg+zrSSI4VN2d
         +iyg0LcR5AqmQIn6SvHSelOFk+J+/T1JiOz81nyEpCzIh3RPj8ZwG5JfDqWsXswu8gR7
         ZuoJ2hgm/iCw1ruosIaIe+hWYWjzq3V3dDe1Wp1YQ7/hDb0/tRvEJziKRa2dspSMOHHT
         5MwjTv37W175rUSV9XH7dXpWs/CoUrOqDq54nZ3wXHexHuSMca9lskSSWjgZEvTy4Qdl
         QSuuLL1BtVQhzFYN1Iy0pHA+khG406q97JY64NEFMv3yY+F5Yb8TvzP3yOb54VsmQwo1
         xqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkBc/U9eWyWuQYL5cIwMoU0X58RRtgdhAsQe50MqP3s0nZ+Qdv0hQDVt8H8e5BEXBeM1EBethoDbwzlmUa8zFxsixt+xhGRH4n+/Bksg==
X-Gm-Message-State: AOJu0Yw1EVOKtAkzsdz6bokFxLvd9r3fP6FBLntURBzmQFZ5106LqA22
	VTLgpsAe4oMuUkzyJVBJumg56bp3ZKT5loIsnV6hg+foekAFRF7PdCr+934aPWePHzyTF8q2wER
	FNB7NOE8nhDw/yPMNNf1gqT0p7Z4=
X-Google-Smtp-Source: AGHT+IGACDILZuY3fjYmxVHjuj9EsLsw9yHssyl7QKQF1yUC0YZknYZxgh3CbiS3+eqeZ0s8vnluIDetD2EkdkJwwd8=
X-Received: by 2002:a92:cd8b:0:b0:36c:4b01:3063 with SMTP id
 e9e14a558f8ab-36caed04a13mr56384385ab.15.1715249550653; Thu, 09 May 2024
 03:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310> <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan> <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
 <20240503094225.47fe4836@sal.lan> <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl> <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com> <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
In-Reply-To: <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 9 May 2024 18:12:19 +0800
Message-ID: <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, perex@perex.cz, Mauro Carvalho Chehab <mchehab@kernel.org>, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 9, 2024 at 5:50=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 5/9/2024 11:36 AM, Shengjiu Wang wrote:
> > On Wed, May 8, 2024 at 4:14=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
> > <amadeuszx.slawinski@linux.intel.com> wrote:
> >>
> >> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
> >>> On 06/05/2024 10:49, Shengjiu Wang wrote:
> >>>> On Fri, May 3, 2024 at 4:42=E2=80=AFPM Mauro Carvalho Chehab <mcheha=
b@kernel.org> wrote:
> >>>>>
> >>>>> Em Fri, 3 May 2024 10:47:19 +0900
> >>>>> Mark Brown <broonie@kernel.org> escreveu:
> >>>>>
> >>>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wr=
ote:
> >>>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >>>>>>
> >>>>>>>> There are still time control associated with it, as audio and vi=
deo
> >>>>>>>> needs to be in sync. This is done by controlling the buffers siz=
e
> >>>>>>>> and could be fine-tuned by checking when the buffer transfer is =
done.
> >>>>>>
> >>>>>> ...
> >>>>>>
> >>>>>>> Just complementing: on media, we do this per video buffer (or
> >>>>>>> per half video buffer). A typical use case on cameras is to have
> >>>>>>> buffers transferred 30 times per second, if the video was streame=
d
> >>>>>>> at 30 frames per second.
> >>>>>>
> >>>>>> IIRC some big use case for this hardware was transcoding so there =
was a
> >>>>>> desire to just go at whatever rate the hardware could support as t=
here
> >>>>>> is no interactive user consuming the output as it is generated.
> >>>>>
> >>>>> Indeed, codecs could be used to just do transcoding, but I would
> >>>>> expect it to be a border use case. See, as the chipsets implementin=
g
> >>>>> codecs are typically the ones used on mobiles, I would expect that
> >>>>> the major use cases to be to watch audio and video and to participa=
te
> >>>>> on audio/video conferences.
> >>>>>
> >>>>> Going further, the codec API may end supporting not only transcodin=
g
> >>>>> (which is something that CPU can usually handle without too much
> >>>>> processing) but also audio processing that may require more
> >>>>> complex algorithms - even deep learning ones - like background nois=
e
> >>>>> removal, echo detection/removal, volume auto-gain, audio enhancemen=
t
> >>>>> and such.
> >>>>>
> >>>>> On other words, the typical use cases will either have input
> >>>>> or output being a physical hardware (microphone or speaker).
> >>>>>
> >>>>
> >>>> All, thanks for spending time to discuss, it seems we go back to
> >>>> the start point of this topic again.
> >>>>
> >>>> Our main request is that there is a hardware sample rate converter
> >>>> on the chip, so users can use it in user space as a component like
> >>>> software sample rate converter. It mostly may run as a gstreamer plu=
gin.
> >>>> so it is a memory to memory component.
> >>>>
> >>>> I didn't find such API in ALSA for such purpose, the best option for=
 this
> >>>> in the kernel is the V4L2 memory to memory framework I found.
> >>>> As Hans said it is well designed for memory to memory.
> >>>>
> >>>> And I think audio is one of 'media'.  As I can see that part of Radi=
o
> >>>> function is in ALSA, part of Radio function is in V4L2. part of HDMI
> >>>> function is in DRM, part of HDMI function is in ALSA...
> >>>> So using V4L2 for audio is not new from this point of view.
> >>>>
> >>>> Even now I still think V4L2 is the best option, but it looks like th=
ere
> >>>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
> >>>> a duplication of code (bigger duplication that just add audio suppor=
t
> >>>> in V4L2 I think).
> >>>
> >>> After reading this thread I still believe that the mem2mem framework =
is
> >>> a reasonable option, unless someone can come up with a method that is
> >>> easy to implement in the alsa subsystem. From what I can tell from th=
is
> >>> discussion no such method exists.
> >>>
> >>
> >> Hi,
> >>
> >> my main question would be how is mem2mem use case different from
> >> loopback exposing playback and capture frontends in user space with DS=
P
> >> (or other piece of HW) in the middle?
> >>
> > I think loopback has a timing control,  user need to feed data to playb=
ack at a
> > fixed time and get data from capture at a fixed time.  Otherwise there
> > is xrun in
> > playback and capture.
> >
> > mem2mem case: there is no such timing control,  user feeds data to it
> > then it generates output,  if user doesn't feed data, there is no xrun.
> > but mem2mem is just one of the components in the playback or capture
> > pipeline, overall there is time control for whole pipeline,
> >
>
> Have you looked at compress streams? If I remember correctly they are
> not tied to time due to the fact that they can pass data in arbitrary
> formats?
>
> From:
> https://docs.kernel.org/sound/designs/compress-offload.html
>
> "No notion of underrun/overrun. Since the bytes written are compressed
> in nature and data written/read doesn=E2=80=99t translate directly to ren=
dered
> output in time, this does not deal with underrun/overrun and maybe dealt
> in user-library"

I checked the compress stream. mem2mem case is different with
compress-offload case

compress-offload case is a full pipeline,  the user sends a compress
stream to it, then DSP decodes it and renders it to the speaker in real
time.

mem2mem is just like the decoder in the compress pipeline. which is
one of the components in the pipeline.

best regards
shengjiu wang
>
> Amadeusz
