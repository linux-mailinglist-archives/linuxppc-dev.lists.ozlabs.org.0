Return-Path: <linuxppc-dev+bounces-11291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA75B35436
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:19:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yDW4cTbz3dK3;
	Tue, 26 Aug 2025 16:19:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189153;
	cv=none; b=EYsn2VnFHlFweoWuvd/6goGVjBmpVwakJF3BjU4ZKxWHWW4D8GaijuKkS3Sf5NaPWQaoXen5+9CuuKztG4ZEXU1MPqtx9R7+Ii/4IbpLTUGYD+PPBVjEofu8bmbBbMLXI7zqZrwT2a8+R4zQbne3uDwpMNzLiOuEykonGdcKlaRiLPDP8xpZh4kV2VL+ehIQwrmfzEUmejo80aRCjXzggPsueJjL2NUogmOFjwZCZmETfh6JwbiDB+mbrIiJbNZNqdZ0QotVAMqSZmMncxpBwcBWUsOjiuAe4YisNv73ml7cDTCZ3r+8XNy7GbU2KqCHgdzNENbwpYhHnafQeKfc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189153; c=relaxed/relaxed;
	bh=HfAvYUxv3s9XKBImIakj8GXd2hgk5QRNQQC7FW4cjt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHykTDy1rsn+UtLA+vddsB0hKA44kss2aHgzQd+Z+7QCK9mOaswrxJjNREnd+m/Hh254BPHow4lSopltedFg2rWhiARd0dp+UNGU6nyjJMDrNXqj3s+LeOdmNgTL2x3K+hGAAXV1eSW5nIr5UNYKqdv5csjPp1uGHOI7JUoFZ77xGYDPBRNgQplj2jVz3cettWG0DSLlIvQ+ORPh6H6GewFVvSGh876+sRDYYHN0GG3QFWgTg7P2ih2447WaXl3B6BLxZRr0D94X9UnpOVn3dixXMt1cUUdgOc1mXhs1cdf+zQsU6oqlFaivPvlfn2JubL9/RoEKGoC/ATc9bXQNug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CffaJqA5; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=q6BWF05Q; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CffaJqA5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=q6BWF05Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c9yCb6S4Qz3dJX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:18:29 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfAvYUxv3s9XKBImIakj8GXd2hgk5QRNQQC7FW4cjt4=;
	b=CffaJqA5rsLpXWqtw3f39vxIq72rtPSbTis/OEKKsYWwPUec05NUKa0lPRbguDeq+uu38S
	3NFM99Ki94UQstG1VMY2CGSg+hq7AbvA6zg+C+bP9sSvPb/lmNV1XcXNvGv4NO+gdCJiTJ
	F0vKD5/RKqooZcBm5Qr6sSNWUp0GY9+7LT/fLhaBiLyT/PbkrhazJkqrptqY/TUmuaFrPv
	yHOJtuEeTW57C+suLl7kDyfOZdwa3rDWpoG7e4q0vO2W/nJMjiWimAX/qJJmgt1JVY6+EN
	ys8w+2HNfxqGMLJZbQv/ICj0IcuRaCHeepjdlNgKkGD66gzUFpCGgSG9JqosYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfAvYUxv3s9XKBImIakj8GXd2hgk5QRNQQC7FW4cjt4=;
	b=q6BWF05Q67M+a3SeKYmCy1eWKcKb5dNs+NjtEBA+0XviDim16s93yYLfPQLe33toJrC2Vy
	I8vMrv/opXDeLlCw==
Date: Tue, 26 Aug 2025 08:17:09 +0200
Subject: [PATCH 06/11] riscv: vdso: Untangle kconfig logic
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-vdso-cleanups-v1-6-d9b65750e49f@linutronix.de>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
In-Reply-To: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=2848;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2HUR3b3XiF14rTZqp00VBNDZFgL9jjx0Ea79UoT5jM0=;
 b=2hMcbjqMUE+qJLwmgpoY1wgcMoYGpME1ZDwZAE0d5fqg8MI8j+0QAYV7x68fNUjZIXMNYkZj3
 Hx9qICkN7nyDHu5XdS8/Dovk5FCyrPAbpK6r8pqP2D3CWdV/qVtsIiM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	UPPERCASE_50_75 autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On riscv32 the generic vDSO infrastructure is used but without its
time-related functionality. The kconfig logic to implement this
treats HAVE_GENERIC_VDSO as a synonym for GENERIC_GETTIMEOFDAY.
This works today due to some underlying issues in how the generic vDSO
library works. Some future cleanups will break this logic.

Restructure the kconfig logic, so HAVE_GENERIC_VDSO refers to the generic
library in general and GENERIC_GETTIMEOFDAY refers to its time-related
functionality.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/riscv/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a4b233a0659ed80c0eb6b118ea8c8db81ed3fdba..e4ac0e833ecfdb976134e9009a2cdfdea789f13d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -52,7 +52,7 @@ config RISCV
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN
-	select ARCH_HAS_VDSO_ARCH_DATA if GENERIC_VDSO_DATA_STORE
+	select ARCH_HAS_VDSO_ARCH_DATA if HAVE_GENERIC_VDSO
 	select ARCH_KEEP_MEMBLOCK if ACPI
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
@@ -107,7 +107,7 @@ config RISCV
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_ENTRY
-	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
+	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO && 64BIT
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP if MMU
 	select GENERIC_IRQ_IPI if SMP
@@ -120,9 +120,9 @@ config RISCV
 	select GENERIC_PCI_IOMAP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
-	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
-	select GENERIC_VDSO_DATA_STORE if MMU
-	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
+	select GENERIC_TIME_VSYSCALL if GENERIC_GETTIMEOFDAY
+	select GENERIC_VDSO_DATA_STORE if HAVE_GENERIC_VDSO
+	select GENERIC_VDSO_TIME_NS if GENERIC_GETTIMEOFDAY
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
 	select HAVE_ALIGNED_STRUCT_PAGE
@@ -165,7 +165,7 @@ config RISCV
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_GCC_PLUGINS
-	select HAVE_GENERIC_VDSO if MMU && 64BIT
+	select HAVE_GENERIC_VDSO if MMU
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KERNEL_BZIP2 if !XIP_KERNEL && !EFI_ZBOOT
 	select HAVE_KERNEL_GZIP if !XIP_KERNEL && !EFI_ZBOOT
@@ -221,7 +221,7 @@ config RISCV
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
-	select VDSO_GETRANDOM if HAVE_GENERIC_VDSO
+	select VDSO_GETRANDOM if HAVE_GENERIC_VDSO && 64BIT
 	select USER_STACKTRACE_SUPPORT
 	select ZONE_DMA32 if 64BIT
 

-- 
2.50.1


