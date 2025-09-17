Return-Path: <linuxppc-dev+bounces-12353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC4B80BB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 17:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRjsT4z59z2xgQ;
	Thu, 18 Sep 2025 01:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758124237;
	cv=none; b=FujjJp02Ha67D/p2G7zNALYYNtzau2Pvmk0x9OS6MjFyyWWnvErYRi1WTE2KHF2gl7EHpFNK4Oc2tj00NSsjksDCFiDubNr44bjqtJdsZpJAYyRIAIBgTkmGuuj/jrmeZvaS3sE/nFcjmVRmkKMbtyigriQ4u0sMvJm18HTgSW2tbm73YIPPIukYST2TI0FDISVzu03gujyr0xc7IeuTRZNhuak/F3N01CSQF1U4uQtXfmGHNAfGTG9/CyrI9D6bi06sTRmhs7npNF3fOHY4aK5pLH8rJjC3nHrxiTWYnjBTAcBAVlV8vHNlEU5UnRkqJQs9basAPi9FST/X8tvTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758124237; c=relaxed/relaxed;
	bh=BzLbMenZtftH89T106gmsuJ+uofhbnsg1l+2Ng0lErU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5VNiXsnL3LTowm+YM08vEgImIg4mejDGt7ynURl2s940sqCxqL4uw05mANa4VU54K3mlpZE85QAJ5XDkpeuGJfPbtKlD/9HXbmZr2c8lsBZBeXHekV7fBjnia9bzZ1DZL9/waxKm3qjOvX8PsOKXC061WpV8kASp0fpPr5Iq409zBbawobk4twUiv6Vh29ICXCV/lBgtloQr1E2mwNYM0d2/2UQQ8u5BX/4xJSS42cX5DlBW8YkJmaodzX/3hqTBtY+/WLMYsDXnXTtictaE9WSfwAV32IZdeItrpBFr8U0tMte520bL1azpMdOA8qRF7R8CfSTfH+BsnHT7fFABA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRjsS6cN8z2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 01:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRjGc51W3z9sxb;
	Wed, 17 Sep 2025 17:23:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id semPCKf2cGPh; Wed, 17 Sep 2025 17:23:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRjGc3ltzz9sxZ;
	Wed, 17 Sep 2025 17:23:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 699538B76C;
	Wed, 17 Sep 2025 17:23:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sLjYwSuYZXNq; Wed, 17 Sep 2025 17:23:52 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 38E3E8B767;
	Wed, 17 Sep 2025 17:23:40 +0200 (CEST)
Message-ID: <c4a281c7-e225-418f-95c3-8fa91073a6b4@csgroup.eu>
Date: Wed, 17 Sep 2025 17:23:40 +0200
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
Subject: Re: [PATCH v3 07/36] powerpc/vdso: Explicitly include asm/cputable.h
 and asm/feature-fixups.h
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King
 <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>,
 linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
 <20250917-vdso-sparc64-generic-2-v3-7-3679b1bc8ee8@linutronix.de>
 <41d100c5-4706-400e-a61a-46b068f1bc74@csgroup.eu>
 <20250917171207-1fad0416-7543-481c-a998-5881fab1714e@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250917171207-1fad0416-7543-481c-a998-5881fab1714e@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 17/09/2025 à 17:21, Thomas Weißschuh a écrit :
> On Wed, Sep 17, 2025 at 04:41:49PM +0200, Christophe Leroy wrote:
>>
>>
>> Le 17/09/2025 à 16:00, Thomas Weißschuh a écrit :
>>> The usage of ASM_FTR_IFCLR(CPU_TR_ARCH_31) requires asm/cputable.h and
>>> asm/feature-fixups.h. Currently these headers are included transitively,
>>> but that transitive inclusion is about to go away.
>>
>> Hum ...
>>
>> That was unexpectedly added by commit 9c7bfc2dc21e ("powerpc/64s: Make
>> POWER10 and later use pause_short in cpu_relax loops")
>>
>> In theory, vdso/ headers shouldn't include any headers outside of vdso/
> 
> I am aware. But this is the dependency as it exists today and I don't really
> want to make this series larger than it already is. This is by far not the
> only such layering violation in the vDSO headers. I have some patches prepared...
> 
>>> Explicitly include the headers.
>>>
>>> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
>>> ---
>>>    arch/powerpc/include/asm/vdso/processor.h | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/arch/powerpc/include/asm/vdso/processor.h b/arch/powerpc/include/asm/vdso/processor.h
>>> index 80d13207c5688d73954822aede2bbe2d0e05c054..42b64903bdf47cc5bd571fc3b5caed45e6358cb9 100644
>>> --- a/arch/powerpc/include/asm/vdso/processor.h
>>> +++ b/arch/powerpc/include/asm/vdso/processor.h
>>> @@ -4,6 +4,9 @@
>>>    #ifndef __ASSEMBLY__
>>
>> __ASSEMBLY__ is replaced by __ASSEMBLER__ in powerpc-next in commit
>> 74db6cc331b0 ("powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi
>> headers")
> 
> Ack. I'll have to rebase this series after -rc1 in any case. Right now I am
> hoping to collect some Acks.
> 
>>> +#include <asm/cputable.h>
>>> +#include <asm/feature-fixups.h>
>>> +
>>>    /* Macros for adjusting thread priority (hardware multi-threading) */
>>>    #ifdef CONFIG_PPC64
>>>    #define HMT_very_low()		asm volatile("or 31, 31, 31	# very low priority")
>>>
>>


Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>



