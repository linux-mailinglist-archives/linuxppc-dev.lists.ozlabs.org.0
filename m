Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A202E859BD1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 07:04:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ITd8cBDE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TdX752Rb2z3d32
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 17:04:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ITd8cBDE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TdX6L4c0zz2yk5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 17:03:53 +1100 (AEDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3650b558a8cso7194705ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Feb 2024 22:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708322629; x=1708927429; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoCJLYOduj9n23MLx0saV8cGvj1vyy+InFEBX0fNSWY=;
        b=ITd8cBDE6N9tv/Tr+DwK17eirgyd/TMkdDLOA2UrAWAWWYpWrnH23CTGToWe80/q0V
         nV0vKJJvynS0wSnsj/EYMUef8WP+CzRxNhTu67cHnAExzsEs0h/N6mnQamFJGzifhZyg
         JAuX+ZAwJIGqOKDUNsDXSTrbJymAkkurgL9STRg/b/LAaWnpRFD2aQ/AN9Gx6UTtoTF/
         96vUxBMrD3cAnVpAKlrP4XWf+8rRp8stUmWtJeRd3bZ/rkKvZ2K/wGv2tLlVLUY/gwMC
         NrngLFTPVzowirwYmIjInDh6UyqeuBalFHaQiWA3EPLIdr8u73zS/GIW2f3+w6xlJij2
         cN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708322629; x=1708927429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoCJLYOduj9n23MLx0saV8cGvj1vyy+InFEBX0fNSWY=;
        b=PIiwmlLt8f9Qccr4tFIV1IfNYFtqzO2OsCQkw3Ij9+P5To8Fb0LImWKgHgAgYeXF+f
         hcg28/zXJgpd5syKK0zZWXrW6Ar9ckjeFsaLj1i/1D3AUEjVIjS+hEOMkA64hlPRA0P0
         MXy6JzUFt2pCGPsl6Tsnv/OfSK5oFw3Uxe/AalWDZ/0OGEomSAf4FlZLHjYehvTsKiMI
         AhIBlR1YOybyOnJR6IR8GI7iE/VuKZi0siz3IsATgGTzVU9N3AsAPjsFlcTq4ZTbh2RJ
         v9GY9fs8DMKcke/tnAqsAh/cjP/XJhjr9nwx89trjYpRtpLIBaKkEWJmlcdaj9ZEYkNn
         npMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6LzIPVHBcUv8Fuv+iGLrB8419OdjhWpXaJVZ9AOsQX6WyOP61ypYJbUeT1TVhwK0JDiw+SgG/aZ/Cf+g0dEQv4raSKigEax3afQ4+zg==
X-Gm-Message-State: AOJu0Yzz1ZQ+zy9Mx9eq+H4QQ6eOr87WYTF9iOX99+WVXlZu1AuJ8MSR
	fYeXyUEHanmo+Sloc1ILdluZc0C+M88D5AtILHFA20h1sMN2s38PLauO7KQQStdO0Aoy1L2JagV
	LAL46dMh2ThRErgDrB8ir86xxswE=
X-Google-Smtp-Source: AGHT+IEYk69UufUFWwE7DTTiq8C+0ZQ+JTG7QL74tqi/J6KrU4GZcFAsfIhM3H47exPifWYnK4hxbC8F6eipbdBDtHw=
X-Received: by 2002:a92:d78b:0:b0:363:e573:da77 with SMTP id
 d11-20020a92d78b000000b00363e573da77mr9821592iln.18.1708322628698; Sun, 18
 Feb 2024 22:03:48 -0800 (PST)
MIME-Version: 1.0
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-11-git-send-email-shengjiu.wang@nxp.com> <20240217105708.53c81b04@coco.lan>
In-Reply-To: <20240217105708.53c81b04@coco.lan>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Feb 2024 14:03:37 +0800
Message-ID: <CAA+D8APQy0NaZH44zgoHfMJ1pFS3TporVZZt7zV=Yy-edWacdg@mail.gmail.com>
Subject: Re: [PATCH v12 10/15] media: uapi: Add audio rate controls support
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, linux-media@vger.kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 17, 2024 at 5:57=E2=80=AFPM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Thu, 18 Jan 2024 20:32:03 +0800
> Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
>
> > Add V4L2_CID_M2M_AUDIO_SOURCE_RATE and V4L2_CID_M2M_AUDIO_DEST_RATE
> > new IDs for rate control.
> >
> > Add V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET and
> > V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET for clock drift.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../media/v4l/ext-ctrls-audio-m2m.rst         | 20 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  6 ++++++
> >  include/uapi/linux/v4l2-controls.h            |  5 +++++
> >  3 files changed, 31 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.=
rst b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > index 82d2ecedbfee..de579ab8fb94 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > @@ -19,3 +19,23 @@ Audio M2M Control IDs
> >      The Audio M2M class descriptor. Calling
> >      :ref:`VIDIOC_QUERYCTRL` for this control will
> >      return a description of this control class.
> > +
> > +.. _v4l2-audio-asrc:
> > +
> > +``V4L2_CID_M2M_AUDIO_SOURCE_RATE (integer menu)``
> > +    Sets the audio source sample rate, unit is Hz
> > +
> > +``V4L2_CID_M2M_AUDIO_DEST_RATE (integer menu)``
> > +    Sets the audio destination sample rate, unit is Hz
> > +
> > +``V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET (fixed point)``
> > +    Sets the offset from the audio source sample rate, unit is Hz.
> > +    The offset compensates for any clock drift. The actual source audi=
o
> > +    sample rate is the ideal source audio sample rate from
> > +    ``V4L2_CID_M2M_AUDIO_SOURCE_RATE`` plus this fixed point offset.
> > +
> > +``V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET (fixed point)``
> > +    Sets the offset from the audio destination sample rate, unit is Hz=
.
> > +    The offset compensates for any clock drift. The actual destination=
 audio
> > +    sample rate is the ideal source audio sample rate from
> > +    ``V4L2_CID_M2M_AUDIO_DEST_RATE`` plus this fixed point offset.
>
> Hmm... first of all, controls on V4L2 API can either be get or set.
> So, starting the sentence with "Set" sounds an assumption that may
> be wrong.

Ok, will update the description.
>
> Also, I would explain a little bit more about the frequency offset values=
,
> as clock drift adjustment on PCM streams is something that can be done
> using different approaches.
>
> I'm assuming that what you wanted here is to use it to check if the
> video and audio clocks have some drift, and reducing or increasing
> the audio sample rate dynamically to ensure that such drift will
> stay constraint to a maximum allowed drift measured in mili or nano
> seconds. So, userspace would be expected to be monitoring such drift
> and increasing/decreasing the sample frequency as needed to maintain
> such constraint.
>
> Is that the way such uAPI is expected to work?

Yes. Userspace should monitor the drift, get the offset based on the
common sample rate (8k, 44.1k, 48k...) then send it to the driver.
The offset is a fixed point. it is base on the patch:
https://patchwork.kernel.org/project/linux-media/patch/cec82507-ced9-4e7d-8=
02c-04a40f84a4b4@xs4all.nl/

Best regards
Shengjiu Wang
>
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 2a85ea3dc92f..91e1f5348c23 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1245,6 +1245,8 @@ const char *v4l2_ctrl_get_name(u32 id)
> >
> >       /* Audio M2M controls */
> >       case V4L2_CID_M2M_AUDIO_CLASS:  return "Audio M2M Controls";
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE:    return "Audio Source Samp=
le Rate";
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE:      return "Audio Destination=
 Sample Rate";
> >       default:
> >               return NULL;
> >       }
> > @@ -1606,6 +1608,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, e=
num v4l2_ctrl_type *type,
> >       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> >               *type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> >               break;
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE:
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE:
> > +             *type =3D V4L2_CTRL_TYPE_INTEGER_MENU;
> > +             break;
> >       default:
> >               *type =3D V4L2_CTRL_TYPE_INTEGER;
> >               break;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index a8b4b830c757..30129ccdc282 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -3495,6 +3495,11 @@ struct v4l2_ctrl_av1_film_grain {
> >  #define V4L2_CID_M2M_AUDIO_CLASS_BASE  (V4L2_CTRL_CLASS_M2M_AUDIO | 0x=
900)
> >  #define V4L2_CID_M2M_AUDIO_CLASS       (V4L2_CTRL_CLASS_M2M_AUDIO | 1)
> >
> > +#define V4L2_CID_M2M_AUDIO_SOURCE_RATE       (V4L2_CID_M2M_AUDIO_CLASS=
_BASE + 0)
> > +#define V4L2_CID_M2M_AUDIO_DEST_RATE (V4L2_CID_M2M_AUDIO_CLASS_BASE + =
1)
> > +#define V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET        (V4L2_CID_M2M_AUD=
IO_CLASS_BASE + 2)
> > +#define V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET  (V4L2_CID_M2M_AUDIO_CLASS=
_BASE + 3)
> > +
> >  /* MPEG-compression definitions kept for backwards compatibility */
> >  #ifndef __KERNEL__
> >  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
>
>
>
> Thanks,
> Mauro
