Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD7832E74C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 12:37:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsQhZ5HFXz3dKY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 22:37:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsQhG1MvQz3cKp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 22:37:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DsQh56Y09z9twsb;
 Fri,  5 Mar 2021 12:37:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WGAikzzfnPuS; Fri,  5 Mar 2021 12:37:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DsQh55Gn9z9twsM;
 Fri,  5 Mar 2021 12:37:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 106B48B81F;
 Fri,  5 Mar 2021 12:37:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CM78OON5YN7b; Fri,  5 Mar 2021 12:37:26 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B9CAB8B828;
 Fri,  5 Mar 2021 12:37:26 +0100 (CET)
Subject: Re: [PATCH] powerpc: Fix instruction encoding for lis in
 ppc_function_entry()
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20210304020411.16796-1-naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <870c42dd-9862-bb86-6e06-2e0164f4ae85@csgroup.eu>
Date: Fri, 5 Mar 2021 12:37:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304020411.16796-1-naveen.n.rao@linux.vnet.ibm.com>
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
Cc: Jiri Olsa <jolsa@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/03/2021 à 03:04, Naveen N. Rao a écrit :
> 'lis r2,N' is 'addis r2,0,N' and the instruction encoding in the macro
> LIS_R2 is incorrect (it currently maps to 'addis 0,r2,N'). Fix the same.
> 
> Fixes: c71b7eff426fa7 ("powerpc: Add ABIv2 support to ppc_function_entry")
> Reported-by: Jiri Olsa <jolsa@redhat.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>   arch/powerpc/include/asm/code-patching.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
> index eacc9102c2515c..d5b3c3bb95b400 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -73,7 +73,7 @@ void __patch_exception(int exc, unsigned long addr);
>   #endif
>   
>   #define OP_RT_RA_MASK	0xffff0000UL
> -#define LIS_R2		0x3c020000UL
> +#define LIS_R2		0x3c400000UL
>   #define ADDIS_R2_R12	0x3c4c0000UL
>   #define ADDI_R2_R2	0x38420000UL

That probably goes beyond the scope of this patch, but it would be more readable and less error 
prone to use macros defined in ppc-opcode.h just like kernel/module_64.c does for instance:

#define LIS_R2	(PPC_INST_ADDIS | __PPC_RT(R2))
#define ADDIS_R2_R12	(PPC_INST_ADDIS | __PPC_RT(R2) | __PPC_RA(R12))
#define ADDI_R2_R2	(PPC_INST_ADDI | __PPC_RT(R2) | __PPC_RA(R2))

>   
> 
> base-commit: 91966823812efbd175f904599e5cf2a854b39809
> 
