Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E5868AD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 09:34:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkW4w0c0Rz3vcC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 19:34:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=xnsg=ke=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkW4Q73wvz3cZL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 19:34:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C64BB614B0;
	Tue, 27 Feb 2024 08:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23D9C433F1;
	Tue, 27 Feb 2024 08:34:22 +0000 (UTC)
Message-ID: <d8a6f227-4a64-4baa-adfa-cdd49be388d8@xs4all.nl>
Date: Tue, 27 Feb 2024 09:34:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 09/16] media: uapi: Define audio sample format fourcc
 type
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>
References: <1708936109-11587-1-git-send-email-shengjiu.wang@nxp.com>
 <1708936109-11587-10-git-send-email-shengjiu.wang@nxp.com>
 <71c860869caf899a72ebc547608220074c5939b1.camel@ndufresne.ca>
 <CAA+D8AMEMr_PSsfuSByxd0Sxv1zXJoQjEkJEWEpk59kmLGOD1Q@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CAA+D8AMEMr_PSsfuSByxd0Sxv1zXJoQjEkJEWEpk59kmLGOD1Q@mail.gmail.com>
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

On 27/02/2024 04:44, Shengjiu Wang wrote:
> On Mon, Feb 26, 2024 at 9:55 PM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>>
>> Le lundi 26 février 2024 à 16:28 +0800, Shengjiu Wang a écrit :
>>> The audio sample format definition is from alsa,
>>> the header file is include/uapi/sound/asound.h, but
>>> don't include this header file directly, because in
>>> user space, there is another copy in alsa-lib.
>>> There will be conflict in userspace for include
>>> videodev2.h & asound.h and asoundlib.h
>>>
>>> Here still use the fourcc format.
>>
>> I'd like to join Mauro's voice that duplicating the audio formats is a bad idea.
>> We have the same issues with video formats when you look at V4L2 vs DRM. You're
>> rationale is that videodev2.h will be ambiguous if it includes asound.h, but
>> looking at this change, there is no reason why you need to include asound.h in
>> videodev2.h at all. The format type can be abstracted out with a uint32 in the
>> API, and then it would be up to the users to include and use the appropriate
>> formats IDs.
>>
> 
> Resend for the plain text issue
> 
> Thanks.
> 
> There is another reason mentioned by Hans:
> 
> "
> The problem is that within V4L2 we use fourcc consistently to describe a
> format, including in VIDIOC_ENUM_FMT. And the expectation is that the fourcc
> can be printed to a human readable string (there is even a printk format for
> that these days).
> 
> But the pcm values are all small integers (and can even be 0!), and
> printing the fourcc will give garbage. It doesn't work well at all
> with the V4L2 API. But by having a straightforward conversion between the
> pcm identifier and a fourcc it was really easy to deal with this.
> 
> There might even be applications today that call VIDIOC_ENUM_FMT to see
> what is supported and fail if it is not a proper fourcc is returned.
> 
> It will certainly report nonsense in v4l_print_fmtdesc() (v4l2-ioctl.c).
> 
> One of the early versions of this patch series did precisely what you request,
> but it just doesn't work well within the V4L2 uAPI.
> "

Right, and remember that the fourcc codes are really meant to be shown as
characters. v4l2-ctl and friends all use this, and we all talk about them
as such (NV12, YUYV, etc.). If I would just stick in the standard PCM IDs,
then they would all show up as '....'.

<snip>

>>> +/*
>>> + * Audio-data formats
>>> + * All these audio formats use a fourcc starting with 'AU'
>>> + * followed by the SNDRV_PCM_FORMAT_ value from asound.h.
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

We did add a #define to go from a fourcc to an audio format.

Would it help to add a corresponding v4l2_audfmt_to_fourcc define as well?

#define v4l2_audfmt_to_fourcc(audfmt) \
	v4l2_fourcc('A', 'U', '0' + (audfmt) / 10, '0' + (audfmt) % 10)

I would have no problem with that.

The mapping between the audio format and the fourcc is very simple, it is just
converted to something that can be safely shown as ASCII characters.

Regards,

	Hans

>>>  /* priv field value to indicates that subsequent fields are valid. */
>>>  #define V4L2_PIX_FMT_PRIV_MAGIC              0xfeedcafe
>>>
>>

