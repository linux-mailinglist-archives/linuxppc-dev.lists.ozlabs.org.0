Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7021A06EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 08:02:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xGzL0hnwzDr31
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 16:02:54 +1000 (AEST)
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
 header.s=mail header.b=M99A/SGA; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xGbV6nYVzDqb1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 15:45:42 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48xGbQ0hkZz9tyl1;
 Tue,  7 Apr 2020 07:45:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=M99A/SGA; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RZDAUZtSitE5; Tue,  7 Apr 2020 07:45:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48xGbP6n4qz9tyl0;
 Tue,  7 Apr 2020 07:45:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586238337; bh=AZSkTtvxcCCwIz4GzLm/SNYJ9WQST5ys+SpBvAUyXaw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=M99A/SGAplo/+24PFkSHqzgVgjVtNGZQ+rQ0+8rDItkDT+Jx1S0aCZpQ2jBGSi5wp
 OnTdyDC7IrgT6KNwytsnTfZdJlt79HZsB9b+AgBR86OE8kmv5lVqARLl1JOF2FmWhf
 ZoK+B0lNfj1+YePZMh8ug0znNQtV45/AsGbdZRts=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B17548B76E;
 Tue,  7 Apr 2020 07:45:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id C7yp2_gGgCSr; Tue,  7 Apr 2020 07:45:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 26B068B75E;
 Tue,  7 Apr 2020 07:45:38 +0200 (CEST)
Subject: Re: [PATCH v3 13/15] powerpc/64s: machine check do not trace
 real-mode handler
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200407051636.648369-1-npiggin@gmail.com>
 <20200407051636.648369-14-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <86bfbf0b-7734-68a1-650c-7e2a29854875@c-s.fr>
Date: Tue, 7 Apr 2020 07:45:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407051636.648369-14-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/04/2020 à 07:16, Nicholas Piggin a écrit :
> Rather than notrace annotations throughout a significant part of the
> machine check code across kernel/ pseries/ and powernv/ which can
> easily be broken and is infrequently tested, use paca->ftrace_enabled
> to blanket-disable tracing of the real-mode non-maskable handler.
> 
> Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/kernel/mce.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index be7e3f92a7b5..fd90c0eda229 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -16,6 +16,7 @@
>   #include <linux/export.h>
>   #include <linux/irq_work.h>
>   #include <linux/extable.h>
> +#include <linux/ftrace.h>
>   
>   #include <asm/machdep.h>
>   #include <asm/mce.h>
> @@ -571,10 +572,14 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
>    *
>    * regs->nip and regs->msr contains srr0 and ssr1.
>    */
> -long machine_check_early(struct pt_regs *regs)
> +long notrace machine_check_early(struct pt_regs *regs)
>   {
>   	long handled = 0;
>   	bool nested = in_nmi();
> +	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
> +
> +	this_cpu_set_ftrace_enabled(0);
> +
>   	if (!nested)
>   		nmi_enter();
>   
> @@ -589,6 +594,8 @@ long machine_check_early(struct pt_regs *regs)
>   	if (!nested)
>   		nmi_exit();
>   
> +	this_cpu_set_ftrace_enabled(ftrace_enabled);
> +
>   	return handled;
>   }
>   
> 
