Return-Path: <linuxppc-dev+bounces-9304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A03AD6E3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 12:50:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHzp82xS3z2y82;
	Thu, 12 Jun 2025 20:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749725440;
	cv=none; b=DZGR4kNXUDIoLQSOEZ3ibuHtIo0Ftvfz92PeJuDZUohgpRvTfKLinsuTHaWO2Md5cIB5XaCeWRixpMw8CWZe9DOSw9Xc20nG7nAA/wi4gHCF3MBvL4p2rmB/hUE1CO4Xu1RL+XmGm2pK+p3T59ATdVL8559+rR8XB/iDbQkE0gfcCgZgbN/OZNNxv9JH9Yz8F11tEaYklaTwnPDQh81bZ2lDxugVSqfaVkDXv6JSDZMZz64gEgjejjriexteXRhMkiaMe62/WSzKSuQd3iBQVZvOIrgPFbAqh0UAxj6qsQFo31hZBK/23z1MzjNswdbPikqyhFbhPggSS8xCbK9ztg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749725440; c=relaxed/relaxed;
	bh=sLdROiUafGZrt12aMq4ehHEPotQ5P/qoXMsnUdLkhgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0A0bpknaGbeTIxYpXiHZR/4XMoJXnwHe91BtmsLZa94V1xKW2vrCf7xDnAw3x35UdpJB3HMHOQtvhymqRoP47op7iJKh43yle35iNNgqWY0ZMoZlwq7DKW7zzDMYh/v/BafvSS9M/okiBiyRUb2pUPkhb9f7tmBD/E68dXNxFZKV2glh97oDZlPJxq94JCPu9wVnFdxVZOUt9Ru4HkQvrkddFxOOxTZSJfDT2ILpmfgLVx0liTBytz6a2pDPYst4KifDhic2yqnuNYrripJYy53PlqbQWpZLniGSSR2vNX3tM6LkrfQlrHzHKmV9d8w/Dgt+RL1HM2RDZ4ZMpS2qA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHzp72Dg0z2xbX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jun 2025 20:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bHzXv173dz9v8B;
	Thu, 12 Jun 2025 12:39:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 745naYi7a1d6; Thu, 12 Jun 2025 12:39:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bHzXv0K5Wz9thj;
	Thu, 12 Jun 2025 12:39:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 059D18B77B;
	Thu, 12 Jun 2025 12:39:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id PjhTgEekJaLp; Thu, 12 Jun 2025 12:39:10 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 76DD38B769;
	Thu, 12 Jun 2025 12:39:10 +0200 (CEST)
Message-ID: <722831ed-b37c-41e9-ba96-d359883bcb3f@csgroup.eu>
Date: Thu, 12 Jun 2025 12:39:10 +0200
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
Subject: Re: [PATCH v2] ALSA: pcm: Convert multiple {get/put}_user to
 user_access_begin/user_access_end()
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>,
 Mark Brown <broonie@kernel.org>
References: <d2609397eafc2b55ec1f44a3f30ccec00e0c7f6e.1749455639.git.christophe.leroy@csgroup.eu>
 <87zfeh72sz.wl-tiwai@suse.de>
 <6fbbb13e-aedd-47ad-a58b-cc00e9ea138c@csgroup.eu>
 <87frg96uxg.wl-tiwai@suse.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87frg96uxg.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 09/06/2025 à 13:00, Takashi Iwai a écrit :
> On Mon, 09 Jun 2025 12:02:00 +0200,
> Christophe Leroy wrote:
>>
>>
>>
>> Le 09/06/2025 à 10:10, Takashi Iwai a écrit :
>>> On Mon, 09 Jun 2025 10:00:38 +0200,
>>> Christophe Leroy wrote:
>>>>
>>>> With user access protection (Called SMAP on x86 or KUAP on powerpc)
>>>> each and every call to get_user() or put_user() performs heavy
>>>> operations to unlock and lock kernel access to userspace.
>>>>
>>>> To avoid that, perform user accesses by blocks using
>>>> user_access_begin/user_access_end() and unsafe_get_user()/
>>>> unsafe_put_user() and alike.
>>>>
>>>> As an exemple, before the patch the 9 calls to put_user() at the
>>>> end of snd_pcm_ioctl_sync_ptr_compat() imply the following set of
>>>> instructions about 9 times (access_ok - enable user - write - disable
>>>> user):
>>>>       0.00 :   c057f858:       3d 20 7f ff     lis     r9,32767
>>>>       0.29 :   c057f85c:       39 5e 00 14     addi    r10,r30,20
>>>>       0.77 :   c057f860:       61 29 ff fc     ori     r9,r9,65532
>>>>       0.32 :   c057f864:       7c 0a 48 40     cmplw   r10,r9
>>>>       0.36 :   c057f868:       41 a1 fb 58     bgt     c057f3c0 <snd_pcm_ioctl+0xbb0>
>>>>       0.30 :   c057f86c:       3d 20 dc 00     lis     r9,-9216
>>>>       1.95 :   c057f870:       7d 3a c3 a6     mtspr   794,r9
>>>>       0.33 :   c057f874:       92 8a 00 00     stw     r20,0(r10)
>>>>       0.27 :   c057f878:       3d 20 de 00     lis     r9,-8704
>>>>       0.28 :   c057f87c:       7d 3a c3 a6     mtspr   794,r9
>>>> ...
>>>>
>>>> A perf profile shows that in total the 9 put_user() represent 36% of
>>>> the time spent in snd_pcm_ioctl() and about 80 instructions.
>>>>
>>>> With this patch everything is done in 13 instructions and represent
>>>> only 15% of the time spent in snd_pcm_ioctl():
>>>>
>>>>       0.57 :   c057f5dc:       3d 20 dc 00     lis     r9,-9216
>>>>       0.98 :   c057f5e0:       7d 3a c3 a6     mtspr   794,r9
>>>>       0.16 :   c057f5e4:       92 7f 00 04     stw     r19,4(r31)
>>>>       0.63 :   c057f5e8:       93 df 00 0c     stw     r30,12(r31)
>>>>       0.16 :   c057f5ec:       93 9f 00 10     stw     r28,16(r31)
>>>>       4.95 :   c057f5f0:       92 9f 00 14     stw     r20,20(r31)
>>>>       0.19 :   c057f5f4:       92 5f 00 18     stw     r18,24(r31)
>>>>       0.49 :   c057f5f8:       92 bf 00 1c     stw     r21,28(r31)
>>>>       0.27 :   c057f5fc:       93 7f 00 20     stw     r27,32(r31)
>>>>       5.88 :   c057f600:       93 36 00 00     stw     r25,0(r22)
>>>>       0.11 :   c057f604:       93 17 00 00     stw     r24,0(r23)
>>>>       0.00 :   c057f608:       3d 20 de 00     lis     r9,-8704
>>>>       0.79 :   c057f60c:       7d 3a c3 a6     mtspr   794,r9
>>>>
>>>> Note that here the access_ok() in user_write_access_begin() is skipped
>>>> because the exact same verification has already been performed at the
>>>> beginning of the fonction with the call to user_read_access_begin().
>>>>
>>>> A couple more can be converted as well but require
>>>> unsafe_copy_from_user() which is not defined on x86 and arm64, so
>>>> those are left aside for the time being and will be handled in a
>>>> separate patch.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> ---
>>>> v2: Split out the two hunks using copy_from_user() as unsafe_copy_from_user() is not implemented on x86 and arm64 yet.
>>>
>>> Thanks for the patch.
>>>
>>> The idea looks interesting, but the implementations with
>>> unsafe_get_user() leads to very ugly goto lines, and that's too bad;
>>> it makes the code flow much more difficult to follow.
>>>
>>> I guess that, in most cases this patch tries to cover, we just use
>>> another temporary variable for compat struct, copy fields locally,
>>> then run copy_to_user() in a shot instead.
>>
>> Thanks for looking.
>>
>> I'll give it a try but I think going through a local intermediate will
>> be less performant than direct copy with unsafe_get/put_user().
> 

I have now tried going through a temporary struct and the result is 
awful, even worth than the current implementation, because 
snd_pcm_ioctl_sync_ptr_compat() is not inlined anymore into 
snd_pcm_ioctl(), and the call to copy_from_user() and copy_to_user() 
also show up in the top 10 functions in the perf profile.

> Yes, but the code readability is often more important than minor
> optimizations unless it's in a hot path.

So let's focus on the identified hot path: the SNDRV_PCM_IOCTL_SYNC_PTR 
iotcl.

I will send a patch focussing only on that part. I tweaked it a bit to 
increase readability by nesting the failure labels closer to the 
actions. Let me know whether that patch is more acceptable for you.

In parallel I will send a RFC series that reworks a bit deaper the 
SNDRV_PCM_IOCTL_SYNC_PTR functions with a helper macro, maybe you will 
prefer that allthough the churn is bigger.

Christophe

