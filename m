Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BB5460149
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 20:52:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1j2B1N0Rz3cY3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 06:52:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1j1l4GHgz3bWk
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 06:52:07 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J1j1Z38gtz9sSB;
 Sat, 27 Nov 2021 20:52:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilUkimyitbCl; Sat, 27 Nov 2021 20:52:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J1j1Z28KWz9sS0;
 Sat, 27 Nov 2021 20:52:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC0E48B7C5;
 Sat, 27 Nov 2021 13:00:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4V67AX2ocv56; Sat, 27 Nov 2021 13:00:33 +0100 (CET)
Received: from [192.168.232.41] (po21514.idsi0.si.c-s.fr [192.168.232.41])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 76C558B7B2;
 Sat, 27 Nov 2021 13:00:33 +0100 (CET)
Message-ID: <944046f0-f656-4eea-e8f0-c3bf2b6a9885@csgroup.eu>
Date: Sat, 27 Nov 2021 13:00:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] powerpc/mm: fix early initialization failure for MMUs
 with no hash table
Content-Language: fr-FR
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20211127020448.4008507-1-vladimir.oltean@nxp.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211127020448.4008507-1-vladimir.oltean@nxp.com>
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
Cc: Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/11/2021 à 03:04, Vladimir Oltean a écrit :
> The blamed patch attempted to do a trivial conversion of
> map_mem_in_cams() by adding an extra "bool init" argument, but by
> mistake, changed the way in which two call sites pass the other boolean
> argument, "bool dry_run".
> 
> As a result, early_init_this_mmu() now calls map_mem_in_cams() with
> dry_run=true, and setup_initial_memory_limit() calls with dry_run=false,
> both of which are unintended changes.
> 
> This makes the kernel boot process hang here:
> 
> [    0.045211] e500 family performance monitor hardware support registered
> [    0.051891] rcu: Hierarchical SRCU implementation.
> [    0.057791] smp: Bringing up secondary CPUs ...
> 
> Issue noticed on a Freescale T1040.
> 
> Fixes: 52bda69ae8b5 ("powerpc/fsl_booke: Tell map_mem_in_cams() if init is done")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for you patch.

However, it should already be fixed in 5.16-rc2 with the following 
commit : 
https://github.com/torvalds/linux/commit/5b54860943dc4681be5de2fc287408c7ce274dfc

Christophe

> ---
>   arch/powerpc/mm/nohash/tlb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
> index 89353d4f5604..647bf454a0fa 100644
> --- a/arch/powerpc/mm/nohash/tlb.c
> +++ b/arch/powerpc/mm/nohash/tlb.c
> @@ -645,7 +645,7 @@ static void early_init_this_mmu(void)
>   
>   		if (map)
>   			linear_map_top = map_mem_in_cams(linear_map_top,
> -							 num_cams, true, true);
> +							 num_cams, false, true);
>   	}
>   #endif
>   
> @@ -766,7 +766,7 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
>   		num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
>   
>   		linear_sz = map_mem_in_cams(first_memblock_size, num_cams,
> -					    false, true);
> +					    true, true);
>   
>   		ppc64_rma_size = min_t(u64, linear_sz, 0x40000000);
>   	} else
> 
