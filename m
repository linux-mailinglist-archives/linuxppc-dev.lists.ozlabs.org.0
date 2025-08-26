Return-Path: <linuxppc-dev+bounces-11293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FEFB3543C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:20:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yDX5P4Yz3dKL;
	Tue, 26 Aug 2025 16:19:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189164;
	cv=none; b=Il+i+mg2JTJbZGDj35ajKPqyl44w45YP6XKg4Cj/KL1Bk5GWR/ZhI0wzpeRKgIbbUd5UhACz3hupStOh+N/F7hbj+h1Gu+Okx/1g/C1Rky3wWJKONu+L66MQSckGSyAxM9Rvx02FAr3WN8+bjVPdbcUZ829d1sJ21/ED/CrnvPiFIr/ic1shr+RhM8JlqGKhFHbb33NRaDUJQEOBsYmPPmn2cngrhQEGhmbXJTmyKYSefLq9qupZAi02LQvPFNgcJ2x2WFAccc1rIFh6NF5Hr9loSSgPGGJ1Z4H0gXYXX4MdSPfXY0F5Kj/nzaa08SKXrVLjkztI6odVmu02UGWLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189164; c=relaxed/relaxed;
	bh=DrBALLudUMMQIpB9Jb++BwmBRlfN0yHG1/njX6fnTE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJX7dtUNjQ06J0TlsJ6+cuuZX2yp1CmO0xQ51OBS8jwilP6uM7Ku6rnnc2nWd0tXqY9Lyt/7faplY7NsdkbRfyUj6Ghacr7P/IfC7qpRo9OZ2gcyrHVMfgybsSBD97J0tD6W4Qnve4vG+JulDAYG3+h4P8BEdgbSIHr2cbVBy8e09o8JhTS6mEzokZsM7kT94E+9zl/hf9Fde6aW2DEBe8/l/y2b/QoGJI90pYTzTHBbrwQlHKijdNTwbCLM9J1dOATay+7/LKA4QBfe7J0+WUXCDvZNO9GdB9UhVvRKmI93b5CjKQ3+YwDrsh7n/7Bqx7GpPl4YSjYMTgh6IxpsDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=s4Tv7+zx; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aMy3eGdf; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=s4Tv7+zx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aMy3eGdf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c9yCZ2dqjz3dHf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:18:29 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrBALLudUMMQIpB9Jb++BwmBRlfN0yHG1/njX6fnTE0=;
	b=s4Tv7+zxFO1UuAQBOJqY36fYzoMoq9HBwuIpEoBOQcWaZh9/ewd4GAmLh1SU0pUebpqr7O
	IrbBTzCLj7CJDuzlV6Dcdr1OqFm6SyO764o/62pnvhkTGUXW7ugMG+bh1U2I/2k0NNBSr5
	OP1XpFRZEaXTaVFqIq3YdSg5+qsRfdKUKvpdsuwozMooSfzSGI0VUbRnkjOqSx5qOrar6I
	ypdEH+UclFWViex+hKIMMrHA9akYZJ7i5W7/rVbBGGVIoe66Tmy8jOSesu8OQcaEiRtLvM
	BHYdoRiODg0CG8wUQD0HRSdvaeLU921bXP6hDATICdIR91DBtxAh0Kw0aN0s1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrBALLudUMMQIpB9Jb++BwmBRlfN0yHG1/njX6fnTE0=;
	b=aMy3eGdfoQdV0esGEjqNzj2T+GNVN9Gu5aP0E8xfdTY9CE2D/Ql6h41CsmHASq33jrTvgS
	d2ksM8s+JfbrYcAg==
Date: Tue, 26 Aug 2025 08:17:10 +0200
Subject: [PATCH 07/11] vdso: Drop kconfig GENERIC_VDSO_32
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
Message-Id: <20250826-vdso-cleanups-v1-7-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=1702;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MIu9l2pTXbhJrvGPCmWjImoXUcbBkNjVmM+9aAFDkec=;
 b=VT2YYQvzHfODm57uAqR09c1duKjkkmGSVqmCVlLdgGb/ARCoX9KqMLFcxG4POgZTTs3Rm7rqY
 RTH8Lz9nPvLBWpZeMT5QB55ugWOPWVYU1mHssRVmDUpj+5tIKw9H+EU
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This configuration is never used.

Remove it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/mm/Kconfig | 1 -
 arch/x86/Kconfig    | 1 -
 lib/vdso/Kconfig    | 7 -------
 3 files changed, 9 deletions(-)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 5c1023a6d78c1b4db67b2d62b71af5a79b7e701f..2347988cf6417b91d8d3580387b53e610ed49a00 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -926,7 +926,6 @@ config VDSO
 	default y if ARM_ARCH_TIMER
 	select HAVE_GENERIC_VDSO
 	select GENERIC_TIME_VSYSCALL
-	select GENERIC_VDSO_32
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_VDSO_DATA_STORE
 	help
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58d890fe2100eb6990880bcf5ba600cdefb0a7d1..4f120070a51bd4e225256440649a2dae17025c41 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -14,7 +14,6 @@ config X86_32
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select CLKSRC_I8253
 	select CLONE_BACKWARDS
-	select GENERIC_VDSO_32
 	select HAVE_DEBUG_STACKOVERFLOW
 	select KMAP_LOCAL
 	select MODULES_USE_ELF_REL
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 45df764b49ad62479e6456e00c053e46131936a3..76157c26931d28327750ad53bfcae5109a29d998 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -12,13 +12,6 @@ config GENERIC_GETTIMEOFDAY
 	  Each architecture that enables this feature has to
 	  provide the fallback implementation.
 
-config GENERIC_VDSO_32
-	bool
-	depends on GENERIC_GETTIMEOFDAY && !64BIT
-	help
-	  This config option helps to avoid possible performance issues
-	  in 32 bit only architectures.
-
 config GENERIC_COMPAT_VDSO
 	bool
 	help

-- 
2.50.1


