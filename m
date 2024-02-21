Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1822F85D6A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 12:17:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tftys0PTtz3dHK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 22:17:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=zpud=j6=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TftyM5cnZz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 22:16:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FC826149F;
	Wed, 21 Feb 2024 11:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5E5C433F1;
	Wed, 21 Feb 2024 11:16:38 +0000 (UTC)
Message-ID: <4205d9ae-43ae-407e-9eaf-e272c52799e6@xs4all.nl>
Date: Wed, 21 Feb 2024 12:16:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 07/15] media: v4l2: Add audio capture and output
 support
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Tomasz Figa <tfiga@chromium.org>
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
 <1705581128-4604-8-git-send-email-shengjiu.wang@nxp.com>
 <20240217104212.32f07e3a@coco.lan>
 <CAAFQd5CY731HRhFHpmwzGxAZ-BFV_pT7NNGwNGy4ZOA=qz8ntg@mail.gmail.com>
 <CAA+D8AOKNK37urZfVsuzaTv8PYP-ggTORQEVSpNO0pbaereyLg@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CAA+D8AOKNK37urZfVsuzaTv8PYP-ggTORQEVSpNO0pbaereyLg@mail.gmail.com>
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org, sakari.ailus@iki.fi, m.szyprowski@samsung.com, Mauro Carvalho Chehab <mchehab@kernel.org>, festevam@gmail.com, perex@perex.cz, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/02/2024 11:11, Shengjiu Wang wrote:
> On Wed, Feb 21, 2024 at 12:30 PM Tomasz Figa <tfiga@chromium.org> wrote:
>>
>> On Sat, Feb 17, 2024 at 6:42 PM Mauro Carvalho Chehab
>> <mchehab@kernel.org> wrote:
>>>
>>> Em Thu, 18 Jan 2024 20:32:00 +0800
>>> Shengjiu Wang <shengjiu.wang@nxp.com> escreveu:
>>>
>>>> Audio signal processing has the requirement for memory to
>>>> memory similar as Video.
>>>>
>>>> This patch is to add this support in v4l2 framework, defined
>>>> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
>>>> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
>>>> for audio case usage.
>>>>
>>>> The created audio device is named "/dev/v4l-audioX".
>>>>
>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>>> ---
>>>>  .../userspace-api/media/v4l/buffer.rst        |  6 ++
>>>>  .../media/v4l/dev-audio-mem2mem.rst           | 71 +++++++++++++++++++
>>>>  .../userspace-api/media/v4l/devices.rst       |  1 +
>>>>  .../media/v4l/vidioc-enum-fmt.rst             |  2 +
>>>>  .../userspace-api/media/v4l/vidioc-g-fmt.rst  |  4 ++
>>>>  .../media/videodev2.h.rst.exceptions          |  2 +
>>>>  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++
>>>>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++
>>>>  drivers/media/v4l2-core/v4l2-dev.c            | 17 +++++
>>>>  drivers/media/v4l2-core/v4l2-ioctl.c          | 53 ++++++++++++++
>>>>  include/media/v4l2-dev.h                      |  2 +
>>>>  include/media/v4l2-ioctl.h                    | 34 +++++++++
>>>>  include/uapi/linux/videodev2.h                | 17 +++++
>>>>  13 files changed, 222 insertions(+)
>>>>  create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
>>>> index 52bbee81c080..a3754ca6f0d6 100644
>>>> --- a/Documentation/userspace-api/media/v4l/buffer.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
>>>> @@ -438,6 +438,12 @@ enum v4l2_buf_type
>>>>      * - ``V4L2_BUF_TYPE_META_OUTPUT``
>>>>        - 14
>>>
>>>>        - Buffer for metadata output, see :ref:`metadata`.
>>>> +    * - ``V4L2_BUF_TYPE_AUDIO_CAPTURE``
>>>> +      - 15
>>>> +      - Buffer for audio capture, see :ref:`audio`.
>>>> +    * - ``V4L2_BUF_TYPE_AUDIO_OUTPUT``
>>>> +      - 16
>>>
>>> Hmm... alsa APi define input/output as:
>>>         enum {
>>>                 SNDRV_PCM_STREAM_PLAYBACK = 0,
>>>                 SNDRV_PCM_STREAM_CAPTURE,
>>>                 SNDRV_PCM_STREAM_LAST = SNDRV_PCM_STREAM_CAPTURE,
>>>         };
>>>
>>>
>>> I would use a namespace as close as possible to the
>>> ALSA API. Also, we're not talking about V4L2, but, instead
>>> audio. so, not sure if I like the prefix to start with
>>> V4L2_. Maybe ALSA_?
>>>
>>> So, a better namespace would be:
>>>
>>>         ${prefix}_BUF_TYPE_PCM_STREAM_PLAYBACK
>>> and
>>>         ${prefix}_BUF_TYPE_PCM_STREAM_CAPTURE
>>>
>>
>> The API is still V4L2, and all the other non-video buf types also use
>> the V4L2_ prefix, so perhaps that's good here as well?
>>
>> Whether AUDIO or PCM_STREAM makes more sense goes outside of my
>> expertise. Subjectively, a PCM stream sounds more specific than an
>> audio stream. Do those buf types also support non-PCM audio streams?
> 
> Currently I use it for PCM,  but I think it can also be used for non-PCM.
> So use the below name?
> V4L2_BUF_TYPE_AUDIO_CAPTURE
> V4L2_BUF_TYPE_AUDIO_PLAYBACK

I really prefer keeping the names as they are in this patch. CAPTURE/OUTPUT
is consistent with V4L2 nomenclature, and since this is a M2M device 'PLAYBACK'
isn't really a good name either. It's not an audio playback device, it's a
rate converter.

Regards,

	Hans

> 
>>
>>>> +      - Buffer for audio output, see :ref:`audio`.
>>>>
>>>>
>>>>  .. _buffer-flags:
>>>> diff --git a/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
>>>> new file mode 100644
>>>> index 000000000000..68faecfe3a02
>>>> --- /dev/null
>>>> +++ b/Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
>>>> @@ -0,0 +1,71 @@
>>>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>>>> +
>>>> +.. _audiomem2mem:
>>>> +
>>>> +********************************
>>>> +Audio Memory-To-Memory Interface
>>>> +********************************
>>>> +
>>>> +An audio memory-to-memory device can compress, decompress, transform, or
>>>> +otherwise convert audio data from one format into another format, in memory.
>>>> +Such memory-to-memory devices set the ``V4L2_CAP_AUDIO_M2M`` capability.
>>>> +Examples of memory-to-memory devices are audio codecs, audio preprocessing,
>>>> +audio postprocessing.
>>>> +
>>>> +A memory-to-memory audio node supports both output (sending audio frames from
>>>> +memory to the hardware) and capture (receiving the processed audio frames
>>>> +from the hardware into memory) stream I/O. An application will have to
>>>> +setup the stream I/O for both sides and finally call
>>>> +:ref:`VIDIOC_STREAMON <VIDIOC_STREAMON>` for both capture and output to
>>>> +start the hardware.
>>>> +
>>>> +Memory-to-memory devices function as a shared resource: you can
>>>> +open the audio node multiple times, each application setting up their
>>>> +own properties that are local to the file handle, and each can use
>>>> +it independently from the others. The driver will arbitrate access to
>>>> +the hardware and reprogram it whenever another file handler gets access.
>>>> +
>>>> +Audio memory-to-memory devices are accessed through character device
>>>> +special files named ``/dev/v4l-audio``
>>>> +
>>>> +Querying Capabilities
>>>> +=====================
>>>> +
>>>> +Device nodes supporting the audio memory-to-memory interface set the
>>>> +``V4L2_CAP_AUDIO_M2M`` flag in the ``device_caps`` field of the
>>>> +:c:type:`v4l2_capability` structure returned by the :c:func:`VIDIOC_QUERYCAP`
>>>> +ioctl.
>>>> +
>>>> +Data Format Negotiation
>>>> +=======================
>>>> +
>>>> +The audio device uses the :ref:`format` ioctls to select the capture format.
>>>> +The audio buffer content format is bound to that selected format. In addition
>>>> +to the basic :ref:`format` ioctls, the :c:func:`VIDIOC_ENUM_FMT` ioctl must be
>>>> +supported as well.
>>>> +
>>>> +To use the :ref:`format` ioctls applications set the ``type`` field of the
>>>> +:c:type:`v4l2_format` structure to ``V4L2_BUF_TYPE_AUDIO_CAPTURE`` or to
>>>> +``V4L2_BUF_TYPE_AUDIO_OUTPUT``. Both drivers and applications must set the
>>>> +remainder of the :c:type:`v4l2_format` structure to 0.
>>>> +
>>>> +.. c:type:: v4l2_audio_format
>>>> +
>>>> +.. tabularcolumns:: |p{1.4cm}|p{2.4cm}|p{13.5cm}|
>>>> +
>>>> +.. flat-table:: struct v4l2_audio_format
>>>> +    :header-rows:  0
>>>> +    :stub-columns: 0
>>>> +    :widths:       1 1 2
>>>> +
>>>> +    * - __u32
>>>> +      - ``pixelformat``
>>>> +      - The sample format, set by the application. see :ref:`pixfmt-audio`
>>>
>>> pixelformat doesn't make any sense for audio: there are no pixels on a
>>> PCM stream. Please use call it, instead: `snd_pcm_format`, making it match
>>> the values for snd_pcm_format_t.
>>>
>>
>> +1
>>
>> FWIW v4l2_meta_format uses the name "dataformat".
>>
>> Actually, I just realized that the C code actually uses the name
>> "audioformat". Tbh., after reading the kerneldoc comment, my
>> subjective preference would be on "sample_format", since that's
>> exactly what it is.
>>
> Ok, I will change it to sampleformat.
> 
> Best Regards
> Shengjiu Wang
> 
>>> Yet, I would keep defining it as u32 (or u64?) instead of using a
>>> typedef int field there (snd_pcm_format_t), as the size of integer
>>> is different on 32 and 64 bit kernels.
>>
>> +1
>>
>> Best regards,
>> Tomasz

