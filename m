Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D57F2A35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 11:21:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZL5K5stMz3dHj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 21:21:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=bnfp=hc=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZL4q70F1z3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 21:21:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B8BFCE119E;
	Tue, 21 Nov 2023 10:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9B6C433C8;
	Tue, 21 Nov 2023 10:21:09 +0000 (UTC)
Message-ID: <5256d62c-a501-41c3-bf0d-1e0d451930eb@xs4all.nl>
Date: Tue, 21 Nov 2023 11:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/14] Add audio support in v4l2 framework
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <1700552255-5364-1-git-send-email-shengjiu.wang@nxp.com>
 <71ce6d8b-90c2-4ef6-9883-129861dcab02@xs4all.nl>
 <CAA+D8ANvK5O2TXnjM_YqsHE8ycen9jrw_HXL+eJWtwJ_OZXeJA@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAA+D8ANvK5O2TXnjM_YqsHE8ycen9jrw_HXL+eJWtwJ_OZXeJA@mail.gmail.com>
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

On 11/21/23 11:03, Shengjiu Wang wrote:
> On Tue, Nov 21, 2023 at 5:22 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 21/11/2023 08:37, Shengjiu Wang wrote:
>>> Audio signal processing also has the requirement for memory to
>>> memory similar as Video.
>>>
>>> This asrc memory to memory (memory ->asrc->memory) case is a non
>>> real time use case.
>>>
>>> User fills the input buffer to the asrc module, after conversion, then asrc
>>> sends back the output buffer to user. So it is not a traditional ALSA playback
>>> and capture case.
>>>
>>> It is a specific use case,  there is no reference in current kernel.
>>> v4l2 memory to memory is the closed implementation,  v4l2 current
>>> support video, image, radio, tuner, touch devices, so it is not
>>> complicated to add support for this specific audio case.
>>>
>>> Because we had implemented the "memory -> asrc ->i2s device-> codec"
>>> use case in ALSA.  Now the "memory->asrc->memory" needs
>>> to reuse the code in asrc driver, so the first 3 patches is for refining
>>> the code to make it can be shared by the "memory->asrc->memory"
>>> driver.
>>>
>>> The main change is in the v4l2 side, A /dev/vl4-audioX will be created,
>>> user applications only use the ioctl of v4l2 framework.
>>>
>>> Other change is to add memory to memory support for two kinds of i.MX ASRC
>>> module.
>>>
>>> changes in v10
>>> - remove FIXED_POINT type
>>> - change code base on media: v4l2-ctrls: add support for fraction_bits
>>> - fix issue reported by kernel test robot
>>> - remove module_alias
>>
>> Note that I still need a patch for vivid adding a fixed point test control.
>>
>> I think I want two controls: one INTEGER Q16 and one INTEGER64 Q63 (a nice
>> corner case).
>>
> 
> Not sure if we can do like this:
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.h
> b/drivers/media/test-drivers/vivid/vivid-core.h
> index cfb8e66083f6..def8cf6c30c1 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.h
> +++ b/drivers/media/test-drivers/vivid/vivid-core.h
> @@ -222,6 +222,8 @@ struct vivid_dev {
>         struct v4l2_ctrl                *boolean;
>         struct v4l2_ctrl                *int32;
>         struct v4l2_ctrl                *int64;
> +       struct v4l2_ctrl                *int32Q16;

I would call this int32_q16. This to avoid checkpatch CamelCase warnings.

> +       struct v4l2_ctrl                *int64Q63;

ditto

>         struct v4l2_ctrl                *menu;
>         struct v4l2_ctrl                *string;
>         struct v4l2_ctrl                *bitmask;
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index f2b20e25a7a4..c912b6776775 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -182,6 +182,28 @@ static const struct v4l2_ctrl_config vivid_ctrl_int64 = {
>         .step = 1,
>  };
> 
> +static const struct v4l2_ctrl_config vivid_ctrl_int32Q16 = {
> +       .ops = &vivid_user_gen_ctrl_ops,
> +       .id = VIVID_CID_INTEGER,

You need to add new CIDs. E.g. VIVID_CID_INT_Q4_16.

> +       .name = "Integer 32 Bits Q16",

Q4.16

> +       .type = V4L2_CTRL_TYPE_INTEGER,
> +       .min = 0xffffffff80000000ULL,

Let's make this a Q4.16 integer.

I think it is worth adding this to the v4l2-ctrls.h header:

#define v4l2_ctrl_fp_compose(i, f, fraction_bits) \
	(((i) << fraction_bits) + (f))

Then you can do:

	.min = v4l2_ctrl_fp_compose(-16, 0),
	.max = v4l2_ctrl_fp_compose(15, 0xffff),

> +       .max = 0x7fffffff,
> +       .step = 1,
> +       .fraction_bits = 16,
> +};
> +
> +static const struct v4l2_ctrl_config vivid_ctrl_int64Q63 = {
> +       .ops = &vivid_user_gen_ctrl_ops,
> +       .id = VIVID_CID_INTEGER64,
> +       .name = "Integer 64 Bits Q63",
> +       .type = V4L2_CTRL_TYPE_INTEGER64,
> +       .min = 0x8000000000000000ULL,
> +       .max = 0x7fffffffffffffffLL,

	.min = v4l2_ctrl_fp_compose(-1, 0),
	.max = v4l2_ctrl_fp_compose(0, LLONG_MAX),

> +       .step = 1,
> +       .fraction_bits = 63,
> +};

Looks good otherwise.

The purpose is that v4l2-compliance can test such control types using a
hw emulation driver like vivid.

Regards,

	Hans

> +
>  static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
>         .ops = &vivid_user_gen_ctrl_ops,
>         .id = VIVID_CID_U32_ARRAY,
> @@ -1670,6 +1692,8 @@ int vivid_create_controls(struct vivid_dev *dev,
> bool show_ccs_cap,
>         dev->button = v4l2_ctrl_new_custom(hdl_user_gen,
> &vivid_ctrl_button, NULL);
>         dev->int32 = v4l2_ctrl_new_custom(hdl_user_gen,
> &vivid_ctrl_int32, NULL);
>         dev->int64 = v4l2_ctrl_new_custom(hdl_user_gen,
> &vivid_ctrl_int64, NULL);
> +       dev->int32Q16 = v4l2_ctrl_new_custom(hdl_user_gen,
> &vivid_ctrl_int32Q16, NULL);
> +       dev->int64Q63 = v4l2_ctrl_new_custom(hdl_user_gen,
> &vivid_ctrl_int64Q63, NULL);
>         dev->boolean = v4l2_ctrl_new_custom(hdl_user_gen,
> &vivid_ctrl_boolean, NULL);
>         dev->menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_menu, NULL);
>         dev->string = v4l2_ctrl_new_custom(hdl_user_gen,
> &vivid_ctrl_string, NULL);
> (END)
> 
> 
>> Regards,
>>
>>         Hans
>>
>>>
>>> changes in v9:
>>> - add MEDIA_ENT_F_PROC_AUDIO_RESAMPLER.
>>> - add MEDIA_INTF_T_V4L_AUDIO
>>> - add media controller support
>>> - refine the vim2m-audio to support 8k<->16k conversion.
>>>
>>> changes in v8:
>>> - refine V4L2_CAP_AUDIO_M2M to be 0x00000008
>>> - update doc for FIXED_POINT
>>> - address comments for imx-asrc
>>>
>>> changes in v7:
>>> - add acked-by from Mark
>>> - separate commit for fixed point, m2m audio class, audio rate controls
>>> - use INTEGER_MENU for rate,  FIXED_POINT for rate offset
>>> - remove used fmts
>>> - address other comments for Hans
>>>
>>> changes in v6:
>>> - use m2m_prepare/m2m_unprepare/m2m_start/m2m_stop to replace
>>>   m2m_start_part_one/m2m_stop_part_one, m2m_start_part_two/m2m_stop_part_two.
>>> - change V4L2_CTRL_TYPE_ASRC_RATE to V4L2_CTRL_TYPE_FIXED_POINT
>>> - fix warning by kernel test rebot
>>> - remove some unused format V4L2_AUDIO_FMT_XX
>>> - Get SNDRV_PCM_FORMAT from V4L2_AUDIO_FMT in driver.
>>> - rename audm2m to viaudm2m.
>>>
>>> changes in v5:
>>> - remove V4L2_AUDIO_FMT_LPCM
>>> - define audio pixel format like V4L2_AUDIO_FMT_S8...
>>> - remove rate and format in struct v4l2_audio_format.
>>> - Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE controls
>>> - updata document accordingly.
>>>
>>> changes in v4:
>>> - update document style
>>> - separate V4L2_AUDIO_FMT_LPCM and V4L2_CAP_AUDIO_M2M in separate commit
>>>
>>> changes in v3:
>>> - Modify documents for adding audio m2m support
>>> - Add audio virtual m2m driver
>>> - Defined V4L2_AUDIO_FMT_LPCM format type for audio.
>>> - Defined V4L2_CAP_AUDIO_M2M capability type for audio m2m case.
>>> - with modification in v4l-utils, pass v4l2-compliance test.
>>>
>>> changes in v2:
>>> - decouple the implementation in v4l2 and ALSA
>>> - implement the memory to memory driver as a platfrom driver
>>>   and move it to driver/media
>>> - move fsl_asrc_common.h to include/sound folder
>>>
>>> Shengjiu Wang (14):
>>>   ASoC: fsl_asrc: define functions for memory to memory usage
>>>   ASoC: fsl_easrc: define functions for memory to memory usage
>>>   ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
>>>   ASoC: fsl_asrc: register m2m platform device
>>>   ASoC: fsl_easrc: register m2m platform device
>>>   media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
>>>   media: v4l2: Add audio capture and output support
>>>   media: uapi: Define audio sample format fourcc type
>>>   media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
>>>   media: uapi: Add audio rate controls support
>>>   media: uapi: Declare interface types for Audio
>>>   media: uapi: Add an entity type for audio resampler
>>>   media: imx-asrc: Add memory to memory driver
>>>   media: vim2m-audio: add virtual driver for audio memory to memory
>>>
>>>  .../media/mediactl/media-types.rst            |   11 +
>>>  .../userspace-api/media/v4l/buffer.rst        |    6 +
>>>  .../userspace-api/media/v4l/common.rst        |    1 +
>>>  .../media/v4l/dev-audio-mem2mem.rst           |   71 +
>>>  .../userspace-api/media/v4l/devices.rst       |    1 +
>>>  .../media/v4l/ext-ctrls-audio-m2m.rst         |   41 +
>>>  .../userspace-api/media/v4l/pixfmt-audio.rst  |   87 ++
>>>  .../userspace-api/media/v4l/pixfmt.rst        |    1 +
>>>  .../media/v4l/vidioc-enum-fmt.rst             |    2 +
>>>  .../media/v4l/vidioc-g-ext-ctrls.rst          |    4 +
>>>  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
>>>  .../media/v4l/vidioc-querycap.rst             |    3 +
>>>  .../media/videodev2.h.rst.exceptions          |    3 +
>>>  .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
>>>  drivers/media/platform/nxp/Kconfig            |   13 +
>>>  drivers/media/platform/nxp/Makefile           |    1 +
>>>  drivers/media/platform/nxp/imx-asrc.c         | 1264 +++++++++++++++++
>>>  drivers/media/test-drivers/Kconfig            |   11 +
>>>  drivers/media/test-drivers/Makefile           |    1 +
>>>  drivers/media/test-drivers/vim2m-audio.c      |  799 +++++++++++
>>>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |    9 +
>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   10 +
>>>  drivers/media/v4l2-core/v4l2-dev.c            |   21 +
>>>  drivers/media/v4l2-core/v4l2-ioctl.c          |   66 +
>>>  drivers/media/v4l2-core/v4l2-mem2mem.c        |   13 +-
>>>  include/media/v4l2-dev.h                      |    2 +
>>>  include/media/v4l2-ioctl.h                    |   34 +
>>>  .../fsl => include/sound}/fsl_asrc_common.h   |   60 +
>>>  include/uapi/linux/media.h                    |    2 +
>>>  include/uapi/linux/v4l2-controls.h            |    9 +
>>>  include/uapi/linux/videodev2.h                |   41 +
>>>  sound/soc/fsl/fsl_asrc.c                      |  144 ++
>>>  sound/soc/fsl/fsl_asrc.h                      |    4 +-
>>>  sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
>>>  sound/soc/fsl/fsl_easrc.c                     |  233 +++
>>>  sound/soc/fsl/fsl_easrc.h                     |    6 +-
>>>  36 files changed, 2977 insertions(+), 7 deletions(-)
>>>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
>>>  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
>>>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst
>>>  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
>>>  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
>>>  rename {sound/soc/fsl => include/sound}/fsl_asrc_common.h (60%)
>>>
>>

