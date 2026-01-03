Return-Path: <linuxppc-dev+bounces-15186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5316CF043E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 19:54:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dk8rB0cDnz2yK7;
	Sun, 04 Jan 2026 05:54:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767466489;
	cv=none; b=UWN+L/DaCdJwF4wpPf7GGZd5wH6e1bhnprPeC4xx/F69vr33sL59U3prmsLm+SHl2CtjQ0oEvWjO/0jMOGJA+FjPtznhve4ylI8KWmk8SoM9RW2aMvtE96pWwfADB7Bmvbr9JD2tHGmIMALgcyLBuxhOz8uB9QLHOtSAZAsr9Xp5FIEeUo6skPR5fYaZjMJtTFB51OvJm/Jg3Bp5vBkBpxyF10OcYZJv8W8ZbcnQ+E/5iQ9gOWt4JScNjC7RsGgCYCzmIL/aincJZP2DSgSx3DIpf77IPysy8vTXzoSPU2G1YiqC+ezYNj4gejBt6SJ308HycjRvAWWOAmI0FM00xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767466489; c=relaxed/relaxed;
	bh=WWLqVQ/pPQ1naqkMgxEFRjUWoHX6yre2yeQ2FeZ1a5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VR1PSUlbr8tXfuQT0JbInl+GYvQAu9msb6MSQCmJoXTadosSKOOzpxUCQwCIFMdqHzdgB8NTN2ZTA2qS8yh/1s7MpBb0GcX+kRa5BvKp4+Of1Ra7TOgD6j04+BuFcdZIW31qni3cVm2VzWDejDtT+m0T9sa2tQu5W/EiQiG9aVqut7Op2KwS2m/t+YYAPYB3VKF2n9N08oJGeBrE8iX1hVeXGRBci+9L0e1dgGpW/qw8OlYk/E45d2YfSZLDYx0p5AtvL15Xguvf6Ml/vTqK/gMhphBN0hhw8hBR8TZrbBaWioc6exTY6ZMMJKq2mSXGONzxhmaUyFRssxDQ5GXm0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ntpZea6S; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ntpZea6S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dk8r86B4rz2yGl
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Jan 2026 05:54:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1784D40423;
	Sat,  3 Jan 2026 18:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09051C113D0;
	Sat,  3 Jan 2026 18:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767466485;
	bh=JJi0MIW7ufay+ZZEo6EH5bf/kqP+vRBsByx4CICNQCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ntpZea6Sa23o++gxekMhG3I2QU/XUTWc5nMNjfwy8Zyi3NxPf/H771f3L1fK5G+JV
	 BrIkjrHnTIa77Opbod1/wKDGPBT3rKbTairESVy5GIn6kLNbwjXgkey0AYjrLhGdtm
	 1WmiT9BvnPKoouYAqUVpZ8pMait9YtcjloPtOthbURuem94A6kCmWXPP6kGGR5TMsk
	 u58EQYc7patXv3IP/W4ZCBdZ3acr/VkBhoQVGrCvo13QtDF90hlUSKKPF5FMbB73Cg
	 bSz/V5A/Jkpw/H2SFDajyAjOcb+N26PpJKiNlYzPGaxtX/S68RKs74BHnvORKROqCy
	 PVF9NX0W2W0Vg==
Date: Sat, 3 Jan 2026 20:54:23 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Klara Modin <klarasmodin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 22/28] arch, mm: consolidate initialization of nodes,
 zones and memory map
Message-ID: <aVll339wim7dCIaQ@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-23-rppt@kernel.org>
 <aVhN2NgQEKe0yzva@soda.int.kasm.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVhN2NgQEKe0yzva@soda.int.kasm.eu>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Sat, Jan 03, 2026 at 12:33:29AM +0100, Klara Modin wrote:
> On 2026-01-02 08:59:58 +0200, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > To initialize node, zone and memory map data structures every architecture
> > calls free_area_init() during setup_arch() and passes it an array of zone
> > limits.
> > 
> > Beside code duplication it creates "interesting" ordering cases between
> > allocation and initialization of hugetlb and the memory map. Some
> > architectures allocate hugetlb pages very early in setup_arch() in certain
> > cases, some only create hugetlb CMA areas in setup_arch() and sometimes
> > hugetlb allocations happen mm_core_init().
> > 
> > With arch_zone_limits_init() helper available now on all architectures it
> > is no longer necessary to call free_area_init() from architecture setup
> > code. Rather core MM initialization can call arch_zone_limits_init() in a
> > single place.
> > 
> > This allows to unify ordering of hugetlb vs memory map allocation and
> > initialization.
> > 
> > Remove the call to free_area_init() from architecture specific code and
> > place it in a new mm_core_init_early() function that is called immediately
> > after setup_arch().
> > 
> > After this refactoring it is possible to consolidate hugetlb allocations
> > and eliminate differences in ordering of hugetlb and memory map
> > initialization among different architectures.
> > 
> > As the first step of this consolidation move hugetlb_bootmem_alloc() to
> > mm_core_early_init().
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> This breaks boot on my Raspberry Pi 1. The reason seems to be the use of
> page_folio() when initializing the dynamically allocated zero page in
> arm, which doesn't work when free_area_init() hasn't been called yet.

I believe the reason is rather the use of virt_to_phys() that now happens
before the memory map is ready.

> The following oopses are generated:
> 
>  8<--- cut here ---
>  Unable to handle kernel paging request at virtual address 003dfb44 when read
>  [003dfb44] *pgd=00000000
>  Internal error: Oops: 5 [#1] ARM
>  CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-rc3-03898-g7975b0084358 #451 NONE
>  Hardware name: BCM2835
>  PC is at paging_init (include/linux/page-flags.h:284 (discriminator 2) arch/arm/mm/mmu.c:1790 (discriminator 2))
>  LR is at paging_init (arch/arm/mm/mmu.c:1789 (discriminator 1))

...

>  8<--- cut here ---
> 
> and the second one repeats for some time afterwards.
> 
> I experimented a little by allocating the zero page statically as many
> other arches do which fixes the issue as it does not need to be
> initialized at this point anymore, though I have no idea if that's
> appropriate.

Do you mean putting the zero in the BSS like, e.g. arm64? I don't see a
reason why this shouldn't work.

I also have a patch with some minor changes that still keeps
empty_zero_page allocated, but avoids virt_to_page() and folio_page()
dance. Can you please test it in your setup?

From 8a213c13211106d592fbe96b68ee29879ed739f8 Mon Sep 17 00:00:00 2001
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sat, 3 Jan 2026 20:40:09 +0200
Subject: [PATCH] arm: make initialization of zero page independent of the
 memory map

Unlike most architectures, arm keeps a struct page pointer to the
empty_zero_page and to initialize it requires conversion of a virtual
address to page which makes it necessary to have memory map initialized
before creating the empty_zero_page.

Make empty_zero_page a void * to decouple it's initialization from the
initialization of the memory map.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/arm/include/asm/pgtable.h |  4 ++--
 arch/arm/mm/mmu.c              | 10 +++-------
 arch/arm/mm/nommu.c            | 10 +++-------
 3 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 86378eec7757..08bbd2aed6c9 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -15,8 +15,8 @@
  * ZERO_PAGE is a global shared page that is always zero: used
  * for zero-mapped memory areas etc..
  */
-extern struct page *empty_zero_page;
-#define ZERO_PAGE(vaddr)	(empty_zero_page)
+extern void *empty_zero_page;
+#define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
 #endif
 
 #include <asm-generic/pgtable-nopud.h>
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 8bac96e205ac..867258f1ae09 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -45,7 +45,7 @@ extern unsigned long __atags_pointer;
  * empty_zero_page is a special page that is used for
  * zero-initialized data and COW.
  */
-struct page *empty_zero_page;
+void *empty_zero_page;
 EXPORT_SYMBOL(empty_zero_page);
 
 /*
@@ -1754,8 +1754,6 @@ static void __init early_fixmap_shutdown(void)
  */
 void __init paging_init(const struct machine_desc *mdesc)
 {
-	void *zero_page;
-
 #ifdef CONFIG_XIP_KERNEL
 	/* Store the kernel RW RAM region start/end in these variables */
 	kernel_sec_start = CONFIG_PHYS_OFFSET & SECTION_MASK;
@@ -1782,12 +1780,10 @@ void __init paging_init(const struct machine_desc *mdesc)
 	top_pmd = pmd_off_k(0xffff0000);
 
 	/* allocate the zero page. */
-	zero_page = early_alloc(PAGE_SIZE);
+	empty_zero_page = early_alloc(PAGE_SIZE);
+	__cpuc_flush_dcache_area(empty_zero_page, PAGE_SIZE);
 
 	bootmem_init();
-
-	empty_zero_page = virt_to_page(zero_page);
-	__flush_dcache_folio(NULL, page_folio(empty_zero_page));
 }
 
 void __init early_mm_init(const struct machine_desc *mdesc)
diff --git a/arch/arm/mm/nommu.c b/arch/arm/mm/nommu.c
index d638cc87807e..f80ff5a69fbb 100644
--- a/arch/arm/mm/nommu.c
+++ b/arch/arm/mm/nommu.c
@@ -31,7 +31,7 @@ unsigned long vectors_base;
  * empty_zero_page is a special page that is used for
  * zero-initialized data and COW.
  */
-struct page *empty_zero_page;
+void *empty_zero_page;
 EXPORT_SYMBOL(empty_zero_page);
 
 #ifdef CONFIG_ARM_MPU
@@ -156,18 +156,14 @@ void __init adjust_lowmem_bounds(void)
  */
 void __init paging_init(const struct machine_desc *mdesc)
 {
-	void *zero_page;
-
 	early_trap_init((void *)vectors_base);
 	mpu_setup();
 
 	/* allocate the zero page. */
-	zero_page = (void *)memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
+	empty_zero_page = memblock_alloc_or_panic(PAGE_SIZE, PAGE_SIZE);
+	__cpuc_flush_dcache_area(empty_zero_page, PAGE_SIZE);
 
 	bootmem_init();
-
-	empty_zero_page = virt_to_page(zero_page);
-	flush_dcache_page(empty_zero_page);
 }
 
 /*
-- 
2.51.0

 
> Regards,
> Klara Modin
> 

-- 
Sincerely yours,
Mike.

