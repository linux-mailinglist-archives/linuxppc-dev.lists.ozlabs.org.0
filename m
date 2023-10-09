Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5563E7BE295
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 16:21:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S41S11Bjpz3cgk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 01:21:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=b6ql=fx=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S41RS46sxz3bV2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 01:21:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43EEECE134D;
	Mon,  9 Oct 2023 14:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813D2C433C8;
	Mon,  9 Oct 2023 14:21:00 +0000 (UTC)
Message-ID: <1928233e-d29f-4e27-983b-43b528c3a05c@xs4all.nl>
Date: Mon, 9 Oct 2023 16:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 07/11] media: v4l2: Add audio capture and output
 support
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1695891619-32393-1-git-send-email-shengjiu.wang@nxp.com>
 <1695891619-32393-8-git-send-email-shengjiu.wang@nxp.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <1695891619-32393-8-git-send-email-shengjiu.wang@nxp.com>
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

On 28/09/2023 11:00, Shengjiu Wang wrote:
> Audio signal processing has the requirement for memory to
> memory similar as Video.
> 
> This patch is to add this support in v4l2 framework, defined
> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> for audio case usage.
> 
> The created audio device is named "/dev/v4l-audioX".
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../userspace-api/media/v4l/buffer.rst        |  6 ++
>  .../media/v4l/dev-audio-mem2mem.rst           | 71 +++++++++++++++++++
>  .../userspace-api/media/v4l/devices.rst       |  1 +
>  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
>  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
>  .../media/videodev2.h.rst.exceptions          |  2 +
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
>  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++
>  include/media/v4l2-dev.h                      |  2 +
>  include/media/v4l2-ioctl.h                    | 34 +++++++++
>  include/uapi/linux/videodev2.h                | 19 +++++
>  12 files changed, 215 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> 
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
> diff --git a/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> new file mode 100644
> index 000000000000..e24efd2c5140
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
> @@ -0,0 +1,71 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _audiomem2mem:
> +
> +********************************
> +Audio Memory-To-Memory Interface
> +********************************
> +
> +A audio memory-to-memory device can compress, decompress, transform, or
> +otherwise convert audio data from one format into another format, in memory.
> +Such memory-to-memory devices set the ``V4L2_CAP_AUDIO_M2M`` capability.
> +Examples of memory-to-memory devices are codecs, audio preprocessing,
> +audio postprocessing.
> +
> +A memory-to-memory audio node supports both output (sending frames from
> +memory to the hardware) and capture (receiving the processed frames

Is 'frame' correct terminology for audio? Just checking...

> +from the hardware into memory) stream I/O. An application will have to
> +setup the stream I/O for both sides and finally call
> +:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` for both capture and output to
> +start the hardware.
> +
> +Memory-to-memory devices function as a shared resource: you can
> +open the audio node multiple times, each application setting up their
> +own properties that are local to the file handle, and each can use
> +it independently from the others. The driver will arbitrate access to
> +the hardware and reprogram it whenever another file handler gets access.
> +
> +Audio memory-to-memory devices are accessed through character device
> +special files named ``/dev/v4l-audio``
> +
> +Querying Capabilities
> +=====================
> +
> +Device nodes supporting the audio capture and output interface set the

capture and output -> memory-to-memory

> +``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
> +:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_QUERYCAP`
> +ioctl.
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
> +      - ``pixelformat``
> +      - The sample format, set by the application. see :ref:`pixfmt-audio`
> +    * - __u32
> +      - ``channels``
> +      - The channel number, set by the application. channel number range is
> +        [1, 32].
> +    * - __u32
> +      - ``buffersize``
> +      - Maximum buffer size in bytes required for data. The value is set by the
> +        driver.
> diff --git a/Documentation/userspace-api/media/v4l/devices.rst b/Documentation/userspace-api/media/v4l/devices.rst
> index 8bfbad65a9d4..758bd90f1c26 100644
> --- a/Documentation/userspace-api/media/v4l/devices.rst
> +++ b/Documentation/userspace-api/media/v4l/devices.rst
> @@ -24,3 +24,4 @@ Interfaces
>      dev-event
>      dev-subdev
>      dev-meta
> +    dev-audio-mem2mem
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> index 000c154b0f98..42deb07f4ff4 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst
> @@ -96,6 +96,8 @@ the ``mbus_code`` field is handled differently:
>  	``V4L2_BUF_TYPE_VIDEO_OVERLAY``,
>  	``V4L2_BUF_TYPE_SDR_CAPTURE``,
>  	``V4L2_BUF_TYPE_SDR_OUTPUT``,
> +	``V4L2_BUF_TYPE_AUDIO_CAPTURE``,
> +	``V4L2_BUF_TYPE_AUDIO_OUTPUT``,
>  	``V4L2_BUF_TYPE_META_CAPTURE`` and
>  	``V4L2_BUF_TYPE_META_OUTPUT``.
>  	See :c:type:`v4l2_buf_type`.
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
> index 675c385e5aca..e9d0f6e4083b 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst
> @@ -130,6 +130,10 @@ The format as returned by :ref:`VIDIOC_TRY_FMT <VIDIOC_G_FMT>` must be identical
>        - ``meta``
>        - Definition of a metadata format, see :ref:`meta-formats`, used by
>  	metadata capture devices.
> +    * - struct :c:type:`v4l2_audio_format`
> +      - ``audio``
> +      - Definition of a audio data format, see :ref:`audiomem2mem`, used by
> +        audio capture and output devices

capture and output -> memory-to-memory

>      * - __u8
>        - ``raw_data``\ [200]
>        - Place holder for future extensions.
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index da6d0b8e4c2c..e61152bb80d1 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -29,6 +29,8 @@ replace symbol V4L2_FIELD_SEQ_TB :c:type:`v4l2_field`
>  replace symbol V4L2_FIELD_TOP :c:type:`v4l2_field`
>  
>  # Documented enum v4l2_buf_type
> +replace symbol V4L2_BUF_TYPE_AUDIO_CAPTURE :c:type:`v4l2_buf_type`
> +replace symbol V4L2_BUF_TYPE_AUDIO_OUTPUT :c:type:`v4l2_buf_type`
>  replace symbol V4L2_BUF_TYPE_META_CAPTURE :c:type:`v4l2_buf_type`
>  replace symbol V4L2_BUF_TYPE_META_OUTPUT :c:type:`v4l2_buf_type`
>  replace symbol V4L2_BUF_TYPE_SDR_CAPTURE :c:type:`v4l2_buf_type`
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index c7a54d82a55e..12f2be2773a2 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -785,6 +785,10 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	case V4L2_BUF_TYPE_META_OUTPUT:
>  		requested_sizes[0] = f->fmt.meta.buffersize;
>  		break;
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		requested_sizes[0] = f->fmt.audio.buffersize;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index f81279492682..b92c760b611a 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -553,6 +553,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  	bool is_tch = vdev->vfl_type == VFL_TYPE_TOUCH;
>  	bool is_meta = vdev->vfl_type == VFL_TYPE_VIDEO &&
>  		       (vdev->device_caps & meta_caps);
> +	bool is_audio = vdev->vfl_type == VFL_TYPE_AUDIO;
>  	bool is_rx = vdev->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vdev->vfl_dir != VFL_DIR_RX;
>  	bool is_io_mc = vdev->device_caps & V4L2_CAP_IO_MC;
> @@ -664,6 +665,19 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_meta_out);
>  		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_meta_out);
>  	}
> +	if (is_audio && is_rx) {
> +		/* audio capture specific ioctls */
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_audio_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_cap);
> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_audio_cap);
> +	} else if (is_audio && is_tx) {
> +		/* audio output specific ioctls */
> +		SET_VALID_IOCTL(ops, VIDIOC_ENUM_FMT, vidioc_enum_fmt_audio_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_G_FMT, vidioc_g_fmt_audio_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_S_FMT, vidioc_s_fmt_audio_out);
> +		SET_VALID_IOCTL(ops, VIDIOC_TRY_FMT, vidioc_try_fmt_audio_out);
> +	}
>  	if (is_vbi) {
>  		/* vbi specific ioctls */
>  		if ((is_rx && (ops->vidioc_g_fmt_vbi_cap ||
> @@ -927,6 +941,9 @@ int __video_register_device(struct video_device *vdev,
>  	case VFL_TYPE_TOUCH:
>  		name_base = "v4l-touch";
>  		break;
> +	case VFL_TYPE_AUDIO:
> +		name_base = "v4l-audio";
> +		break;
>  	default:
>  		pr_err("%s called with unknown type: %d\n",
>  		       __func__, type);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index f4d9d6279094..1a40090d8287 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -188,6 +188,8 @@ const char *v4l2_type_names[] = {
>  	[V4L2_BUF_TYPE_SDR_OUTPUT]         = "sdr-out",
>  	[V4L2_BUF_TYPE_META_CAPTURE]       = "meta-cap",
>  	[V4L2_BUF_TYPE_META_OUTPUT]	   = "meta-out",
> +	[V4L2_BUF_TYPE_AUDIO_CAPTURE]      = "audio-cap",
> +	[V4L2_BUF_TYPE_AUDIO_OUTPUT]	   = "audio-out",
>  };
>  EXPORT_SYMBOL(v4l2_type_names);
>  
> @@ -276,6 +278,7 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	const struct v4l2_sliced_vbi_format *sliced;
>  	const struct v4l2_window *win;
>  	const struct v4l2_meta_format *meta;
> +	const struct v4l2_audio_format *audio;
>  	u32 pixelformat;
>  	u32 planes;
>  	unsigned i;
> @@ -346,6 +349,13 @@ static void v4l_print_format(const void *arg, bool write_only)
>  		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
>  			&pixelformat, meta->buffersize);
>  		break;
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		audio = &p->fmt.audio;
> +		pixelformat = audio->pixelformat;
> +		pr_cont(", format=%p4cc, channels=%u, buffersize=%u\n",
> +			&pixelformat, audio->channels, audio->buffersize);
> +		break;
>  	}
>  }
>  
> @@ -927,6 +937,7 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>  	bool is_tch = vfd->vfl_type == VFL_TYPE_TOUCH;
>  	bool is_meta = vfd->vfl_type == VFL_TYPE_VIDEO &&
>  		       (vfd->device_caps & meta_caps);
> +	bool is_audio = vfd->vfl_type == VFL_TYPE_AUDIO;
>  	bool is_rx = vfd->vfl_dir != VFL_DIR_TX;
>  	bool is_tx = vfd->vfl_dir != VFL_DIR_RX;
>  
> @@ -992,6 +1003,14 @@ static int check_fmt(struct file *file, enum v4l2_buf_type type)
>  		if (is_meta && is_tx && ops->vidioc_g_fmt_meta_out)
>  			return 0;
>  		break;
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		if (is_audio && is_rx && ops->vidioc_g_fmt_audio_cap)
> +			return 0;
> +		break;
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		if (is_audio && is_tx && ops->vidioc_g_fmt_audio_out)
> +			return 0;
> +		break;
>  	default:
>  		break;
>  	}
> @@ -1596,6 +1615,16 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>  			break;
>  		ret = ops->vidioc_enum_fmt_meta_out(file, fh, arg);
>  		break;
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		if (unlikely(!ops->vidioc_enum_fmt_audio_cap))
> +			break;
> +		ret = ops->vidioc_enum_fmt_audio_cap(file, fh, arg);
> +		break;
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		if (unlikely(!ops->vidioc_enum_fmt_audio_out))
> +			break;
> +		ret = ops->vidioc_enum_fmt_audio_out(file, fh, arg);
> +		break;
>  	}
>  	if (ret == 0)
>  		v4l_fill_fmtdesc(p);
> @@ -1672,6 +1701,10 @@ static int v4l_g_fmt(const struct v4l2_ioctl_ops *ops,
>  		return ops->vidioc_g_fmt_meta_cap(file, fh, arg);
>  	case V4L2_BUF_TYPE_META_OUTPUT:
>  		return ops->vidioc_g_fmt_meta_out(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		return ops->vidioc_g_fmt_audio_cap(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		return ops->vidioc_g_fmt_audio_out(file, fh, arg);
>  	}
>  	return -EINVAL;
>  }
> @@ -1783,6 +1816,16 @@ static int v4l_s_fmt(const struct v4l2_ioctl_ops *ops,
>  			break;
>  		memset_after(p, 0, fmt.meta);
>  		return ops->vidioc_s_fmt_meta_out(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		if (unlikely(!ops->vidioc_s_fmt_audio_cap))
> +			break;
> +		memset_after(p, 0, fmt.audio);
> +		return ops->vidioc_s_fmt_audio_cap(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		if (unlikely(!ops->vidioc_s_fmt_audio_out))
> +			break;
> +		memset_after(p, 0, fmt.audio);
> +		return ops->vidioc_s_fmt_audio_out(file, fh, arg);
>  	}
>  	return -EINVAL;
>  }
> @@ -1891,6 +1934,16 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops,
>  			break;
>  		memset_after(p, 0, fmt.meta);
>  		return ops->vidioc_try_fmt_meta_out(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
> +		if (unlikely(!ops->vidioc_try_fmt_audio_cap))
> +			break;
> +		memset_after(p, 0, fmt.audio);
> +		return ops->vidioc_try_fmt_audio_cap(file, fh, arg);
> +	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
> +		if (unlikely(!ops->vidioc_try_fmt_audio_out))
> +			break;
> +		memset_after(p, 0, fmt.audio);
> +		return ops->vidioc_try_fmt_audio_out(file, fh, arg);
>  	}
>  	return -EINVAL;
>  }
> diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
> index e0a13505f88d..1adef2a90bd5 100644
> --- a/include/media/v4l2-dev.h
> +++ b/include/media/v4l2-dev.h
> @@ -30,6 +30,7 @@
>   * @VFL_TYPE_SUBDEV:	for V4L2 subdevices
>   * @VFL_TYPE_SDR:	for Software Defined Radio tuners
>   * @VFL_TYPE_TOUCH:	for touch sensors
> + * @VFL_TYPE_AUDIO:	for audio memory-to-memory devices
>   * @VFL_TYPE_MAX:	number of VFL types, must always be last in the enum
>   */
>  enum vfl_devnode_type {
> @@ -39,6 +40,7 @@ enum vfl_devnode_type {
>  	VFL_TYPE_SUBDEV,
>  	VFL_TYPE_SDR,
>  	VFL_TYPE_TOUCH,
> +	VFL_TYPE_AUDIO,
>  	VFL_TYPE_MAX /* Shall be the last one */
>  };
>  
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index edb733f21604..f840cf740ce1 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -45,6 +45,12 @@ struct v4l2_fh;
>   * @vidioc_enum_fmt_meta_out: pointer to the function that implements
>   *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
>   *	for metadata output
> + * @vidioc_enum_fmt_audio_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> + *	for audio capture
> + * @vidioc_enum_fmt_audio_out: pointer to the function that implements
> + *	:ref:`VIDIOC_ENUM_FMT <vidioc_enum_fmt>` ioctl logic
> + *	for audio output
>   * @vidioc_g_fmt_vid_cap: pointer to the function that implements
>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for video capture
>   *	in single plane mode
> @@ -79,6 +85,10 @@ struct v4l2_fh;
>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
>   * @vidioc_g_fmt_meta_out: pointer to the function that implements
>   *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for metadata output
> + * @vidioc_g_fmt_audio_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio capture
> + * @vidioc_g_fmt_audio_out: pointer to the function that implements
> + *	:ref:`VIDIOC_G_FMT <vidioc_g_fmt>` ioctl logic for audio output
>   * @vidioc_s_fmt_vid_cap: pointer to the function that implements
>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for video capture
>   *	in single plane mode
> @@ -113,6 +123,10 @@ struct v4l2_fh;
>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
>   * @vidioc_s_fmt_meta_out: pointer to the function that implements
>   *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for metadata output
> + * @vidioc_s_fmt_audio_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio capture
> + * @vidioc_s_fmt_audio_out: pointer to the function that implements
> + *	:ref:`VIDIOC_S_FMT <vidioc_g_fmt>` ioctl logic for audio output
>   * @vidioc_try_fmt_vid_cap: pointer to the function that implements
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for video capture
>   *	in single plane mode
> @@ -149,6 +163,10 @@ struct v4l2_fh;
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata capture
>   * @vidioc_try_fmt_meta_out: pointer to the function that implements
>   *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for metadata output
> + * @vidioc_try_fmt_audio_cap: pointer to the function that implements
> + *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio capture
> + * @vidioc_try_fmt_audio_out: pointer to the function that implements
> + *	:ref:`VIDIOC_TRY_FMT <vidioc_g_fmt>` ioctl logic for audio output
>   * @vidioc_reqbufs: pointer to the function that implements
>   *	:ref:`VIDIOC_REQBUFS <vidioc_reqbufs>` ioctl
>   * @vidioc_querybuf: pointer to the function that implements
> @@ -315,6 +333,10 @@ struct v4l2_ioctl_ops {
>  					struct v4l2_fmtdesc *f);
>  	int (*vidioc_enum_fmt_meta_out)(struct file *file, void *fh,
>  					struct v4l2_fmtdesc *f);
> +	int (*vidioc_enum_fmt_audio_cap)(struct file *file, void *fh,
> +					 struct v4l2_fmtdesc *f);
> +	int (*vidioc_enum_fmt_audio_out)(struct file *file, void *fh,
> +					 struct v4l2_fmtdesc *f);
>  
>  	/* VIDIOC_G_FMT handlers */
>  	int (*vidioc_g_fmt_vid_cap)(struct file *file, void *fh,
> @@ -345,6 +367,10 @@ struct v4l2_ioctl_ops {
>  				     struct v4l2_format *f);
>  	int (*vidioc_g_fmt_meta_out)(struct file *file, void *fh,
>  				     struct v4l2_format *f);
> +	int (*vidioc_g_fmt_audio_cap)(struct file *file, void *fh,
> +				      struct v4l2_format *f);
> +	int (*vidioc_g_fmt_audio_out)(struct file *file, void *fh,
> +				      struct v4l2_format *f);
>  
>  	/* VIDIOC_S_FMT handlers */
>  	int (*vidioc_s_fmt_vid_cap)(struct file *file, void *fh,
> @@ -375,6 +401,10 @@ struct v4l2_ioctl_ops {
>  				     struct v4l2_format *f);
>  	int (*vidioc_s_fmt_meta_out)(struct file *file, void *fh,
>  				     struct v4l2_format *f);
> +	int (*vidioc_s_fmt_audio_cap)(struct file *file, void *fh,
> +				      struct v4l2_format *f);
> +	int (*vidioc_s_fmt_audio_out)(struct file *file, void *fh,
> +				      struct v4l2_format *f);
>  
>  	/* VIDIOC_TRY_FMT handlers */
>  	int (*vidioc_try_fmt_vid_cap)(struct file *file, void *fh,
> @@ -405,6 +435,10 @@ struct v4l2_ioctl_ops {
>  				       struct v4l2_format *f);
>  	int (*vidioc_try_fmt_meta_out)(struct file *file, void *fh,
>  				       struct v4l2_format *f);
> +	int (*vidioc_try_fmt_audio_cap)(struct file *file, void *fh,
> +					struct v4l2_format *f);
> +	int (*vidioc_try_fmt_audio_out)(struct file *file, void *fh,
> +					struct v4l2_format *f);
>  
>  	/* Buffer handlers */
>  	int (*vidioc_reqbufs)(struct file *file, void *fh,
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 3decf7d73870..3630f50eedb1 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -153,6 +153,8 @@ enum v4l2_buf_type {
>  	V4L2_BUF_TYPE_SDR_OUTPUT           = 12,
>  	V4L2_BUF_TYPE_META_CAPTURE         = 13,
>  	V4L2_BUF_TYPE_META_OUTPUT	   = 14,
> +	V4L2_BUF_TYPE_AUDIO_CAPTURE        = 15,
> +	V4L2_BUF_TYPE_AUDIO_OUTPUT         = 16,
>  	/* Deprecated, do not use */
>  	V4L2_BUF_TYPE_PRIVATE              = 0x80,
>  };
> @@ -169,6 +171,7 @@ enum v4l2_buf_type {
>  	 || (type) == V4L2_BUF_TYPE_VBI_OUTPUT			\
>  	 || (type) == V4L2_BUF_TYPE_SLICED_VBI_OUTPUT		\
>  	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
> +	 || (type) == V4L2_BUF_TYPE_AUDIO_OUTPUT		\
>  	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
>  
>  #define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
> @@ -1915,6 +1918,8 @@ enum v4l2_ctrl_type {
>  	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
>  	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
>  	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
> +
> +	V4L2_CTRL_TYPE_ASRC_RATE	    = 0x290,

This belongs in the next patch (08/11).

>  };
>  
>  /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
> @@ -2418,6 +2423,18 @@ struct v4l2_meta_format {
>  	__u32				buffersize;
>  } __attribute__ ((packed));
>  
> +/**
> + * struct v4l2_audio_format - audio data format definition
> + * @pixelformat:	little endian four character code (fourcc)
> + * @channels:		channel numbers
> + * @buffersize:		maximum size in bytes required for data
> + */
> +struct v4l2_audio_format {
> +	__u32				pixelformat;

I think this should be called audioformat, as it has nothing to do with pixels.

> +	__u32				channels;
> +	__u32				buffersize;
> +} __attribute__ ((packed));
> +
>  /**
>   * struct v4l2_format - stream data format
>   * @type:	enum v4l2_buf_type; type of the data stream
> @@ -2426,6 +2443,7 @@ struct v4l2_meta_format {
>   * @win:	definition of an overlaid image
>   * @vbi:	raw VBI capture or output parameters
>   * @sliced:	sliced VBI capture or output parameters
> + * @audio:	definition of an audio format
>   * @raw_data:	placeholder for future extensions and custom formats
>   * @fmt:	union of @pix, @pix_mp, @win, @vbi, @sliced, @sdr, @meta
>   *		and @raw_data
> @@ -2440,6 +2458,7 @@ struct v4l2_format {
>  		struct v4l2_sliced_vbi_format	sliced;  /* V4L2_BUF_TYPE_SLICED_VBI_CAPTURE */
>  		struct v4l2_sdr_format		sdr;     /* V4L2_BUF_TYPE_SDR_CAPTURE */
>  		struct v4l2_meta_format		meta;    /* V4L2_BUF_TYPE_META_CAPTURE */
> +		struct v4l2_audio_format	audio;   /* V4L2_BUF_TYPE_AUDIO_CAPTURE */
>  		__u8	raw_data[200];                   /* user-defined */
>  	} fmt;
>  };

Regards,

	Hans
