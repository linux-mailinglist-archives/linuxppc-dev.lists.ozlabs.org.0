Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B76FE8C78B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 16:51:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=C2tVvhB0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgCjQ23qYz3frs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 00:51:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=C2tVvhB0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=perex.cz (client-ip=77.48.224.245; helo=mail1.perex.cz; envelope-from=perex@perex.cz; receiver=lists.ozlabs.org)
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgChd1z6Tz3dJ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 00:51:11 +1000 (AEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B313645B5;
	Thu, 16 May 2024 16:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B313645B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1715871062; bh=vd5m65i8q/dcDshCpdZxqE51XS5GvkCD5cFuKYkovLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C2tVvhB04LcKiEIyl5kYj3qgRnwLPIYlK94nbSF4CO68fdWuv0ZZ1HmOH2JEoxKSH
	 ahb6NKXAUk8Uc0uGjSX7hYLcvlkQMdTXX+u8ZxJ/J4q4ijnyrPN+YGKfBLnRZJ+lER
	 YO2R4l4IkXKbO/9DfVyHkcw1//iNZMk7kjku+4w4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 16 May 2024 16:50:40 +0200 (CEST)
Message-ID: <3b9c9649-c657-4636-b4ef-31df82c58bba@perex.cz>
Date: Thu, 16 May 2024 16:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Takashi Iwai <tiwai@suse.de>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk> <20240503094225.47fe4836@sal.lan>
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
 <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
 <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
 <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
 <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
 <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
 <c5dbb765-8c93-4050-84e1-c0f63b43d6c2@xs4all.nl>
 <8a6f84ac-5813-4954-b852-84f5118e607c@perex.cz> <87o7975qcw.wl-tiwai@suse.de>
 <e63ec6c8-7da7-4b87-b7ff-a71ff12dcfc1@perex.cz>
 <a60ee3505e551f3def6cdd7c76942d0fd74bc656.camel@ndufresne.ca>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <a60ee3505e551f3def6cdd7c76942d0fd74bc656.camel@ndufresne.ca>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, festevam@gmail.com, =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15. 05. 24 22:33, Nicolas Dufresne wrote:
> Hi,
> 
> GStreamer hat on ...
> 
> Le mercredi 15 mai 2024 à 12:46 +0200, Jaroslav Kysela a écrit :
>> On 15. 05. 24 12:19, Takashi Iwai wrote:
>>> On Wed, 15 May 2024 11:50:52 +0200,
>>> Jaroslav Kysela wrote:
>>>>
>>>> On 15. 05. 24 11:17, Hans Verkuil wrote:
>>>>> Hi Jaroslav,
>>>>>
>>>>> On 5/13/24 13:56, Jaroslav Kysela wrote:
>>>>>> On 09. 05. 24 13:13, Jaroslav Kysela wrote:
>>>>>>> On 09. 05. 24 12:44, Shengjiu Wang wrote:
>>>>>>>>>> mem2mem is just like the decoder in the compress pipeline. which is
>>>>>>>>>> one of the components in the pipeline.
>>>>>>>>>
>>>>>>>>> I was thinking of loopback with endpoints using compress streams,
>>>>>>>>> without physical endpoint, something like:
>>>>>>>>>
>>>>>>>>> compress playback (to feed data from userspace) -> DSP (processing) ->
>>>>>>>>> compress capture (send data back to userspace)
>>>>>>>>>
>>>>>>>>> Unless I'm missing something, you should be able to process data as fast
>>>>>>>>> as you can feed it and consume it in such case.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Actually in the beginning I tried this,  but it did not work well.
>>>>>>>> ALSA needs time control for playback and capture, playback and capture
>>>>>>>> needs to synchronize.  Usually the playback and capture pipeline is
>>>>>>>> independent in ALSA design,  but in this case, the playback and capture
>>>>>>>> should synchronize, they are not independent.
>>>>>>>
>>>>>>> The core compress API core no strict timing constraints. You can eventually0
>>>>>>> have two half-duplex compress devices, if you like to have really independent
>>>>>>> mechanism. If something is missing in API, you can extend this API (like to
>>>>>>> inform the user space that it's a producer/consumer processing without any
>>>>>>> relation to the real time). I like this idea.
>>>>>>
>>>>>> I was thinking more about this. If I am right, the mentioned use in gstreamer
>>>>>> is supposed to run the conversion (DSP) job in "one shot" (can be handled
>>>>>> using one system call like blocking ioctl).  The goal is just to offload the
>>>>>> CPU work to the DSP (co-processor). If there are no requirements for the
>>>>>> queuing, we can implement this ioctl in the compress ALSA API easily using the
>>>>>> data management through the dma-buf API. We can eventually define a new
>>>>>> direction (enum snd_compr_direction) like SND_COMPRESS_CONVERT or so to allow
>>>>>> handle this new data scheme. The API may be extended later on real demand, of
>>>>>> course.
>>>>>>
>>>>>> Otherwise all pieces are already in the current ALSA compress API
>>>>>> (capabilities, params, enumeration). The realtime controls may be created
>>>>>> using ALSA control API.
>>>>>
>>>>> So does this mean that Shengjiu should attempt to use this ALSA approach first?
>>>>
>>>> I've not seen any argument to use v4l2 mem2mem buffer scheme for this
>>>> data conversion forcefully. It looks like a simple job and ALSA APIs
>>>> may be extended for this simple purpose.
>>>>
>>>> Shengjiu, what are your requirements for gstreamer support? Would be a
>>>> new blocking ioctl enough for the initial support in the compress ALSA
>>>> API?
>>>
>>> If it works with compress API, it'd be great, yeah.
>>> So, your idea is to open compress-offload devices for read and write,
>>> then and let them convert a la batch jobs without timing control?
>>>
>>> For full-duplex usages, we might need some more extensions, so that
>>> both read and write parameters can be synchronized.  (So far the
>>> compress stream is a unidirectional, and the runtime buffer for a
>>> single stream.)
>>>
>>> And the buffer management is based on the fixed size fragments.  I
>>> hope this doesn't matter much for the intended operation?
>>
>> It's a question, if the standard I/O is really required for this case. My
>> quick idea was to just implement a new "direction" for this job supporting
>> only one ioctl for the data processing which will execute the job in "one
>> shot" at the moment. The I/O may be handled through dma-buf API (which seems
>> to be standard nowadays for this purpose and allows future chaining).
>>
>> So something like:
>>
>> struct dsp_job {
>>      int source_fd;     /* dma-buf FD with source data - for dma_buf_get() */
>>      int target_fd;     /* dma-buf FD for target data - for dma_buf_get() */
>>      ... maybe some extra data size members here ...
>>      ... maybe some special parameters here ...
>> };
>>
>> #define SNDRV_COMPRESS_DSPJOB _IOWR('C', 0x60, struct dsp_job)
>>
>> This ioctl will be blocking (thus synced). My question is, if it's feasible
>> for gstreamer or not. For this particular case, if the rate conversion is
>> implemented in software, it will block the gstreamer data processing, too.
> 
> Yes, GStreamer threading is using a push-back model, so blocking for the time of
> the processing is fine. Note that the extra simplicity will suffer from ioctl()
> latency.
> 
> In GFX, they solve this issue with fences. That allow setting up the next
> operation in the chain before the data has been produced.

The fences look really nicely and seem more modern. It should be possible with 
dma-buf/sync_file.c interface to handle multiple jobs simultaneously and share 
the state between user space and kernel driver.

In this case, I think that two non-blocking ioctls should be enough - add a 
new job with source/target dma buffers guarded by one fence and abort (flush) 
all active jobs.

I'll try to propose an API extension for the ALSA's compress API in the 
linux-sound mailing list soon.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

