Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 575BC437297
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:19:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbG1g5bSDz3bfx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 18:19:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbG1F2g6Fz3002
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 18:18:57 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HbG196x2nz9sSV;
 Fri, 22 Oct 2021 09:18:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Jq280f1_Q_G; Fri, 22 Oct 2021 09:18:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HbG195zWsz9sST;
 Fri, 22 Oct 2021 09:18:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B716D8B816;
 Fri, 22 Oct 2021 09:18:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NER7mV9ORYEU; Fri, 22 Oct 2021 09:18:53 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.57])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 773798B764;
 Fri, 22 Oct 2021 09:18:53 +0200 (CEST)
Subject: Re: [PATCH v3 18/18] powerpc/microwatt: Don't select the hash MMU code
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021223013.2641952-1-npiggin@gmail.com>
 <20211021223013.2641952-19-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <85899425-a0cb-7163-7c9c-5ed39a64f8c1@csgroup.eu>
Date: Fri, 22 Oct 2021 09:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211021223013.2641952-19-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/10/2021 à 00:30, Nicholas Piggin a écrit :
> Microwatt is radix-only, so it does not require hash MMU support.
> 
> This saves 20kB compressed dtbImage and 56kB vmlinux size.

I think patch 17 and 18 should be squashed together.

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/configs/microwatt_defconfig | 2 +-
>   arch/powerpc/platforms/microwatt/Kconfig | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
> index 6e62966730d3..de1dcff05734 100644
> --- a/arch/powerpc/configs/microwatt_defconfig
> +++ b/arch/powerpc/configs/microwatt_defconfig
> @@ -16,6 +16,7 @@ CONFIG_EMBEDDED=y
>   # CONFIG_SLAB_MERGE_DEFAULT is not set
>   CONFIG_PPC64=y
>   CONFIG_POWER9_CPU=y
> +# CONFIG_PPC_64S_HASH_MMU is not set
>   # CONFIG_PPC_KUEP is not set
>   # CONFIG_PPC_KUAP is not set
>   CONFIG_CPU_LITTLE_ENDIAN=y
> @@ -27,7 +28,6 @@ CONFIG_PPC_MICROWATT=y
>   # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
>   CONFIG_CPU_FREQ=y
>   CONFIG_HZ_100=y
> -# CONFIG_PPC_MEM_KEYS is not set
>   # CONFIG_SECCOMP is not set
>   # CONFIG_MQ_IOSCHED_KYBER is not set
>   # CONFIG_COREDUMP is not set
> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
> index 823192e9d38a..5e320f49583a 100644
> --- a/arch/powerpc/platforms/microwatt/Kconfig
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -5,7 +5,6 @@ config PPC_MICROWATT
>   	select PPC_XICS
>   	select PPC_ICS_NATIVE
>   	select PPC_ICP_NATIVE
> -	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
>   	select PPC_UDBG_16550
>   	select ARCH_RANDOM
>   	help
> 
