Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C9E13D694
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 10:18:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yzC93WHFzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 20:18:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=kHJ/FujL; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yz8T1Yy6zDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 20:16:24 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47yz8L74yxz9tyQR;
 Thu, 16 Jan 2020 10:16:18 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kHJ/FujL; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lt8jAOtwQ37r; Thu, 16 Jan 2020 10:16:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47yz8L5yqZz9tyQP;
 Thu, 16 Jan 2020 10:16:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579166178; bh=zhSNNoA19/DJtyqK00k6NS1e1aITemDpv4Uo0GCOeHg=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=kHJ/FujLNVI5NHn588r9Xp2wHJbaCU+ZBkfGxNVcWiwtRBmZW0lfLLuD4NqyCZjiq
 +rTgIsm7pFN1rx7YTTWhuMQluEkHnAwg5Mf/G4PgNahbW9tMt03xitw118O2by2nT9
 rGG+pJM5Wh/XK2tpcgdQ3yLjIqpixSaM9eK0L1tQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DA4C58B811;
 Thu, 16 Jan 2020 10:16:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FPW2Cv_UNA79; Thu, 16 Jan 2020 10:16:19 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 212448B810;
 Thu, 16 Jan 2020 10:16:19 +0100 (CET)
Subject: Re: [RFC PATCH v3 08/12] lib: vdso: allow arches to provide vdso data
 pointer
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Thomas Gleixner <tglx@linutronix.de>, luto@kernel.org
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
 <381e547dbb3c48fd39d6cf208033bba38ad048fb.1578934751.git.christophe.leroy@c-s.fr>
 <87ftghbpuu.fsf@nanos.tec.linutronix.de>
 <d2de3211-9d7c-513e-fe0f-8bdce623fb65@c-s.fr>
Message-ID: <b5fddcf8-99ff-fc0d-40c0-0eb81ad4e94a@c-s.fr>
Date: Thu, 16 Jan 2020 10:16:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d2de3211-9d7c-513e-fe0f-8bdce623fb65@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: arnd@arndb.de, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas, Andy,

Le 15/01/2020 à 07:15, Christophe Leroy a écrit :
> 
> 
> Le 15/01/2020 à 00:06, Thomas Gleixner a écrit :
>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>>   static __maybe_unused int
>>> +#ifdef VDSO_GETS_VD_PTR_FROM_ARCH
>>> +__cvdso_clock_gettime_common(const struct vdso_data *vd, clockid_t 
>>> clock,
>>> +              struct __kernel_timespec *ts)
>>> +{
>>> +#else
>>>   __cvdso_clock_gettime_common(clockid_t clock, struct 
>>> __kernel_timespec *ts)
>>>   {
>>>       const struct vdso_data *vd = __arch_get_vdso_data();
>>> +#endif
>>>       u32 msk;
>>
>> If we do that, then there is no point in propagating this to the inner
>> functions. It's perfectly fine to have this distinction at the outermost
>> level.
> 
> In v2, I did it at the arch level (see 
> https://patchwork.ozlabs.org/patch/1214983/). Andy was concerned about 
> it being suboptimal for arches which (unlike powerpc) have PC related 
> data addressing mode.
> 
> Wouldn't it be the same issue if doing it at the outermost level of 
> generic VDSO ?

Any opinion on this ?

 From your point of view, what should I do:
A/ __arch_get_vdso_data() handled entirely at arch level and arches 
handing over the vdso data pointer to generic C VDSO functions all the 
time (as in my v2 series) ?
B/ Data pointer being handed over all the way up for arches wanting to 
do so, no changes at all for others (as in my v3 series) ?
C/ __arch_get_vdso_data() being called at the outermost generic level 
for arches not interested in handling data pointer from the caller (as 
suggested by Thomas) ?

Andy, with A/ you were concerned about arches being able to do PC 
related accesses. Would it be an issue for C/ as well ? If not, I guess 
C/ would be cleaner than B/ allthought not as clean as A which doesn't 
add any #ifdefery at all.

Thanks
Christophe
