Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F21948DA1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 13:27:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J8bTB2KS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdWHf3nqHz3dBd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 21:27:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J8bTB2KS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=pierre-louis.bossart@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 06 Aug 2024 21:26:47 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdWGv6mJHz2ysg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 21:26:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722943608; x=1754479608;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=XeP8qMVW9duWHN2BUl9XidmCMVmrVkb5XZ55nX3RpWU=;
  b=J8bTB2KS5oisSmEMoo5G3CUDDfZy0zlCHTM7db7TeOrxhqh5D28vzprB
   HKnhgjJPkHzSs8lno4A7tfzmQeWv1fzhUuvHsrBxAU5tfUYegD+/9c6u3
   UuIwvmfGw32H57C/x5+hifP2T2sLrF5PYfcbbDkWb/p8YGsKw1wTQA+M+
   YrYRLYMCMufthCsUjGEOZzN5gyrAYrfuoxc6W1NbaUlGAg9d5KDW+QipE
   D6fQT/CNu7S7BaEim2KaajqyV/AaL35Pn5LSmabXz0yTRLX7P73IjbIra
   FTt33h3U3qgZtK2TCDwJ2XDuJ1DiokndZxEW+qM980f/OuGF/RtueiesH
   g==;
X-CSE-ConnectionGUID: h/ycR0UTTbulPwMeq7Tikg==
X-CSE-MsgGUID: 2ZMr2r0RQCiCTp05WRkE7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20804839"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="20804839"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 04:25:37 -0700
X-CSE-ConnectionGUID: uVVs95WMQuuVeX2XlWhaPA==
X-CSE-MsgGUID: 4wC1AypiTUqIxnJYqoPfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="56399162"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.248]) ([10.245.246.248])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 04:25:34 -0700
Message-ID: <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
Date: Tue, 6 Aug 2024 13:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/6/24 12:26, Shengjiu Wang wrote:
> Add Sample Rate Converter(SRC) codec support, define the output
> format and rate for SRC.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  include/uapi/sound/compress_offload.h | 2 ++
>  include/uapi/sound/compress_params.h  | 9 ++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> index 98772b0cbcb7..8b2b72f94e26 100644
> --- a/include/uapi/sound/compress_offload.h
> +++ b/include/uapi/sound/compress_offload.h
> @@ -112,10 +112,12 @@ struct snd_compr_codec_caps {
>   * end of the track
>   * @SNDRV_COMPRESS_ENCODER_DELAY: no of samples inserted by the encoder at the
>   * beginning of the track
> + * @SNDRV_COMPRESS_SRC_RATIO_MOD: Resampling Ratio Modifier for sample rate converter
>   */
>  enum sndrv_compress_encoder {
>  	SNDRV_COMPRESS_ENCODER_PADDING = 1,
>  	SNDRV_COMPRESS_ENCODER_DELAY = 2,
> +	SNDRV_COMPRESS_SRC_RATIO_MOD = 3,
>  };

this sounds wrong to me. The sample rate converter is not an "encoder",
and the properties for padding/delay are totally specific to an encoder
function.

The other point is that I am not sure how standard this ratio_mod
parameter is. This could be totally specific to a specific
implementation, and another ASRC might have different parameters.

>  
>  /**
> diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> index ddc77322d571..0843773ea6b4 100644
> --- a/include/uapi/sound/compress_params.h
> +++ b/include/uapi/sound/compress_params.h
> @@ -43,7 +43,8 @@
>  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
>  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
>  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> +#define SND_AUDIOCODEC_SRC                   ((__u32) 0x00000011)
> +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_SRC

I am not sure this is wise to change such definitions?
>  
>  /*
>   * Profile and modes are listed with bit masks. This allows for a
> @@ -324,6 +325,11 @@ struct snd_dec_ape {
>  	__u32 seek_table_present;
>  } __attribute__((packed, aligned(4)));
>  
> +struct snd_dec_src {
> +	__u32 format_out;
> +	__u32 rate_out;
> +} __attribute__((packed, aligned(4)));

Again I am not sure how standard those parameters are, and even if they
were if their representation is reusable.

And the compressed API has a good split between encoders and decoders, I
am not sure how an SRC can be classified as either.

>  union snd_codec_options {
>  	struct snd_enc_wma wma;
>  	struct snd_enc_vorbis vorbis;
> @@ -334,6 +340,7 @@ union snd_codec_options {
>  	struct snd_dec_wma wma_d;
>  	struct snd_dec_alac alac_d;
>  	struct snd_dec_ape ape_d;
> +	struct snd_dec_src src;
>  } __attribute__((packed, aligned(4)));
>  
>  /** struct snd_codec_desc - description of codec capabilities

