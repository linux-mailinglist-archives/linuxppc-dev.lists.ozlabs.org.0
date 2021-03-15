Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5750933B25F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 13:18:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzb6G2kZHz304f
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:17:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzb5w5CRVz2y8C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 23:17:37 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dzb5j0WFqz9tyRZ;
 Mon, 15 Mar 2021 13:17:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id roeoR0w2M_NV; Mon, 15 Mar 2021 13:17:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dzb5h6fF5z9tyRY;
 Mon, 15 Mar 2021 13:17:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1985B8B775;
 Mon, 15 Mar 2021 13:17:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Q0ACiGQXfhWT; Mon, 15 Mar 2021 13:17:34 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC7958B75B;
 Mon, 15 Mar 2021 13:17:33 +0100 (CET)
Subject: Re: [PATCH] powerpc: Fix missing prototype problems for
 "arch/powerpc/kernel/setup_64.c"
To: He Ying <heying24@huawei.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 dja@axtens.net, akpm@linux-foundation.org, rppt@kernel.org,
 aneesh.kumar@linux.ibm.com, clg@kaod.org
References: <20210315120444.215905-1-heying24@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6eb1925c-a3a1-f062-29da-3a7fa946505c@csgroup.eu>
Date: Mon, 15 Mar 2021 13:17:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315120444.215905-1-heying24@huawei.com>
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

You subject doesn't match the content of the patch.

Le 15/03/2021 à 13:04, He Ying a écrit :
> The variables 'uaccess_fulsh' and 'entry_flush' are not referenced
> outside the file. So define them as static to avoid the warnings.
> 
> And add a prototype for the function 'panic_smp_self_stop' for the
> same purpose.
> 
> Sparse also warns that 'rfi_flush' should be static. However, it's
> referenced outside the file.

To clear that warning, you have to include asm/security_features.h, rfi_flush is declared there.

> 
> The warnings about the file reported by sparse are as follows:
> arch/powerpc/kernel/setup_64.c:422:6: warning: symbol 'panic_smp_self_stop' was not declared. Should it be static?
> arch/powerpc/kernel/setup_64.c:951:6: warning: symbol 'rfi_flush' was not declared. Should it be static?
> arch/powerpc/kernel/setup_64.c:952:6: warning: symbol 'entry_flush' was not declared. Should it be static?
> arch/powerpc/kernel/setup_64.c:953:6: warning: symbol 'uaccess_flush' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
>   arch/powerpc/kernel/setup_64.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 560ed8b975e7..603aacd8527b 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -71,6 +71,8 @@
>   
>   #include "setup.h"
>   
> +extern void panic_smp_self_stop(void);
> +

For function prototypes 'extern' is unneeded and deprecated.

And function prototypes should go in an header file.

panic_smp_self_stop() is called from kernel/panic.c , it should be declared in one of the generic 
linux header files I think.

>   int spinning_secondaries;
>   u64 ppc64_pft_size;
>   
> @@ -949,8 +951,8 @@ static bool no_rfi_flush;
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
