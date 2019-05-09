Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D533186FB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 10:47:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4506Qy1KQCzDqNm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 18:47:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Fwh2bxOZ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4506PG2Pj9zDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 18:45:36 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4506P80XSpzB09ZY;
 Thu,  9 May 2019 10:45:32 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Fwh2bxOZ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0_FkS9UUJOYj; Thu,  9 May 2019 10:45:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4506P76R0QzB09ZT;
 Thu,  9 May 2019 10:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557391531; bh=w/S7uUqgSN8KA1lhK6c0zs41LA+fZFdzr4wOKuoeeF4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Fwh2bxOZybQ15+xWv0/09B81w+uKslkudpJP+Q9Kfq8dkXYuSBHsTS0ZXGVzjs9SE
 64rHcxGl4MHMOu5i51Nn0x1SvC0ZhqddIYpI4EsR5Iw8/CUn6nRYeLQ7ZYzCipcL0C
 U3jAVa4BHmq32Q82mdDar/0FvJIHbp2WpSSI/hl0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 035708B90F;
 Thu,  9 May 2019 10:45:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tboJ1RkcuLOR; Thu,  9 May 2019 10:45:32 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A96218B90D;
 Thu,  9 May 2019 10:45:32 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Fix compile issue with force DAWR
To: Michael Neuling <mikey@neuling.org>, mpe@ellerman.id.au
References: <20190508013047.12850-1-mikey@neuling.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0e2e24dc-4533-4439-3dc1-97ec64fbf49b@c-s.fr>
Date: Thu, 9 May 2019 10:45:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508013047.12850-1-mikey@neuling.org>
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



Le 08/05/2019 à 03:30, Michael Neuling a écrit :
> If you compile with KVM but without CONFIG_HAVE_HW_BREAKPOINT you fail
> at linking with:
>    arch/powerpc/kvm/book3s_hv_rmhandlers.o:(.text+0x708): undefined reference to `dawr_force_enable'
> 
> This was caused by this recent patch:
>     commit c1fe190c06723322f2dfac31d3b982c581e434ef
>     Author: Michael Neuling <mikey@neuling.org>
>     powerpc: Add force enable of DAWR on P9 option

I think you should use the standard commit format, checkpatch will tell you.

> 
> This builds dawr_force_enable in always via a new file.

Do we really need a new file just for that ?
As far as I understand, it is always compiled in, so can't we use 
another file like traps.o or setup-common.o or somewhere else ?

Or just put an ifdef in arch/powerpc/kvm/book3s_hv_rmhandlers.S ?
Because your fix will put dawr_force_enable on every build even the ones 
who don't need it at all.

Christophe

> 
> Signed-off-by: Michael Neuling <mikey@neuling.org> > ---
>   arch/powerpc/kernel/Makefile        |  2 +-
>   arch/powerpc/kernel/dawr.c          | 11 +++++++++++
>   arch/powerpc/kernel/hw_breakpoint.c |  3 ---
>   3 files changed, 12 insertions(+), 4 deletions(-)
>   create mode 100644 arch/powerpc/kernel/dawr.c
> 
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 0ea6c4aa3a..48a20ef5be 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -49,7 +49,7 @@ obj-y				:= cputable.o ptrace.o syscalls.o \
>   				   signal.o sysfs.o cacheinfo.o time.o \
>   				   prom.o traps.o setup-common.o \
>   				   udbg.o misc.o io.o misc_$(BITS).o \
> -				   of_platform.o prom_parse.o
> +				   of_platform.o prom_parse.o dawr.o
>   obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
>   				   signal_64.o ptrace32.o \
>   				   paca.o nvram_64.o firmware.o
> diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
> new file mode 100644
> index 0000000000..ca343efd23
> --- /dev/null
> +++ b/arch/powerpc/kernel/dawr.c
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// DAWR global variables
> +//
> +// Copyright 2019, Michael Neuling, IBM Corporation.
> +
> +#include <linux/types.h>
> +#include <linux/export.h>
> +
> +bool dawr_force_enable;
> +EXPORT_SYMBOL_GPL(dawr_force_enable);
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index da307dd93e..78a17454f4 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -381,9 +381,6 @@ void hw_breakpoint_pmu_read(struct perf_event *bp)
>   	/* TODO */
>   }
>   
> -bool dawr_force_enable;
> -EXPORT_SYMBOL_GPL(dawr_force_enable);
> -
>   static ssize_t dawr_write_file_bool(struct file *file,
>   				    const char __user *user_buf,
>   				    size_t count, loff_t *ppos)
> 
