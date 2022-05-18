Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA82B52B869
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 13:19:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L39W44dzNz3cJK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 21:19:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kc6++Pc9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L39VS031Hz3bb0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 21:19:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kc6++Pc9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L39VN1yvhz4xVP;
 Wed, 18 May 2022 21:19:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652872748;
 bh=INuX9O1IpEtUTzC6kCGyh8Jm7VeQJzuBU2ZaIDDAs2k=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kc6++Pc9tP7sM3sl1kuk5x93XTnxicRThAJ3MYfhJjEWMWVLUZFDyk+OP6WEc7kx4
 QD6A5s6ZYg6SoMxfgCUqkWqrXocW8WENiso45OYN8wRfMQPubEDIhxE5MRRyKVmnS7
 +fdUQzjR0U50KVu6Y2HPcvBt3/bGhNyLOdzas6wRM4BwFGTJIfdCU2blUo4SWLOTZu
 4rcQ1Jv664j0G2aFXMdhBCJET5jTH8UbFYQbbE8ghpSYg1taxZFt9o3Um6H4EDYyLT
 DclLaYMy9K08TAMbIM+lFMqzYnFSLGx5Hc8YzEH7fhGmJbCXzrRjKZm7gItKDun6Of
 ZOZ8HWVbNX+dQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
In-Reply-To: <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
 <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe.leroy@csgroup.eu>
 <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
Date: Wed, 18 May 2022 21:19:06 +1000
Message-ID: <87leuznl5h.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> Christophe Leroy wrote:
>> A lot of #ifdefs can be replaced by IS_ENABLED()
>> 
>> Do so.
>> 
>> This requires to have kernel_toc_addr() defined at all time
>> as well as PPC_INST_LD_TOC and PPC_INST_STD_LR.
>> 
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v2: Moved the setup of pop outside of the big if()/else() in __ftrace_make_nop()
>> ---
>>  arch/powerpc/include/asm/code-patching.h |   2 -
>>  arch/powerpc/include/asm/module.h        |   2 -
>>  arch/powerpc/include/asm/sections.h      |  24 +--
>>  arch/powerpc/kernel/trace/ftrace.c       | 182 +++++++++++------------
>>  4 files changed, 103 insertions(+), 107 deletions(-)
>> 
>
> <snip>
>
>> @@ -710,6 +707,9 @@ void arch_ftrace_update_code(int command)
>> 
>>  #ifdef CONFIG_PPC64
>>  #define PACATOC offsetof(struct paca_struct, kernel_toc)
>> +#else
>> +#define PACATOC 0
>> +#endif
>
> This conflicts with my fix for the ftrace init tramp:
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220516071422.463738-1-naveen.n.rao@linux.vnet.ibm.com/
>
> It probably makes sense to retain #ifdef CONFIG_PPC64, so that we can 
> get rid of the PACATOC. Here is an incremental diff:

Where is the incremental diff meant to apply?

It doesn't apply on top of patch 19, or at the end of the series.

cheers

> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index da1a2f8ebb72f3..28169a1ccc7377 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -701,11 +701,6 @@ void arch_ftrace_update_code(int command)
>  }
>  
>  #ifdef CONFIG_PPC64
> -#define PACATOC offsetof(struct paca_struct, kernel_toc)
> -#else
> -#define PACATOC 0
> -#endif
> -
>  extern unsigned int ftrace_tramp_text[], ftrace_tramp_init[];
>  
>  void ftrace_free_init_tramp(void)
> @@ -724,7 +719,7 @@ int __init ftrace_dyn_arch_init(void)
>  	int i;
>  	unsigned int *tramp[] = { ftrace_tramp_text, ftrace_tramp_init };
>  	u32 stub_insns[] = {
> -		PPC_RAW_LD(_R12, _R13, PACATOC),
> +		PPC_RAW_LD(_R12, _R13, offsetof(struct paca_struct, kernel_toc)),
>  		PPC_RAW_ADDIS(_R12, _R12, 0),
>  		PPC_RAW_ADDI(_R12, _R12, 0),
>  		PPC_RAW_MTCTR(_R12),
> @@ -733,9 +728,6 @@ int __init ftrace_dyn_arch_init(void)
>  	unsigned long addr;
>  	long reladdr;
>  
> -	if (IS_ENABLED(CONFIG_PPC32))
> -		return 0;
> -
>  	addr = ppc_global_function_entry((void *)FTRACE_REGS_ADDR);
>  	reladdr = addr - kernel_toc_addr();
>  
> @@ -754,6 +746,7 @@ int __init ftrace_dyn_arch_init(void)
>  
>  	return 0;
>  }
> +#endif
>  
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>  
>
> - Naveen
