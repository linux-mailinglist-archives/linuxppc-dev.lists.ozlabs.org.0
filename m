Return-Path: <linuxppc-dev+bounces-167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A09C9564D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 09:42:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnPgh5cfPz2xtc;
	Mon, 19 Aug 2024 17:42:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mUJYcdka;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnPgf2Tglz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 17:42:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724053327; x=1755589327;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=XhaDNYPtumre+DlT/8KrzFiXd1NiecHLNyAbKknf9t4=;
  b=mUJYcdkavnmJ6ivtL58RJBRsVcStBMVMz12Xv36p8qjSHEnMWRUX8L3c
   bof/Lcgwfq0zOT2qKAxlfVnuCHQ17D6XyTZUonp9l3aur9QaQ9BrOaG6M
   X+l4KSE/njKD0nYvNdoqxWvdv9ZMY5ZAxLBZoeL9Tyd99JqYraljJKdKT
   4KysDF3+p71HLOL6UabvXO+ecgmuIwhGqNgkIqmD3bBzfnzEVRhQVqdRn
   1d8vMbujeFtdjXl9Zl5BUVi0Z1BXtO6wdY44TG1khwEf2vIscQpE3OeYD
   9iJ79HHHskM3k2dtRiuU7vo8ZE5kNqZA/HZ26g8R6LqyySLEihbt0gm9F
   Q==;
X-CSE-ConnectionGUID: MvT2hhX9TQ+iY1i8sMCduQ==
X-CSE-MsgGUID: ExByKu8rRqyGscGJkGAPAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26079153"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="26079153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 00:42:02 -0700
X-CSE-ConnectionGUID: 319Dz4XwQjqHxkKp+UQMeA==
X-CSE-MsgGUID: PrS+ec61QxCHcWL8Trew/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="64677106"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.246.57]) ([10.245.246.57])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 00:41:57 -0700
Message-ID: <6d83cd58-5f02-414b-b627-a0022e071052@linux.intel.com>
Date: Mon, 19 Aug 2024 08:42:32 +0200
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
To: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1723804959-31921-1-git-send-email-shengjiu.wang@nxp.com>
 <1723804959-31921-5-git-send-email-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1723804959-31921-5-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/16/24 12:42, Shengjiu Wang wrote:
> Implement the ASRC memory to memory function using
> the compress framework, user can use this function with
> compress ioctl interface.
> 
> Define below private metadata key value for output
> format, output rate and ratio modifier configuration.
> ASRC_OUTPUT_FORMAT 0x80000001
> ASRC_OUTPUT_RATE   0x80000002
> ASRC_RATIO_MOD     0x80000003

Can the output format/rate change at run-time?

If no, then these parameters should be moved somewhere else - e.g.
hw_params or something.

I am still not very clear on the expanding the SET_METADATA ioctl to
deal with the ratio changes. This isn't linked to the control layer as
suggested before, and there's no precedent of calling it multiple times
during streaming.

I also wonder how it was tested since tinycompress does not support this?


> +static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
> +					struct snd_compr_codec_caps *codec)
> +{
> +	struct fsl_asrc_m2m_cap cap;
> +	__u32 rates[MAX_NUM_BITRATES];
> +	snd_pcm_format_t k;
> +	int i = 0, j = 0;
> +	int ret;
> +
> +	ret = asrc->m2m_get_cap(&cap);
> +	if (ret)
> +		return -EINVAL;
> +
> +	if (cap.rate_in & SNDRV_PCM_RATE_5512)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_5512);

this doesn't sound compatible with the patch2 definitions?

cap->rate_in = SNDRV_PCM_RATE_8000_768000;

> +	if (cap.rate_in & SNDRV_PCM_RATE_8000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_8000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_11025)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_11025);
> +	if (cap.rate_in & SNDRV_PCM_RATE_16000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_16000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_22050)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_22050);

missing 24 kHz

> +	if (cap.rate_in & SNDRV_PCM_RATE_32000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_32000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_44100)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_44100);
> +	if (cap.rate_in & SNDRV_PCM_RATE_48000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_48000);

missing 64kHz

> +	if (cap.rate_in & SNDRV_PCM_RATE_88200)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_88200);
> +	if (cap.rate_in & SNDRV_PCM_RATE_96000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_96000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_176400)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_176400);
> +	if (cap.rate_in & SNDRV_PCM_RATE_192000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_192000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_352800)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_352800);
> +	if (cap.rate_in & SNDRV_PCM_RATE_384000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_384000);
> +	if (cap.rate_in & SNDRV_PCM_RATE_705600)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_705600);
> +	if (cap.rate_in & SNDRV_PCM_RATE_768000)
> +		rates[i++] = snd_pcm_rate_bit_to_rate(SNDRV_PCM_RATE_768000);
> +
> +	pcm_for_each_format(k) {
> +		if (pcm_format_to_bits(k) & cap.fmt_in) {
> +			codec->descriptor[j].max_ch = cap.chan_max;
> +			memcpy(codec->descriptor[j].sample_rates, rates, i * sizeof(__u32));
> +			codec->descriptor[j].num_sample_rates = i;
> +			codec->descriptor[j].formats = k;
> +			j++;
> +		}
> +	}
> +
> +	codec->codec = SND_AUDIOCODEC_PCM;
> +	codec->num_descriptors = j;
> +	return 0;



