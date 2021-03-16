Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8F33CE33
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 07:58:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F03yg1WxMz302p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 17:58:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F03yK6dCmz302X
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 17:57:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F03yC1wWpz9v01q;
 Tue, 16 Mar 2021 07:57:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dAvZpDnyIIEM; Tue, 16 Mar 2021 07:57:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F03yC0bC2z9v01p;
 Tue, 16 Mar 2021 07:57:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C604A8B77F;
 Tue, 16 Mar 2021 07:57:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9y2Jva0TRQda; Tue, 16 Mar 2021 07:57:39 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 061878B766;
 Tue, 16 Mar 2021 07:57:38 +0100 (CET)
Subject: Re: [PATCH] powerpc: arch/powerpc/kernel/setup_64.c - cleanup warnings
To: He Ying <heying24@huawei.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 dja@axtens.net, akpm@linux-foundation.org, aneesh.kumar@linux.ibm.com,
 rppt@kernel.org, ardb@kernel.org, clg@kaod.org
References: <20210316041148.29694-1-heying24@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ae9d758b-d62c-ed60-75e7-2917187d976b@csgroup.eu>
Date: Tue, 16 Mar 2021 07:57:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316041148.29694-1-heying24@huawei.com>
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/03/2021 à 05:11, He Ying a écrit :
> warning: symbol 'rfi_flush' was not declared.
> warning: symbol 'entry_flush' was not declared.
> warning: symbol 'uaccess_flush' was not declared.
> We found warnings above in arch/powerpc/kernel/setup_64.c by using
> sparse tool.
> 
> Define 'entry_flush' and 'uaccess_flush' as static because they are not
> referenced outside the file. Include asm/security_features.h in which
> 'rfi_flush' is declared.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/kernel/setup_64.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 560ed8b975e7..f92d72a7e7ce 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -68,6 +68,7 @@
>   #include <asm/early_ioremap.h>
>   #include <asm/pgalloc.h>
>   #include <asm/asm-prototypes.h>
> +#include <asm/security_features.h>
>   
>   #include "setup.h"
>   
> @@ -949,8 +950,8 @@ static bool no_rfi_flush;
>   static bool no_entry_flush;
>   static bool no_uaccess_flush;
>   bool rfi_flush;
> -bool entry_flush;
> -bool uaccess_flush;
> +static bool entry_flush;
> +static bool uaccess_flush;
>   DEFINE_STATIC_KEY_FALSE(uaccess_flush_key);
>   EXPORT_SYMBOL(uaccess_flush_key);
>   
> 
