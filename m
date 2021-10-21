Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C346A435A76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 07:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZc262byVz30Pj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 16:47:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZc1j0KfZz2xYK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 16:47:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HZc1d2c7Vz9sSQ;
 Thu, 21 Oct 2021 07:47:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJjskiyEUwr8; Thu, 21 Oct 2021 07:47:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HZc1d1rJmz9sSN;
 Thu, 21 Oct 2021 07:47:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2ABCA8B80E;
 Thu, 21 Oct 2021 07:47:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CjmpJj7-h3iE; Thu, 21 Oct 2021 07:47:01 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.154])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DBC5D8B764;
 Thu, 21 Oct 2021 07:47:00 +0200 (CEST)
Subject: Re: [PATCH v2 16/16] powerpc/microwatt: Don't select the hash MMU code
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021035417.2157804-1-npiggin@gmail.com>
 <20211021035417.2157804-17-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <12681c2b-2648-9e12-40ff-013d85ec6d00@csgroup.eu>
Date: Thu, 21 Oct 2021 07:47:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211021035417.2157804-17-npiggin@gmail.com>
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



Le 21/10/2021 à 05:54, Nicholas Piggin a écrit :
> Microwatt is radix-only, so it does not require hash MMU support.


Patches 15 and 16 could be squashed into a single patch, say Microwatt 
is a radix-only POWER9.

> 
> This saves 20kB compressed dtbImage and 56kB vmlinux size.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/configs/microwatt_defconfig | 1 -
>   arch/powerpc/platforms/microwatt/Kconfig | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
> index 6e62966730d3..7c8eb29d8afe 100644
> --- a/arch/powerpc/configs/microwatt_defconfig
> +++ b/arch/powerpc/configs/microwatt_defconfig
> @@ -27,7 +27,6 @@ CONFIG_PPC_MICROWATT=y
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
