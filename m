Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB95B3ED083
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 10:46:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp7705CWgz3cWX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 18:46:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp76Z3h5yz2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 18:45:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gp76V3Dgfz9sVQ;
 Mon, 16 Aug 2021 10:45:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tdo6VlzkWydg; Mon, 16 Aug 2021 10:45:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gp76V2K3Dz9sVN;
 Mon, 16 Aug 2021 10:45:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 242BF8B78C;
 Mon, 16 Aug 2021 10:45:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tFFH6I_tQInB; Mon, 16 Aug 2021 10:45:54 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F2FD78B788;
 Mon, 16 Aug 2021 10:45:53 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc/config: Fix IPV6 warning in mpc855_ads
To: Joel Stanley <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
References: <20210816083126.2294522-1-joel@jms.id.au>
 <20210816083126.2294522-2-joel@jms.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cd657b46-f900-a573-8b00-0442a4584a51@csgroup.eu>
Date: Mon, 16 Aug 2021 10:45:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816083126.2294522-2-joel@jms.id.au>
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



Le 16/08/2021 à 10:31, Joel Stanley a écrit :
> When building this config there's a warning:
> 
>    79:warning: override: reassigning to symbol IPV6
> 
> Commit 9a1762a4a4ff ("powerpc/8xx: Update mpc885_ads_defconfig to
> improve CI") added CONFIG_IPV6=y, but left '# CONFIG_IPV6 is not set'
> in.
> 
> IPV6 is default y, so remove both to clean up the build.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/configs/mpc885_ads_defconfig | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
> index d21f266cea9a..5cd17adf903f 100644
> --- a/arch/powerpc/configs/mpc885_ads_defconfig
> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
> @@ -21,7 +21,6 @@ CONFIG_INET=y
>   CONFIG_IP_MULTICAST=y
>   CONFIG_IP_PNP=y
>   CONFIG_SYN_COOKIES=y
> -# CONFIG_IPV6 is not set
>   # CONFIG_FW_LOADER is not set
>   CONFIG_MTD=y
>   CONFIG_MTD_BLOCK=y
> @@ -76,7 +75,6 @@ CONFIG_PERF_EVENTS=y
>   CONFIG_MATH_EMULATION=y
>   CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
>   CONFIG_STRICT_KERNEL_RWX=y
> -CONFIG_IPV6=y
>   CONFIG_BPF_JIT=y
>   CONFIG_DEBUG_VM_PGTABLE=y
>   CONFIG_BDI_SWITCH=y
> 
