Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F5976C6E4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 09:33:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RG3cB43M9z3cPk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 17:33:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=vcmq=dt=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RG3bg4Xxfz2yV0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 17:32:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB4D06183D;
	Wed,  2 Aug 2023 07:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D1AC433C7;
	Wed,  2 Aug 2023 07:32:38 +0000 (UTC)
Message-ID: <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
Date: Wed, 2 Aug 2023 09:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

On 25/07/2023 08:12, Shengjiu Wang wrote:
> Audio signal processing has the requirement for memory to
> memory similar as Video.
> 
> This patch is to add this support in v4l2 framework, defined
> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> for audio case usage.
> 
> The created audio device is named "/dev/audioX".
> 
> And add memory to memory support for two kinds of i.MX ASRC
> module

Before I spend time on this: are the audio maintainers OK with doing
this in V4L2?

I do want to have a clear statement on this as it is not something I
can decide.

Regards,

	Hans

> 
> changes in v2:
> - decouple the implementation in v4l2 and ALSA
> - implement the memory to memory driver as a platfrom driver
>   and move it to driver/media
> - move fsl_asrc_common.h to include/sound folder
> 
> Shengjiu Wang (7):
>   ASoC: fsl_asrc: define functions for memory to memory usage
>   ASoC: fsl_easrc: define functions for memory to memory usage
>   ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
>   media: v4l2: Add audio capture and output support
>   media: imx: fsl_asrc: Add memory to memory driver
>   ASoC: fsl_asrc: register m2m platform device
>   ASoC: fsl_easrc: register m2m platform device
> 
>  .../media/common/videobuf2/videobuf2-v4l2.c   |   4 +
>  drivers/media/platform/nxp/Kconfig            |  12 +
>  drivers/media/platform/nxp/Makefile           |   1 +
>  drivers/media/platform/nxp/fsl_asrc_m2m.c     | 962 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-dev.c            |  17 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  52 +
>  include/media/v4l2-dev.h                      |   2 +
>  include/media/v4l2-ioctl.h                    |  34 +
>  .../fsl => include/sound}/fsl_asrc_common.h   |  48 +
>  include/uapi/linux/videodev2.h                |  19 +
>  sound/soc/fsl/fsl_asrc.c                      | 150 +++
>  sound/soc/fsl/fsl_asrc.h                      |   4 +-
>  sound/soc/fsl/fsl_asrc_dma.c                  |   2 +-
>  sound/soc/fsl/fsl_easrc.c                     | 227 +++++
>  sound/soc/fsl/fsl_easrc.h                     |   8 +-
>  15 files changed, 1539 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/media/platform/nxp/fsl_asrc_m2m.c
>  rename {sound/soc/fsl => include/sound}/fsl_asrc_common.h (63%)
> 

