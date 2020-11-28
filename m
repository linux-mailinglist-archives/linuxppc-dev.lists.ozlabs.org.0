Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B20B2C709F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 20:02:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ck1881jwszF0wH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 06:02:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ck16L4vcmzF0mJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 06:00:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Ck1652WmDz9tyq5;
 Sat, 28 Nov 2020 20:00:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BxbxKsE0xvfL; Sat, 28 Nov 2020 20:00:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Ck1650mbMz9v0FD;
 Sat, 28 Nov 2020 20:00:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1165A8B779;
 Sat, 28 Nov 2020 20:00:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jHhmNoEQjATs; Sat, 28 Nov 2020 20:00:30 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ABE588B75B;
 Sat, 28 Nov 2020 20:00:30 +0100 (CET)
Subject: Re: [PATCH] powerpc: Allow relative pointers in bug table entries
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201127030238.763-1-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5c997bc4-c859-0db6-f167-37ca37819059@csgroup.eu>
Date: Sat, 28 Nov 2020 20:00:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201127030238.763-1-jniethe5@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/11/2020 à 04:02, Jordan Niethe a écrit :
> This enables GENERIC_BUG_RELATIVE_POINTERS on Power so that 32-bit
> offsets are stored in the bug entries rather than 64-bit pointers.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>   arch/powerpc/Kconfig           |  4 ++++
>   arch/powerpc/include/asm/bug.h | 37 ++++++++++++++++++++++++++++++++--
>   arch/powerpc/xmon/xmon.c       | 17 ++++++++++++++--
>   3 files changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e9f13fe08492..294108e0e5c6 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -311,6 +311,10 @@ config GENERIC_BUG
>   	default y
>   	depends on BUG
>   
> +config GENERIC_BUG_RELATIVE_POINTERS
> +	def_bool y
> +	depends on GENERIC_BUG
> +
>   config SYS_SUPPORTS_APM_EMULATION
>   	default y if PMAC_APM_EMU
>   	bool
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index 338f36cd9934..d03d834042a1 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -12,7 +12,11 @@
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>   .macro EMIT_BUG_ENTRY addr,file,line,flags
>   	 .section __bug_table,"aw"
> +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS

As far as I understand, as soon as CONFIG_BUG is selected, GENERIC_BUG is automatically selected so 
GENERIC_BUG_RELATIVE_POINTERS is selected as well. Therefore this #ifndef is never possible.

>   5001:	 PPC_LONG \addr, 5002f
> +#else
> +5001:	 .4byte \addr - 5001b, 5002f - 5001b
> +#endif /* CONFIG_GENERIC_BUG_RELATIVE_POINTERS */
>   	 .short \line, \flags
>   	 .org 5001b+BUG_ENTRY_SIZE
>   	 .previous
> @@ -23,7 +27,11 @@
>   #else
>   .macro EMIT_BUG_ENTRY addr,file,line,flags
>   	 .section __bug_table,"aw"
> +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS

Same

>   5001:	 PPC_LONG \addr
> +#else
> +5001:	 .4byte \addr - 5001b
> +#endif /* CONFIG_GENERIC_BUG_RELATIVE_POINTERS */
>   	 .short \flags
>   	 .org 5001b+BUG_ENTRY_SIZE
>   	 .previous
> @@ -34,20 +42,45 @@
>   /* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
>      sizeof(struct bug_entry), respectively */
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
> +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS

Same

>   #define _EMIT_BUG_ENTRY				\
>   	".section __bug_table,\"aw\"\n"		\
>   	"2:\t" PPC_LONG "1b, %0\n"		\
>   	"\t.short %1, %2\n"			\
>   	".org 2b+%3\n"				\
>   	".previous\n"
> -#else
> +
> +#else /* relative pointers */
> +
> +#define _EMIT_BUG_ENTRY				\
> +	".section __bug_table,\"aw\"\n"		\
> +	"2:\t.4byte 1b - 2b, %0 - 2b\n"		\
> +	"\t.short %1, %2\n"			\
> +	".org 2b+%3\n"				\
> +	".previous\n"
> +#endif /* relative pointers */
> +
> +#else /* verbose */
> +
> +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS

Same

>   #define _EMIT_BUG_ENTRY				\
>   	".section __bug_table,\"aw\"\n"		\
>   	"2:\t" PPC_LONG "1b\n"			\
>   	"\t.short %2\n"				\
>   	".org 2b+%3\n"				\
>   	".previous\n"
> -#endif
> +
> +#else /* relative pointers */
> +
> +#define _EMIT_BUG_ENTRY				\
> +	".section __bug_table,\"aw\"\n"		\
> +	"2:\t.4byte 1b - 2b\n"		\
> +	"\t.short %2\n"				\
> +	".org 2b+%3\n"				\
> +	".previous\n"
> +
> +#endif /* relative pointers */
> +#endif /* verbose */
>   
>   #define BUG_ENTRY(insn, flags, ...)			\
>   	__asm__ __volatile__(				\
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 55c43a6c9111..5f7cf7e95767 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -1731,6 +1731,9 @@ static void print_bug_trap(struct pt_regs *regs)
>   #ifdef CONFIG_BUG
>   	const struct bug_entry *bug;
>   	unsigned long addr;
> +#ifdef CONFIG_DEBUG_BUGVERBOSE
> +	char *file;
> +#endif
>   
>   	if (regs->msr & MSR_PR)
>   		return;		/* not in kernel */
> @@ -1744,10 +1747,20 @@ static void print_bug_trap(struct pt_regs *regs)
>   		return;
>   
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
> +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS

Same

> +	file = bug->file;
> +#else /* relative pointers */
> +	file = (char *)bug + bug->file_disp;
> +#endif /* relative pointers */
>   	printf("kernel BUG at %s:%u!\n",
> -	       bug->file, bug->line);
> +	       file, bug->line);
>   #else
> -	printf("kernel BUG at %px!\n", (void *)bug->bug_addr);
> +#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS

Same

> +	addr = bug->addr;
> +#else /* relative pointers */
> +	addr = (unsigned long)bug + bug->bug_addr_disp;
> +#endif /* relative pointers */
> +	printf("kernel BUG at %px!\n", (void *)addr);
>   #endif
>   #endif /* CONFIG_BUG */
>   }
> 

Christophe
