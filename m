Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E1A380374
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 07:49:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhHf92s5Tz3bns
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 15:49:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhHdn4Km7z2yWx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 15:48:56 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FhHdd5S95z9sdw;
 Fri, 14 May 2021 07:48:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORZIvF3Y8h2t; Fri, 14 May 2021 07:48:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FhHdd4GNGz9sc8;
 Fri, 14 May 2021 07:48:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 704118B7F7;
 Fri, 14 May 2021 07:48:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7aDUdIsKDGdw; Fri, 14 May 2021 07:48:53 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF4458B7F6;
 Fri, 14 May 2021 07:48:52 +0200 (CEST)
Subject: Re: [PATCH v13 3/8] powerpc/kprobes: Mark newly allocated probes as
 ROX
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210510011828.4006623-1-jniethe5@gmail.com>
 <20210510011828.4006623-4-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7bf00dc5-c681-2a5c-504b-9bf3f9e6a922@csgroup.eu>
Date: Fri, 14 May 2021 07:48:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510011828.4006623-4-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, cmr@codefail.de,
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/05/2021 à 03:18, Jordan Niethe a écrit :
> From: Russell Currey <ruscur@russell.cc>
> 
> Add the arch specific insn page allocator for powerpc. This allocates
> ROX pages if STRICT_KERNEL_RWX is enabled. These pages are only written
> to with patch_instruction() which is able to write RO pages.
> 
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> [jpn: Reword commit message, switch to __vmalloc_node_range()]
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v9: - vmalloc_exec() no longer exists
>      - Set the page to RW before freeing it
> v10: - use __vmalloc_node_range()
> v11: - Neaten up
> v12: - Switch from __vmalloc_node_range() to module_alloc()
> v13: Use strict_kernel_rwx_enabled()
> ---
>   arch/powerpc/kernel/kprobes.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 01ab2163659e..b517f3e6e7c5 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -19,11 +19,13 @@
>   #include <linux/extable.h>
>   #include <linux/kdebug.h>
>   #include <linux/slab.h>
> +#include <linux/moduleloader.h>
>   #include <asm/code-patching.h>
>   #include <asm/cacheflush.h>
>   #include <asm/sstep.h>
>   #include <asm/sections.h>
>   #include <asm/inst.h>
> +#include <asm/set_memory.h>
>   #include <linux/uaccess.h>
>   
>   DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
> @@ -103,6 +105,21 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
>   	return addr;
>   }
>   
> +void *alloc_insn_page(void)
> +{
> +	void *page;
> +
> +	page = module_alloc(PAGE_SIZE);
> +	if (!page)
> +		return NULL;
> +
> +	if (strict_kernel_rwx_enabled()) {

I'm not sure this is OK.

I think we need to make a new helper strict_module_rwx_enabled() because I don't think we want to 
call that when CONFIG_STRICT_MODULE_RWX is not selected.


> +		set_memory_ro((unsigned long)page, 1);
> +		set_memory_x((unsigned long)page, 1);
> +	}
> +	return page;
> +}
> +
>   int arch_prepare_kprobe(struct kprobe *p)
>   {
>   	int ret = 0;
> 
