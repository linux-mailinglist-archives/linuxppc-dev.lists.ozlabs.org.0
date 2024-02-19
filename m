Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFDB85A307
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 13:17:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gl5Ire7i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TdhPY6cRjz3cZ8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 23:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gl5Ire7i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mchehab@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TdhNq1hNFz3cCK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 23:16:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 791D260C84;
	Mon, 19 Feb 2024 12:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6EDC433C7;
	Mon, 19 Feb 2024 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708345016;
	bh=Fo7gWX+fN3KK0l+fgHET85/r8KC+eGTLo1tNhMAG3fM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gl5Ire7ih1If26CRdbDqceoxp+UT1T+0n8EEUKShBqS3jL61ggxtzzWxM91FaQR89
	 NluyzJL22D8zdCSvqSChzLd2o+g7HJyJXmsad55aYpwDVOF1i/k/4EqYS4376T4VLl
	 SyD1vb/7dqKpWKoBHoYfjeXaZkN4PnfPIOvQpXVp2PLNcFI+9u5PopnikQbcn8Zmr0
	 yG/8Vfz25UbYxWKp3uB28K7m9l9/X58Q7H8pUZW6wXxXhtOQs9GJzWvAFUZ6UBETqg
	 Jy4Z5XlUcui/Lk7k8+bsNgaqr0py7jCh+uuXOYk7ez2obX1Kzy89dmqUuz9c8F3fj1
	 vrWQ+Sx7tzI8A==
Date: Mon, 19 Feb 2024 13:16:49 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v12 10/15] media: uapi: Add audio rate controls support
Message-ID: <20240219131649.1a26769d@coco.lan>
In-Reply-To: <CAA+D8APQy0NaZH44zgoHfMJ1pFS3TporVZZt7zV=Yy-edWacdg@mail.gmail.com>
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
	<1705581128-4604-11-git-send-email-shengjiu.wang@nxp.com>
	<20240217105708.53c81b04@coco.lan>
	<CAA+D8APQy0NaZH44zgoHfMJ1pFS3TporVZZt7zV=Yy-edWacdg@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Em Mon, 19 Feb 2024 14:03:37 +0800
Shengjiu Wang <shengjiu.wang@gmail.com> escreveu:

> On Sat, Feb 17, 2024 at 5:57=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> >
> > Em Thu, 18 Jan 2024 20:32:03 +0800
> > Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
> > =20
> > > Add V4L2_CID_M2M_AUDIO_SOURCE_RATE and V4L2_CID_M2M_AUDIO_DEST_RATE
> > > new IDs for rate control.
> > >
> > > Add V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET and
> > > V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET for clock drift.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  .../media/v4l/ext-ctrls-audio-m2m.rst         | 20 +++++++++++++++++=
++
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  6 ++++++
> > >  include/uapi/linux/v4l2-controls.h            |  5 +++++
> > >  3 files changed, 31 insertions(+)
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2=
m.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > > index 82d2ecedbfee..de579ab8fb94 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
> > > @@ -19,3 +19,23 @@ Audio M2M Control IDs
> > >      The Audio M2M class descriptor. Calling
> > >      :ref:`VIDIOC_QUERYCTRL` for this control will
> > >      return a description of this control class.
> > > +
> > > +.. _v4l2-audio-asrc:
> > > +
> > > +``V4L2_CID_M2M_AUDIO_SOURCE_RATE (integer menu)``
> > > +    Sets the audio source sample rate, unit is Hz
> > > +
> > > +``V4L2_CID_M2M_AUDIO_DEST_RATE (integer menu)``
> > > +    Sets the audio destination sample rate, unit is Hz
> > > +
> > > +``V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET (fixed point)``
> > > +    Sets the offset from the audio source sample rate, unit is Hz.
> > > +    The offset compensates for any clock drift. The actual source au=
dio
> > > +    sample rate is the ideal source audio sample rate from
> > > +    ``V4L2_CID_M2M_AUDIO_SOURCE_RATE`` plus this fixed point offset.
> > > +
> > > +``V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET (fixed point)``
> > > +    Sets the offset from the audio destination sample rate, unit is =
Hz.
> > > +    The offset compensates for any clock drift. The actual destinati=
on audio
> > > +    sample rate is the ideal source audio sample rate from
> > > +    ``V4L2_CID_M2M_AUDIO_DEST_RATE`` plus this fixed point offset. =
=20
> >
> > Hmm... first of all, controls on V4L2 API can either be get or set.
> > So, starting the sentence with "Set" sounds an assumption that may
> > be wrong. =20
>=20
> Ok, will update the description.
> >
> > Also, I would explain a little bit more about the frequency offset valu=
es,
> > as clock drift adjustment on PCM streams is something that can be done
> > using different approaches.
> >
> > I'm assuming that what you wanted here is to use it to check if the
> > video and audio clocks have some drift, and reducing or increasing
> > the audio sample rate dynamically to ensure that such drift will
> > stay constraint to a maximum allowed drift measured in mili or nano
> > seconds. So, userspace would be expected to be monitoring such drift
> > and increasing/decreasing the sample frequency as needed to maintain
> > such constraint.
> >
> > Is that the way such uAPI is expected to work? =20
>=20
> Yes. Userspace should monitor the drift, get the offset based on the
> common sample rate (8k, 44.1k, 48k...) then send it to the driver.
> The offset is a fixed point. it is base on the patch:
> https://patchwork.kernel.org/project/linux-media/patch/cec82507-ced9-4e7d=
-802c-04a40f84a4b4@xs4all.nl/

Ok, so write a description about how this should be used (like the
test I written),to help userspace developers to better understand
how this uAPI should be used.

See, one of the main goals of the uAPI documentation is to ensure that
userspace programs will implement the uAPI bits the right way, behaving
the right way when using it. That's why we even have some userspace code=20
examples for some ioctls. IMO frequence drift is one of such cases
where more explanation is needed.


>=20
> Best regards
> Shengjiu Wang
> > =20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-defs.c
> > > index 2a85ea3dc92f..91e1f5348c23 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > > @@ -1245,6 +1245,8 @@ const char *v4l2_ctrl_get_name(u32 id)
> > >
> > >       /* Audio M2M controls */
> > >       case V4L2_CID_M2M_AUDIO_CLASS:  return "Audio M2M Controls";
> > > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE:    return "Audio Source Sa=
mple Rate";
> > > +     case V4L2_CID_M2M_AUDIO_DEST_RATE:      return "Audio Destinati=
on Sample Rate";
> > >       default:
> > >               return NULL;
> > >       }
> > > @@ -1606,6 +1608,10 @@ void v4l2_ctrl_fill(u32 id, const char **name,=
 enum v4l2_ctrl_type *type,
> > >       case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
> > >               *type =3D V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
> > >               break;
> > > +     case V4L2_CID_M2M_AUDIO_SOURCE_RATE:
> > > +     case V4L2_CID_M2M_AUDIO_DEST_RATE:
> > > +             *type =3D V4L2_CTRL_TYPE_INTEGER_MENU;
> > > +             break;
> > >       default:
> > >               *type =3D V4L2_CTRL_TYPE_INTEGER;
> > >               break;
> > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/=
v4l2-controls.h
> > > index a8b4b830c757..30129ccdc282 100644
> > > --- a/include/uapi/linux/v4l2-controls.h
> > > +++ b/include/uapi/linux/v4l2-controls.h
> > > @@ -3495,6 +3495,11 @@ struct v4l2_ctrl_av1_film_grain {
> > >  #define V4L2_CID_M2M_AUDIO_CLASS_BASE  (V4L2_CTRL_CLASS_M2M_AUDIO | =
0x900)
> > >  #define V4L2_CID_M2M_AUDIO_CLASS       (V4L2_CTRL_CLASS_M2M_AUDIO | =
1)
> > >
> > > +#define V4L2_CID_M2M_AUDIO_SOURCE_RATE       (V4L2_CID_M2M_AUDIO_CLA=
SS_BASE + 0)
> > > +#define V4L2_CID_M2M_AUDIO_DEST_RATE (V4L2_CID_M2M_AUDIO_CLASS_BASE =
+ 1)
> > > +#define V4L2_CID_M2M_AUDIO_SOURCE_RATE_OFFSET        (V4L2_CID_M2M_A=
UDIO_CLASS_BASE + 2)
> > > +#define V4L2_CID_M2M_AUDIO_DEST_RATE_OFFSET  (V4L2_CID_M2M_AUDIO_CLA=
SS_BASE + 3)
> > > +
> > >  /* MPEG-compression definitions kept for backwards compatibility */
> > >  #ifndef __KERNEL__
> > >  #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC =20
> >
> >
> >
> > Thanks,
> > Mauro =20



Thanks,
Mauro
