Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF58733CDFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 07:33:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F03QB64Grz30Km
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 17:33:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F03Pr30ybz2yQn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 17:33:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F03Pk1Xh4z9v01l;
 Tue, 16 Mar 2021 07:32:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vUHhwfwKQPhE; Tue, 16 Mar 2021 07:32:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F03Pk0FWZz9v01k;
 Tue, 16 Mar 2021 07:32:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BC4748B77F;
 Tue, 16 Mar 2021 07:32:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pg-8ZBExJtzB; Tue, 16 Mar 2021 07:32:58 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 27E988B766;
 Tue, 16 Mar 2021 07:32:58 +0100 (CET)
Subject: Re: [PATCH v9 2/8] powerpc/lib/code-patching: Set up Strict RWX
 patching earlier
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-2-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <bd0e37b6-22cb-6dbc-1ef8-b6eac4b4c6e6@csgroup.eu>
Date: Tue, 16 Mar 2021 07:32:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316031741.1004850-2-jniethe5@gmail.com>
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
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v9: New to series
> ---
>   arch/powerpc/lib/code-patching.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 2333625b5e31..b28afa1133db 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -65,14 +65,11 @@ static int text_area_cpu_down(unsigned int cpu)
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

Please use WARN_ON(), see why at https://www.kernel.org/doc/html/latest/process/deprecated.html

>    */
> -static int __init setup_text_poke_area(void)
> +int __init poking_init(void)
>   {
>   	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
>   		"powerpc/text_poke:online", text_area_cpu_up,
> @@ -80,7 +77,6 @@ static int __init setup_text_poke_area(void)
>   
>   	return 0;
>   }
> -late_initcall(setup_text_poke_area);
>   
>   /*
>    * This can be called for kernel text or a module.
> 
