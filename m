Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D277427B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 15:49:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=xen0n.name header.i=@xen0n.name header.a=rsa-sha256 header.s=mail header.b=jUu9zRsE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsKZ973Vjz3blb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 23:49:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=xen0n.name header.i=@xen0n.name header.a=rsa-sha256 header.s=mail header.b=jUu9zRsE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xen0n.name (client-ip=115.28.160.31; helo=mailbox.box.xen0n.name; envelope-from=kernel@xen0n.name; receiver=lists.ozlabs.org)
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsJMV0f7Dz303d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 22:55:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1688043306; bh=qlzO1nAzqPvB+Hzmr0HgbCqGg7RmBSNwRMReUr64bck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jUu9zRsEygCOa39ZCgxRiLbKjXTQyAk3/vq1UdG1rNhZGoBj1lnigTzep51CpGxAI
	 Bi14AsqbPSnMerzIsKznCyRo9Sr6o9nEuXrSMeAlj3HQr2VxpcMMRF4Ii1rtyOqAct
	 kG/wvCT5WHvifhVE0+KGx6hx6hBDjd766/gHEM8M=
Received: from [100.100.34.13] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id D6696600AE;
	Thu, 29 Jun 2023 20:55:02 +0800 (CST)
Message-ID: <6906281a-baa8-a960-e679-69d1e714e713@xen0n.name>
Date: Thu, 29 Jun 2023 20:55:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 06/12] arch: Declare screen_info in <asm/screen_info.h>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de, deller@gmx.de,
 daniel@ffwll.ch, airlied@gmail.com
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-7-tzimmermann@suse.de>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20230629121952.10559-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 29 Jun 2023 23:48:03 +1000
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
Cc: linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Moln
 ar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Sami Tolvanen <samitolvanen@google.com>, Juerg Haefliger <juerg.haefliger@canonical.com>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Chris Zankel <chris@zankel.net>, Frederic Weisbecker <frederic@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Zi Yan <ziy@nvidia.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, Niklas Schnelle <schnelle@linux.ibm.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguye
 n@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, x86@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/6/29 19:45, Thomas Zimmermann wrote:
> The variable screen_info does not exist on all architectures. Declare
> it in <asm-generic/screen_info.h>. All architectures that do declare it
> will provide it via <asm/screen_info.h>.
> 
> Add the Kconfig token ARCH_HAS_SCREEN_INFO to guard against access on
> architectures that don't provide screen_info.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Brian Cain <bcain@quicinc.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Juerg Haefliger <juerg.haefliger@canonical.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Zi Yan <ziy@nvidia.com>
> ---
>   arch/Kconfig                      |  6 ++++++
>   arch/alpha/Kconfig                |  1 +
>   arch/arm/Kconfig                  |  1 +
>   arch/arm64/Kconfig                |  1 +
>   arch/csky/Kconfig                 |  1 +
>   arch/hexagon/Kconfig              |  1 +
>   arch/ia64/Kconfig                 |  1 +
>   arch/loongarch/Kconfig            |  1 +
>   arch/mips/Kconfig                 |  1 +
>   arch/nios2/Kconfig                |  1 +
>   arch/powerpc/Kconfig              |  1 +
>   arch/riscv/Kconfig                |  1 +
>   arch/sh/Kconfig                   |  1 +
>   arch/sparc/Kconfig                |  1 +
>   arch/x86/Kconfig                  |  1 +
>   arch/xtensa/Kconfig               |  1 +
>   drivers/video/Kconfig             |  3 +++
>   include/asm-generic/Kbuild        |  1 +
>   include/asm-generic/screen_info.h | 12 ++++++++++++
>   include/linux/screen_info.h       |  2 +-
>   20 files changed, 38 insertions(+), 1 deletion(-)
>   create mode 100644 include/asm-generic/screen_info.h
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 205fd23e0cada..2f58293fd7bcb 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1466,6 +1466,12 @@ config ARCH_HAS_NONLEAF_PMD_YOUNG
>   	  address translations. Page table walkers that clear the accessed bit
>   	  may use this capability to reduce their search space.
>   
> +config ARCH_HAS_SCREEN_INFO
> +	bool
> +	help
> +	  Selected by architectures that provide a global instance of
> +	  screen_info.
> +
>   source "kernel/gcov/Kconfig"
>   
>   source "scripts/gcc-plugins/Kconfig"
> [snip]
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index d38b066fc931b..6aab2fb7753da 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -13,6 +13,7 @@ config LOONGARCH
>   	select ARCH_HAS_FORTIFY_SOURCE
>   	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>   	select ARCH_HAS_PTE_SPECIAL
> +	select ARCH_HAS_SCREEN_INFO
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_INLINE_READ_LOCK if !PREEMPTION
>   	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
> [snip]

Acked-by: WANG Xuerui <git@xen0n.name> # loongarch

Thanks!

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

