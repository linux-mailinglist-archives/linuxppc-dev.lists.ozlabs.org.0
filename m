Return-Path: <linuxppc-dev+bounces-87-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8F1951DA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 16:48:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=ZqtZ6mkn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkWNR1LwLz2xck;
	Thu, 15 Aug 2024 00:48:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=ZqtZ6mkn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=perex.cz (client-ip=77.48.224.245; helo=mail1.perex.cz; envelope-from=perex@perex.cz; receiver=lists.ozlabs.org)
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkWNP02WSz2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 00:48:51 +1000 (AEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 17094362A8;
	Wed, 14 Aug 2024 16:48:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 17094362A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1723646925; bh=uf2xW8WtF5oep5EfMnSWo30bmq7rA/yv7ksjq5ZNF78=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZqtZ6mknsdTb+GhlqSLU1pKMbzM12+PpwW0OnK88bXL0kBV8lLkCxyZVV1ptFHw+1
	 0/MVjwkOrTVIOThvtkEjJIdRJ6u6E9vAg8TT8yWDP7y+Qdpzu5/BZiwUtgabcD9sc0
	 746KEDhSb8cWb8XGOlSeUG9EZsRiMBla3zPQQbH4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 14 Aug 2024 16:48:31 +0200 (CEST)
Message-ID: <bf85656b-5b12-4101-adfa-1a8c6afb6084@perex.cz>
Date: Wed, 14 Aug 2024 16:48:30 +0200
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
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
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
 <55a82ba3-1c33-4d1b-9f5f-8af33d76222f@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <55a82ba3-1c33-4d1b-9f5f-8af33d76222f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14. 08. 24 13:58, Pierre-Louis Bossart wrote:
> 
> 
> On 8/14/24 13:12, Shengjiu Wang wrote:
>> On Wed, Aug 14, 2024 at 5:40 PM Pierre-Louis Bossart
>> <pierre-louis.bossart@linux.intel.com> wrote:
>>>
>>>
>>>> Yes, to go further, I think we can use SND_AUDIOCODEC_PCM, then
>>>> the SRC type will be dropped.
>>>
>>> sounds good.
>>>
>>>> But my understanding of the control means the .set_metadata() API, right?
>>>> As I said, the output rate, output format, and ratio modifier are applied to
>>>> the instances of ASRC,  which is the snd_compr_stream in driver.
>>>> so only the .set_metadata() API can be used for these purposes.
>>>
>>> Humm, this is more controversial.
>>>
>>> The term 'metadata' really referred to known information present in
>>> headers or additional ID3 tags and not in the compressed file itself.
>>> The .set_metadata was assumed to be called ONCE before decoding.
>>>
>>> But here you have a need to update the ratio modifier on a regular basis
>>> to compensate for the drift. This isn't what this specific callback was
>>> designed for. We could change and allow this callback to be used
>>> multiple times, but then this could create problems for existing
>>> implementations which cannot deal with modified metadata on the fly.
>>
>> .set_metadata can be called multi times now, no need to change currently.
> 
> Not really, this set_metadata() callback is used only for gapless
> transitions between tracks, see fcplay.c in tinycompress.
> 
> And now I am really confused because tinycompress uses an IOCTL directly:
> 
> 	metadata.key = SNDRV_COMPRESS_ENCODER_PADDING;
> 	metadata.value[0] = mdata->encoder_padding;
> 	if (ioctl(compress->fd, SNDRV_COMPRESS_SET_METADATA, &metadata))
> 
> Whereas you want to use the ops callback directly from the control layer?
> 
> What would present a userspace program from using the ioctl directly
> then? In that case, why do we need the control? I must be missing something.

The whole discussion is which place is more appropriate for the runtime 
controls (like the frequency shift). My opinion is, if we have a layer for 
this which can be used for presence of those controls and even range / type / 
notifications, we should use it.

The new/updated ioctls bounded only to active file descriptor does not allow 
to monitor those values outside.

>>> And then there's the problem of defining a 'key' for the metadata. the
>>> definition of the key is a u32, so there's plenty of space for different
>>> implementations, but a collision is possible. We'd need an agreement on
>>> how to allocate keys to different solutions without changing the header
>>> file for every implementation.
>>
>> Can we define a private space for each case?   For example the key larger
>> than 0x80000000 is private, each driver can define it by themself?
> 
> that would be a possibility indeed - provided that the opens above are
> straightened out.
> 
>>> It sounds like we'd need a 'runtime params' callback - unless there's a
>>> better trick to tie the control and compress layers?

I don't follow. If the compress driver code uses card/device/subdevice 
numbers, we can address the control properly. The problem is just that 
subdevice support in missing the current compress code / API.

For me, the compress_params.h changes may also require to pay attention to the 
encoding/decoding of the current compressed streams. So something like this 
may be more appropriate for the first step:

diff --git a/include/uapi/sound/compress_params.h 
b/include/uapi/sound/compress_params.h
index ddc77322d571..c664d15410eb 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -347,6 +347,8 @@ union snd_codec_options {
   * @modes: Supported modes. See SND_AUDIOMODE defines
   * @formats: Supported formats. See SND_AUDIOSTREAMFORMAT defines
   * @min_buffer: Minimum buffer size handled by codec implementation
+ * @pcm_formats: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
   * @reserved: reserved for future use
   *
   * This structure provides a scalar value for profiles, modes and stream
@@ -370,7 +372,8 @@ struct snd_codec_desc {
         __u32 modes;
         __u32 formats;
         __u32 min_buffer;
-       __u32 reserved[15];
+       __u32 pcm_formats;
+       __u32 reserved[14];
  } __attribute__((packed, aligned(4)));

  /** struct snd_codec
@@ -395,6 +398,8 @@ struct snd_codec_desc {
   * @align: Block alignment in bytes of an audio sample.
   *             Only required for PCM or IEC formats.
   * @options: encoder-specific settings
+ * @pcm_format: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
   * @reserved: reserved for future use
   */

@@ -411,7 +416,8 @@ struct snd_codec {
         __u32 format;
         __u32 align;
         union snd_codec_options options;
-       __u32 reserved[3];
+       __u32 pcm_format;
+       __u32 reserved[2];
  } __attribute__((packed, aligned(4)));

  #endif

Then the SRC extension may be like:

diff --git a/include/uapi/sound/compress_params.h 
b/include/uapi/sound/compress_params.h
index c664d15410eb..5d51ecba6d55 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -334,6 +334,14 @@ union snd_codec_options {
  	struct snd_dec_wma wma_d;
  	struct snd_dec_alac alac_d;
  	struct snd_dec_ape ape_d;
+	struct {
+		__u32 out_sample_rate;
+	} src_d;
+} __attribute__((packed, aligned(4)));
+
+struct snd_codec_desc_src {
+	__u32 out_sample_rate_min;
+	__u32 out_sample_rate_max;
  } __attribute__((packed, aligned(4)));

  /** struct snd_codec_desc - description of codec capabilities
@@ -349,6 +357,7 @@ union snd_codec_options {
   * @min_buffer: Minimum buffer size handled by codec implementation
   * @pcm_formats: Output (for decoders) or input (for encoders)
   *               PCM formats (required to accel mode, 0 for other modes)
+ * @u_space: union space (for codec dependent date)
   * @reserved: reserved for future use
   *
   * This structure provides a scalar value for profiles, modes and stream
@@ -373,7 +382,11 @@ struct snd_codec_desc {
  	__u32 formats;
  	__u32 min_buffer;
  	__u32 pcm_formats;
-	__u32 reserved[14];
+	union {
+		__u32 u_space[6];
+		struct snd_codec_desc_src src;
+	} __attribute__((packed, aligned(4)));
+	__u32 reserved[8];
  } __attribute__((packed, aligned(4)));

  /** struct snd_codec

This will allow to handshake the output rate between user space and kernel 
driver. Eventually we can use a rate bitmap to be more precise in "struct 
snd_codec_desc_src" (or combination of range/bitmap).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.


