Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A39DF33D229
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 11:49:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F096B4qH0z3c9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 21:49:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F095Z2MPTz30Gm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 21:49:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F095Q1n67z9v09L;
 Tue, 16 Mar 2021 11:49:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zN3uq9cqPwFs; Tue, 16 Mar 2021 11:49:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F095Q0j7lz9v09K;
 Tue, 16 Mar 2021 11:49:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E5C898B799;
 Tue, 16 Mar 2021 11:49:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 17WApwqlZS7n; Tue, 16 Mar 2021 11:49:14 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A68968B792;
 Tue, 16 Mar 2021 11:49:10 +0100 (CET)
Subject: Re: [PATCH v2 04/11] powerpc/64e/interrupt: use new interrupt return
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210316104206.407354-1-npiggin@gmail.com>
 <20210316104206.407354-5-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <53a3a1e1-b2c5-116c-174b-dd4beefa6515@csgroup.eu>
Date: Tue, 16 Mar 2021 11:49:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316104206.407354-5-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/03/2021 à 11:41, Nicholas Piggin a écrit :
> Update the new C and asm interrupt return code to account for 64e
> specifics, switch over to use it.
> 
> The now-unused old ret_from_except code, that was moved to 64e after the
> 64s conversion, is removed.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/asm-prototypes.h |   2 -
>   arch/powerpc/include/asm/ppc_asm.h        |  20 --
>   arch/powerpc/kernel/asm-offsets.c         |  10 -
>   arch/powerpc/kernel/exceptions-64e.S      | 321 ++--------------------
>   arch/powerpc/kernel/irq.c                 |  76 -----
>   5 files changed, 25 insertions(+), 404 deletions(-)
> 

> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index 85ba2b0bc8d8..c880ad18b851 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -282,21 +282,11 @@ int main(void)
>   	OFFSET(PACAHWCPUID, paca_struct, hw_cpu_id);
>   	OFFSET(PACAKEXECSTATE, paca_struct, kexec_state);
>   	OFFSET(PACA_DSCR_DEFAULT, paca_struct, dscr_default);
> -	OFFSET(ACCOUNT_STARTTIME, paca_struct, accounting.starttime);
> -	OFFSET(ACCOUNT_STARTTIME_USER, paca_struct, accounting.starttime_user);
> -	OFFSET(ACCOUNT_USER_TIME, paca_struct, accounting.utime);
> -	OFFSET(ACCOUNT_SYSTEM_TIME, paca_struct, accounting.stime);
>   #ifdef CONFIG_PPC_BOOK3E
>   	OFFSET(PACA_TRAP_SAVE, paca_struct, trap_save);
>   #endif
>   	OFFSET(PACA_SPRG_VDSO, paca_struct, sprg_vdso);
>   #else /* CONFIG_PPC64 */

The #else is useless

> -#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
> -	OFFSET(ACCOUNT_STARTTIME, thread_info, accounting.starttime);
> -	OFFSET(ACCOUNT_STARTTIME_USER, thread_info, accounting.starttime_user);
> -	OFFSET(ACCOUNT_USER_TIME, thread_info, accounting.utime);
> -	OFFSET(ACCOUNT_SYSTEM_TIME, thread_info, accounting.stime);
> -#endif
>   #endif /* CONFIG_PPC64 */
>   
>   	/* RTAS */
