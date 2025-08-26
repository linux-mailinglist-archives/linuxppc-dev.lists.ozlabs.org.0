Return-Path: <linuxppc-dev+bounces-11296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CB3B35442
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:20:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yDZ1vvdz3dKy;
	Tue, 26 Aug 2025 16:19:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189166;
	cv=none; b=B2GJ1E7UMjJ5GHMLjzdf1BZvccS+akebrh6cg8ZgE8qHtc7OHbaBAzgc5TGJqWCVn1Jll4oFNmdm4/yz6ey/z75pBoxdqDSvptuNXwn0K2DenQ8pk2KcBKzvmws2LH84QXH4vtYfMCi+hn3HHnMVeDOh7lVpX8X/M0mRr9DfbMJ1EZ5rqCW0148qqzCR6p4w93Awo3UOwwxmg7CbJot6X92VLIKP6AnSnMIvamjg29nTZPAp7KX7TacqMUnyRxx2ZtDT4rz/RbVfEGVAbMMBZdKh/K/ioRRsjZNu5fru5qm/RJ2MXRpPNRyWq3D+Vx1bNs/4EOADqCwxmjp7J2o7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189166; c=relaxed/relaxed;
	bh=3/oLlHMS/fCP6P1KLSn+cvJJv6PKUv3DICeaKqETsd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M8fp6V8Pj192OgK3Sizn0VcmU3l0ohWSaAstBPglKT5s+E+TQuy/paT4MFOkzk6e7V/xiROwb23kysRuwDpzFFT6gynb7QfWrw1nMytO46k/ufNm8Z6q981OfddHBwvYCndKUt51LM+9zSNnK0Ej3RabYTw+coM2zURgzWETI9k1gACfCNDIvTUXKgi9L0TNHHgCM0PjQMTinkfEJBPwKZfzo+TTT3Lt4ELj9SgbPU/52kjExysnVnfhqHkR2zbwvBA94SOyHyIJF5J6ZESJErKpWqhu+euZ0Ki+ao5EjABQit3WHcOZKznNNuPtsWa1/ah0G7bq71U1qDr1QUN3rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vM/cvVQM; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vA9RQwkS; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vM/cvVQM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vA9RQwkS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c9yDX2txKz3dKC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:18:55 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/oLlHMS/fCP6P1KLSn+cvJJv6PKUv3DICeaKqETsd4=;
	b=vM/cvVQMAyhS92V8y5yVESyKxIqQ5R3zffJXNT39DFeEehqGvQ4cgcMYsWOtpmbyjLR+Jk
	we8S1VPZLk08HyevreXbtrS0WfURWLCD0C1udndZaGXsxcvNVQ2IAa/sI7wZ5EjfeBV3QB
	Xl1IBk2dQX2DHCg8P+mvsjehyFDzZ/AjK26U/WIM/Dx6E1r9CZ+xl3vYpcz/43dfXeL8zq
	t+0oYU9wuduujEn9b3gXCqd8/s4+brqyYCVM79YY7DmkOuCIKG5XnjOxrX8XloYENkIp6J
	frOXYpfPBh2KaqVqKhcgIbWwZ8GW0EG4XRusd22yhv2ylnUvt+X8LNumqRAcrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/oLlHMS/fCP6P1KLSn+cvJJv6PKUv3DICeaKqETsd4=;
	b=vA9RQwkSkeW435dz89cXdm1JlqEJ1IVbHIFd6A9tNEpJZ0qLZJMeeSzlzAhq24mxpdVhVM
	OJzV+jwkYkep1fAA==
Date: Tue, 26 Aug 2025 08:17:08 +0200
Subject: [PATCH 05/11] time: Build generic update_vsyscall() only with
 generic time vDSO
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
Message-Id: <20250826-vdso-cleanups-v1-5-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=943;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0FWlozWesIsQ0qQyaOP1bY0lFjVrbfKxBVeB1PCnS50=;
 b=9pNh5a5NaguFfKkfKR0EeNJ5Hqk/rS5JHEaeEmX/n8dUdZlkDqHcQrQvn3JOYAA8u+Wl7yvQz
 BQudoqsm8axAvusAQkTMXCgGoVnMLts+duG7XkK6Eop3MTQ6RNupbR9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic vDSO can be used without the time-related functionality.
In that case the generic update_vsyscall() from kernel/time/vsyscall.c
should not be built.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/time/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/Makefile b/kernel/time/Makefile
index e6e9b85d4db5f8dd5d9b574ef7bb0a281b9daa6d..f7d52d9543cc7a2d1a18db179229a8d7936317d3 100644
--- a/kernel/time/Makefile
+++ b/kernel/time/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_LEGACY_TIMER_TICK)			+= tick-legacy.o
 ifeq ($(CONFIG_SMP),y)
  obj-$(CONFIG_NO_HZ_COMMON)			+= timer_migration.o
 endif
-obj-$(CONFIG_HAVE_GENERIC_VDSO)			+= vsyscall.o
+obj-$(CONFIG_GENERIC_GETTIMEOFDAY)		+= vsyscall.o
 obj-$(CONFIG_DEBUG_FS)				+= timekeeping_debug.o
 obj-$(CONFIG_TEST_UDELAY)			+= test_udelay.o
 obj-$(CONFIG_TIME_NS)				+= namespace.o

-- 
2.50.1


