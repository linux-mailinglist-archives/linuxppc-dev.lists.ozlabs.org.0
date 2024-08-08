Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA56994BC48
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 13:29:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mn90FOHQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WflDt5DDlz2xjL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 21:29:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mn90FOHQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 08 Aug 2024 21:28:42 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WflDB6X7yz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 21:28:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723116523; x=1754652523;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VmB/6QS1FQ+RUMXWz253lu/uSyqhXxIJWMc4iBtGTIA=;
  b=mn90FOHQRsXVGesi0fsMZqbkeKfB6m3srDcsHCWpPI97SUCmS9cBM6wS
   xnSAdbHUZJZpBPwrDqON/tUWyV9o5GkF6GQ8S7LFQ2hlmn759AOQ/6+8T
   /TEa88cX6YTt+ZlVblINPWTwEF7wQKSTy/3SJQxtRdhq7krxcnDakNRtx
   nCndG7ylWkjYkbRQDnesrtxhQEt1m2MH5lqgd/lE6EmS2/Xzgfg3Xkkfw
   X5MwgqN1q2P023wQRxz30j71CNOrYRpVNBTjZNxnJRCLO2wZ0yOD+LO3B
   MRQJnEhOaP8paNs9qd3GwXDIgw2/N5t9q4lOMVQp7ExzHbsvc/gVzWmOk
   Q==;
X-CSE-ConnectionGUID: 6jJ7e0cbRlapAERFa2tvFA==
X-CSE-MsgGUID: mKze557tRdOq7xFUgMpxKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38742182"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="38742182"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 04:27:36 -0700
X-CSE-ConnectionGUID: CU7zVrCdQxe/FdISjC4yqQ==
X-CSE-MsgGUID: oN5J9gC0QvOy35eh/N/PBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="61575228"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.169]) ([10.245.246.169])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 04:27:32 -0700
Message-ID: <ffa85004-8d86-4168-b278-afd24d79f9d8@linux.intel.com>
Date: Thu, 8 Aug 2024 13:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
 <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAA+D8AN9JXJr-BZf8aY7d4rB6M60pXS_DG=qv=P6=2r1A18ATA@mail.gmail.com>
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, linux-sound@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, vkoul@kernel.org, broonie@kernel.org, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/8/24 11:17, Shengjiu Wang wrote:
> On Tue, Aug 6, 2024 at 7:25 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>
>> On 8/6/24 12:26, Shengjiu Wang wrote:
>>> Add Sample Rate Converter(SRC) codec support, define the output
>>> format and rate for SRC.
>>>
>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>> ---
>>>  include/uapi/sound/compress_offload.h | 2 ++
>>>  include/uapi/sound/compress_params.h  | 9 ++++++++-
>>>  2 files changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
>>> index 98772b0cbcb7..8b2b72f94e26 100644
>>> --- a/include/uapi/sound/compress_offload.h
>>> +++ b/include/uapi/sound/compress_offload.h
>>> @@ -112,10 +112,12 @@ struct snd_compr_codec_caps {
>>>   * end of the track
>>>   * @SNDRV_COMPRESS_ENCODER_DELAY: no of samples inserted by the encoder at the
>>>   * beginning of the track
>>> + * @SNDRV_COMPRESS_SRC_RATIO_MOD: Resampling Ratio Modifier for sample rate converter
>>>   */
>>>  enum sndrv_compress_encoder {
>>>       SNDRV_COMPRESS_ENCODER_PADDING = 1,
>>>       SNDRV_COMPRESS_ENCODER_DELAY = 2,
>>> +     SNDRV_COMPRESS_SRC_RATIO_MOD = 3,
>>>  };
>>
>> this sounds wrong to me. The sample rate converter is not an "encoder",
>> and the properties for padding/delay are totally specific to an encoder
>> function.
> 
> There is only decoder and encoder definition for compress,  I know
> it is difficult to add SRC to encoder or decoder classification,
> SRC is a Post Processing.  I hope you can have a recommandation

I don't. I think we're blurring layers in a really odd way.

The main reason why the compress API was added is to remove the
byte-to-time conversions. But that's clearly not useful for a
post-processing of PCM data, where the bitrate is constant. It really
feels like we're adding this memory-to-memory API to the compress
framework because we don't have anything else available, not because it
makes sense to do so.

Then there's the issue of parameters, we chose to only add parameters
for standard encoders/decoders. Post-processing is highly specific and
the parameter definitions varies from one implementation to another -
and usually parameters are handled in an opaque way with binary
controls. This is best handled with a UUID that needs to be known only
to applications and low-level firmware/hardware, the kernel code should
not have to be modified for each and every processing and to add new
parameters. It just does not scale and it's unmaintainable.

At the very least if you really want to use this compress API, extend it
to use a non-descript "UUID-defined" type and an opaque set of
parameters with this UUID passed in a header.
