Return-Path: <linuxppc-dev+bounces-1945-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 481DE997E62
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:04:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKq2XhSz3byT;
	Thu, 10 Oct 2024 18:02:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543743;
	cv=none; b=k6J27JP7erWiY/yCbSuarbiNpPci8ftG4XZRRmtQe8g09PFuUfdVEFiBVPbVaLXJi0NGuO9IsLfAX+w4qY80JX6MT7xVAvdqL1YuU3XiCe4uwC9RnFk1m/T3dPFyUOSOQBeeDBzPJnJlo8x/27N140c6jVsDIBv7DagyXVVnY4VD905ldRAesWSBURCewIuImf38FuaIkqjqeCSp2oZdAUNUSDh6jZeSWHNO/6FVDNRwlZVtk7/Yn5+/mJoXZNow7zz2erRybnbIbB1U4nx23I7cdTGte3px5vMakQO5/j6/7XbOXJFmqFuCcs+vbn6CAPmlJR1RBOHRfi568zPcbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543743; c=relaxed/relaxed;
	bh=K/qRGvuOAyfRD/y9Hw9vI8MnAlUye5M5TSGqQF5eFfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FVRc9zGeJADuPghOrpi5Rqo2e2r4lJogne5pextXx8MXA0V82HG7eewJytgsZyqX59yJxXyCpG7T0YTStmtZapJJkxAl3rpq66z+FHBdxBraNw906sGRDPBYED2HMhw7T9yDs3UwgKzjt5g3iQstnZ5yNagtPiy86MVXZqbwoyW83I4w7wm4ZqQWUDnekEv/pEldkTxx3+nh99uKmrtp8YdfSY7AnODvNGDq0CrV4s84k5ZCUoxW/jbQIWnaOjW9z8yH4NsI2Ytr3uxDc9Xrpf45IDugI8lIYREp+gmM4+qMPZmwtHqokgiD/Zmvkw1F60We1yhHvYaEJm8eMpiqDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lOtgRqrv; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YPIBKS6f; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lOtgRqrv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YPIBKS6f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKp4syNz3bwd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:22 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/qRGvuOAyfRD/y9Hw9vI8MnAlUye5M5TSGqQF5eFfA=;
	b=lOtgRqrvkWhHs5FDIZhLs96p61mNiVNt6t9AYoLa1thljfyyRleywPXqjeoScsCAYmTDWv
	0r24GjB2ulGnJkoTNTjKVsfA+qpBbIlUHVuwLRLvSg88aafASg37t3FvSAYJKTDkrEFMCF
	Q5L0Cf2OrOk89w2nbzDgMcSfACgIJSovpms7P8XAGOW3atwPhKJxWF47+FzFTW5N/EG7Yg
	2HRzhNr/4GYMtRtie63QKRml5xYibGYWTE6BlzE/8/BbDmr8Rpeyjiyozaei/60X/TdWdk
	tpOmuMYwEhnBlSzBYpZ2bYOmey08TelkMPNRC3g4oVQhOg4Po+4u5KTFktMPbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/qRGvuOAyfRD/y9Hw9vI8MnAlUye5M5TSGqQF5eFfA=;
	b=YPIBKS6fUErLq7tLoUgds5pLbK4UX7EnE/rx00rRDYWatFVJ7tNFzgNAHim8WYkolJMXyq
	eaBMgmb4NJ1+7MBA==
Date: Thu, 10 Oct 2024 09:01:27 +0200
Subject: [PATCH 25/28] powerpc: Add kconfig option for the systemcfg page
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
Message-Id: <20241010-vdso-generic-base-v1-25-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1852;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ignJMWvkz6E09b32wojexZ5aYHvKHJxJ66AG8ULzy/s=;
 b=C1rNttCPnaP1zlaUjv7iMx0innkkyXvxyKgVYJIFWgJtuaN0zt8AzArXt/OrnrBtT3yS8PQGE
 o07lV8IsHQkADjaSA/YIbNTpmAdiIx+Hy0BA1bX+qUHzEj/ePQM5Dd2
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The systemcfg page through procfs is only a backwards-compatible
interface for very old applications.
Make it possible to be disabled.

This also creates a convenient config #define to guard any accesses to
the systemcfg page.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/Kconfig               | 8 ++++++++
 arch/powerpc/kernel/proc_powerpc.c | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8094a01974cca1d27002720e706f66bec2a2d035..5d348e1f09d730002eee9894a0b2847e1dac15d5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1298,6 +1298,14 @@ config MODULES_SIZE
 
 endmenu
 
+config PPC64_PROC_SYSTEMCFG
+	def_bool y
+	depends on PPC64 && PROC_FS
+	help
+	  This option enables the presence of /proc/ppc64/systemcfg through
+	  which the systemcfg page can be accessed.
+	  This interface only exists for backwards-compatibility.
+
 if PPC64
 # This value must have zeroes in the bottom 60 bits otherwise lots will break
 config PAGE_OFFSET
diff --git a/arch/powerpc/kernel/proc_powerpc.c b/arch/powerpc/kernel/proc_powerpc.c
index 910d2082e05fd86bd1146815d4b67633a6f2b459..3bda365843e44357538651c6c24c11a41de2eb06 100644
--- a/arch/powerpc/kernel/proc_powerpc.c
+++ b/arch/powerpc/kernel/proc_powerpc.c
@@ -14,7 +14,7 @@
 #include <asm/rtas.h>
 #include <linux/uaccess.h>
 
-#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC64_PROC_SYSTEMCFG
 
 static loff_t page_map_seek(struct file *file, loff_t off, int whence)
 {
@@ -59,7 +59,7 @@ static int __init proc_ppc64_init(void)
 }
 __initcall(proc_ppc64_init);
 
-#endif /* CONFIG_PPC64 */
+#endif /* CONFIG_PPC64_PROC_SYSTEMCFG */
 
 /*
  * Create the ppc64 and ppc64/rtas directories early. This allows us to

-- 
2.47.0


