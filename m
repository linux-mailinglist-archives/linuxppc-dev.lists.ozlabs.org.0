Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED77D8E24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 07:28:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nn/VbY8d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGrmF4BpHz3cPR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 16:28:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nn/VbY8d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGrlL3SpHz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 16:27:24 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5b8f68ba4e5so1435989a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 22:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698384441; x=1698989241; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSH6er1S/8VpTk0zK1LTJVVGU+rFN/elA5pOh6jUYKs=;
        b=nn/VbY8dQJheXkCGnbkq1YzdjY4F+YEQzioR8pS9lzdYK9LCFFICRMpcdi2SleP9eU
         Ebw4Scfi21QZlOt+52x3qQvtfjWVBA6Il1uqG7MrS3oKxmqsgwtGiAa6ccmoevsotZDg
         LG9vqlqmo4/Jxd4VeH0H5y8rxMxFu7sLFNAc4jExxPPGQMjHa5YTTD2I2iPlriPpdqDr
         ph47i64TH6vu4LlN5bhUdso8rjGCVSp0bD4euhfQkT3yK+Y/ff5nyWPGzH3zdPb3xk/E
         HiDeY3AlWd50LkvWSSBYCNThKc9ZhlJQhf0kPQhu59WpcoQ1wSVD5J3yrxj32B95b4Ce
         waPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698384441; x=1698989241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSH6er1S/8VpTk0zK1LTJVVGU+rFN/elA5pOh6jUYKs=;
        b=e2Q63j8So5oMG+qThT30qF4sRid+1u2FhF4LOorR9nDEQgKHvR9+TvvEmHX/R21Ogc
         +VQIIloCvmLMvzRdaHo2j3W+DQMLsXPFp/Yla634MQhSPyk2evb9kmhF7e7/fveAGbtf
         koiM3P4irG+hIQDrDMrJOxSO9/YIMD13AE33HSYnEGdxBh4/225yZRpMjTH42fkexhtl
         2CxljR0i3B5eypFpeoQCmC9EWdNxqLPgijQGaqxDfd54QilWH+OInqBDMsiU+UIW11KH
         eL59rBrhvmt8vgCnAqQbC41ew5/PCpPShiNxQqZd/+0/YUHC8dn2f6pPEM7su/r0j2pA
         XE8w==
X-Gm-Message-State: AOJu0YzZz1T0VBzK5k86bdvcxSgGmIqFAq2gSKOzYprCd6tRMv9NXJPY
	re238F9jG6t3VoXno7OS9p+wAmECqO1WXWYdJG8=
X-Google-Smtp-Source: AGHT+IEnI8ab1+JdNF7ype3BwZWF15ZqPeMu0XQR0L+WWYyQ5mhuVfNxRleauDz1GPh94vZdw3ix9QMRKF9L/xPfAsI=
X-Received: by 2002:a17:90a:6d02:b0:27d:21dd:258f with SMTP id
 z2-20020a17090a6d0200b0027d21dd258fmr1611815pjj.37.1698384441050; Thu, 26 Oct
 2023 22:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <1697794232-2607-1-git-send-email-shengjiu.wang@nxp.com>
 <1697794232-2607-12-git-send-email-shengjiu.wang@nxp.com> <7929b801-63a4-4b30-9da7-e080e38a7e40@xs4all.nl>
In-Reply-To: <7929b801-63a4-4b30-9da7-e080e38a7e40@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 27 Oct 2023 13:27:09 +0800
Message-ID: <CAA+D8APYcRvmscFcEx4bg5bpjUSmK7G7TZ8d3P-8-yZkvCrw8A@mail.gmail.com>
Subject: Re: [RFC PATCH v7 11/13] media: uapi: Add audio rate controls support
To: Hans Verkuil <hverkuil@xs4all.nl>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 25, 2023 at 6:47=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 20/10/2023 11:30, Shengjiu Wang wrote:
> > Add V4L2_CID_M2M_AUDIO_SOURCE_RATE and V4L2_CID_M2M_AUDIO_DEST_RATE
> > new IDs for rate control.
> >
> > Add V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET and
> > V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET for clock drift.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../media/v4l/ext-ctrls-audio-m2m.rst          | 18 ++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c      | 12 ++++++++++++
> >  include/uapi/linux/v4l2-controls.h             |  5 +++++
> >  3 files changed, 35 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.=
rst b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > index 82d2ecedbfee..e6972a2d3b17 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > @@ -19,3 +19,21 @@ Audio M2M Control IDs
> >      The Audio M2M class descriptor. Calling
> >      :ref:`VIDIOC_QUERYCTRL` for this control will
> >      return a description of this control class.
> > +
> > +.. _v4l2-audio-asrc:
> > +
> > +``V4L2_CID_M2M_AUDIO_SOURCE_RATE``
>
> Add ' (integer menu)' after the name.
>
> > +    Sets the audio source rate, unit is (Hz)
>
> (Hz) -> Hz.
>
> General question: is 'rate' good enough or should it be 'sample rate'?

Ok, will use 'sample rate'.

Best regards
Wang shengjiu
>
> > +
> > +``V4L2_CID_M2M_AUDIO_DEST_RATE``
> > +    Sets the audio destination rate, unit is (Hz)
>
> Ditto here.
>
> > +
> > +``V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET``
>
> Add ' (fixed point)' after the name.
>
> > +    Sets the offset for audio source rate, unit is (Hz).
>
> for -> from the
>
> (Hz) -> Hz
>
> > +    Offset expresses the drift of clock if there is. It is
> > +    equal to real rate minus ideal rate.
>
> How about:
>
> The offset compensates for any clock drift. The actual source audio
> rate is the ideal source audio rate from ``V4L2_CID_M2M_AUDIO_SOURCE_RATE=
``
> plus this fixed point offset.
>
> > +
> > +``V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET``
> > +    Sets the offset for audio destination rate, unit is (Hz)
> > +    Offset expresses the drift of clock if there is. It is
> > +    equal to real rate minus ideal rate.
>
> Same changes as for V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET.
>
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 2a85ea3dc92f..b695cbdd1f6e 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1245,6 +1245,10 @@ const char *v4l2_ctrl_get_name(u32 id)
> >
> >       /* Audio M2M controls */
> >       case V4L2_CID_M2M_AUDIO_CLASS:  return "Audio M2M Controls";
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE:    return "Audio Source Samp=
le Rate";
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE:      return "Audio Dest Sample=
 Rate";
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET:     return "Audio Sou=
rce Sample Rate Offset";
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET:       return "Audio Des=
t Sample Rate Offset";
>
> Related to my question above: "Sample Rate" or just "Rate"? Whatever we p=
ick, it should
> be consistent.
>
> >       default:
> >               return NULL;
> >       }
> > @@ -1606,6 +1610,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, e=
num v4l2_ctrl_type *type,
> >       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> >               *type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> >               break;
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE:
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE:
> > +             *type =3D V4L2_CTRL_TYPE_INTEGER_MENU;
> > +             break;
> > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET:
> > +     case V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET:
> > +             *type =3D V4L2_CTRL_TYPE_FIXED_POINT;
> > +             break;
> >       default:
> >               *type =3D V4L2_CTRL_TYPE_INTEGER;
> >               break;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index eb0f0a76f867..d433c6f0b533 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -3498,4 +3498,9 @@ struct v4l2_ctrl_av1_film_grain {
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
> >  #endif
>
> Regards,
>
>         Hans
