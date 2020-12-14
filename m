Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A73AA2D939D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 08:23:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvXv02g8MzDqMy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 18:23:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvXsF4RKFzDqB9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 18:22:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CvXry3FBdz9tyV0;
 Mon, 14 Dec 2020 08:22:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Zl91CWZvKGJV; Mon, 14 Dec 2020 08:22:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CvXrx73wNz9tyTx;
 Mon, 14 Dec 2020 08:22:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF9048B77C;
 Mon, 14 Dec 2020 08:22:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BCE1bG2Uzjej; Mon, 14 Dec 2020 08:22:14 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7135C8B75B;
 Mon, 14 Dec 2020 08:22:14 +0100 (CET)
Subject: Re: [PATCH] powerpc/kup: Mark the kuap/keup function non __init
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201214071306.346399-1-aneesh.kumar@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2201d1a4-c2a8-eb9f-7c18-2f0f2b2643be@csgroup.eu>
Date: Mon, 14 Dec 2020 08:22:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214071306.346399-1-aneesh.kumar@linux.ibm.com>
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



Le 14/12/2020 à 08:13, Aneesh Kumar K.V a écrit :
> Kernel call these functions on cpu online and hence they should
> not be marked __init.

This is PPC64 only.

See commit 
https://github.com/linuxppc/linux/commit/67d53f30e23ec66aa7bbdd1592d5e64d46876190#diff-9799ddc8e77e666295031a560afc2a754d2f5fa0ddfb96335495b26a07511ad4

Christophe

> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   arch/powerpc/mm/book3s32/mmu.c   | 4 ++--
>   arch/powerpc/mm/book3s64/pkeys.c | 4 ++--
>   arch/powerpc/mm/init-common.c    | 2 +-
>   arch/powerpc/mm/nohash/8xx.c     | 4 ++--
>   4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
> index 23f60e97196e..8d9e90a99b51 100644
> --- a/arch/powerpc/mm/book3s32/mmu.c
> +++ b/arch/powerpc/mm/book3s32/mmu.c
> @@ -449,7 +449,7 @@ void __init print_system_hash_info(void)
>   }
>   
>   #ifdef CONFIG_PPC_KUEP
> -void __init setup_kuep(bool disabled)
> +void setup_kuep(bool disabled)
>   {
>   	pr_info("Activating Kernel Userspace Execution Prevention\n");
>   
> @@ -459,7 +459,7 @@ void __init setup_kuep(bool disabled)
>   #endif
>   
>   #ifdef CONFIG_PPC_KUAP
> -void __init setup_kuap(bool disabled)
> +void setup_kuap(bool disabled)
>   {
>   	pr_info("Activating Kernel Userspace Access Protection\n");
>   
> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index 2b7ded396db4..f1c6f264ed91 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -251,7 +251,7 @@ void __init pkey_early_init_devtree(void)
>   }
>   
>   #ifdef CONFIG_PPC_KUEP
> -void __init setup_kuep(bool disabled)
> +void setup_kuep(bool disabled)
>   {
>   	if (disabled)
>   		return;
> @@ -277,7 +277,7 @@ void __init setup_kuep(bool disabled)
>   #endif
>   
>   #ifdef CONFIG_PPC_KUAP
> -void __init setup_kuap(bool disabled)
> +void setup_kuap(bool disabled)
>   {
>   	if (disabled)
>   		return;
> diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
> index afdebb95bcae..c71af3978496 100644
> --- a/arch/powerpc/mm/init-common.c
> +++ b/arch/powerpc/mm/init-common.c
> @@ -47,7 +47,7 @@ static int __init parse_nosmap(char *p)
>   }
>   early_param("nosmap", parse_nosmap);
>   
> -void __ref setup_kup(void)
> +void setup_kup(void)
>   {
>   	setup_kuep(disable_kuep);
>   	setup_kuap(disable_kuap);
> diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
> index 231ca95f9ffb..9fba29b95b5a 100644
> --- a/arch/powerpc/mm/nohash/8xx.c
> +++ b/arch/powerpc/mm/nohash/8xx.c
> @@ -245,7 +245,7 @@ void set_context(unsigned long id, pgd_t *pgd)
>   }
>   
>   #ifdef CONFIG_PPC_KUEP
> -void __init setup_kuep(bool disabled)
> +void setup_kuep(bool disabled)
>   {
>   	if (disabled)
>   		return;
> @@ -257,7 +257,7 @@ void __init setup_kuep(bool disabled)
>   #endif
>   
>   #ifdef CONFIG_PPC_KUAP
> -void __init setup_kuap(bool disabled)
> +void setup_kuap(bool disabled)
>   {
>   	pr_info("Activating Kernel Userspace Access Protection\n");
>   
> 
