Return-Path: <linuxppc-dev+bounces-6406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3423A41C68
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 12:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1dYz5v9Xz2yk7;
	Mon, 24 Feb 2025 22:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740396007;
	cv=none; b=jI81Jz2BPh9IvZbGQ4a3T0Gf0W6+OpqlfQPWARhI5lU24n53BQIRv6BTvtWWbcU9AXvYhlMCv+1T8m/S8SAPOmVf7gERhcwhjIdV3Wm+lXPYgavUJiViewA7nZtMPwNp7Y+GmxcIMDJDFDg4AQatduuv489n4aPHHpC13sfmYv2KMUwS4z8Uz8ZnOASlRXKEFlTuGGg69HTOfJIDCkg5N5feFMljFjKfcq+cxZqD0nbHWu+2p3TJy0KYqd/ySb92weVdUvsh4mtEmOIk9Tb5MTHpdFHa+JEG7JvogFmMcq8FPJP2qsJvdNs0ltZ/hnC+CF6SK5J6hHdWO0ggz5kSTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740396007; c=relaxed/relaxed;
	bh=agwkPsQh4b0DyXkYLYLuwktIP7TFr6q/buoiPBn5ggc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEbq5/nmC3CAVdIM90X1gsTTfqc7BafbdNagK0BpqwP21LgRBRcPElHibmAaOF2i/2hBc68Z7Ylj4cFrXAnKs9u0QkoUBlIpCkB/o4z8Vgllk9Jgu2A+cKPOAVwVyww3m83yqbL3aTR4pybvNI0xVWmOKSP3RKS1cYopnVvas8+FFoYozzEIh2puLvwBXwcacIPoeg7+q8jj6G+KEjqmGGMwwPJUvMFsYTaYPmSIycWm2QYcKcJzt0DRf/GWl1IGSeX/W5y2tdVnpXHkMPCpx3tMRXNrc4dmm73/mZXJ6t0Y89tUNf3ws5E1tsHln4Pcx32wo2xy3JUbZNDaVbduzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1dYy55gqz2xYr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 22:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1dQg35xWz9sSq;
	Mon, 24 Feb 2025 12:13:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reeUmV24E4zC; Mon, 24 Feb 2025 12:13:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1dQg2BZFz9sSp;
	Mon, 24 Feb 2025 12:13:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FFAC8B765;
	Mon, 24 Feb 2025 12:13:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kefUlrU39Hz9; Mon, 24 Feb 2025 12:13:47 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C903F8B763;
	Mon, 24 Feb 2025 12:13:46 +0100 (CET)
Message-ID: <5e8a4dd9-50a8-4080-8d63-dbb8c7241b98@csgroup.eu>
Date: Mon, 24 Feb 2025 12:13:46 +0100
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
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Steven Price <steven.price@arm.com>, linux-mm@kvack.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
 <8e75c5ff-a97b-4a6f-9c8b-ac2598eafe60@arm.com>
 <6e1201a1-60c1-40a3-951f-d603b6341a11@csgroup.eu>
 <03b042ec-1cb7-4419-8741-c65e74e49d51@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <03b042ec-1cb7-4419-8741-c65e74e49d51@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 14/02/2025 à 08:26, Anshuman Khandual a écrit :
> 
> 
> On 2/13/25 17:19, Christophe Leroy wrote:
>>
>>
>> Le 13/02/2025 à 12:23, Steven Price a écrit :
>>> On 13/02/2025 04:09, Anshuman Khandual wrote:
>>>> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
>>>> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
>>>> is confusing as they sound very similar and does not differentiate between
>>>> platform's feature subscription and feature enablement for ptdump. Rename
>>>> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
>>>> readability.
>>>
>>> [...]
>>>> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
>>>> index 77306be62e9e..db005618690b 100644
>>>> --- a/arch/powerpc/configs/mpc885_ads_defconfig
>>>> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
>>>> @@ -78,4 +78,4 @@ CONFIG_DEBUG_VM_PGTABLE=y
>>>>    CONFIG_DETECT_HUNG_TASK=y
>>>>    CONFIG_BDI_SWITCH=y
>>>>    CONFIG_PPC_EARLY_DEBUG=y
>>>> -CONFIG_GENERIC_PTDUMP=y
>>>> +CONFIG_PTDUMP=y
>>>
>>> I'd suggest dropp this from the defconfig too, just like patch 1 dropped
>>> it from debug.config.
>>>
>>
>> Thanks for spotting that.
>>
>> That one is wrong. Was introduced by commit d210ee3fdfe8 ("powerpc/configs: Update config files for removed/renamed symbols") which aimed at fixing commit e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP") but it did it wrong.
>>
>> It is CONFIG_PTDUMP_DEBUGFS that is wanted.
> 
> Should this replacement be done in the series or would you like it
> to be handled in powerpc later ?

Yes I think you should do the replacement.

