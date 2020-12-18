Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 007682DE6EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 16:50:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyCxZ08nwzDrFr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 02:50:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyChV4GFVzDrfY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 02:39:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CyChK731PzB09ZH;
 Fri, 18 Dec 2020 16:38:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PZwKgVWi-XEt; Fri, 18 Dec 2020 16:38:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CyChK5tZxzB09ZF;
 Fri, 18 Dec 2020 16:38:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D9598B7BC;
 Fri, 18 Dec 2020 16:38:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2u1BljZQkhYI; Fri, 18 Dec 2020 16:38:59 +0100 (CET)
Received: from [192.168.204.43] (unknown [192.168.204.43])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5DE1A8B75F;
 Fri, 18 Dec 2020 16:38:58 +0100 (CET)
Subject: Re: [PATCH] powerpc: fix alignment bug whithin the init sections
To: Ariel Marcovitch <arielmarcovitch@gmail.com>, mpe@ellerman.id.au
References: <20201213183556.16976-1-ariel.marcovitch@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4716e80b-db6f-7669-684f-398971ed5f2e@csgroup.eu>
Date: Fri, 18 Dec 2020 16:38:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201213183556.16976-1-ariel.marcovitch@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, paulus@samba.org,
 linux-kernel@vger.kernel.org, Ariel Marcovitch <ariel.marcovitch@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/12/2020 à 19:35, Ariel Marcovitch a écrit :
> This is a bug that can cause early crashes in configurations with a
> .exit.text section smaller than a page and a .init.text section that
> ends in the beginning of a physical page (this is kinda random, which
> might explain why this wasn't really encountered before).

It can cause, or it causes ? Did you encounter the issue ?

> 
> The init sections are ordered like this:
> 	.init.text
> 	.exit.text
> 	.init.data
> 
> Currently, these sections aren't page aligned.
> 
> Because the init code is mapped read-only at runtime and because the
> .init.text section can potentially reside on the same physical page as
> .init.data, the beginning of .init.data might be mapped read-only along
> with .init.text.

init code is mapped PAGE_KERNEL_TEXT.

Whether PAGE_KERNEL_TEXT is read-only or not depends on the selected options.

> 
> Then when the kernel tries to modify a variable in .init.data (like
> kthreadd_done, used in kernel_init()) the kernel panics.
> 
> To avoid this, I made these sections page aligned.

Should write this unpersonal, something like "To avoid this, make these sections page aligned"

> 
> Fixes: 060ef9d89d18 ("powerpc32: PAGE_EXEC required for inittext")
> Signed-off-by: Ariel Marcovitch <ariel.marcovitch@gmail.com>
> ---
>   arch/powerpc/kernel/vmlinux.lds.S | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 326e113d2e45..e3a7c90c03f4 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -179,6 +179,11 @@ SECTIONS
>   #endif
>   	} :text
>   
> +	/* .init.text is made RO and .exit.text is not, so we must
> +	 * ensure these sections reside in separate physical pages.
> +	 */
> +	. = ALIGN(PAGE_SIZE);
> +

In principle, as it is text, it should be made RO as well. But what happens at the begining doesn't 
really matter, anyway .exit.text should never be executed and is discarded together with init text.
So, I think it is OK the live with it as is for the time being.

Making it page aligned makes sense anyway.

Should we make _einittext page aligned instead, just like _etext ?

>   	/* .exit.text is discarded at runtime, not link time,
>   	 * to deal with references from __bug_table
>   	 */
> @@ -186,6 +191,8 @@ SECTIONS
>   		EXIT_TEXT
>   	}
>   
> +	. = ALIGN(PAGE_SIZE);
> +

Here for sure, as you explain in the coming log, this needs to be separated from init text. So 
making it aligned is a must.

>   	.init.data : AT(ADDR(.init.data) - LOAD_OFFSET) {
>   		INIT_DATA
>   	}
> 
> base-commit: 1398820fee515873379809a6415930ad0764b2f6
> 

Christophe
