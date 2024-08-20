Return-Path: <linuxppc-dev+bounces-206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9132957ED4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 08:59:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp0gm4W6Rz2xtb;
	Tue, 20 Aug 2024 16:59:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oux/u/lB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp0gk35r0z2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 16:59:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724137154; x=1755673154;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NcREdHOzn6eEuhanW6i690bjb9VwRs6u8txLft1j9/Q=;
  b=Oux/u/lBjQnh5oAc1VC0NCM3VuAkF2ieTccgpYuOnkUpfYnEv3DnmJGK
   lQFtjwCUX9bFC0Gh7G/cvnsicl+dRRMAvnKA0OShtGYoJTTboDpXP7Jm3
   jox5/I5hFtjkMsthQKBSkhtuuFnhgv7KOnM9/GSs/zOOppX+mqEVkyaVd
   7vP7zDefASQ0B3t1SV3uhqSv3D1fD4vGqM/ZEiLG5VbA7qZGv854/S6kX
   cLHFYwoCpvnVe9tOacVCFip6hmUvOGtX3WC1Mnin6RmoWz6to+sb08sno
   /1Xw3d+jfMvE3cSEP06b/6YG7EDgZlQSJyoMeaEz9MaY3m6UztcAyACUw
   g==;
X-CSE-ConnectionGUID: sRQEufISRbWvUoLOxpoTeg==
X-CSE-MsgGUID: buF/zzBTQRGwD8xri6XOrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="25317857"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="25317857"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 23:59:10 -0700
X-CSE-ConnectionGUID: HkwFrFwHTIadBOLDMsLoOQ==
X-CSE-MsgGUID: kQY+sT18QaiAKg8czy5lKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="61179403"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.176]) ([10.245.246.176])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 23:59:07 -0700
Message-ID: <ceb54a27-144b-40ed-8de5-482f2b0664a0@linux.intel.com>
Date: Tue, 20 Aug 2024 08:59:04 +0200
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
Subject: Re: [RFC PATCH v2 4/6] ASoC: fsl_asrc_m2m: Add memory to memory
 function
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1723804959-31921-1-git-send-email-shengjiu.wang@nxp.com>
 <1723804959-31921-5-git-send-email-shengjiu.wang@nxp.com>
 <6d83cd58-5f02-414b-b627-a0022e071052@linux.intel.com>
 <CAA+D8ANDAxS42=9zOLQY_h_ihvJCmaXzE+_iZyxbSuikqt1CBw@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAA+D8ANDAxS42=9zOLQY_h_ihvJCmaXzE+_iZyxbSuikqt1CBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/20/24 04:53, Shengjiu Wang wrote:
> On Mon, Aug 19, 2024 at 3:42 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>
>> On 8/16/24 12:42, Shengjiu Wang wrote:
>>> Implement the ASRC memory to memory function using
>>> the compress framework, user can use this function with
>>> compress ioctl interface.
>>>
>>> Define below private metadata key value for output
>>> format, output rate and ratio modifier configuration.
>>> ASRC_OUTPUT_FORMAT 0x80000001
>>> ASRC_OUTPUT_RATE   0x80000002
>>> ASRC_RATIO_MOD     0x80000003
>>
>> Can the output format/rate change at run-time?
> 
> Seldom I think.
> 
>>
>> If no, then these parameters should be moved somewhere else - e.g.
>> hw_params or something.
> 
> This means I will do some changes in compress_params.h, add
> output format and output rate definition, follow Jaroslav's example
> right?

yes, having parameters for the PCM case would make sense.

>> I am still not very clear on the expanding the SET_METADATA ioctl to
>> deal with the ratio changes. This isn't linked to the control layer as
>> suggested before, and there's no precedent of calling it multiple times
>> during streaming.
> 
> Which control layer? if you means the snd_kcontrol_new?  it is bound
> with sound card,  but in my case,  I need to the control bind with
> the snd_compr_stream to support multi streams/instances.

I can only quote Jaroslav's previous answer:

"
This argument is not valid. The controls are bound to the card, but the
element identifiers have already iface (interface), device and subdevice
numbers. We are using controls for PCM devices for example. The binding
is straight.

Just add SNDRV_CTL_ELEM_IFACE_COMPRESS define and specify the compress
device number in the 'struct snd_ctl_elem_id'.
"

>> I also wonder how it was tested since tinycompress does not support this?
> 
> I wrote a unit test to test these ASRC M2M functions.

This should be shared IMHO, usually when we add/extend a new interface
it's best to have a userspace test program that can be used by others.

>>> +static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
>>> +                                     struct snd_compr_codec_caps *codec)
>>> +{
>>> +     struct fsl_asrc_m2m_cap cap;
>>> +     __u32 rates[MAX_NUM_BITRATES];
>>> +     snd_pcm_format_t k;
>>> +     int i = 0, j = 0;
>>> +     int ret;
>>> +
>>> +     ret = asrc->m2m_get_cap(&cap);
>>> +     if (ret)
>>> +             return -EINVAL;
>>> +
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_5512)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_5512);
>>
>> this doesn't sound compatible with the patch2 definitions?
>>
>> cap->rate_in = SNDRV_PCM_RATE_8000_768000;
> 
> This ASRC M2M driver is designed for two kinds of hw ASRC modules.
> 
> one cap is : cap->rate_in = SNDRV_PCM_RATE_8000_192000 | SNDRV_PCM_RATE_5512;
> another is : cap->rate_in = SNDRV_PCM_RATE_8000_768000;
> they are in patch2 and patch3
> 
> 
>>
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_8000)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_8000);
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_11025)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_11025);
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_16000)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_16000);
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_22050)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_22050);
>>
>> missing 24 kHz
> 
> There is no SNDRV_PCM_RATE_24000 in ALSA.

Right, but that doesn't mean 24kHz cannot be supported. We use
constraints in those cases. see quote from Takashi found with a 2s
Google search

https://mailman.alsa-project.org/pipermail/alsa-devel/2013-November/069356.html

"
CONTINUOUS means that any rate between the specified min and max is
fine, if no min or max is specified any rate is fine. KNOT means there
are rates supported other than the standard rates defines by ALSA, but
the other rates are enumerable. You'd typically specify them by
explicitly listing them all and use a list constraint or you'd use one
of the ratio constraints.
"

>>> +     if (cap.rate_in & SNDRV_PCM_RATE_32000)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_32000);
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_44100)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_44100);
>>> +     if (cap.rate_in & SNDRV_PCM_RATE_48000)
>>> +             rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_48000);
>>
>> missing 64kHz
> 
> Yes, will add it.


