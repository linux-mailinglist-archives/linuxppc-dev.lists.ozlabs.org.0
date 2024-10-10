Return-Path: <linuxppc-dev+bounces-1978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFB6998C1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 17:45:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPYwv5MJvz3blV;
	Fri, 11 Oct 2024 02:45:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728575103;
	cv=none; b=KDAVnvHhvVnpyFzJHru8jbUL4PksUp2ehbgmV7tiXFEBSYnHxz55QLg6Adu1+8N5jURLhBzdbOyizAoR7qZ8iYMt6sP0uKDXWsAqpVwefu/2mbjBZUftrUUgJNb29DEYkbNlG0RUu2xzszYdqY97laSxxtxQk1H/pjnyFJPqX+1mOnd4Hn8FD7gyM5opLdgZc1UJqdtdvEeYIrvE5/CEMxJ/XlirqE+rc76YGZPll1t7PrxjVX5WwSRmR0EpBvmOI3AyPoQbQdgWfQAg7UgB0QenQLOGpv+H00ENM1b68yiOVYKCnoKTrojeoBs588XYQNrDT5gljKGC61dVpCAZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728575103; c=relaxed/relaxed;
	bh=Xat0rCkZfuBVy+ds3zzBGDHknhhfaZxhQ/1dfBCZr0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DF17I2umXy8ToEAoEa9+Ha3uThX6oAb3JzsDedK3OJf2c9Iq+7mJoLG1GMDvetw2Epy7Mm9vXhRay/JPZ7SL3/E3nWEHKRrFsHxZpjxVxwZ9OYmNa7IfRQUfcOee4nQCGS38MDl99W08BNpTsL3iE1DY8nHPg6hf8XvELhqwif+Od5BzT7NEDXKE8cAFGhe1b/ylc3g9+EnlhAwCa4n6Ra18aPO0TRQU59zBj/y9MewUgrVqqPH0oqQXwBB3WN2t61n92GYFb0ianAG0vPM3WxqutGVrRdr17xY97ssMjm4/ibgGrK1OHZ36DTmKVK/LXytaLMgXij6gMBrzvabgDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=r7gfiTCA; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/DL35uF2; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=r7gfiTCA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/DL35uF2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPYws6pKrz3bl1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 02:45:01 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xat0rCkZfuBVy+ds3zzBGDHknhhfaZxhQ/1dfBCZr0w=;
	b=r7gfiTCAQsC/p9L8arvUB1AcmoVbCb06KBfvAwUFBPwE66xPrDZQdOplzHIkTk8Ac+gZDw
	U0EI8/RO2Lf8EqoHHhdV4kOrPr72E2evRfwp3/650RyeQ8xtIomCo6LTOQ1/ibOpBYkYEZ
	r7s96u2+hJUxvZiXOQUgdiY7W6DG3HNC8YgqGQzz6Xat0ZwQJsfXNo1Z5JwLHl9z76Rg0T
	DGjebvVvqJXVuxA25TVBeCwHEPgSItZzu56rtV7mC5kN3RCXB4sCckDrEbdeLy0B5tUmFf
	kMZ/7UlwgoXOdjavq4NU/tC3ZP6yn9+GecVyQ/QP5XU8uP+K27J2wvgwBKvp8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xat0rCkZfuBVy+ds3zzBGDHknhhfaZxhQ/1dfBCZr0w=;
	b=/DL35uF2ubZb8FaGaS2Xtk8IO1KgnsvpfdbZ00U4SPY460WhPFgu+WtEUEO78djLJSq7mr
	9SWI6gYYUV4MWGDg==
Date: Thu, 10 Oct 2024 17:44:48 +0200
Subject: [PATCH 5/9] riscv: vdso: Remove timekeeper include
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-5-7fe5a3ea4382@linutronix.de>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1078;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hpe2ufKxO4wcPCONeGKr9TgGjUW1E936UNjQ+nG3JrU=;
 b=Z6RtjK/nc0O8tEfVBTBZ0WJ1sj/stEr5ZpmR3YKRCxCah4hYNPuy68GyBh4E+r7C/qWgfxerT
 IHK16qphOLZBJGY2dzcOgcs6USZ+7MX7DH4slmMU1FQj0Mj/nZG1UXo
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since the generic VDSO clock mode storage is used, this header file is
unused and can be removed.

This avoids including a non-VDSO header while building the VDSO,
which can lead to compilation errors.

Also drop the comment which is out of date and in the wrong place.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/riscv/include/asm/vdso/vsyscall.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/include/asm/vdso/vsyscall.h b/arch/riscv/include/asm/vdso/vsyscall.h
index 82fd5d83bd602c72c1688a7dffa292b37b5fa790..e8a9c4b53c0c9f4744196eed800b21f3918d1040 100644
--- a/arch/riscv/include/asm/vdso/vsyscall.h
+++ b/arch/riscv/include/asm/vdso/vsyscall.h
@@ -4,14 +4,10 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/timekeeper_internal.h>
 #include <vdso/datapage.h>
 
 extern struct vdso_data *vdso_data;
 
-/*
- * Update the vDSO data page to keep in sync with kernel timekeeping.
- */
 static __always_inline struct vdso_data *__riscv_get_k_vdso_data(void)
 {
 	return vdso_data;

-- 
2.47.0


