Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BE194CB48
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 09:26:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j6G6fV+w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgFpM1MQRz2yh2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 17:26:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j6G6fV+w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgFnc4Bk9z2yRZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 17:25:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723188357; x=1754724357;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EZEmD9DuOTren8Yb/4Eh1tc1aNVW50mWaRZilWNBwi8=;
  b=j6G6fV+wZqpztoJYxnESVtIHLCeSeD2qzWo9B54oXuDPYYMYt+ljwL4z
   NSfRKcJ0OoYXSB4QFM9g3fn09smed0Ds8IFn/6Bm5SYYJOPaxHod1Vzn6
   jLMJ2Rq2SpxlY8zs6kOLXQLjN7J/Qx6QDGFlpluZDxdiv7mKq5ycjxuCw
   5sGPlA1Kmm1FhWdQQI4xB6ClYVLUq2+Q4ULWRdh03/wMFXfH6c9pICjcD
   TpFF0oDB46yWSCxCc8PO3vRwyV9tgclu6xNr71xIPB1H5mPK/eWYI6R5T
   FDfRFSY2mRMuGPWP4QV6yIB8Cy/aZQK2KADwm3bsosbD2bRUwhz9scRiE
   g==;
X-CSE-ConnectionGUID: h0LrJztzRLeY0uqy2cWiUw==
X-CSE-MsgGUID: 2h1b5hRVQBu+aUxhHlZTqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="12929856"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="12929856"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 00:25:50 -0700
X-CSE-ConnectionGUID: gLUemNmQTBu18Mf1kZVGHQ==
X-CSE-MsgGUID: Q8VA64rwRrKZxNZdPwAWKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="57360819"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.249]) ([10.245.246.249])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 00:25:45 -0700
Message-ID: <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
Date: Fri, 9 Aug 2024 09:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
 <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
 <116041ee-7139-4b77-89be-3a68f699c01b@perex.cz>
 <930bb152-860a-4ec5-9ef0-1c96f554f365@linux.intel.com>
 <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c9039808-cd04-452d-9f6c-f91811088456@perex.cz>
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
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com, vkoul@kernel.org, broonie@kernel.org, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>>>> Then there's the issue of parameters, we chose to only add parameters
>>>> for standard encoders/decoders. Post-processing is highly specific and
>>>> the parameter definitions varies from one implementation to another -
>>>> and usually parameters are handled in an opaque way with binary
>>>> controls. This is best handled with a UUID that needs to be known only
>>>> to applications and low-level firmware/hardware, the kernel code should
>>>> not have to be modified for each and every processing and to add new
>>>> parameters. It just does not scale and it's unmaintainable.
>>>>
>>>> At the very least if you really want to use this compress API,
>>>> extend it
>>>> to use a non-descript "UUID-defined" type and an opaque set of
>>>> parameters with this UUID passed in a header.
>>>
>>> We don't need to use UUID-defined scheme for simple (A)SRC
>>> implementation. As I noted, the specific runtime controls may use
>>> existing ALSA control API.
>>
>> "Simple (A)SRC" is an oxymoron. There are multiple ways to define the
>> performance, and how the drift estimator is handled. There's nothing
>> simple if you look under the hood. The SOF implementation has for
>> example those parameters:
>>
>> uint32_t source_rate;           /**< Define fixed source rate or */
>>                 /**< use 0 to indicate need to get */
>>                 /**< the rate from stream */
>> uint32_t sink_rate;             /**< Define fixed sink rate or */
>>                 /**< use 0 to indicate need to get */
>>                 /**< the rate from stream */
>> uint32_t asynchronous_mode;     /**< synchronous 0, asynchronous 1 */
>>                 /**< When 1 the ASRC tracks and */
>>                 /**< compensates for drift. */
>> uint32_t operation_mode;        /**< push 0, pull 1, In push mode the */
>>                 /**< ASRC consumes a defined number */
>>                 /**< of frames at input, with varying */
>>                 /**< number of frames at output. */
>>                 /**< In pull mode the ASRC outputs */
>>                 /**< a defined number of frames while */
>>                 /**< number of input frames varies. */
>>
>> They are clearly different from what is suggested above with a 'ratio-
>> mod'.
> 
> I don't think so. The proposed (A)SRC for compress-accel is just one
> case for the above configs where the input is known and output is
> controlled by the requested rate. The I/O mechanism is abstracted enough
> in this case and the driver/hardware/firmware must follow it.

ASRC is usually added when the nominal rates are known but the clock
sources differ and the drift needs to be estimated at run-time and the
coefficients or interpolation modified dynamically

If the ratio is known exactly and there's no clock drift, then it's a
different problem where the filter coefficients are constant.

>> Same if you have a 'simple EQ'. there are dozens of ways to implement
>> the functionality with FIR, IIR or a combination of the two, and
>> multiple bands.
>>
>> The point is that you have to think upfront about a generic way to pass
>> parameters. We didn't have to do it for encoders/decoders because we
>> only catered to well-documented standard solutions only. By choosing to
>> support PCM processing, a new can of worms is now open.
>>
>> I repeat: please do not make the mistake of listing all processing with
>> an enum and a new structure for parameters every time someone needs a
>> specific transform in their pipeline. We made that mistake with SOF and
>> had to backtrack rather quickly. The only way to scale is an identifier
>> that is NOT included in the kernel code but is known to higher and
>> lower-levels only.
> 
> There are two ways - black box (UUID - as you suggested) - or well
> defined purpose (abstraction). For your example 'simple EQ', the
> parameters should be the band (frequency range) volume values. It's
> abstract and the real filters (resp. implementation) used behind may
> depend on the hardware/driver capabilities.

Indeed there is a possibility that the parameters are high-level, but
that would require firmware or hardware to be able to generate actual
coefficients from those parameters. That usually requires some advanced
math which isn't necessarily obvious to implement with fixed-point hardware.

> From my view, the really special cases may be handled as black box, but
> others like (A)SRC should follow some well-defined abstraction IMHO to
> not force user space to handle all special cases.

I am not against the high-level abstractions, e.g. along the lines of
what Android defined:
https://developer.android.com/reference/android/media/audiofx/AudioEffect

That's not sufficient however, we also need to make sure there's an
ability to provide pre-computed coefficients in an opaque manner for
processing that doesn't fit in the well-defined cases. In practice there
are very few 3rd party IP that fits in well-defined cases, everyone has
secret-sauce parameters and options.
