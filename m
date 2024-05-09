Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5EF8C0E2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 12:28:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gS1ny68R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZpCB4sL7z3cX2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 20:28:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gS1ny68R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=amadeuszx.slawinski@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZpBQ2c92z30Vj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 20:28:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715250495; x=1746786495;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WyFpQ0k8HdqYaWkmfZ1u2cEJdO2FRTL/hHX9iaGsmUo=;
  b=gS1ny68RgwSX8O9Vng+JGwPwocvq64qKUudfN9JITRYqE3MqU/LEZZhU
   RyM5VtkRzG0mB9xEUs632ct9Id5cXAfK/RMLDA6xtITMdjnbdU/Pmc22R
   dG0As6imE5URk7mDeojGrl4Kg6NgcSFMbttAbpBz7n1tSrqwdCGeTGyXI
   NP/jmoJU9oMlq6Cw9qmxbtuGEbs7Phnp4feB1is7aNxPOk7ojhWxJbbTt
   NjUAowyXGq5sUrXr7tdO8RRhcwQG4MmCbRZRT+8VlMJ+EHg8rhVvpkbcg
   TCbe/fWceYtPDQq1oD83WCECYjJiOSE/9dXOLOstFUXc2M3Nv0zcwjdny
   g==;
X-CSE-ConnectionGUID: 0f1LwcQAQj60YlUO0AIBgQ==
X-CSE-MsgGUID: rb3D4viFTrWKQnaL9NL87g==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11323112"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="11323112"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 03:28:10 -0700
X-CSE-ConnectionGUID: n6mAF0lMSFOEwlyT/akNtw==
X-CSE-MsgGUID: phT5cmTqTSmNBKWBoblhUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="29274939"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 03:28:05 -0700
Message-ID: <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
Date: Thu, 9 May 2024 12:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk> <20240430172752.20ffcd56@sal.lan>
 <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk> <87sez0k661.wl-tiwai@suse.de>
 <20240502095956.0a8c5b26@sal.lan> <20240502102643.4ee7f6c2@sal.lan>
 <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk> <20240503094225.47fe4836@sal.lan>
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
 <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
 <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, perex@perex.cz, Mauro Carvalho Chehab <mchehab@kernel.org>, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/9/2024 12:12 PM, Shengjiu Wang wrote:
> On Thu, May 9, 2024 at 5:50 PM Amadeusz Sławiński
> <amadeuszx.slawinski@linux.intel.com> wrote:
>>
>> On 5/9/2024 11:36 AM, Shengjiu Wang wrote:
>>> On Wed, May 8, 2024 at 4:14 PM Amadeusz Sławiński
>>> <amadeuszx.slawinski@linux.intel.com> wrote:
>>>>
>>>> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
>>>>> On 06/05/2024 10:49, Shengjiu Wang wrote:
>>>>>> On Fri, May 3, 2024 at 4:42 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>>>>>>>
>>>>>>> Em Fri, 3 May 2024 10:47:19 +0900
>>>>>>> Mark Brown <broonie@kernel.org> escreveu:
>>>>>>>
>>>>>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
>>>>>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>>>>>>>>
>>>>>>>>>> There are still time control associated with it, as audio and video
>>>>>>>>>> needs to be in sync. This is done by controlling the buffers size
>>>>>>>>>> and could be fine-tuned by checking when the buffer transfer is done.
>>>>>>>>
>>>>>>>> ...
>>>>>>>>
>>>>>>>>> Just complementing: on media, we do this per video buffer (or
>>>>>>>>> per half video buffer). A typical use case on cameras is to have
>>>>>>>>> buffers transferred 30 times per second, if the video was streamed
>>>>>>>>> at 30 frames per second.
>>>>>>>>
>>>>>>>> IIRC some big use case for this hardware was transcoding so there was a
>>>>>>>> desire to just go at whatever rate the hardware could support as there
>>>>>>>> is no interactive user consuming the output as it is generated.
>>>>>>>
>>>>>>> Indeed, codecs could be used to just do transcoding, but I would
>>>>>>> expect it to be a border use case. See, as the chipsets implementing
>>>>>>> codecs are typically the ones used on mobiles, I would expect that
>>>>>>> the major use cases to be to watch audio and video and to participate
>>>>>>> on audio/video conferences.
>>>>>>>
>>>>>>> Going further, the codec API may end supporting not only transcoding
>>>>>>> (which is something that CPU can usually handle without too much
>>>>>>> processing) but also audio processing that may require more
>>>>>>> complex algorithms - even deep learning ones - like background noise
>>>>>>> removal, echo detection/removal, volume auto-gain, audio enhancement
>>>>>>> and such.
>>>>>>>
>>>>>>> On other words, the typical use cases will either have input
>>>>>>> or output being a physical hardware (microphone or speaker).
>>>>>>>
>>>>>>
>>>>>> All, thanks for spending time to discuss, it seems we go back to
>>>>>> the start point of this topic again.
>>>>>>
>>>>>> Our main request is that there is a hardware sample rate converter
>>>>>> on the chip, so users can use it in user space as a component like
>>>>>> software sample rate converter. It mostly may run as a gstreamer plugin.
>>>>>> so it is a memory to memory component.
>>>>>>
>>>>>> I didn't find such API in ALSA for such purpose, the best option for this
>>>>>> in the kernel is the V4L2 memory to memory framework I found.
>>>>>> As Hans said it is well designed for memory to memory.
>>>>>>
>>>>>> And I think audio is one of 'media'.  As I can see that part of Radio
>>>>>> function is in ALSA, part of Radio function is in V4L2. part of HDMI
>>>>>> function is in DRM, part of HDMI function is in ALSA...
>>>>>> So using V4L2 for audio is not new from this point of view.
>>>>>>
>>>>>> Even now I still think V4L2 is the best option, but it looks like there
>>>>>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
>>>>>> a duplication of code (bigger duplication that just add audio support
>>>>>> in V4L2 I think).
>>>>>
>>>>> After reading this thread I still believe that the mem2mem framework is
>>>>> a reasonable option, unless someone can come up with a method that is
>>>>> easy to implement in the alsa subsystem. From what I can tell from this
>>>>> discussion no such method exists.
>>>>>
>>>>
>>>> Hi,
>>>>
>>>> my main question would be how is mem2mem use case different from
>>>> loopback exposing playback and capture frontends in user space with DSP
>>>> (or other piece of HW) in the middle?
>>>>
>>> I think loopback has a timing control,  user need to feed data to playback at a
>>> fixed time and get data from capture at a fixed time.  Otherwise there
>>> is xrun in
>>> playback and capture.
>>>
>>> mem2mem case: there is no such timing control,  user feeds data to it
>>> then it generates output,  if user doesn't feed data, there is no xrun.
>>> but mem2mem is just one of the components in the playback or capture
>>> pipeline, overall there is time control for whole pipeline,
>>>
>>
>> Have you looked at compress streams? If I remember correctly they are
>> not tied to time due to the fact that they can pass data in arbitrary
>> formats?
>>
>> From:
>> https://docs.kernel.org/sound/designs/compress-offload.html
>>
>> "No notion of underrun/overrun. Since the bytes written are compressed
>> in nature and data written/read doesn’t translate directly to rendered
>> output in time, this does not deal with underrun/overrun and maybe dealt
>> in user-library"
> 
> I checked the compress stream. mem2mem case is different with
> compress-offload case
> 
> compress-offload case is a full pipeline,  the user sends a compress
> stream to it, then DSP decodes it and renders it to the speaker in real
> time.
> 
> mem2mem is just like the decoder in the compress pipeline. which is
> one of the components in the pipeline.

I was thinking of loopback with endpoints using compress streams, 
without physical endpoint, something like:

compress playback (to feed data from userspace) -> DSP (processing) -> 
compress capture (send data back to userspace)

Unless I'm missing something, you should be able to process data as fast 
as you can feed it and consume it in such case.

Amadeusz
