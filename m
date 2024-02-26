Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21507867B67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:15:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ouv+E5W1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk5LX6Cb3z3vfJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 03:15:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ouv+E5W1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk5Kq0qsMz2xb2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 03:14:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 68305CE181F;
	Mon, 26 Feb 2024 16:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D63C433C7;
	Mon, 26 Feb 2024 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708964073;
	bh=zxbqCp3xg1MTZv6nVkuYc0VOPy7Z/0KoLu5xdBZOcDY=;
	h=From:To:Cc:Subject:Date:From;
	b=ouv+E5W1cQ1zHWEvJshxERHNgYSjJzR7JdvZMtKsmjTnnYsjb50xz7yQ6NNDLjL+R
	 zIivYPxRBLqLiotGJhvVTBVfzRjkLFR+UKz+Blle7mLm83hZaxjZLxJiSIm8KsFpk8
	 T2yQYC7g3LmUbscrU9t5jUZdMHfRtyoT7a/p66cZn/Wi8wvAOCFlueNWvORfaCli+Z
	 S5t1BgjPEeJ3eGf1KMTEe7SIO0Rv5QLKXRaKqNQXL1yQWzRzHXLOOgf0gh7VMNEgGS
	 /h/uyIFz30OGZTAygrSMurYRpnmZAOjoQMG9QUrFxlxLnbjp2UPK2IvIxVWUAhRAM9
	 8PLY/d6Nx9Yzg==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: [PATCH 0/4] arch: mm, vdso: consolidate PAGE_SIZE definition
Date: Mon, 26 Feb 2024 17:14:10 +0100
Message-Id: <20240226161414.2316610-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.
 infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Naresh noticed that the newly added usage of the PAGE_SIZE macro in
include/vdso/datapage.h introduced a build regression. I had an older
patch that I revived to have this defined through Kconfig rather than
through including asm/page.h, which is not allowed in vdso code.

I rebased and tested on top of the tip/timers/core branch that
introduced the regression. If these patches get added, the
compat VDSOs all build again, but the changes are a bit invasive.

      Arnd

Link: https://lore.kernel.org/lkml/CA+G9fYtrXXm_KO9fNPz3XaRxHV7UD_yQp-TEuPQrNRHU+_0W_Q@mail.gmail.com/
Link: https://lore.kernel.org/all/65dc6c14.170a0220.f4a3f.91dd@mx.google.com/

Arnd Bergmann (4):
  arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
  arch: simplify architecture specific page size configuration
  arch: define CONFIG_PAGE_SIZE_*KB on all architectures
  vdso: avoid including asm/page.h

 arch/Kconfig                       | 58 ++++++++++++++++++++++++++++--
 arch/alpha/Kconfig                 |  1 +
 arch/alpha/include/asm/page.h      |  2 +-
 arch/arc/Kconfig                   |  3 ++
 arch/arc/include/uapi/asm/page.h   |  6 ++--
 arch/arm/Kconfig                   |  1 +
 arch/arm/include/asm/page.h        |  2 +-
 arch/arm64/Kconfig                 | 29 +++++++--------
 arch/arm64/include/asm/page-def.h  |  2 +-
 arch/csky/Kconfig                  |  1 +
 arch/csky/include/asm/page.h       |  2 +-
 arch/hexagon/Kconfig               | 25 +++----------
 arch/hexagon/include/asm/page.h    |  6 +---
 arch/loongarch/Kconfig             | 21 ++++-------
 arch/loongarch/include/asm/page.h  | 10 +-----
 arch/m68k/Kconfig                  |  3 ++
 arch/m68k/Kconfig.cpu              |  2 ++
 arch/m68k/include/asm/page.h       |  6 +---
 arch/microblaze/Kconfig            |  1 +
 arch/microblaze/include/asm/page.h |  2 +-
 arch/mips/Kconfig                  | 58 +++---------------------------
 arch/mips/include/asm/page.h       | 16 +--------
 arch/nios2/Kconfig                 |  1 +
 arch/nios2/include/asm/page.h      |  2 +-
 arch/openrisc/Kconfig              |  1 +
 arch/openrisc/include/asm/page.h   |  2 +-
 arch/parisc/Kconfig                |  3 ++
 arch/parisc/include/asm/page.h     | 10 +-----
 arch/powerpc/Kconfig               | 31 ++++------------
 arch/powerpc/include/asm/page.h    |  2 +-
 arch/riscv/Kconfig                 |  1 +
 arch/riscv/include/asm/page.h      |  2 +-
 arch/s390/Kconfig                  |  1 +
 arch/s390/include/asm/page.h       |  2 +-
 arch/sh/include/asm/page.h         | 13 +------
 arch/sh/mm/Kconfig                 | 42 +++++++---------------
 arch/sparc/Kconfig                 |  2 ++
 arch/sparc/include/asm/page_32.h   |  2 +-
 arch/sparc/include/asm/page_64.h   |  3 +-
 arch/um/Kconfig                    |  1 +
 arch/um/include/asm/page.h         |  2 +-
 arch/x86/Kconfig                   |  1 +
 arch/x86/include/asm/page_types.h  |  2 +-
 arch/xtensa/Kconfig                |  1 +
 arch/xtensa/include/asm/page.h     |  2 +-
 include/vdso/datapage.h            |  4 +--
 scripts/gdb/linux/constants.py.in  |  2 +-
 scripts/gdb/linux/mm.py            |  2 +-
 48 files changed, 153 insertions(+), 241 deletions(-)

-- 
2.39.2
To: Thomas Gleixner <tglx@linutronix.de>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: Kees Cook <keescook@chromium.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Brian Cain <bcain@quicinc.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: x86@kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Kieran Bingham <kbingham@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-hexagon@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-openrisc@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-um@lists.infradead.org
