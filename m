Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F5D7F29B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 11:04:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P5IDLlbP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZKjN0SbQz3dHj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 21:04:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P5IDLlbP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZKhY5FKFz3cT0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 21:03:40 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5c210e34088so2811959a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 02:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700561017; x=1701165817; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IdtMPB4/7uJbY1z0IHZnX7eXnXCeIomsPVSXPesfLU=;
        b=P5IDLlbPx0pLEBJj5aIFpVNEaHBE2XCITMgemVvQ0T0DkzWFKVgOkoR9VbRSdSBSpj
         e4ph9lzeMp17Rr2xblFMR2lfpt7fr4ChiwyHRjmy0RmnTnNBF0+yKjQxGNEoPGVnuVC7
         JHLLGuVF9sbYR+UMfvt/QBpTdUCtx8LwwnntGyuDgct94E1NG/fvjU95uaBuhmxYPPPc
         wgiayJAAhrdF66PrNfL59jA8bX/TrAin87WpepA+4WYh+mBKPaiD6fv3LCZUDea5TWLJ
         v21+ZXIASfNRFftJknGvDGX8GuYGxXNlbSR9LtmYwWymZte/CXNGPkpTtWenzaxlTHx6
         rGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700561017; x=1701165817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IdtMPB4/7uJbY1z0IHZnX7eXnXCeIomsPVSXPesfLU=;
        b=wr3ovsHI39VRf4AlNVR/XIeIKqQQO30UrUJdMqqoifNINsrTU2OTliaFPsCyxgKqjX
         HMUgCeO6PybSptWw7yPTFUmVpmwqQyxMj6JtvSfSZuUsBGtfeQxYrTe5oYP9GITdi/4n
         MITlnV9wJe1yYkycebiU3BotBiHVp4Cs+LitfPIPAuA7nhG4pUz2afKaWSTYxbDc1anv
         fNIsmB2rSIdblijFFt218qZXVWmcFrqNeCOY/HbMHRwPV+T2gPWJg5Hodba1LWcJuguf
         nmWwpsJIhW15JglvRK/8K3hY5tD9x8yeg0X3a2aq+R06VrhOaRyoDIfAsaV2thJ+LUh3
         qRTA==
X-Gm-Message-State: AOJu0YycNVXoCOroKkRQtCSqXWmVPhsbjXIkujO1u0s+rCQC6Le/i7YS
	RodBtTA7O2XLGNJWX9lsN9Kxx1sls0ZXCWPY8cc=
X-Google-Smtp-Source: AGHT+IEhDjVYipyrVPlpzBI+rpeAtcq8ah4DfgpqQ7DHBDrltVevTS1J2kec+wzzM8Uup1RKyipn3G5y0qZHiDlY3Xc=
X-Received: by 2002:a05:6a20:914a:b0:18a:df45:fad4 with SMTP id
 x10-20020a056a20914a00b0018adf45fad4mr1762392pzc.37.1700561016867; Tue, 21
 Nov 2023 02:03:36 -0800 (PST)
MIME-Version: 1.0
References: <1700552255-5364-1-git-send-email-shengjiu.wang@nxp.com> <71ce6d8b-90c2-4ef6-9883-129861dcab02@xs4all.nl>
In-Reply-To: <71ce6d8b-90c2-4ef6-9883-129861dcab02@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 21 Nov 2023 18:03:25 +0800
Message-ID: <CAA+D8ANvK5O2TXnjM_YqsHE8ycen9jrw_HXL+eJWtwJ_OZXeJA@mail.gmail.com>
Subject: Re: [PATCH v10 00/14] Add audio support in v4l2 framework
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

On Tue, Nov 21, 2023 at 5:22=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 21/11/2023 08:37, Shengjiu Wang wrote:
> > Audio signal processing also has the requirement for memory to
> > memory similar as Video.
> >
> > This asrc memory to memory (memory ->asrc->memory) case is a non
> > real time use case.
> >
> > User fills the input buffer to the asrc module, after conversion, then =
asrc
> > sends back the output buffer to user. So it is not a traditional ALSA p=
layback
> > and capture case.
> >
> > It is a specific use case,  there is no reference in current kernel.
> > v4l2 memory to memory is the closed implementation,  v4l2 current
> > support video, image, radio, tuner, touch devices, so it is not
> > complicated to add support for this specific audio case.
> >
> > Because we had implemented the "memory -> asrc ->i2s device-> codec"
> > use case in ALSA.  Now the "memory->asrc->memory" needs
> > to reuse the code in asrc driver, so the first 3 patches is for refinin=
g
> > the code to make it can be shared by the "memory->asrc->memory"
> > driver.
> >
> > The main change is in the v4l2 side, A /dev/vl4-audioX will be created,
> > user applications only use the ioctl of v4l2 framework.
> >
> > Other change is to add memory to memory support for two kinds of i.MX A=
SRC
> > module.
> >
> > changes in v10
> > - remove FIXED_POINT type
> > - change code base on media: v4l2-ctrls: add support for fraction_bits
> > - fix issue reported by kernel test robot
> > - remove module_alias
>
> Note that I still need a patch for vivid adding a fixed point test contro=
l.
>
> I think I want two controls: one INTEGER Q16 and one INTEGER64 Q63 (a nic=
e
> corner case).
>

Not sure if we can do like this:

diff --git a/drivers/media/test-drivers/vivid/vivid-core.h
b/drivers/media/test-drivers/vivid/vivid-core.h
index cfb8e66083f6..def8cf6c30c1 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -222,6 +222,8 @@ struct vivid_dev {
        struct v4l2_ctrl                *boolean;
        struct v4l2_ctrl                *int32;
        struct v4l2_ctrl                *int64;
+       struct v4l2_ctrl                *int32Q16;
+       struct v4l2_ctrl                *int64Q63;
        struct v4l2_ctrl                *menu;
        struct v4l2_ctrl                *string;
        struct v4l2_ctrl                *bitmask;
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c
b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index f2b20e25a7a4..c912b6776775 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -182,6 +182,28 @@ static const struct v4l2_ctrl_config vivid_ctrl_int64 =
=3D {
        .step =3D 1,
 };

+static const struct v4l2_ctrl_config vivid_ctrl_int32Q16 =3D {
+       .ops =3D &vivid_user_gen_ctrl_ops,
+       .id =3D VIVID_CID_INTEGER,
+       .name =3D "Integer 32 Bits Q16",
+       .type =3D V4L2_CTRL_TYPE_INTEGER,
+       .min =3D 0xffffffff80000000ULL,
+       .max =3D 0x7fffffff,
+       .step =3D 1,
+       .fraction_bits =3D 16,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_int64Q63 =3D {
+       .ops =3D &vivid_user_gen_ctrl_ops,
+       .id =3D VIVID_CID_INTEGER64,
+       .name =3D "Integer 64 Bits Q63",
+       .type =3D V4L2_CTRL_TYPE_INTEGER64,
+       .min =3D 0x8000000000000000ULL,
+       .max =3D 0x7fffffffffffffffLL,
+       .step =3D 1,
+       .fraction_bits =3D 63,
+};
+
 static const struct v4l2_ctrl_config vivid_ctrl_u32_array =3D {
        .ops =3D &vivid_user_gen_ctrl_ops,
        .id =3D VIVID_CID_U32_ARRAY,
@@ -1670,6 +1692,8 @@ int vivid_create_controls(struct vivid_dev *dev,
bool show_ccs_cap,
        dev->button =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_button, NULL);
        dev->int32 =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_int32, NULL);
        dev->int64 =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_int64, NULL);
+       dev->int32Q16 =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_int32Q16, NULL);
+       dev->int64Q63 =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_int64Q63, NULL);
        dev->boolean =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_boolean, NULL);
        dev->menu =3D v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_menu, =
NULL);
        dev->string =3D v4l2_ctrl_new_custom(hdl_user_gen,
&vivid_ctrl_string, NULL);
(END)


> Regards,
>
>         Hans
>
> >
> > changes in v9:
> > - add MEDIA_ENT_F_PROC_AUDIO_RESAMPLER.
> > - add MEDIA_INTF_T_V4L_AUDIO
> > - add media controller support
> > - refine the vim2m-audio to support 8k<->16k conversion.
> >
> > changes in v8:
> > - refine V4L2_CAP_AUDIO_M2M to be 0x00000008
> > - update doc for FIXED_POINT
> > - address comments for imx-asrc
> >
> > changes in v7:
> > - add acked-by from Mark
> > - separate commit for fixed point, m2m audio class, audio rate controls
> > - use INTEGER_MENU for rate,  FIXED_POINT for rate offset
> > - remove used fmts
> > - address other comments for Hans
> >
> > changes in v6:
> > - use m2m_prepare/m2m_unprepare/m2m_start/m2m_stop to replace
> >   m2m_start_part_one/m2m_stop_part_one, m2m_start_part_two/m2m_stop_par=
t_two.
> > - change V4L2_CTRL_TYPE_ASRC_RATE to V4L2_CTRL_TYPE_FIXED_POINT
> > - fix warning by kernel test rebot
> > - remove some unused format V4L2_AUDIO_FMT_XX
> > - Get SNDRV_PCM_FORMAT from V4L2_AUDIO_FMT in driver.
> > - rename audm2m to viaudm2m.
> >
> > changes in v5:
> > - remove V4L2_AUDIO_FMT_LPCM
> > - define audio pixel format like V4L2_AUDIO_FMT_S8...
> > - remove rate and format in struct v4l2_audio_format.
> > - Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE controls
> > - updata document accordingly.
> >
> > changes in v4:
> > - update document style
> > - separate V4L2_AUDIO_FMT_LPCM and V4L2_CAP_AUDIO_M2M in separate commi=
t
> >
> > changes in v3:
> > - Modify documents for adding audio m2m support
> > - Add audio virtual m2m driver
> > - Defined V4L2_AUDIO_FMT_LPCM format type for audio.
> > - Defined V4L2_CAP_AUDIO_M2M capability type for audio m2m case.
> > - with modification in v4l-utils, pass v4l2-compliance test.
> >
> > changes in v2:
> > - decouple the implementation in v4l2 and ALSA
> > - implement the memory to memory driver as a platfrom driver
> >   and move it to driver/media
> > - move fsl_asrc_common.h to include/sound folder
> >
> > Shengjiu Wang (14):
> >   ASoC: fsl_asrc: define functions for memory to memory usage
> >   ASoC: fsl_easrc: define functions for memory to memory usage
> >   ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
> >   ASoC: fsl_asrc: register m2m platform device
> >   ASoC: fsl_easrc: register m2m platform device
> >   media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
> >   media: v4l2: Add audio capture and output support
> >   media: uapi: Define audio sample format fourcc type
> >   media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
> >   media: uapi: Add audio rate controls support
> >   media: uapi: Declare interface types for Audio
> >   media: uapi: Add an entity type for audio resampler
> >   media: imx-asrc: Add memory to memory driver
> >   media: vim2m-audio: add virtual driver for audio memory to memory
> >
> >  .../media/mediactl/media-types.rst            |   11 +
> >  .../userspace-api/media/v4l/buffer.rst        |    6 +
> >  .../userspace-api/media/v4l/common.rst        |    1 +
> >  .../media/v4l/dev-audio-mem2mem.rst           |   71 +
> >  .../userspace-api/media/v4l/devices.rst       |    1 +
> >  .../media/v4l/ext-ctrls-audio-m2m.rst         |   41 +
> >  .../userspace-api/media/v4l/pixfmt-audio.rst  |   87 ++
> >  .../userspace-api/media/v4l/pixfmt.rst        |    1 +
> >  .../media/v4l/vidioc-enum-fmt.rst             |    2 +
> >  .../media/v4l/vidioc-g-ext-ctrls.rst          |    4 +
> >  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
> >  .../media/v4l/vidioc-querycap.rst             |    3 +
> >  .../media/videodev2.h.rst.exceptions          |    3 +
> >  .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
> >  drivers/media/platform/nxp/Kconfig            |   13 +
> >  drivers/media/platform/nxp/Makefile           |    1 +
> >  drivers/media/platform/nxp/imx-asrc.c         | 1264 +++++++++++++++++
> >  drivers/media/test-drivers/Kconfig            |   11 +
> >  drivers/media/test-drivers/Makefile           |    1 +
> >  drivers/media/test-drivers/vim2m-audio.c      |  799 +++++++++++
> >  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |    9 +
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   10 +
> >  drivers/media/v4l2-core/v4l2-dev.c            |   21 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   66 +
> >  drivers/media/v4l2-core/v4l2-mem2mem.c        |   13 +-
> >  include/media/v4l2-dev.h                      |    2 +
> >  include/media/v4l2-ioctl.h                    |   34 +
> >  .../fsl =3D> include/sound}/fsl_asrc_common.h   |   60 +
> >  include/uapi/linux/media.h                    |    2 +
> >  include/uapi/linux/v4l2-controls.h            |    9 +
> >  include/uapi/linux/videodev2.h                |   41 +
> >  sound/soc/fsl/fsl_asrc.c                      |  144 ++
> >  sound/soc/fsl/fsl_asrc.h                      |    4 +-
> >  sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
> >  sound/soc/fsl/fsl_easrc.c                     |  233 +++
> >  sound/soc/fsl/fsl_easrc.h                     |    6 +-
> >  36 files changed, 2977 insertions(+), 7 deletions(-)
> >  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem=
2mem.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-aud=
io-m2m.rst
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.=
rst
> >  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
> >  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
> >  rename {sound/soc/fsl =3D> include/sound}/fsl_asrc_common.h (60%)
> >
>
