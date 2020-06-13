Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6D21F8471
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 19:30:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kl3X2g55zDqvx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jun 2020 03:30:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kl1d4WyBzDqll
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 03:28:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49kl1Q0G8Fz9tyVJ;
 Sat, 13 Jun 2020 19:28:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id V0taFgg7QO5z; Sat, 13 Jun 2020 19:28:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49kl1P50Mkz9tyVH;
 Sat, 13 Jun 2020 19:28:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EF0DE8B77C;
 Sat, 13 Jun 2020 19:28:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sBMC7z0GI5Bp; Sat, 13 Jun 2020 19:28:27 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D512F8B76A;
 Sat, 13 Jun 2020 19:28:26 +0200 (CEST)
Subject: Re: [PATCH] powerpc/fsl_booke/32: fix build with CONFIG_RANDOMIZE_BASE
To: Arseny Solokha <asolokha@kb.kras.ru>,
 Michael Ellerman <mpe@ellerman.id.au>, Jason Yan <yanaijie@huawei.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20200613162801.1946619-1-asolokha@kb.kras.ru>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <754d31be-730b-8f18-4ead-ba2f303650d0@csgroup.eu>
Date: Sat, 13 Jun 2020 19:28:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200613162801.1946619-1-asolokha@kb.kras.ru>
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
Cc: Scott Wood <oss@buserror.net>, Christophe Leroy <christophe.leroy@c-s.fr>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/06/2020 à 18:28, Arseny Solokha a écrit :
> Building the current 5.8 kernel for a e500 machine with
> CONFIG_RANDOMIZE_BASE set yields the following failure:
> 
>    arch/powerpc/mm/nohash/kaslr_booke.c: In function 'kaslr_early_init':
>    arch/powerpc/mm/nohash/kaslr_booke.c:387:2: error: implicit declaration
> of function 'flush_icache_range'; did you mean 'flush_tlb_range'?
> [-Werror=implicit-function-declaration]
> 
> Indeed, including asm/cacheflush.h into kaslr_booke.c fixes the build.
> 
> The issue dates back to the introduction of that file and probably went
> unnoticed because there's no in-tree defconfig with CONFIG_RANDOMIZE_BASE
> set.

I don't get this problem with mpc85xx_defconfig + RELOCATABLE + 
RANDOMIZE_BASE.

Christophe

> 
> Fixes: 2b0e86cc5de6 ("powerpc/fsl_booke/32: implement KASLR infrastructure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arseny Solokha <asolokha@kb.kras.ru>
> ---
>   arch/powerpc/mm/nohash/kaslr_booke.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
> index 4a75f2d9bf0e..bce0e5349978 100644
> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
> @@ -14,6 +14,7 @@
>   #include <linux/memblock.h>
>   #include <linux/libfdt.h>
>   #include <linux/crash_core.h>
> +#include <asm/cacheflush.h>
>   #include <asm/pgalloc.h>
>   #include <asm/prom.h>
>   #include <asm/kdump.h>
> 
