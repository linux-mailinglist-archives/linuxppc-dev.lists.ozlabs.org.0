Return-Path: <linuxppc-dev+bounces-9341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 090C1AD8A37
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 13:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJcQF3XTcz30Nl;
	Fri, 13 Jun 2025 21:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749813637;
	cv=none; b=TGDsPTzr/07xd0uEZqOp3R1Sr/GYeE7EtJpmSoFJBSv8gzAfA6zHpbKwf/6yYsdL0odbVs/HnBVgZEaOvZS7OT8qIIbtHv5gcD2emTbYgUjU36HAKzjWo7WcCwpYXcBbVRlOHBvuZqvzXcgrFqTUJeC2Lum8yxeA0dlRMPnlR0vBpwBRmFnAlpqXn/LOUqwjpzPIQQSDFcS6J0LXa23ijIVEGV5pN1q9i3vNgnfnA/eC9e/aG/pVSlmL8X8kVgvUQlhbbYqHLfmNup15NIMIsjregggr1Re0TrWGfSMBT61OAI3Syu1nuVF5JlcqnxUhGbaQ3W5MLwQOBxziks4/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749813637; c=relaxed/relaxed;
	bh=6CSQP6GjTmA/qpNAjof4ILpteEFzBhEIrzfIXux0nw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xx0aGzTlQ6ZY5IRg41GEE9OavJmg7+kGTaAClwRLpKnKOacO5vK0JktHy3/+SMp3pGe0pKqIEEPIaQQayVfpU44aDFO529WsMcy+15xSNyAv3lL3tHqcJnpb9pelV0sgUDS20Hxk4W5wGjstqFj5VrrNFxHkgQV9cpP+s9/FseSbyM0lMOe/xJ/c3tsywFPNmFcTKtomphzY4gOA01JsBsW8D+NyeUBMYbOu2ZrrJycufJ7+2RqoKqNSDsXlFxVBhNr3S4XCT3enU12eD9oBNFmm0MQsFk6d4t3jv6lapcThJYy1XZ7hFXuMwbe7fjR69vIj6JvH+0EjYQRdf6Q1hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJcQD3wsHz30HB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 21:20:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJc2151R8z9sqS;
	Fri, 13 Jun 2025 13:03:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2EYXYIC_ssC4; Fri, 13 Jun 2025 13:03:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJc214Bzmz9sl0;
	Fri, 13 Jun 2025 13:03:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B7A58B77B;
	Fri, 13 Jun 2025 13:03:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Gd6ZZdiQooSp; Fri, 13 Jun 2025 13:03:05 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 067608B769;
	Fri, 13 Jun 2025 13:03:04 +0200 (CEST)
Message-ID: <2df61bbf-76f6-4932-a347-7820350a156e@csgroup.eu>
Date: Fri, 13 Jun 2025 13:03:04 +0200
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
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <878qlwrnv1.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 13/06/2025 à 11:29, Takashi Iwai a écrit :
> On Thu, 12 Jun 2025 12:51:05 +0200,
> Christophe Leroy wrote:
>>
>> Now that snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user()
>> are converted to user_access_begin/user_access_end(),
>> snd_pcm_sync_ptr_get_user() is more efficient than a raw get_user()
>> followed by a copy_from_user(). And because copy_{to/from}_user() are
>> generic functions focussed on transfer of big data blocks to/from user,
>> snd_pcm_sync_ptr_put_user() is also more efficient for small amont of
>> data.
>>
>> So use snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() in
>> snd_pcm_sync_ptr() too.
>>
>> In order to have snd_pcm_mmap_status32 similar to snd_pcm_mmap_status,
>> replace to tsamp_{sec/nsec} and audio_tstamp_{sec/nsec} by equivalent
>> struct __snd_timespec.
>>
>> snd_pcm_ioctl_sync_ptr_buggy() is left as it is because the conversion
>> wouldn't be straigh-forward do to the workaround it provides.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Through a quick glance, all patches look almost fine, but one favor to
> ask: this patch contains the convert from s32/s32 pair to struct
> __snd_timespec.  It should be factored out to a prerequisite patch
> instead of burying in a big change.

Shall I understand you prefer this series over the more simple "ALSA: 
pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to 
user_access_begin/user_access_end()" patch ?

I'm asking because I was myself not sure about the benefit of such two 
big macros over the other proposal in terms of readability.


> 
> I'm asking it because this timepsec definition is very confusing (and
> complex) due to historical reasons, and it should be handled with a
> special care.
> IIUC, struct __snd_timespec is always s32/s32 for the kernel code, so
> the conversion must be fine.  This needs to be commented in the
> commit.


Sure I will do that.

Christophe

