Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F18BFD06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 14:20:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C9xtJ5Q3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZDk80Xb4z3cWv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 22:20:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C9xtJ5Q3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=amadeuszx.slawinski@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZ7G76s13z30W9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 18:14:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715156049; x=1746692049;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o6dYzqcug6bjp99QH0Xc2b/Mh3Ae4lgbbIbqMs9s1So=;
  b=C9xtJ5Q3ZsSN2XLdUA/4WfL/mlECdl56mZG3+Q7gct+CewRodmM3uErx
   M12KuFfjenJ6kdXBErPkQ5sVKrTG0WUmwdwvtM8BFgvryK/uqPHo1VtNl
   yAC9xdvqLAr1Z5T3lAEd/Fc8+IzQBD2aGDiZb25zq3J131BvpIKK78C5j
   kBxHgkXA2uqsusIgym1ClpVZwiS0tjoP7SqgOkdS1q74YfmS5oqC6QH6g
   use+OBk3xQ+Dg9+yVt+6gQAA70p4Z9u6V8XDrVfVhTmRcGliSOl4MEdNN
   jjPmeEyWzftI6qLzCtH2TJJv8yzwcBGtVXfDfs1o+Dw5HH+B0ZODM6DDd
   w==;
X-CSE-ConnectionGUID: 9wWTSEyfSq22AE2ToU8V7Q==
X-CSE-MsgGUID: 9qldMMtEQC2GryiqPsnEcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="28474509"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="28474509"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 01:14:04 -0700
X-CSE-ConnectionGUID: aABURBGITHyA0xz96lfbdA==
X-CSE-MsgGUID: 8uRx8TfuRU256ZN4Nutk6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="59662273"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 01:13:57 -0700
Message-ID: <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
Date: Wed, 8 May 2024 10:13:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk> <20240430172752.20ffcd56@sal.lan>
 <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk> <87sez0k661.wl-tiwai@suse.de>
 <20240502095956.0a8c5b26@sal.lan> <20240502102643.4ee7f6c2@sal.lan>
 <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk> <20240503094225.47fe4836@sal.lan>
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 May 2024 22:19:39 +1000
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, nicoleotsuka@gmail.com, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, perex@perex.cz, linux-media@vger.kernel.org, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/8/2024 10:00 AM, Hans Verkuil wrote:
> On 06/05/2024 10:49, Shengjiu Wang wrote:
>> On Fri, May 3, 2024 at 4:42 PM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>>>
>>> Em Fri, 3 May 2024 10:47:19 +0900
>>> Mark Brown <broonie@kernel.org> escreveu:
>>>
>>>> On Thu, May 02, 2024 at 10:26:43AM +0100, Mauro Carvalho Chehab wrote:
>>>>> Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:
>>>>
>>>>>> There are still time control associated with it, as audio and video
>>>>>> needs to be in sync. This is done by controlling the buffers size
>>>>>> and could be fine-tuned by checking when the buffer transfer is done.
>>>>
>>>> ...
>>>>
>>>>> Just complementing: on media, we do this per video buffer (or
>>>>> per half video buffer). A typical use case on cameras is to have
>>>>> buffers transferred 30 times per second, if the video was streamed
>>>>> at 30 frames per second.
>>>>
>>>> IIRC some big use case for this hardware was transcoding so there was a
>>>> desire to just go at whatever rate the hardware could support as there
>>>> is no interactive user consuming the output as it is generated.
>>>
>>> Indeed, codecs could be used to just do transcoding, but I would
>>> expect it to be a border use case. See, as the chipsets implementing
>>> codecs are typically the ones used on mobiles, I would expect that
>>> the major use cases to be to watch audio and video and to participate
>>> on audio/video conferences.
>>>
>>> Going further, the codec API may end supporting not only transcoding
>>> (which is something that CPU can usually handle without too much
>>> processing) but also audio processing that may require more
>>> complex algorithms - even deep learning ones - like background noise
>>> removal, echo detection/removal, volume auto-gain, audio enhancement
>>> and such.
>>>
>>> On other words, the typical use cases will either have input
>>> or output being a physical hardware (microphone or speaker).
>>>
>>
>> All, thanks for spending time to discuss, it seems we go back to
>> the start point of this topic again.
>>
>> Our main request is that there is a hardware sample rate converter
>> on the chip, so users can use it in user space as a component like
>> software sample rate converter. It mostly may run as a gstreamer plugin.
>> so it is a memory to memory component.
>>
>> I didn't find such API in ALSA for such purpose, the best option for this
>> in the kernel is the V4L2 memory to memory framework I found.
>> As Hans said it is well designed for memory to memory.
>>
>> And I think audio is one of 'media'.  As I can see that part of Radio
>> function is in ALSA, part of Radio function is in V4L2. part of HDMI
>> function is in DRM, part of HDMI function is in ALSA...
>> So using V4L2 for audio is not new from this point of view.
>>
>> Even now I still think V4L2 is the best option, but it looks like there
>> are a lot of rejects.  If develop a new ALSA-mem2mem, it is also
>> a duplication of code (bigger duplication that just add audio support
>> in V4L2 I think).
> 
> After reading this thread I still believe that the mem2mem framework is
> a reasonable option, unless someone can come up with a method that is
> easy to implement in the alsa subsystem. From what I can tell from this
> discussion no such method exists.
> 

Hi,

my main question would be how is mem2mem use case different from 
loopback exposing playback and capture frontends in user space with DSP 
(or other piece of HW) in the middle?

Amadeusz

