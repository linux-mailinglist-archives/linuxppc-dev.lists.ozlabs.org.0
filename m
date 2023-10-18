Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2E7CDC78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 14:58:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9W9v2sc4z3dDJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 23:58:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=w3en=ga=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9W9P230Yz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 23:58:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CA106B82357;
	Wed, 18 Oct 2023 12:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13865C433C8;
	Wed, 18 Oct 2023 12:57:53 +0000 (UTC)
Message-ID: <83c7dae1-4910-4e85-8b7e-bd803eac9523@xs4all.nl>
Date: Wed, 18 Oct 2023 14:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 10/11] media: imx-asrc: Add memory to memory driver
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-11-git-send-email-shengjiu.wang@nxp.com>
 <677abf53-651a-42d3-ac65-c2a7d0b63fe6@xs4all.nl>
 <CAA+D8ANKVwwqoYKo=rZGx029BykH9eDv=-VCQ3PP9p-k8faJ_w@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CAA+D8ANKVwwqoYKo=rZGx029BykH9eDv=-VCQ3PP9p-k8faJ_w@mail.gmail.com>
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

On 18/10/2023 14:53, Shengjiu Wang wrote:
> On Mon, Oct 16, 2023 at 10:01 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 13/10/2023 10:31, Shengjiu Wang wrote:
>>> Implement the ASRC memory to memory function using
>>> the v4l2 framework, user can use this function with
>>> v4l2 ioctl interface.
>>>
>>> User send the output and capture buffer to driver and
>>> driver store the converted data to the capture buffer.
>>>
>>> This feature can be shared by ASRC and EASRC drivers
>>>
>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>> ---
>>>  drivers/media/platform/nxp/Kconfig    |   12 +
>>>  drivers/media/platform/nxp/Makefile   |    1 +
>>>  drivers/media/platform/nxp/imx-asrc.c | 1248 +++++++++++++++++++++++++
>>>  3 files changed, 1261 insertions(+)
>>>  create mode 100644 drivers/media/platform/nxp/imx-asrc.c
>>>
>>> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
>>> index 40e3436669e2..8234644ee341 100644
>>> --- a/drivers/media/platform/nxp/Kconfig
>>> +++ b/drivers/media/platform/nxp/Kconfig
>>> @@ -67,3 +67,15 @@ config VIDEO_MX2_EMMAPRP
>>>
>>>  source "drivers/media/platform/nxp/dw100/Kconfig"
>>>  source "drivers/media/platform/nxp/imx-jpeg/Kconfig"
>>> +
>>> +config VIDEO_IMX_ASRC
>>> +     tristate "NXP i.MX ASRC M2M support"
>>> +     depends on V4L_MEM2MEM_DRIVERS
>>> +     depends on MEDIA_SUPPORT
>>> +     select VIDEOBUF2_DMA_CONTIG
>>> +     select V4L2_MEM2MEM_DEV
>>> +     help
>>> +         Say Y if you want to add ASRC M2M support for NXP CPUs.
>>> +         It is a complement for ASRC M2P and ASRC P2M features.
>>> +         This option is only useful for out-of-tree drivers since
>>> +         in-tree drivers select it automatically.
>>> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
>>> index 4d90eb713652..1325675e34f5 100644
>>> --- a/drivers/media/platform/nxp/Makefile
>>> +++ b/drivers/media/platform/nxp/Makefile
>>> @@ -9,3 +9,4 @@ obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
>>>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
>>>  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
>>>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
>>> +obj-$(CONFIG_VIDEO_IMX_ASRC) += imx-asrc.o
>>> diff --git a/drivers/media/platform/nxp/imx-asrc.c b/drivers/media/platform/nxp/imx-asrc.c
>>> new file mode 100644
>>> index 000000000000..373ca2b5ec90
>>> --- /dev/null
>>> +++ b/drivers/media/platform/nxp/imx-asrc.c
>>> @@ -0,0 +1,1248 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +//
>>> +// Copyright (C) 2014-2016 Freescale Semiconductor, Inc.
>>> +// Copyright (C) 2019-2023 NXP
>>> +//
>>> +// Freescale ASRC Memory to Memory (M2M) driver
>>> +
>>> +#include <linux/dma/imx-dma.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-event.h>
>>> +#include <media/v4l2-fh.h>
>>> +#include <media/v4l2-ioctl.h>
>>> +#include <media/v4l2-mem2mem.h>
>>> +#include <media/videobuf2-dma-contig.h>
>>> +#include <sound/dmaengine_pcm.h>
>>> +#include <sound/fsl_asrc_common.h>
>>> +
>>> +#define V4L_CAP OUT
>>> +#define V4L_OUT IN
>>> +
>>> +#define ASRC_xPUT_DMA_CALLBACK(dir) \
>>> +     (((dir) == V4L_OUT) ? asrc_input_dma_callback \
>>> +     : asrc_output_dma_callback)
>>> +
>>> +#define DIR_STR(dir) (dir) == V4L_OUT ? "out" : "cap"
>>> +
>>> +#define ASRC_M2M_BUFFER_SIZE (512 * 1024)
>>> +#define ASRC_M2M_PERIOD_SIZE (48 * 1024)
>>> +#define ASRC_M2M_SG_NUM (20)
>>
>> Where do all these values come from? How do they relate?
>> Some comments would be welcome.
>>
>> Esp. ASRC_M2M_SG_NUM is a bit odd.
>>
>>> +
>>> +struct asrc_fmt {
>>> +     u32     fourcc;
>>> +     snd_pcm_format_t     format;
>>
>> Do you need this field? If not, then you can drop the whole
>> struct and just use u32 fourcc in the formats[] array.
>>
>>> +};
>>> +
>>> +struct asrc_pair_m2m {
>>> +     struct fsl_asrc_pair *pair;
>>> +     struct asrc_m2m *m2m;
>>> +     struct v4l2_fh fh;
>>> +     struct v4l2_ctrl_handler ctrl_handler;
>>> +     int channels[2];
>>> +     struct v4l2_ctrl_fixed_point src_rate;
>>> +     struct v4l2_ctrl_fixed_point dst_rate;
>>> +
>>> +};
>>> +
>>> +struct asrc_m2m {
>>> +     struct fsl_asrc_m2m_pdata pdata;
>>> +     struct v4l2_device v4l2_dev;
>>> +     struct v4l2_m2m_dev *m2m_dev;
>>> +     struct video_device *dec_vdev;
>>> +     struct mutex mlock; /* v4l2 ioctls serialization */
>>> +     struct platform_device *pdev;
>>> +};
>>> +
>>> +static struct asrc_fmt formats[] = {
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_S8,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_S16_LE,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_U16_LE,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_S24_LE,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_S24_3LE,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_U24_LE,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_U24_3LE,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_S32_LE,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_U32_LE,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_S20_3LE,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_U20_3LE,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_FLOAT_LE,
>>> +     },
>>> +     {
>>> +             .fourcc = V4L2_AUDIO_FMT_IEC958_SUBFRAME_LE,
>>> +     },
>>> +};
>>> +
>>> +#define NUM_FORMATS ARRAY_SIZE(formats)
>>> +
>>> +static snd_pcm_format_t convert_fourcc(u32 fourcc) {
>>> +
>>> +     return (__force snd_pcm_format_t)v4l2_fourcc_to_audfmt(fourcc);
>>
>> Is this cast something that should be done in the v4l2_fourcc_to_audfmt
>> define instead?
> 
> need to avoid include asound.h in videodev2.h,  so add this cast in driver.

It's a #define, so just including videodev2.h won't require asound.h.

Regards,

	Hans

