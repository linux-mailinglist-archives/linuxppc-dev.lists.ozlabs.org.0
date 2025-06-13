Return-Path: <linuxppc-dev+bounces-9353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74012AD8D00
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 15:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJg4j4l5Fz2yb9;
	Fri, 13 Jun 2025 23:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749820837;
	cv=none; b=NBgfsYPUqKBpCq8ens4H4KSpRTFhVNEoN/IjUf2+PQD+FauXRg7rG6az8Nf2yqn3dnlFefsLkVjvQfdVhAW1mZdQ/i6k9r/5xFrYdzqIdtAm5CcqpF2uQBl0pI/w4XPuQ4FMAWj5/Fwo7kv0GMaDFWrII8yRkW1ER6P9Na6H8yS0IAMTkLMQI47Xmza9yqwOPR2rvoF6/7PF4KHOIMZV2Hahf0SNu5twg12jccQjq6I12EjGLBj4Ev9TXt2cXfGXgyNYJ48wdG/+hYE1zTI/FsoOXHNKUu7dvw2Sydm6wbLdZ3iNa1R97K9PDDvr24gVz5YY9QtUighKfVU1s5OXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749820837; c=relaxed/relaxed;
	bh=075qRUfM+QXZJVgR9SNzXCUNUG2UwwqvACzUhpBaquo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjQ4HAuhA2PG7i45xT3DBlW5yOPV4KlfjEUshxbXdBJEgnoIIcO2//LWdXSU9P/iT+UEFa2BEze6cfGY4Np0Ei2ssd1u2N50R+bfnZ57z2k9p3JIWc25A26uPiuEZogrGw54P2E6TlJ0kjy0g28cs38A8mB4RLxbhSEslMo+CW8d23ayHT6qvR3qe+etc9JGDwoINSKrN57h7iHtGiWhDbqaZyJJeygHHXeRQycAbpcFgxoN38P/lVDG7kBG2DJKZFt+IrIc0RESZTZg00yMHARzOB0PXoXo3ZML1khN3Naf6WE2+PNlxpgTAtf5QzQOC1iMur3gBIKc3IiljvH2Zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJg4h4gx3z2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 23:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJfKg2Cn2z9tHZ;
	Fri, 13 Jun 2025 14:46:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqfwE16bHLFZ; Fri, 13 Jun 2025 14:46:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJfKg1Tgbz9tHF;
	Fri, 13 Jun 2025 14:46:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2DABD8B77B;
	Fri, 13 Jun 2025 14:46:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BdURGYxBYsF6; Fri, 13 Jun 2025 14:46:47 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B187F8B769;
	Fri, 13 Jun 2025 14:46:46 +0200 (CEST)
Message-ID: <4f2f8e14-22d2-44f1-82cd-5f2a3b5117b1@csgroup.eu>
Date: Fri, 13 Jun 2025 14:46:46 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] ALSA: pcm: Convert snd_pcm_sync_ptr() to
 user_access_begin/user_access_end()
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>,
 Mark Brown <broonie@kernel.org>
References: <7baa34d4046c7750799b11830d38a46f8b581765.1749724478.git.christophe.leroy@csgroup.eu>
 <79b86a0618328ba1d0cb5cf4011fd73ac6900e8f.1749724478.git.christophe.leroy@csgroup.eu>
 <878qlwrnv1.wl-tiwai@suse.de>
 <2df61bbf-76f6-4932-a347-7820350a156e@csgroup.eu>
 <87wm9frf5x.wl-tiwai@suse.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87wm9frf5x.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 13/06/2025 à 14:37, Takashi Iwai a écrit :
> On Fri, 13 Jun 2025 13:03:04 +0200,
> Christophe Leroy wrote:
>>
>>
>>
>> Le 13/06/2025 à 11:29, Takashi Iwai a écrit :
>>> On Thu, 12 Jun 2025 12:51:05 +0200,
>>> Christophe Leroy wrote:
>>>>
>>>> Now that snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user()
>>>> are converted to user_access_begin/user_access_end(),
>>>> snd_pcm_sync_ptr_get_user() is more efficient than a raw get_user()
>>>> followed by a copy_from_user(). And because copy_{to/from}_user() are
>>>> generic functions focussed on transfer of big data blocks to/from user,
>>>> snd_pcm_sync_ptr_put_user() is also more efficient for small amont of
>>>> data.
>>>>
>>>> So use snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() in
>>>> snd_pcm_sync_ptr() too.
>>>>
>>>> In order to have snd_pcm_mmap_status32 similar to snd_pcm_mmap_status,
>>>> replace to tsamp_{sec/nsec} and audio_tstamp_{sec/nsec} by equivalent
>>>> struct __snd_timespec.
>>>>
>>>> snd_pcm_ioctl_sync_ptr_buggy() is left as it is because the conversion
>>>> wouldn't be straigh-forward do to the workaround it provides.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>
>>> Through a quick glance, all patches look almost fine, but one favor to
>>> ask: this patch contains the convert from s32/s32 pair to struct
>>> __snd_timespec.  It should be factored out to a prerequisite patch
>>> instead of burying in a big change.
>>
>> Shall I understand you prefer this series over the more simple "ALSA:
>> pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to
>> user_access_begin/user_access_end()" patch ?
> 
> Err, no, sorry for ambiguity.

Then I'm lost.

I sent two alternative proposals:
A/ Single patch, simple, handling only two fonctions 
snd_pcm_ioctl_sync_ptr_{compat/x32} , without refactoring. [1]
B/ This RFC series, more elaborate, refactoring and putting user copy 
into helper macros. [2]

So the question was to be sure you prefer alternative B over alternative 
A. I guess the answer is YES as you asking me improve it.

[1] 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy@csgroup.eu/
[2] 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?state=*&series=460665


> I wanted to move the replacement of tstamp_sec/nsec with struct
> __snd_timespec as a small preliminary patch from patch#3.
> That is,

Yes that's what I understood.

Thanks
Christophe


> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -3103,11 +3103,9 @@ struct snd_pcm_mmap_status32 {
>   	snd_pcm_state_t state;
>   	s32 pad1;
>   	u32 hw_ptr;
> -	s32 tstamp_sec;
> -	s32 tstamp_nsec;
> +	struct __snd_timespec tstamp;
>   	snd_pcm_state_t suspended_state;
> -	s32 audio_tstamp_sec;
> -	s32 audio_tstamp_nsec;
> +	struct __snd_timespec audio_tstamp;
>   } __packed;
> etc.  By factoring this out, it becomes clear that the timespec
> compatibility is fully cared.
> 
> __snd_timespec may be defined in different ways on user-space, but in
> the kernel code, it's a single definition of s32/s32 pair.  This needs
> to be emphasized.
> 
> 
> thanks,
> 
> Takashi


