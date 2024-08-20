Return-Path: <linuxppc-dev+bounces-217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A15EF958105
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 10:31:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp2jv38sZz2y8W;
	Tue, 20 Aug 2024 18:31:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lNxcYCAn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp2js1Q7tz2y33
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 18:31:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724142673; x=1755678673;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SxmH7pCBUCC/+QtkYdWoPaRpX3/WrQ/u9Dt4Kgg2sL8=;
  b=lNxcYCAnVAgZNShfF3lPAGaXa3RKU9DWI0GjT6uWLREpoRof072cb+hs
   IZNHtdFPekHucGmJx02jTKQcyIPkvqarA1YTKzwt7KfXzCC2YvwdT+wOf
   pgdmO/mlIcLz1sP5SvWcTMqiITafvUI7u6gQoNN2gHn0QYXVKdsme4RaO
   TfVBeoUAUUmegJcSKhrnd70vBzW/Bi2Cvxc4xauLiT1g1BlAUF3GUf5Bx
   9a9zybGXX12b6ayy77/nEZ361YEWb7WBlhZk77cexiM8PUbPVe1NqF9P6
   wE0XAl+McPxYy9v3fhFMqQNaa0EtPCnogZdWdb5IAijS1NummTkBEP+pl
   A==;
X-CSE-ConnectionGUID: GwnStFAkQbCsG2hQ0msQbA==
X-CSE-MsgGUID: kMCqh/FORzum/fie0gTw1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26293746"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="26293746"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 01:30:31 -0700
X-CSE-ConnectionGUID: 6z9L+SnLRMOV5s7hbb1iIg==
X-CSE-MsgGUID: MjGIrylhS/StVmcl8sSHaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="64838542"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.176]) ([10.245.246.176])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 01:30:27 -0700
Message-ID: <0cd6ed17-0bbd-4a72-884a-632c7de3977f@linux.intel.com>
Date: Tue, 20 Aug 2024 10:30:24 +0200
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
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1723804959-31921-1-git-send-email-shengjiu.wang@nxp.com>
 <1723804959-31921-5-git-send-email-shengjiu.wang@nxp.com>
 <6d83cd58-5f02-414b-b627-a0022e071052@linux.intel.com>
 <CAA+D8ANDAxS42=9zOLQY_h_ihvJCmaXzE+_iZyxbSuikqt1CBw@mail.gmail.com>
 <ceb54a27-144b-40ed-8de5-482f2b0664a0@linux.intel.com>
 <CAA+D8ANqb89UavAXTiHvcHyv9uMt8_MYR9hfBaxEJDPNy5C=-g@mail.gmail.com>
 <eceafeef-2dba-48aa-b8b3-198b9bb39fb6@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <eceafeef-2dba-48aa-b8b3-198b9bb39fb6@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/20/24 09:42, Jaroslav Kysela wrote:
> On 20. 08. 24 9:37, Shengjiu Wang wrote:
>> On Tue, Aug 20, 2024 at 2:59 PM Pierre-Louis Bossart
>> <pierre-louis.bossart@linux.intel.com> wrote:
>>>
>>>
>>>
>>> On 8/20/24 04:53, Shengjiu Wang wrote:
>>>> On Mon, Aug 19, 2024 at 3:42 PM Pierre-Louis Bossart
>>>> <pierre-louis.bossart@linux.intel.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 8/16/24 12:42, Shengjiu Wang wrote:
>>>>>> Implement the ASRC memory to memory function using
>>>>>> the compress framework, user can use this function with
>>>>>> compress ioctl interface.
>>>>>>
>>>>>> Define below private metadata key value for output
>>>>>> format, output rate and ratio modifier configuration.
>>>>>> ASRC_OUTPUT_FORMAT 0x80000001
>>>>>> ASRC_OUTPUT_RATE   0x80000002
>>>>>> ASRC_RATIO_MOD     0x80000003
>>>>>
>>>>> Can the output format/rate change at run-time?
>>>>
>>>> Seldom I think.
>>>>
>>>>>
>>>>> If no, then these parameters should be moved somewhere else - e.g.
>>>>> hw_params or something.
>>>>
>>>> This means I will do some changes in compress_params.h, add
>>>> output format and output rate definition, follow Jaroslav's example
>>>> right?
>>>
>>> yes, having parameters for the PCM case would make sense.
>>>
>>>>> I am still not very clear on the expanding the SET_METADATA ioctl to
>>>>> deal with the ratio changes. This isn't linked to the control layer as
>>>>> suggested before, and there's no precedent of calling it multiple
>>>>> times
>>>>> during streaming.
>>>>
>>>> Which control layer? if you means the snd_kcontrol_new?  it is bound
>>>> with sound card,  but in my case,  I need to the control bind with
>>>> the snd_compr_stream to support multi streams/instances.
>>>
>>> I can only quote Jaroslav's previous answer:
>>>
>>> "
>>> This argument is not valid. The controls are bound to the card, but the
>>> element identifiers have already iface (interface), device and subdevice
>>> numbers. We are using controls for PCM devices for example. The binding
>>> is straight.
>>>
>>> Just add SNDRV_CTL_ELEM_IFACE_COMPRESS define and specify the compress
>>> device number in the 'struct snd_ctl_elem_id'.
>>> "
>>
>> I don't think it is doable,  or at least I don't know how to do it.
>>
>> My case is just one card/one device/one subdevice.  can't use it to
>> distinguish multi streams.
> 
> I already wrote that the compress core code should be extended to
> support subdevices like other ALSA APIs. I'll work on it. For now, just
> add support for one converter.

I am not sure I get the benefits of subdevices in this context.

Can we not use different devices already, one per hardware ASRC instance?

Put differently, what would be the difference between a card with N
compressed devices or a card with 1 compressed device and N subdevices?


