Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFCE87448C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 00:42:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dfxSn7ES;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tqpqk55WCz3vZn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 10:41:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dfxSn7ES;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tqppw4p6wz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 10:41:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709768472;
	bh=OHx3bVLlXnvaD4Lk/LqRAXihRU8d5iuk+jHowRU57+A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dfxSn7ESt9feXa7Ah5VgnrgsTR94t0TrfqG0PcTuTf3mOM2nYClb7KzncEO44oWvJ
	 z177IwNoKxwaRwuRElWO9dM9vGP1BGgcQEfox5PbPq0mqdcUVphkGszRXScQ0d7mcO
	 jW4ikoUKpq/rq3DBl50CSj6CPBHJDbwDqtBF6NxW+foiGgFyBpZYE+I728npTZNMg3
	 1t/2+QbQypMyzr9+0O+l4J8vO9YugJeJGU6R2JxmPiIz07vqQ4qeSoMI/Ta1CVt4Pi
	 EW9aQ8ONAeTLEZ2I6yd+B+il/wLckJElOl67KFtvN0q8NsP2LkndTztEXc4YygJJsv
	 te7iy+1YEdhjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tqppm50HGz4wcN;
	Thu,  7 Mar 2024 10:41:04 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2 1/3] arch: consolidate existing CONFIG_PAGE_SIZE_*KB
 definitions
In-Reply-To: <20240306141453.3900574-2-arnd@kernel.org>
References: <20240306141453.3900574-1-arnd@kernel.org>
 <20240306141453.3900574-2-arnd@kernel.org>
Date: Thu, 07 Mar 2024 10:41:02 +1100
Message-ID: <87sf13nd2p.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quici
 nc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Kieran Bingham <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

Arnd Bergmann <arnd@kernel.org> writes:
> From: Arnd Bergmann <arnd@arndb.de>
>
> These four architectures define the same Kconfig symbols for configuring
> the page size. Move the logic into a common place where it can be shared
> with all other architectures.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Changes from v1:
>  - improve Kconfig help texts
>  - fix Hexagon Kconfig
>
>  arch/Kconfig                      | 92 ++++++++++++++++++++++++++++++-
>  arch/hexagon/Kconfig              | 24 ++------
>  arch/hexagon/include/asm/page.h   |  6 +-
>  arch/loongarch/Kconfig            | 21 ++-----
>  arch/loongarch/include/asm/page.h | 10 +---
>  arch/mips/Kconfig                 | 58 ++-----------------
>  arch/mips/include/asm/page.h      | 16 +-----
>  arch/sh/include/asm/page.h        | 13 +----
>  arch/sh/mm/Kconfig                | 42 ++++----------
>  9 files changed, 121 insertions(+), 161 deletions(-)

There's a few "help" lines missing, which breaks the build:

  arch/Kconfig:1134: syntax error
  arch/Kconfig:1133: invalid statement
  arch/Kconfig:1134: invalid statement
  arch/Kconfig:1135:warning: ignoring unsupported character '.'
  arch/Kconfig:1135:warning: ignoring unsupported character '.'
  arch/Kconfig:1135: invalid statement
  arch/Kconfig:1136: invalid statement
  arch/Kconfig:1137:warning: ignoring unsupported character '.'
  arch/Kconfig:1137: invalid statement
  arch/Kconfig:1143: syntax error
  arch/Kconfig:1142: invalid statement
  arch/Kconfig:1143: invalid statement
  arch/Kconfig:1144:warning: ignoring unsupported character '.'
  arch/Kconfig:1144: invalid statement
  arch/Kconfig:1145: invalid statement
  arch/Kconfig:1146: invalid statement
  arch/Kconfig:1147: invalid statement
  arch/Kconfig:1148:warning: ignoring unsupported character '.'
  arch/Kconfig:1148: invalid statement
  make[4]: *** [../scripts/kconfig/Makefile:85: syncconfig] Error 1

Fixup diff is:

diff --git a/arch/Kconfig b/arch/Kconfig
index 56d45a75f625..f2295fa3b48c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1130,6 +1130,7 @@ config PAGE_SIZE_16KB
 config PAGE_SIZE_32KB
        bool "32KiB pages"
        depends on HAVE_PAGE_SIZE_32KB
+       help
          Using 32KiB page size will result in slightly higher performance
          kernel at the price of higher memory consumption compared to
          16KiB pages.  This option is available only on cnMIPS cores.
@@ -1139,6 +1140,7 @@ config PAGE_SIZE_32KB
 config PAGE_SIZE_64KB
        bool "64KiB pages"
        depends on HAVE_PAGE_SIZE_64KB
+       help
          Using 64KiB page size will result in slightly higher performance
          kernel at the price of much higher memory consumption compared to
          4KiB or 16KiB pages.


cheers
