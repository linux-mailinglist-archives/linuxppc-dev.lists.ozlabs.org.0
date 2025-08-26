Return-Path: <linuxppc-dev+bounces-11294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560A9B3543D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:20:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yDY1k65z3dKc;
	Tue, 26 Aug 2025 16:19:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189165;
	cv=none; b=at1GBmhiZ4HetoYZrbkYAuDV5g77mbT74g34HA/EAERqVyC0mfEawB/t05yGwLM211N7e+HPH4Ar30vfvUqQkpAtuvMnOte4d5EBWY/NPAFCiDz4xn7hwkmUyfyR1yA6KYiOqrsQMM7v7D4pkKrOV39WByKQflue/CkNRJxEVwgcQt3XSz5yipQNCOBR6LNHC+mePOBsTotUlEGFE/nqen0JTKE5euBjYzITcPdhQcq9r+vkje2COh8bhtDGdgCqcsrhHwJhtJUuOd8wb6p5BowHEu7bxnEwKod97rPoVWVAPEOGSzswX/UkxxYqfw0DPPbgXuH/SIZVMlZIbykRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189165; c=relaxed/relaxed;
	bh=aUyzbl96JnTO9V3eNt5MssqL9K7R8ZPYrzwmUDypjtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlKKSZsWURQXfU1KEzdHaYm59owdQC+FUUMr6wV/JhBAGYHIweGJE6rkzzpQII0PtDusE6SgurfeJ0dYrQfNP3H/qAVnhSYyrFRGEck5NoXojSoxga5xpplgsAYeGK1JUtqWjs3WmlmW4vmE3SuvD4PY6mIo0tzwVtbLzAGBGeSs7hihjayfDo1toMLOYfTbcZVEih4SI7gmvx0kQqSRAyd4mA2mKKaWKKhFYMcR2pqJQ5D2QZsgSRodnZn0AQDslHgLNntrCry8DSF1oh/pykkbXvlKgh6r7EY88sGwtNnKyqEbA3/a95vGAz1IlK6HWRANpQsa6fnJxtJrRF21+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qff84Umw; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=faCkWxdj; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qff84Umw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=faCkWxdj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c9yD93h6gz3dHw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:19:01 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUyzbl96JnTO9V3eNt5MssqL9K7R8ZPYrzwmUDypjtQ=;
	b=qff84UmwLm8iFQvqm09Om+iEel23vC9BJ1wHMhpnGuRjjiVtocG2gJc/efnzy7UGv0bqDh
	X4YctMH0aSIUxDd3i6X4JoDQFU5IM3b5mriVj4iiUX/4ke9TsrEXJU+QjgXN9L2Hvg/r1e
	gVrERdEyqsHFDbRTatoD2jUbrkzofjIHreOcsZGCDEtvBgy1C9OjuykTbsIoRwvmsiEo67
	TT3uKBDVEPfUk1K7JbyuNP89aqNk5szSg7Q98Esgpnao8uytgt5ztulcsAYjKovknEd1Gv
	DdfAb+Xqa/DsFSf6/Qptu/gAQ+92+1NXjLnQVTycTHPHpfQqUdNFtsZzBM1PEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUyzbl96JnTO9V3eNt5MssqL9K7R8ZPYrzwmUDypjtQ=;
	b=faCkWxdjd3FeEyW+rea8Q+WUcDNk36hjcPMaS1Mmo0pdEShLBn6gpn0pA+neXsTYaNOZIy
	GVnfWQSajoT7S0Ag==
Date: Tue, 26 Aug 2025 08:17:14 +0200
Subject: [PATCH 11/11] vdso: Gate VDSO_GETRANDOM behind HAVE_GENERIC_VDSO
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
Message-Id: <20250826-vdso-cleanups-v1-11-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=740;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=e70kJzk3rr3WiO6RHhXGvE8arznJOv7er7zNzG1lBZY=;
 b=Q6ersM0eWZuFWFRqw7St9QnfIHgjvUfXPslz3bmlle7dR6R1Tm8FlCD46/a/HTAHi+acl41TM
 HHiIuT3vNAnDyILoXrbvH+hSpTHjerUzqwG/UiWNkrt8K08Oly20NA4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All architectures which want to implement getrandom() in the vDSO need to
use the generic vDSO library.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 3d2c2b90d193f984e3a202e701fa7f0bfa8f1938..db87ba34ef1928fac0d5c58abca86312687cc159 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -19,9 +19,9 @@ config GENERIC_VDSO_OVERFLOW_PROTECT
 	  time getter functions for the price of an extra conditional
 	  in the hotpath.
 
-endif
-
 config VDSO_GETRANDOM
 	bool
 	help
 	  Selected by architectures that support vDSO getrandom().
+
+endif

-- 
2.50.1


