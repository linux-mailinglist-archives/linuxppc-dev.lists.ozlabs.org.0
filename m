Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3675F29926
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 15:40:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459SDk2VWKzDq9T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 23:40:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="TSUZUAqp"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459SBv5GFczDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 23:39:02 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 459SBn3dnQz9vDbw;
 Fri, 24 May 2019 15:38:57 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TSUZUAqp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mOq06eIpRzHs; Fri, 24 May 2019 15:38:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 459SBn2ZRfz9vDbt;
 Fri, 24 May 2019 15:38:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1558705137; bh=dNQmp4NjVmmDcT7XPeKzhurMj7uO+tx6pR8p+ltkIPQ=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=TSUZUAqpWLUEP6N+IDvZjESvyQK7AfQ3ng8tklkbNkI/RfSssr6t8WlOKuWTXORY1
 DXGZ1+RhBkPvWDCQFDSbUwMIe7SdWopg19/zrV6yWk8E7bjLbVRfuHl4e7Aanok4mT
 TxTWlpn2sSU4ewAEOuGVcwQ/Z6LNOABNSGC7+Zi8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C63828B877;
 Fri, 24 May 2019 15:38:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JKziJ3JuUJGp; Fri, 24 May 2019 15:38:58 +0200 (CEST)
Received: from PO15451 (po15451.idsi0.si.c-s.fr [172.25.231.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A41ED8B7BF;
 Fri, 24 May 2019 15:38:58 +0200 (CEST)
Subject: Re: [RFC PATCH v2] powerpc: fix kexec failure on book3s/32
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
References: <8164abbe117d8353bb88132d7cfa8bc26a60ca66.1558677767.git.christophe.leroy@c-s.fr>
Message-ID: <8c3088b3-5fea-3cff-23f1-f6bc433d9a38@c-s.fr>
Date: Fri, 24 May 2019 15:38:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8164abbe117d8353bb88132d7cfa8bc26a60ca66.1558677767.git.christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/05/2019 à 08:05, Christophe Leroy a écrit :
> Fixes: 63b2bc619565 ("powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>

> ---
>   arch/powerpc/kernel/machine_kexec_32.c | 8 ++++++++
>   arch/powerpc/mm/book3s32/mmu.c         | 7 +++++--
>   arch/powerpc/mm/mmu_decl.h             | 2 ++
>   3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/machine_kexec_32.c b/arch/powerpc/kernel/machine_kexec_32.c
> index affe5dcce7f4..83e61a8f8468 100644
> --- a/arch/powerpc/kernel/machine_kexec_32.c
> +++ b/arch/powerpc/kernel/machine_kexec_32.c
> @@ -15,6 +15,7 @@
>   #include <asm/cacheflush.h>
>   #include <asm/hw_irq.h>
>   #include <asm/io.h>
> +#include <mm/mmu_decl.h>
>   
>   typedef void (*relocate_new_kernel_t)(
>   				unsigned long indirection_page,
> @@ -35,6 +36,8 @@ void default_machine_kexec(struct kimage *image)
>   	unsigned long page_list;
>   	unsigned long reboot_code_buffer, reboot_code_buffer_phys;
>   	relocate_new_kernel_t rnk;
> +	unsigned long bat_size = 128 << 10;
> +	unsigned long bat_mask = ~(bat_size - 1);
>   
>   	/* Interrupts aren't acceptable while we reboot */
>   	local_irq_disable();
> @@ -54,6 +57,11 @@ void default_machine_kexec(struct kimage *image)
>   	memcpy((void *)reboot_code_buffer, relocate_new_kernel,
>   						relocate_new_kernel_size);
>   
> +	printk(KERN_INFO "Reboot code buffer at %lx\n", reboot_code_buffer);
> +	mtsrin(mfsrin(reboot_code_buffer) & ~SR_NX, reboot_code_buffer);
> +	setibat(7, reboot_code_buffer & bat_mask, reboot_code_buffer_phys & bat_mask,
> +		bat_size, PAGE_KERNEL_TEXT);

A call to update_bats() have to be added here after setibat()

Christophe

> +
>   	flush_icache_range(reboot_code_buffer,
>   				reboot_code_buffer + KEXEC_CONTROL_PAGE_SIZE);
>   	printk(KERN_INFO "Bye!\n");
> diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
> index fc073cb2c517..7124700edb0f 100644
> --- a/arch/powerpc/mm/book3s32/mmu.c
> +++ b/arch/powerpc/mm/book3s32/mmu.c
> @@ -124,8 +124,8 @@ static unsigned int block_size(unsigned long base, unsigned long top)
>    * of 2 between 128k and 256M.
>    * Only for 603+ ...
>    */
> -static void setibat(int index, unsigned long virt, phys_addr_t phys,
> -		    unsigned int size, pgprot_t prot)
> +void setibat(int index, unsigned long virt, phys_addr_t phys,
> +	     unsigned int size, pgprot_t prot)
>   {
>   	unsigned int bl = (size >> 17) - 1;
>   	int wimgxpp;
> @@ -197,6 +197,9 @@ void mmu_mark_initmem_nx(void)
>   	if (cpu_has_feature(CPU_FTR_601))
>   		return;
>   
> +	if (IS_ENABLED(CONFIG_KEXEC))
> +		nb--;
> +
>   	for (i = 0; i < nb - 1 && base < top && top - base > (128 << 10);) {
>   		size = block_size(base, top);
>   		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
> index 7bac0aa2026a..478584d50cf2 100644
> --- a/arch/powerpc/mm/mmu_decl.h
> +++ b/arch/powerpc/mm/mmu_decl.h
> @@ -103,6 +103,8 @@ void print_system_hash_info(void);
>   extern void mapin_ram(void);
>   extern void setbat(int index, unsigned long virt, phys_addr_t phys,
>   		   unsigned int size, pgprot_t prot);
> +void setibat(int index, unsigned long virt, phys_addr_t phys,
> +	     unsigned int size, pgprot_t prot);
>   
>   extern int __map_without_bats;
>   extern unsigned int rtas_data, rtas_size;
> 
