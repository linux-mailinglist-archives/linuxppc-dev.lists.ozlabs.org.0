Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0A83CC13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 20:20:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLVzF0ZsXz3cXr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 06:20:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLVyj64vJz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 06:20:13 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLVyc3Q97z4wxv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 06:20:08 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TLVyc34TRz4x2T; Fri, 26 Jan 2024 06:20:08 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=ozlabs.org)
X-Greylist: delayed 1623 seconds by postgrey-1.37 at gandalf; Fri, 26 Jan 2024 06:20:08 AEDT
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TLVyc1H63z4wxv
	for <linuxppc-dev@ozlabs.org>; Fri, 26 Jan 2024 06:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TLVMH3KJdz9tLb;
	Thu, 25 Jan 2024 19:52:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxrJCW9UbmCs; Thu, 25 Jan 2024 19:52:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TLVMH2KzFz9tCB;
	Thu, 25 Jan 2024 19:52:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 48AC98B775;
	Thu, 25 Jan 2024 19:52:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id eldIfBa_Yrhw; Thu, 25 Jan 2024 19:52:59 +0100 (CET)
Received: from [192.168.232.44] (unknown [192.168.232.44])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F28DE8B765;
	Thu, 25 Jan 2024 19:52:58 +0100 (CET)
Message-ID: <462d76fc-ae1d-42c4-8d84-5465f5be98d4@csgroup.eu>
Date: Thu, 25 Jan 2024 19:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/fadump: update kernel logs before fadump crash
 begins
Content-Language: fr-FR
To: Sourabh Jain <sourabhjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20200606044506.44551-1-sourabhjain@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200606044506.44551-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: mahesh@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, hbathini@linux.ibm.com, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 06/06/2020 à 06:45, Sourabh Jain a écrit :
> When we hit the fadump crash via the panic path the pstore update is
> missing. This is observed when commit 8341f2f222d7 ("sysrq: Use panic()
> to force a crash") changed the sysrq-trigger to take panic path instead
> of die path.
> 
> The PPC panic event handler addresses the system panic in two different
> ways based on the system configuration. It first allows the FADump (if
> configured) to handle the kernel panic else forwards the call to platform
> specific panic function. Now pstore update is missing only if FADump
> handles the kernel panic, the platform-specific panic function do update
> the pstore by calling panic_flush_kmsg_end function.
> 
> The simplest approach to handle this issue is to add pstore update in PPC
> panic handler before FADump handles the panic. But this leads to multiple
> pstore updates in case FADump is not configured and platform-specific
> panic function serves the kernel panic.
> 
> Hence the function panic_flush_kmsg_end (used by the platform-specific
> panic function to update the kernel logs) is split into two functions, one
> will update the pstore (called in ppc panic event handler) and others will
> flush the kmsg on the console (called in platform specific panic function).

Is this patch still relevant ?

It is still awaiting in patchwork and I see it has produced sparse 
warnings 
(https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200606044506.44551-1-sourabhjain@linux.ibm.com/)

In addition, it doesn't apply anymore so I'll discard it. Please 
re-submit if still needed.

Christophe



> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/bug.h         |  2 ++
>   arch/powerpc/kernel/setup-common.c     |  1 +
>   arch/powerpc/kernel/traps.c            | 12 +++++++++++-
>   arch/powerpc/platforms/ps3/setup.c     |  2 +-
>   arch/powerpc/platforms/pseries/setup.c |  2 +-
>   5 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index 338f36cd9934..9268551a69bc 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -118,6 +118,8 @@ extern void _exception_pkey(struct pt_regs *, unsigned long, int);
>   extern void die(const char *, struct pt_regs *, long);
>   extern bool die_will_crash(void);
>   extern void panic_flush_kmsg_start(void);
> +extern void panic_flush_kmsg_dump(void);
> +extern void panic_flush_kmsg_console(void);
>   extern void panic_flush_kmsg_end(void);
>   #endif /* !__ASSEMBLY__ */
>   
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 7f8c890360fe..2d546a9e8bb1 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -699,6 +699,7 @@ static int ppc_panic_event(struct notifier_block *this,
>   	 * want interrupts to be hard disabled.
>   	 */
>   	hard_irq_disable();
> +	panic_flush_kmsg_dump();
>   
>   	/*
>   	 * If firmware-assisted dump has been registered then trigger
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 82a3438300fd..bb6bc19992b3 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -169,15 +169,25 @@ extern void panic_flush_kmsg_start(void)
>   	bust_spinlocks(1);
>   }
>   
> -extern void panic_flush_kmsg_end(void)
> +extern void panic_flush_kmsg_dump(void)
>   {
>   	printk_safe_flush_on_panic();
>   	kmsg_dump(KMSG_DUMP_PANIC);
> +}
> +
> +extern void panic_flush_kmsg_console(void)
> +{
>   	bust_spinlocks(0);
>   	debug_locks_off();
>   	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
>   }
>   
> +extern void panic_flush_kmsg_end(void)
> +{
> +	panic_flush_kmsg_dump();
> +	panic_flush_kmsg_console();
> +}
> +
>   static unsigned long oops_begin(struct pt_regs *regs)
>   {
>   	int cpu;
> diff --git a/arch/powerpc/platforms/ps3/setup.c b/arch/powerpc/platforms/ps3/setup.c
> index b29368931c56..f96ba34284a1 100644
> --- a/arch/powerpc/platforms/ps3/setup.c
> +++ b/arch/powerpc/platforms/ps3/setup.c
> @@ -101,7 +101,7 @@ static void ps3_panic(char *str)
>   	printk("   System does not reboot automatically.\n");
>   	printk("   Please press POWER button.\n");
>   	printk("\n");
> -	panic_flush_kmsg_end();
> +	panic_flush_kmsg_console();
>   
>   	while(1)
>   		lv1_pause(1);
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index 0c8421dd01ab..66ecb88c4b8e 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -788,7 +788,7 @@ static void __init pSeries_setup_arch(void)
>   
>   static void pseries_panic(char *str)
>   {
> -	panic_flush_kmsg_end();
> +	panic_flush_kmsg_console();
>   	rtas_os_term(str);
>   }
>   
