Return-Path: <linuxppc-dev+bounces-2201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 679D899C6AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 12:06:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRtD73h2rz2yYf;
	Mon, 14 Oct 2024 21:06:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728900375;
	cv=none; b=L1pSvXzxyWMEtsRKHE/yRHM4bTDtqx65pxWNc4J0ehZhI2VwPg1zUfOixT6O0SU2PRFt53uebo68vl4k9kz1shJxCPfbnBL1svkqNmnoCW8K5RgnYwPEVr6zHJMhqR1GXeHt6VjnFbLpdS+5xcW5sG1fMjXa1+TxUxDcPbb3PrTd6nmuraLYHxdRgxb4thzyUeMb1tI49p3GPaCHtBD1poISlCWyXI9BEBpJYnpN3tveHtnQndyHbQMLrjt170scE5aZYDc3/Nl1iPiWmCSLoSyf6xLWr7h/jiZqyE8sf8xHpTT2oN27LjtRkIo+35r++dz7vH7HzTmoeXgsA6xR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728900375; c=relaxed/relaxed;
	bh=wIPs40LitxG6Lhr1hU0tbJr+s6Q3AQ5cu6mKJD/Pc1Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYg1EgDXElSL23c8coK6Cf3eHREGQ2yKHtQU+0MqLAU7Mhn8kqQPht6hp8IoCPYN+oaIXvCgudJF+Lobm8trAWGsr4EuaD7DORqI6fMUifAYp/Dd6HDDYvox9RxbehALHDBSJ/+kdHLEziBZtF4d03Qe2NjKc3QfVlgHhBBPx1VNt0h06qW+vouwFJCakXFEOCXhI8Zv3fZm4r+cknAbp8+ejKPtrmOnJa7QoKE6B218UK0e5CbggJ+Q7pfANT35WAMuDX4xC1HjevsNmvN8LuH82RehBC2YS9TgVbY9Wb1M8rmAZvhDacc02kPWJNjt9XV1GlxleJ0zzEjJBao39g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D7+QpBvu; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yruzElfm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D7+QpBvu; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yruzElfm; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D7+QpBvu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yruzElfm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=D7+QpBvu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=yruzElfm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRtD51pxyz2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 21:06:12 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4AF2B1F391;
	Mon, 14 Oct 2024 10:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728900368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIPs40LitxG6Lhr1hU0tbJr+s6Q3AQ5cu6mKJD/Pc1Y=;
	b=D7+QpBvuErvdhPAbubxdV1BAkozfi7Eyh9/jt0dhNw1cvNi22MNs+PLA0M+pvtUWba1ZGS
	2PeRSkyYt7MHPixNvqjWqarYwaEyUMj+i6BRVobAKhVa3Z6+hGfwAlzDwKy8w82Y/NrPfH
	RfEOOpMv3INsRpmyjUG0VLhXNQUGRMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728900368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIPs40LitxG6Lhr1hU0tbJr+s6Q3AQ5cu6mKJD/Pc1Y=;
	b=yruzElfm380E+/Bl41LJJlRXJjjOz1+nXe6N5dqokp76lKnSOHdp5jx+d9HFTdHcG07IRz
	ZNH2oR/Vq4YL1XBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728900368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIPs40LitxG6Lhr1hU0tbJr+s6Q3AQ5cu6mKJD/Pc1Y=;
	b=D7+QpBvuErvdhPAbubxdV1BAkozfi7Eyh9/jt0dhNw1cvNi22MNs+PLA0M+pvtUWba1ZGS
	2PeRSkyYt7MHPixNvqjWqarYwaEyUMj+i6BRVobAKhVa3Z6+hGfwAlzDwKy8w82Y/NrPfH
	RfEOOpMv3INsRpmyjUG0VLhXNQUGRMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728900368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIPs40LitxG6Lhr1hU0tbJr+s6Q3AQ5cu6mKJD/Pc1Y=;
	b=yruzElfm380E+/Bl41LJJlRXJjjOz1+nXe6N5dqokp76lKnSOHdp5jx+d9HFTdHcG07IRz
	ZNH2oR/Vq4YL1XBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C852013A51;
	Mon, 14 Oct 2024 10:06:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8m0BLw/tDGedFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Oct 2024 10:06:07 +0000
Date: Mon, 14 Oct 2024 12:07:05 +0200
Message-ID: <87cyk3j8vq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 0/7] ASoC: fsl: add memory to memory function for ASRC
In-Reply-To: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,gmail.com,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 25 Sep 2024 08:55:09 +0200,
Shengjiu Wang wrote:
> 
> This function is base on the accelerator implementation
> for compress API:
> https://patchwork.kernel.org/project/alsa-devel/patch/20240731083843.59911-1-perex@perex.cz/
> Add it to this patch set.
> 
> Audio signal processing also has the requirement for memory to
> memory similar as Video.
> 
> This asrc memory to memory (memory ->asrc->memory) case is a non
> real time use case.
> 
> User fills the input buffer to the asrc module, after conversion, then asrc
> sends back the output buffer to user. So it is not a traditional ALSA playback
> and capture case.
> 
> Because we had implemented the "memory -> asrc ->i2s device-> codec"
> use case in ALSA.  Now the "memory->asrc->memory" needs
> to reuse the code in asrc driver, so the patch 1 and patch 2 is for refining
> the code to make it can be shared by the "memory->asrc->memory"
> driver.
> 
> Other change is to add memory to memory support for two kinds of i.MX ASRC
> modules.
> 
> changes in v4:
> - remove the RFC tag, no comments receive in v3
> - Add Jaroslav Kysela's patch in this patch set. because it may be
>   better for reviewing in a full patch set.
> - Fix the list_for_each_entry_reverse to list_for_each_entry_safe_reverse
> - Fix some coding style issues in Jaroslav Kysela's patch
> 
> changes in v3:
> - use Jaroslav's suggestion for header file compress_params.h (PATCH 01)
> - remove the ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE definition
> - remove ASRC_RATIO_MOD in this version because it uses .set_metadata()
>   Will wait Jaroslav's update or other better method in the future.
> - Address some comments from Pierre.
> 
> changes in v2:
> - Remove the changes in compress API
> - drop the SNDRV_COMPRESS_SRC_RATIO_MOD
> - drop the SND_AUDIOCODEC_SRC and struct snd_dec_src
> - define private metadata key value
>   ASRC_OUTPUT_FORMAT/ASRC_OUTPUT_RATE/ASRC_RATIO_MOD
> 
> Jaroslav Kysela (1):
>   ALSA: compress_offload: introduce accel operation mode
> 
> Shengjiu Wang (6):
>   ALSA: compress: Add output rate and output format support
>   ASoC: fsl_asrc: define functions for memory to memory usage
>   ASoC: fsl_easrc: define functions for memory to memory usage
>   ASoC: fsl_asrc_m2m: Add memory to memory function
>   ASoC: fsl_asrc: register m2m platform device
>   ASoC: fsl_easrc: register m2m platform device
> 
>  .../sound/designs/compress-accel.rst          | 136 ++++
>  include/sound/compress_driver.h               |  46 ++
>  include/uapi/sound/compress_offload.h         |  63 +-
>  include/uapi/sound/compress_params.h          |  23 +-
>  sound/core/Kconfig                            |   3 +
>  sound/core/compress_offload.c                 | 351 ++++++++-
>  sound/soc/fsl/Kconfig                         |   1 +
>  sound/soc/fsl/Makefile                        |   2 +-
>  sound/soc/fsl/fsl_asrc.c                      | 179 ++++-
>  sound/soc/fsl/fsl_asrc.h                      |   2 +
>  sound/soc/fsl/fsl_asrc_common.h               |  70 ++
>  sound/soc/fsl/fsl_asrc_m2m.c                  | 727 ++++++++++++++++++
>  sound/soc/fsl/fsl_easrc.c                     | 261 ++++++-
>  sound/soc/fsl/fsl_easrc.h                     |   4 +
>  14 files changed, 1851 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/sound/designs/compress-accel.rst
>  create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c

Are there any objections against this basic design and ABI?

The details of the implementations can be changed in future, but the
basic design and the ABI must be set in stone before merging.


thanks,

Takashi

