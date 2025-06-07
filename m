Return-Path: <linuxppc-dev+bounces-9184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A47AD0D9F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jun 2025 15:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bDzMV5CcRz2yqn;
	Sat,  7 Jun 2025 23:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749302438;
	cv=none; b=ZGI28I8KoZ/6HFl6xv5uy00pO6vimLWF9bTsqwnwjeq//aKrW6x5dyCWYcaxaDBT93Rxtee/SFZ9odD4cDSU7V8I2G2hh3jly5dngm0CsEvllKXwyXLB/B75cseIgg6s81rLK3ePaTI20do5EAuzfN5JCTEEyp+BWnGOJFVgp30jfDE0WtBisCBOg/C818UYq5u6XI4FE2DD5eqF0ZvoBNpkYUmCSppqtIrg5vIUCsreSArZ+vxq4ZBxpCmy3T4wNmG+h/rvR/u+X1oEMOrSghceMiJfpdB+bn25gRkKEm8YckVFma9kZN5E8OdtyzG6oZezcW/fwmhO4iDxdocwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749302438; c=relaxed/relaxed;
	bh=uLs/rggmbeGqICOw7rCsOOC/J9raFPYx/9tvPDKUnk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bb4edG5kfeFmRZH1yDiDs/3AZrphD+BKycJ7TiYinS2hq7D9nSsMbQR1UhjetH3bP/I4qUGenCXvjDHFHrbfZ/FnhvXm6D3d5Sk5C3bieqiNzEzenXoa5YYjQAd59/BeVBvbn5M4BhEvmEl+FvusH1BFuoX1vrjKzjSn/z1hBBedeqZzYEetJpoQTAU9NAMKt0aEA+kCO+HtUUriwKB9p2hGF97IjiBhHCMkoWiiWvnd+QKSoG2zN4vnKLMMlDTBMuI265CgvMsU8CxzV0xAOdL65cQ3s0+rzeiRRDzH4x9hyXU4sl/Vug+OGD1H0jObmAR6binBeYXPQ77bDTtvkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bDzMT53WMz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jun 2025 23:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bDxHn11l0z9sYQ;
	Sat,  7 Jun 2025 13:47:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jq2Gnj8iY67x; Sat,  7 Jun 2025 13:47:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bDxHm7448z9sXD;
	Sat,  7 Jun 2025 13:47:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E0D6A8B764;
	Sat,  7 Jun 2025 13:47:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xHP-SzKNoyYf; Sat,  7 Jun 2025 13:47:16 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7810E8B763;
	Sat,  7 Jun 2025 13:47:16 +0200 (CEST)
Message-ID: <6205828d-34ef-445d-8117-71a5269dc22f@csgroup.eu>
Date: Sat, 7 Jun 2025 13:47:15 +0200
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
Subject: Re: [PATCH] powerpc: unify two CONFIG_POWERPC64_CPU entries in the
 same choice block
To: Masahiro Yamada <masahiroy@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20250607102005.1965409-1-masahiroy@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250607102005.1965409-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 07/06/2025 à 12:13, Masahiro Yamada a écrit :
> There are two CONFIG_POWERPC64_CPU entries in the "CPU selection"
> choice block.
> 
> I guess the intent is to display a different prompt depending on
> CPU_LITTLE_ENDIAN: "Generic (POWER5 and PowerPC 970 and above)" for big
> endian, and "Generic (POWER8 and above)" for little endian.
> 
> I stumbled on this tricky use case, and worked around it on Kconfig with
> commit 4d46b5b623e0 ("kconfig: fix infinite loop in sym_calc_choice()").
> However, I doubt that supporting multiple entries with the same symbol
> in a choice block is worth the complexity - this is the only such case
> in the kernel tree.
> 
> This commit merges the two entries. Once this cleanup is accepted in
> the powerpc subsystem, I will proceed to refactor the Kconfig parser.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> 
>   arch/powerpc/platforms/Kconfig.cputype | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 613b383ed8b3..7b527d18aa5e 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -122,16 +122,11 @@ choice
>   	  If unsure, select Generic.
>   
>   config POWERPC64_CPU
> -	bool "Generic (POWER5 and PowerPC 970 and above)"
> -	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
> +	bool "Generic 64 bits powerpc"
> +	depends on PPC_BOOK3S_64
> +	select ARCH_HAS_FAST_MULTIPLIER if CPU_LITTLE_ENDIAN
>   	select PPC_64S_HASH_MMU
> -
> -config POWERPC64_CPU
> -	bool "Generic (POWER8 and above)"
> -	depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
> -	select ARCH_HAS_FAST_MULTIPLIER
> -	select PPC_64S_HASH_MMU
> -	select PPC_HAS_LBARX_LHARX
> +	select PPC_HAS_LBARX_LHARX if CPU_LITTLE_ENDIAN
>   
>   config POWERPC_CPU
>   	bool "Generic 32 bits powerpc"


