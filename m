Return-Path: <linuxppc-dev+bounces-2319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EBE9A0CE1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 16:37:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTD7t3hQlz2xjM;
	Thu, 17 Oct 2024 01:37:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729089434;
	cv=none; b=ZO8BIVEFy71wlVplLATvk0Nfgaq7MAMm8DIqbcW08kOa3kOlLeqQyKJZ6qrHTVPblym9ft7WEnBCznTrS4ugWyEvHzUtFO6oXGOJKshCBhwUFnr3rAo8OynJSSIRmsX2Z7KYoy54YsILmDiYBVDCBE0+TDYJFpneTLxV36avoFjc2GVzyHuK/B0D3oThXzdQKmEn6q3cEVkIYQtmykf/dhjX+C8uGx3zMnPFxtWavSSHxxr+COj2Otilnnkx36ZqZUi0tnco+ub4qJCOaG+gMnL18GLrFuPgk7+nRQohONIF+Cc6fScCOePAf4brmpZRxcdFmpB6gVuQcchJLDtASw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729089434; c=relaxed/relaxed;
	bh=bs6SAT73dIC//02Seb+cTHQ8stTQPwN//VncGxNLZrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQ4j8VT6E+UJ6UCMJoVLFm6AR7bmFOM0PVpbl5jKaDmXNbZ95tpC7ArXz5ASOIe/dbZgjNFosuQ9hDnPZo1EPDCBxBS5uflNlsuFfkvJA5ovuaXUnr7QYITOVXxIS1TzcX6msOo9/V1SHVH6QoAXkoc9YMIJp+VVSJpvLnqwGSQGmNlD0076or9JmACwYH0N2qrsIU094SJyhK7cZy0q6hCirp/MXBJshbAjy7ddgsGZDNQ57MwnNJCqNZuYZ4DLZLg/1bFZprZxDY84ODgNUD3f5wKAP4kvh3mmA3TzVNXzhYe4RLwYoxbs9DTEsDnSaUkU3SYFV46wjoJyTqDyUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTD7q6zZMz2xf2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 01:37:09 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95363FEC;
	Wed, 16 Oct 2024 07:37:06 -0700 (PDT)
Received: from [10.1.28.177] (XHFQ2J9959.cambridge.arm.com [10.1.28.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 720843F71E;
	Wed, 16 Oct 2024 07:36:26 -0700 (PDT)
Message-ID: <1b23c7d2-5779-4481-8318-1ae950261d15@arm.com>
Date: Wed, 16 Oct 2024 15:36:24 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/57] mm: Add macros ahead of supporting boot-time
 page size selection
Content-Language: en-GB
To: "David S. Miller" <davem@davemloft.net>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Chris Zankel <chris@zankel.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Marsden <greg.marsden@oracle.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Ivan Ivanov <ivan.ivanov@suse.com>, Johannes Berg
 <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonas Bonn <jonas@southpole.se>, Kalesh Singh <kaleshsingh@google.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <mbrugger@suse.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Miroslav Benes <mbenes@suse.cz>, Rich Felker <dalias@libc.org>,
 Richard Weinberger <richard@nod.at>, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Brian Cain <bcain@quicinc.com>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>
Cc: linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20241014105912.3207374-1-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

+ Albert Ou, Alexander Gordeev, Brian Cain, Guo Ren, Heiko Carstens, Michael
Ellerman, Michal Simek, Palmer Dabbelt, Paul Walmsley, Vasily Gorbik, Vineet Gupta.

This was a rather tricky series to get the recipients correct for and my script
did not realize that "supporter" was a pseudonym for "maintainer" so you were
missed off the original post. Appologies!

More context in cover letter:
https://lore.kernel.org/all/20241014105514.3206191-1-ryan.roberts@arm.com/


On 14/10/2024 11:58, Ryan Roberts wrote:
> arm64 can support multiple base page sizes. Instead of selecting a page
> size at compile time, as is done today, we will make it possible to
> select the desired page size on the command line.
> 
> In this case PAGE_SHIFT and it's derivatives, PAGE_SIZE and PAGE_MASK
> (as well as a number of other macros related to or derived from
> PAGE_SHIFT, but I'm not worrying about those yet), are no longer
> compile-time constants. So the code base needs to cope with that.
> 
> As a first step, introduce MIN and MAX variants of these macros, which
> express the range of possible page sizes. These are always compile-time
> constants and can be used in many places where PAGE_[SHIFT|SIZE|MASK]
> were previously used where a compile-time constant is required.
> (Subsequent patches will do that conversion work). When the arch/build
> doesn't support boot-time page size selection, the MIN and MAX variants
> are equal and everything resolves as it did previously.
> 
> Additionally, introduce DEFINE_GLOBAL_PAGE_SIZE_VAR[_CONST]() which wrap
> global variable defintions so that for boot-time page size selection
> builds, the variable being wrapped is initialized at boot-time, instead
> of compile-time. This is done by defining a function to do the
> assignment, which has the "constructor" attribute. Constructor is
> preferred over initcall, because when compiling a module, the module is
> limited to a single initcall but constructors are unlimited. For
> built-in code, constructors are now called earlier to guarrantee that
> the variables are initialized by the time they are used. Any arch that
> wants to enable boot-time page size selection will need to select
> CONFIG_CONSTRUCTORS.
> 
> These new macros need to be available anywhere PAGE_SHIFT and friends
> are available. Those are defined via asm/page.h (although some arches
> have a sub-include that defines them). Unfortunately there is no
> reliable asm-generic header we can easily piggy-back on, so let's define
> a new one, pgtable-geometry.h, which we include near where each arch
> defines PAGE_SHIFT. Ugh.
> 
> -------
> 
> Most of the problems that need to be solved over the next few patches
> fall into these broad categories, which are all solved with the help of
> these new macros:
> 
> 1. Assignment of values derived from PAGE_SIZE in global variables
> 
>   For boot-time page size builds, we must defer the initialization of
>   these variables until boot-time, when the page size is known. See
>   DEFINE_GLOBAL_PAGE_SIZE_VAR[_CONST]() as described above.
> 
> 2. Define static storage in units related to PAGE_SIZE
> 
>   This static storage will be defined according to PAGE_SIZE_MAX.
> 
> 3. Define size of struct so that it is related to PAGE_SIZE
> 
>   The struct often contains an array that is sized to fill the page. In
>   this case, use a flexible array with dynamic allocation. In other
>   cases, the struct fits exactly over a page, which is a header (e.g.
>   swap file header). In this case, remove the padding, and manually
>   determine the struct pointer within the page.
> 
> 4. BUILD_BUG_ON() with values derived from PAGE_SIZE
> 
>   In most cases, we can change these to compare againt the appropriate
>   limit (either MIN or MAX). In other cases, we must change these to
>   run-time BUG_ON().
> 
> 5. Ensure page alignment of static data structures
> 
>   Align instead to PAGE_SIZE_MAX.
> 
> 6. #ifdeffery based on PAGE_SIZE
> 
>   Often these can be changed to c code constructs. e.g. a macro that
>   returns a different value depending on page size can be changed to use
>   the ternary operator and the compiler will dead code strip it for the
>   compile-time constant case and runtime evaluate it for the non-const
>   case. Or #if/#else/#endif within a function can be converted to c
>   if/else blocks, which are also dead code stripped for the const case.
>   Sometimes we can change the c-preprocessor logic to use the
>   appropriate MIN/MAX limit.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
> 
> ***NOTE***
> Any confused maintainers may want to read the cover note here for context:
> https://lore.kernel.org/all/20241014105514.3206191-1-ryan.roberts@arm.com/
> 
>  arch/alpha/include/asm/page.h          |  1 +
>  arch/arc/include/asm/page.h            |  1 +
>  arch/arm/include/asm/page.h            |  1 +
>  arch/arm64/include/asm/page-def.h      |  2 +
>  arch/csky/include/asm/page.h           |  3 ++
>  arch/hexagon/include/asm/page.h        |  2 +
>  arch/loongarch/include/asm/page.h      |  2 +
>  arch/m68k/include/asm/page.h           |  1 +
>  arch/microblaze/include/asm/page.h     |  1 +
>  arch/mips/include/asm/page.h           |  1 +
>  arch/nios2/include/asm/page.h          |  2 +
>  arch/openrisc/include/asm/page.h       |  1 +
>  arch/parisc/include/asm/page.h         |  1 +
>  arch/powerpc/include/asm/page.h        |  2 +
>  arch/riscv/include/asm/page.h          |  1 +
>  arch/s390/include/asm/page.h           |  1 +
>  arch/sh/include/asm/page.h             |  1 +
>  arch/sparc/include/asm/page.h          |  3 ++
>  arch/um/include/asm/page.h             |  2 +
>  arch/x86/include/asm/page_types.h      |  2 +
>  arch/xtensa/include/asm/page.h         |  1 +
>  include/asm-generic/pgtable-geometry.h | 71 ++++++++++++++++++++++++++
>  init/main.c                            |  5 +-
>  23 files changed, 107 insertions(+), 1 deletion(-)
>  create mode 100644 include/asm-generic/pgtable-geometry.h
> 
> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
> index 70419e6be1a35..d0096fb5521b8 100644
> --- a/arch/alpha/include/asm/page.h
> +++ b/arch/alpha/include/asm/page.h
> @@ -88,5 +88,6 @@ typedef struct page *pgtable_t;
>  
>  #include <asm-generic/memory_model.h>
>  #include <asm-generic/getorder.h>
> +#include <asm-generic/pgtable-geometry.h>
>  
>  #endif /* _ALPHA_PAGE_H */
> diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
> index def0dfb95b436..8d56549db7a33 100644
> --- a/arch/arc/include/asm/page.h
> +++ b/arch/arc/include/asm/page.h
> @@ -6,6 +6,7 @@
>  #define __ASM_ARC_PAGE_H
>  
>  #include <uapi/asm/page.h>
> +#include <asm-generic/pgtable-geometry.h>
>  
>  #ifdef CONFIG_ARC_HAS_PAE40
>  
> diff --git a/arch/arm/include/asm/page.h b/arch/arm/include/asm/page.h
> index 62af9f7f9e963..417aa8533c718 100644
> --- a/arch/arm/include/asm/page.h
> +++ b/arch/arm/include/asm/page.h
> @@ -191,5 +191,6 @@ extern int pfn_valid(unsigned long);
>  
>  #include <asm-generic/getorder.h>
>  #include <asm-generic/memory_model.h>
> +#include <asm-generic/pgtable-geometry.h>
>  
>  #endif
> diff --git a/arch/arm64/include/asm/page-def.h b/arch/arm64/include/asm/page-def.h
> index 792e9fe881dcf..d69971cf49cd2 100644
> --- a/arch/arm64/include/asm/page-def.h
> +++ b/arch/arm64/include/asm/page-def.h
> @@ -15,4 +15,6 @@
>  #define PAGE_SIZE		(_AC(1, UL) << PAGE_SHIFT)
>  #define PAGE_MASK		(~(PAGE_SIZE-1))
>  
> +#include <asm-generic/pgtable-geometry.h>
> +
>  #endif /* __ASM_PAGE_DEF_H */
> diff --git a/arch/csky/include/asm/page.h b/arch/csky/include/asm/page.h
> index 0ca6c408c07f2..95173d57adc8b 100644
> --- a/arch/csky/include/asm/page.h
> +++ b/arch/csky/include/asm/page.h
> @@ -92,4 +92,7 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
>  #include <asm-generic/getorder.h>
>  
>  #endif /* !__ASSEMBLY__ */
> +
> +#include <asm-generic/pgtable-geometry.h>
> +
>  #endif /* __ASM_CSKY_PAGE_H */
> diff --git a/arch/hexagon/include/asm/page.h b/arch/hexagon/include/asm/page.h
> index 8a6af57274c2d..ba7ad5231695f 100644
> --- a/arch/hexagon/include/asm/page.h
> +++ b/arch/hexagon/include/asm/page.h
> @@ -139,4 +139,6 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
>  #endif /* ifdef __ASSEMBLY__ */
>  #endif /* ifdef __KERNEL__ */
>  
> +#include <asm-generic/pgtable-geometry.h>
> +
>  #endif
> diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
> index e85df33f11c77..9862e8fb047a6 100644
> --- a/arch/loongarch/include/asm/page.h
> +++ b/arch/loongarch/include/asm/page.h
> @@ -123,4 +123,6 @@ extern int __virt_addr_valid(volatile void *kaddr);
>  
>  #endif /* !__ASSEMBLY__ */
>  
> +#include <asm-generic/pgtable-geometry.h>
> +
>  #endif /* _ASM_PAGE_H */
> diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
> index 8cfb84b499751..4df4681b02194 100644
> --- a/arch/m68k/include/asm/page.h
> +++ b/arch/m68k/include/asm/page.h
> @@ -60,5 +60,6 @@ extern unsigned long _ramend;
>  
>  #include <asm-generic/getorder.h>
>  #include <asm-generic/memory_model.h>
> +#include <asm-generic/pgtable-geometry.h>
>  
>  #endif /* _M68K_PAGE_H */
> diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
> index 8810f4f1c3b02..abc23c3d743bd 100644
> --- a/arch/microblaze/include/asm/page.h
> +++ b/arch/microblaze/include/asm/page.h
> @@ -142,5 +142,6 @@ static inline const void *pfn_to_virt(unsigned long pfn)
>  
>  #include <asm-generic/memory_model.h>
>  #include <asm-generic/getorder.h>
> +#include <asm-generic/pgtable-geometry.h>
>  
>  #endif /* _ASM_MICROBLAZE_PAGE_H */
> diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
> index 4609cb0326cf3..3d91021538f02 100644
> --- a/arch/mips/include/asm/page.h
> +++ b/arch/mips/include/asm/page.h
> @@ -227,5 +227,6 @@ static inline unsigned long kaslr_offset(void)
>  
>  #include <asm-generic/memory_model.h>
>  #include <asm-generic/getorder.h>
> +#include <asm-generic/pgtable-geometry.h>
>  
>  #endif /* _ASM_PAGE_H */
> diff --git a/arch/nios2/include/asm/page.h b/arch/nios2/include/asm/page.h
> index 0722f88e63cc7..2e5f93beb42b7 100644
> --- a/arch/nios2/include/asm/page.h
> +++ b/arch/nios2/include/asm/page.h
> @@ -97,4 +97,6 @@ extern struct page *mem_map;
>  
>  #endif /* !__ASSEMBLY__ */
>  
> +#include <asm-generic/pgtable-geometry.h>
> +
>  #endif /* _ASM_NIOS2_PAGE_H */
> diff --git a/arch/openrisc/include/asm/page.h b/arch/openrisc/include/asm/page.h
> index 1d5913f67c312..a0da2a9842241 100644
> --- a/arch/openrisc/include/asm/page.h
> +++ b/arch/openrisc/include/asm/page.h
> @@ -88,5 +88,6 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
>  
>  #include <asm-generic/memory_model.h>
>  #include <asm-generic/getorder.h>
> +#include <asm-generic/pgtable-geometry.h>
>  
>  #endif /* __ASM_OPENRISC_PAGE_H */
> diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
> index 4bea2e95798f0..2a75496237c09 100644
> --- a/arch/parisc/include/asm/page.h
> +++ b/arch/parisc/include/asm/page.h
> @@ -173,6 +173,7 @@ extern int npmem_ranges;
>  
>  #include <asm-generic/memory_model.h>
>  #include <asm-generic/getorder.h>
> +#include <asm-generic/pgtable-geometry.h>
>  #include <asm/pdc.h>
>  
>  #define PAGE0   ((struct zeropage *)absolute_pointer(__PAGE_OFFSET))
> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
> index 83d0a4fc5f755..4601c115b6485 100644
> --- a/arch/powerpc/include/asm/page.h
> +++ b/arch/powerpc/include/asm/page.h
> @@ -300,4 +300,6 @@ static inline unsigned long kaslr_offset(void)
>  #include <asm-generic/memory_model.h>
>  #endif /* __ASSEMBLY__ */
>  
> +#include <asm-generic/pgtable-geometry.h>
> +
>  #endif /* _ASM_POWERPC_PAGE_H */
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 7ede2111c5917..e5af7579e45bf 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -204,5 +204,6 @@ static __always_inline void *pfn_to_kaddr(unsigned long pfn)
>  
>  #include <asm-generic/memory_model.h>
>  #include <asm-generic/getorder.h>
> +#include <asm-generic/pgtable-geometry.h>
>  
>  #endif /* _ASM_RISCV_PAGE_H */
> diff --git a/arch/s390/include/asm/page.h b/arch/s390/include/asm/page.h
> index 16e4caa931f1f..42157e7690a77 100644
> --- a/arch/s390/include/asm/page.h
> +++ b/arch/s390/include/asm/page.h
> @@ -275,6 +275,7 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
>  
>  #include <asm-generic/memory_model.h>
>  #include <asm-generic/getorder.h>
> +#include <asm-generic/pgtable-geometry.h>
>  
>  #define AMODE31_SIZE		(3 * PAGE_SIZE)
>  
> diff --git a/arch/sh/include/asm/page.h b/arch/sh/include/asm/page.h
> index f780b467e75d7..09533d46ef033 100644
> --- a/arch/sh/include/asm/page.h
> +++ b/arch/sh/include/asm/page.h
> @@ -162,5 +162,6 @@ typedef struct page *pgtable_t;
>  
>  #include <asm-generic/memory_model.h>
>  #include <asm-generic/getorder.h>
> +#include <asm-generic/pgtable-geometry.h>
>  
>  #endif /* __ASM_SH_PAGE_H */
> diff --git a/arch/sparc/include/asm/page.h b/arch/sparc/include/asm/page.h
> index 5e44cdf2a8f2b..4327fe2bfa010 100644
> --- a/arch/sparc/include/asm/page.h
> +++ b/arch/sparc/include/asm/page.h
> @@ -9,4 +9,7 @@
>  #else
>  #include <asm/page_32.h>
>  #endif
> +
> +#include <asm-generic/pgtable-geometry.h>
> +
>  #endif
> diff --git a/arch/um/include/asm/page.h b/arch/um/include/asm/page.h
> index 9ef9a8aedfa66..f26011808f514 100644
> --- a/arch/um/include/asm/page.h
> +++ b/arch/um/include/asm/page.h
> @@ -119,4 +119,6 @@ extern unsigned long uml_physmem;
>  #define __HAVE_ARCH_GATE_AREA 1
>  #endif
>  
> +#include <asm-generic/pgtable-geometry.h>
> +
>  #endif	/* __UM_PAGE_H */
> diff --git a/arch/x86/include/asm/page_types.h b/arch/x86/include/asm/page_types.h
> index 52f1b4ff0cc16..6d2381342047f 100644
> --- a/arch/x86/include/asm/page_types.h
> +++ b/arch/x86/include/asm/page_types.h
> @@ -71,4 +71,6 @@ extern void initmem_init(void);
>  
>  #endif	/* !__ASSEMBLY__ */
>  
> +#include <asm-generic/pgtable-geometry.h>
> +
>  #endif	/* _ASM_X86_PAGE_DEFS_H */
> diff --git a/arch/xtensa/include/asm/page.h b/arch/xtensa/include/asm/page.h
> index 4db56ef052d22..86952cb32af23 100644
> --- a/arch/xtensa/include/asm/page.h
> +++ b/arch/xtensa/include/asm/page.h
> @@ -200,4 +200,5 @@ static inline unsigned long ___pa(unsigned long va)
>  #endif /* __ASSEMBLY__ */
>  
>  #include <asm-generic/memory_model.h>
> +#include <asm-generic/pgtable-geometry.h>
>  #endif /* _XTENSA_PAGE_H */
> diff --git a/include/asm-generic/pgtable-geometry.h b/include/asm-generic/pgtable-geometry.h
> new file mode 100644
> index 0000000000000..358e729a6ac37
> --- /dev/null
> +++ b/include/asm-generic/pgtable-geometry.h
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef ASM_GENERIC_PGTABLE_GEOMETRY_H
> +#define ASM_GENERIC_PGTABLE_GEOMETRY_H
> +
> +#if   defined(PAGE_SHIFT_MAX) && defined(PAGE_SIZE_MAX) && defined(PAGE_MASK_MAX) && \
> +      defined(PAGE_SHIFT_MIN) && defined(PAGE_SIZE_MIN) && defined(PAGE_MASK_MIN)
> +/* Arch supports boot-time page size selection. */
> +#elif defined(PAGE_SHIFT_MAX) || defined(PAGE_SIZE_MAX) || defined(PAGE_MASK_MAX) || \
> +      defined(PAGE_SHIFT_MIN) || defined(PAGE_SIZE_MIN) || defined(PAGE_MASK_MIN)
> +#error Arch must define all or none of the boot-time page size macros
> +#else
> +/* Arch does not support boot-time page size selection. */
> +#define PAGE_SHIFT_MIN	PAGE_SHIFT
> +#define PAGE_SIZE_MIN	PAGE_SIZE
> +#define PAGE_MASK_MIN	PAGE_MASK
> +#define PAGE_SHIFT_MAX	PAGE_SHIFT
> +#define PAGE_SIZE_MAX	PAGE_SIZE
> +#define PAGE_MASK_MAX	PAGE_MASK
> +#endif
> +
> +/*
> + * Define a global variable (scalar or struct), whose value is derived from
> + * PAGE_SIZE and friends. When PAGE_SIZE is a compile-time constant, the global
> + * variable is simply defined with the static value. When PAGE_SIZE is
> + * determined at boot-time, a pure initcall is registered and run during boot to
> + * initialize the variable.
> + *
> + * @type: Unqualified type. Do not include "const"; implied by macro variant.
> + * @name: Variable name.
> + * @...:  Initialization value. May be scalar or initializer.
> + *
> + * "static" is declared by placing "static" before the macro.
> + *
> + * Example:
> + *
> + * struct my_struct {
> + *         int a;
> + *         char b;
> + * };
> + *
> + * static DEFINE_GLOBAL_PAGE_SIZE_VAR(struct my_struct, my_variable, {
> + *         .a = 10,
> + *         .b = 'e',
> + * });
> + */
> +#if PAGE_SIZE_MIN != PAGE_SIZE_MAX
> +#define __DEFINE_GLOBAL_PAGE_SIZE_VAR(type, name, attrib, ...)		\
> +	type name attrib;						\
> +	static int __init __attribute__((constructor)) __##name##_init(void)	\
> +	{								\
> +		name = (type)__VA_ARGS__;				\
> +		return 0;						\
> +	}
> +
> +#define DEFINE_GLOBAL_PAGE_SIZE_VAR(type, name, ...)			\
> +	__DEFINE_GLOBAL_PAGE_SIZE_VAR(type, name, , __VA_ARGS__)
> +
> +#define DEFINE_GLOBAL_PAGE_SIZE_VAR_CONST(type, name, ...)		\
> +	__DEFINE_GLOBAL_PAGE_SIZE_VAR(type, name, __ro_after_init, __VA_ARGS__)
> +#else /* PAGE_SIZE_MIN == PAGE_SIZE_MAX */
> +#define __DEFINE_GLOBAL_PAGE_SIZE_VAR(type, name, attrib, ...)		\
> +	type name attrib = __VA_ARGS__;					\
> +
> +#define DEFINE_GLOBAL_PAGE_SIZE_VAR(type, name, ...)			\
> +	__DEFINE_GLOBAL_PAGE_SIZE_VAR(type, name, , __VA_ARGS__)
> +
> +#define DEFINE_GLOBAL_PAGE_SIZE_VAR_CONST(type, name, ...)		\
> +	__DEFINE_GLOBAL_PAGE_SIZE_VAR(const type, name, , __VA_ARGS__)
> +#endif
> +
> +#endif /* ASM_GENERIC_PGTABLE_GEOMETRY_H */
> diff --git a/init/main.c b/init/main.c
> index 206acdde51f5a..ba1515eb20b9d 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -899,6 +899,8 @@ static void __init early_numa_node_init(void)
>  #endif
>  }
>  
> +static __init void do_ctors(void);
> +
>  asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
>  void start_kernel(void)
>  {
> @@ -910,6 +912,8 @@ void start_kernel(void)
>  	debug_objects_early_init();
>  	init_vmlinux_build_id();
>  
> +	do_ctors();
> +
>  	cgroup_init_early();
>  
>  	local_irq_disable();
> @@ -1360,7 +1364,6 @@ static void __init do_basic_setup(void)
>  	cpuset_init_smp();
>  	driver_init();
>  	init_irq_proc();
> -	do_ctors();
>  	do_initcalls();
>  }
>  


