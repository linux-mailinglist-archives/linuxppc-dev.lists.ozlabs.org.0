Return-Path: <linuxppc-dev+bounces-7509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05572A7F4DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 08:20:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWwtY3dQ7z2ypW;
	Tue,  8 Apr 2025 16:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744093237;
	cv=none; b=IvWH9WNUdaYMwtcPoPDzYsBy8FDNKHntY60WBZYce1sPlAt7CaLB6zfpwfX59VOlnL6xiIIbdjJ1Lqr020DaQztHpyGPmDJtb+FbOEps1pQK6H+6zHzyufq2v3GvoUVWji442LPPV4fi7xiK+9+Q4CCKcEYqKrTnimNHeA8sAVmVT6lV3hXiokCBOJmQy1EEf1n1B9bUx0NN3kyFzxrIiKUif6BrUhozSZ+eefUSHeTx8olnxGX+TTYKUlR6KdU/oUoakoFBv/aPmv5gtNrTYU4onDPs3l3ZrgUfFOhuF3lrWZqFvsxYuJ5JvwyVCVcCPuj0dqXI86rey5WOMgDX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744093237; c=relaxed/relaxed;
	bh=SrdxJnl2tcWUT1vJ4kRYkx7I7rIIww+RR86Nz8MeihQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPfIF/WA+LMHqa6lK+QRcypupNDM2erwPZwPfA7+LOHAWh3PDB2HSmR4mMVzLI/+bRXGCybEwWL4pum8ujYiqji7EBJeyLjXicDnyTFBW3RzLDrIEh3muu3oxpcCPfKDFj3ZF0mtQQf8g/vr5us8QFXD5UVUsdpu5ZmwJMtDv7ld5Gmkxn91vysZyaxk8tcuKtMm/VdvdiqKTE1MZskp4w5ezfMhk3B4VolwFeYbIaOxbrcdXxShjlxYJKplFafBzELDTKmGk0o2IbLXenzMc8q9DI7aiZ2ZEhJWSG7puT/G8zkE0qvfTBeFBFZmMrPHBdmM78Wd5LP3AyJ0gjrQhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWwtX4Nh8z2ygp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 16:20:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZWwV35TYQz9vhK;
	Tue,  8 Apr 2025 08:02:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpupnrTgHEot; Tue,  8 Apr 2025 08:02:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZWwV34m5bz9t2V;
	Tue,  8 Apr 2025 08:02:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9CB528B76C;
	Tue,  8 Apr 2025 08:02:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id x-i2u3q9lYF6; Tue,  8 Apr 2025 08:02:51 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 20E478B767;
	Tue,  8 Apr 2025 08:02:51 +0200 (CEST)
Message-ID: <0ed6cb24-e8dc-4821-91a9-b638ca862878@csgroup.eu>
Date: Tue, 8 Apr 2025 08:02:50 +0200
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] powerpc: Add check to select
 PPC_RADIX_BROADCAST_TLBIE
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, paulus@ozlabs.org
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
 kernel test robot <lkp@intel.com>
References: <20250407084029.357710-1-maddy@linux.ibm.com>
 <874iyzzt27.fsf@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <874iyzzt27.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 07/04/2025 à 21:10, Ritesh Harjani (IBM) a écrit :
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
> 
>> Commit 3d45a3d0d2e6 ("powerpc: Define config option for processors with broadcast TLBIE")
> 
> We may need to add above to Fixes tag as well, no?
> 
>> added a config option PPC_RADIX_BROADCAST_TLBIE to support processors with
>> broadcast TLBIE. Since this option is relevant only for RADIX_MMU, add
>> a check as a dependency to enable PPC_RADIX_BROADCAST_TLBIE in both
>> powernv and pseries configs. This fixes the unmet config dependency
>> warning reported
>>
>>     WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE
>>       Depends on [n]: PPC_RADIX_MMU [=n]
>>       Selected by [y]:
>>       - PPC_PSERIES [=y] && PPC64 [=y] && PPC_BOOK3S [=y]
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202504051857.jRqxM60c-lkp@intel.com/
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> 
> It's a bit strange that even though PPC_RADIX_BROADCAST_TLBIE adds
> PPC_RADIX_MMU as a dependency where is it defined, we still have to add
> an extra check for the same dependency to enable this for any platform.

That's expected, see 
https://docs.kernel.org/kbuild/kconfig-language.html#menu-attributes :

select should be used with care. select will force a symbol to a value 
without visiting the dependencies. By abusing select you are able to 
select a symbol FOO even if FOO depends on BAR that is not set. In 
general use select only for non-visible symbols (no prompts anywhere) 
and for symbols with no dependencies. That will limit the usefulness but 
on the other hand avoid the illegal configurations all over.

Christophe

> 
> The config generated by the 0day in the shared link, indeed had an unmet
> dependency. i.e.
> 
> CONFIG_PPC_64S_HASH_MMU=y
> # CONFIG_PPC_RADIX_MMU is not set
> CONFIG_PPC_RADIX_BROADCAST_TLBIE=y
> 
> 
> So, the fix look good to me. Please feel free to take:
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> 
> 
>> ---
>>   arch/powerpc/platforms/powernv/Kconfig | 2 +-
>>   arch/powerpc/platforms/pseries/Kconfig | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
>> index 3fbe0295ce14..95d7ba73d43d 100644
>> --- a/arch/powerpc/platforms/powernv/Kconfig
>> +++ b/arch/powerpc/platforms/powernv/Kconfig
>> @@ -17,7 +17,7 @@ config PPC_POWERNV
>>   	select MMU_NOTIFIER
>>   	select FORCE_SMP
>>   	select ARCH_SUPPORTS_PER_VMA_LOCK
>> -	select PPC_RADIX_BROADCAST_TLBIE
>> +	select PPC_RADIX_BROADCAST_TLBIE if PPC_RADIX_MMU
>>   	default y
>>   
>>   config OPAL_PRD
>> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
>> index a934c2a262f6..fa3c2fff082a 100644
>> --- a/arch/powerpc/platforms/pseries/Kconfig
>> +++ b/arch/powerpc/platforms/pseries/Kconfig
>> @@ -23,7 +23,7 @@ config PPC_PSERIES
>>   	select FORCE_SMP
>>   	select SWIOTLB
>>   	select ARCH_SUPPORTS_PER_VMA_LOCK
>> -	select PPC_RADIX_BROADCAST_TLBIE
>> +	select PPC_RADIX_BROADCAST_TLBIE if PPC_RADIX_MMU
>>   	default y
>>   
>>   config PARAVIRT
>> -- 
>> 2.48.1


