Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 681C62C9788
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 07:27:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClXFw58s8zDqQY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 17:27:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClXD15bh2zDqrW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 17:25:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4ClXCj3vNPz9txxS;
 Tue,  1 Dec 2020 07:25:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JYY3puAw4Z9I; Tue,  1 Dec 2020 07:25:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4ClXCj35B8z9txxR;
 Tue,  1 Dec 2020 07:25:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 413318B79E;
 Tue,  1 Dec 2020 07:25:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Wz7KSnzgPyUC; Tue,  1 Dec 2020 07:25:38 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E5EF98B769;
 Tue,  1 Dec 2020 07:25:37 +0100 (CET)
Subject: Re: [PATCH v2] powerpc: Allow relative pointers in bug table entries
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201201005203.15210-1-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a7ae5c4e-2ea6-5601-9f70-4e0b2e5ba1e7@csgroup.eu>
Date: Tue, 1 Dec 2020 07:25:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201005203.15210-1-jniethe5@gmail.com>
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



Le 01/12/2020 à 01:52, Jordan Niethe a écrit :
> This enables GENERIC_BUG_RELATIVE_POINTERS on Power so that 32-bit
> offsets are stored in the bug entries rather than 64-bit pointers.
> While this doesn't save space for 32-bit machines, use it anyway so
> there is only one code path.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu> # on PPC32

> ---
> v2: Remove non-relative pointers code
> ---
>   arch/powerpc/Kconfig           | 4 ++++
>   arch/powerpc/include/asm/bug.h | 8 ++++----
>   arch/powerpc/xmon/xmon.c       | 4 ++--
>   3 files changed, 10 insertions(+), 6 deletions(-)
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
> index 338f36cd9934..ba0500872cce 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -12,7 +12,7 @@
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>   .macro EMIT_BUG_ENTRY addr,file,line,flags
>   	 .section __bug_table,"aw"
> -5001:	 PPC_LONG \addr, 5002f
> +5001:	 .4byte \addr - 5001b, 5002f - 5001b
>   	 .short \line, \flags
>   	 .org 5001b+BUG_ENTRY_SIZE
>   	 .previous
> @@ -23,7 +23,7 @@
>   #else
>   .macro EMIT_BUG_ENTRY addr,file,line,flags
>   	 .section __bug_table,"aw"
> -5001:	 PPC_LONG \addr
> +5001:	 .4byte \addr - 5001b
>   	 .short \flags
>   	 .org 5001b+BUG_ENTRY_SIZE
>   	 .previous
> @@ -36,14 +36,14 @@
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>   #define _EMIT_BUG_ENTRY				\
>   	".section __bug_table,\"aw\"\n"		\
> -	"2:\t" PPC_LONG "1b, %0\n"		\
> +	"2:\t.4byte 1b - 2b, %0 - 2b\n"		\
>   	"\t.short %1, %2\n"			\
>   	".org 2b+%3\n"				\
>   	".previous\n"
>   #else
>   #define _EMIT_BUG_ENTRY				\
>   	".section __bug_table,\"aw\"\n"		\
> -	"2:\t" PPC_LONG "1b\n"			\
> +	"2:\t.4byte 1b - 2b\n"			\
>   	"\t.short %2\n"				\
>   	".org 2b+%3\n"				\
>   	".previous\n"
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 55c43a6c9111..9704c81aff7d 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -1745,9 +1745,9 @@ static void print_bug_trap(struct pt_regs *regs)
>   
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
>   	printf("kernel BUG at %s:%u!\n",
> -	       bug->file, bug->line);
> +	       (char *)bug + bug->file_disp, bug->line);
>   #else
> -	printf("kernel BUG at %px!\n", (void *)bug->bug_addr);
> +	printf("kernel BUG at %px!\n", (void *)bug + bug->bug_addr_disp);
>   #endif
>   #endif /* CONFIG_BUG */
>   }
> 
