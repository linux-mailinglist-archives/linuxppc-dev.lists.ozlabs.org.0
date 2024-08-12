Return-Path: <linuxppc-dev+bounces-22-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E39B94F960
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:09:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JJNnfOm/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTFF2Q11z2xQ9;
	Tue, 13 Aug 2024 08:09:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JJNnfOm/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjG3J0YRWz2xbd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 23:44:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723470285; x=1755006285;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/RjqGAxXdDn5eYnASyKXGIi+4WtLzhr+cDrkdx8Rpxs=;
  b=JJNnfOm/c15seEIPYit+eacOeTEXqyZJNECBqUjTqozatv5kPtd1+cqv
   p2i4JorB9qRVOET2DXD/nrcrf8F+A5TyxzIe+HHBcsTMa81pchGMBlkFy
   1Zn7sUaOEa2w9DnZ3qYhTqXO/tdqczdrHE+zIPszVhxC58+JbnnYZV8Mr
   jeKq36CDVZsiZ35wcs1iQpBEPXMH0dSh7+G8bwMqFAkHRS7qdybh2n/sp
   KxgFgiKgRXcUID3R1/s26IT3uG5XbergGg0uvmKncuLdmdcg51UOtSVcQ
   9GGsA2Q0YyuX41CCG+vNKHX62mS4k7UlSX5oMuqtCZ0bV60NNwY1K2qjX
   w==;
X-CSE-ConnectionGUID: GfhYDTL4TzK7858LsXS0uw==
X-CSE-MsgGUID: DGq7RBOnQISlIMg9ePHleA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25444662"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="25444662"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 06:43:12 -0700
X-CSE-ConnectionGUID: LhzXRniDSz68H7GhGTzgEQ==
X-CSE-MsgGUID: H21YVEE1T46GE24AgW31Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="57925733"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.115]) ([10.245.246.115])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 06:43:07 -0700
Message-ID: <7dc039db-ecce-4650-8eb7-96d0cfde09a2@linux.intel.com>
Date: Mon, 12 Aug 2024 15:43:05 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
 <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com>
 <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
 <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
 <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
 <542d47c5-7ce3-4c17-8c0a-3a2b2a9e6c6a@linux.intel.com>
 <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
 <CAA+D8ANg7C7vuxU44mAG8EnmcZjB_te5N_=4M4v_-Q9ZyPZ49g@mail.gmail.com>
 <2be4303e-58e1-4ad7-92cf-f06fa6fa0f08@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2be4303e-58e1-4ad7-92cf-f06fa6fa0f08@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/12/24 15:31, Jaroslav Kysela wrote:
> On 12. 08. 24 12:24, Shengjiu Wang wrote:
>> On Fri, Aug 9, 2024 at 10:01 PM Jaroslav Kysela <perex@perex.cz> wrote:
>>>
>>> On 09. 08. 24 14:52, Pierre-Louis Bossart wrote:
>>>
>>>>> And metadata
>>>>> ioctl can be called many times which can meet the ratio modifier
>>>>> requirement (ratio may be drift on the fly)
>>>>
>>>> Interesting, that's yet another way of handling the drift with
>>>> userspace
>>>> modifying the ratio dynamically. That's different to what I've seen
>>>> before.
>>>
>>> Note that the "timing" is managed by the user space with this scheme.
>>>
>>>>> And compress API uses codec as the unit for capability query and
>>>>> parameter setting,  So I think need to define "SND_AUDIOCODEC_SRC'
>>>>> and 'struct snd_dec_src',  for the 'snd_dec_src' just defined output
>>>>> format and output rate, channels definition just reuse the
>>>>> snd_codec.ch_in.
>>>>
>>>> The capability query is an interesting point as well, it's not clear
>>>> how
>>>> to expose to userspace what this specific implementation can do, while
>>>> at the same time *requiring* userpace to update the ratio dynamically.
>>>> For something like this to work, userspace needs to have pre-existing
>>>> information on how the SRC works.
>>>
>>> Yes, it's about abstraction. The user space wants to push data, read
>>> data back
>>> converted to the target rate and eventually modify the drift using a
>>> control
>>> managing clocks using own way. We can eventually assume, that if this
>>> control
>>> does not exist, the drift cannot be controlled. Also, nice thing is
>>> that the
>>> control has min and max values (range), so driver can specify the
>>> drift range,
>>> too.
>>>
>>> And again, look to "PCM Rate Shift 100000" control implementation in
>>> sound/drivers/aloop.c. It would be nice to have the base offset for the
>>> shift/drift/pitch value standardized.
>>
>> Thanks.
>>
>> But the ASRC driver I implemented is different, I just register one sound
>> card, one device/subdevice.  but the ASRC hardware support 4 instances
>> together, so user can open the card device 4 times to create 4 instances
>> then the controls can only bind with compress streams.
> 
> It's just a reason to add the subdevice code for the compress offload
> layer like we have in other APIs for overall consistency. I'll try to
> work on this.

I thought this was supported already? I remember there was a request to
enable more than one compressed stream for enhanced cross-fade support
with different formats? That isn't supported with the single-device +
PARTIAL_DRAIN method.

Vinod?

>> I think I can remove the 'SNDRV_COMPRESS_SRC_RATIO_MOD',
> 
> Yes.
> 
>> Only define a private type for driver,  which means only the ASRC driver
>> and its user application know the type.
> 
> The control API should be used for this IMHO.

Agree, this would be a 'clean' split where the compress API is used for
the data parts and the control parts used otherwise to alter the ratio
or whatever else is needed.

>> For the change in 'include/uapi/sound/compress_params.h",  should I
>> keep them,  is there any other suggestion for them?

You can add the SRC type but if you use a control for the parameters you
don't need to add anything for the encoder options, do you?



