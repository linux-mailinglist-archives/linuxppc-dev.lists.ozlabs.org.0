Return-Path: <linuxppc-dev+bounces-4079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EB29F04C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 07:25:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8fTJ4jgpz30gL;
	Fri, 13 Dec 2024 17:25:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734071108;
	cv=none; b=TxpsqFuXCT0wHez67Mli25ELS60mE8D+BUX0NmOVxTB6jRCupyM186mv1JQfGtHDmw/BSkEDlWf3o621p+SGL8XiV1AMYY1B2+SJFMc2LuUyA9F0GGcSMgkUu9QYFjrt9vsUQKMEnOS21hsDEE2WR/pEmN5kLAju9EdKLBmpnFcBc+o+d817/ZsDtPl/GylSevGgpHvoJ2hK4e29sggZAf9KW/elpBmhHZMWuVgQvjOztuv/fPXh3n+/kg/TqxvhnVN7pu140E2FkyR+ycyR7+sX7o5djQMOUGibieunbv7116NNf4hxI4Hqyf/FzCN68iymV++y129NL46YmXOYjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734071108; c=relaxed/relaxed;
	bh=mZhbRPDOUh3PdwXnSeWyc6XdzD13YRZLnGueGiNU/YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZisGIiDEZXyFp4DF0vofA+gintaItpOSx1HPB7HQZXudL7CHyDBuq/FsRlGMzZr0zUS67XO5GAsNwcEQc5iSWufQgLPVZj8y8Rh9NIcm0E5ooD7gTucQuv+pkQ89kwVw7CeeQ1QykAVWDIo9kFev9akXET4VVQQlTVPiTlXQRCJ/vZfnscXWYNFJqHPKcH2ngyVGOYiaBbApC7Yh2cXq99FO3XkFhurUnRNZdB0PiBuHKvWKdirA6Ax7NhuLtl3cHG5Bn/Rls9xPJnLSM63GnyajRCd8He6ZpqVww+AVyIlOMFpK6zzoP8TdI2qL8R/EGmrsU/3/GU8U7e3pSCW2gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8fTH0PLWz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 17:25:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y8fTB6fpSz9str;
	Fri, 13 Dec 2024 07:25:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDOGWM-FGhTz; Fri, 13 Dec 2024 07:25:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8fTB5dPqz9stm;
	Fri, 13 Dec 2024 07:25:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ACB7C8B773;
	Fri, 13 Dec 2024 07:25:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FXHjhDgv36wk; Fri, 13 Dec 2024 07:25:02 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A60F8B763;
	Fri, 13 Dec 2024 07:25:01 +0100 (CET)
Message-ID: <1f1beb34-65cc-4038-a8b2-de8af3e0703e@csgroup.eu>
Date: Fri, 13 Dec 2024 07:25:01 +0100
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
Subject: Re: [RFC 2/5] powerpc: kvm: drop 32-bit booke
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 kvm@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-3-arnd@kernel.org>
 <3589ad69-13df-40f1-88c2-55d39790bbac@csgroup.eu>
 <1633f30e-d885-4f31-a14d-11881e16deb9@app.fastmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1633f30e-d885-4f31-a14d-11881e16deb9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 12/12/2024 à 22:08, Arnd Bergmann a écrit :
> On Thu, Dec 12, 2024, at 19:35, Christophe Leroy wrote:
>> Le 12/12/2024 à 13:55, Arnd Bergmann a écrit :
>>> From: Arnd Bergmann <arnd@arndb.de>
> 
>>>
>>> Support for 64-bit hosts remains unchanged, for both 32-bit and
>>> 64-bit guests.
>>>
> 
>>>    arch/powerpc/include/asm/kvm_book3s_32.h    |  36 --
>>>    arch/powerpc/include/asm/kvm_booke.h        |   4 -
>>>    arch/powerpc/include/asm/kvm_booke_hv_asm.h |   2 -
>>>    arch/powerpc/kvm/Kconfig                    |  22 +-
>>>    arch/powerpc/kvm/Makefile                   |  15 -
>>>    arch/powerpc/kvm/book3s_32_mmu_host.c       | 396 --------------
>>>    arch/powerpc/kvm/booke.c                    | 268 ----------
>>>    arch/powerpc/kvm/booke.h                    |   8 -
>>>    arch/powerpc/kvm/booke_emulate.c            |  44 --
>>>    arch/powerpc/kvm/booke_interrupts.S         | 535 -------------------
>>>    arch/powerpc/kvm/bookehv_interrupts.S       | 102 ----
>>>    arch/powerpc/kvm/e500.c                     | 553 --------------------
>>>    arch/powerpc/kvm/e500.h                     |  40 --
>>>    arch/powerpc/kvm/e500_emulate.c             | 100 ----
>>>    arch/powerpc/kvm/e500_mmu_host.c            |  54 --
>>>    arch/powerpc/kvm/e500mc.c                   |   5 +-
>>>    arch/powerpc/kvm/trace_booke.h              |  14 -
>>>    17 files changed, 4 insertions(+), 2194 deletions(-)
>>>    delete mode 100644 arch/powerpc/include/asm/kvm_book3s_32.h
>>>    delete mode 100644 arch/powerpc/kvm/book3s_32_mmu_host.c
>>>    delete mode 100644 arch/powerpc/kvm/booke_interrupts.S
>>>    delete mode 100644 arch/powerpc/kvm/e500.c
>>
>> Left over ?
>>
>> arch/powerpc/kernel/head_booke.h:#include <asm/kvm_asm.h>
>> arch/powerpc/kernel/head_booke.h:#include <asm/kvm_booke_hv_asm.h>
>> arch/powerpc/kernel/head_booke.h:       b
>> kvmppc_handler_\intno\()_\srr1
> 
> As far as I can tell, these are still needed for e5500/e6500,
> but you know more about the platform than I do.

$ git grep kvmppc_handler_ arch/powerpc/
arch/powerpc/kvm/bookehv_interrupts.S: 
_GLOBAL(kvmppc_handler_\intno\()_\srr1)

In your patch you remove the include of head_booke.h from there:

diff --git a/arch/powerpc/kvm/bookehv_interrupts.S 
b/arch/powerpc/kvm/bookehv_interrupts.S
index 8b4a402217ba..c75350fc449e 100644
--- a/arch/powerpc/kvm/bookehv_interrupts.S
+++ b/arch/powerpc/kvm/bookehv_interrupts.S
@@ -18,13 +18,9 @@
  #include <asm/asm-offsets.h>
  #include <asm/bitsperlong.h>

-#ifdef CONFIG_64BIT
  #include <asm/exception-64e.h>
  #include <asm/hw_irq.h>
  #include <asm/irqflags.h>
-#else
-#include "../kernel/head_booke.h" /* for THREAD_NORMSAVE() */
-#endif

  #define LONGBYTES		(BITS_PER_LONG / 8)

$ git grep head_booke.h
arch/powerpc/kernel/asm-offsets.c:#include "head_booke.h"
arch/powerpc/kernel/head_44x.S:#include "head_booke.h"
arch/powerpc/kernel/head_85xx.S:#include "head_booke.h"

$ git grep head_85xx.o
arch/powerpc/kernel/Makefile:obj-$(CONFIG_PPC_85xx)             += 
head_85xx.o

CONFIG_PPC_85xx depends on CONFIG_PPC32.

CONFIG_E5500_CPU and CONFIG_E6500_CPU both depend on CONFIG_PPC64.

So yes it is used on e5500/e6500 but only when they run a 32 bits kernel 
built with CONFIG_PPC_85xx. Isn't it what you want to get rid of with 
this patch ?

Am I missing something ?

Christophe

