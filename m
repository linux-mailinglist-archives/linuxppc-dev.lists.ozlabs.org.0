Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B727694D08E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 14:53:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CZWnbykh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgP3s4brkz2ywC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 22:53:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CZWnbykh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgP3738LWz2yYn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 22:53:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723207988; x=1754743988;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=StJCn56NfSCbXiuX84fVBJOp8AURT5jnW7GtHmbmadE=;
  b=CZWnbykhMYX3YLEMUr9UKNFag6epoyAyfACSN3NVLxrb/Z+mOzmB6KlK
   7nqrtVxc+vlQDaYFctjRUl8zmRp1ViRgNIHHtFj0LXB9aQGEaDBNkNpnl
   1PTcj6ntuVV15kH9I+Vm1wIRDTkcsCw0ZrbV7rd8YYv08W4zzZjKDnGG+
   ftGVeWYc5+mzu2i1m63nO0kvEf8aULTWErs5VnG2Tp3H+UHKPUazTxylN
   z7SGXdrhdq8sAEJ4ZFPRsVtxk/4xDhhZ4vVfjzD79DxP4cW0H3XNpihO3
   aDUJixjOFgGYLKoxqMyM+uFuKJwl8gu/OW168ZUctRVJtwsXFa3mk5KoR
   A==;
X-CSE-ConnectionGUID: SyQaokQvTGaag3RYO0H4dQ==
X-CSE-MsgGUID: dWeZC/xETAKT3bgID0TN6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="20942068"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="20942068"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 05:53:03 -0700
X-CSE-ConnectionGUID: HUnwVTzaQ3um/ldO5hPmgA==
X-CSE-MsgGUID: iVCjZyP7QSiYLwxvT1CzWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="80791690"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.249]) ([10.245.246.249])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 05:52:58 -0700
Message-ID: <542d47c5-7ce3-4c17-8c0a-3a2b2a9e6c6a@linux.intel.com>
Date: Fri, 9 Aug 2024 14:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Shengjiu Wang <shengjiu.wang@gmail.com>
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, nicoleotsuka@gmail.com, vkoul@kernel.org, broonie@kernel.org, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> Why I use the metadata ioctl is because the ALSA controls are binding
> to the sound card.  What I want is the controls can be bound to
> snd_compr_stream, because the ASRC compress sound card can
> support multi instances ( the ASRC can support multi conversion in
> parallel).   The ALSA controls can't be used for this case,  the only
> choice in current compress API is metadata ioctl. 

I don't know if there is really a technical limitation for this, this is
for Jaroslav to comment. I am not sure why it would be a problem to e.g.
have a volume control prior to an encoder or after a decoder.

> And metadata
> ioctl can be called many times which can meet the ratio modifier
> requirement (ratio may be drift on the fly)

Interesting, that's yet another way of handling the drift with userspace
modifying the ratio dynamically. That's different to what I've seen before.

> And compress API uses codec as the unit for capability query and
> parameter setting,  So I think need to define "SND_AUDIOCODEC_SRC'
> and 'struct snd_dec_src',  for the 'snd_dec_src' just defined output
> format and output rate, channels definition just reuse the snd_codec.ch_in.

The capability query is an interesting point as well, it's not clear how
to expose to userspace what this specific implementation can do, while
at the same time *requiring* userpace to update the ratio dynamically.
For something like this to work, userspace needs to have pre-existing
information on how the SRC works.
