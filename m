Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D3E7A01A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:25:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=uyrIY+Fv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmYPJ0q8vz3cPf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 20:25:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=uyrIY+Fv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iki.fi (client-ip=2a0b:5c81:1c1::37; helo=lahtoruutu.iki.fi; envelope-from=sakari.ailus@iki.fi; receiver=lists.ozlabs.org)
X-Greylist: delayed 414 seconds by postgrey-1.37 at boromir; Thu, 14 Sep 2023 20:24:51 AEST
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmYNM10PYz3c2D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 20:24:51 +1000 (AEST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RmYD52Fyxz49Q2t;
	Thu, 14 Sep 2023 13:17:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1694686662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROG//h33L4gcarp0kEAKqAx8IqwYzYLfNFC2B4kqyfY=;
	b=uyrIY+Fvm9pT+mWFvCZ+stXrFsf0Zqb/bRLyn9XocU/8d1Ks0w/mP4OaGuiYLJwuQvE+Ei
	LS87+QxMOGfjJ6jmvofxYz1CZdg2Ai53dFHiCP4zIBne2m8KLDM0hS3J+vE4D+0PtMxJSi
	kyBPPtDfC7cC4X76w/aGHK1W8worwuHwAen0Rlyri+eVa2zoOEgyrDiJcXhi6HzGkqBK0f
	XYyHArEyfyrg0Sz5TFoJoMTEpCbzPAex0rpyr/I13Zi8EhOweF78yOcwZyS67RwCz2GjX9
	0HrTPteLbIXraGsotACzK8fQCbP2GetUlObqiZCNm5t6m0Vtke8dONfhrl2Rsg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1694686662; a=rsa-sha256;
	cv=none;
	b=A3lqBLT2YiDygcWEYDuw8cIV0djpIm1643GlapLWq6kXmZWOGP9LGgoovM2DRGHVUFgxw0
	3sgeJJON+INCdi4wRPigZXvW/yl6/hnokvW8/uti6wjCXspGX9Js3qfN0ix2d680Mx3Yvy
	TiVXbgIagzBAZJby4aai3aLQsmGa9QBlJYPPRh3KIiptt8QxPuzcJ5TXqYyDvAfXmiIi5P
	YUR0SKFBz4756TUrD+Zo37Tp0igs2k4DF5sN7qESu48zmCc3og3l477mhKX9QC/w4PLaLt
	eNy4eftd0r9ZRc1YeJSr62QwwXm1A/xljnP3a/HeuBogq3PxbmAADTW3MkDeLA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1694686662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ROG//h33L4gcarp0kEAKqAx8IqwYzYLfNFC2B4kqyfY=;
	b=gDUQ2dpjDetw4rX/gTPKZ2rTQjsg8FqmiLYpKfVb1F0L3HrlIpAlBl2k2RTmd0nJxFrKxO
	l+IdzXUZxXvso/Ddb3nGHEE/Li6QGOV+yWFurekjuY+cm7NoA3yGH9zMIP3s72s5WlNu3H
	2IJV7GHJYHu3oqPuStsT5doKXGQNMtfIqEJwxQnQ4AcTuAh4LxtBusHPbUC54pYoEF1DQk
	4EogUOdfkdD/BoNnx4xIzsdkaBCqxqlWAcn3Ynk6jvOoWmNbM+a97i4J5xx7GDIxCU1LtT
	ccPkJqYr+UYjrXAFZMjQbAVdq+vlXyebGdn71SVuw9MI7fkRbmx71C2IiI+gFw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9B2B9634C93;
	Thu, 14 Sep 2023 13:17:40 +0300 (EEST)
Date: Thu, 14 Sep 2023 10:17:40 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v3 6/9] media: v4l2: Add audio capture and output
 support
Message-ID: <ZQLdxMaqFYUukt4J@valkosipuli.retiisi.eu>
References: <1694670845-17070-1-git-send-email-shengjiu.wang@nxp.com>
 <1694670845-17070-7-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694670845-17070-7-git-send-email-shengjiu.wang@nxp.com>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-media@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, perex@perex.cz, mchehab@kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shenjiu,

Thanks for the update.

On Thu, Sep 14, 2023 at 01:54:02PM +0800, Shengjiu Wang wrote:
> Audio signal processing has the requirement for memory to
> memory similar as Video.
> 
> This patch is to add this support in v4l2 framework, defined
> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> for audio case usage.
> 
> Defined V4L2_AUDIO_FMT_LPCM format type for audio.

This would be nicer as a separate patch. Also see the related comments
below.

> 
> Defined V4L2_CAP_AUDIO_M2M capability type for audio memory
> to memory case.
> 
> The created audio device is named "/dev/v4l-audioX".
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/audio-formats.rst | 15 +++++
>  .../userspace-api/media/v4l/buffer.rst        |  6 ++
>  .../userspace-api/media/v4l/dev-audio.rst     | 63 +++++++++++++++++++
>  .../userspace-api/media/v4l/devices.rst       |  1 +
>  .../media/v4l/pixfmt-aud-lpcm.rst             | 31 +++++++++
>  .../userspace-api/media/v4l/pixfmt.rst        |  1 +
>  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
>  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
>  .../media/v4l/vidioc-querycap.rst             |  3 +
>  .../media/videodev2.h.rst.exceptions          |  2 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
>  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++++
>  include/media/v4l2-dev.h                      |  2 +
>  include/media/v4l2-ioctl.h                    | 34 ++++++++++
>  include/uapi/linux/videodev2.h                | 25 ++++++++
>  16 files changed, 263 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/audio-formats.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio.rst
>  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/audio-formats.rst b/Documentation/userspace-api/media/v4l/audio-formats.rst
> new file mode 100644
> index 000000000000..bc52712d20d3
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/audio-formats.rst
> @@ -0,0 +1,15 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _audio-formats:
> +
> +*************
> +Audio Formats
> +*************
> +
> +These formats are used for :ref:`audio` interface only.
> +
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +    pixfmt-aud-lpcm
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 04dec3e570ed..80cf2cb20dfe 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -438,6 +438,12 @@ enum v4l2_buf_type
>      * - ``V4L2_BUF_TYPE_META_OUTPUT``
>        - 14
>        - Buffer for metadata output, see :ref:`metadata`.
> +    * - ``V4L2_BUF_TYPE_AUDIO_CAPTURE``
> +      - 15
> +      - Buffer for audio capture, see :ref:`audio`.
> +    * - ``V4L2_BUF_TYPE_AUDIO_OUTPUT``
> +      - 16
> +      - Buffer for audio output, see :ref:`audio`.
>  
>  
>  .. _buffer-flags:
> diff --git a/Documentation/userspace-api/media/v4l/dev-audio.rst b/Documentation/userspace-api/media/v4l/dev-audio.rst
> new file mode 100644
> index 000000000000..f9bcf0c7b056
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/dev-audio.rst
> @@ -0,0 +1,63 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _audiodev:
> +
> +******************
> +audio Interface

Capital "A"?

> +******************

Too many asterisks (same a few lines above, too).

> +
> +The audio interface is implemented on audio device nodes. The audio device
> +which uses application software for modulation or demodulation. This
> +interface is intended for controlling and data streaming of such devices
> +
> +Audio devices are accessed through character device special files named
> +``/dev/v4l-audio``
> +
> +Querying Capabilities
> +=====================
> +
> +Device nodes supporting the audio capture and output interface set the
> +``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
> +:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_QUERYCAP`
> +ioctl.
> +
> +At least one of the read/write or streaming I/O methods must be supported.
> +
> +
> +Data Format Negotiation
> +=======================
> +
> +The audio device uses the :ref:`format` ioctls to select the capture format.
> +The audio buffer content format is bound to that selected format. In addition
> +to the basic :ref:`format` ioctls, the :c:func:`VIDIOC_ENUM_FMT` ioctl must be
> +supported as well.
> +
> +To use the :ref:`format` ioctls applications set the ``type`` field of the
> +:c:type:`v4l2_format` structure to ``V4L2_BUF_TYPE_AUDIO_CAPTURE`` or to
> +``V4L2_BUF_TYPE_AUDIO_OUTPUT``. Both drivers and applications must set the
> +remainder of the :c:type:`v4l2_format` structure to 0.
> +
> +.. c:type:: v4l2_audio_format
> +
> +.. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
> +
> +.. flat-table:: struct v4l2_audio_format
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u32
> +      - ``rate``
> +      - The sample rate, set by the application. The range is [5512, 768000].
> +    * - __u32
> +      - ``format``
> +      - The sample format, set by the application. format is defined as
> +        SNDRV_PCM_FORMAT_S8, SNDRV_PCM_FORMAT_U8, ...,
> +    * - __u32
> +      - ``channels``
> +      - The channel number, set by the application. channel number range is
> +        [1, 32].
> +    * - __u32
> +      - ``buffersize``
> +      - Maximum buffer size in bytes required for data. The value is set by the
> +        driver.
> diff --git a/Documentation/userspace-api/media/v4l/devices.rst b/Documentation/userspace-api/media/v4l/devices.rst
> index 8bfbad65a9d4..8261f3468489 100644
> --- a/Documentation/userspace-api/media/v4l/devices.rst
> +++ b/Documentation/userspace-api/media/v4l/devices.rst
> @@ -24,3 +24,4 @@ Interfaces
>      dev-event
>      dev-subdev
>      dev-meta
> +    dev-audio
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst b/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
> new file mode 100644
> index 000000000000..f9ebe2a05f69
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
> @@ -0,0 +1,31 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _v4l2-aud-fmt-lpcm:
> +
> +*************************
> +V4L2_AUDIO_FMT_LPCM ('LPCM')
> +*************************
> +
> +Linear Pulse-Code Modulation (LPCM)
> +
> +
> +Description
> +===========
> +
> +This describes audio format used by the audio memory to memory driver.
> +
> +It contains the following fields:
> +
> +.. flat-table::
> +    :widths: 1 4
> +    :header-rows:  1
> +    :stub-columns: 0
> +
> +    * - Field
> +      - Description
> +    * - u32 samplerate;
> +      - which is the number of times per second that samples are taken.
> +    * - u32 sampleformat;
> +      - which determines the number of possible digital values that can be used to represent each sample

80 characters (or less) per line, please.

Which values could this field have and what do they signify?

> +    * - u32 channels;
> +      - channel number for each sample.

I suppose the rest of the buffer would be samples? This should be
documented. I think there are also different ways the data could be
arrangeed and this needs to be documented, too.

-- 
Kind regards,

Sakari Ailus
