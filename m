Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42521342B38
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 07:03:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2VZ126w7z3c7y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 17:03:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BFImvKFo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=bsingharora@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BFImvKFo; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2VYY3J5Qz3btM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 17:03:12 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id v2so5117868pgk.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 23:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BHDvicwkcPrvwPJWtJk9Ca1Ip7tyS2mRegd1kcbSvDU=;
 b=BFImvKFoIJqeGCx8AHckUhD8IC+87MPIhsFyS7ZmSSwSRzMJw2GzGl/EB9dQBHN/7M
 tMOldSS2qnuBn5X96hujDwHYS/KojvpYZedJ/DZxxJMbFpTc4fy7StXB5MH5cnKpei6M
 +dbZTPbtonryVgAx1a0BKLcMcBFn/CElOXcFv52tSE7unbvlfaGTm64z02ZKVh2+ghjm
 rbtdGdyQDZsa7tSiO54ydj9JSebRYTxHmG4fKR7+kihjoEkHo6Ih8mo8vQdU/0/HjtgH
 xyLyer6pyofh837Lfh5pnj6Y3UrMdjkK4rK9x9pXaQovekAPcy8Jh4s8Ca/QoO/8IQhr
 +NQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BHDvicwkcPrvwPJWtJk9Ca1Ip7tyS2mRegd1kcbSvDU=;
 b=Wh3WITQ/5k8V8LIOcCYD4Q0AnRJfdDG6KlYxeMfVbiZNttRInqEH9VmRfaiUmumds8
 wvO2+BUWpFHcoEzW+ATYxV6pnu3VOhjTQulmQI4PZ0Ron4dgtMjZ66/pp0w8usTTt3xh
 KFQGWhY5zD9pzGr7C1lQuBZxwQlCQucIGDdlU0itmr9uTv2tTd5/x9Wss4+CuVeoQ70L
 R1VkuZb4JkDakaLoU0GAPgrisildmu94CcDb3+wcXEhcK5wH6QqisuG4J11/PAY2pZnN
 IYl0EURhtn8cjJcbmKTNRQJWaoOMiMCs4iuwJvuNkWqTBLCM+NLE/lzGjCpsxEGdPd8c
 cBkQ==
X-Gm-Message-State: AOAM531780a0tQqmZKzsMXiTRxoRexICrBgEJmIosoPa/0fpXOShjhOq
 /8GXbOHINxsPqdNZTqXRYf0=
X-Google-Smtp-Source: ABdhPJxbDyrtu/cLXtw5PFkByRyyNo2yU/eFzJucO07cpXYyxZh1oFLKLIYXonGi/kl9ZnEymOH5sg==
X-Received: by 2002:a63:f70f:: with SMTP id x15mr14176918pgh.109.1616220185818; 
 Fri, 19 Mar 2021 23:03:05 -0700 (PDT)
Received: from localhost (121-45-173-48.tpgi.com.au. [121.45.173.48])
 by smtp.gmail.com with ESMTPSA id b10sm6593698pgm.76.2021.03.19.23.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 23:03:03 -0700 (PDT)
Date: Sat, 20 Mar 2021 17:02:59 +1100
From: Balbir Singh <bsingharora@gmail.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v11 6/6] powerpc: Book3S 64-bit outline-only KASAN support
Message-ID: <20210320060259.GF77072@balbir-desktop>
References: <20210319144058.772525-1-dja@axtens.net>
 <20210319144058.772525-7-dja@axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319144058.772525-7-dja@axtens.net>
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
Cc: aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 20, 2021 at 01:40:58AM +1100, Daniel Axtens wrote:
> Implement a limited form of KASAN for Book3S 64-bit machines running under
> the Radix MMU, supporting only outline mode.
>

Could you highlight the changes from
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20170729140901.5887-1-bsingharora@gmail.com/?

Feel free to use my signed-off-by if you need to and add/update copyright
headers if appropriate.
 
>  - Enable the compiler instrumentation to check addresses and maintain the
>    shadow region. (This is the guts of KASAN which we can easily reuse.)
> 
>  - Require kasan-vmalloc support to handle modules and anything else in
>    vmalloc space.
> 
>  - KASAN needs to be able to validate all pointer accesses, but we can't
>    instrument all kernel addresses - only linear map and vmalloc. On boot,
>    set up a single page of read-only shadow that marks all iomap and
>    vmemmap accesses as valid.
> 
>  - Make our stack-walking code KASAN-safe by using READ_ONCE_NOCHECK -
>    generic code, arm64, s390 and x86 all do this for similar sorts of
>    reasons: when unwinding a stack, we might touch memory that KASAN has
>    marked as being out-of-bounds. In our case we often get this when
>    checking for an exception frame because we're checking an arbitrary
>    offset into the stack frame.
> 
>    See commit 20955746320e ("s390/kasan: avoid false positives during stack
>    unwind"), commit bcaf669b4bdb ("arm64: disable kasan when accessing
>    frame->fp in unwind_frame"), commit 91e08ab0c851 ("x86/dumpstack:
>    Prevent KASAN false positive warnings") and commit 6e22c8366416
>    ("tracing, kasan: Silence Kasan warning in check_stack of stack_tracer")
> 
>  - Document KASAN in both generic and powerpc docs.
> 
> Background
> ----------
> 
> KASAN support on Book3S is a bit tricky to get right:
> 
>  - It would be good to support inline instrumentation so as to be able to
>    catch stack issues that cannot be caught with outline mode.
> 
>  - Inline instrumentation requires a fixed offset.
> 
>  - Book3S runs code with translations off ("real mode") during boot,
>    including a lot of generic device-tree parsing code which is used to
>    determine MMU features.
> 
>     [ppc64 mm note: The kernel installs a linear mapping at effective
>     address c000...-c008.... This is a one-to-one mapping with physical
>     memory from 0000... onward. Because of how memory accesses work on
>     powerpc 64-bit Book3S, a kernel pointer in the linear map accesses the
>     same memory both with translations on (accessing as an 'effective
>     address'), and with translations off (accessing as a 'real
>     address'). This works in both guests and the hypervisor. For more
>     details, see s5.7 of Book III of version 3 of the ISA, in particular
>     the Storage Control Overview, s5.7.3, and s5.7.5 - noting that this
>     KASAN implementation currently only supports Radix.]
> 
>  - Some code - most notably a lot of KVM code - also runs with translations
>    off after boot.
> 
>  - Therefore any offset has to point to memory that is valid with
>    translations on or off.
> 
> One approach is just to give up on inline instrumentation. This way
> boot-time checks can be delayed until after the MMU is set is up, and we
> can just not instrument any code that runs with translations off after
> booting. Take this approach for now and require outline instrumentation.
> 
> Previous attempts allowed inline instrumentation. However, they came with
> some unfortunate restrictions: only physically contiguous memory could be
> used and it had to be specified at compile time. Maybe we can do better in
> the future.
> 
> Cc: Balbir Singh <bsingharora@gmail.com> # ppc64 out-of-line radix version
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> # ppc64 hash version
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu> # ppc32 version
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  Documentation/dev-tools/kasan.rst            | 11 +--
>  Documentation/powerpc/kasan.txt              | 48 +++++++++-
>  arch/powerpc/Kconfig                         |  4 +-
>  arch/powerpc/Kconfig.debug                   |  3 +-
>  arch/powerpc/include/asm/book3s/64/hash.h    |  4 +
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  4 +
>  arch/powerpc/include/asm/book3s/64/radix.h   | 13 ++-
>  arch/powerpc/include/asm/kasan.h             | 22 +++++
>  arch/powerpc/kernel/Makefile                 | 11 +++
>  arch/powerpc/kernel/process.c                | 16 ++--
>  arch/powerpc/kvm/Makefile                    |  5 ++
>  arch/powerpc/mm/book3s64/Makefile            |  9 ++
>  arch/powerpc/mm/kasan/Makefile               |  1 +
>  arch/powerpc/mm/kasan/init_book3s_64.c       | 95 ++++++++++++++++++++
>  arch/powerpc/mm/ptdump/ptdump.c              | 20 ++++-
>  arch/powerpc/platforms/Kconfig.cputype       |  1 +
>  arch/powerpc/platforms/powernv/Makefile      |  6 ++
>  arch/powerpc/platforms/pseries/Makefile      |  3 +
>  18 files changed, 257 insertions(+), 19 deletions(-)
>  create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c
> 
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index 2cfd5d9068c0..8024b55c7aa8 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -36,8 +36,9 @@ Both software KASAN modes work with SLUB and SLAB memory allocators,
>  while the hardware tag-based KASAN currently only supports SLUB.
>  
>  Currently, generic KASAN is supported for the x86_64, arm, arm64, xtensa, s390,
> -and riscv architectures. It is also supported on 32-bit powerpc kernels.
> -Tag-based KASAN modes are supported only for arm64.
> +and riscv architectures. It is also supported on powerpc for 32-bit kernels and
> +for 64-bit kernels running under the Radix MMU. Tag-based KASAN modes are
> +supported only for arm64.
>  
>  Usage
>  -----
> @@ -335,10 +336,10 @@ CONFIG_KASAN_VMALLOC
>  
>  With ``CONFIG_KASAN_VMALLOC``, KASAN can cover vmalloc space at the
>  cost of greater memory usage. Currently, this is supported on x86,
> -riscv, s390, and 32-bit powerpc.
> +riscv, s390, and powerpc.
>  
> -It is optional, except on 32-bit powerpc kernels with module support,
> -where it is required.
> +It is optional, except on 64-bit powerpc kernels, and on 32-bit
> +powerpc kernels with module support, where it is required.
>  
>  This works by hooking into vmalloc and vmap and dynamically
>  allocating real shadow memory to back the mappings.
> diff --git a/Documentation/powerpc/kasan.txt b/Documentation/powerpc/kasan.txt
> index 26bb0e8bb18c..f032b4eaf205 100644
> --- a/Documentation/powerpc/kasan.txt
> +++ b/Documentation/powerpc/kasan.txt
> @@ -1,4 +1,4 @@
> -KASAN is supported on powerpc on 32-bit only.
> +KASAN is supported on powerpc on 32-bit and Radix 64-bit only.
>  
>  32 bit support
>  ==============
> @@ -10,3 +10,49 @@ fixmap area and occupies one eighth of the total kernel virtual memory space.
>  
>  Instrumentation of the vmalloc area is optional, unless built with modules,
>  in which case it is required.
> +
> +64 bit support
> +==============
> +
> +Currently, only the radix MMU is supported. There have been versions for hash
> +and Book3E processors floating around on the mailing list, but nothing has been
> +merged.
> +
> +KASAN support on Book3S is a bit tricky to get right:
> +
> + - It would be good to support inline instrumentation so as to be able to catch
> +   stack issues that cannot be caught with outline mode.
> +
> + - Inline instrumentation requires a fixed offset.
> +
> + - Book3S runs code with translations off ("real mode") during boot, including a
> +   lot of generic device-tree parsing code which is used to determine MMU
> +   features.
> +
> + - Some code - most notably a lot of KVM code - also runs with translations off
> +   after boot.
> +
> + - Therefore any offset has to point to memory that is valid with
> +   translations on or off.
> +
> +One approach is just to give up on inline instrumentation. This way boot-time
> +checks can be delayed until after the MMU is set is up, and we can just not
> +instrument any code that runs with translations off after booting. This is the
> +current approach.
> +
> +To avoid this limitiation, the KASAN shadow would have to be placed inside the
> +linear mapping, using the same high-bits trick we use for the rest of the linear
> +mapping. This is tricky:
> +
> + - We'd like to place it near the start of physical memory. In theory we can do
> +   this at run-time based on how much physical memory we have, but this requires
> +   being able to arbitrarily relocate the kernel, which is basically the tricky
> +   part of KASLR. Not being game to implement both tricky things at once, this
> +   is hopefully something we can revisit once we get KASLR for Book3S.
> +
> + - Alternatively, we can place the shadow at the _end_ of memory, but this
> +   requires knowing how much contiguous physical memory a system has _at compile
> +   time_. This is a big hammer, and has some unfortunate consequences: inablity
> +   to handle discontiguous physical memory, total failure to boot on machines
> +   with less memory than specified, and that machines with more memory than
> +   specified can't use it. This was deemed unacceptable.
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 4232d3f539c8..04aa817d1c5a 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -118,6 +118,7 @@ config PPC
>  	# Please keep this list sorted alphabetically.
>  	#
>  	select ARCH_32BIT_OFF_T if PPC32
> +	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
>  	select ARCH_HAS_DEBUG_VIRTUAL
>  	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  	select ARCH_HAS_ELF_RANDOMIZE
> @@ -183,7 +184,8 @@ config PPC
>  	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
>  	select HAVE_ARCH_JUMP_LABEL
>  	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
> -	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
> +	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU
> +	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
>  	select HAVE_ARCH_KGDB
>  	select HAVE_ARCH_MMAP_RND_BITS
>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> index ae084357994e..195f7845f41a 100644
> --- a/arch/powerpc/Kconfig.debug
> +++ b/arch/powerpc/Kconfig.debug
> @@ -398,4 +398,5 @@ config PPC_FAST_ENDIAN_SWITCH
>  config KASAN_SHADOW_OFFSET
>  	hex
>  	depends on KASAN
> -	default 0xe0000000
> +	default 0xe0000000 if PPC32
> +	default 0xa80e000000000000 if PPC64
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
> index d959b0195ad9..222669864ff6 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -18,6 +18,10 @@
>  #include <asm/book3s/64/hash-4k.h>
>  #endif
>  
> +#define H_PTRS_PER_PTE		(1 << H_PTE_INDEX_SIZE)
> +#define H_PTRS_PER_PMD		(1 << H_PMD_INDEX_SIZE)
> +#define H_PTRS_PER_PUD		(1 << H_PUD_INDEX_SIZE)
> +
>  /* Bits to set in a PMD/PUD/PGD entry valid bit*/
>  #define HASH_PMD_VAL_BITS		(0x8000000000000000UL)
>  #define HASH_PUD_VAL_BITS		(0x8000000000000000UL)
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 058601efbc8a..7598a5b055bd 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -230,6 +230,10 @@ extern unsigned long __pmd_frag_size_shift;
>  #define PTRS_PER_PUD	(1 << PUD_INDEX_SIZE)
>  #define PTRS_PER_PGD	(1 << PGD_INDEX_SIZE)
>  
> +#define MAX_PTRS_PER_PTE ((H_PTRS_PER_PTE > R_PTRS_PER_PTE) ? H_PTRS_PER_PTE : R_PTRS_PER_PTE)
> +#define MAX_PTRS_PER_PMD ((H_PTRS_PER_PMD > R_PTRS_PER_PMD) ? H_PTRS_PER_PMD : R_PTRS_PER_PMD)
> +#define MAX_PTRS_PER_PUD ((H_PTRS_PER_PUD > R_PTRS_PER_PUD) ? H_PTRS_PER_PUD : R_PTRS_PER_PUD)
> +
>  /* PMD_SHIFT determines what a second-level page table entry can map */
>  #define PMD_SHIFT	(PAGE_SHIFT + PTE_INDEX_SIZE)
>  #define PMD_SIZE	(1UL << PMD_SHIFT)
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> index c7813dc628fc..b3492b80f858 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -35,6 +35,11 @@
>  #define RADIX_PMD_SHIFT		(PAGE_SHIFT + RADIX_PTE_INDEX_SIZE)
>  #define RADIX_PUD_SHIFT		(RADIX_PMD_SHIFT + RADIX_PMD_INDEX_SIZE)
>  #define RADIX_PGD_SHIFT		(RADIX_PUD_SHIFT + RADIX_PUD_INDEX_SIZE)
> +
> +#define R_PTRS_PER_PTE		(1 << RADIX_PTE_INDEX_SIZE)
> +#define R_PTRS_PER_PMD		(1 << RADIX_PMD_INDEX_SIZE)
> +#define R_PTRS_PER_PUD		(1 << RADIX_PUD_INDEX_SIZE)
> +
>  /*
>   * Size of EA range mapped by our pagetables.
>   */
> @@ -68,11 +73,11 @@
>   *
>   *
>   * 3rd quadrant expanded:
> - * +------------------------------+
> + * +------------------------------+  Highest address (0xc010000000000000)
> + * +------------------------------+  KASAN shadow end (0xc00fc00000000000)
>   * |                              |
>   * |                              |
> - * |                              |
> - * +------------------------------+  Kernel vmemmap end (0xc010000000000000)
> + * +------------------------------+  Kernel vmemmap end/shadow start (0xc00e000000000000)
>   * |                              |
>   * |           512TB		  |
>   * |                              |
> @@ -126,6 +131,8 @@
>  #define RADIX_VMEMMAP_SIZE	RADIX_KERN_MAP_SIZE
>  #define RADIX_VMEMMAP_END	(RADIX_VMEMMAP_START + RADIX_VMEMMAP_SIZE)
>  
> +/* For the sizes of the shadow area, see kasan.h */
> +
>  #ifndef __ASSEMBLY__
>  #define RADIX_PTE_TABLE_SIZE	(sizeof(pte_t) << RADIX_PTE_INDEX_SIZE)
>  #define RADIX_PMD_TABLE_SIZE	(sizeof(pmd_t) << RADIX_PMD_INDEX_SIZE)
> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
> index 7355ed05e65e..df946165812d 100644
> --- a/arch/powerpc/include/asm/kasan.h
> +++ b/arch/powerpc/include/asm/kasan.h
> @@ -30,9 +30,31 @@
>  
>  #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
>  
> +#ifdef CONFIG_PPC32
>  #define KASAN_SHADOW_END	(-(-KASAN_SHADOW_START >> KASAN_SHADOW_SCALE_SHIFT))
> +#endif
>  
>  #ifdef CONFIG_KASAN
> +#ifdef CONFIG_PPC_BOOK3S_64
> +/*
> + * The shadow ends before the highest accessible address
> + * because we don't need a shadow for the shadow. Instead:
> + * c00e000000000000 << 3 + a80e000000000000000 = c00fc00000000000

The comment has one extra 0 in a80e.., I did the math and had to use
the data from the defines :)

> + */
> +#define KASAN_SHADOW_END 0xc00fc00000000000UL
> +
> +DECLARE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
> +
> +static __always_inline bool kasan_arch_is_ready(void)
> +{
> +	if (static_branch_likely(&powerpc_kasan_enabled_key))
> +		return true;
> +	return false;
> +}
> +
> +#define kasan_arch_is_ready kasan_arch_is_ready
> +#endif
> +
>  void kasan_early_init(void);
>  void kasan_mmu_init(void);
>  void kasan_init(void);
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 6084fa499aa3..163755b1cef4 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -32,6 +32,17 @@ KASAN_SANITIZE_early_32.o := n
>  KASAN_SANITIZE_cputable.o := n
>  KASAN_SANITIZE_prom_init.o := n
>  KASAN_SANITIZE_btext.o := n
> +KASAN_SANITIZE_paca.o := n
> +KASAN_SANITIZE_setup_64.o := n
> +KASAN_SANITIZE_mce.o := n
> +KASAN_SANITIZE_mce_power.o := n
> +
> +# we have to be particularly careful in ppc64 to exclude code that
> +# runs with translations off, as we cannot access the shadow with
> +# translations off. However, ppc32 can sanitize this.
> +ifdef CONFIG_PPC64
> +KASAN_SANITIZE_traps.o := n
> +endif
>  
>  ifdef CONFIG_KASAN
>  CFLAGS_early_32.o += -DDISABLE_BRANCH_PROFILING
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 3231c2df9e26..d4ae21b9e9b7 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2160,8 +2160,8 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
>  			break;
>  
>  		stack = (unsigned long *) sp;
> -		newsp = stack[0];
> -		ip = stack[STACK_FRAME_LR_SAVE];
> +		newsp = READ_ONCE_NOCHECK(stack[0]);
> +		ip = READ_ONCE_NOCHECK(stack[STACK_FRAME_LR_SAVE]);
>  		if (!firstframe || ip != lr) {
>  			printk("%s["REG"] ["REG"] %pS",
>  				loglvl, sp, ip, (void *)ip);
> @@ -2179,17 +2179,19 @@ void show_stack(struct task_struct *tsk, unsigned long *stack,
>  		 * See if this is an exception frame.
>  		 * We look for the "regshere" marker in the current frame.
>  		 */
> -		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS)
> -		    && stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
> +		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS) &&
> +		    (READ_ONCE_NOCHECK(stack[STACK_FRAME_MARKER]) ==
> +		     STACK_FRAME_REGS_MARKER)) {
>  			struct pt_regs *regs = (struct pt_regs *)
>  				(sp + STACK_FRAME_OVERHEAD);
>  
> -			lr = regs->link;
> +			lr = READ_ONCE_NOCHECK(regs->link);
>  			printk("%s--- interrupt: %lx at %pS\n",
> -			       loglvl, regs->trap, (void *)regs->nip);
> +			       loglvl, READ_ONCE_NOCHECK(regs->trap),
> +			       (void *)READ_ONCE_NOCHECK(regs->nip));
>  			__show_regs(regs);
>  			printk("%s--- interrupt: %lx\n",
> -			       loglvl, regs->trap);
> +			       loglvl, READ_ONCE_NOCHECK(regs->trap));
>  
>  			firstframe = 1;
>  		}
> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
> index 2bfeaa13befb..7f1592dacbeb 100644
> --- a/arch/powerpc/kvm/Makefile
> +++ b/arch/powerpc/kvm/Makefile
> @@ -136,3 +136,8 @@ obj-$(CONFIG_KVM_BOOK3S_64_PR) += kvm-pr.o
>  obj-$(CONFIG_KVM_BOOK3S_64_HV) += kvm-hv.o
>  
>  obj-y += $(kvm-book3s_64-builtin-objs-y)
> +
> +# KVM does a lot in real-mode, and 64-bit Book3S KASAN doesn't support that
> +ifdef CONFIG_PPC_BOOK3S_64
> +KASAN_SANITIZE := n
> +endif
> diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
> index 1b56d3af47d4..a7d8a68bd2c5 100644
> --- a/arch/powerpc/mm/book3s64/Makefile
> +++ b/arch/powerpc/mm/book3s64/Makefile
> @@ -21,3 +21,12 @@ obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
>  
>  # Instrumenting the SLB fault path can lead to duplicate SLB entries
>  KCOV_INSTRUMENT_slb.o := n
> +
> +# Parts of these can run in real mode and therefore are
> +# not safe with the current outline KASAN implementation
> +KASAN_SANITIZE_mmu_context.o := n
> +KASAN_SANITIZE_pgtable.o := n
> +KASAN_SANITIZE_radix_pgtable.o := n
> +KASAN_SANITIZE_radix_tlb.o := n
> +KASAN_SANITIZE_slb.o := n
> +KASAN_SANITIZE_pkeys.o := n
> diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
> index 42fb628a44fd..07eef87abd6c 100644
> --- a/arch/powerpc/mm/kasan/Makefile
> +++ b/arch/powerpc/mm/kasan/Makefile
> @@ -5,3 +5,4 @@ KASAN_SANITIZE := n
>  obj-$(CONFIG_PPC32)           += init_32.o
>  obj-$(CONFIG_PPC_8xx)		+= 8xx.o
>  obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
> +obj-$(CONFIG_PPC_BOOK3S_64)   += init_book3s_64.o
> diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
> new file mode 100644
> index 000000000000..ca913ed951a2
> --- /dev/null
> +++ b/arch/powerpc/mm/kasan/init_book3s_64.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KASAN for 64-bit Book3S powerpc
> + *
> + * Copyright (C) 2019-2020 IBM Corporation
> + * Author: Daniel Axtens <dja@axtens.net>
> + */
> +
> +#define DISABLE_BRANCH_PROFILING
> +
> +#include <linux/kasan.h>
> +#include <linux/printk.h>
> +#include <linux/sched/task.h>
> +#include <linux/memblock.h>
> +#include <asm/pgalloc.h>
> +
> +DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
> +
> +static void __init kasan_init_phys_region(void *start, void *end)
> +{
> +	unsigned long k_start, k_end, k_cur;
> +	void *va;
> +
> +	if (start >= end)
> +		return;
> +
> +	k_start = ALIGN_DOWN((unsigned long)kasan_mem_to_shadow(start), PAGE_SIZE);
> +	k_end = ALIGN((unsigned long)kasan_mem_to_shadow(end), PAGE_SIZE);
> +
> +	va = memblock_alloc(k_end - k_start, PAGE_SIZE);
> +	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE, va += PAGE_SIZE)
> +		map_kernel_page(k_cur, __pa(va), PAGE_KERNEL);
> +}
> +
> +void __init kasan_init(void)
> +{
> +	/*
> +	 * We want to do the following things:
> +	 *  1) Map real memory into the shadow for all physical memblocks
> +	 *     This takes us from c000... to c008...
> +	 *  2) Leave a hole over the shadow of vmalloc space. KASAN_VMALLOC
> +	 *     will manage this for us.
> +	 *     This takes us from c008... to c00a...
> +	 *  3) Map the 'early shadow'/zero page over iomap and vmemmap space.
> +	 *     This takes us up to where we start at c00e...
> +	 */
> +

assuming we have
#define VMEMMAP_END R_VMEMMAP_END
and ditto for hash we probably need

	BUILD_BUG_ON(VMEMMAP_END + KASAN_SHADOW_OFFSET != KASAN_SHADOW_END);

Looks good otherwise, I've not been able to test it yet

Balbir Singh.
