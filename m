Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ECD2A488C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:47:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQXgg1PV7zDqXC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 01:47:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQXbn6cjDzDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 01:44:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CQXbm5Mk4z8tWh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 01:44:04 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CQXbm4cSrz9sTL; Wed,  4 Nov 2020 01:44:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CQXbl2YG3z9sTD
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Nov 2020 01:44:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CQXbZ3rHsz9v1wG;
 Tue,  3 Nov 2020 15:43:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id g1konai4yb86; Tue,  3 Nov 2020 15:43:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CQXbZ30j8z9v1vs;
 Tue,  3 Nov 2020 15:43:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE58E8B7D7;
 Tue,  3 Nov 2020 15:43:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id khwlAAorS_3s; Tue,  3 Nov 2020 15:43:55 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4AB498B7D4;
 Tue,  3 Nov 2020 15:43:55 +0100 (CET)
Subject: Re: [PATCH] powerpc: Don't use asm goto for put_user() with GCC 4.9
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20201103132915.529337-1-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4fe837f8-ecae-f009-c193-8da386a70705@csgroup.eu>
Date: Tue, 3 Nov 2020 15:43:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201103132915.529337-1-mpe@ellerman.id.au>
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
Cc: schwab@linux-m68k.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/11/2020 à 14:29, Michael Ellerman a écrit :
> Andreas reported that commit ee0a49a6870e ("powerpc/uaccess: Switch
> __put_user_size_allowed() to __put_user_asm_goto()") broke
> CLONE_CHILD_SETTID.
> 
> Further inspection showed that the put_user() in schedule_tail() was
> missing entirely, the store not emitted by the compiler.
> 

> 
> Notice there are no stores other than to the stack. There should be a
> stw in there for the store to current->set_child_tid.
> 
> This is only seen with GCC 4.9 era compilers (tested with 4.9.3 and
> 4.9.4), and only when CONFIG_PPC_KUAP is disabled.
> 
> When CONFIG_PPC_KUAP=y, the memory clobber that's part of the isync()
> and mtspr() inlined via allow_user_access() seems to be enough to
> avoid the bug.
> 
> For now though let's just not use asm goto with GCC 4.9, to avoid this
> bug and any other issues we haven't noticed yet. Possibly in future we
> can find a smaller workaround.

Is that https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670 ?

Should we use asm_volatile_goto() defined in include/linux/compiler-gcc.h ?

Christophe


> 
> This is basically a revert of commit ee0a49a6870e ("powerpc/uaccess:
> Switch __put_user_size_allowed() to __put_user_asm_goto()") and commit
> 7fdf966bed15 ("powerpc/uaccess: Remove __put_user_asm() and
> __put_user_asm2()"), but only for GCC 4.9.
> 
> With this applied the code generation looks more like it will work:
> 


> 
> Fixes: ee0a49a6870e ("powerpc/uaccess: Switch __put_user_size_allowed() to __put_user_asm_goto()")
> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   arch/powerpc/include/asm/uaccess.h | 48 ++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index ef5bbb705c08..526a6658946b 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -110,6 +110,52 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
>   
>   extern long __put_user_bad(void);
>   
> +#if defined(GCC_VERSION) && GCC_VERSION < 50000
> +#define __put_user_asm(x, addr, err, op)			\
> +	__asm__ __volatile__(					\
> +		"1:	" op "%U2%X2 %1,%2	# put_user\n"	\
> +		"2:\n"						\
> +		".section .fixup,\"ax\"\n"			\
> +		"3:	li %0,%3\n"				\
> +		"	b 2b\n"					\
> +		".previous\n"					\
> +		EX_TABLE(1b, 3b)				\
> +		: "=r" (err)					\
> +		: "r" (x), "m<>" (*addr), "i" (-EFAULT), "0" (err))
> +
> +#ifdef __powerpc64__
> +#define __put_user_asm2(x, ptr, retval)				\
> +	  __put_user_asm(x, ptr, retval, "std")
> +#else /* __powerpc64__ */
> +#define __put_user_asm2(x, addr, err)				\
> +	__asm__ __volatile__(					\
> +		"1:	stw%X2 %1,%2\n"			\
> +		"2:	stw%X2 %L1,%L2\n"			\
> +		"3:\n"						\
> +		".section .fixup,\"ax\"\n"			\
> +		"4:	li %0,%3\n"				\
> +		"	b 3b\n"					\
> +		".previous\n"					\
> +		EX_TABLE(1b, 4b)				\
> +		EX_TABLE(2b, 4b)				\
> +		: "=r" (err)					\
> +		: "r" (x), "m" (*addr), "i" (-EFAULT), "0" (err))
> +#endif /* __powerpc64__ */
> +
> +#define __put_user_size_allowed(x, ptr, size, retval)		\
> +do {								\
> +	retval = 0;						\
> +	switch (size) {						\
> +	  case 1: __put_user_asm(x, ptr, retval, "stb"); break;	\
> +	  case 2: __put_user_asm(x, ptr, retval, "sth"); break;	\
> +	  case 4: __put_user_asm(x, ptr, retval, "stw"); break;	\
> +	  case 8: __put_user_asm2(x, ptr, retval); break;	\
> +	  default: __put_user_bad();				\
> +	}							\
> +} while (0)
> +
> +#else
> +
>   #define __put_user_size_allowed(x, ptr, size, retval)		\
>   do {								\
>   	__label__ __pu_failed;					\
> @@ -122,6 +168,8 @@ __pu_failed:							\
>   	retval = -EFAULT;					\
>   } while (0)
>   
> +#endif /* GCC_VERSION */
> +
>   #define __put_user_size(x, ptr, size, retval)			\
>   do {								\
>   	allow_write_to_user(ptr, size);				\
> 
