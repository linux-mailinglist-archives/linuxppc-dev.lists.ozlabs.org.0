Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA85A7DE01C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 12:06:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bt8bgit+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL42n6FWGz3cVk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 22:06:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bt8bgit+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL41w0j4zz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 22:06:10 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2802c41b716so3194776a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Nov 2023 04:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698836768; x=1699441568; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dArM6zmYx3FOnkvGIUE8xI49PNFQdgtFB0ocOl6ka7Y=;
        b=bt8bgit+qp+KHsercNZHHXjvuWoa2MQt0zhbU/z38Eb0Cb5aPxUINTQFA7ecRYjPPb
         eoUDm69NhZh/XvkNxyuTkfKKIjEoifyz1fawNHqTt9MrriNdIz0o/1zvAAArXUBpiVKy
         0WFB85ro9s+oNe0rl711loJ/HSRYdEm3zd3jA5uYd0enTr9+R8eL0+jcLPgmEwxqYaNH
         qs8xqkyPbZp0cp02fedodU4qZpqZc9+2Hs3G7q2tXrmF7Kq5x5K1P+LGdZffJ1ZzwIpq
         DVv4oGjXOo7wB+elg3qJwgrPVUEMUKESFQkBTCVbSUn2QP7XgQLQ3OhileKVd/0oFcSV
         ftAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836768; x=1699441568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dArM6zmYx3FOnkvGIUE8xI49PNFQdgtFB0ocOl6ka7Y=;
        b=gWNOP6LM1ucxZd8ziuxNRqleCZ6PLgCIGottGskpvhW3hxPwEiK7PpwJFWehfquEzJ
         fTA4+cTju1N2QmJ4ZgrrjdUnwux0+Hkr37GbYoIdQQyPR2ETVgY+oK9/N8Uqf75SDRZ9
         faHuv+njap6Umwcg+kHfPqeOEH8qsHYriXyNxrNgMwHuh5mFPzK94PfhYRXY4etmtCg1
         8AK0VU54i4tg8FYmUQdFpEOsbxcyx0SFGctghskUSJ6YafP4An3Uy5pYBhq0XZKCGPf7
         JxBp41UUjPK/Oqx00Zz2e24t3VNiJLe695IWqW2xDkVoCJtnwThU2dqVcDD0QZPYk34B
         +J0w==
X-Gm-Message-State: AOJu0YyEk/Zqzt574Kl7v2LEnjU1tsYKZlvqIYR0Z0Hq0juT80pBuBT6
	Ej+6tH5w36YMY26jtB7yk7e8ijH4YEPh/6KvFzc=
X-Google-Smtp-Source: AGHT+IFa4/88Y8aoZg93TUyc6RlxW2Rv1MZsuL3fqtLE2emZD4ASH4FWrbqSA5szVDQReIiLDE0r8zE7vFwfkGAJK+4=
X-Received: by 2002:a17:90a:134c:b0:280:35ce:5e0f with SMTP id
 y12-20020a17090a134c00b0028035ce5e0fmr7734215pjf.11.1698836767703; Wed, 01
 Nov 2023 04:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <1698402948-10618-1-git-send-email-shengjiu.wang@nxp.com>
 <c1cfa3e0-6e5d-4e1d-b6e0-4d1045196a11@xs4all.nl> <CAA+D8AOCujL-eD2-chqHAW7UN7UmLrO6CWRd7d6wTCPP8=VyfA@mail.gmail.com>
In-Reply-To: <CAA+D8AOCujL-eD2-chqHAW7UN7UmLrO6CWRd7d6wTCPP8=VyfA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 1 Nov 2023 19:05:56 +0800
Message-ID: <CAA+D8AOHk1pqoESetVerywkJMPX8A57m5kMXTk5GVETstE6fCg@mail.gmail.com>
Subject: Re: [RFC PATCH v8 00/13] Add audio support in v4l2 framework
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

On Mon, Oct 30, 2023 at 9:56=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> On Fri, Oct 27, 2023 at 7:18=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl>=
 wrote:
> >
> > Hi Shengjiu,
> >
> > Is there a reason why this series is still marked RFC?
> >
> > Just wondering about that.
>
> In the very beginning I started this series with RFC, So
> I still use RFC now...
>

Should I resend patches which remove the 'RFC'?

Best regards
Wang shengjiu

> >
> > Regards,
> >
> >         Hans
> >
> > On 27/10/2023 12:35, Shengjiu Wang wrote:
> > > Audio signal processing also has the requirement for memory to
> > > memory similar as Video.
> > >
> > > This asrc memory to memory (memory ->asrc->memory) case is a non
> > > real time use case.
> > >
> > > User fills the input buffer to the asrc module, after conversion, the=
n asrc
> > > sends back the output buffer to user. So it is not a traditional ALSA=
 playback
> > > and capture case.
> > >
> > > It is a specific use case,  there is no reference in current kernel.
> > > v4l2 memory to memory is the closed implementation,  v4l2 current
> > > support video, image, radio, tuner, touch devices, so it is not
> > > complicated to add support for this specific audio case.
> > >
> > > Because we had implemented the "memory -> asrc ->i2s device-> codec"
> > > use case in ALSA.  Now the "memory->asrc->memory" needs
> > > to reuse the code in asrc driver, so the first 3 patches is for refin=
ing
> > > the code to make it can be shared by the "memory->asrc->memory"
> > > driver.
> > >
> > > The main change is in the v4l2 side, A /dev/vl4-audioX will be create=
d,
> > > user applications only use the ioctl of v4l2 framework.
> > >
> > > Other change is to add memory to memory support for two kinds of i.MX=
 ASRC
> > > module.
> > >
> > > changes in v8:
> > > - refine V4L2_CAP_AUDIO_M2M to be 0x00000008
> > > - update doc for FIXED_POINT
> > > - address comments for imx-asrc
> > >
> > > changes in v7:
> > > - add acked-by from Mark
> > > - separate commit for fixed point, m2m audio class, audio rate contro=
ls
> > > - use INTEGER_MENU for rate,  FIXED_POINT for rate offset
> > > - remove used fmts
> > > - address other comments for Hans
> > >
> > > changes in v6:
> > > - use m2m_prepare/m2m_unprepare/m2m_start/m2m_stop to replace
> > >   m2m_start_part_one/m2m_stop_part_one, m2m_start_part_two/m2m_stop_p=
art_two.
> > > - change V4L2_CTRL_TYPE_ASRC_RATE to V4L2_CTRL_TYPE_FIXED_POINT
> > > - fix warning by kernel test rebot
> > > - remove some unused format V4L2_AUDIO_FMT_XX
> > > - Get SNDRV_PCM_FORMAT from V4L2_AUDIO_FMT in driver.
> > > - rename audm2m to viaudm2m.
> > >
> > > changes in v5:
> > > - remove V4L2_AUDIO_FMT_LPCM
> > > - define audio pixel format like V4L2_AUDIO_FMT_S8...
> > > - remove rate and format in struct v4l2_audio_format.
> > > - Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE controls
> > > - updata document accordingly.
> > >
> > > changes in v4:
> > > - update document style
> > > - separate V4L2_AUDIO_FMT_LPCM and V4L2_CAP_AUDIO_M2M in separate com=
mit
> > >
> > > changes in v3:
> > > - Modify documents for adding audio m2m support
> > > - Add audio virtual m2m driver
> > > - Defined V4L2_AUDIO_FMT_LPCM format type for audio.
> > > - Defined V4L2_CAP_AUDIO_M2M capability type for audio m2m case.
> > > - with modification in v4l-utils, pass v4l2-compliance test.
> > >
> > > changes in v2:
> > > - decouple the implementation in v4l2 and ALSA
> > > - implement the memory to memory driver as a platfrom driver
> > >   and move it to driver/media
> > > - move fsl_asrc_common.h to include/sound folder
> > >
> > > Shengjiu Wang (13):
> > >   ASoC: fsl_asrc: define functions for memory to memory usage
> > >   ASoC: fsl_easrc: define functions for memory to memory usage
> > >   ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
> > >   ASoC: fsl_asrc: register m2m platform device
> > >   ASoC: fsl_easrc: register m2m platform device
> > >   media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
> > >   media: v4l2: Add audio capture and output support
> > >   media: uapi: Define audio sample format fourcc type
> > >   media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
> > >   media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
> > >   media: uapi: Add audio rate controls support
> > >   media: imx-asrc: Add memory to memory driver
> > >   media: vim2m_audio: add virtual driver for audio memory to memory
> > >
> > >  .../userspace-api/media/v4l/buffer.rst        |    6 +
> > >  .../userspace-api/media/v4l/common.rst        |    1 +
> > >  .../media/v4l/dev-audio-mem2mem.rst           |   71 +
> > >  .../userspace-api/media/v4l/devices.rst       |    1 +
> > >  .../media/v4l/ext-ctrls-audio-m2m.rst         |   41 +
> > >  .../userspace-api/media/v4l/pixfmt-audio.rst  |   87 ++
> > >  .../userspace-api/media/v4l/pixfmt.rst        |    1 +
> > >  .../media/v4l/vidioc-enum-fmt.rst             |    2 +
> > >  .../media/v4l/vidioc-g-ext-ctrls.rst          |   17 +-
> > >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
> > >  .../media/v4l/vidioc-querycap.rst             |    3 +
> > >  .../media/v4l/vidioc-queryctrl.rst            |    9 +-
> > >  .../media/videodev2.h.rst.exceptions          |    4 +
> > >  .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
> > >  drivers/media/platform/nxp/Kconfig            |   12 +
> > >  drivers/media/platform/nxp/Makefile           |    1 +
> > >  drivers/media/platform/nxp/imx-asrc.c         | 1186 +++++++++++++++=
++
> > >  drivers/media/test-drivers/Kconfig            |    9 +
> > >  drivers/media/test-drivers/Makefile           |    1 +
> > >  drivers/media/test-drivers/vim2m_audio.c      |  680 ++++++++++
> > >  drivers/media/v4l2-core/v4l2-ctrls-api.c      |    5 +-
> > >  drivers/media/v4l2-core/v4l2-ctrls-core.c     |    2 +
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   16 +
> > >  drivers/media/v4l2-core/v4l2-dev.c            |   17 +
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |   66 +
> > >  include/media/v4l2-dev.h                      |    2 +
> > >  include/media/v4l2-ioctl.h                    |   34 +
> > >  .../fsl =3D> include/sound}/fsl_asrc_common.h   |   60 +
> > >  include/uapi/linux/v4l2-controls.h            |    9 +
> > >  include/uapi/linux/videodev2.h                |   42 +
> > >  sound/soc/fsl/fsl_asrc.c                      |  144 ++
> > >  sound/soc/fsl/fsl_asrc.h                      |    4 +-
> > >  sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
> > >  sound/soc/fsl/fsl_easrc.c                     |  233 ++++
> > >  sound/soc/fsl/fsl_easrc.h                     |    6 +-
> > >  35 files changed, 2771 insertions(+), 11 deletions(-)
> > >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-m=
em2mem.rst
> > >  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-a=
udio-m2m.rst
> > >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audi=
o.rst
> > >  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
> > >  create mode 100644 drivers/media/test-drivers/vim2m_audio.c
> > >  rename {sound/soc/fsl =3D> include/sound}/fsl_asrc_common.h (60%)
> > >
> >
