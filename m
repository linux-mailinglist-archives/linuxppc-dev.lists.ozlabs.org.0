Return-Path: <linuxppc-dev+bounces-1132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7A96F7F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 17:14:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0fsh4LQnz302b;
	Sat,  7 Sep 2024 01:14:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725635688;
	cv=none; b=M9uczmkdExGOqtnERxOhj2hwFa8Giem0SqEaWBmhscYZJwLSylZVkER0PRdMDZ28ZdV7nUT6hJ5g28ZCKHiN+pqPLtLcIlw/eL0Jr1HiZs+hGvIliOGaVw0NqCx2ZEPCxKSjuz8XxXE3rtsWGhFtj9VHKWBqLoMEEkINNMtxaFckkXJyQ9EnD/wTn9NmBmcgMOHMhi3mEGqEyn98F2skwT3cfnCvQaBJzhizFeh6UQU/FHZolEyhfjcHwfNYOdZO3Tswhi2uBTPBAOQXJLi8sO8/dFqtFa4Hu0R4wknt0Wru1pKjSB5uMFhnSMQiEMXWnKDF6kZ3zAqZ/EOBZhenXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725635688; c=relaxed/relaxed;
	bh=yAp+T542xTCj59JVqq2IyWwLYkESk5+zy3jpKRK0Cxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Te79q2fiG7dj0iBeLgvO1FXcz6KtY4Wop6e1HiljGDcVdfdDwcLzSVFAC7NWfRSAb8k3TE1abe6jrEo8EJqcEMNDotdjPTixtN8qMPUVXKRhMibVUeSDidyUjd4sIhhpHN5jgQ9QvMDL0KlW3EuZYY482XBrKNXDuiwP6sLTqqI4XPfaejuDzBayKSRIGGgvoV/qjvMSSqKd+l5agnb0pEvZa/4iNsbriRF9ZVv2Qk8OQqhWc3fE6tStPvQW+Uve364He8QCNqIQ87x9VIT/wyCW5f1FUxTn9IkwX5EjxuD2uVN3My5Iog/4rXns2aeMQnbqjYZnwB/dPVJXQ5svjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0fsh1vQCz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 01:14:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X0fsc1PHVz9sRs;
	Fri,  6 Sep 2024 17:14:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNbein6IwXot; Fri,  6 Sep 2024 17:14:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X0fsc0dFPz9sRr;
	Fri,  6 Sep 2024 17:14:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 05C4A8B778;
	Fri,  6 Sep 2024 17:14:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kShRiX5vNBN2; Fri,  6 Sep 2024 17:14:43 +0200 (CEST)
Received: from [192.168.235.70] (unknown [192.168.235.70])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 960F18B764;
	Fri,  6 Sep 2024 17:14:43 +0200 (CEST)
Message-ID: <8d0a8d03-95b3-40a8-85cd-5c2e6f92eb6b@csgroup.eu>
Date: Fri, 6 Sep 2024 17:14:43 +0200
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
 <795db5f1-c266-4fb3-a51b-c2b3745d334b@csgroup.eu>
 <ZtsVry_LL2jjeLJ3@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZtsVry_LL2jjeLJ3@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 06/09/2024 à 16:46, Jason A. Donenfeld a écrit :
> On Fri, Sep 06, 2024 at 04:26:32PM +0200, Christophe Leroy wrote:
> 
>> On the long run I wonder if we should try to find a more generic
>> solution for getrandom instead of requiring each architecture to handle
>> it. On gettimeofday the selection of the right page is embeded in the
>> generic part, see for instance :
>>
>> static __maybe_unused __kernel_old_time_t
>> __cvdso_time_data(const struct vdso_data *vd, __kernel_old_time_t *time)
>> {
>> 	__kernel_old_time_t t;
>>
>> 	if (IS_ENABLED(CONFIG_TIME_NS) &&
>> 	    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
>> 		vd = __arch_get_timens_vdso_data(vd);
>>
>> 	t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
>>
>> 	if (time)
>> 		*time = t;
>>
>> 	return t;
>> }
>>
>> and powerpc just provides:
>>
>> static __always_inline
>> const struct vdso_data *__arch_get_timens_vdso_data(const struct
>> vdso_data *vd)
>> {
>> 	return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
>> }
> 
> It's tempting, but maybe a bit tricky. LoongArch, for example, doesn't
> have this problem at all, because the layout of their vvars doesn't
> require it. So the vd->clock_mode access is unnecessary.
> 
>> Or another solution could be to put random data in a third page that is
>> always at the same place regardless of timens ?
> 
> Maybe that's the easier way, yea. Potentially wasteful, though.
> 

Indeed I just looked at Loongarch and that's exactly what they do: they 
have a third page after the two pages dedicated to TIME for arch 
specific data, and they have added getrandom data there.

The third page is common to every process so it won't waste more than a 
few bytes. It doesn't worry me even on the older boards that only have 
32 Mbytes of RAM.

So yes, I may have a look at that in the future, what we have at the 
moment is good enough to move forward.

Christophe

