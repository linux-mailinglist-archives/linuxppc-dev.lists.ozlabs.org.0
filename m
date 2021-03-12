Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBDA338E6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 14:12:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxmSv2rH5z3fXQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 00:12:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxmSb0n7Nz3dHC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Mar 2021 00:12:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DxmSV0l1Cz9ttBZ;
 Fri, 12 Mar 2021 14:12:26 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dbspsLRag-9D; Fri, 12 Mar 2021 14:12:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DxmST7393z9ttBX;
 Fri, 12 Mar 2021 14:12:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CB1478B814;
 Fri, 12 Mar 2021 14:12:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hkgekSXdy3BK; Fri, 12 Mar 2021 14:12:26 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BFCA8B764;
 Fri, 12 Mar 2021 14:12:26 +0100 (CET)
Subject: Re: [PATCH] powerpc: Force inlining of cpu_has_feature() to avoid
 build failure
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <b231dfa040ce4cc37f702f5c3a595fdeabfe0462.1615378209.git.christophe.leroy@csgroup.eu>
Message-ID: <c3563256-7cde-3a42-dbf0-6ce31141ad30@csgroup.eu>
Date: Fri, 12 Mar 2021 14:12:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b231dfa040ce4cc37f702f5c3a595fdeabfe0462.1615378209.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/03/2021 à 13:10, Christophe Leroy a écrit :
> The code relies on constant folding of cpu_has_feature() based
> on possible and always true values as defined per
> CPU_FTRS_ALWAYS and CPU_FTRS_POSSIBLE.
> 
> Build failure is encountered with for instance
> book3e_all_defconfig on kisskb in the AMDGPU driver which uses
> cpu_has_feature(CPU_FTR_VSX_COMP) to decide whether calling
> kernel_enable_vsx() or not.
> 
> The failure is due to cpu_has_feature() not being inlined with
> that configuration with gcc 4.9.
> 
> In the same way as commit acdad8fb4a15 ("powerpc: Force inlining of
> mmu_has_feature to fix build failure"), for inlining of
> cpu_has_feature().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Fixes following build

http://kisskb.ellerman.id.au/kisskb/buildresult/14489391/

> ---
>   arch/powerpc/include/asm/cpu_has_feature.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/cpu_has_feature.h b/arch/powerpc/include/asm/cpu_has_feature.h
> index 7897d16e0990..727d4b321937 100644
> --- a/arch/powerpc/include/asm/cpu_has_feature.h
> +++ b/arch/powerpc/include/asm/cpu_has_feature.h
> @@ -7,7 +7,7 @@
>   #include <linux/bug.h>
>   #include <asm/cputable.h>
>   
> -static inline bool early_cpu_has_feature(unsigned long feature)
> +static __always_inline bool early_cpu_has_feature(unsigned long feature)
>   {
>   	return !!((CPU_FTRS_ALWAYS & feature) ||
>   		  (CPU_FTRS_POSSIBLE & cur_cpu_spec->cpu_features & feature));
> @@ -46,7 +46,7 @@ static __always_inline bool cpu_has_feature(unsigned long feature)
>   	return static_branch_likely(&cpu_feature_keys[i]);
>   }
>   #else
> -static inline bool cpu_has_feature(unsigned long feature)
> +static __always_inline bool cpu_has_feature(unsigned long feature)
>   {
>   	return early_cpu_has_feature(feature);
>   }
> 
