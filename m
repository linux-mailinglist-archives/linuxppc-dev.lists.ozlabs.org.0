Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08488C0DCD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 11:52:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X3IJ3SXh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZnNt3Qfvz3cVR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 19:52:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X3IJ3SXh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=amadeuszx.slawinski@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 09 May 2024 19:51:34 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZnN65tDHz30Tq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 19:51:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715248295; x=1746784295;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i8Tcy47JtAfE3qGJMX+JxGT4J+DXn0tOPIC16byV3A8=;
  b=X3IJ3SXhQbXN7N1gZOJJU10WfCtOpqVzvOixTz+6YhZZtKNQUhIwjvyM
   Xcy2sc2x84hFmlxMYx84mMpkYiT/TYAxGImdVpoLML3T5D+5oKEBbDvdW
   JJVS8tKxm+xPexB9uK2a6IS5kfiMta7rCpa/BkJ4X9fxdvxUYeIdG408R
   AsYDWfNpO3jjsVjFfLAwqdZ7GXiPVAX46WzjPz8q+2sh9fk67AH2ziy8I
   UF1yt6AjCIMxcTbeqEp9VAIXRFBg1FEwiHvf+jNl7fgfq/rJoJwtpPCtZ
   JJZ98i69eyqn5ZlWLKSDGA0LcryjsuD1ysh5OlKMIA/kAUzI4clZKwUSw
   Q==;
X-CSE-ConnectionGUID: shHiCPqbSYGwsThn53wkVw==
X-CSE-MsgGUID: xndZzJUrRZqhHzlyMPfKOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11027323"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="11027323"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 02:50:27 -0700
X-CSE-ConnectionGUID: 6vFJtDrKTBGjOGnCrQwHrw==
X-CSE-MsgGUID: r+G2E7a9R/2WR9uMvSaRZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="33984324"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 02:50:22 -0700
Message-ID: <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
Date: Thu, 9 May 2024 11:50:19 +0200
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
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
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

On 5/9/2024 11:36 AM, Shengjiu Wang wrote:
> On Wed, May 8, 2024 at 4:14 PM Amadeusz Sławiński
> <amadeuszx.slawinski@linux.intel.com> wrote:
>>
>> On 5/8/2024 10:00 AM, Hans Verkuil wrote:
>>> On 06/05/2024 10:49, Shengjiu Wang wrote:
>>>> On Fri, May 3, 2024 at 4:42 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>>>>>
>>>>> Em Fri, 3 May 2024 10:47:19 +0900
>>>>> Mark Brown <broonie@kernel.org> escreveu:
>>>>>
>>>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
>>>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>>>>>>
>>>>>>>> There are still time control associated with it, as audio and video
>>>>>>>> needs to be in sync. This is done by controlling the buffers size
>>>>>>>> and could be fine-tuned by checking when the buffer transfer is done.
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>> Just complementing: on media, we do this per video buffer (or
>>>>>>> per half video buffer). A typical use case on cameras is to have
>>>>>>> buffers transferred 30 times per second, if the video was streamed
>>>>>>> at 30 frames per second.
>>>>>>
>>>>>> IIRC some big use case for this hardware was transcoding so there was a
>>>>>> desire to just go at whatever rate the hardware could support as there
>>>>>> is no interactive user consuming the output as it is generated.
>>>>>
>>>>> Indeed, codecs could be used to just do transcoding, but I would
>>>>> expect it to be a border use case. See, as the chipsets implementing
>>>>> codecs are typically the ones used on mobiles, I would expect that
>>>>> the major use cases to be to watch audio and video and to participate
>>>>> on audio/video conferences.
>>>>>
>>>>> Going further, the codec API may end supporting not only transcoding
>>>>> (which is something that CPU can usually handle without too much
>>>>> processing) but also audio processing that may require more
>>>>> complex algorithms - even deep learning ones - like background noise
>>>>> removal, echo detection/removal, volume auto-gain, audio enhancement
>>>>> and such.
>>>>>
>>>>> On other words, the typical use cases will either have input
>>>>> or output being a physical hardware (microphone or speaker).
>>>>>
>>>>
>>>> All, thanks for spending time to discuss, it seems we go back to
>>>> the start point of this topic again.
>>>>
>>>> Our main request is that there is a hardware sample rate converter
>>>> on the chip, so users can use it in user space as a component like
>>>> software sample rate converter. It mostly may run as a gstreamer plugin.
>>>> so it is a memory to memory component.
>>>>
>>>> I didn't find such API in ALSA for such purpose, the best option for this
>>>> in the kernel is the V4L2 memory to memory framework I found.
>>>> As Hans said it is well designed for memory to memory.
>>>>
>>>> And I think audio is one of 'media'.  As I can see that part of Radio
>>>> function is in ALSA, part of Radio function is in V4L2. part of HDMI
>>>> function is in DRM, part of HDMI function is in ALSA...
>>>> So using V4L2 for audio is not new from this point of view.
>>>>
>>>> Even now I still think V4L2 is the best option, but it looks like there
>>>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
>>>> a duplication of code (bigger duplication that just add audio support
>>>> in V4L2 I think).
>>>
>>> After reading this thread I still believe that the mem2mem framework is
>>> a reasonable option, unless someone can come up with a method that is
>>> easy to implement in the alsa subsystem. From what I can tell from this
>>> discussion no such method exists.
>>>
>>
>> Hi,
>>
>> my main question would be how is mem2mem use case different from
>> loopback exposing playback and capture frontends in user space with DSP
>> (or other piece of HW) in the middle?
>>
> I think loopback has a timing control,  user need to feed data to playback at a
> fixed time and get data from capture at a fixed time.  Otherwise there
> is xrun in
> playback and capture.
> 
> mem2mem case: there is no such timing control,  user feeds data to it
> then it generates output,  if user doesn't feed data, there is no xrun.
> but mem2mem is just one of the components in the playback or capture
> pipeline, overall there is time control for whole pipeline,
> 

Have you looked at compress streams? If I remember correctly they are 
not tied to time due to the fact that they can pass data in arbitrary 
formats?

From:
https://docs.kernel.org/sound/designs/compress-offload.html

"No notion of underrun/overrun. Since the bytes written are compressed 
in nature and data written/read doesn’t translate directly to rendered 
output in time, this does not deal with underrun/overrun and maybe dealt 
in user-library"

Amadeusz
