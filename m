Return-Path: <linuxppc-dev+bounces-78-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A989517E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 11:40:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D94MTtSL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkNXd2YCWz2xg3;
	Wed, 14 Aug 2024 19:40:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D94MTtSL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkNXZ4y7gz2xbd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 19:40:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723628431; x=1755164431;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oqk/yZOBqPAJ0OhO/1w+U3YacKqLDREg7ya+gkJZJJY=;
  b=D94MTtSLeM1C5jC4StgsKElZB0PJ7MjShF3LsFMWtcIHBBc3RKrjud0f
   30akgFKmOeWF8eibfAtVacWG1dFf84msAvhLdno2+A7So28dgBYqQgYFV
   WEjoI4sCgzV2912I+lkQQUPVCPT3WVyW8QFQ3j+4pIjBrOSnDVyni07jI
   KF/FZKqledMPV1aw3u+Tsou/AuZxcm5KbKZMihaPAJgwoQhAM3s6HqPNO
   YbDRXO3au2pSwpiRFDEEwRCaYXpJdKYEUgwTJxpTzOZ2InIXgjgCx30aG
   JReDkpU/wLZ/JkZS2hKrTPVjA2a90UMwtJtq2Y3osOG6uxlPcRRwCF6zZ
   w==;
X-CSE-ConnectionGUID: /zDQO/UYR8uk1yvgmmYmGw==
X-CSE-MsgGUID: FSB03SsyQkm18evMw4bU6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25635383"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="25635383"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 02:40:25 -0700
X-CSE-ConnectionGUID: QoDtG2jcQa6/Jw1/h4JPTA==
X-CSE-MsgGUID: 8/qT9Z0oRlGlDA7pwKz4LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="58918758"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.67]) ([10.245.246.67])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 02:40:20 -0700
Message-ID: <3cdb2041-59d4-4d43-ac4d-39d7f9640cef@linux.intel.com>
Date: Wed, 14 Aug 2024 11:40:18 +0200
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
 <7dc039db-ecce-4650-8eb7-96d0cfde09a2@linux.intel.com>
 <CAA+D8AMv=tHV3b-Rfo9Pjqs0bX5SVschD=WD06qxjJOk5zQmiQ@mail.gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAA+D8AMv=tHV3b-Rfo9Pjqs0bX5SVschD=WD06qxjJOk5zQmiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> Yes, to go further, I think we can use SND_AUDIOCODEC_PCM, then
> the SRC type will be dropped.

sounds good.

> But my understanding of the control means the .set_metadata() API, right?
> As I said, the output rate, output format, and ratio modifier are applied to
> the instances of ASRC,  which is the snd_compr_stream in driver.
> so only the .set_metadata() API can be used for these purposes.

Humm, this is more controversial.

The term 'metadata' really referred to known information present in
headers or additional ID3 tags and not in the compressed file itself.
The .set_metadata was assumed to be called ONCE before decoding.

But here you have a need to update the ratio modifier on a regular basis
to compensate for the drift. This isn't what this specific callback was
designed for. We could change and allow this callback to be used
multiple times, but then this could create problems for existing
implementations which cannot deal with modified metadata on the fly.

And then there's the problem of defining a 'key' for the metadata. the
definition of the key is a u32, so there's plenty of space for different
implementations, but a collision is possible. We'd need an agreement on
how to allocate keys to different solutions without changing the header
file for every implementation.

It sounds like we'd need a 'runtime params' callback - unless there's a
better trick to tie the control and compress layers?


