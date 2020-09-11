Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A0A2658F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:51:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnlHV3lmkzDqmf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 15:51:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnlFZ1HblzDqXV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 15:49:36 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BnlFS58BMz9v1Jp;
 Fri, 11 Sep 2020 07:49:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AsVEGTJYEUOZ; Fri, 11 Sep 2020 07:49:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BnlFS4BSSz9v1Jn;
 Fri, 11 Sep 2020 07:49:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A2888B832;
 Fri, 11 Sep 2020 07:49:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UYaAm9WfhIlU; Fri, 11 Sep 2020 07:49:33 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 318D58B75E;
 Fri, 11 Sep 2020 07:49:33 +0200 (CEST)
Subject: Re: [PATCH 7/7] powerpc/32: Fix W=1 compile warning
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20200910210250.1962595-1-clg@kaod.org>
 <20200910210250.1962595-8-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <fa398b3b-c124-3572-07c7-3237d05f3d5a@csgroup.eu>
Date: Fri, 11 Sep 2020 07:49:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910210250.1962595-8-clg@kaod.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/09/2020 à 23:02, Cédric Le Goater a écrit :
> CC      arch/powerpc/kernel/traps.o
> ../arch/powerpc/kernel/traps.c:1663:6: error: no previous prototype for ‘stack_overflow_exception’ [-Werror=missing-prototypes]
>   void stack_overflow_exception(struct pt_regs *regs)
>        ^~~~~~~~~~~~~~~~~~~~~~~~
> 

A small sentence explaining how this is fixed would be welcome, so that 
you don't need to read the code the know what the commit does to fix the 
warning. Also the subject should be more explicit.


> Cc: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> Fixes: 3978eb78517c ("powerpc/32: Add early stack overflow detection with VMAP stack.")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   arch/powerpc/include/asm/asm-prototypes.h | 1 +

Note that asm-prototypes.h is not the right place for such a prototype, 
but that's probably for another cleanup patch. See discussion at 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1463534212-4879-2-git-send-email-dja@axtens.net/

Christophe


>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
> index de14b1a34d56..4957119604c7 100644
> --- a/arch/powerpc/include/asm/asm-prototypes.h
> +++ b/arch/powerpc/include/asm/asm-prototypes.h
> @@ -67,6 +67,7 @@ void single_step_exception(struct pt_regs *regs);
>   void program_check_exception(struct pt_regs *regs);
>   void alignment_exception(struct pt_regs *regs);
>   void StackOverflow(struct pt_regs *regs);
> +void stack_overflow_exception(struct pt_regs *regs);
>   void kernel_fp_unavailable_exception(struct pt_regs *regs);
>   void altivec_unavailable_exception(struct pt_regs *regs);
>   void vsx_unavailable_exception(struct pt_regs *regs);
> 
