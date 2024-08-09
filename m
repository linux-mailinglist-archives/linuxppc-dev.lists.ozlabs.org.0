Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD3A94D724
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 21:21:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BY82d7Gx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgYgF0t8bz2ykf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2024 05:21:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BY82d7Gx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgYfV5mQDz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2024 05:20:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723231251; x=1754767251;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EjHqHHKYoRZX3HoUBZAvpzA3I2pO6ift5GDZ3LPhRnc=;
  b=BY82d7Gx1Q4HrVajP7IkWbWt7hCaA7HbJSWOduwUEIo8n/CwurPrA2kH
   3wW8Tmx1a//Z588h8MMgeW1AM1+CkrRm+FOUT61/gjp5+Fwe727PZHqHM
   s28jWOpjNwMoCxWLiOSNEZvff8NvHRnEkf/HnkLPV3bIsq9EyL/mdWglx
   xBjzXJf+fq8X+sjmsKJkCL8KNnxR006vqFXc5orx+bYr1aoaGcHxpfEGM
   yOtxvQn4rweZO2eNW7wcFFp40TjgrczeWsD4UZEK9pjtOGp/+40B4HaA/
   bqWkenvmTICECpdcaHTbrVq9mrKrCzs7FWpQouSGW7QKfmrDLN1hCT2o2
   A==;
X-CSE-ConnectionGUID: adwI/vSJTletOpCMdJrmsw==
X-CSE-MsgGUID: e976BYc/TqGDPs5aduKGhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25285241"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="25285241"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 12:20:45 -0700
X-CSE-ConnectionGUID: WCOiZLDZT+WOhIWdX/i3CQ==
X-CSE-MsgGUID: UZY+OjWrRDqm300lv/H98g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="61793214"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.249]) ([10.245.246.249])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 12:20:41 -0700
Message-ID: <a41029df-a1a3-4540-b28d-55fbfc3dcf1c@linux.intel.com>
Date: Fri, 9 Aug 2024 21:20:39 +0200
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
 <ed1192e0-00e7-4739-a687-c96dc2d62898@linux.intel.com>
 <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
 <542d47c5-7ce3-4c17-8c0a-3a2b2a9e6c6a@linux.intel.com>
 <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c3b8f7b8-fc5e-4285-bee8-7edd448a405d@perex.cz>
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



>>> And metadata
>>> ioctl can be called many times which can meet the ratio modifier
>>> requirement (ratio may be drift on the fly)
>>
>> Interesting, that's yet another way of handling the drift with userspace
>> modifying the ratio dynamically. That's different to what I've seen
>> before.
> 
> Note that the "timing" is managed by the user space with this scheme.
> 
>>> And compress API uses codec as the unit for capability query and
>>> parameter setting,  So I think need to define "SND_AUDIOCODEC_SRC'
>>> and 'struct snd_dec_src',  for the 'snd_dec_src' just defined output
>>> format and output rate, channels definition just reuse the
>>> snd_codec.ch_in.
>>
>> The capability query is an interesting point as well, it's not clear how
>> to expose to userspace what this specific implementation can do, while
>> at the same time *requiring* userpace to update the ratio dynamically.
>> For something like this to work, userspace needs to have pre-existing
>> information on how the SRC works.
> 
> Yes, it's about abstraction. The user space wants to push data, read
> data back converted to the target rate and eventually modify the drift
> using a control managing clocks using own way. We can eventually assume,
> that if this control does not exist, the drift cannot be controlled.
> Also, nice thing is that the control has min and max values (range), so
> driver can specify the drift range, too.

This mode of operation would be fine, but if you add the SRC as part of
the processing allowed in a compressed stream, it might be used in a
'regular' real-time pipeline and the arguments  and implementation could
be very different.

In other words, this SRC support looks like an extension of the compress
API for a very narrow usage restricted to the memory-to-memory case
only. I worry a bit about the next steps... Are there going to be other
types of PCM processing like this, and if yes, how would we know if they
are intended to be used for the 'regular' compress API or for the
memory-to-memory scheme?
