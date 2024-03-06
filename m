Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AF38738C1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 15:16:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LqIp2kZT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqZGk2Pl2z3dSr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 01:15:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LqIp2kZT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqZG12XM6z3cgJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 01:15:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E69E5CE21D8;
	Wed,  6 Mar 2024 14:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F782C433F1;
	Wed,  6 Mar 2024 14:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709734517;
	bh=6p2hAt3DJTtWEmWkGiNmsPvIqV/lUSZTutyoSUX5wpE=;
	h=From:To:Cc:Subject:Date:From;
	b=LqIp2kZTKEk6BDtlGN9YtFBVHmwGfTij/0yFkUBE5XGhta0eqXHuPZZJ3/MIusuUG
	 1/ai7edE6AbiuxHWjDBSN5GwSx4jO1RwWivNR0PUtakQUcitU1uJh1+vHWYGSiPn+I
	 /dBaVrtPErxMiFpuWjYe3LW95xWi64gxsDrEvpuJ8OizSORBDPypoeSsLWyXEUGdmf
	 fJeiWqTrhJi5qxh7Jya6058wrIYZrMi99CnlK2WXNiIm+MJuSG+gSvaihlsEMOBWt5
	 2fKuqVl7eyYLUWkzPRqLl2zDWANVIuecGX2Qr2I58K0QII0FK3WksaSXHLTuDSmpIM
	 TYoPCbqqY5j5A==
From: Arnd Bergmann <arnd@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Kees Cook <keescook@chromium.org>
Subject: [v2 PATCH 0/3] arch: mm, vdso: consolidate PAGE_SIZE definition
Date: Wed,  6 Mar 2024 15:14:50 +0100
Message-Id: <20240306141453.3900574-1-arnd@kernel.org>
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

The vdso patch series now has a temporary workaround, but I still want to
get this into v6.9 so we can place the hack with CONFIG_PAGE_SIZE
in the vdso.

I've applied this to the asm-generic tree already, please let me know if
there are still remaining issues. It's really close to the merge window
already, so I'd probably give this a few more days before I send a pull
request, or defer it to v6.10 if anything goes wrong.

Sorry for the delay, I was still waiting to resolve the m68k question,
but there were no further replies in the end, so I kept my original
version.

Changes from v1:

 - improve Kconfig help texts
 - remove an extraneous line in hexagon

      Arnd

Link: https://lore.kernel.org/lkml/CA+G9fYtrXXm_KO9fNPz3XaRxHV7UD_yQp-TEuPQrNRHU+_0W_Q@mail.gmail.com/
Link: https://lore.kernel.org/all/65dc6c14.170a0220.f4a3f.91dd@mx.google.com/
Link: https://lore.kernel.org/lkml/20240226161414.2316610-1-arnd@kernel.org/

Arnd Bergmann (3):
  arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
  arch: simplify architecture specific page size configuration
  arch: define CONFIG_PAGE_SIZE_*KB on all architectures

 arch/Kconfig                       | 92 +++++++++++++++++++++++++++++-
 arch/alpha/Kconfig                 |  1 +
 arch/alpha/include/asm/page.h      |  2 +-
 arch/arc/Kconfig                   |  3 +
 arch/arc/include/uapi/asm/page.h   |  6 +-
 arch/arm/Kconfig                   |  1 +
 arch/arm/include/asm/page.h        |  2 +-
 arch/arm64/Kconfig                 | 29 +++++-----
 arch/arm64/include/asm/page-def.h  |  2 +-
 arch/csky/Kconfig                  |  1 +
 arch/csky/include/asm/page.h       |  2 +-
 arch/hexagon/Kconfig               | 24 ++------
 arch/hexagon/include/asm/page.h    |  6 +-
 arch/loongarch/Kconfig             | 21 ++-----
 arch/loongarch/include/asm/page.h  | 10 +---
 arch/m68k/Kconfig                  |  3 +
 arch/m68k/Kconfig.cpu              |  2 +
 arch/m68k/include/asm/page.h       |  6 +-
 arch/microblaze/Kconfig            |  1 +
 arch/microblaze/include/asm/page.h |  2 +-
 arch/mips/Kconfig                  | 58 ++-----------------
 arch/mips/include/asm/page.h       | 16 +-----
 arch/nios2/Kconfig                 |  1 +
 arch/nios2/include/asm/page.h      |  2 +-
 arch/openrisc/Kconfig              |  1 +
 arch/openrisc/include/asm/page.h   |  2 +-
 arch/parisc/Kconfig                |  3 +
 arch/parisc/include/asm/page.h     | 10 +---
 arch/powerpc/Kconfig               | 31 ++--------
 arch/powerpc/include/asm/page.h    |  2 +-
 arch/riscv/Kconfig                 |  1 +
 arch/riscv/include/asm/page.h      |  2 +-
 arch/s390/Kconfig                  |  1 +
 arch/s390/include/asm/page.h       |  2 +-
 arch/sh/include/asm/page.h         | 13 +----
 arch/sh/mm/Kconfig                 | 42 ++++----------
 arch/sparc/Kconfig                 |  2 +
 arch/sparc/include/asm/page_32.h   |  2 +-
 arch/sparc/include/asm/page_64.h   |  3 +-
 arch/um/Kconfig                    |  1 +
 arch/um/include/asm/page.h         |  2 +-
 arch/x86/Kconfig                   |  1 +
 arch/x86/include/asm/page_types.h  |  2 +-
 arch/xtensa/Kconfig                |  1 +
 arch/xtensa/include/asm/page.h     |  2 +-
 scripts/gdb/linux/constants.py.in  |  2 +-
 scripts/gdb/linux/mm.py            |  2 +-
 47 files changed, 185 insertions(+), 238 deletions(-)

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
