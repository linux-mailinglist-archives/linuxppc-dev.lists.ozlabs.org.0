Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C69033CE0E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 07:45:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F03gv3QSvz30Hh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 17:45:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F03gS45KFz2y89
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 17:44:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F03gL5VfFz9v01q;
 Tue, 16 Mar 2021 07:44:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iZMNfwSwMDU3; Tue, 16 Mar 2021 07:44:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F03gL4Y64z9v01p;
 Tue, 16 Mar 2021 07:44:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A9218B77F;
 Tue, 16 Mar 2021 07:44:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ujGQVnkz8P6s; Tue, 16 Mar 2021 07:44:47 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B80488B766;
 Tue, 16 Mar 2021 07:44:46 +0100 (CET)
Subject: Re: [PATCH v9 3/8] powerpc/kprobes: Mark newly allocated probes as RO
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-3-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6d04f7c6-8950-2666-13cc-d2f7bf788952@csgroup.eu>
Date: Tue, 16 Mar 2021 07:44:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316031741.1004850-3-jniethe5@gmail.com>
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, npiggin@gmail.com,
 naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/03/2021 à 04:17, Jordan Niethe a écrit :
> From: Russell Currey <ruscur@russell.cc>
> 
> With CONFIG_STRICT_KERNEL_RWX=y and CONFIG_KPROBES=y, there will be one
> W+X page at boot by default.  This can be tested with
> CONFIG_PPC_PTDUMP=y and CONFIG_PPC_DEBUG_WX=y set, and checking the
> kernel log during boot.
> 

This text is confusing. I don't understand what is the status before the patch, and what is the 
status after.

"there will be one ...", does it mean after the patch ?

> Add an arch specific insn page allocator which returns RO pages if
> STRICT_KERNEL_RWX is enabled. This page is only written to with
> patch_instruction() which is able to write RO pages.

"an" or "the" arch specific insn page allocator ?

> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> [jpn: Reword commit message, switch from vmalloc_exec(), add
>        free_insn_page()]
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v9: - vmalloc_exec() no longer exists
>      - Set the page to RW before freeing it
> ---
>   arch/powerpc/kernel/kprobes.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 01ab2163659e..bb7e4d321988 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -25,6 +25,8 @@
>   #include <asm/sections.h>
>   #include <asm/inst.h>
>   #include <linux/uaccess.h>
> +#include <linux/set_memory.h>
> +#include <linux/vmalloc.h>
>   
>   DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
>   DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> @@ -103,6 +105,26 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
>   	return addr;
>   }
>   
> +void *alloc_insn_page(void)
> +{
> +	void *page = vmalloc(PAGE_SIZE);

Can't do that on book3s/32, see https://github.com/linuxppc/linux/commit/6ca05532 and 
https://github.com/linuxppc/linux/commit/7fbc22ce

Should do:
	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, GFP_KERNEL,
				    PAGE_KERNEL_ROX, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
				    __builtin_return_address(0));


To keep it simple, you'll probably need to define MODULES_VADDR and MODULES_END as resp 
VMALLOC_START and VMALLOC_END when they are not defined, maybe in asm/pgtable.h

> +
> +	if (!page)
> +		return NULL;
> +
> +	set_memory_ro((unsigned long)page, 1);
> +	set_memory_x((unsigned long)page, 1);
> +
> +	return page;
> +}
> +
> +void free_insn_page(void *page)
> +{
> +	set_memory_nx((unsigned long)page, 1);
> +	set_memory_rw((unsigned long)page, 1);
> +	vfree(page);
> +}
> +
>   int arch_prepare_kprobe(struct kprobe *p)
>   {
>   	int ret = 0;
> 
