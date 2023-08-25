Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C8788B69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 16:16:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXMSt1XkZz3cHR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 00:16:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=d0gj=ek=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXMSK3GsQz2xpj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 00:16:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AFBBD622FC;
	Fri, 25 Aug 2023 14:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F3CC433C8;
	Fri, 25 Aug 2023 14:15:54 +0000 (UTC)
Message-ID: <bc12f76e-a2ac-2818-f136-b31f6fa49310@xs4all.nl>
Date: Fri, 25 Aug 2023 16:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
Content-Language: en-US, nl
To: Takashi Iwai <tiwai@suse.de>, Shengjiu Wang <shengjiu.wang@gmail.com>
References: <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de>
 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
 <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
 <CAA+D8AMriHO60SD2OqQSDMmi7wm=0MkoW6faR5nyve-j2Q5AEQ@mail.gmail.com>
 <CAA+D8AN34-NVrgksRAG014PuHGUssTm0p-KR-HYGe+Pt8Yejxg@mail.gmail.com>
 <87wmxk8jaq.wl-tiwai@suse.de> <ZOe74PO4S6bj/QlV@finisterre.sirena.org.uk>
 <CAA+D8AM_pqbjQaE59n6Qm5gypLb8zPAwOpJR+_ZEG89-q3B8pg@mail.gmail.com>
 <8735076xdn.wl-tiwai@suse.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <8735076xdn.wl-tiwai@suse.de>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, perex@perex.cz, mchehab@kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25/08/2023 15:54, Takashi Iwai wrote:
> On Fri, 25 Aug 2023 05:46:43 +0200,
> Shengjiu Wang wrote:
>>
>> On Fri, Aug 25, 2023 at 4:21 AM Mark Brown <broonie@kernel.org> wrote:
>>>
>>> On Thu, Aug 24, 2023 at 07:03:09PM +0200, Takashi Iwai wrote:
>>>> Shengjiu Wang wrote:
>>>
>>>>> But there are several issues:
>>>>> 1. Need to create sound cards.  ASRC module support multi instances, then
>>>>> need to create multi sound cards for each instance.
>>>
>>>> Hm, why can't it be multiple PCM instances instead?
>>>
>>> I'm having a hard time following this one too.
>>>
>>>>> 2. The ASRC is an entirety but with DPCM we need to separate input port and
>>>>> output port to playback substream and capture stream. Synchronous between
>>>>> playback substream and capture substream is a problem.
>>>>> How to start them and stop them at the same time.
>>>
>>>> This could be done by enforcing the full duplex and linking the both
>>>> PCM streams, I suppose.
>>>
>>>>> So shall we make the decision that we can go to the V4L2 solution?
>>>
>>>> Honestly speaking, I don't mind much whether it's implemented in V2L4
>>>> or not -- at least for the kernel part, we can reorganize / refactor
>>>> things internally.  But, the biggest remaining question to me is
>>>> whether this user-space interface is the most suitable one.  Is it
>>>> well defined, usable and maintained for the audio applications?  Or
>>>> is it meant to be a stop-gap for a specific use case?
>>>
>>> I'm having a really hard time summoning much enthusiasm for using v4l
>>> here, it feels like this is heading down the same bodge route as DPCM
>>> but directly as ABI so even harder to fix properly.  That said all the
>>> ALSA APIs are really intended to be used in real time and this sounds
>>> like a non real time application?  I don't fully understand what the
>>> actual use case is here.
>>
>> Thanks for your reply.
>>
>> This asrc memory to memory (memory ->asrc->memory) case is a non
>> real time use case.
>>
>> User fills the input buffer to the asrc module,  after conversion, then asrc
>> sends back the output buffer to user. So it is not a traditional ALSA playback
>> and capture case. I think it is not good to create sound card for it,  it is
>> not a sound card actually.
>>
>> It is a specific use case,  there is no reference in current kernel.
>> v4l2 memory to memory is the closed implementation,  v4l2 current
>> support video, image, radio, tuner, touch devices, so it is not
>> complicated to add support for this specific audio case.
>>
>> Maybe you can go through these patches first.  Because we
>> had implemented the "memory -> asrc ->i2s device-> codec"
>> use case in ALSA.  Now the "memory->asrc->memory" needs
>> to reuse the code in asrc driver, so the first 3 patches is for refining
>> the code to make it can be shared by the "memory->asrc->memory"
>> driver.
>>
>> The main change is in the v4l2 side, A /dev/vl42-audio will be created,
>> user applications only use the ioctl of v4l2 framework.
> 
> Ah, now I'm slowly understanding.  So, what you want is to have an
> interface to perform the batch conversion of a data stream from an
> input to an output?  And ALSA PCM interface doesn't fit fully for that
> purpose because the data handling is batched and it's not like a
> normal PCM streaming?
> 
> Basically the whole M2M arguments are rather subtle.  Those are
> implementation details that can be resolved in several different ways
> in the kernel side.  But the design of the operation is the crucial
> point.
> 
> Maybe we can consider implementing a similar feature in ALSA API, too.
> But it's too far-stretched for now.
> 
> So, if v4l2 interface provides the requested feature (the batched
> audio stream conversion), it's OK to ride on it.

The V4L2 M2M interface is simple: you open a video device and then you can
pass data to the hardware, it processes it and you get the processed data back.

The hardware just processes the data as fast as it can. Each time you open
the video device a new instance is created, and each instance can pass jobs
to the hardware.

Currently it is used for video scalers, deinterlacers, colorspace converters and
codecs, but in the end it is just data in, data out with some job scheduling (fifo)
towards the hardware. So supporting audio using the same core m2m framework wouldn't
be a big deal. We'd probably make a /dev/v4l-audio device for that.

It doesn't come for free: it is a new API, so besides adding support for it, it
also needs to be documented, we would need compliance tests, and very likely I
would want a new virtual driver for this (vim2m.c would be a good template).

Regards,

	Hans
