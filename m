Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 459652DFA22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 09:49:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CztSl3xpYzDqFm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 19:49:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CztR66JDGzDqJ2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 19:48:10 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CztQn75lMz9vBmr;
 Mon, 21 Dec 2020 09:48:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id V9IuGKXR29te; Mon, 21 Dec 2020 09:48:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CztQn60JLz9vBmv;
 Mon, 21 Dec 2020 09:48:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C33B58B7CD;
 Mon, 21 Dec 2020 09:48:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KCX5xPO20s2W; Mon, 21 Dec 2020 09:48:06 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CF258B7BE;
 Mon, 21 Dec 2020 09:48:06 +0100 (CET)
Subject: Re: [PATCH 17/23] powerpc/watchdog: Declare soft_nmi_interrupt()
 prototype
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20201221074222.403894-1-clg@kaod.org>
 <20201221074222.403894-18-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8174a721-0407-1788-c2d1-dd4b274b314e@csgroup.eu>
Date: Mon, 21 Dec 2020 09:48:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201221074222.403894-18-clg@kaod.org>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/12/2020 à 08:42, Cédric Le Goater a écrit :
> It fixes this W=1 compile error :
> 
> ../arch/powerpc/kernel/watchdog.c:250:6: error: no previous prototype for ‘soft_nmi_interrupt’ [-Werror=missing-prototypes]
>    250 | void soft_nmi_interrupt(struct pt_regs *regs)
>        |      ^~~~~~~~~~~~~~~~~~
> 
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   arch/powerpc/include/asm/asm-prototypes.h | 1 +

This is a misuse of asm/asm-prototypes.h

This file is for prototypes of ASM functions.

See discussion at 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1463534212-4879-2-git-send-email-dja@axtens.net/


>   arch/powerpc/kernel/watchdog.c            | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
> index d0b832cbbec8..0f39eefbd5a5 100644
> --- a/arch/powerpc/include/asm/asm-prototypes.h
> +++ b/arch/powerpc/include/asm/asm-prototypes.h
> @@ -84,6 +84,7 @@ void machine_check_exception(struct pt_regs *regs);
>   void emulation_assist_interrupt(struct pt_regs *regs);
>   long do_slb_fault(struct pt_regs *regs, unsigned long ea);
>   void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err);
> +void soft_nmi_interrupt(struct pt_regs *regs);
>   
>   /* signals, syscalls and interrupts */
>   long sys_swapcontext(struct ucontext __user *old_ctx,
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index af3c15a1d41e..855716f563ac 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -27,6 +27,7 @@
>   #include <linux/smp.h>
>   
>   #include <asm/paca.h>
> +#include <asm/asm-prototypes.h>
>   
>   /*
>    * The powerpc watchdog ensures that each CPU is able to service timers.
> 
