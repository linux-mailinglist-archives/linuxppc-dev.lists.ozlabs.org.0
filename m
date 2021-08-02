Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B915E3DE323
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 01:38:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdvZm46qCz3cJW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 09:38:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mk/OrQNA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mk/OrQNA; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdN214dCtz2yP0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 12:56:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GdN1V04FQz9sW5;
 Mon,  2 Aug 2021 12:56:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627872995;
 bh=lgFF44D+VvUgGNOcyjoWgD9ieIKlVa+1W38G93yYucc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mk/OrQNAgyUtJh9QVu/sq6e2cVKMZEuh5t1elkMY1Gr3oABbY0LNl7+izatEJSZYL
 zGYgU92C+VtRG3i2VpinkrgquF7osc3y3sT0rg1Dkyhhq3uC9pQ9Vyxzu9DIdALkJc
 uVe/31b8NqskHAYnC6qUpRqajmu4XqURQ3LIDSg6AKfjRRV0hOE1uY7cgZepVTdX9e
 8HP4jyVzz75vtA5OgyyRq7pJjgDvTYCj/aQ+sFQ1koQ2SqpBgqVF2xnWntozO8y/pw
 uq0H9be0uwkFpXGGeabu1UoeiTG0mQrIQSbO5Gdvb2ehvStkNDQgftwpI5d9vMxe/C
 vq3iTIN0uJtjQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
Date: Mon, 02 Aug 2021 12:56:13 +1000
Message-ID: <87lf5klfle.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 03 Aug 2021 09:38:00 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, "H. Peter
 Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 YiFei Zhu <yifeifz2@illinois.edu>, Richard Weinberger <richard@nod.at>,
 Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Stafford Horne <shorne@gmail.com>, linux-snps-arc@lists.infradead.org,
 Jeff Dike <jdike@addtoit.com>, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@gmail.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Frederic Weisbecker <frederic@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-hexagon@vger.kernel.org, Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Helge Deller <deller@gmx.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/Kconfig                  | 3 +++
>  arch/arc/Kconfig              | 4 +---
>  arch/arm/Kconfig              | 5 +----
>  arch/arm64/Kconfig            | 4 +---
>  arch/csky/Kconfig             | 4 +---
>  arch/hexagon/Kconfig          | 4 +---
>  arch/microblaze/Kconfig       | 1 +
>  arch/microblaze/Kconfig.debug | 5 -----
>  arch/mips/Kconfig             | 1 +
>  arch/mips/Kconfig.debug       | 4 ----
>  arch/nds32/Kconfig            | 4 +---
>  arch/nios2/Kconfig            | 3 ---
>  arch/openrisc/Kconfig         | 4 +---
>  arch/parisc/Kconfig           | 1 +
>  arch/parisc/Kconfig.debug     | 3 ---
>  arch/powerpc/Kconfig          | 5 +----
>  arch/riscv/Kconfig            | 4 +---
>  arch/s390/Kconfig             | 1 +
>  arch/s390/Kconfig.debug       | 3 ---
>  arch/sh/Kconfig               | 1 +
>  arch/sh/Kconfig.debug         | 3 ---
>  arch/sparc/Kconfig            | 1 +
>  arch/sparc/Kconfig.debug      | 4 ----
>  arch/um/Kconfig               | 5 +----
>  arch/x86/Kconfig              | 1 +
>  arch/x86/Kconfig.debug        | 3 ---
>  arch/xtensa/Kconfig           | 4 +---
>  27 files changed, 21 insertions(+), 64 deletions(-)

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d01e3401581d..76a28452c042 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -94,10 +94,6 @@ config STACKTRACE_SUPPORT
>  	bool
>  	default y
>  
> -config TRACE_IRQFLAGS_SUPPORT
> -	bool
> -	default y
> -
>  config LOCKDEP_SUPPORT
>  	bool
>  	default y
> @@ -271,6 +267,7 @@ config PPC
>  	select STRICT_KERNEL_RWX if STRICT_MODULE_RWX
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
> +	select TRACE_IRQFLAGS_SUPPORT
>  	select VIRT_TO_BUS			if !PPC64
>  	#
>  	# Please keep this list sorted alphabetically.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
