Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5099F3F038F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 14:10:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqRYc24lgz3cXS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 22:10:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqRY76v4vz30C6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 22:09:59 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GqRXx5tJpz9sTs;
 Wed, 18 Aug 2021 14:09:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJghIIpE6fMj; Wed, 18 Aug 2021 14:09:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GqRXx4r68z9sTX;
 Wed, 18 Aug 2021 14:09:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B5C48B809;
 Wed, 18 Aug 2021 14:09:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GYzTUrTTE8gb; Wed, 18 Aug 2021 14:09:53 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE9B98B7F3;
 Wed, 18 Aug 2021 14:09:52 +0200 (CEST)
Subject: Re: [PATCH v2] powerpc/mm: Fix set_memory_*() against concurrent
 accesses
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210818120518.3603172-1-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <01825174-2219-1693-313e-bc79c57b2302@csgroup.eu>
Date: Wed, 18 Aug 2021 14:09:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818120518.3603172-1-mpe@ellerman.id.au>
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
Cc: lvivier@redhat.com, jniethe5@gmail.com, aneesh.kumar@linux.ibm.com,
 npiggin@gmail.com, farosas@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/08/2021 à 14:05, Michael Ellerman a écrit :
> Laurent reported that STRICT_MODULE_RWX was causing intermittent crashes
> on one of his systems:
> 
>    kernel tried to execute exec-protected page (c008000004073278) - exploit attempt? (uid: 0)
>    BUG: Unable to handle kernel instruction fetch
>    Faulting instruction address: 0xc008000004073278
>    Oops: Kernel access of bad area, sig: 11 [#1]
>    LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>    Modules linked in: drm virtio_console fuse drm_panel_orientation_quirks ...
>    CPU: 3 PID: 44 Comm: kworker/3:1 Not tainted 5.14.0-rc4+ #12
>    Workqueue: events control_work_handler [virtio_console]
>    NIP:  c008000004073278 LR: c008000004073278 CTR: c0000000001e9de0
>    REGS: c00000002e4ef7e0 TRAP: 0400   Not tainted  (5.14.0-rc4+)
>    MSR:  800000004280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24002822 XER: 200400cf
>    ...
>    NIP fill_queue+0xf0/0x210 [virtio_console]
>    LR  fill_queue+0xf0/0x210 [virtio_console]
>    Call Trace:
>      fill_queue+0xb4/0x210 [virtio_console] (unreliable)
>      add_port+0x1a8/0x470 [virtio_console]
>      control_work_handler+0xbc/0x1e8 [virtio_console]
>      process_one_work+0x290/0x590
>      worker_thread+0x88/0x620
>      kthread+0x194/0x1a0
>      ret_from_kernel_thread+0x5c/0x64
> 
> Jordan, Fabiano & Murilo were able to reproduce and identify that the
> problem is caused by the call to module_enable_ro() in do_init_module(),
> which happens after the module's init function has already been called.
> 
> Our current implementation of change_page_attr() is not safe against
> concurrent accesses, because it invalidates the PTE before flushing the
> TLB and then installing the new PTE. That leaves a window in time where
> there is no valid PTE for the page, if another CPU tries to access the
> page at that time we see something like the fault above.
> 
> We can't simply switch to set_pte_at()/flush TLB, because our hash MMU
> code doesn't handle a set_pte_at() of a valid PTE. See [1].
> 
> But we do have pte_update(), which replaces the old PTE with the new,
> meaning there's no window where the PTE is invalid. And the hash MMU
> version hash__pte_update() deals with synchronising the hash page table
> correctly.
> 
> [1]: https://lore.kernel.org/linuxppc-dev/87y318wp9r.fsf@linux.ibm.com/
> 
> Fixes: 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
> Reported-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/mm/pageattr.c | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
> 
> v2: Use pte_update(..., ~0, pte_val(pte), ...) as suggested by Fabiano,
>      and ptep_get() as suggested by Christophe.
> 
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index 0876216ceee6..edea388e9d3f 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -18,16 +18,12 @@
>   /*
>    * Updates the attributes of a page in three steps:
>    *
> - * 1. invalidate the page table entry
> - * 2. flush the TLB
> - * 3. install the new entry with the updated attributes
> - *
> - * Invalidating the pte means there are situations where this will not work
> - * when in theory it should.
> - * For example:
> - * - removing write from page whilst it is being executed
> - * - setting a page read-only whilst it is being read by another CPU
> + * 1. take the page_table_lock
> + * 2. install the new entry with the updated attributes
> + * 3. flush the TLB
>    *
> + * This sequence is safe against concurrent updates, and also allows updating the
> + * attributes of a page currently being executed or accessed.
>    */
>   static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>   {
> @@ -36,9 +32,7 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>   
>   	spin_lock(&init_mm.page_table_lock);
>   
> -	/* invalidate the PTE so it's safe to modify */
> -	pte = ptep_get_and_clear(&init_mm, addr, ptep);
> -	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +	pte = ptep_get(ptep);
>   
>   	/* modify the PTE bits as desired, then apply */
>   	switch (action) {
> @@ -59,11 +53,14 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>   		break;
>   	}
>   
> -	set_pte_at(&init_mm, addr, ptep, pte);
> +	pte_update(&init_mm, addr, ptep, ~0UL, pte_val(pte), 0);
>   
>   	/* See ptesync comment in radix__set_pte_at() */
>   	if (radix_enabled())
>   		asm volatile("ptesync": : :"memory");
> +
> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
>   	spin_unlock(&init_mm.page_table_lock);
>   
>   	return 0;
> 
> base-commit: cbc06f051c524dcfe52ef0d1f30647828e226d30
> 
