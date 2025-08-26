Return-Path: <linuxppc-dev+bounces-11297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B2BB35443
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:20:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yDZ2hl7z3dK1;
	Tue, 26 Aug 2025 16:19:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189166;
	cv=none; b=Htrke3DHKnxN0u+qpPwOeW/sF4qhtq5cfDq6iez+gUhPk5sa0iC87U37+rAmOxIlfNr2WA/DZhUPTR3xQueq9FiHQnRFYflR3R9ODYYgvotYsm9YF52MB7W6QkfhyGGmSp+1OaoD3SjUZ7i+XVUeBe0mlleMopX8/oD6mZbpdGyWb85H6ryNkB3HuO3WVStjntGC8tYZIYcsQGD4HYmw5En3hvu4sVNo/p7+1WqrD6zw7z9Z714gttT4WFah7VJ2HVomjs/u8P/x2YqK+mBFU9OwYUUBo8qVDulAoen0dM2TJjJ1GjD2NYGbaTCj2cMByYpox7rQR6co+8qwhPI1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189166; c=relaxed/relaxed;
	bh=0t+60eV41IKUZ9ezcmekgKTWqNgupDcJulsKXmUteXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REjQrfOOX1gPIGSvr2Xf5XEgyza8XclL1xiaJP9UT/mBThe5haBxWnFlhIkTQBuyLaHCvhzqp/WAnJQaJmkxZs7Zrj4Hb7uQjw3J9y/8R0XhS/LeW3aNTHi83OzVBYwH4oSwxiafYoHWTxpBG4c248bj5skBz5k0hrq5/KAl3QPJZLZg18f3TaeejVX9J9hQb8cwQ5Y2h5uu8sGAPqzWDi/mSWjMb7+WSbHdvpzbiVfxin/aJ5m9KD/L6Ts/NVkxZcqtpbBaC34doX3CGoQqc7y8+Hjx3vxGkSCzmSCJHsjts397T5oAJwOSXos6bmmBSnC2oIzgXKzeuTY7Cknkcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RgDlVbjO; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8pcUg9Do; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RgDlVbjO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=8pcUg9Do;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c9yDX2dn8z3dK9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:18:29 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0t+60eV41IKUZ9ezcmekgKTWqNgupDcJulsKXmUteXI=;
	b=RgDlVbjO8jhuoPY4mfKuN7Slnu45ISnAWFOw/cSKuUrM166A5Xf4Erm/D2UDrSZRjb+TRd
	kgmua8gHOCLunG9wwz2DpSTBXdpmSEa71Lb0hP+HK5ysGZ4To/F9r9b4YwQ9GRjarwPVe9
	uS9AhT4Sz0+dbivk9lEzt4gd1nc4bK5HMZCjdAVtZW/0Fq3ATh+T7SGWw+DWsEEnez8l0S
	l+JOMfNCM36pb3xgaN/Xdoh5jXwrQ/yCb90R7Ig/RRuSEtYwhJZ6k4ETPQI7pdrgOQZwVs
	cqIUgd5QTF7ISENOyaqbvQpo+sHhZmxunt2tS6GEfzGIrgBnNf5Lv/0G9tlpGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0t+60eV41IKUZ9ezcmekgKTWqNgupDcJulsKXmUteXI=;
	b=8pcUg9DoAWVBxDLyXzgtGwnNadG0alezHP8Es7YoGFl4eRzHD98RNasRncD8HY+yHWoxjq
	+eUsVcLyCZNMQYCA==
Date: Tue, 26 Aug 2025 08:17:11 +0200
Subject: [PATCH 08/11] vdso: Drop kconfig GENERIC_COMPAT_VDSO
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
Message-Id: <20250826-vdso-cleanups-v1-8-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=1240;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=t5/9HDmyIs2t4g7FWEeD3BGuAZjUNxjgX5TY/5a0ZYE=;
 b=CNBKp7BJyz4ivh16tO14JDMhakvNZC/uzVXIEyWpElrKLVyg8TDExe/3LZIlXzjfpdnGKz/bi
 sJVuBe1Vf4yBKs8TudfOmPB/74FMQCcA5A/RjRFrYkYOWqYvHO0ISoL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This configuration is never used.

Remove it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/Kconfig | 1 -
 lib/vdso/Kconfig   | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a64d7ef1793a5d7f7ff8db138f2814..5c61b19ea9c80559ca3c4d1aa0732c6126494cb0 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1782,7 +1782,6 @@ config COMPAT_VDSO
 	bool "Enable vDSO for 32-bit applications"
 	depends on !CPU_BIG_ENDIAN
 	depends on (CC_IS_CLANG && LD_IS_LLD) || "$(CROSS_COMPILE_COMPAT)" != ""
-	select GENERIC_COMPAT_VDSO
 	default y
 	help
 	  Place in the process address space of 32-bit applications an
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 76157c26931d28327750ad53bfcae5109a29d998..2594dd7185be762a4a94aa38ecec5db016776f85 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -12,11 +12,6 @@ config GENERIC_GETTIMEOFDAY
 	  Each architecture that enables this feature has to
 	  provide the fallback implementation.
 
-config GENERIC_COMPAT_VDSO
-	bool
-	help
-	  This config option enables the compat VDSO layer.
-
 config GENERIC_VDSO_TIME_NS
 	bool
 	help

-- 
2.50.1


