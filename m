Return-Path: <linuxppc-dev+bounces-83-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C2A951A78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 13:58:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CkcQPkFs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkRbw2Ssgz2yMP;
	Wed, 14 Aug 2024 21:58:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CkcQPkFs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkRbs6M3Cz2yJL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 21:58:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723636714; x=1755172714;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pT803Kq6Wz6RBK3l5cGSiRM04ieGhjqvtUpKHRYq2bU=;
  b=CkcQPkFs9mLRN9GH5zDswLbTpJCEuPZpedoDgQheFiG/xSUCrC+hcj9r
   MMZKM38MUUpVfq4kaF0v5hgwo6+80SqHcA0/9aGUnv9gtX/pIGxmFuTsn
   Pv1YdX7H2K4HGsmFr1rrCqFFtwwC+98fQhfz6uiXOqtw0Hytd6RuRRKah
   VW/OZq4h1oE2P7IGfIbz3BRqCkjBhE+O4jvHSt/xe1Z927LnzCkcosVVU
   C4ERdvMy0qiJ9DPQCVWT5IWQJUKOuL1nnC9gqhUD7Jbk/cI0kG3P28mb3
   gzlHXmOUbr4oFNpSoKs/DcVo53Z4SjqOGYr/pZrfOIa2MXMDNPiUgLmUQ
   A==;
X-CSE-ConnectionGUID: IdVP1N0qSWGFiBigI393Yg==
X-CSE-MsgGUID: playq00RRVuYv1wc8YGtxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32470837"
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; 
   d="scan'208";a="32470837"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 04:58:28 -0700
X-CSE-ConnectionGUID: NpMJ2d0JRAuj66NXJE42xw==
X-CSE-MsgGUID: p7bfGS0/Tvae6Eglw6n09Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,145,1716274800"; 
   d="scan'208";a="58956636"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.67]) ([10.245.246.67])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 04:58:24 -0700
Message-ID: <55a82ba3-1c33-4d1b-9f5f-8af33d76222f@linux.intel.com>
Date: Wed, 14 Aug 2024 13:58:21 +0200
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
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 vkoul@kernel.org, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
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
 <7dc039db-ecce-4650-8eb7-96d0cfde09a2@linux.intel.com>
 <CAA+D8AMv=tHV3b-Rfo9Pjqs0bX5SVschD=WD06qxjJOk5zQmiQ@mail.gmail.com>
 <3cdb2041-59d4-4d43-ac4d-39d7f9640cef@linux.intel.com>
 <CAA+D8APSrH_pum6Cm0YxDzWMs4Roi=h1hkBjPMfXocXt7z4oVA@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAA+D8APSrH_pum6Cm0YxDzWMs4Roi=h1hkBjPMfXocXt7z4oVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/14/24 13:12, Shengjiu Wang wrote:
> On Wed, Aug 14, 2024 at 5:40 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>> Yes, to go further, I think we can use SND_AUDIOCODEC_PCM, then
>>> the SRC type will be dropped.
>>
>> sounds good.
>>
>>> But my understanding of the control means the .set_metadata() API, right?
>>> As I said, the output rate, output format, and ratio modifier are applied to
>>> the instances of ASRC,  which is the snd_compr_stream in driver.
>>> so only the .set_metadata() API can be used for these purposes.
>>
>> Humm, this is more controversial.
>>
>> The term 'metadata' really referred to known information present in
>> headers or additional ID3 tags and not in the compressed file itself.
>> The .set_metadata was assumed to be called ONCE before decoding.
>>
>> But here you have a need to update the ratio modifier on a regular basis
>> to compensate for the drift. This isn't what this specific callback was
>> designed for. We could change and allow this callback to be used
>> multiple times, but then this could create problems for existing
>> implementations which cannot deal with modified metadata on the fly.
> 
> .set_metadata can be called multi times now, no need to change currently.

Not really, this set_metadata() callback is used only for gapless
transitions between tracks, see fcplay.c in tinycompress.

And now I am really confused because tinycompress uses an IOCTL directly:

	metadata.key = SNDRV_COMPRESS_ENCODER_PADDING;
	metadata.value[0] = mdata->encoder_padding;
	if (ioctl(compress->fd, SNDRV_COMPRESS_SET_METADATA, &metadata))

Whereas you want to use the ops callback directly from the control layer?

What would present a userspace program from using the ioctl directly
then? In that case, why do we need the control? I must be missing something.


>> And then there's the problem of defining a 'key' for the metadata. the
>> definition of the key is a u32, so there's plenty of space for different
>> implementations, but a collision is possible. We'd need an agreement on
>> how to allocate keys to different solutions without changing the header
>> file for every implementation.
> 
> Can we define a private space for each case?   For example the key larger
> than 0x80000000 is private, each driver can define it by themself?

that would be a possibility indeed - provided that the opens above are
straightened out.

>> It sounds like we'd need a 'runtime params' callback - unless there's a
>> better trick to tie the control and compress layers?

