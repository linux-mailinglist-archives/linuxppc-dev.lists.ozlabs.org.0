Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC9B85A3F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 13:57:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IaC62Hw3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TdjH81jTXz3dS4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 23:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IaC62Hw3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=mchehab@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TdjGQ2gr2z3by8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 23:56:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C28B7CE0159;
	Mon, 19 Feb 2024 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AC8C433C7;
	Mon, 19 Feb 2024 12:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347385;
	bh=ccbHakWFMPqKyo56fEKpc8aAf3Wb4VQoRZfLVnlY020=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IaC62Hw3yjK1/flPQhxsuk0O4OdKFtG83Nn2lk244OGiDCxR6rKWUuaIKZ7/t7BGf
	 jcZ4sk87QdlBUQyW+B0eTFWUJqh7KWkUxhHmL6ecneCUylAn7cjjSKL2XBdbdy3RLl
	 luWHN2toOrZvmPvGb5Q9qjdgM64Vw50ntuXtUpwPGQpqFW5I/Bbvjedgt+/lYXvXns
	 llJFV31k0n50KPsX8E49DfrCARvcDerNAopvgQZ3uvWHBBwI9WKL6UtN5XLZU83/kQ
	 40kwgeSzuu9EeBatmrJQUzesPW9bepQxFLwCM9L5vwIJEvs1iln+7drGvgDeAF6M/j
	 h6OP4j6RmhfZA==
Date: Mon, 19 Feb 2024 13:56:18 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v12 08/15] media: uapi: Define audio sample format
 fourcc type
Message-ID: <20240219135618.5c557e66@coco.lan>
In-Reply-To: <CAA+D8APD+zL0xYkf6FxPNfM3Y3O8+PhT7WEXO7XCLAmBjoMmUA@mail.gmail.com>
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
	<1705581128-4604-9-git-send-email-shengjiu.wang@nxp.com>
	<20240217101926.3f1d2452@coco.lan>
	<CAA+D8APD+zL0xYkf6FxPNfM3Y3O8+PhT7WEXO7XCLAmBjoMmUA@mail.gmail.com>
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

Em Mon, 19 Feb 2024 12:05:02 +0800
Shengjiu Wang <shengjiu.wang@gmail.com> escreveu:

> Hi Mauro
>=20
> On Sat, Feb 17, 2024 at 5:19=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> >
> > Em Thu, 18 Jan 2024 20:32:01 +0800
> > Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
> > =20
> > > The audio sample format definition is from alsa,
> > > the header file is include/uapi/sound/asound.h, but
> > > don't include this header file directly, because in
> > > user space, there is another copy in alsa-lib.
> > > There will be conflict in userspace for include
> > > videodev2.h & asound.h and asoundlib.h
> > >
> > > Here still use the fourcc format.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++++=
++
> > >  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
> > >  include/uapi/linux/videodev2.h                | 23 +++++
> > >  4 files changed, 124 insertions(+)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audi=
o.rst
> > >
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b=
/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> > > new file mode 100644
> > > index 000000000000..04b4a7fbd8f4
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> > > @@ -0,0 +1,87 @@
> > > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > > +
> > > +.. _pixfmt-audio:
> > > +
> > > +*************
> > > +Audio Formats
> > > +*************
> > > +
> > > +These formats are used for :ref:`audiomem2mem` interface only.
> > > +
> > > +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> > > +
> > > +.. cssclass:: longtable
> > > +
> > > +.. flat-table:: Audio Format
> > > +    :header-rows:  1
> > > +    :stub-columns: 0
> > > +    :widths:       3 1 4
> > > +
> > > +    * - Identifier
> > > +      - Code
> > > +      - Details
> > > +    * .. _V4L2-AUDIO-FMT-S8:
> > > +
> > > +      - ``V4L2_AUDIO_FMT_S8``
> > > +      - 'S8'
> > > +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> > > +    * .. _V4L2-AUDIO-FMT-S16-LE: =20
> >
> > Hmm... why can't we just use SNDRV_*_FORMAT_*? Those are already part of
> > an uAPI header. No need to add any abstraction here and/or redefine
> > what is there already at include/uapi/sound/asound.h.
> > =20
> Actually I try to avoid including the include/uapi/sound/asound.h.
> Because in user space, there is another copy in alsa-lib (asoundlib.h).
> There will be conflict in userspace when including videodev2.h and
> asoundlib.h.

Well, alsasoundlib.h seems to be using the same definitions:
	https://github.com/michaelwu/alsa-lib/blob/master/include/pcm.h

So, I can't see what would be the actual issue, as both userspace library
and ALSA internal headers use the same magic numbers.

You can still do things like:

	#ifdef __KERNEL__
	#  include <sound/asound.h>
	#else
	#  include <asoundlib.h>
	#endif

To avoid such kind of conflicts, if you need to have it included on
some header file. Yet, I can't see why you would need that.

IMO, at uAPI headers, you just need to declare the uAPI audiofmt field
to be either __u32 or __u64, pointing it to where this value comes from
(on both userspace and Kernelspace. E. g.:

/**
 * struct v4l2_audio_format - audio data format definition
 * @audioformat:
 *	an integer number matching the fields inside
 *	enum snd_pcm_format_t (e. g. `SNDRV_PCM_FORMAT_*`), as defined
 *	in include/uapi/sound/asound.h and
 *      https://www.alsa-project.org/alsa-doc/alsa-lib/group___p_c_m.html#g=
aa14b7f26877a812acbb39811364177f8.
 * @channels:		channel numbers
 * @buffersize:		maximum size in bytes required for data
 */
struct v4l2_audio_format {
	__u32				audioformat;
	__u32				channels;
	__u32				buffersize;
} __attribute__ ((packed));

Then, at documentation you just need to point to where the
possible values for SNDRV_PCM_FORMAT_ are defined. No need to
document them one by one.

With such definition, you'll only need to include sound/asound.h
within the kAPI scope.

>=20
> And in the V4l framework, the fourcc type is commonly used in other
> cases (video, radio, touch, meta....), to avoid changing common code
> a lot, so I think using fourcc definition for audio may be simpler.

Those are real video streams (or a video-related streams, in the case
of metadata) where fourcc is widely used. There, it makes sense.
However, ALSA format definitions are already being used for a long time.
There's no sense on trying to reinvent it - or having an abstract layer
to convert from/to fourcc <=3D=3D> enum snd_pcm_format_t. Just use what is
there already.

Thanks,
Mauro
