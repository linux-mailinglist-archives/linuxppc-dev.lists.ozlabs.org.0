Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E11788C0E55
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 12:45:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PwJ8ir2u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZpYl3NcXz3cYw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 20:44:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PwJ8ir2u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZpY02SXjz3cPh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 20:44:18 +1000 (AEST)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-36c82ca80adso3016505ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715251455; x=1715856255; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCRj3t+xdNp1rsUvPmVB9uy83J7LGPcYV6vSNcPVNyA=;
        b=PwJ8ir2uaH5F7dlm3PTu5SH1gpUoTnFvM/Pvk2FvSeG+TY9JDCr04WZ31OZfeJvM0I
         gh9+9fpni8MHwn56Y4xbsCbgnhNwNinFmKOnGA5llYjqWk2SJf0hbHXsrgsjnrq03BzH
         PiCKMnq+gOIrrLFs2EzIjHwKtObfEdu7Vjg0bqjHUNHGdp6HnE5Q8AY6QPfd5e2urNBL
         s/0lnmGjb7WwC8r1mb4YAlBTO31h/E+cAFd0T6xS7xtIAH0hCn/munqwaoZGVfGkChk4
         IyVuoRNlJJCqiruOlKYtc1Zn/HRi0KeONwq6Y4F5aQjk9Iq1ZFkK0g/JDsEelhPoTrhq
         f2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715251455; x=1715856255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCRj3t+xdNp1rsUvPmVB9uy83J7LGPcYV6vSNcPVNyA=;
        b=leU+h15zkNL7PmEuTlsxJZEx2PBubfBBAp9IxLo5fhIkfAAKEujeUG8/sdngse7u/4
         mI0zI8tNboxdPP5gPQIDHNT9NYUkCudtWKXmo8pl9KygEpfmNg7Tm9YgqewEzWFTu6vg
         vqD3ibeU1299LUn38nAtlHcfPDGBptH/7NHxxPbyu495Aq3zNfgoNSq0auj1B5c+Udzw
         0YHvNu60Hb5l0OqlmXJCnYiDIAjAiq2kDnvVowqOZzPUMFTvaryHM7DETqAmTHuljYun
         CgD0gc97joCedmBsVfCs1O+Dx/DpeaJ+ypBr23o3gpSgYdnaKmjA94SJF9mxf9Pia9FX
         XJQg==
X-Forwarded-Encrypted: i=1; AJvYcCWHj8KiFJNvFTZ62GPG5nxvfBovNkZubXXhn+yRaR3Xw5ujzBZ7Z3khn93GglqXUc1hQPtSb5NUAxqt2ieAcwfBRcXPlF1Bm/LOIoXCFg==
X-Gm-Message-State: AOJu0Yw+7RN60lkoSkLmcAoDuTketD81vdsmPn4RLudl2C6yRbY56NAc
	R1kE7wIT2lX/YNCS4r2Q9EcZDCchXxcqS5QoOwvCUOhInaOHkYjhkXVMDMYzTippdkJpXpAxr5B
	xnp7F+K6utknafLhP+rTNjZIgY+E=
X-Google-Smtp-Source: AGHT+IEi/mVwQ3GL+NyJ0D7UrdEjzf34Nyjn6VriSq2HIBSrDOCD/y/fvG9wSq1Mnww5djhfR6VpTbDKb6eS+PLmC44=
X-Received: by 2002:a05:6e02:1a08:b0:36c:a46:e018 with SMTP id
 e9e14a558f8ab-36caed5abd2mr53372115ab.24.1715251455116; Thu, 09 May 2024
 03:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310> <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
 <20240430172752.20ffcd56@sal.lan> <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk>
 <87sez0k661.wl-tiwai@suse.de> <20240502095956.0a8c5b26@sal.lan>
 <20240502102643.4ee7f6c2@sal.lan> <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk>
 <20240503094225.47fe4836@sal.lan> <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl> <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com> <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
In-Reply-To: <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 9 May 2024 18:44:03 +0800
Message-ID: <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
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

On Thu, May 9, 2024 at 6:28=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 5/9/2024 12:12 PM, Shengjiu Wang wrote:
> > On Thu, May 9, 2024 at 5:50=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
> > <amadeuszx.slawinski@linux.intel.com> wrote:
> >>
> >> On 5/9/2024 11:36 AM, Shengjiu Wang wrote:
> >>> On Wed, May 8, 2024 at 4:14=E2=80=AFPM Amadeusz S=C5=82awi=C5=84ski
> >>> <amadeuszx.slawinski@linux.intel.com> wrote:
> >>>>
> >>>> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
> >>>>> On 06/05/2024 10:49, Shengjiu Wang wrote:
> >>>>>> On Fri, May 3, 2024 at 4:42=E2=80=AFPM Mauro Carvalho Chehab <mche=
hab@kernel.org> wrote:
> >>>>>>>
> >>>>>>> Em Fri, 3 May 2024 10:47:19 +0900
> >>>>>>> Mark Brown <broonie@kernel.org> escreveu:
> >>>>>>>
> >>>>>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab =
wrote:
> >>>>>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
> >>>>>>>>
> >>>>>>>>>> There are still time control associated with it, as audio and =
video
> >>>>>>>>>> needs to be in sync. This is done by controlling the buffers s=
ize
> >>>>>>>>>> and could be fine-tuned by checking when the buffer transfer i=
s done.
> >>>>>>>>
> >>>>>>>> ...
> >>>>>>>>
> >>>>>>>>> Just complementing: on media, we do this per video buffer (or
> >>>>>>>>> per half video buffer). A typical use case on cameras is to hav=
e
> >>>>>>>>> buffers transferred 30 times per second, if the video was strea=
med
> >>>>>>>>> at 30 frames per second.
> >>>>>>>>
> >>>>>>>> IIRC some big use case for this hardware was transcoding so ther=
e was a
> >>>>>>>> desire to just go at whatever rate the hardware could support as=
 there
> >>>>>>>> is no interactive user consuming the output as it is generated.
> >>>>>>>
> >>>>>>> Indeed, codecs could be used to just do transcoding, but I would
> >>>>>>> expect it to be a border use case. See, as the chipsets implement=
ing
> >>>>>>> codecs are typically the ones used on mobiles, I would expect tha=
t
> >>>>>>> the major use cases to be to watch audio and video and to partici=
pate
> >>>>>>> on audio/video conferences.
> >>>>>>>
> >>>>>>> Going further, the codec API may end supporting not only transcod=
ing
> >>>>>>> (which is something that CPU can usually handle without too much
> >>>>>>> processing) but also audio processing that may require more
> >>>>>>> complex algorithms - even deep learning ones - like background no=
ise
> >>>>>>> removal, echo detection/removal, volume auto-gain, audio enhancem=
ent
> >>>>>>> and such.
> >>>>>>>
> >>>>>>> On other words, the typical use cases will either have input
> >>>>>>> or output being a physical hardware (microphone or speaker).
> >>>>>>>
> >>>>>>
> >>>>>> All, thanks for spending time to discuss, it seems we go back to
> >>>>>> the start point of this topic again.
> >>>>>>
> >>>>>> Our main request is that there is a hardware sample rate converter
> >>>>>> on the chip, so users can use it in user space as a component like
> >>>>>> software sample rate converter. It mostly may run as a gstreamer p=
lugin.
> >>>>>> so it is a memory to memory component.
> >>>>>>
> >>>>>> I didn't find such API in ALSA for such purpose, the best option f=
or this
> >>>>>> in the kernel is the V4L2 memory to memory framework I found.
> >>>>>> As Hans said it is well designed for memory to memory.
> >>>>>>
> >>>>>> And I think audio is one of 'media'.  As I can see that part of Ra=
dio
> >>>>>> function is in ALSA, part of Radio function is in V4L2. part of HD=
MI
> >>>>>> function is in DRM, part of HDMI function is in ALSA...
> >>>>>> So using V4L2 for audio is not new from this point of view.
> >>>>>>
> >>>>>> Even now I still think V4L2 is the best option, but it looks like =
there
> >>>>>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
> >>>>>> a duplication of code (bigger duplication that just add audio supp=
ort
> >>>>>> in V4L2 I think).
> >>>>>
> >>>>> After reading this thread I still believe that the mem2mem framewor=
k is
> >>>>> a reasonable option, unless someone can come up with a method that =
is
> >>>>> easy to implement in the alsa subsystem. From what I can tell from =
this
> >>>>> discussion no such method exists.
> >>>>>
> >>>>
> >>>> Hi,
> >>>>
> >>>> my main question would be how is mem2mem use case different from
> >>>> loopback exposing playback and capture frontends in user space with =
DSP
> >>>> (or other piece of HW) in the middle?
> >>>>
> >>> I think loopback has a timing control,  user need to feed data to pla=
yback at a
> >>> fixed time and get data from capture at a fixed time.  Otherwise ther=
e
> >>> is xrun in
> >>> playback and capture.
> >>>
> >>> mem2mem case: there is no such timing control,  user feeds data to it
> >>> then it generates output,  if user doesn't feed data, there is no xru=
n.
> >>> but mem2mem is just one of the components in the playback or capture
> >>> pipeline, overall there is time control for whole pipeline,
> >>>
> >>
> >> Have you looked at compress streams? If I remember correctly they are
> >> not tied to time due to the fact that they can pass data in arbitrary
> >> formats?
> >>
> >> From:
> >> https://docs.kernel.org/sound/designs/compress-offload.html
> >>
> >> "No notion of underrun/overrun. Since the bytes written are compressed
> >> in nature and data written/read doesn=E2=80=99t translate directly to =
rendered
> >> output in time, this does not deal with underrun/overrun and maybe dea=
lt
> >> in user-library"
> >
> > I checked the compress stream. mem2mem case is different with
> > compress-offload case
> >
> > compress-offload case is a full pipeline,  the user sends a compress
> > stream to it, then DSP decodes it and renders it to the speaker in real
> > time.
> >
> > mem2mem is just like the decoder in the compress pipeline. which is
> > one of the components in the pipeline.
>
> I was thinking of loopback with endpoints using compress streams,
> without physical endpoint, something like:
>
> compress playback (to feed data from userspace) -> DSP (processing) ->
> compress capture (send data back to userspace)
>
> Unless I'm missing something, you should be able to process data as fast
> as you can feed it and consume it in such case.
>

Actually in the beginning I tried this,  but it did not work well.
ALSA needs time control for playback and capture, playback and capture
needs to synchronize.  Usually the playback and capture pipeline is
independent in ALSA design,  but in this case, the playback and capture
should synchronize, they are not independent.

Best regards
Shengjiu Wang

> Amadeusz
