Return-Path: <linuxppc-dev+bounces-1124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AAA96F455
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 14:31:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0bFP1dcGz30BG;
	Fri,  6 Sep 2024 22:31:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725625897;
	cv=none; b=osz3ELWIWkQbImCfMASGDJcN/FC0B91n8YpTwwpykB3Ztp9/ItvMyECSO+TTRScv9hibkg6umMDh15vpel4M8/j3ps1EiW1Wem5LOS1hfJfMrkSJmINqS08uI6JPf+AZx+JGVNKxqDL18/RaLzxDEKApBx2LqMQbPBeinw/bGmpmAgp9MnoGV3hXuxNxZ9HqySFDOuSk4S4Tg97XKpU8qxOTzilixDNoeAQutwFtueNltqstVEo413X4tnDd+cTXJ8kirvjqCYPZofo116e3cDu7MeF5axVCdifnYiyzdDhIuLgriI7c6JeERZNQuyV4hJ1C4ydYew0stNvLz2ZmDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725625897; c=relaxed/relaxed;
	bh=S5iwQYDLCb1Qc/UwH7/UyRT768mOgsLnGSk2lshWJp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gv3pNkA1vqKN6Rk56VXkJM7lah4cCwrGRZ6dUmueY0GaDT78Y5bHnubCV9T437M/berqFnHWOARnGS0oGTJ3DacKagLRMuuc20LxzJmifnZ4GnKO34dUmW3TMwdPlcFnb+NhYl/MfLrvTEwd9iE5zld9w2VV6SKZpFeupqTU2vEtSah2Uceqe6Hb5RDzXzwD32f6THHGuZDJiEYaEqqGpmbrvdKhPO/mdV+GPlD6QTsVryoNOgQcZzSrNNeZ/nXLvtdDc0v7Rqubh6hq0zGO9+MNHQ2eSxuQH2/6LGn+9uGb88YinO89R8WjRc/GqVQ6HaAOV9T6shjrJm/2APzIIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0bFN6KX6z2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 22:31:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X0bFF6wc3z9sRy;
	Fri,  6 Sep 2024 14:31:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sevjizfciI8Z; Fri,  6 Sep 2024 14:31:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X0bFF683cz9sRs;
	Fri,  6 Sep 2024 14:31:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C21C88B778;
	Fri,  6 Sep 2024 14:31:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 6C9CitRpM0wH; Fri,  6 Sep 2024 14:31:29 +0200 (CEST)
Received: from [192.168.235.70] (unknown [192.168.235.70])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E7E48B764;
	Fri,  6 Sep 2024 14:31:29 +0200 (CEST)
Message-ID: <19f6a089-caa8-4d91-951a-d9a25e05ba94@csgroup.eu>
Date: Fri, 6 Sep 2024 14:31:29 +0200
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
Subject: Re: [PATCH 1/2] powerpc/vdso: Fix VDSO data access when running in a
 non-root time namespace
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andrei Vagin <avagin@gmail.com>
References: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
 <87r09x3r9v.fsf@mail.lhotse>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87r09x3r9v.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 06/09/2024 à 14:23, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> When running in a non-root time namespace, the global VDSO data page
>> is replaced by a dedicated namespace data page and the global data
>> page is mapped next to it. Detailed explanations can be found at
>> commit 660fd04f9317 ("lib/vdso: Prepare for time namespace support").
>>
>> When it happens, __kernel_get_syscall_map and __kernel_get_tbfreq
>> and __kernel_sync_dicache don't work anymore because they read 0
>> instead of the data they need.
>>
>> To address that, clock_mode has to be read. When it is set to
>> VDSO_CLOCKMODE_TIMENS, it means it is a dedicated namespace data page
>> and the global data is located on the following page.
>>
>> Add a macro called get_realdatapage which reads clock_mode and add
>> PAGE_SIZE to the pointer provided by get_datapage macro when
>> clock_mode is equal to VDSO_CLOCKMODE_TIMENS. Use this new macro
>> instead of get_datapage macro except for time functions as they handle
>> it internally.
>>
>> Fixes: 74205b3fc2ef ("powerpc/vdso: Add support for time namespaces")
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>   
> Oops.
> 
> I guess it should also have:
> 
>    Cc: stable@vger.kernel.org # v5.13+
>    Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
>    Closes: https://lore.kernel.org/all/ZtnYqZI-nrsNslwy@zx2c4.com/

Jason only reported a problem with getrandom, the other three are 
"cherry on the cake".

The bug has been there for 3 years, I'm sure it can stay 3-4 more weeks, 
I'm not sure there is a need to apply it in both trees.

As far as I understood Jason was about to squash the fix into his tree 
so I was expecting him to apply patch 1 before "vDSO getrandom 
implementation for powerpc" patches and then squash patch 2 in place.

> 
> Jason how do you want to handle this?
> 
> I can put patch 1 in a topic branch that we both merge? Then you can
> apply patch 2 on top of that merge in your tree.
> 
> Or we could both apply patch 1 to our trees, it might lead to a conflict
> but it wouldn't be anything drastic.


