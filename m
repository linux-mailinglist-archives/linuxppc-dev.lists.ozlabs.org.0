Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E66375FDF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 07:51:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc0243KM7z3033
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 15:51:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc01k3NXwz2yWP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 15:51:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fc01d2BLGz9sZL;
 Fri,  7 May 2021 07:51:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PaJZXvjSDxwb; Fri,  7 May 2021 07:51:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fc01d1Bh4z9sZ5;
 Fri,  7 May 2021 07:51:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EAA588B764;
 Fri,  7 May 2021 07:51:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id t5iyKWY1SE09; Fri,  7 May 2021 07:51:16 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5099D8B81A;
 Fri,  7 May 2021 07:51:16 +0200 (CEST)
Subject: Re: [PATCH v12 2/8] powerpc/lib/code-patching: Set up Strict RWX
 patching earlier
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210506023449.3568630-1-jniethe5@gmail.com>
 <20210506023449.3568630-3-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <78562e67-8eac-8617-b445-e3aa36fb96b4@csgroup.eu>
Date: Fri, 7 May 2021 07:51:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210506023449.3568630-3-jniethe5@gmail.com>
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



Le 06/05/2021 à 04:34, Jordan Niethe a écrit :
> setup_text_poke_area() is a late init call so it runs before
> mark_rodata_ro() and after the init calls. This lets all the init code
> patching simply write to their locations. In the future, kprobes is
> going to allocate its instruction pages RO which means they will need
> setup_text__poke_area() to have been already called for their code
> patching. However, init_kprobes() (which allocates and patches some
> instruction pages) is an early init call so it happens before
> setup_text__poke_area().
> 
> start_kernel() calls poking_init() before any of the init calls. On
> powerpc, poking_init() is currently a nop. setup_text_poke_area() relies
> on kernel virtual memory, cpu hotplug and per_cpu_areas being setup.
> setup_per_cpu_areas(), boot_cpu_hotplug_init() and mm_init() are called
> before poking_init().
> 
> Turn setup_text_poke_area() into poking_init().
> 
> Reviewed-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> v9: New to series
> ---
>   arch/powerpc/lib/code-patching.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 870b30d9be2f..15296207e1ba 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -70,14 +70,11 @@ static int text_area_cpu_down(unsigned int cpu)
>   }
>   
>   /*
> - * Run as a late init call. This allows all the boot time patching to be done
> - * simply by patching the code, and then we're called here prior to
> - * mark_rodata_ro(), which happens after all init calls are run. Although
> - * BUG_ON() is rude, in this case it should only happen if ENOMEM, and we judge
> - * it as being preferable to a kernel that will crash later when someone tries
> - * to use patch_instruction().
> + * Although BUG_ON() is rude, in this case it should only happen if ENOMEM, and
> + * we judge it as being preferable to a kernel that will crash later when
> + * someone tries to use patch_instruction().
>    */
> -static int __init setup_text_poke_area(void)
> +int __init poking_init(void)
>   {
>   	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>   		"powerpc/text_poke:online", text_area_cpu_up,
> @@ -85,7 +82,6 @@ static int __init setup_text_poke_area(void)
>   
>   	return 0;
>   }
> -late_initcall(setup_text_poke_area);
>   
>   /*
>    * This can be called for kernel text or a module.
> 
