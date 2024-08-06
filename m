Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95B4948E0C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 13:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdWjD4p7Tz3fpr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 21:46:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=signalogic.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=signalogic.com (client-ip=209.150.126.178; helo=hosting3.qishost.com; envelope-from=jbrower@signalogic.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 365 seconds by postgrey-1.37 at boromir; Tue, 06 Aug 2024 21:45:48 AEST
Received: from hosting3.qishost.com (signalogic.com [209.150.126.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdWhr6FPXz3dV9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 21:45:48 +1000 (AEST)
Received: from hosting3.qishost.com (localhost [IPv6:::1])
	by hosting3.qishost.com (Postfix) with ESMTPSA id 7702F45A59;
	Tue,  6 Aug 2024 07:39:36 -0400 (EDT)
Authentication-Results: hosting3.qishost.com;
        spf=pass (sender IP is ::1) smtp.mailfrom=jbrower@signalogic.com smtp.helo=hosting3.qishost.com
Received-SPF: pass (hosting3.qishost.com: connection is authenticated)
Received: from c-76-132-49-220.hsd1.ca.comcast.net
 (c-76-132-49-220.hsd1.ca.comcast.net [76.132.49.220]) by
 webmail.signalogic.com (Horde Framework) with HTTP; Tue, 06 Aug 2024
 11:39:36 +0000
Date: Tue, 06 Aug 2024 11:39:36 +0000
Message-ID: <20240806113936.Horde.vcDWoEx08a51SUfvt56nQ2p@webmail.signalogic.com>
From: Jeff Brower <jbrower@signalogic.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
 <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
In-Reply-To: <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, linux-sound@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, vkoul@kernel.org, broonie@kernel.org, festevam@gmail.com, shengjiu.wang@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All-

"The sample rate converter is not an encoder ..."

Indeed, an encoder creates a compressed bitstream from audio data  
(typically linear PCM samples), normally for transmission of some  
type. A sample rate converter generates audio data from audio data,  
and is normally applied prior to an encoder because it can only accept  
a limited range of sample rates.

-Jeff

Quoting Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:

> On 8/6/24 12:26, Shengjiu Wang wrote:
>> Add Sample Rate Converter(SRC) codec support, define the output
>> format and rate for SRC.
>>
>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>> ---
>>  include/uapi/sound/compress_offload.h | 2 ++
>>  include/uapi/sound/compress_params.h  | 9 ++++++++-
>>  2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/sound/compress_offload.h  
>> b/include/uapi/sound/compress_offload.h
>> index 98772b0cbcb7..8b2b72f94e26 100644
>> --- a/include/uapi/sound/compress_offload.h
>> +++ b/include/uapi/sound/compress_offload.h
>> @@ -112,10 +112,12 @@ struct snd_compr_codec_caps {
>>   * end of the track
>>   * @SNDRV_COMPRESS_ENCODER_DELAY: no of samples inserted by the  
>> encoder at the
>>   * beginning of the track
>> + * @SNDRV_COMPRESS_SRC_RATIO_MOD: Resampling Ratio Modifier for  
>> sample rate converter
>>   */
>>  enum sndrv_compress_encoder {
>>  	SNDRV_COMPRESS_ENCODER_PADDING = 1,
>>  	SNDRV_COMPRESS_ENCODER_DELAY = 2,
>> +	SNDRV_COMPRESS_SRC_RATIO_MOD = 3,
>>  };
>
> this sounds wrong to me. The sample rate converter is not an "encoder",
> and the properties for padding/delay are totally specific to an encoder
> function.
>
> The other point is that I am not sure how standard this ratio_mod
> parameter is. This could be totally specific to a specific
> implementation, and another ASRC might have different parameters.
>
>>
>>  /**
>> diff --git a/include/uapi/sound/compress_params.h  
>> b/include/uapi/sound/compress_params.h
>> index ddc77322d571..0843773ea6b4 100644
>> --- a/include/uapi/sound/compress_params.h
>> +++ b/include/uapi/sound/compress_params.h
>> @@ -43,7 +43,8 @@
>>  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
>>  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
>>  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
>> -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
>> +#define SND_AUDIOCODEC_SRC                   ((__u32) 0x00000011)
>> +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_SRC
>
> I am not sure this is wise to change such definitions?
>>
>>  /*
>>   * Profile and modes are listed with bit masks. This allows for a
>> @@ -324,6 +325,11 @@ struct snd_dec_ape {
>>  	__u32 seek_table_present;
>>  } __attribute__((packed, aligned(4)));
>>
>> +struct snd_dec_src {
>> +	__u32 format_out;
>> +	__u32 rate_out;
>> +} __attribute__((packed, aligned(4)));
>
> Again I am not sure how standard those parameters are, and even if they
> were if their representation is reusable.
>
> And the compressed API has a good split between encoders and decoders, I
> am not sure how an SRC can be classified as either.
>
>>  union snd_codec_options {
>>  	struct snd_enc_wma wma;
>>  	struct snd_enc_vorbis vorbis;
>> @@ -334,6 +340,7 @@ union snd_codec_options {
>>  	struct snd_dec_wma wma_d;
>>  	struct snd_dec_alac alac_d;
>>  	struct snd_dec_ape ape_d;
>> +	struct snd_dec_src src;
>>  } __attribute__((packed, aligned(4)));
>>
>>  /** struct snd_codec_desc - description of codec capabilities



