Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4F58C6382
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 11:17:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfSLL1zGFz3cZ1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 19:17:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=xs4all.nl
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=pqbr=ms=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfSKs2nN4z30Wh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 19:17:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67F0561484;
	Wed, 15 May 2024 09:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579ABC116B1;
	Wed, 15 May 2024 09:17:14 +0000 (UTC)
Message-ID: <c5dbb765-8c93-4050-84e1-c0f63b43d6c2@xs4all.nl>
Date: Wed, 15 May 2024 11:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang
 <shengjiu.wang@gmail.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
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
 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
 <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
 <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
 <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <850a80b2-d952-4c14-bd0b-98cb5a5c0233@perex.cz>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, Mauro Carvalho Chehab <mchehab@kernel.org>, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jaroslav,

On 5/13/24 13:56, Jaroslav Kysela wrote:
> On 09. 05. 24 13:13, Jaroslav Kysela wrote:
>> On 09. 05. 24 12:44, Shengjiu Wang wrote:
>>>>> mem2mem is just like the decoder in the compress pipeline. which is
>>>>> one of the components in the pipeline.
>>>>
>>>> I was thinking of loopback with endpoints using compress streams,
>>>> without physical endpoint, something like:
>>>>
>>>> compress playback (to feed data from userspace) -> DSP (processing) ->
>>>> compress capture (send data back to userspace)
>>>>
>>>> Unless I'm missing something, you should be able to process data as fast
>>>> as you can feed it and consume it in such case.
>>>>
>>>
>>> Actually in the beginning I tried this,  but it did not work well.
>>> ALSA needs time control for playback and capture, playback and capture
>>> needs to synchronize.  Usually the playback and capture pipeline is
>>> independent in ALSA design,  but in this case, the playback and capture
>>> should synchronize, they are not independent.
>>
>> The core compress API core no strict timing constraints. You can eventually0
>> have two half-duplex compress devices, if you like to have really independent
>> mechanism. If something is missing in API, you can extend this API (like to
>> inform the user space that it's a producer/consumer processing without any
>> relation to the real time). I like this idea.
> 
> I was thinking more about this. If I am right, the mentioned use in gstreamer 
> is supposed to run the conversion (DSP) job in "one shot" (can be handled 
> using one system call like blocking ioctl).  The goal is just to offload the 
> CPU work to the DSP (co-processor). If there are no requirements for the 
> queuing, we can implement this ioctl in the compress ALSA API easily using the 
> data management through the dma-buf API. We can eventually define a new 
> direction (enum snd_compr_direction) like SND_COMPRESS_CONVERT or so to allow 
> handle this new data scheme. The API may be extended later on real demand, of 
> course.
> 
> Otherwise all pieces are already in the current ALSA compress API 
> (capabilities, params, enumeration). The realtime controls may be created 
> using ALSA control API.

So does this mean that Shengjiu should attempt to use this ALSA approach first?

If there is a way to do this reasonably cleanly in the ALSA API, then that
obviously is much better from my perspective as a media maintainer.

My understanding was always that it can't be done (or at least not without
a major effort) in ALSA, and in that case V4L2 is a decent plan B, but based
on this I gather that it is possible in ALSA after all.

So can I shelf this patch series for now?

Regards,

	Hans

