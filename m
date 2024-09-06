Return-Path: <linuxppc-dev+bounces-1128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 862D996F6A7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 16:26:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0dp60p4lz2yvj;
	Sat,  7 Sep 2024 00:26:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725632798;
	cv=none; b=kdU7UTveMG08dyQCzTssxWwwo4ailQTbLnEctdOXPYiARIlARZGuDAxTFc7oORZjFCDbuYah2bLlzrXvR/EFz65VP9J0v9gXxJmF2yB1k8IEXAaKpchNvULRU3PFnsYDnZUH4Wdz0HcO/29c+j+MrdNTfjnXsmc+L7q34UKzC5hHV53eYqMrG3Dc5adGoOyyYrJwx0Bfl6RPxttljSTrXqnIJhVpMsD6+5XFEtnXbA2OrSIGBWmXBLJJMJhsNNYpxbYKsP7lpNgsAANVnUG8ffoSDrj157mBYLRxGHu3rSCzyJmd0hmf1hX9ey2W47RQB3A2aXdgv/23AfmY9CCpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725632798; c=relaxed/relaxed;
	bh=1Y+xQpEWgLoiDnffNsJ5/gL2xu1XyEFKnS3qoqRzLAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QG6dogYLo2KX1KOTvpkRCraajTYAxxji1+HandFubBzTWTgy7lVtubtYUY75wWgsyDvCWmDN7RhlnhmC31nLocQDqSxz1plpn9O21yXmRVSxa7l95jZHTqPf6Y9YP8eHIQ8YbXqXR9+/+I1QBABd3QzhA8zeilXqqk1NyvKMxZOOpG2PPvtM1fUP+j2HqqBRiyCDYeXJMvYyXbsvI105NAUMb/xWCcYZOa+Kfmm0EOsj3l4bXZpRIkpeeQo8tBdrqVymehgiyardzGQSM4qPtBVH8mVajvWlh3tbgcS8tyw2gLnHRxzuqvvRVX5syo22/1HVJQIcD4NVKYZuchLBaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0dp55NXBz2ydR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 00:26:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X0dp11cClz9sRs;
	Fri,  6 Sep 2024 16:26:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VYKC4BIXjqc; Fri,  6 Sep 2024 16:26:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X0dp10qrzz9sRr;
	Fri,  6 Sep 2024 16:26:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CE838B778;
	Fri,  6 Sep 2024 16:26:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zRHVVnzg8rQx; Fri,  6 Sep 2024 16:26:32 +0200 (CEST)
Received: from [192.168.235.70] (unknown [192.168.235.70])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A024F8B764;
	Fri,  6 Sep 2024 16:26:32 +0200 (CEST)
Message-ID: <795db5f1-c266-4fb3-a51b-c2b3745d334b@csgroup.eu>
Date: Fri, 6 Sep 2024 16:26:32 +0200
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
Subject: Re: [PATCH 2/2] Fixup for 3279be36b671 ("powerpc/vdso: Wire up
 getrandom() vDSO implementation on VDSO32")
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andrei Vagin <avagin@gmail.com>
References: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
 <ffd7fc255e194d1e2b0aa3d9d129e826c53219d4.1725611321.git.christophe.leroy@csgroup.eu>
 <ZtsMpcV7iLYoytdJ@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZtsMpcV7iLYoytdJ@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 06/09/2024 à 16:07, Jason A. Donenfeld a écrit :
> On Fri, Sep 06, 2024 at 10:33:44AM +0200, Christophe Leroy wrote:
>> Use the new get_realdatapage macro instead of get_datapage
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/kernel/vdso/getrandom.S | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/vdso/getrandom.S b/arch/powerpc/kernel/vdso/getrandom.S
>> index a957cd2b2b03..f3bbf931931c 100644
>> --- a/arch/powerpc/kernel/vdso/getrandom.S
>> +++ b/arch/powerpc/kernel/vdso/getrandom.S
>> @@ -31,7 +31,7 @@
>>   	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
>>     .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
>>   #endif
>> -	get_datapage	r8
>> +	get_realdatapage	r8, r11
>>   	addi		r8, r8, VDSO_RNG_DATA_OFFSET
>>   	bl		CFUNC(DOTSYM(\funct))
>>   	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> 
> I tested that this is working as intended on powerpc, powerpc64, and
> powerpc64le. Thanks for writing the patch so quickly.

You are welcome.

And thanks for playing up with it while I was sleeping and getting ideas 
too.

Did you learn powerpc assembly during the night or did you know it already ?

At the end I ended up with something which I think is simple enough for 
a backport to stable.

On the long run I wonder if we should try to find a more generic 
solution for getrandom instead of requiring each architecture to handle 
it. On gettimeofday the selection of the right page is embeded in the 
generic part, see for instance :

static __maybe_unused __kernel_old_time_t
__cvdso_time_data(const struct vdso_data *vd, __kernel_old_time_t *time)
{
	__kernel_old_time_t t;

	if (IS_ENABLED(CONFIG_TIME_NS) &&
	    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
		vd = __arch_get_timens_vdso_data(vd);

	t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);

	if (time)
		*time = t;

	return t;
}

and powerpc just provides:

static __always_inline
const struct vdso_data *__arch_get_timens_vdso_data(const struct 
vdso_data *vd)
{
	return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
}


I know it may not be that simple for getrandom but its probably worth 
trying.

Or another solution could be to put random data in a third page that is 
always at the same place regardless of timens ?

Christophe

