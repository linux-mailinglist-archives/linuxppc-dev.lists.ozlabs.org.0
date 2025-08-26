Return-Path: <linuxppc-dev+bounces-11289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E758CB35432
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:19:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yCp5yyDz3dJZ;
	Tue, 26 Aug 2025 16:18:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189117;
	cv=none; b=jy8GU6gY0ElqC9cKNn+FOnUnLCMDCon9WkvSc6SxGk3+KLP52TVEwim5M+mnNke1wHkZDjuawbQmZC/BYsxcHnPAwpWhtfy0cj6mvCwD0V8pAeslwEe354w0+fs3xiLbO5F46AlvjmP3HNPMIGGMKtwHCxhHwhy6c1mgOt+wfepj/BA4gP6gqEaZLKxmBWp+278ugVavm+hvZawOSdBQIiwdDe5dmz/kI3gD9RahHxOvyjukwVQfxeEI1kbZWe2JHjMoxN00CFnxSVRG18tI/YYrVBn+t00TgHraNDuJAbR9BfBO9hbBcO6zZ0xBhAhi3Pn7ZiPiTnczxTebCLHy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189117; c=relaxed/relaxed;
	bh=8Qx8zdXwUDEN+QDzIjybGTquRbhLyER4hmo5HtXCS3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TPl8UVU1G6GYv5OPWDUvaZB0v+0kThXE87M/gFpRoWsHDXtX5N92GDoXr74BfrGOlmmfvRIE1rxvmzkX0BPakTnH5ANo9PiEF86prSLspo5KFMGtWmi+cvydwgrn/MqPsJ/7tee8H/EJqv01V6XYoGcJufynAkFe3S7Vu0A3Bttzvd0LwG8/gQzGhtZrKJLt27Fbnf9sdH2007gcsPcNcEpY4NB08qocoI++v0fDk0vXPVy0LC3uC4I6kvkRQFJ9AwpyIj2BSrZIdv21jHKW7ZuqR68ZU1CDJWbBIjfK1iU8FAN5ur2PGST1DuUf+MKe02kOKCxUVPO8cgCFznUT3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EoHq8It+; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eX2IPWAG; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EoHq8It+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eX2IPWAG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c9yCN5d2Lz3dHj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:18:24 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8Qx8zdXwUDEN+QDzIjybGTquRbhLyER4hmo5HtXCS3M=;
	b=EoHq8It+802uE8/W/ZgT+WU1MhU30ljvVJg6J8CsR2XdSCY1W8iKO/0yhuhlIWg93gjtVN
	yjsiguKOCe8MXqL7t5b5NeIYigkWxr9EZY2Mkn3x2W0dIf65A5h/s69Jx20ZLL24VmAnXl
	wWm91dlrX8UnePleqQexNGzu9SWDwlcPXJ8DztYUIGGk65aJetDl/MNeXhull8xcLDd2T/
	Xdhztn1zm0BL6qd7sdPVV8txFwrP1lt98FW2I+LmBrQOqG2Iv+EpggKyKaF35t2W+WDCO2
	x4LqgXrpkfrN62Egk6oQBRYWy9iOgErie977mytBr36Yc1c7jJeu3fV2/Qh79g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8Qx8zdXwUDEN+QDzIjybGTquRbhLyER4hmo5HtXCS3M=;
	b=eX2IPWAG+DvooY6YzvBNYPIk4d7JwL6SQGjcVcR/3nVRkZUD/9wZEdubuxvUX29zgYJ6tr
	+6ncwJ9ZGLDV8KDQ==
Subject: [PATCH 00/11] vdso: Various cleanups
Date: Tue, 26 Aug 2025 08:17:03 +0200
Message-Id: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAF9RrWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNT3bKU4nzd5JzUxLzSgmLdtBSztKQkY6O0ZENLJaCegqLUtMwKsHn
 RsbW1AHxpxT5fAAAA
X-Change-ID: 20250825-vdso-cleanups-fd6fbb32fc19
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=3008;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=OKdbTtNFiNAfKDCNOTVL/ZRLmxAuqZzdXzmwBIqDanM=;
 b=xXLb28HhyOp2V5PAl7NV8Ih+DLTz+T0EwU3m8mTK7t+YdB+1/WbVwG3q2LXi/d5YbmXMM3lwS
 UE/A4xDXG50Ay40TUaB+Dz47MZKMYqchu5q89DYuvoo2r9Z3sDlnSRd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Various cleanups to the generic vDSO infrastructure and a patch for ARM
which was never applied.

This series has one trivial syntactic conflict with "dso/datastore: Allow
prefaulting by mlockall()" [0] and a semantic one with "sparc64: vdso:
Switch to generic vDSO library" [1], which still uses the removed
GENERIC_VDSO_DATA_STORE.

[0] https://lore.kernel.org/lkml/20250812-vdso-mlockall-v1-0-2f49ba7cf819@linutronix.de/
[1] https://lore.kernel.org/lkml/20250815-vdso-sparc64-generic-2-v2-0-b5ff80672347@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Rasmus Villemoes (1):
      ARM: VDSO: remove cntvct_ok global variable

Thomas Weißschuh (10):
      vdso/datastore: Gate time data behind CONFIG_GENERIC_GETTIMEOFDAY
      vdso: Move ENABLE_COMPAT_VDSO from core to arm64
      vdso/gettimeofday: Remove !CONFIG_TIME_NS stubs
      time: Build generic update_vsyscall() only with generic time vDSO
      riscv: vdso: Untangle kconfig logic
      vdso: Drop kconfig GENERIC_VDSO_32
      vdso: Drop kconfig GENERIC_COMPAT_VDSO
      vdso: Drop kconfig GENERIC_VDSO_DATA_STORE
      vdso: Drop kconfig GENERIC_VDSO_TIME_NS
      vdso: Gate VDSO_GETRANDOM behind HAVE_GENERIC_VDSO

 arch/Kconfig                                      |  2 +-
 arch/arm/include/asm/vdso/vsyscall.h              |  2 --
 arch/arm/kernel/vdso.c                            | 10 +++------
 arch/arm/mm/Kconfig                               |  2 --
 arch/arm64/Kconfig                                |  3 ---
 arch/arm64/include/asm/vdso/compat_barrier.h      |  7 +++---
 arch/arm64/include/asm/vdso/compat_gettimeofday.h |  6 ++---
 arch/arm64/include/asm/vdso/gettimeofday.h        |  8 +++++++
 arch/arm64/kernel/vdso32/Makefile                 |  1 -
 arch/loongarch/Kconfig                            |  2 --
 arch/mips/Kconfig                                 |  1 -
 arch/powerpc/Kconfig                              |  2 --
 arch/riscv/Kconfig                                | 12 +++++-----
 arch/s390/Kconfig                                 |  2 --
 arch/x86/Kconfig                                  |  3 ---
 include/asm-generic/vdso/vsyscall.h               |  4 ----
 include/vdso/datapage.h                           |  9 +-------
 init/Kconfig                                      |  2 +-
 kernel/time/Makefile                              |  2 +-
 lib/vdso/Kconfig                                  | 25 +--------------------
 lib/vdso/Makefile                                 |  2 +-
 lib/vdso/datastore.c                              |  6 ++---
 lib/vdso/gettimeofday.c                           | 27 -----------------------
 tools/testing/selftests/pidfd/config              |  1 -
 24 files changed, 31 insertions(+), 110 deletions(-)
---
base-commit: 3cd1f6bc6aa056cfd32946f9ce0aa3eb3db180e8
change-id: 20250825-vdso-cleanups-fd6fbb32fc19

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


