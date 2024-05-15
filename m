Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F0F8C684C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 16:09:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fHk5Icr+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfZpY6qY3z3g8P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 00:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fHk5Icr+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 16 May 2024 00:05:55 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfZkq1Xmvz3gFD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 00:05:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715781956; x=1747317956;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Is9J5YRpNzvklFE+cfQ23ylGaJ3nXqCLhHCxIrAy0f4=;
  b=fHk5Icr+feFHHQ4bjBldE6oy06cxJiuy6/R5o//kD1IJLukhqLtQhj0T
   87s3nuDP56Z4dfp/J0YGrvw/cMgmcEdtJIBC946mfFarlUmeDQwdtwCt9
   fzSNd2rQoGzVfoaDDbPWAVPSCUO42eNQCOqT93HA10uxm0b4yYRSTS7A7
   qI0/aYv5eNxtbTqkE+OilKqrZY88sRQ607kQYwKJhBO3tjtaN5QOp6/+5
   09uT8bFeNUZ4ebX97e78JaIQ/W4fuM6Yr1PYTZj+2CKK3wRTTEI8nDVjK
   dSsxdYbuXnrV8Gp5jWc1j5ZepHkV/5vdkji4fnxlbLRA98QY26n/SQcVj
   g==;
X-CSE-ConnectionGUID: RDACZYMASwuMz+556l0z4Q==
X-CSE-MsgGUID: KJIkoup1Qja9Yj59+zh3lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23234040"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="23234040"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 07:04:44 -0700
X-CSE-ConnectionGUID: ureli23YTFOv+UNUpcaPtw==
X-CSE-MsgGUID: 4mxvp+5zQbCHGtglpG+BDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="35778478"
Received: from wtcline-desk12.amr.corp.intel.com (HELO [10.125.108.49]) ([10.125.108.49])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 07:04:42 -0700
Message-ID: <4170720a-f7bb-484e-9235-a8720cec92c1@linux.intel.com>
Date: Wed, 15 May 2024 09:04:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang
 <shengjiu.wang@gmail.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Sebastian Fricke <sebastian.fricke@collabora.com>, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, Hans Verkuil <hverkuil@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>, sakari.ailus@iki.fi, Mauro Carvalho Chehab <mchehab@kernel.org>, festevam@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/9/24 06:13, Jaroslav Kysela wrote:
> On 09. 05. 24 12:44, Shengjiu Wang wrote:
>>>> mem2mem is just like the decoder in the compress pipeline. which is
>>>> one of the components in the pipeline.
>>>
>>> I was thinking of loopback with endpoints using compress streams,
>>> without physical endpoint, something like:
>>>
>>> compress playback (to feed data from userspace) -> DSP (processing) ->
>>> compress capture (send data back to userspace)
>>>
>>> Unless I'm missing something, you should be able to process data as fast
>>> as you can feed it and consume it in such case.
>>>
>>
>> Actually in the beginning I tried this,  but it did not work well.
>> ALSA needs time control for playback and capture, playback and capture
>> needs to synchronize.  Usually the playback and capture pipeline is
>> independent in ALSA design,  but in this case, the playback and capture
>> should synchronize, they are not independent.
> 
> The core compress API core no strict timing constraints. You can
> eventually0 have two half-duplex compress devices, if you like to have
> really independent mechanism. If something is missing in API, you can
> extend this API (like to inform the user space that it's a
> producer/consumer processing without any relation to the real time). I
> like this idea.

The compress API was never intended to be used this way. It was meant to
send compressed data to a DSP for rendering, and keep the host processor
in a low-power state while the DSP local buffer was drained. There was
no intent to do a loop back to the host, because that keeps the host in
a high-power state and probably negates the power savings due to a DSP.

The other problem with the loopback is that the compress stuff is
usually a "Front-End" in ASoC/DPCM parlance, and we don't have a good
way to do a loopback between Front-Ends. The entire framework is based
on FEs being connected to BEs.

One problem that I can see for ASRC is that it's not clear when the data
will be completely processed on the "capture" stream when you stop the
"playback" stream. There's a non-zero risk of having a truncated output
or waiting for data that will never be generated.

In other words, it might be possible to reuse/extend the compress API
for a 'coprocessor' approach without any rendering to traditional
interfaces, but it's uncharted territory.
