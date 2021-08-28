Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D90993FA4D6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 11:51:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GxX0Q6dCMz30J9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 19:51:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GxX005rGWz2xXr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 19:50:54 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GxWzv0V43z9sTv;
 Sat, 28 Aug 2021 11:50:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtAXDhkzp8-h; Sat, 28 Aug 2021 11:50:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GxWzt6XKCz9sT3;
 Sat, 28 Aug 2021 11:50:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E2E98B76D;
 Sat, 28 Aug 2021 11:50:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VOLFwdNtmT4s; Sat, 28 Aug 2021 11:50:49 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30B608B763;
 Sat, 28 Aug 2021 11:50:48 +0200 (CEST)
Subject: Re: [RFC PATCH 5/6] powerpc/microwatt: select POWER9_CPU
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210827163410.1177154-1-npiggin@gmail.com>
 <20210827163410.1177154-6-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ee10053e-f007-719a-9ab2-a14388c9af9d@csgroup.eu>
Date: Sat, 28 Aug 2021 11:50:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827163410.1177154-6-npiggin@gmail.com>
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
> Microwatt implements a subset of ISA v3.0 which is equivalent to
> the POWER9_CPU selection.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/configs/microwatt_defconfig | 1 +
>   arch/powerpc/platforms/microwatt/Kconfig | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
> index a08b739123da..bf5f2e5905eb 100644
> --- a/arch/powerpc/configs/microwatt_defconfig
> +++ b/arch/powerpc/configs/microwatt_defconfig
> @@ -14,6 +14,7 @@ CONFIG_EMBEDDED=y
>   # CONFIG_COMPAT_BRK is not set
>   # CONFIG_SLAB_MERGE_DEFAULT is not set
>   CONFIG_PPC64=y
> +CONFIG_POWER9_CPU=y

That shouldn't be needed in the defconfig because you select it below. You can use make 
savedefconfig to confirm.

>   # CONFIG_PPC_KUEP is not set
>   # CONFIG_PPC_KUAP is not set
>   CONFIG_CPU_LITTLE_ENDIAN=y
> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
> index 823192e9d38a..e0ff2cfc1ca0 100644
> --- a/arch/powerpc/platforms/microwatt/Kconfig
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -2,6 +2,7 @@
>   config PPC_MICROWATT
>   	depends on PPC_BOOK3S_64 && !SMP
>   	bool "Microwatt SoC platform"
> +	select POWER9_CPU
>   	select PPC_XICS
>   	select PPC_ICS_NATIVE
>   	select PPC_ICP_NATIVE
> 
