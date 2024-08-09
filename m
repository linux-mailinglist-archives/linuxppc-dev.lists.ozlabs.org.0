Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 362E894D19E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 15:52:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=TnOCcVRB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WgQMs0yFBz2ypP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 23:52:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256 header.s=default header.b=TnOCcVRB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=perex.cz (client-ip=77.48.224.245; helo=mail1.perex.cz; envelope-from=perex@perex.cz; receiver=lists.ozlabs.org)
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WgQM60RF1z2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 23:52:00 +1000 (AEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2CFDB36295;
	Fri,  9 Aug 2024 15:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2CFDB36295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1723211514; bh=bfR8xK8YRjbeCEtA/tBvDIAuJxRdvXjkUB7dml/F+x4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TnOCcVRBcxKQEqiclDVDFTrDossLOublsWu2dGWoRkqZ+h3Qaz72TZssUWyzHYxdK
	 uaWbNAq2ALX2pMWExoEQ+iz8Oje7UeXeMUAAosNplUe80deubBxcCYe3jEA9mN6tb8
	 jxCA6ENCyhEiHkTxixmFYK9DdJ8oqc+zBA7Ifxfw=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri,  9 Aug 2024 15:51:40 +0200 (CEST)
Message-ID: <e087f554-394e-4d61-8fa4-ddbedd485448@perex.cz>
Date: Fri, 9 Aug 2024 15:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <CAA+D8AMOh=G7W5-dYw_=Xx-s0PqEu2suKYorscoWku86Rn-=+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 09. 08. 24 12:14, Shengjiu Wang wrote:
> On Fri, Aug 9, 2024 at 3:25 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>>>>> Then there's the issue of parameters, we chose to only add parameters
>>>>>> for standard encoders/decoders. Post-processing is highly specific and
>>>>>> the parameter definitions varies from one implementation to another -
>>>>>> and usually parameters are handled in an opaque way with binary
>>>>>> controls. This is best handled with a UUID that needs to be known only
>>>>>> to applications and low-level firmware/hardware, the kernel code should
>>>>>> not have to be modified for each and every processing and to add new
>>>>>> parameters. It just does not scale and it's unmaintainable.
>>>>>>
>>>>>> At the very least if you really want to use this compress API,
>>>>>> extend it
>>>>>> to use a non-descript "UUID-defined" type and an opaque set of
>>>>>> parameters with this UUID passed in a header.
>>>>>
>>>>> We don't need to use UUID-defined scheme for simple (A)SRC
>>>>> implementation. As I noted, the specific runtime controls may use
>>>>> existing ALSA control API.
>>>>
>>>> "Simple (A)SRC" is an oxymoron. There are multiple ways to define the
>>>> performance, and how the drift estimator is handled. There's nothing
>>>> simple if you look under the hood. The SOF implementation has for
>>>> example those parameters:
>>>>
>>>> uint32_t source_rate;           /**< Define fixed source rate or */
>>>>                  /**< use 0 to indicate need to get */
>>>>                  /**< the rate from stream */
>>>> uint32_t sink_rate;             /**< Define fixed sink rate or */
>>>>                  /**< use 0 to indicate need to get */
>>>>                  /**< the rate from stream */
>>>> uint32_t asynchronous_mode;     /**< synchronous 0, asynchronous 1 */
>>>>                  /**< When 1 the ASRC tracks and */
>>>>                  /**< compensates for drift. */
>>>> uint32_t operation_mode;        /**< push 0, pull 1, In push mode the */
>>>>                  /**< ASRC consumes a defined number */
>>>>                  /**< of frames at input, with varying */
>>>>                  /**< number of frames at output. */
>>>>                  /**< In pull mode the ASRC outputs */
>>>>                  /**< a defined number of frames while */
>>>>                  /**< number of input frames varies. */
>>>>
>>>> They are clearly different from what is suggested above with a 'ratio-
>>>> mod'.
>>>
>>> I don't think so. The proposed (A)SRC for compress-accel is just one
>>> case for the above configs where the input is known and output is
>>> controlled by the requested rate. The I/O mechanism is abstracted enough
>>> in this case and the driver/hardware/firmware must follow it.
>>
>> ASRC is usually added when the nominal rates are known but the clock
>> sources differ and the drift needs to be estimated at run-time and the
>> coefficients or interpolation modified dynamically
>>
>> If the ratio is known exactly and there's no clock drift, then it's a
>> different problem where the filter coefficients are constant.
>>
>>>> Same if you have a 'simple EQ'. there are dozens of ways to implement
>>>> the functionality with FIR, IIR or a combination of the two, and
>>>> multiple bands.
>>>>
>>>> The point is that you have to think upfront about a generic way to pass
>>>> parameters. We didn't have to do it for encoders/decoders because we
>>>> only catered to well-documented standard solutions only. By choosing to
>>>> support PCM processing, a new can of worms is now open.
>>>>
>>>> I repeat: please do not make the mistake of listing all processing with
>>>> an enum and a new structure for parameters every time someone needs a
>>>> specific transform in their pipeline. We made that mistake with SOF and
>>>> had to backtrack rather quickly. The only way to scale is an identifier
>>>> that is NOT included in the kernel code but is known to higher and
>>>> lower-levels only.
>>>
>>> There are two ways - black box (UUID - as you suggested) - or well
>>> defined purpose (abstraction). For your example 'simple EQ', the
>>> parameters should be the band (frequency range) volume values. It's
>>> abstract and the real filters (resp. implementation) used behind may
>>> depend on the hardware/driver capabilities.
>>
>> Indeed there is a possibility that the parameters are high-level, but
>> that would require firmware or hardware to be able to generate actual
>> coefficients from those parameters. That usually requires some advanced
>> math which isn't necessarily obvious to implement with fixed-point hardware.
>>
>>>  From my view, the really special cases may be handled as black box, but
>>> others like (A)SRC should follow some well-defined abstraction IMHO to
>>> not force user space to handle all special cases.
>>
>> I am not against the high-level abstractions, e.g. along the lines of
>> what Android defined:
>> https://developer.android.com/reference/android/media/audiofx/AudioEffect
>>
>> That's not sufficient however, we also need to make sure there's an
>> ability to provide pre-computed coefficients in an opaque manner for
>> processing that doesn't fit in the well-defined cases. In practice there
>> are very few 3rd party IP that fits in well-defined cases, everyone has
>> secret-sauce parameters and options.
> 
> Appreciate the discussion.
> 
> Let me explain the reason for the change:
> 
> Why I use the metadata ioctl is because the ALSA controls are binding
> to the sound card.  What I want is the controls can be bound to
> snd_compr_stream, because the ASRC compress sound card can
> support multi instances ( the ASRC can support multi conversion in
> parallel).   The ALSA controls can't be used for this case,  the only
> choice in current compress API is metadata ioctl. And metadata
> ioctl can be called many times which can meet the ratio modifier
> requirement (ratio may be drift on the fly)

This argument is not valid. The controls are bound to the card, but the 
element identifiers have already iface (interface), device and subdevice 
numbers. We are using controls for PCM devices for example. The binding is 
straight.

Just add SNDRV_CTL_ELEM_IFACE_COMPRESS define and specify the compress device 
number in the 'struct snd_ctl_elem_id'.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

