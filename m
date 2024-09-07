Return-Path: <linuxppc-dev+bounces-1150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EED9706CC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2024 13:20:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1nZl3MDYz2xjd;
	Sun,  8 Sep 2024 21:20:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725794447;
	cv=none; b=RgUhywqpqlwSP1v+x/9stK0zJg1OocriDvg3oW32WwZpTvYLJ1+zlOJjX2VkA1TkRdSu26R+wXM5FmP4ui/uKnL47PxAL1AsLxvdpffewIkeEPxICuzPeAKNjSDxyyfAdEuBJUHqeQFCusRzv91hyGVBQYf7iVmnFREtluW0kzgnoTbZPuGVdQhjtty8XYAF38hocWkcSNeHvNtZQqdmkCd37szZ6rtrI+YF2bNlK0tf7yHiHVpzXj15L/PYgh38oHisN27J6VTmWHniaUMXoGdEy6AcFCFmYIsVQ6KJu2xPSs4EmfSfCMgfKYDGTE8kJIN9n63z/+9eJlN4yU5sKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725794447; c=relaxed/relaxed;
	bh=3kJ7O/XWTpmvTccn4OSuJsTwOrdVSJDFb460GfrXroM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFzaGJhWpxTJwiq8GDFiRL2qSMl2Q3roMYqhjD4n/ntMYg4hLWVdExTRVpZ0t3qMi1MwZ1pABI1poYnjSjVKxUksuGIoi/646LHhPQXq8UUqccBHmzRwhBC3bZRagOnz0avOmFvqEaZB3dszSiod9d1R7x15SNzUadlL4JSlPny0V5TiXq7gUbVXm0KNr/BP8woKMSxF0OqUoWZb/uygpqFHHuVXqQTiZvGbM0DMnr8doNYsLSUt9a+BJ3ay6BRmkljwWi+mkbtJKs36qMH/bNSLapg+oEhMZcFn1YWWuGzZOluEu4AO82nGpWD5LwrP76DrftIirLjpfktxgQi3Kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1nZl0z2Xz2xg3
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2024 21:20:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X1nZc2pXwz9sRr;
	Sun,  8 Sep 2024 13:20:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lTt-JMNitmU4; Sun,  8 Sep 2024 13:20:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X1nZR1nXQz9rvV;
	Sun,  8 Sep 2024 13:20:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D78618CBF0;
	Sat,  7 Sep 2024 17:15:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id F3l8t7uw49Lx; Sat,  7 Sep 2024 17:15:17 +0200 (CEST)
Received: from [192.168.232.96] (unknown [192.168.232.96])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 60FEB8CBEF;
	Sat,  7 Sep 2024 17:15:17 +0200 (CEST)
Message-ID: <c187369e-a034-4d32-bbed-cacb41ddd65e@csgroup.eu>
Date: Sat, 7 Sep 2024 17:15:17 +0200
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
 <8d0a8d03-95b3-40a8-85cd-5c2e6f92eb6b@csgroup.eu>
 <ZttP-SU9i6iOyfnG@zx2c4.com> <ZtxkzjvHyaCWTsSf@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZtxkzjvHyaCWTsSf@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 07/09/2024 à 16:35, Jason A. Donenfeld a écrit :
> On Fri, Sep 06, 2024 at 08:54:49PM +0200, Jason A. Donenfeld wrote:
>> On Fri, Sep 06, 2024 at 05:14:43PM +0200, Christophe Leroy wrote:
>>>
>>>
>>> Le 06/09/2024 à 16:46, Jason A. Donenfeld a écrit :
>>>> On Fri, Sep 06, 2024 at 04:26:32PM +0200, Christophe Leroy wrote:
>>>>
>>>>> On the long run I wonder if we should try to find a more generic
>>>>> solution for getrandom instead of requiring each architecture to handle
>>>>> it. On gettimeofday the selection of the right page is embeded in the
>>>>> generic part, see for instance :
>>>>>
>>>>> static __maybe_unused __kernel_old_time_t
>>>>> __cvdso_time_data(const struct vdso_data *vd, __kernel_old_time_t *time)
>>>>> {
>>>>> 	__kernel_old_time_t t;
>>>>>
>>>>> 	if (IS_ENABLED(CONFIG_TIME_NS) &&
>>>>> 	    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
>>>>> 		vd = __arch_get_timens_vdso_data(vd);
>>>>>
>>>>> 	t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
>>>>>
>>>>> 	if (time)
>>>>> 		*time = t;
>>>>>
>>>>> 	return t;
>>>>> }
>>>>>
>>>>> and powerpc just provides:
>>>>>
>>>>> static __always_inline
>>>>> const struct vdso_data *__arch_get_timens_vdso_data(const struct
>>>>> vdso_data *vd)
>>>>> {
>>>>> 	return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
>>>>> }
>>>>
>>>> It's tempting, but maybe a bit tricky. LoongArch, for example, doesn't
>>>> have this problem at all, because the layout of their vvars doesn't
>>>> require it. So the vd->clock_mode access is unnecessary.
>>>>
>>>>> Or another solution could be to put random data in a third page that is
>>>>> always at the same place regardless of timens ?
>>>>
>>>> Maybe that's the easier way, yea. Potentially wasteful, though.
>>>>
>>>
>>> Indeed I just looked at Loongarch and that's exactly what they do: they
>>> have a third page after the two pages dedicated to TIME for arch
>>> specific data, and they have added getrandom data there.
>>>
>>> The third page is common to every process so it won't waste more than a
>>> few bytes. It doesn't worry me even on the older boards that only have
>>> 32 Mbytes of RAM.
>>>
>>> So yes, I may have a look at that in the future, what we have at the
>>> moment is good enough to move forward.
>>
>> My x86 code is kind of icky for this:
>>
>> static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
>> {
>>          if (IS_ENABLED(CONFIG_TIME_NS) && __vdso_data->clock_mode == VDSO_CLOCKMODE_TIMENS)
>>                  return (void *)&__vdso_rng_data + ((void *)&__timens_vdso_data - (void *)&__vdso_data);
>>          return &__vdso_rng_data;
>> }
>>
>> Doing the subtraction like that means that this is more clearly correct.
>> But it also makes the compiler insert two jumps for the branch, and then
>> reads the addresses of those variables and such.
>>
>> If I change it to:
>>
>> static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
>> {
>>          if (IS_ENABLED(CONFIG_TIME_NS) && __vdso_data->clock_mode == VDSO_CLOCKMODE_TIMENS)
>>                  return (void *)&__vdso_rng_data + (3UL << CONFIG_PAGE_SHIFT);
>>          return &__vdso_rng_data;
>> }
>>
>> Then there's a much nicer single `cmov` with no branching.
>>
>> But if I want to do that for real, I'll have to figure out what set of
>> nice compile-time constants I can use. I haven't looked into this yet.
> 
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20240906190655.2777023-1-Jason%40zx2c4.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C3ee8b35fe848434e72fd08dccf4a67ff%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638613165688600378%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=g4zcMonjJNYhwrUWeCDoL5Ri7Mbg5hVQJyZNU2zH4Pc%3D&reserved=0

Looks good.

Allthough other architectures don't use defines but enums for that:

arch/arm64/kernel/vdso.c-36-
arch/arm64/kernel/vdso.c-37-enum vvar_pages {
arch/arm64/kernel/vdso.c:38:	VVAR_DATA_PAGE_OFFSET,
arch/arm64/kernel/vdso.c:39:	VVAR_TIMENS_PAGE_OFFSET,
arch/arm64/kernel/vdso.c-40-	VVAR_NR_PAGES,
arch/arm64/kernel/vdso.c-41-};
--
arch/loongarch/include/asm/vdso/vdso.h-36-
arch/loongarch/include/asm/vdso/vdso.h-37-enum vvar_pages {
arch/loongarch/include/asm/vdso/vdso.h:38:	VVAR_GENERIC_PAGE_OFFSET,
arch/loongarch/include/asm/vdso/vdso.h:39:	VVAR_TIMENS_PAGE_OFFSET,
arch/loongarch/include/asm/vdso/vdso.h-40-	VVAR_LOONGARCH_PAGES_START,
arch/loongarch/include/asm/vdso/vdso.h-41-	VVAR_LOONGARCH_PAGES_END = 
VVAR_LOONGARCH_PAGES_START + LOONGARCH_VDSO_DATA_PAGES - 1,
--
arch/powerpc/kernel/vdso.c-54-
arch/powerpc/kernel/vdso.c-55-enum vvar_pages {
arch/powerpc/kernel/vdso.c:56:	VVAR_DATA_PAGE_OFFSET,
arch/powerpc/kernel/vdso.c:57:	VVAR_TIMENS_PAGE_OFFSET,
arch/powerpc/kernel/vdso.c-58-	VVAR_NR_PAGES,
arch/powerpc/kernel/vdso.c-59-};
--
arch/riscv/kernel/vdso.c-19-
arch/riscv/kernel/vdso.c-20-enum vvar_pages {
arch/riscv/kernel/vdso.c:21:	VVAR_DATA_PAGE_OFFSET,
arch/riscv/kernel/vdso.c:22:	VVAR_TIMENS_PAGE_OFFSET,
arch/riscv/kernel/vdso.c-23-	VVAR_NR_PAGES,
arch/riscv/kernel/vdso.c-24-};
--
arch/s390/kernel/vdso.c-31-
arch/s390/kernel/vdso.c-32-enum vvar_pages {
arch/s390/kernel/vdso.c:33:	VVAR_DATA_PAGE_OFFSET,
arch/s390/kernel/vdso.c:34:	VVAR_TIMENS_PAGE_OFFSET,
arch/s390/kernel/vdso.c-35-	VVAR_NR_PAGES,
arch/s390/kernel/vdso.c-36-};

Christophe

