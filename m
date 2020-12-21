Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9262DF9F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 09:32:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czt4t0zbCzDqTh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 19:32:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Czsgw5X6KzDqgs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 19:14:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Czsgl5BxJzB09ZV;
 Mon, 21 Dec 2020 09:14:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XBH5CdBuqOCc; Mon, 21 Dec 2020 09:14:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Czsgl3zbKzB09ZQ;
 Mon, 21 Dec 2020 09:14:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D5958B7C7;
 Mon, 21 Dec 2020 09:14:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ACCG3RsQ8tg2; Mon, 21 Dec 2020 09:14:16 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 26FD28B7C6;
 Mon, 21 Dec 2020 09:14:16 +0100 (CET)
Subject: Re: [PATCH 10/23] powerpc/optprobes: Remove unused routine
 patch_imm32_load_insns()
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20201221074222.403894-1-clg@kaod.org>
 <20201221074222.403894-11-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d9220611-b5ca-c0b8-fefe-b834cfa2c2c1@csgroup.eu>
Date: Mon, 21 Dec 2020 09:14:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201221074222.403894-11-clg@kaod.org>
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/12/2020 à 08:42, Cédric Le Goater a écrit :
> It fixes W=1 this compile error :

Please give more details on why it can be removed.
Has it been used in the past and its user was removed by a commit ?
Has it never been used ?

> 
> ../arch/powerpc/kernel/optprobes.c:149:6: error: no previous prototype for ‘patch_imm32_load_insns’ [-Werror=missing-prototypes]
>    149 | void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
> 
> Cc: Jordan Niethe <jniethe5@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   arch/powerpc/kernel/optprobes.c | 19 -------------------
>   1 file changed, 19 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
> index 69bfe96884e2..da6b88b80ba4 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -141,25 +141,6 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
>   	}
>   }
>   
> -/*
> - * emulate_step() requires insn to be emulated as
> - * second parameter. Load register 'r4' with the
> - * instruction.
> - */
> -void patch_imm32_load_insns(unsigned int val, kprobe_opcode_t *addr)
> -{
> -	/* addis r4,0,(insn)@h */
> -	patch_instruction((struct ppc_inst *)addr,
> -			  ppc_inst(PPC_INST_ADDIS | ___PPC_RT(4) |
> -				   ((val >> 16) & 0xffff)));
> -	addr++;
> -
> -	/* ori r4,r4,(insn)@l */
> -	patch_instruction((struct ppc_inst *)addr,
> -			  ppc_inst(PPC_INST_ORI | ___PPC_RA(4) |
> -				   ___PPC_RS(4) | (val & 0xffff)));
> -}
> -
>   /*
>    * Generate instructions to load provided immediate 64-bit value
>    * to register 'reg' and patch these instructions at 'addr'.
> 
