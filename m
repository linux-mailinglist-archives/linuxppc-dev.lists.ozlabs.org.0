Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE4D302337
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 10:26:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPPch0lHZzDqs8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 20:26:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPPZj05TJzDqjV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 20:24:24 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DPPZS3QRvz9tyty;
 Mon, 25 Jan 2021 10:24:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cLihbwwS_1Q9; Mon, 25 Jan 2021 10:24:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DPPZS2NXlz9tytx;
 Mon, 25 Jan 2021 10:24:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6953C8B780;
 Mon, 25 Jan 2021 10:24:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8I_PYOnZ7bSW; Mon, 25 Jan 2021 10:24:21 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 171718B75F;
 Mon, 25 Jan 2021 10:24:21 +0100 (CET)
Subject: Re: [PATCH v4 2/2] powerpc/mce: Remove per cpu variables from MCE
 handlers
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20210122123244.34033-1-ganeshgr@linux.ibm.com>
 <20210122123244.34033-2-ganeshgr@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <90f24b44-1747-21f4-3829-7af20cf95e46@csgroup.eu>
Date: Mon, 25 Jan 2021 10:24:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210122123244.34033-2-ganeshgr@linux.ibm.com>
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/01/2021 à 13:32, Ganesh Goudar a écrit :
> Access to per-cpu variables requires translation to be enabled on
> pseries machine running in hash mmu mode, Since part of MCE handler
> runs in realmode and part of MCE handling code is shared between ppc
> architectures pseries and powernv, it becomes difficult to manage
> these variables differently on different architectures, So have
> these variables in paca instead of having them as per-cpu variables
> to avoid complications.
> 
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> v2: Dynamically allocate memory for machine check event info
> 
> v3: Remove check for hash mmu lpar, use memblock_alloc_try_nid
>      to allocate memory.
> 
> v4: Spliting the patch into two.
> ---
>   arch/powerpc/include/asm/mce.h     | 18 +++++++
>   arch/powerpc/include/asm/paca.h    |  4 ++
>   arch/powerpc/kernel/mce.c          | 79 ++++++++++++++++++------------
>   arch/powerpc/kernel/setup-common.c |  2 +-
>   4 files changed, 70 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 71f38e9248be..17dc451f0e45 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -916,7 +916,6 @@ void __init setup_arch(char **cmdline_p)
>   	/* On BookE, setup per-core TLB data structures. */
>   	setup_tlb_core_data();
>   #endif
> -

This line removal is really required for this patch ?

>   	/* Print various info about the machine that has been gathered so far. */
>   	print_system_info();
>   
> @@ -938,6 +937,7 @@ void __init setup_arch(char **cmdline_p)
>   	exc_lvl_early_init();
>   	emergency_stack_init();
>   
> +	mce_init();

You have to include mce.h to avoid build failure on PPC32.



>   	smp_release_cpus();
>   
>   	initmem_init();
> 
