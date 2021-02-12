Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C1331A265
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 17:12:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcdnN6yPjzDwxZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Feb 2021 03:12:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dcdlk0WgCzDsn2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Feb 2021 03:11:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DcdlS4b03z9twnk;
 Fri, 12 Feb 2021 17:11:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id UDVP2z5iKs32; Fri, 12 Feb 2021 17:11:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DcdlS3HyRz9twng;
 Fri, 12 Feb 2021 17:11:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 12A018B86E;
 Fri, 12 Feb 2021 17:11:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PqbDKuhTKVA3; Fri, 12 Feb 2021 17:11:02 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F2CE8B866;
 Fri, 12 Feb 2021 17:11:01 +0100 (CET)
Subject: Re: [PATCH 2/2] powerpc/uaccess: Move might_fault() into
 user_access_begin()
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210208135717.2618798-1-mpe@ellerman.id.au>
 <20210208135717.2618798-2-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b1d3af99-2d38-0794-0694-95a735fccbe3@csgroup.eu>
Date: Fri, 12 Feb 2021 17:10:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210208135717.2618798-2-mpe@ellerman.id.au>
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
Cc: aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/02/2021 à 14:57, Michael Ellerman a écrit :
> We have a might_fault() check in __unsafe_put_user_goto(), but that is
> dangerous as it potentially calls lots of code while user access is
> enabled.
> 
> It also triggers the check Alexey added to the irq restore path to
> catch cases like that:
> 
>    WARNING: CPU: 30 PID: 1 at arch/powerpc/include/asm/book3s/64/kup.h:324 arch_local_irq_restore+0x160/0x190
>    NIP arch_local_irq_restore+0x160/0x190
>    LR  lock_is_held_type+0x140/0x200
>    Call Trace:
>      0xc00000007f392ff8 (unreliable)
>      ___might_sleep+0x180/0x320
>      __might_fault+0x50/0xe0
>      filldir64+0x2d0/0x5d0
>      call_filldir+0xc8/0x180
>      ext4_readdir+0x948/0xb40
>      iterate_dir+0x1ec/0x240
>      sys_getdents64+0x80/0x290
>      system_call_exception+0x160/0x280
>      system_call_common+0xf0/0x27c
> 
> So remove the might fault check from unsafe_put_user().
> 
> Any call to unsafe_put_user() must be inside a region that's had user
> access enabled with user_access_begin(), so move the might_fault() in
> there. That also allows us to drop the is_kernel_addr() test, because
> there should be no code using user_access_begin() in order to access a
> kernel address.

x86 and mips only have might_fault() on get_user() and put_user(), neither on __get_user() nor on 
__put_user() nor on the unsafe alternative.

When have might_fault() in __get_user_nocheck() that is used by __get_user() and 
__get_user_allowed() ie by unsafe_get_user().

Shoudln't those be dropped as well ?

Christophe

> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   arch/powerpc/include/asm/uaccess.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 70347ee34c94..71640eca7341 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -214,8 +214,6 @@ do {								\
>   #define __unsafe_put_user_goto(x, ptr, size, label)		\
>   do {								\
>   	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
> -	if (!is_kernel_addr((unsigned long)__pu_addr))		\
> -		might_fault();					\
>   	__chk_user_ptr(ptr);					\
>   	__put_user_size_goto((x), __pu_addr, (size), label);	\
>   } while (0)
> @@ -494,6 +492,8 @@ extern void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
>   
>   static __must_check inline bool user_access_begin(const void __user *ptr, size_t len)
>   {
> +	might_fault();
> +
>   	if (unlikely(!access_ok(ptr, len)))
>   		return false;
>   	allow_read_write_user((void __user *)ptr, ptr, len);
> 
