Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD6A3FA4E5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 11:54:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GxX4d1rVxz2yLN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 19:54:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GxX4C4S8Pz2xXr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 19:54:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GxX486Bwzz9sTv;
 Sat, 28 Aug 2021 11:54:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2VuXnp9NkVqc; Sat, 28 Aug 2021 11:54:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GxX4850gnz9sT3;
 Sat, 28 Aug 2021 11:54:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 740088B76D;
 Sat, 28 Aug 2021 11:54:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6G7kd7AnqMyb; Sat, 28 Aug 2021 11:54:32 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C4CE18B763;
 Sat, 28 Aug 2021 11:54:31 +0200 (CEST)
Subject: Re: [RFC PATCH 6/6] powerpc/microwatt: Stop building the hash MMU code
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210827163410.1177154-1-npiggin@gmail.com>
 <20210827163410.1177154-7-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1d1484fe-70db-bafc-016f-29671e941bc8@csgroup.eu>
Date: Sat, 28 Aug 2021 11:54:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827163410.1177154-7-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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



Le 27/08/2021 à 18:34, Nicholas Piggin a écrit :
> Microwatt is radix-only, so stop selecting the hash MMU code.
> 
> This saves 20kB compressed dtbImage and 56kB vmlinux size.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/configs/microwatt_defconfig | 1 -
>   arch/powerpc/platforms/Kconfig.cputype   | 1 +
>   arch/powerpc/platforms/microwatt/Kconfig | 1 -
>   3 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
> index bf5f2e5905eb..6fbad42f9e3d 100644
> --- a/arch/powerpc/configs/microwatt_defconfig
> +++ b/arch/powerpc/configs/microwatt_defconfig
> @@ -26,7 +26,6 @@ CONFIG_PPC_MICROWATT=y
>   # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
>   CONFIG_CPU_FREQ=y
>   CONFIG_HZ_100=y
> -# CONFIG_PPC_MEM_KEYS is not set
>   # CONFIG_SECCOMP is not set
>   # CONFIG_MQ_IOSCHED_KYBER is not set
>   # CONFIG_COREDUMP is not set
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 9b90fc501ed4..b9acd6c68c81 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -371,6 +371,7 @@ config SPE
>   config PPC_64S_HASH_MMU
>   	bool "Hash MMU Support"
>   	depends on PPC_BOOK3S_64
> +	depends on !PPC_MICROWATT

Do we really want to start nit picking which platforms can select such or such option ?
Isn't it enough to get it off through the defconfig ?

Is PPC_MICROWATT mutually exclusive with other book3s64 configs ? Don't we build multiplatform kernels ?

>   	default y
>   	select PPC_MM_SLICES
>   	help
> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
> index e0ff2cfc1ca0..4f0ce292a6ce 100644
> --- a/arch/powerpc/platforms/microwatt/Kconfig
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -6,7 +6,6 @@ config PPC_MICROWATT
>   	select PPC_XICS
>   	select PPC_ICS_NATIVE
>   	select PPC_ICP_NATIVE
> -	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
>   	select PPC_UDBG_16550
>   	select ARCH_RANDOM
>   	help
> 
