Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC61BB5EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 07:38:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B9RJ1r9vzDqxc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 15:38:20 +1000 (AEST)
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
 header.s=mail header.b=p1+bx80w; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B9Hp6TNfzDqwg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 15:31:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49B9Hj705jz9txnl;
 Tue, 28 Apr 2020 07:31:45 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=p1+bx80w; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ksRWT-6LYTV5; Tue, 28 Apr 2020 07:31:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49B9Hj5L7cz9txmQ;
 Tue, 28 Apr 2020 07:31:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1588051905; bh=L/I6FeppBWpytvPm4oLmvPFKe0s8OVyCqzSRbHYYSwo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=p1+bx80wcRg8QTc6C/G0PB6UfZDDwQGE+E9ltF+Gz7R7CZqDcbQz3HdXV5QLHk1Zw
 cVwbahXd2lQqVPNIpwx1ag1juZEY/QbIZwAB0i113g+NZ7ygK9wze7riYxxrc6AzWI
 KOSGOsxnVKoIClMQny4CDgGezzrgtXeynjxMT2RE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A189D8B7C5;
 Tue, 28 Apr 2020 07:31:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hZ80UDZ0lPgq; Tue, 28 Apr 2020 07:31:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D6D078B75F;
 Tue, 28 Apr 2020 07:31:45 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc: Discard .rela* sections if
 CONFIG_RELOCATABLE is undefined
To: "H.J. Lu" <hjl.tools@gmail.com>, linux-kernel@vger.kernel.org
References: <20200428014900.407098-1-hjl.tools@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <55518443-1ab4-1961-beb5-43e9e41e3227@c-s.fr>
Date: Tue, 28 Apr 2020 07:31:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428014900.407098-1-hjl.tools@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Paul Mackerras <paulus@samba.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Borislav Petkov <bp@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 28/04/2020 à 03:48, H.J. Lu a écrit :
> arch/powerpc/kernel/vmlinux.lds.S has
> 
>          DISCARDS
>          /DISCARD/ : {
>                  *(*.EMB.apuinfo)
>                  *(.glink .iplt .plt .rela* .comment)
>                  *(.gnu.version*)
>                  *(.gnu.attributes)
>                  *(.eh_frame)
>          }
> 
> Since .rela* sections are needed when CONFIG_RELOCATABLE is defined,
> change to discard .rela* sections if CONFIG_RELOCATABLE is undefined.

Your explanation and especially the subject are unclear.

 From the subject you understand that you are adding a discard of the 
.rela* sections if CONFIG_RELOCATABLE is undefined.

But when reading the patch, you see that it is the contrary: you are 
removing a discard of the .rela* sections if CONFIG_RELOCATABLE is defined.


So I think the subject could instead be:

	Only discard .rela* sections when CONFIG_RELOCATABLE is undefined

Or maybe better:

	Keep .rela* sections when CONFIG_RELOCATABLE is defined

And the explanation could be:

	Since .rela* sections are needed when CONFIG_RELOCATABLE
	is defined, don't discard .rela* sections if
	CONFIG_RELOCATABLE is defined.

> 
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> ---
>   arch/powerpc/kernel/vmlinux.lds.S | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
> index 31a0f201fb6f..4ba07734a210 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -366,9 +366,12 @@ SECTIONS
>   	DISCARDS
>   	/DISCARD/ : {
>   		*(*.EMB.apuinfo)
> -		*(.glink .iplt .plt .rela* .comment)
> +		*(.glink .iplt .plt .comment)
>   		*(.gnu.version*)
>   		*(.gnu.attributes)
>   		*(.eh_frame)
> +#ifndef CONFIG_RELOCATABLE
> +		*(.rela*)
> +#endif
>   	}
>   }
> 

Christophe
