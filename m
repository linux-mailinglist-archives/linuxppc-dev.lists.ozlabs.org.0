Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72375416BAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 08:42:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HG2XB22dbz3bYL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 16:42:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HG2Wg2yJVz2yPj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 16:42:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HG2WW501Sz9sTt;
 Fri, 24 Sep 2021 08:41:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JTviW7YgVGAC; Fri, 24 Sep 2021 08:41:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HG2WW2Rssz9sTq;
 Fri, 24 Sep 2021 08:41:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DF3D8B77B;
 Fri, 24 Sep 2021 08:41:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QnfXEWwF-9YL; Fri, 24 Sep 2021 08:41:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.215])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 92E488B763;
 Fri, 24 Sep 2021 08:41:58 +0200 (CEST)
Subject: Re: [PATCH] powerpc: don't select KFENCE on platform PPC_FSL_BOOK3E
To: Liu Shixin <liushixin2@huawei.com>, Marco Elver <elver@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <20210924063927.1341241-1-liushixin2@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f8d12860-56d7-5697-7cba-3cac95bb0a1c@csgroup.eu>
Date: Fri, 24 Sep 2021 08:41:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210924063927.1341241-1-liushixin2@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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



Le 24/09/2021 à 08:39, Liu Shixin a écrit :
> On platform PPC_FSL_BOOK3E, all lowmem is managed by tlbcam. That means
> we didn't really map the kfence pool with page granularity. Therefore,
> if KFENCE is enabled, the system will hit the following panic:

Could you please explain a bit more what the problem is ?

KFENCE has been implemented with the same logic as DEBUG_PAGEALLOC.

DEBUG_PAGEALLOC is enabled on FSL_BOOK3E.

In MMU_setup(), __map_without_ltlbs is set to 1 when KFENCE is enabled.

__map_without_ltlbs should disable the use of tlbcam.


So what's wrong really ?

Does DEBUG_PAGEALLOC work on FSL_BOOK3E ?

Thanks
Christophe

> 
>      BUG: Kernel NULL pointer dereference on read at 0x00000000
>      Faulting instruction address: 0xc01de598
>      Oops: Kernel access of bad area, sig: 11 [#1]
>      BE PAGE_SIZE=4K SMP NR_CPUS=4 MPC8544 DS
>      Dumping ftrace buffer:
>         (ftrace buffer empty)
>      Modules linked in:
>      CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.12.0-rc3+ #298
>      NIP:  c01de598 LR: c08ae9c4 CTR: 00000000
>      REGS: c0b4bea0 TRAP: 0300   Not tainted  (5.12.0-rc3+)
>      MSR:  00021000 <CE,ME>  CR: 24000228  XER: 20000000
>      DEAR: 00000000 ESR: 00000000
>      GPR00: c08ae9c4 c0b4bf60 c0ad64e0 ef720000 00021000 00000000 00000000 00000200
>      GPR08: c0ad5000 00000000 00000000 00000004 00000000 008fbb30 00000000 00000000
>      GPR16: 00000000 00000000 00000000 00000000 c0000000 00000000 00000000 00000000
>      GPR24: c08ca004 c08ca004 c0b6a0e0 c0b60000 c0b58f00 c0850000 c08ca000 ef720000
>      NIP [c01de598] kfence_protect+0x44/0x6c
>      LR [c08ae9c4] kfence_init+0xfc/0x2a4
>      Call Trace:
>      [c0b4bf60] [efffe160] 0xefffe160 (unreliable)
>      [c0b4bf70] [c08ae9c4] kfence_init+0xfc/0x2a4
>      [c0b4bfb0] [c0894d3c] start_kernel+0x3bc/0x574
>      [c0b4bff0] [c0000470] set_ivor+0x14c/0x188
>      Instruction dump:
>      7c0802a6 8109d594 546a653a 90010014 54630026 39200000 7d48502e 2c0a0000
>      41820010 554a0026 5469b53a 7d295214 <81490000> 38831000 554a003c 91490000
>      random: get_random_bytes called from print_oops_end_marker+0x40/0x78 with crng_init=0
>      ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---
>   arch/powerpc/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d46db0bfb998..cffd57bcb5e4 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -185,7 +185,7 @@ config PPC
>   	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
>   	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
>   	select HAVE_ARCH_KGDB
> -	select HAVE_ARCH_KFENCE			if PPC32
> +	select HAVE_ARCH_KFENCE			if PPC32 && !PPC_FSL_BOOK3E
>   	select HAVE_ARCH_MMAP_RND_BITS
>   	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>   	select HAVE_ARCH_NVRAM_OPS
> 
