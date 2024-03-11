Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4273F8779BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 03:08:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OJiAV4Bn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtKtY0J1zz3dSj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 13:08:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OJiAV4Bn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtKsq1GMgz3cFX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 13:07:25 +1100 (AEDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3663c6fba33so15323525ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Mar 2024 19:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710122842; x=1710727642; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEz2Pe4E4OEDHLyalXPDDQI2Ud+GHImTN6uJ1DNtdwA=;
        b=OJiAV4BnChUtJvtPBRCbxrs+Tw0fUX72K8lCkAnahxpL+FOC6xj1AfamlbCeUXCQM0
         6mXL2lNiMeG8g+Q2kibV1bsA1WaFKfe4aVLuUrY2FAyM6RSMClHjZVBVS4/gYYzglgPA
         11SBK8Ok0sQZU6DIkOvqF6t+h46euaK8IJXg1O5SApRiCqetTVytT9aLmf1D6BD1i59c
         y1PuxghzXlD8/iNzdLe//q6EYttz6spzyNfktCa4VqeHJJV68sFReffdhSyV2cwTno1R
         uaTil3K+P3Y9QWpRsohEsUXI5sOF1snCnGDISu9iJzdBTVCOSgJlfy26iH6ZTKpW+zt9
         8vHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710122842; x=1710727642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEz2Pe4E4OEDHLyalXPDDQI2Ud+GHImTN6uJ1DNtdwA=;
        b=qD0+xglMcx8iGuPiKaj6L3GjoFwgSqElDYZWWyISunJARCpSdPZM/Tgjqy7JU0wsUQ
         M+Gl7kxXw4oEDP+xHpMiXETncTUxHjiNMUkhTHP7Fw2hSh2AqkKqTiY4c1cVHDsh+nwW
         Zn7d4NKvYFpirDKqYM0tMZ8n0LYJLydDyA7N6Q2IUVJGchJDCisScXT95AB4lRoVzNNS
         9t4SEsHA4TBrYdUCmleZsTU5pGoDyuk+P3IQj2GbjIGCjZl0lEQTucJrXSVYDihRtf+Q
         ymBAZDDol+18wn//0NTKNNByYLYSsFN/YQOFsAy+Xv3SGObb5Szda7J+Ob/bkcUNDyE0
         +9Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUCQJxEzWqYMLLIjWOlvh6FsDPxJRY47YeGCwztBGSzMzw2thOayAWs3v3TNmOE+JVx1v07mo7/14DC1XE57eHqBi20B4y8DjN+v8UUZA==
X-Gm-Message-State: AOJu0Yw1urBtGO3oZihkyLTnO2qH8Y6/iUzoVSgVuKziJHkIU6VoNFdw
	KrzS8VStFcvMIaA9gJqGOEvLMQwReX0nb+vfWudnxWr4a67CSpRwQ4jgSIWeJTmeeKoW83Dh4OL
	u8+Qh1Ao2W/596ef5bKNB7aOvvtI=
X-Google-Smtp-Source: AGHT+IF/lnqcjWzW+G8WdqGNI/KIXgka6mAlaezEMzVMInE6YrZ1sB/1P5ojtj4PJnvVguFLVYMBSVjr/5Jp23D7owk=
X-Received: by 2002:a92:d790:0:b0:366:43bd:f0f5 with SMTP id
 d16-20020a92d790000000b0036643bdf0f5mr4061732iln.17.1710122842300; Sun, 10
 Mar 2024 19:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <1708936109-11587-1-git-send-email-shengjiu.wang@nxp.com>
 <1708936109-11587-10-git-send-email-shengjiu.wang@nxp.com>
 <df05261f-2f0e-490f-883b-72ad8a02d11b@xs4all.nl> <CAA+D8AMJOCfp6WdqYqy7KSj=mX9o_D5U-aF6Wn=3cOnhWg7VDg@mail.gmail.com>
 <56368a0d-6ada-4ab6-8389-b4bd20d6efc4@xs4all.nl> <CAA+D8AOXKJP1r-+j0QiH82x3MQ+Y1y2c1h04n=jmJncPogn7Vg@mail.gmail.com>
 <c3dbbc57-2df4-4c88-98e3-0500910404c4@xs4all.nl>
In-Reply-To: <c3dbbc57-2df4-4c88-98e3-0500910404c4@xs4all.nl>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 11 Mar 2024 10:07:10 +0800
Message-ID: <CAA+D8AM4c6uo7pPJWHNCx1N1ZeiJO9qThy+dcSo1Mk9mRX9E8Q@mail.gmail.com>
Subject: Re: [PATCH v13 09/16] media: uapi: Define audio sample format fourcc type
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

On Fri, Mar 8, 2024 at 10:04=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 08/03/2024 2:52 pm, Shengjiu Wang wrote:
> > On Fri, Mar 8, 2024 at 8:06=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl=
> wrote:
> >>
> >> On 08/03/2024 12:52 pm, Shengjiu Wang wrote:
> >>> On Fri, Mar 8, 2024 at 3:34=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.=
nl> wrote:
> >>>>
> >>>> Hi Shengjiu,
> >>>>
> >>>> After thinking it over I think this patch can be improved:
> >>>>
> >>>> On 26/02/2024 9:28 am, Shengjiu Wang wrote:
> >>>>> The audio sample format definition is from alsa,
> >>>>> the header file is include/uapi/sound/asound.h, but
> >>>>> don't include this header file directly, because in
> >>>>> user space, there is another copy in alsa-lib.
> >>>>> There will be conflict in userspace for include
> >>>>> videodev2.h & asound.h and asoundlib.h
> >>>>>
> >>>>> Here still use the fourcc format.
> >>>>>
> >>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>>> ---
> >>>>>  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++=
++++
> >>>>>  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
> >>>>>  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
> >>>>>  include/uapi/linux/videodev2.h                | 23 +++++
> >>>>>  4 files changed, 124 insertions(+)
> >>>>>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-au=
dio.rst
> >>>>>
> >>>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst=
 b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> >>>>> new file mode 100644
> >>>>> index 000000000000..04b4a7fbd8f4
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
> >>>>> @@ -0,0 +1,87 @@
> >>>>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> >>>>> +
> >>>>> +.. _pixfmt-audio:
> >>>>> +
> >>>>> +*************
> >>>>> +Audio Formats
> >>>>> +*************
> >>>>> +
> >>>>> +These formats are used for :ref:`audiomem2mem` interface only.
> >>>>
> >>>> Here you should also document that all these fourccs start with 'AU'=
 and are
> >>>> reserved for mappings of the snd_pcm_format_t type.
> >>>>
> >>>> Also document the v4l2_fourcc_to_audfmt define and the v4l2_audfmt_t=
o_fourcc
> >>>> define (see also below).
> >>>
> >>> How about below description?
> >>> '
> >>> All these fourccs starting with 'AU' are reserved for mappings
> >>
> >> All these fourccs -> All FourCCs
> >>
> >>> of the snd_pcm_format_t type.
> >>>
> >>> The v4l2_audfmt_to_fourcc() is defined to convert snd_pcm_format_t
> >>
> >> convert -> convert the
> >>
> >>> type to fourcc. The first character is 'A', the second character
> >>
> >> fourcc -> a FourCC
> >>
> >>> is 'U', the third character is ten's digit of snd_pcm_format_t,
> >>> the fourth character is unit's digit of snd_pcm_format_t.
> >>
> >> "is 'U', and the remaining two characters is the snd_pcm_format_t
> >> value in ASCII. Example: SNDRV_PCM_FORMAT_S16_LE (with value 2)
> >> maps to 'AU02' and SNDRV_PCM_FORMAT_S24_3LE (with value 32) maps
> >> to 'AU32'."
> >>
> >>>
> >>> The v4l2_fourcc_to_audfmt() is defined to convert these fourccs to
> >>
> >> fourccs -> FourCCs
> >>
> >>> snd_pcm_format_t type.
> >>
> >> BTW, given the way snd_pcm_format_t is defined I am fairly certain
> >> some casts are needed for the v4l2_audfmt_to_fourcc define.
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>> '
> >>> Best regards
> >>> Shengjiu Wang
> >>>>
> >>>>> +
> >>>>> +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
> >>>>> +
> >>>>> +.. cssclass:: longtable
> >>>>> +
> >>>>> +.. flat-table:: Audio Format
> >>>>> +    :header-rows:  1
> >>>>> +    :stub-columns: 0
> >>>>> +    :widths:       3 1 4
> >>>>> +
> >>>>> +    * - Identifier
> >>>>> +      - Code
> >>>>> +      - Details
> >>>>> +    * .. _V4L2-AUDIO-FMT-S8:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S8``
> >>>>> +      - 'S8'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-S16-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S16_LE``
> >>>>> +      - 'S16_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S16_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-U16-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_U16_LE``
> >>>>> +      - 'U16_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_U16_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-S24-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S24_LE``
> >>>>> +      - 'S24_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-U24-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_U24_LE``
> >>>>> +      - 'U24_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_U24_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-S32-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S32_LE``
> >>>>> +      - 'S32_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S32_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-U32-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_U32_LE``
> >>>>> +      - 'U32_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_U32_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-FLOAT-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_FLOAT_LE``
> >>>>> +      - 'FLOAT_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``
> >>>>> +      - 'IEC958_SUBFRAME_LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-S24-3LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S24_3LE``
> >>>>> +      - 'S24_3LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-U24-3LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_U24_3LE``
> >>>>> +      - 'U24_3LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_U24_3LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-S20-3LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_S20_3LE``
> >>>>> +      - 'S20_3LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
> >>>>> +    * .. _V4L2-AUDIO-FMT-U20-3LE:
> >>>>> +
> >>>>> +      - ``V4L2_AUDIO_FMT_U20_3LE``
> >>>>> +      - 'U20_3LE'
> >>>>> +      - Corresponds to SNDRV_PCM_FORMAT_U20_3LE in ALSA
> >>>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Doc=
umentation/userspace-api/media/v4l/pixfmt.rst
> >>>>> index 11dab4a90630..2eb6fdd3b43d 100644
> >>>>> --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
> >>>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
> >>>>> @@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
> >>>>>      colorspaces
> >>>>>      colorspaces-defs
> >>>>>      colorspaces-details
> >>>>> +    pixfmt-audio
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v=
4l2-core/v4l2-ioctl.c
> >>>>> index 961abcdf7290..be229c69e991 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>> @@ -1471,6 +1471,19 @@ static void v4l_fill_fmtdesc(struct v4l2_fmt=
desc *fmt)
> >>>>>       case V4L2_PIX_FMT_Y210:         descr =3D "10-bit YUYV Packed=
"; break;
> >>>>>       case V4L2_PIX_FMT_Y212:         descr =3D "12-bit YUYV Packed=
"; break;
> >>>>>       case V4L2_PIX_FMT_Y216:         descr =3D "16-bit YUYV Packed=
"; break;
> >>>>> +     case V4L2_AUDIO_FMT_S8:         descr =3D "8-bit Signed"; bre=
ak;
> >>>>> +     case V4L2_AUDIO_FMT_S16_LE:     descr =3D "16-bit Signed LE";=
 break;
> >>>>> +     case V4L2_AUDIO_FMT_U16_LE:             descr =3D "16-bit Uns=
igned LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_S24_LE:             descr =3D "24(32)-bit=
 Signed LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_U24_LE:             descr =3D "24(32)-bit=
 Unsigned LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_S32_LE:             descr =3D "32-bit Sig=
ned LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_U32_LE:             descr =3D "32-bit Uns=
igned LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_FLOAT_LE:           descr =3D "32-bit Flo=
at LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE: descr =3D "32-bit IEC=
958 LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_S24_3LE:            descr =3D "24(24)-bit=
 Signed LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_U24_3LE:            descr =3D "24(24)-bit=
 Unsigned LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_S20_3LE:            descr =3D "20(24)-bit=
 Signed LE"; break;
> >>>>> +     case V4L2_AUDIO_FMT_U20_3LE:            descr =3D "20(24)-bit=
 Unsigned LE"; break;
> >>>>>
> >>>>>       default:
> >>>>>               /* Compressed formats */
> >>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vi=
deodev2.h
> >>>>> index 2c03d2dfadbe..673a6235a029 100644
> >>>>> --- a/include/uapi/linux/videodev2.h
> >>>>> +++ b/include/uapi/linux/videodev2.h
> >>>>> @@ -843,6 +843,29 @@ struct v4l2_pix_format {
> >>>>>  #define V4L2_META_FMT_RK_ISP1_PARAMS v4l2_fourcc('R', 'K', '1', 'P=
') /* Rockchip ISP1 3A Parameters */
> >>>>>  #define V4L2_META_FMT_RK_ISP1_STAT_3A        v4l2_fourcc('R', 'K',=
 '1', 'S') /* Rockchip ISP1 3A Statistics */
> >>>>>
> >>>>> +/*
> >>>>> + * Audio-data formats
> >>>>> + * All these audio formats use a fourcc starting with 'AU'
> >>>>> + * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
> >>>>
> >>>> Also document here that fourccs starting with 'AU' are reserved for
> >>>> the snd_pcm_format_t to fourcc mappings.
> >>>>
> >>>> That to avoid that someone adds a 'AUXX' fourcc later.
> >>>>
> >>>>> + */
> >>>>> +#define V4L2_AUDIO_FMT_S8                    v4l2_fourcc('A', 'U',=
 '0', '0')
> >>>>> +#define V4L2_AUDIO_FMT_S16_LE                        v4l2_fourcc('=
A', 'U', '0', '2')
> >>>>> +#define V4L2_AUDIO_FMT_U16_LE                        v4l2_fourcc('=
A', 'U', '0', '4')
> >>>>> +#define V4L2_AUDIO_FMT_S24_LE                        v4l2_fourcc('=
A', 'U', '0', '6')
> >>>>> +#define V4L2_AUDIO_FMT_U24_LE                        v4l2_fourcc('=
A', 'U', '0', '8')
> >>>>> +#define V4L2_AUDIO_FMT_S32_LE                        v4l2_fourcc('=
A', 'U', '1', '0')
> >>>>> +#define V4L2_AUDIO_FMT_U32_LE                        v4l2_fourcc('=
A', 'U', '1', '2')
> >>>>> +#define V4L2_AUDIO_FMT_FLOAT_LE                      v4l2_fourcc('=
A', 'U', '1', '4')
> >>>>> +#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE    v4l2_fourcc('A', 'U',=
 '1', '8')
> >>>>> +#define V4L2_AUDIO_FMT_S24_3LE                       v4l2_fourcc('=
A', 'U', '3', '2')
> >>>>> +#define V4L2_AUDIO_FMT_U24_3LE                       v4l2_fourcc('=
A', 'U', '3', '4')
> >>>>> +#define V4L2_AUDIO_FMT_S20_3LE                       v4l2_fourcc('=
A', 'U', '3', '6')
> >>>>> +#define V4L2_AUDIO_FMT_U20_3LE                       v4l2_fourcc('=
A', 'U', '3', '8')
> >>>>> +
> >>>>> +#define v4l2_fourcc_to_audfmt(fourcc)        \
> >>>>> +     (__force snd_pcm_format_t)(((((fourcc) >> 16) & 0xff) - '0') =
* 10  \
> >>>>> +                                + ((((fourcc) >> 24) & 0xff) - '0'=
))
> >>>>> +
> >>>>
> >>>> As I suggested in an earlier reply, add this:
> >>>>
> >>>> #define v4l2_audfmt_to_fourcc(audfmt) \
> >>>>         v4l2_fourcc('A', 'U', '0' + (audfmt) / 10, '0' + (audfmt) % =
10)
> >>>>
> >>>> Even though it is not used in the drivers, since this is a public he=
ader used
> >>>> by drivers and applications, it makes sense to provide the reverse m=
apping as well.
> >>>>
> >>>> Please test it in actual code to make sure there are no compilation =
warnings.
> >
> > I test this definition, the compiler doesn't report warning.
>
> typedef int __bitwise snd_pcm_format_t;
>
> And __bitwise is apparently a sparse static analyzer attribute, so I susp=
ect that the
> v4l2_audfmt_to_fourcc definition will cause a sparse warning. So you need=
 to check
> with sparse.
>

Thanks,  with sparse there is warning, I will fix it.

best regards
Shengjiu Wang

> Regards,
>
>         Hans
>
> >
> > best regards
> > Shengjiu Wang
> >
> >>>>
> >>>> Regards,
> >>>>
> >>>>         Hans
> >>>>
> >>>>>  /* priv field value to indicates that subsequent fields are valid.=
 */
> >>>>>  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe
> >>>>>
> >>>>
> >>
>
