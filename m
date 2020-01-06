Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8631C131019
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 11:12:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rrsX2RBPzDqDt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 21:12:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="lNEzVNzQ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rrqT50vVzDqDQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2020 21:10:27 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47rrqD6b3Cz9txnQ;
 Mon,  6 Jan 2020 11:10:16 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=lNEzVNzQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id P1ke8O4y4mJP; Mon,  6 Jan 2020 11:10:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47rrqD5Xqpz9txnN;
 Mon,  6 Jan 2020 11:10:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578305416; bh=CGRt9b2OzOZhl6Oq1ZAN1USJP1xApxOo5RW0sZnRi44=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lNEzVNzQy9QFCLecUcnxKDldWBmBmjAe31FoJYG/DJghPscxNFsOG9a41f0MqfJLg
 KPVOoOnxjAUjkpmh4dYs6OEk+NUDBgacH/GP8b3vUJ2I/ImjoMB5JRPIz5zCgdpdVr
 IYjIp59aQI27TiUBa/xovtKLMlXM3wyKrSucyl/U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8EB6A8B796;
 Mon,  6 Jan 2020 11:10:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OAP6OHQKc8iX; Mon,  6 Jan 2020 11:10:21 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FB908B752;
 Mon,  6 Jan 2020 11:10:21 +0100 (CET)
Subject: Re: [PATCH v2 2/2] powerpc/mm: Warn if W+X pages found on boot
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20190502073947.6481-1-ruscur@russell.cc>
 <20190502073947.6481-2-ruscur@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e3838ffb-0834-df81-0a47-857f505bb071@c-s.fr>
Date: Mon, 6 Jan 2020 11:10:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20190502073947.6481-2-ruscur@russell.cc>
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
Cc: Julia.Lawall@lip6.fr, rashmica.g@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/05/2019 à 09:39, Russell Currey a écrit :
> Implement code to walk all pages and warn if any are found to be both
> writable and executable.  Depends on STRICT_KERNEL_RWX enabled, and is
> behind the DEBUG_WX config option.
> 
> This only runs on boot and has no runtime performance implications.
> 
> Very heavily influenced (and in some cases copied verbatim) from the
> ARM64 code written by Laura Abbott (thanks!), since our ptdump
> infrastructure is similar.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
> v2: A myriad of fixes and cleanups thanks to Christophe Leroy
> 
>   arch/powerpc/Kconfig.debug         | 19 ++++++++++++++
>   arch/powerpc/include/asm/pgtable.h |  6 +++++
>   arch/powerpc/mm/pgtable_32.c       |  3 +++
>   arch/powerpc/mm/pgtable_64.c       |  3 +++
>   arch/powerpc/mm/ptdump/ptdump.c    | 41 +++++++++++++++++++++++++++++-
>   5 files changed, 71 insertions(+), 1 deletion(-)
> 

[...]

> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index a4a132f92810..e69b53a8a841 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -31,7 +31,7 @@
>   #include "ptdump.h"
>   
>   #ifdef CONFIG_PPC32
> -#define KERN_VIRT_START	0
> +#define KERN_VIRT_START	PAGE_OFFSET
>   #endif
>   
>   /*
> @@ -68,6 +68,8 @@ struct pg_state {
>   	unsigned long last_pa;
>   	unsigned int level;
>   	u64 current_flags;
> +	bool check_wx;
> +	unsigned long wx_pages;
>   };
>   
>   struct addr_marker {
> @@ -177,6 +179,20 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
>   
>   }
>   
> +static void note_prot_wx(struct pg_state *st, unsigned long addr)
> +{
> +	if (!st->check_wx)
> +		return;
> +
> +	if (!((st->current_flags & pgprot_val(PAGE_KERNEL_X)) == pgprot_val(PAGE_KERNEL_X)))
> +		return;
> +

I just realised that the above test is insuffisient, allthought it works 
by chance.

If I understand correctly, you want to make sure that no page is set 
with PAGE_KERNEL_X, ie that all X pages are PAGE_KERNEL_ROX

If you take the exemple of the 8xx, we have:

#define PAGE_KERNEL_X	__pgprot(_PAGE_BASE | _PAGE_KERNEL_RWX)
#define PAGE_KERNEL_ROX	__pgprot(_PAGE_BASE | _PAGE_KERNEL_ROX)

#define _PAGE_KERNEL_RWX	(_PAGE_SH | _PAGE_DIRTY | _PAGE_EXEC)
#define _PAGE_KERNEL_ROX	(_PAGE_SH | _PAGE_RO | _PAGE_EXEC)

Your test is checking which bits are set, but doesn't test which bits 
are not set. So your test only relies on the fact that _PAGE_DIRTY is 
set when the page is RW. It looks rather fragile as for some reason, a 
page might be RW without being DIRTY yet.

I think the test should be more robust, something like:

	pte_t pte = __pte(st->current_flags);

	if (!pte_exec(pte) || !pte_write(pte))
		return;

Christophe
