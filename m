Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4500F77004F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 14:34:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHQCG1TKwz3cMW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 22:34:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=4q82=dv=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHQBh15G4z2yDd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 22:34:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 42C9C61FCF;
	Fri,  4 Aug 2023 12:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DF8C433C8;
	Fri,  4 Aug 2023 12:34:11 +0000 (UTC)
Message-ID: <6ae7a8eb-1de2-4c76-4943-831fa99b1bee@xs4all.nl>
Date: Fri, 4 Aug 2023 14:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <d038360b-22a2-3869-cd64-2da827736faa@xs4all.nl>
 <CAA+D8ANSihjxvqkATE9z460sPz4nbcUqhDrR3eiEjPaU6ytrXQ@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAA+D8ANSihjxvqkATE9z460sPz4nbcUqhDrR3eiEjPaU6ytrXQ@mail.gmail.com>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/08/2023 14:19, Shengjiu Wang wrote:
> On Wed, Aug 2, 2023 at 8:28 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 02/08/2023 14:02, Shengjiu Wang wrote:
>>> On Wed, Aug 2, 2023 at 7:22 PM Takashi Iwai <tiwai@suse.de> wrote:
>>>>
>>>> On Wed, 02 Aug 2023 09:32:37 +0200,
>>>> Hans Verkuil wrote:
>>>>>
>>>>> Hi all,
>>>>>
>>>>> On 25/07/2023 08:12, Shengjiu Wang wrote:
>>>>>> Audio signal processing has the requirement for memory to
>>>>>> memory similar as Video.
>>>>>>
>>>>>> This patch is to add this support in v4l2 framework, defined
>>>>>> new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
>>>>>> V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
>>>>>> for audio case usage.
>>>>>>
>>>>>> The created audio device is named "/dev/audioX".
>>>>>>
>>>>>> And add memory to memory support for two kinds of i.MX ASRC
>>>>>> module
>>>>>
>>>>> Before I spend time on this: are the audio maintainers OK with doing
>>>>> this in V4L2?
>>>>>
>>>>> I do want to have a clear statement on this as it is not something I
>>>>> can decide.
>>>>
>>>> Well, I personally don't mind to have some audio capability in v4l2
>>>> layer.  But, the only uncertain thing for now is whether this is a
>>>> must-have or not.
>>>>
>>>
>>> Thanks,  I am also not sure about this.  I am also confused that why
>>> there is no m2m implementation for audio in the kernel.  Audio also
>>> has similar decoder encoder post-processing as video.
>>>
>>>>
>>>> IIRC, the implementation in the sound driver side was never done just
>>>> because there was no similar implementation?  If so, and if the
>>>> extension to the v4l2 core layer is needed, shouldn't it be more
>>>> considered for the possible other route?
>>>>
>>>
>>> Actually I'd like someone could point me to the other route. I'd like to
>>> try.
>>>
>>> The reason why I select to extend v4l2 for such audio usage is that v4l2
>>> looks best for this audio m2m implementation.  v4l2 is designed for m2m
>>> usage.  if we need implement another 'route',  I don't think it can do better
>>> that v4l2.
>>>
>>> I appreciate that someone can share his ideas or doable solutions.
>>> And please don't ignore my request, ignore my patch.
>>
>> To give a bit more background: if it is decided to use the v4l API for this
>> (and I have no objection to this from my side since API/framework-wise it is a
>> good fit for this), then there are a number of things that need to be done to
>> get this into the media subsystem:
>>
>> - documentation for the new uAPI
>> - add support for this to v4l2-ctl
>> - add v4l2-compliance tests for the new device
>> - highly desirable: have a virtual driver (similar to vim2m) that supports this:
>>   it could be as simple as just copy input to output. This helps regression
>>   testing.
>> - it might need media controller support as well. TBD.
>>
>> None of this is particularly complex, but taken all together it is a fair
>> amount of work that also needs a lot of review time from our side.
>>
>> I want to add one more option to the mix: drivers/media/core/v4l2-mem2mem.c is
>> the main m2m framework, but it relies heavily on the videobuf2 framework for
>> the capture and output queues.
>>
>> The core vb2 implementation in drivers/media/common/videobuf2/videobuf2-core.c
>> is independent of V4L2 and can be used by other subsystems (in our case, it is
>> also used by the DVB API). It is a possibility to create an alsa version of
>> v4l2-mem2mem.c that uses the core vb2 code with an ALSA uAPI on top.
>>
>> So in drivers/media/common/videobuf2/ you would have a videobuf2-alsa.c besides
>> the already existing videobuf2-v4l2.c and -dvb.c.
>>
>> Perhaps parts of v4l2-mem2mem.c can be reused as well in that case, but I am
>> not sure if it is worth the effort. I suspect copying it to an alsa-mem2mem.c
>> and adapting it for alsa is easiest if you want to go that way.
>>
> 
> Thanks.
> 
> Does this means that videobuf2-v4l2.c and v4l2-mem2mem.c are dedicate
> for video device? if audio want to use v4l2 framework,  need to create
> videobuf2-alsa.c and alsa-mem2mem.c, but it may cause a lot of function
> duplicate.

The videobuf2-v4l2.c sits on top of videobuf2-core.c and provides the V4L2
uAPI for the streaming functionality. If you don't want to use the V4L2
uAPI for this, then you would need a videobuf2-alsa.c that provides a
(possibly new) ALSA uAPI. Whether that makes sense is something I cannot
decide.

v4l2-mem2mem.c uses videobuf2-v4l2.c, so if you need a ALSA version, then
you probably need to create an alsa-mem2mem.c (possibly some functionality
can be shared).

It's just a third option, and it can be useful if there is a strong desire
to keep the uAPI for this functionality entirely within the ALSA subsystem,
but you want to reuse the streaming I/O functionality that the videobuf2
core provides.

If the decision is that it is fine to use the V4L2 uAPI for this type
of audio functionality through a /dev/v4l-audioX device, then just ignore
this option and use V4L2.

Regards,

	Hans
