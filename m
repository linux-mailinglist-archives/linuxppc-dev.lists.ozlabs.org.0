Return-Path: <linuxppc-dev+bounces-1373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4C5978F44
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 10:55:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5Q4S50x2z2yHj;
	Sat, 14 Sep 2024 18:55:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726304136;
	cv=none; b=Wz3WbMCAm8GlG9aqTyEGuEf2EObjsYAzx+z80pc0ugzlGbFuDOdRxIblbESisSyc0LOOf6zRjmXPNHQvM/K8PqrN/wcbjKg9xJZnF7nrzWtfr9lyTM+tNy9dHui1u15nItbbYTab0X5DNxmOwYIxj32FB37ejahoTQuDfqUwfa+yqKzyzLk7bGPloA22Nrha6YnzrF6FBWW/mrjimpsFplR34noV0TBzX+UJixCYI6UO307yWHAPRBXn2Xi+zVugBB9hoSY+ijGwhYSEU3lMQOoobbf7+jMdd3uHsME23khJfELDdEpMaDFm/X02Qnbyn+fB+gngLPPnaPSCJVNB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726304136; c=relaxed/relaxed;
	bh=bhN/XrjebWMKB6qSo/PQo5GvT9Vm7fpIVm2ekccQmSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ORPGO/C3w/ID/pJyqS8QYNFKJk/c57/qEuoFuXK7srsW8EKBFJbSDPCUoScZ08wJzpkYecPzPZYL6hcag7iPWwpv1Mva6hgCEDVJDh8ugAlAdrdzWxS2BBs33Sv1mUFryiz6y6+mbKuuAMN/njqkRiujrHV1I4PT5T1iko0B8HbxkJnT4UgLqlUGJ86kWlFQRrGZ7LWlXclmtbUnGs0Fg3RSLGQSIIq5BBXBkP26Dr/mD7LLQx0Y/HCIdZ9Uten5kEsr8QaxaLYsz9wQeHGq7G3Ce+Yr7d0iGys+nqUsQKNDsFjQHM6LZ9aJg+HWy3qDBonfNtB6IQ7XsR/jp8uyOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5Q4S2cyKz2y8F
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 18:55:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X5Q4M5yyWz9sxD;
	Sat, 14 Sep 2024 10:55:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_N8AC9snYEy; Sat, 14 Sep 2024 10:55:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X5Q4M4vznz9sxC;
	Sat, 14 Sep 2024 10:55:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 91D078B764;
	Sat, 14 Sep 2024 10:55:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tYHQT-gWUP4W; Sat, 14 Sep 2024 10:55:31 +0200 (CEST)
Received: from [192.168.233.150] (PO20379.IDSI0.si.c-s.fr [192.168.233.150])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DF0AB8B763;
	Sat, 14 Sep 2024 10:55:30 +0200 (CEST)
Message-ID: <498e7990-2c81-4779-83e6-1ff072796dbd@csgroup.eu>
Date: Sat, 14 Sep 2024 10:55:30 +0200
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
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
To: Michael Ellerman <mpe@ellerman.id.au>,
 Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Matthew Wilcox <willy@infradead.org>
References: <20240913213351.3537411-1-almasrymina@google.com>
 <87jzffq9ge.fsf@mail.lhotse>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87jzffq9ge.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 14/09/2024 à 04:02, Michael Ellerman a écrit :
> Mina Almasry <almasrymina@google.com> writes:
>> Building net-next with powerpc with GCC 14 compiler results in this
>> build error:
>>
>> /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
>> /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
>> not a multiple of 4)
>> make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
>> net/core/page_pool.o] Error 1
>>
>> Root caused in this thread:
>> https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com/
> 
> Sorry I'm late to this, the original report wasn't Cc'ed to linuxppc-dev :D
> 
> I think this is a bug in the arch/powerpc inline asm constraints.
> 
> Can you try the patch below, it fixes the build error for me.
> 
> I'll run it through some boot tests and turn it into a proper patch over
> the weekend.
> 
> cheers
> 
> 
> diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
> index 5bf6a4d49268..0e41c1da82dd 100644
> --- a/arch/powerpc/include/asm/atomic.h
> +++ b/arch/powerpc/include/asm/atomic.h
> @@ -23,6 +23,12 @@
>   #define __atomic_release_fence()					\
>   	__asm__ __volatile__(PPC_RELEASE_BARRIER "" : : : "memory")
>   
> +#ifdef CONFIG_CC_IS_CLANG
> +#define DS_FORM_CONSTRAINT "Z<>"
> +#else
> +#define DS_FORM_CONSTRAINT "YZ<>"
> +#endif

I see we have the same in uaccess.h, added by commit 2d43cc701b96 
("powerpc/uaccess: Fix build errors seen with GCC 13/14")

Should that go in a common header, maybe ppc_asm.h ?

> +
>   static __inline__ int arch_atomic_read(const atomic_t *v)
>   {
>   	int t;
> @@ -197,7 +203,7 @@ static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
>   	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
>   		__asm__ __volatile__("ld %0,0(%1)" : "=r"(t) : "b"(&v->counter));
>   	else
> -		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
> +		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : DS_FORM_CONSTRAINT (v->counter));
>   
>   	return t;
>   }
> @@ -208,7 +214,7 @@ static __inline__ void arch_atomic64_set(atomic64_t *v, s64 i)
>   	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
>   		__asm__ __volatile__("std %1,0(%2)" : "=m"(v->counter) : "r"(i), "b"(&v->counter));
>   	else
> -		__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
> +		__asm__ __volatile__("std%U0%X0 %1,%0" : "=" DS_FORM_CONSTRAINT (v->counter) : "r"(i));
>   }
>   
>   #define ATOMIC64_OP(op, asm_op)						\
> 

