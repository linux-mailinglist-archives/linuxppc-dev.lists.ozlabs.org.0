Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FD71BB5D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 07:22:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B94N3TrNzDqvh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 15:21:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=nGhRcJrf; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B92J5RQLzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 15:20:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49B92872Hsz9tyFK;
 Tue, 28 Apr 2020 07:20:00 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=nGhRcJrf; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qMJ0422MHcwH; Tue, 28 Apr 2020 07:20:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49B9285f3fz9tyF5;
 Tue, 28 Apr 2020 07:20:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1588051200; bh=0Fp1+vsjm6csve6Pj9Z85PlOaSG7TvEwUnVjSoSYyiU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nGhRcJrfUQQiICaHv2DiYKTaO6nEfe90MJ48+3HduDsJljn31L5yQBePVDwip9n7l
 5MbWasVOrAUaxdDt/9rfE15eHk+wALL1gazMcQEKaz9MjvXZj/BoVQ78kIqzfAt7HH
 3DchD599meW+K9YBLrYc0JmnszSMebF2AKryWNs8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A359A8B7C5;
 Tue, 28 Apr 2020 07:20:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4RIT0XRgBGag; Tue, 28 Apr 2020 07:20:01 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E20A78B75F;
 Tue, 28 Apr 2020 07:20:00 +0200 (CEST)
Subject: Re: [PATCH v6 03/28] powerpc/xmon: Move breakpoints to text section
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200428015814.15380-1-jniethe5@gmail.com>
 <20200428015814.15380-4-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <6761670b-545c-0120-48e3-1cadf047a95f@c-s.fr>
Date: Tue, 28 Apr 2020 07:19:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428015814.15380-4-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/04/2020 à 03:57, Jordan Niethe a écrit :
> The instructions for xmon's breakpoint are stored bpt_table[] which is in
> the data section. This is problematic as the data section may be marked
> as no execute. Move bpt_table[] to the text section.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v6: - New to series. Was part of the previous patch.
>      - Make BPT_SIZE available in assembly
> ---
>   arch/powerpc/kernel/asm-offsets.c |  8 ++++++++
>   arch/powerpc/xmon/Makefile        |  2 +-
>   arch/powerpc/xmon/xmon.c          |  6 +-----
>   arch/powerpc/xmon/xmon_bpts.S     |  9 +++++++++
>   arch/powerpc/xmon/xmon_bpts.h     | 14 ++++++++++++++
>   5 files changed, 33 insertions(+), 6 deletions(-)
>   create mode 100644 arch/powerpc/xmon/xmon_bpts.S
>   create mode 100644 arch/powerpc/xmon/xmon_bpts.h
> 
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index c25e562f1cd9..2401f415f423 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -70,6 +70,10 @@
>   #include <asm/fixmap.h>
>   #endif
>   
> +#ifdef CONFIG_XMON
> +#include "../xmon/xmon_bpts.h"
> +#endif
> +
>   #define STACK_PT_REGS_OFFSET(sym, val)	\
>   	DEFINE(sym, STACK_FRAME_OVERHEAD + offsetof(struct pt_regs, val))
>   
> @@ -783,5 +787,9 @@ int main(void)
>   	DEFINE(VIRT_IMMR_BASE, (u64)__fix_to_virt(FIX_IMMR_BASE));
>   #endif
>   
> +#ifdef CONFIG_XMON
> +	DEFINE(BPT_SIZE, BPT_SIZE);
> +#endif
> +
>   	return 0;
>   }
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index c3842dbeb1b7..515a13ea6f28 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -21,7 +21,7 @@ endif
>   
>   ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
>   
> -obj-y			+= xmon.o nonstdio.o spr_access.o
> +obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o
>   
>   ifdef CONFIG_XMON_DISASSEMBLY
>   obj-y			+= ppc-dis.o ppc-opc.o
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index a064392df1b8..f7ce3ea8694c 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -62,6 +62,7 @@
>   
>   #include "nonstdio.h"
>   #include "dis-asm.h"
> +#include "xmon_bpts.h"
>   
>   #ifdef CONFIG_SMP
>   static cpumask_t cpus_in_xmon = CPU_MASK_NONE;
> @@ -108,7 +109,6 @@ struct bpt {
>   #define BP_TRAP		2
>   #define BP_DABR		4
>   
> -#define NBPTS	256
>   static struct bpt bpts[NBPTS];
>   static struct bpt dabr;
>   static struct bpt *iabr;
> @@ -116,10 +116,6 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
>   
>   #define BP_NUM(bp)	((bp) - bpts + 1)
>   
> -#define BPT_SIZE       (sizeof(unsigned int) * 2)
> -#define BPT_WORDS      (BPT_SIZE / sizeof(unsigned int))
> -static unsigned int bpt_table[NBPTS * BPT_WORDS];
> -
>   /* Prototypes */
>   static int cmds(struct pt_regs *);
>   static int mread(unsigned long, void *, int);
> diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bpts.S
> new file mode 100644
> index 000000000000..f3ad0ab50854
> --- /dev/null
> +++ b/arch/powerpc/xmon/xmon_bpts.S
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/ppc_asm.h>
> +#include <asm/asm-compat.h>
> +#include <asm/asm-offsets.h>
> +#include "xmon_bpts.h"
> +
> +.global bpt_table
> +bpt_table:
> +	.space NBPTS * BPT_SIZE

No alignment required ? Standard alignment (probably 4 bytes ?) is 
acceptable ?


> diff --git a/arch/powerpc/xmon/xmon_bpts.h b/arch/powerpc/xmon/xmon_bpts.h
> new file mode 100644
> index 000000000000..b7e94375db86
> --- /dev/null
> +++ b/arch/powerpc/xmon/xmon_bpts.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef XMON_BPTS_H
> +#define XMON_BPTS_H
> +
> +#define NBPTS	256
> +#ifndef __ASSEMBLY__
> +#define BPT_SIZE	(sizeof(unsigned int) * 2)
> +#define BPT_WORDS	(BPT_SIZE / sizeof(unsigned int))
> +
> +extern unsigned int bpt_table[NBPTS * BPT_WORDS];
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* XMON_BPTS_H */
> 

Christophe
