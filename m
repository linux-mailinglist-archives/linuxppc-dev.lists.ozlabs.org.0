Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6C0125C50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 08:55:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dkgV07KTzDqnD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 18:55:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="MOyvva5S"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dkdP6dZwzDqlw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 18:53:13 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47dkdJ4mSzz9txgL;
 Thu, 19 Dec 2019 08:53:08 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=MOyvva5S; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Yl4jPQU28taN; Thu, 19 Dec 2019 08:53:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47dkdJ3dVkz9txgF;
 Thu, 19 Dec 2019 08:53:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1576741988; bh=J+M4CSsDexfazEE7cIupqVoa2IVWu8lLK22+8tVd7IY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MOyvva5SX6r9GkG0qXxexfATV9IaghZPLE75Jnxe8txle4M+LobnC2ie89OvU7Cqh
 N5GtGdDAiiKNJzgIEPtgx76ZnnVppqmLECmXr+hdDjhH1o6kjM9IcCtcbR7hFBQAgV
 nfpwFW6mbuidZYmgDcnJ7sM/xDZWUKwBFFAAokb8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 71ED28B787;
 Thu, 19 Dec 2019 08:53:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CiNZczxhXyb4; Thu, 19 Dec 2019 08:53:09 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 230378B756;
 Thu, 19 Dec 2019 08:53:08 +0100 (CET)
Subject: Re: [PATCH v4 4/4] powerpc: Book3S 64-bit "heavyweight" KASAN support
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
References: <20191219003630.31288-1-dja@axtens.net>
 <20191219003630.31288-5-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c4d37067-829f-cd7d-7e94-0ec2223cce71@c-s.fr>
Date: Thu, 19 Dec 2019 07:53:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20191219003630.31288-5-dja@axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 12/19/2019 12:36 AM, Daniel Axtens wrote:
> KASAN support on Book3S is a bit tricky to get right:
> 
>   - It would be good to support inline instrumentation so as to be able to
>     catch stack issues that cannot be caught with outline mode.
> 
>   - Inline instrumentation requires a fixed offset.
> 
>   - Book3S runs code in real mode after booting. Most notably a lot of KVM
>     runs in real mode, and it would be good to be able to instrument it.
> 
>   - Because code runs in real mode after boot, the offset has to point to
>     valid memory both in and out of real mode.
> 
>      [ppc64 mm note: The kernel installs a linear mapping at effective
>      address c000... onward. This is a one-to-one mapping with physical
>      memory from 0000... onward. Because of how memory accesses work on
>      powerpc 64-bit Book3S, a kernel pointer in the linear map accesses the
>      same memory both with translations on (accessing as an 'effective
>      address'), and with translations off (accessing as a 'real
>      address'). This works in both guests and the hypervisor. For more
>      details, see s5.7 of Book III of version 3 of the ISA, in particular
>      the Storage Control Overview, s5.7.3, and s5.7.5 - noting that this
>      KASAN implementation currently only supports Radix.]
> 
> One approach is just to give up on inline instrumentation. This way all
> checks can be delayed until after everything set is up correctly, and the
> address-to-shadow calculations can be overridden. However, the features and
> speed boost provided by inline instrumentation are worth trying to do
> better.
> 
> If _at compile time_ it is known how much contiguous physical memory a
> system has, the top 1/8th of the first block of physical memory can be set
> aside for the shadow. This is a big hammer and comes with 3 big
> consequences:
> 
>   - there's no nice way to handle physically discontiguous memory, so only
>     the first physical memory block can be used.
> 
>   - kernels will simply fail to boot on machines with less memory than
>     specified when compiling.
> 
>   - kernels running on machines with more memory than specified when
>     compiling will simply ignore the extra memory.
> 
> Implement and document KASAN this way. The current implementation is Radix
> only.
> 
> Despite the limitations, it can still find bugs,
> e.g. http://patchwork.ozlabs.org/patch/1103775/
> 
> At the moment, this physical memory limit must be set _even for outline
> mode_. This may be changed in a later series - a different implementation
> could be added for outline mode that dynamically allocates shadow at a
> fixed offset. For example, see https://patchwork.ozlabs.org/patch/795211/
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Balbir Singh <bsingharora@gmail.com> # ppc64 out-of-line radix version
> Cc: Christophe Leroy <christophe.leroy@c-s.fr> # ppc32 version
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> 
> ---
> Changes since v3:
>   - Address further feedback from Christophe.
>   - Drop changes to stack walking, it looks like the issue I observed is
>     related to that particular stack, not stack-walking generally.
> 
> Changes since v2:
> 
>   - Address feedback from Christophe around cleanups and docs.
>   - Address feedback from Balbir: at this point I don't have a good solution
>     for the issues you identify around the limitations of the inline implementation
>     but I think that it's worth trying to get the stack instrumentation support.
>     I'm happy to have an alternative and more flexible outline mode - I had
>     envisoned this would be called 'lightweight' mode as it imposes fewer restrictions.
>     I've linked to your implementation. I think it's best to add it in a follow-up series.
>   - Made the default PHYS_MEM_SIZE_FOR_KASAN value 1024MB. I think most people have
>     guests with at least that much memory in the Radix 64s case so it's a much
>     saner default - it means that if you just turn on KASAN without reading the
>     docs you're much more likely to have a bootable kernel, which you will never
>     have if the value is set to zero! I'm happy to bikeshed the value if we want.
> 
> Changes since v1:
>   - Landed kasan vmalloc support upstream
>   - Lots of feedback from Christophe.
> 
> Changes since the rfc:
> 
>   - Boots real and virtual hardware, kvm works.
> 
>   - disabled reporting when we're checking the stack for exception
>     frames. The behaviour isn't wrong, just incompatible with KASAN.
> 
>   - Documentation!
> 
>   - Dropped old module stuff in favour of KASAN_VMALLOC.
> 
> The bugs with ftrace and kuap were due to kernel bloat pushing
> prom_init calls to be done via the plt. Because we did not have
> a relocatable kernel, and they are done very early, this caused
> everything to explode. Compile with CONFIG_RELOCATABLE!
> ---
>   Documentation/dev-tools/kasan.rst            |   8 +-
>   Documentation/powerpc/kasan.txt              | 112 ++++++++++++++++++-
>   arch/powerpc/Kconfig                         |   2 +
>   arch/powerpc/Kconfig.debug                   |  21 ++++
>   arch/powerpc/Makefile                        |  11 ++
>   arch/powerpc/include/asm/book3s/64/hash.h    |   4 +
>   arch/powerpc/include/asm/book3s/64/pgtable.h |   7 ++
>   arch/powerpc/include/asm/book3s/64/radix.h   |   5 +
>   arch/powerpc/include/asm/kasan.h             |  21 +++-
>   arch/powerpc/kernel/prom.c                   |  61 +++++++++-
>   arch/powerpc/mm/kasan/Makefile               |   1 +
>   arch/powerpc/mm/kasan/init_book3s_64.c       |  70 ++++++++++++
>   arch/powerpc/platforms/Kconfig.cputype       |   1 +
>   13 files changed, 316 insertions(+), 8 deletions(-)
>   create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c
> 
> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
> index 296e51c2f066..f18268cbdc33 100644
> --- a/arch/powerpc/include/asm/kasan.h
> +++ b/arch/powerpc/include/asm/kasan.h
> @@ -2,6 +2,9 @@
>   #ifndef __ASM_KASAN_H
>   #define __ASM_KASAN_H
>   
> +#include <asm/page.h>
> +#include <asm/pgtable.h>

What do you need asm/pgtable.h for ?

Build failure due to circular inclusion of asm/pgtable.h:

   CC      arch/powerpc/kernel/asm-offsets.s
In file included from ./arch/powerpc/include/asm/nohash/32/pgtable.h:77:0,
                  from ./arch/powerpc/include/asm/nohash/pgtable.h:8,
                  from ./arch/powerpc/include/asm/pgtable.h:20,
                  from ./arch/powerpc/include/asm/kasan.h:6,
                  from ./include/linux/kasan.h:14,
                  from ./include/linux/slab.h:136,
                  from ./include/linux/crypto.h:19,
                  from ./include/crypto/hash.h:11,
                  from ./include/linux/uio.h:10,
                  from ./include/linux/socket.h:8,
                  from ./include/linux/compat.h:15,
                  from arch/powerpc/kernel/asm-offsets.c:14:
./include/asm-generic/fixmap.h: In function 'fix_to_virt':
./arch/powerpc/include/asm/fixmap.h:28:22: error: 'KASAN_SHADOW_START' 
undeclared (first use in this function)
  #define FIXADDR_TOP (KASAN_SHADOW_START - PAGE_SIZE)
                       ^
./include/asm-generic/fixmap.h:21:27: note: in expansion of macro 
'FIXADDR_TOP'
  #define __fix_to_virt(x) (FIXADDR_TOP - ((x) << PAGE_SHIFT))
                            ^
./include/asm-generic/fixmap.h:33:9: note: in expansion of macro 
'__fix_to_virt'
   return __fix_to_virt(idx);
          ^
./arch/powerpc/include/asm/fixmap.h:28:22: note: each undeclared 
identifier is reported only once for each function it appears in
  #define FIXADDR_TOP (KASAN_SHADOW_START - PAGE_SIZE)
                       ^
./include/asm-generic/fixmap.h:21:27: note: in expansion of macro 
'FIXADDR_TOP'
  #define __fix_to_virt(x) (FIXADDR_TOP - ((x) << PAGE_SHIFT))
                            ^
./include/asm-generic/fixmap.h:33:9: note: in expansion of macro 
'__fix_to_virt'
   return __fix_to_virt(idx);
          ^
In file included from ./include/linux/bug.h:5:0,
                  from ./include/linux/thread_info.h:12,
                  from ./include/asm-generic/preempt.h:5,
                  from ./arch/powerpc/include/generated/asm/preempt.h:1,
                  from ./include/linux/preempt.h:78,
                  from ./include/linux/spinlock.h:51,
                  from ./include/linux/seqlock.h:36,
                  from ./include/linux/time.h:6,
                  from ./include/linux/compat.h:10,
                  from arch/powerpc/kernel/asm-offsets.c:14:
./include/asm-generic/fixmap.h: In function 'virt_to_fix':
./arch/powerpc/include/asm/fixmap.h:28:22: error: 'KASAN_SHADOW_START' 
undeclared (first use in this function)
  #define FIXADDR_TOP (KASAN_SHADOW_START - PAGE_SIZE)
                       ^
./arch/powerpc/include/asm/bug.h:73:27: note: in definition of macro 
'BUG_ON'
   if (__builtin_constant_p(x)) {    \
                            ^
./include/asm-generic/fixmap.h:38:18: note: in expansion of macro 
'FIXADDR_TOP'
   BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
                   ^
In file included from ./arch/powerpc/include/asm/nohash/32/pgtable.h:77:0,
                  from ./arch/powerpc/include/asm/nohash/pgtable.h:8,
                  from ./arch/powerpc/include/asm/pgtable.h:20,
                  from ./arch/powerpc/include/asm/kasan.h:6,
                  from ./include/linux/kasan.h:14,
                  from ./include/linux/slab.h:136,
                  from ./include/linux/crypto.h:19,
                  from ./include/crypto/hash.h:11,
                  from ./include/linux/uio.h:10,
                  from ./include/linux/socket.h:8,
                  from ./include/linux/compat.h:15,
                  from arch/powerpc/kernel/asm-offsets.c:14:
./arch/powerpc/include/asm/fixmap.h: In function '__set_fixmap':
./arch/powerpc/include/asm/fixmap.h:28:22: error: 'KASAN_SHADOW_START' 
undeclared (first use in this function)
  #define FIXADDR_TOP (KASAN_SHADOW_START - PAGE_SIZE)
                       ^
./include/asm-generic/fixmap.h:21:27: note: in expansion of macro 
'FIXADDR_TOP'
  #define __fix_to_virt(x) (FIXADDR_TOP - ((x) << PAGE_SHIFT))
                            ^
./arch/powerpc/include/asm/fixmap.h:102:18: note: in expansion of macro 
'__fix_to_virt'
   map_kernel_page(__fix_to_virt(idx), phys, flags);
                   ^
make[2]: *** [arch/powerpc/kernel/asm-offsets.s] Error 1
make[1]: *** [prepare0] Error 2
make: *** [sub-make] Error 2



> +
>   #ifdef CONFIG_KASAN
>   #define _GLOBAL_KASAN(fn)	_GLOBAL(__##fn)
>   #define _GLOBAL_TOC_KASAN(fn)	_GLOBAL_TOC(__##fn)
> @@ -14,13 +17,19 @@
>   
>   #ifndef __ASSEMBLY__
>   
> -#include <asm/page.h>
> +#ifdef CONFIG_KASAN
> +void kasan_init(void);
> +#else
> +static inline void kasan_init(void) { }
> +#endif

I don't think it is worth moving this. Just keep everything out of the 
#ifdef CONFIG_PPC32. Having undefined/unused functions there shouldn't 
matter.

>   
>   #define KASAN_SHADOW_SCALE_SHIFT	3
>   
>   #define KASAN_SHADOW_START	(KASAN_SHADOW_OFFSET + \
>   				 (PAGE_OFFSET >> KASAN_SHADOW_SCALE_SHIFT))
>   
> +#ifdef CONFIG_PPC32
> +
>   #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
>   
>   #define KASAN_SHADOW_END	0UL
> @@ -30,11 +39,17 @@

Keep the block below out of the CONFIG_PPC32 ifdef, don't need to move 
kasan_init()

>   #ifdef CONFIG_KASAN
>   void kasan_early_init(void);
>   void kasan_mmu_init(void);
> -void kasan_init(void);
>   #else
> -static inline void kasan_init(void) { }
>   static inline void kasan_mmu_init(void) { }
>   #endif
> +#endif
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +
> +#define KASAN_SHADOW_SIZE ((u64)CONFIG_PHYS_MEM_SIZE_FOR_KASAN * \
> +				1024 * 1024 * 1 / 8)

What about:

(ASM_CONST(CONFIG_PHYS_MEM_SIZE_FOR_KASAN) * SZ_1G) >> 
KASAN_SHADOW_SCALE_SHIFT

> +
> +#endif /* CONFIG_PPC_BOOK3S_64 */
>   
>   #endif /* __ASSEMBLY */
>   #endif
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 6620f37abe73..f8ef0074b320 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -72,6 +72,7 @@ unsigned long tce_alloc_start, tce_alloc_end;
>   u64 ppc64_rma_size;
>   #endif
>   static phys_addr_t first_memblock_size;
> +static phys_addr_t top_phys_addr;
>   static int __initdata boot_cpu_count;
>   
>   static int __init early_parse_mem(char *p)
> @@ -449,6 +450,26 @@ static bool validate_mem_limit(u64 base, u64 *size)
>   {
>   	u64 max_mem = 1UL << (MAX_PHYSMEM_BITS);
>   
> +	/*
> +	 * To handle the NUMA/discontiguous memory case, don't allow a block
> +	 * to be added if it falls completely beyond the configured physical
> +	 * memory. Print an informational message.
> +	 *
> +	 * Frustratingly we also see this with qemu - it seems to split the
> +	 * specified memory into a number of smaller blocks. If this happens
> +	 * under qemu, it probably represents misconfiguration. So we want
> +	 * the message to be noticeable, but not shouty.
> +	 *
> +	 * See Documentation/powerpc/kasan.txt
> +	 */
> +	if (IS_ENABLED(CONFIG_KASAN) &&
> +	    (base >= ((u64)CONFIG_PHYS_MEM_SIZE_FOR_KASAN << 20))) {
> +		pr_warn("KASAN: not adding memory block at %llx (size %llx)\n"
> +			"This could be due to discontiguous memory or kernel misconfiguration.",
> +			base, *size);
> +		return false;
> +	}
> +
>   	if (base >= max_mem)
>   		return false;
>   	if ((base + *size) > max_mem)
> @@ -572,8 +593,10 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
>   
>   	/* Add the chunk to the MEMBLOCK list */
>   	if (add_mem_to_memblock) {
> -		if (validate_mem_limit(base, &size))
> +		if (validate_mem_limit(base, &size)) {
>   			memblock_add(base, size);
> +			top_phys_addr = max(top_phys_addr, base + size);

Build failure, you have to cast (base + size) to (phys_addr_t) as 
phys_addr_t is not always u64.

   CC      arch/powerpc/kernel/asm-offsets.s
   CALL    scripts/checksyscalls.sh
   CALL    scripts/atomic/check-atomics.sh
   CC      arch/powerpc/kernel/prom.o
In file included from arch/powerpc/kernel/prom.c:15:0:
arch/powerpc/kernel/prom.c: In function 'early_init_dt_add_memory_arch':
./include/linux/kernel.h:844:29: error: comparison of distinct pointer 
types lacks a cast [-Werror]
    (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                              ^
./include/linux/kernel.h:858:4: note: in expansion of macro '__typecheck'
    (__typecheck(x, y) && __no_side_effects(x, y))
     ^
./include/linux/kernel.h:868:24: note: in expansion of macro '__safe_cmp'
   __builtin_choose_expr(__safe_cmp(x, y), \
                         ^
./include/linux/kernel.h:884:19: note: in expansion of macro '__careful_cmp'
  #define max(x, y) __careful_cmp(x, y, >)
                    ^
arch/powerpc/kernel/prom.c:598:20: note: in expansion of macro 'max'
     top_phys_addr = max(top_phys_addr, base + size);
                     ^
cc1: all warnings being treated as errors
make[3]: *** [arch/powerpc/kernel/prom.o] Error 1
make[2]: *** [arch/powerpc/kernel] Error 2
make[1]: *** [arch/powerpc] Error 2
make: *** [sub-make] Error 2

> +		}
>   	}
>   }
>   
> @@ -613,6 +636,8 @@ static void __init early_reserve_mem_dt(void)
>   static void __init early_reserve_mem(void)
>   {
>   	__be64 *reserve_map;
> +	phys_addr_t kasan_shadow_start;
> +	phys_addr_t kasan_memory_size;
>   
>   	reserve_map = (__be64 *)(((unsigned long)initial_boot_params) +
>   			fdt_off_mem_rsvmap(initial_boot_params));
> @@ -651,6 +676,40 @@ static void __init early_reserve_mem(void)
>   		return;
>   	}
>   #endif
> +
> +	if (IS_ENABLED(CONFIG_KASAN) && IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
> +		kasan_memory_size =
> +			((phys_addr_t)CONFIG_PHYS_MEM_SIZE_FOR_KASAN << 20);
> +
> +		if (top_phys_addr < kasan_memory_size) {
> +			/*
> +			 * We are doomed. We shouldn't even be able to get this
> +			 * far, but we do in qemu. If we continue and turn
> +			 * relocations on, we'll take fatal page faults for
> +			 * memory that's not physically present. Instead,
> +			 * panic() here: it will be saved to __log_buf even if
> +			 * it doesn't get printed to the console.
> +			 */
> +			panic("Tried to boot a KASAN kernel configured for %u MB with only %llu MB! Aborting.",
> +			      CONFIG_PHYS_MEM_SIZE_FOR_KASAN,
> +			      (u64)(top_phys_addr >> 20));
> +		} else if (top_phys_addr > kasan_memory_size) {
> +			/* print a biiiig warning in hopes people notice */
> +			pr_err("===========================================\n"
> +				"Physical memory exceeds compiled-in maximum!\n"
> +				"This kernel was compiled for KASAN with %u MB physical memory.\n"
> +				"The physical memory detected is at least %llu MB.\n"
> +				"Memory above the compiled limit will not be used!\n"
> +				"===========================================\n",
> +				CONFIG_PHYS_MEM_SIZE_FOR_KASAN,
> +				(u64)(top_phys_addr >> 20));
> +		}
> +
> +		kasan_shadow_start = _ALIGN_DOWN(kasan_memory_size * 7 / 8, PAGE_SIZE);
> +		DBG("reserving %llx -> %llx for KASAN",
> +		    kasan_shadow_start, top_phys_addr);
> +		memblock_reserve(kasan_shadow_start, top_phys_addr - kasan_shadow_start);
> +	}
>   }
>   
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM

Christophe
