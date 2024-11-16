Return-Path: <linuxppc-dev+bounces-3334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2469CFFCF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 17:15:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrJsC0Sqcz2yks;
	Sun, 17 Nov 2024 03:15:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731773742;
	cv=none; b=L0WYxJSWlkPybDCgm7onrVOZmNueJW53Sdl+uWQYB/TtJZQXKhdz3SZXDTNVKT4SpJcvi3WYgkkhNntu0dCZ3SAym/tX3Gw7an1FaQEg+GcAQ9PVgsXgVOZ1EtsdP0dD2Nh/ZPCgb1TfK90f9Jb7w1RQ/tGQbLIPeF+qG6+hB7ETKduD21HwwRYL3OgR7psfawuvwzMzA38sanMZnSFQ0wW1cN5xlFknwBj/mkA6fGZICBnS4Gmi1DEISeCAMkr3zMrxIaB4yeONYwz1xHyIxOz/6WPH+DhLFhBh34mP5yJRAiYS6qoJLSwa8UpQyYKMRhsE9daNrOyfR27RPfppiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731773742; c=relaxed/relaxed;
	bh=HAtJzhvM34kdUIkGx47WxCWQkJrGsZ9+65VE8r6Nt1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Me+jMtyDuM2cEjTEO+srlzBVEFY+2uAYMokHCa4hawiJt1v1NIdvgZRXpKRz76ID5heoN+ngq9LY2dM5tWljNIqLsnmuAse5wALX562aeAdMEXRwd5+LkuvDxaZdg03PnkKc7NkcB/h8E7bEotZ20OwIVdvDuIA2qHcxcCS1n/BCkWHjoqIqg7ISPOV/hE+Zy/TCS3/ZfyFUhBwVd0lgzju1FBBKy5DAJ21rf59Ifw6zHxXN502nxOoGDD5eiP6mNOtoHnnI3Yjg0XKi8g/uwsjnOC3pT8O8G5zb1yoJTo6fG2qn7aCZmjob3fqmbh26DjKFBgV+Btu8ULcsnXwjOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrJsB07RQz2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 03:15:41 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XrJs670Ghz9sSN;
	Sat, 16 Nov 2024 17:15:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RDniS05mwtFq; Sat, 16 Nov 2024 17:15:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XrJs662Y9z9sSL;
	Sat, 16 Nov 2024 17:15:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BC2638B7A0;
	Sat, 16 Nov 2024 17:15:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0gGIiKiV87Hr; Sat, 16 Nov 2024 17:15:38 +0100 (CET)
Received: from [192.168.232.159] (POS169858.IDSI0.si.c-s.fr [192.168.232.159])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F5258B763;
	Sat, 16 Nov 2024 17:15:38 +0100 (CET)
Message-ID: <c00a229c-9ced-4a28-9666-b4707f317c90@csgroup.eu>
Date: Sat, 16 Nov 2024 17:15:38 +0100
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
Subject: Re: [RFC PATCH 02/10] powerpc/chrp: Remove various dead code
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, geert@linux-m68k.org, arnd@arndb.de
References: <20241114131114.602234-1-mpe@ellerman.id.au>
 <20241114131114.602234-2-mpe@ellerman.id.au>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241114131114.602234-2-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 14/11/2024 à 14:11, Michael Ellerman a écrit :
> Remove various bits of code that are dead now that PPC_CHRP has been
> removed.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   arch/powerpc/Kconfig                 |  5 +--
>   arch/powerpc/boot/Makefile           |  1 -
>   arch/powerpc/include/asm/processor.h |  6 ---
>   arch/powerpc/kernel/head_book3s_32.S | 12 ------
>   arch/powerpc/kernel/pci_32.c         |  2 +-
>   arch/powerpc/kernel/prom_init.c      | 56 ----------------------------
>   6 files changed, 3 insertions(+), 79 deletions(-)
> 

> diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
> index cb2bca76be53..c6e297fd36e2 100644
> --- a/arch/powerpc/kernel/head_book3s_32.S
> +++ b/arch/powerpc/kernel/head_book3s_32.S
> @@ -256,20 +256,8 @@ __secondary_hold_acknowledge:
>    */
>   	START_EXCEPTION(INTERRUPT_MACHINE_CHECK, MachineCheck)
>   	EXCEPTION_PROLOG_0
> -#ifdef CONFIG_PPC_CHRP
> -	mtspr	SPRN_SPRG_SCRATCH2,r1
> -	mfspr	r1, SPRN_SPRG_THREAD
> -	lwz	r1, RTAS_SP(r1)
> -	cmpwi	cr1, r1, 0
> -	bne	cr1, 7f
> -	mfspr	r1, SPRN_SPRG_SCRATCH2
> -#endif /* CONFIG_PPC_CHRP */
>   	EXCEPTION_PROLOG_1
>   7:	EXCEPTION_PROLOG_2 0x200 MachineCheck
> -#ifdef CONFIG_PPC_CHRP
> -	beq	cr1, 1f
> -	twi	31, 0, 0
> -#endif
>   1:	prepare_transfer_to_handler
>   	bl	machine_check_exception
>   	b	interrupt_return

Then it becomes a standard exception handler that can be set up with

	EXCEPTION(INTERRUPT_MACHINE_CHECK, MachineCheck, machine_check_exception)

And the comment from paulus voids.


