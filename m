Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1DB45E7E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 07:35:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0lNc1Ddsz3bjG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 17:35:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0lNB3MNDz2xWj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 17:34:48 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0lN54tqlz9sSM;
 Fri, 26 Nov 2021 07:34:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqmbWjIUzD78; Fri, 26 Nov 2021 07:34:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0lN549GKz9sRr;
 Fri, 26 Nov 2021 07:34:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 806BA8B77D;
 Fri, 26 Nov 2021 07:34:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AIE-OL0El7RX; Fri, 26 Nov 2021 07:34:45 +0100 (CET)
Received: from [192.168.204.6] (unknown [192.168.204.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3AFE18B763;
 Fri, 26 Nov 2021 07:34:44 +0100 (CET)
Message-ID: <f9e53405-b5b9-15d1-eaf9-0616a5b87424@csgroup.eu>
Date: Fri, 26 Nov 2021 07:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] powerpc/code-patching: work around code patching
 verification in patching tests
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211126032249.1652080-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211126032249.1652080-1-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/11/2021 à 04:22, Nicholas Piggin a écrit :
> Code patching tests patch the stack and (non-module) vmalloc space now,
> which falls afoul of the new address check.
> 
> The stack patching can easily be fixed, but the vmalloc patching is more
> difficult. For now, add an ugly workaround to skip the check while the
> test code is running.

This really looks hacky.

To skip the test, you can call do_patch_instruction() instead of calling 
patch_instruction().

> 
> Fixes: 8b8a8f0ab3f55 ("powerpc/code-patching: Improve verification of patchability")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/lib/code-patching.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 5e2fe133639e..57e160963ab7 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -187,10 +187,12 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
>   
>   #endif /* CONFIG_STRICT_KERNEL_RWX */
>   
> +static bool skip_addr_verif = false;
> +
>   int patch_instruction(u32 *addr, struct ppc_inst instr)
>   {
>   	/* Make sure we aren't patching a freed init section */
> -	if (!kernel_text_address((unsigned long)addr))
> +	if (!skip_addr_verif && !kernel_text_address((unsigned long)addr))
>   		return 0;
>   
>   	return do_patch_instruction(addr, instr);
> @@ -738,11 +740,13 @@ static int __init test_code_patching(void)
>   {
>   	printk(KERN_DEBUG "Running code patching self-tests ...\n");
>   
> +	skip_addr_verif = true;
>   	test_branch_iform();
>   	test_branch_bform();
>   	test_create_function_call();
>   	test_translate_branch();
>   	test_prefixed_patching();
> +	skip_addr_verif = false;
>   
>   	return 0;
>   }
> 
