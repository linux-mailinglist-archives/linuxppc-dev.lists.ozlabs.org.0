Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 886B88763FA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 13:07:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrlKM2mR4z3vZ6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 23:07:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=ogpy=ko=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrlJv0KYBz3dTS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 23:06:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B65D1CE13C1;
	Fri,  8 Mar 2024 12:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87FFC433C7;
	Fri,  8 Mar 2024 12:06:47 +0000 (UTC)
Message-ID: <56368a0d-6ada-4ab6-8389-b4bd20d6efc4@xs4all.nl>
Date: Fri, 8 Mar 2024 13:06:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/16] media: uapi: Define audio sample format fourcc
 type
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <1708936109-11587-1-git-send-email-shengjiu.wang@nxp.com>
 <1708936109-11587-10-git-send-email-shengjiu.wang@nxp.com>
 <df05261f-2f0e-490f-883b-72ad8a02d11b@xs4all.nl>
 <CAA+D8AMJOCfp6WdqYqy7KSj=mX9o_D5U-aF6Wn=3cOnhWg7VDg@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CAA+D8AMJOCfp6WdqYqy7KSj=mX9o_D5U-aF6Wn=3cOnhWg7VDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 08/03/2024 12:52 pm, Shengjiu Wang wrote:
> On Fri, Mar 8, 2024 at 3:34 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Shengjiu,
>>
>> After thinking it over I think this patch can be improved:
>>
>> On 26/02/2024 9:28 am, Shengjiu Wang wrote:
>>> The audio sample format definition is from alsa,
>>> the header file is include/uapi/sound/asound.h, but
>>> don't include this header file directly, because in
>>> user space, there is another copy in alsa-lib.
>>> There will be conflict in userspace for include
>>> videodev2.h & asound.h and asoundlib.h
>>>
>>> Here still use the fourcc format.
>>>
>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>> ---
>>>  .../userspace-api/media/v4l/pixfmt-audio.rst  | 87 +++++++++++++++++++
>>>  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
>>>  drivers/media/v4l2-core/v4l2-ioctl.c          | 13 +++
>>>  include/uapi/linux/videodev2.h                | 23 +++++
>>>  4 files changed, 124 insertions(+)
>>>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-audio.rst b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
>>> new file mode 100644
>>> index 000000000000..04b4a7fbd8f4
>>> --- /dev/null
>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt-audio.rst
>>> @@ -0,0 +1,87 @@
>>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>>> +
>>> +.. _pixfmt-audio:
>>> +
>>> +*************
>>> +Audio Formats
>>> +*************
>>> +
>>> +These formats are used for :ref:`audiomem2mem` interface only.
>>
>> Here you should also document that all these fourccs start with 'AU' and are
>> reserved for mappings of the snd_pcm_format_t type.
>>
>> Also document the v4l2_fourcc_to_audfmt define and the v4l2_audfmt_to_fourcc
>> define (see also below).
> 
> How about below description?
> '
> All these fourccs starting with 'AU' are reserved for mappings

All these fourccs -> All FourCCs

> of the snd_pcm_format_t type.
> 
> The v4l2_audfmt_to_fourcc() is defined to convert snd_pcm_format_t

convert -> convert the

> type to fourcc. The first character is 'A', the second character

fourcc -> a FourCC

> is 'U', the third character is ten's digit of snd_pcm_format_t,
> the fourth character is unit's digit of snd_pcm_format_t.

"is 'U', and the remaining two characters is the snd_pcm_format_t
value in ASCII. Example: SNDRV_PCM_FORMAT_S16_LE (with value 2)
maps to 'AU02' and SNDRV_PCM_FORMAT_S24_3LE (with value 32) maps
to 'AU32'."

> 
> The v4l2_fourcc_to_audfmt() is defined to convert these fourccs to

fourccs -> FourCCs

> snd_pcm_format_t type.

BTW, given the way snd_pcm_format_t is defined I am fairly certain
some casts are needed for the v4l2_audfmt_to_fourcc define.

Regards,

	Hans

> '
> Best regards
> Shengjiu Wang
>>
>>> +
>>> +.. tabularcolumns:: |p{5.8cm}|p{1.2cm}|p{10.3cm}|
>>> +
>>> +.. cssclass:: longtable
>>> +
>>> +.. flat-table:: Audio Format
>>> +    :header-rows:  1
>>> +    :stub-columns: 0
>>> +    :widths:       3 1 4
>>> +
>>> +    * - Identifier
>>> +      - Code
>>> +      - Details
>>> +    * .. _V4L2-AUDIO-FMT-S8:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_S8``
>>> +      - 'S8'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_S8 in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-S16-LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_S16_LE``
>>> +      - 'S16_LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_S16_LE in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-U16-LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_U16_LE``
>>> +      - 'U16_LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_U16_LE in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-S24-LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_S24_LE``
>>> +      - 'S24_LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_LE in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-U24-LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_U24_LE``
>>> +      - 'U24_LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_U24_LE in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-S32-LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_S32_LE``
>>> +      - 'S32_LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_S32_LE in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-U32-LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_U32_LE``
>>> +      - 'U32_LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_U32_LE in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-FLOAT-LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_FLOAT_LE``
>>> +      - 'FLOAT_LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_FLOAT_LE in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-IEC958-SUBFRAME-LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE``
>>> +      - 'IEC958_SUBFRAME_LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-S24-3LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_S24_3LE``
>>> +      - 'S24_3LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-U24-3LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_U24_3LE``
>>> +      - 'U24_3LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_U24_3LE in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-S20-3LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_S20_3LE``
>>> +      - 'S20_3LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_S24_3LE in ALSA
>>> +    * .. _V4L2-AUDIO-FMT-U20-3LE:
>>> +
>>> +      - ``V4L2_AUDIO_FMT_U20_3LE``
>>> +      - 'U20_3LE'
>>> +      - Corresponds to SNDRV_PCM_FORMAT_U20_3LE in ALSA
>>> diff --git a/Documentation/userspace-api/media/v4l/pixfmt.rst b/Documentation/userspace-api/media/v4l/pixfmt.rst
>>> index 11dab4a90630..2eb6fdd3b43d 100644
>>> --- a/Documentation/userspace-api/media/v4l/pixfmt.rst
>>> +++ b/Documentation/userspace-api/media/v4l/pixfmt.rst
>>> @@ -36,3 +36,4 @@ see also :ref:`VIDIOC_G_FBUF <VIDIOC_G_FBUF>`.)
>>>      colorspaces
>>>      colorspaces-defs
>>>      colorspaces-details
>>> +    pixfmt-audio
>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> index 961abcdf7290..be229c69e991 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> @@ -1471,6 +1471,19 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>>>       case V4L2_PIX_FMT_Y210:         descr = "10-bit YUYV Packed"; break;
>>>       case V4L2_PIX_FMT_Y212:         descr = "12-bit YUYV Packed"; break;
>>>       case V4L2_PIX_FMT_Y216:         descr = "16-bit YUYV Packed"; break;
>>> +     case V4L2_AUDIO_FMT_S8:         descr = "8-bit Signed"; break;
>>> +     case V4L2_AUDIO_FMT_S16_LE:     descr = "16-bit Signed LE"; break;
>>> +     case V4L2_AUDIO_FMT_U16_LE:             descr = "16-bit Unsigned LE"; break;
>>> +     case V4L2_AUDIO_FMT_S24_LE:             descr = "24(32)-bit Signed LE"; break;
>>> +     case V4L2_AUDIO_FMT_U24_LE:             descr = "24(32)-bit Unsigned LE"; break;
>>> +     case V4L2_AUDIO_FMT_S32_LE:             descr = "32-bit Signed LE"; break;
>>> +     case V4L2_AUDIO_FMT_U32_LE:             descr = "32-bit Unsigned LE"; break;
>>> +     case V4L2_AUDIO_FMT_FLOAT_LE:           descr = "32-bit Float LE"; break;
>>> +     case V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE: descr = "32-bit IEC958 LE"; break;
>>> +     case V4L2_AUDIO_FMT_S24_3LE:            descr = "24(24)-bit Signed LE"; break;
>>> +     case V4L2_AUDIO_FMT_U24_3LE:            descr = "24(24)-bit Unsigned LE"; break;
>>> +     case V4L2_AUDIO_FMT_S20_3LE:            descr = "20(24)-bit Signed LE"; break;
>>> +     case V4L2_AUDIO_FMT_U20_3LE:            descr = "20(24)-bit Unsigned LE"; break;
>>>
>>>       default:
>>>               /* Compressed formats */
>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>>> index 2c03d2dfadbe..673a6235a029 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -843,6 +843,29 @@ struct v4l2_pix_format {
>>>  #define V4L2_META_FMT_RK_ISP1_PARAMS v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
>>>  #define V4L2_META_FMT_RK_ISP1_STAT_3A        v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
>>>
>>> +/*
>>> + * Audio-data formats
>>> + * All these audio formats use a fourcc starting with 'AU'
>>> + * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
>>
>> Also document here that fourccs starting with 'AU' are reserved for
>> the snd_pcm_format_t to fourcc mappings.
>>
>> That to avoid that someone adds a 'AUXX' fourcc later.
>>
>>> + */
>>> +#define V4L2_AUDIO_FMT_S8                    v4l2_fourcc('A', 'U', '0', '0')
>>> +#define V4L2_AUDIO_FMT_S16_LE                        v4l2_fourcc('A', 'U', '0', '2')
>>> +#define V4L2_AUDIO_FMT_U16_LE                        v4l2_fourcc('A', 'U', '0', '4')
>>> +#define V4L2_AUDIO_FMT_S24_LE                        v4l2_fourcc('A', 'U', '0', '6')
>>> +#define V4L2_AUDIO_FMT_U24_LE                        v4l2_fourcc('A', 'U', '0', '8')
>>> +#define V4L2_AUDIO_FMT_S32_LE                        v4l2_fourcc('A', 'U', '1', '0')
>>> +#define V4L2_AUDIO_FMT_U32_LE                        v4l2_fourcc('A', 'U', '1', '2')
>>> +#define V4L2_AUDIO_FMT_FLOAT_LE                      v4l2_fourcc('A', 'U', '1', '4')
>>> +#define V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE    v4l2_fourcc('A', 'U', '1', '8')
>>> +#define V4L2_AUDIO_FMT_S24_3LE                       v4l2_fourcc('A', 'U', '3', '2')
>>> +#define V4L2_AUDIO_FMT_U24_3LE                       v4l2_fourcc('A', 'U', '3', '4')
>>> +#define V4L2_AUDIO_FMT_S20_3LE                       v4l2_fourcc('A', 'U', '3', '6')
>>> +#define V4L2_AUDIO_FMT_U20_3LE                       v4l2_fourcc('A', 'U', '3', '8')
>>> +
>>> +#define v4l2_fourcc_to_audfmt(fourcc)        \
>>> +     (__force snd_pcm_format_t)(((((fourcc) >> 16) & 0xff) - '0') * 10  \
>>> +                                + ((((fourcc) >> 24) & 0xff) - '0'))
>>> +
>>
>> As I suggested in an earlier reply, add this:
>>
>> #define v4l2_audfmt_to_fourcc(audfmt) \
>>         v4l2_fourcc('A', 'U', '0' + (audfmt) / 10, '0' + (audfmt) % 10)
>>
>> Even though it is not used in the drivers, since this is a public header used
>> by drivers and applications, it makes sense to provide the reverse mapping as well.
>>
>> Please test it in actual code to make sure there are no compilation warnings.
>>
>> Regards,
>>
>>         Hans
>>
>>>  /* priv field value to indicates that subsequent fields are valid. */
>>>  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe
>>>
>>

