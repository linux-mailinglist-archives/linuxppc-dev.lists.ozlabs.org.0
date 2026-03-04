Return-Path: <linuxppc-dev+bounces-17681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMgMImfkp2nqlQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:51:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9CB1FBEEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:51:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQlDl6cgJz3cVZ;
	Wed, 04 Mar 2026 18:49:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772610567;
	cv=none; b=bE/omndsRuRAo7xZBEwvA6S/a/vCycRieL7W4Jl+xl/2bVfSgsb1HoHJRJIQNnbXXFnItM3UVmYKt/tzVv3BNCcoeK2GLHXYp5+TWbBDnlGnVZfkarfc0yJZDTaBWw7r/+6/NhVpUB2snFngM2JYcvvBErtUJZf9AvvM3kiyyVwx+BXYH5nxmjpl3VfHjE6PNJN9kgHB2hC6UhUzQKmSUDxWoCktzDTS/QYrFhYYsXi/upatz8pfB72mS6TRD4YZR/jNEMy9QVF9YnryIMtOjyrRdKGTGDhxsFivgL2pRMTZIt1+rIMtOA2vnX8NNfEiDWPD5ydnYyj4qEV4csYxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772610567; c=relaxed/relaxed;
	bh=4+MT5DRyamd5Ys4NtQTJC40WugMIN7ZdB0lnUsOA5ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfZn1MbkYNd86n7Gj9EZYO0RUZJKiwDtmIWRLAzp9uU7E4OfDQj/KNbYfVEkZqFAsm2lahsaHWC/0yGV9TJcLD48BFXE+x7guzjcQiHJiqZVosYVE3L2+ezD5fUTKyFYez8EHdOMlfLtmZyS8dE39E/glwil+AJad6IJWeEDlPzxK0CgeCxiW9yF++MiM4xFXmtx4c3MwfERXs3mXN+GlZE1Wk2AlAXOpLUNXzNYoEjaeokTIly6pyDrdSw7t/OopvwQ3qYApn+ILfrPEIpMva2tUa5BMRJyeNdOmSewDLhIviNV3rDr9/eJdrdA0nI3JGrjBgNrV+O1Xvz6IeVc3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BZdf0jNL; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xq8vwbmE; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BZdf0jNL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xq8vwbmE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQlDk44kxz3cPZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 18:49:26 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+MT5DRyamd5Ys4NtQTJC40WugMIN7ZdB0lnUsOA5ug=;
	b=BZdf0jNLfq1M5T4eNn4LYXEtsxnBtq59VRorhNwkJmLepHuSehogsbTVOvsAnV2Ev7+hVd
	8v0AtKPCQo6aKg8afHYLAwsNFj5ykjQKBAXZYsd+mbI29/7TQ1xrmU3+OZ5bloAnQy+3tO
	vJD61Z00EoTtdJBwYRVvxyvxxBo9BK0rllZUtWNVWUvaWZdPhk+1mUtiMyd6GeimVcz8jA
	GEbLqnlBntlYgAWJwmXBYzGqOoZVec1xNUpkshyl8FpdC/yuLJnhvUyhI5JSthrEnXF0sB
	XqTYZocBicmodpCE++k2Wx0rZXf7T3b4Zdnd3pNfTfhEVzwbBiaMSI7KPee24A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+MT5DRyamd5Ys4NtQTJC40WugMIN7ZdB0lnUsOA5ug=;
	b=xq8vwbmEgmm28/wqYWlfhN4XT9G+FEEuXW3/uu9cULANeFoT7a4C5XgA6EYxqVcu4tuW59
	c7hKFDW+BBKU75CA==
Date: Wed, 04 Mar 2026 08:49:07 +0100
Subject: [PATCH v6 10/14] sparc64: vdso: Switch to the generic vDSO library
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
Message-Id: <20260304-vdso-sparc64-generic-2-v6-10-d8eb3b0e1410@linutronix.de>
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=23982;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xqLCGd0ArzeWnyt2VAlt/AhDq2yAgaApBHvqtUA/XGY=;
 b=ovj6V2m+cnTGY8L0cdCUteTVfiZYbfRIR4UwVt/sS9dJ7EinS9VwYR5HA3cAVvKiQhvCZFJ2V
 FxPgSOsJlzDC6kgMm+e7eFr+081W8wTMoCUXmM/v6yXAg8dswZAwOA7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 9A9CB1FBEEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17681-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:arnd@arndb.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:nick.alcock@oracle.com,m:jstultz@google.com,m:sboyd@kernel.org,m:glaubitz@physik.fu-berlin.de,m:shuah@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:tytso@mit.edu,m:Jason@zx2c4.com,m:linux@armlinux.org.uk,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:sln@onemain.com,m:tglx@kernel.org,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-s390@vger.kernel.org,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gaisler.com:email,suse.de:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid]
X-Rspamd-Action: no action

The generic vDSO provides a lot common functionality shared between
different architectures. SPARC is the last architecture not using it,
preventing some necessary code cleanup.

Make use of the generic infrastructure.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/Kconfig                         |   3 +-
 arch/sparc/include/asm/clocksource.h       |   9 --
 arch/sparc/include/asm/vdso/clocksource.h  |  10 ++
 arch/sparc/include/asm/vdso/gettimeofday.h |  58 ++++++++--
 arch/sparc/include/asm/vdso/vsyscall.h     |  10 ++
 arch/sparc/include/asm/vvar.h              |  75 -------------
 arch/sparc/kernel/Makefile                 |   1 -
 arch/sparc/kernel/time_64.c                |   6 +-
 arch/sparc/kernel/vdso.c                   |  69 ------------
 arch/sparc/vdso/Makefile                   |   6 +-
 arch/sparc/vdso/vclock_gettime.c           | 169 ++++-------------------------
 arch/sparc/vdso/vdso-layout.lds.S          |   7 +-
 arch/sparc/vdso/vma.c                      |  70 +++---------
 13 files changed, 118 insertions(+), 375 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 8699be91fca9..a6b787efc2c4 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -104,7 +104,6 @@ config SPARC64
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select GENERIC_TIME_VSYSCALL
-	select ARCH_CLOCKSOURCE_DATA
 	select ARCH_HAS_PTE_SPECIAL
 	select PCI_DOMAINS if PCI
 	select ARCH_HAS_GIGANTIC_PAGE
@@ -115,6 +114,8 @@ config SPARC64
 	select ARCH_SUPPORTS_SCHED_SMT if SMP
 	select ARCH_SUPPORTS_SCHED_MC  if SMP
 	select ARCH_HAS_LAZY_MMU_MODE
+	select HAVE_GENERIC_VDSO
+	select GENERIC_GETTIMEOFDAY
 
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
diff --git a/arch/sparc/include/asm/clocksource.h b/arch/sparc/include/asm/clocksource.h
index d63ef224befe..68303ad26eb2 100644
--- a/arch/sparc/include/asm/clocksource.h
+++ b/arch/sparc/include/asm/clocksource.h
@@ -5,13 +5,4 @@
 #ifndef _ASM_SPARC_CLOCKSOURCE_H
 #define _ASM_SPARC_CLOCKSOURCE_H
 
-/* VDSO clocksources */
-#define VCLOCK_NONE   0  /* Nothing userspace can do. */
-#define VCLOCK_TICK   1  /* Use %tick.  */
-#define VCLOCK_STICK  2  /* Use %stick. */
-
-struct arch_clocksource_data {
-	int vclock_mode;
-};
-
 #endif /* _ASM_SPARC_CLOCKSOURCE_H */
diff --git a/arch/sparc/include/asm/vdso/clocksource.h b/arch/sparc/include/asm/vdso/clocksource.h
new file mode 100644
index 000000000000..007aa8ceaf52
--- /dev/null
+++ b/arch/sparc/include/asm/vdso/clocksource.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_VDSO_CLOCKSOURCE_H
+#define __ASM_VDSO_CLOCKSOURCE_H
+
+/* VDSO clocksources */
+#define VDSO_ARCH_CLOCKMODES	\
+	VDSO_CLOCKMODE_TICK,	\
+	VDSO_CLOCKMODE_STICK
+
+#endif /* __ASM_VDSO_CLOCKSOURCE_H */
diff --git a/arch/sparc/include/asm/vdso/gettimeofday.h b/arch/sparc/include/asm/vdso/gettimeofday.h
index 429dc080568f..a35875fba454 100644
--- a/arch/sparc/include/asm/vdso/gettimeofday.h
+++ b/arch/sparc/include/asm/vdso/gettimeofday.h
@@ -9,15 +9,14 @@
 #include <uapi/linux/time.h>
 #include <uapi/linux/unistd.h>
 
+#include <vdso/align.h>
+#include <vdso/clocksource.h>
+#include <vdso/datapage.h>
+#include <vdso/page.h>
+
 #include <linux/types.h>
-#include <asm/vvar.h>
 
 #ifdef	CONFIG_SPARC64
-static __always_inline u64 vdso_shift_ns(u64 val, u32 amt)
-{
-	return val >> amt;
-}
-
 static __always_inline u64 vread_tick(void)
 {
 	u64	ret;
@@ -48,6 +47,7 @@ static __always_inline u64 vdso_shift_ns(u64 val, u32 amt)
 			     : "g1");
 	return ret;
 }
+#define vdso_shift_ns vdso_shift_ns
 
 static __always_inline u64 vread_tick(void)
 {
@@ -70,9 +70,9 @@ static __always_inline u64 vread_tick_stick(void)
 }
 #endif
 
-static __always_inline u64 __arch_get_hw_counter(struct vvar_data *vvar)
+static __always_inline u64 __arch_get_hw_counter(s32 clock_mode, const struct vdso_time_data *vd)
 {
-	if (likely(vvar->vclock_mode == VCLOCK_STICK))
+	if (likely(clock_mode == VDSO_CLOCKMODE_STICK))
 		return vread_tick_stick();
 	else
 		return vread_tick();
@@ -102,7 +102,20 @@ static __always_inline u64 __arch_get_hw_counter(struct vvar_data *vvar)
 	"cc", "memory"
 
 static __always_inline
-long clock_gettime_fallback(clockid_t clock, struct __kernel_old_timespec *ts)
+long clock_gettime_fallback(clockid_t clock, struct __kernel_timespec *ts)
+{
+	register long num __asm__("g1") = __NR_clock_gettime;
+	register long o0 __asm__("o0") = clock;
+	register long o1 __asm__("o1") = (long) ts;
+
+	__asm__ __volatile__(SYSCALL_STRING : "=r" (o0) : "r" (num),
+			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
+	return o0;
+}
+
+#ifndef CONFIG_SPARC64
+static __always_inline
+long clock_gettime32_fallback(clockid_t clock, struct old_timespec32 *ts)
 {
 	register long num __asm__("g1") = __NR_clock_gettime;
 	register long o0 __asm__("o0") = clock;
@@ -112,6 +125,7 @@ long clock_gettime_fallback(clockid_t clock, struct __kernel_old_timespec *ts)
 			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
 	return o0;
 }
+#endif
 
 static __always_inline
 long gettimeofday_fallback(struct __kernel_old_timeval *tv, struct timezone *tz)
@@ -125,4 +139,30 @@ long gettimeofday_fallback(struct __kernel_old_timeval *tv, struct timezone *tz)
 	return o0;
 }
 
+static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(void)
+{
+	unsigned long ret;
+
+	/*
+	 * SPARC does not support native PC-relative code relocations.
+	 * Calculate the address manually, works for 32 and 64 bit code.
+	 */
+	__asm__ __volatile__(
+		"1:\n"
+		"call 3f\n"                     // Jump over the embedded data and set up %o7
+		"nop\n"                         // Delay slot
+		"2:\n"
+		".word vdso_u_time_data - .\n"  // Embedded offset to external symbol
+		"3:\n"
+		"add %%o7, 2b - 1b, %%o7\n"     // Point %o7 to the embedded offset
+		"ldsw [%%o7], %0\n"             // Load the offset
+		"add %0, %%o7, %0\n"            // Calculate the absolute address
+		: "=r" (ret)
+		:
+		: "o7");
+
+	return (const struct vdso_time_data *)ret;
+}
+#define __arch_get_vdso_u_time_data __arch_get_vdso_u_time_data
+
 #endif /* _ASM_SPARC_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/sparc/include/asm/vdso/vsyscall.h b/arch/sparc/include/asm/vdso/vsyscall.h
new file mode 100644
index 000000000000..8bfe703fedc5
--- /dev/null
+++ b/arch/sparc/include/asm/vdso/vsyscall.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_SPARC_VDSO_VSYSCALL_H
+#define _ASM_SPARC_VDSO_VSYSCALL_H
+
+#define __VDSO_PAGES 4
+
+#include <asm-generic/vdso/vsyscall.h>
+
+#endif /* _ASM_SPARC_VDSO_VSYSCALL_H */
diff --git a/arch/sparc/include/asm/vvar.h b/arch/sparc/include/asm/vvar.h
deleted file mode 100644
index 6eaf5cfcaae1..000000000000
--- a/arch/sparc/include/asm/vvar.h
+++ /dev/null
@@ -1,75 +0,0 @@
-/*
- * Copyright (c) 2017 Oracle and/or its affiliates. All rights reserved.
- */
-
-#ifndef _ASM_SPARC_VVAR_DATA_H
-#define _ASM_SPARC_VVAR_DATA_H
-
-#include <asm/clocksource.h>
-#include <asm/processor.h>
-#include <asm/barrier.h>
-#include <linux/time.h>
-#include <linux/types.h>
-
-struct vvar_data {
-	unsigned int seq;
-
-	int vclock_mode;
-	struct { /* extract of a clocksource struct */
-		u64	cycle_last;
-		u64	mask;
-		int	mult;
-		int	shift;
-	} clock;
-	/* open coded 'struct timespec' */
-	u64		wall_time_sec;
-	u64		wall_time_snsec;
-	u64		monotonic_time_snsec;
-	u64		monotonic_time_sec;
-	u64		monotonic_time_coarse_sec;
-	u64		monotonic_time_coarse_nsec;
-	u64		wall_time_coarse_sec;
-	u64		wall_time_coarse_nsec;
-
-	int		tz_minuteswest;
-	int		tz_dsttime;
-};
-
-extern struct vvar_data *vvar_data;
-extern int vdso_fix_stick;
-
-static inline unsigned int vvar_read_begin(const struct vvar_data *s)
-{
-	unsigned int ret;
-
-repeat:
-	ret = READ_ONCE(s->seq);
-	if (unlikely(ret & 1)) {
-		cpu_relax();
-		goto repeat;
-	}
-	smp_rmb(); /* Finish all reads before we return seq */
-	return ret;
-}
-
-static inline int vvar_read_retry(const struct vvar_data *s,
-					unsigned int start)
-{
-	smp_rmb(); /* Finish all reads before checking the value of seq */
-	return unlikely(s->seq != start);
-}
-
-static inline void vvar_write_begin(struct vvar_data *s)
-{
-	++s->seq;
-	smp_wmb(); /* Makes sure that increment of seq is reflected */
-}
-
-static inline void vvar_write_end(struct vvar_data *s)
-{
-	smp_wmb(); /* Makes the value of seq current before we increment */
-	++s->seq;
-}
-
-
-#endif /* _ASM_SPARC_VVAR_DATA_H */
diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index 22170d4f8e06..497b5714fa8f 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -41,7 +41,6 @@ obj-$(CONFIG_SPARC32)   += systbls_32.o
 obj-y                   += time_$(BITS).o
 obj-$(CONFIG_SPARC32)   += windows.o
 obj-y                   += cpu.o
-obj-$(CONFIG_SPARC64)	+= vdso.o
 obj-$(CONFIG_SPARC32)   += devices.o
 obj-y                   += ptrace_$(BITS).o
 obj-y                   += unaligned_$(BITS).o
diff --git a/arch/sparc/kernel/time_64.c b/arch/sparc/kernel/time_64.c
index b32f27f929d1..87b267043ccd 100644
--- a/arch/sparc/kernel/time_64.c
+++ b/arch/sparc/kernel/time_64.c
@@ -838,14 +838,14 @@ void __init time_init_early(void)
 	if (tlb_type == spitfire) {
 		if (is_hummingbird()) {
 			init_tick_ops(&hbtick_operations);
-			clocksource_tick.archdata.vclock_mode = VCLOCK_NONE;
+			clocksource_tick.vdso_clock_mode = VDSO_CLOCKMODE_NONE;
 		} else {
 			init_tick_ops(&tick_operations);
-			clocksource_tick.archdata.vclock_mode = VCLOCK_TICK;
+			clocksource_tick.vdso_clock_mode = VDSO_CLOCKMODE_TICK;
 		}
 	} else {
 		init_tick_ops(&stick_operations);
-		clocksource_tick.archdata.vclock_mode = VCLOCK_STICK;
+		clocksource_tick.vdso_clock_mode = VDSO_CLOCKMODE_STICK;
 	}
 }
 
diff --git a/arch/sparc/kernel/vdso.c b/arch/sparc/kernel/vdso.c
deleted file mode 100644
index 0e27437eb97b..000000000000
--- a/arch/sparc/kernel/vdso.c
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- *  Copyright (C) 2001 Andrea Arcangeli <andrea@suse.de> SuSE
- *  Copyright 2003 Andi Kleen, SuSE Labs.
- *
- *  Thanks to hpa@transmeta.com for some useful hint.
- *  Special thanks to Ingo Molnar for his early experience with
- *  a different vsyscall implementation for Linux/IA32 and for the name.
- */
-
-#include <linux/time.h>
-#include <linux/timekeeper_internal.h>
-
-#include <asm/vvar.h>
-
-void update_vsyscall_tz(void)
-{
-	if (unlikely(vvar_data == NULL))
-		return;
-
-	vvar_data->tz_minuteswest = sys_tz.tz_minuteswest;
-	vvar_data->tz_dsttime = sys_tz.tz_dsttime;
-}
-
-void update_vsyscall(struct timekeeper *tk)
-{
-	struct vvar_data *vdata = vvar_data;
-
-	if (unlikely(vdata == NULL))
-		return;
-
-	vvar_write_begin(vdata);
-	vdata->vclock_mode = tk->tkr_mono.clock->archdata.vclock_mode;
-	vdata->clock.cycle_last = tk->tkr_mono.cycle_last;
-	vdata->clock.mask = tk->tkr_mono.mask;
-	vdata->clock.mult = tk->tkr_mono.mult;
-	vdata->clock.shift = tk->tkr_mono.shift;
-
-	vdata->wall_time_sec = tk->xtime_sec;
-	vdata->wall_time_snsec = tk->tkr_mono.xtime_nsec;
-
-	vdata->monotonic_time_sec = tk->xtime_sec +
-				    tk->wall_to_monotonic.tv_sec;
-	vdata->monotonic_time_snsec = tk->tkr_mono.xtime_nsec +
-				      (tk->wall_to_monotonic.tv_nsec <<
-				       tk->tkr_mono.shift);
-
-	while (vdata->monotonic_time_snsec >=
-	       (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
-		vdata->monotonic_time_snsec -=
-				((u64)NSEC_PER_SEC) << tk->tkr_mono.shift;
-		vdata->monotonic_time_sec++;
-	}
-
-	vdata->wall_time_coarse_sec = tk->xtime_sec;
-	vdata->wall_time_coarse_nsec =
-			(long)(tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift);
-
-	vdata->monotonic_time_coarse_sec =
-		vdata->wall_time_coarse_sec + tk->wall_to_monotonic.tv_sec;
-	vdata->monotonic_time_coarse_nsec =
-		vdata->wall_time_coarse_nsec + tk->wall_to_monotonic.tv_nsec;
-
-	while (vdata->monotonic_time_coarse_nsec >= NSEC_PER_SEC) {
-		vdata->monotonic_time_coarse_nsec -= NSEC_PER_SEC;
-		vdata->monotonic_time_coarse_sec++;
-	}
-
-	vvar_write_end(vdata);
-}
diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 2e911ccc9db7..1822676b4ebd 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -3,6 +3,9 @@
 # Building vDSO images for sparc.
 #
 
+# Include the generic Makefile to check the built vDSO:
+include $(srctree)/lib/vdso/Makefile.include
+
 # files to link into the vdso
 vobjs-y := vdso-note.o vclock_gettime.o
 
@@ -105,6 +108,7 @@ $(obj)/vdso32.so.dbg: FORCE \
 quiet_cmd_vdso = VDSO    $@
       cmd_vdso = $(LD) -nostdlib -o $@ \
 		       $(VDSO_LDFLAGS) $(VDSO_LDFLAGS_$(filter %.lds,$(^F))) \
-		       -T $(filter %.lds,$^) $(filter %.o,$^)
+		       -T $(filter %.lds,$^) $(filter %.o,$^); \
+		       $(cmd_vdso_check)
 
 VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 -Bsymbolic --no-undefined -z noexecstack
diff --git a/arch/sparc/vdso/vclock_gettime.c b/arch/sparc/vdso/vclock_gettime.c
index e768c0b84b34..093a7ff4dafc 100644
--- a/arch/sparc/vdso/vclock_gettime.c
+++ b/arch/sparc/vdso/vclock_gettime.c
@@ -12,169 +12,40 @@
  * Copyright (c) 2017 Oracle and/or its affiliates. All rights reserved.
  */
 
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <asm/io.h>
-#include <asm/timex.h>
-#include <asm/clocksource.h>
-#include <asm/vdso/gettimeofday.h>
-#include <asm/vvar.h>
+#include <linux/compiler.h>
+#include <linux/types.h>
 
-/*
- * Compute the vvar page's address in the process address space, and return it
- * as a pointer to the vvar_data.
- */
-notrace static __always_inline struct vvar_data *get_vvar_data(void)
-{
-	unsigned long ret;
+#include <vdso/gettime.h>
 
-	/*
-	 * vdso data page is the first vDSO page so grab the PC
-	 * and move up a page to get to the data page.
-	 */
-	__asm__("rd %%pc, %0" : "=r" (ret));
-	ret &= ~(8192 - 1);
-	ret -= 8192;
+#include <asm/vdso/gettimeofday.h>
 
-	return (struct vvar_data *) ret;
-}
+#include "../../../../lib/vdso/gettimeofday.c"
 
-notrace static __always_inline u64 vgetsns(struct vvar_data *vvar)
+int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 {
-	u64 v;
-	u64 cycles = __arch_get_hw_counter(vvar);
-
-	v = (cycles - vvar->clock.cycle_last) & vvar->clock.mask;
-	return v * vvar->clock.mult;
+	return __cvdso_gettimeofday(tv, tz);
 }
 
-notrace static __always_inline int do_realtime(struct vvar_data *vvar,
-					       struct __kernel_old_timespec *ts)
-{
-	unsigned long seq;
-	u64 ns;
-
-	do {
-		seq = vvar_read_begin(vvar);
-		ts->tv_sec = vvar->wall_time_sec;
-		ns = vvar->wall_time_snsec;
-		ns += vgetsns(vvar);
-		ns = vdso_shift_ns(ns, vvar->clock.shift);
-	} while (unlikely(vvar_read_retry(vvar, seq)));
-
-	ts->tv_sec += __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
-	ts->tv_nsec = ns;
+int gettimeofday(struct __kernel_old_timeval *, struct timezone *)
+	__weak __alias(__vdso_gettimeofday);
 
-	return 0;
-}
-
-notrace static __always_inline int do_monotonic(struct vvar_data *vvar,
-						struct __kernel_old_timespec *ts)
+#if defined(CONFIG_SPARC64)
+int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
 {
-	unsigned long seq;
-	u64 ns;
-
-	do {
-		seq = vvar_read_begin(vvar);
-		ts->tv_sec = vvar->monotonic_time_sec;
-		ns = vvar->monotonic_time_snsec;
-		ns += vgetsns(vvar);
-		ns = vdso_shift_ns(ns, vvar->clock.shift);
-	} while (unlikely(vvar_read_retry(vvar, seq)));
-
-	ts->tv_sec += __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
-	ts->tv_nsec = ns;
-
-	return 0;
-}
-
-notrace static int do_realtime_coarse(struct vvar_data *vvar,
-				      struct __kernel_old_timespec *ts)
-{
-	unsigned long seq;
-
-	do {
-		seq = vvar_read_begin(vvar);
-		ts->tv_sec = vvar->wall_time_coarse_sec;
-		ts->tv_nsec = vvar->wall_time_coarse_nsec;
-	} while (unlikely(vvar_read_retry(vvar, seq)));
-	return 0;
+	return __cvdso_clock_gettime(clock, ts);
 }
 
-notrace static int do_monotonic_coarse(struct vvar_data *vvar,
-				       struct __kernel_old_timespec *ts)
-{
-	unsigned long seq;
-
-	do {
-		seq = vvar_read_begin(vvar);
-		ts->tv_sec = vvar->monotonic_time_coarse_sec;
-		ts->tv_nsec = vvar->monotonic_time_coarse_nsec;
-	} while (unlikely(vvar_read_retry(vvar, seq)));
+int clock_gettime(clockid_t, struct __kernel_timespec *)
+	__weak __alias(__vdso_clock_gettime);
 
-	return 0;
-}
+#else
 
-notrace int
-__vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
+int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
 {
-	struct vvar_data *vvd = get_vvar_data();
-
-	switch (clock) {
-	case CLOCK_REALTIME:
-		if (unlikely(vvd->vclock_mode == VCLOCK_NONE))
-			break;
-		return do_realtime(vvd, ts);
-	case CLOCK_MONOTONIC:
-		if (unlikely(vvd->vclock_mode == VCLOCK_NONE))
-			break;
-		return do_monotonic(vvd, ts);
-	case CLOCK_REALTIME_COARSE:
-		return do_realtime_coarse(vvd, ts);
-	case CLOCK_MONOTONIC_COARSE:
-		return do_monotonic_coarse(vvd, ts);
-	}
-	/*
-	 * Unknown clock ID ? Fall back to the syscall.
-	 */
-	return clock_gettime_fallback(clock, ts);
+	return __cvdso_clock_gettime32(clock, ts);
 }
-int
-clock_gettime(clockid_t, struct __kernel_old_timespec *)
-	__attribute__((weak, alias("__vdso_clock_gettime")));
 
-notrace int
-__vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
-{
-	struct vvar_data *vvd = get_vvar_data();
+int clock_gettime(clockid_t, struct old_timespec32 *)
+	__weak __alias(__vdso_clock_gettime);
 
-	if (likely(vvd->vclock_mode != VCLOCK_NONE)) {
-		if (likely(tv != NULL)) {
-			union tstv_t {
-				struct __kernel_old_timespec ts;
-				struct __kernel_old_timeval tv;
-			} *tstv = (union tstv_t *) tv;
-			do_realtime(vvd, &tstv->ts);
-			/*
-			 * Assign before dividing to ensure that the division is
-			 * done in the type of tv_usec, not tv_nsec.
-			 *
-			 * There cannot be > 1 billion usec in a second:
-			 * do_realtime() has already distributed such overflow
-			 * into tv_sec.  So we can assign it to an int safely.
-			 */
-			tstv->tv.tv_usec = tstv->ts.tv_nsec;
-			tstv->tv.tv_usec /= 1000;
-		}
-		if (unlikely(tz != NULL)) {
-			/* Avoid memcpy. Some old compilers fail to inline it */
-			tz->tz_minuteswest = vvd->tz_minuteswest;
-			tz->tz_dsttime = vvd->tz_dsttime;
-		}
-		return 0;
-	}
-	return gettimeofday_fallback(tv, tz);
-}
-int
-gettimeofday(struct __kernel_old_timeval *, struct timezone *)
-	__attribute__((weak, alias("__vdso_gettimeofday")));
+#endif
diff --git a/arch/sparc/vdso/vdso-layout.lds.S b/arch/sparc/vdso/vdso-layout.lds.S
index 9e0804789d11..180e5d0ee071 100644
--- a/arch/sparc/vdso/vdso-layout.lds.S
+++ b/arch/sparc/vdso/vdso-layout.lds.S
@@ -4,6 +4,10 @@
  * This script controls its layout.
  */
 
+#include <vdso/datapage.h>
+#include <vdso/page.h>
+#include <asm/vdso/vsyscall.h>
+
 SECTIONS
 {
 	/*
@@ -13,8 +17,7 @@ SECTIONS
 	 * segment. Page size is 8192 for both 64-bit and 32-bit vdso binaries
 	 */
 
-	vvar_start = . -8192;
-	vvar_data = vvar_start;
+	VDSO_VVAR_SYMS
 
 	. = SIZEOF_HEADERS;
 
diff --git a/arch/sparc/vdso/vma.c b/arch/sparc/vdso/vma.c
index 1f47d8341e43..60029d60f4d3 100644
--- a/arch/sparc/vdso/vma.c
+++ b/arch/sparc/vdso/vma.c
@@ -16,17 +16,16 @@
 #include <linux/linkage.h>
 #include <linux/random.h>
 #include <linux/elf.h>
+#include <linux/vdso_datastore.h>
 #include <asm/cacheflush.h>
 #include <asm/spitfire.h>
 #include <asm/vdso.h>
-#include <asm/vvar.h>
 #include <asm/page.h>
 
-unsigned int __read_mostly vdso_enabled = 1;
+#include <vdso/datapage.h>
+#include <asm/vdso/vsyscall.h>
 
-static struct vm_special_mapping vvar_mapping = {
-	.name = "[vvar]"
-};
+unsigned int __read_mostly vdso_enabled = 1;
 
 #ifdef	CONFIG_SPARC64
 static struct vm_special_mapping vdso_mapping64 = {
@@ -40,10 +39,8 @@ static struct vm_special_mapping vdso_mapping32 = {
 };
 #endif
 
-struct vvar_data *vvar_data;
-
 /*
- * Allocate pages for the vdso and vvar, and copy in the vdso text from the
+ * Allocate pages for the vdso and copy in the vdso text from the
  * kernel image.
  */
 static int __init init_vdso_image(const struct vdso_image *image,
@@ -51,9 +48,8 @@ static int __init init_vdso_image(const struct vdso_image *image,
 				  bool elf64)
 {
 	int cnpages = (image->size) / PAGE_SIZE;
-	struct page *dp, **dpp = NULL;
 	struct page *cp, **cpp = NULL;
-	int i, dnpages = 0;
+	int i;
 
 	/*
 	 * First, the vdso text.  This is initialied data, an integral number of
@@ -76,31 +72,6 @@ static int __init init_vdso_image(const struct vdso_image *image,
 		copy_page(page_address(cp), image->data + i * PAGE_SIZE);
 	}
 
-	/*
-	 * Now the vvar page.  This is uninitialized data.
-	 */
-
-	if (vvar_data == NULL) {
-		dnpages = (sizeof(struct vvar_data) / PAGE_SIZE) + 1;
-		if (WARN_ON(dnpages != 1))
-			goto oom;
-		dpp = kzalloc_objs(struct page *, dnpages);
-		vvar_mapping.pages = dpp;
-
-		if (!dpp)
-			goto oom;
-
-		dp = alloc_page(GFP_KERNEL);
-		if (!dp)
-			goto oom;
-
-		dpp[0] = dp;
-		vvar_data = page_address(dp);
-		memset(vvar_data, 0, PAGE_SIZE);
-
-		vvar_data->seq = 0;
-	}
-
 	return 0;
  oom:
 	if (cpp != NULL) {
@@ -112,15 +83,6 @@ static int __init init_vdso_image(const struct vdso_image *image,
 		vdso_mapping->pages = NULL;
 	}
 
-	if (dpp != NULL) {
-		for (i = 0; i < dnpages; i++) {
-			if (dpp[i] != NULL)
-				__free_page(dpp[i]);
-		}
-		kfree(dpp);
-		vvar_mapping.pages = NULL;
-	}
-
 	pr_warn("Cannot allocate vdso\n");
 	vdso_enabled = 0;
 	return -ENOMEM;
@@ -155,9 +117,12 @@ static unsigned long vdso_addr(unsigned long start, unsigned int len)
 	return start + (offset << PAGE_SHIFT);
 }
 
+static_assert(VDSO_NR_PAGES == __VDSO_PAGES);
+
 static int map_vdso(const struct vdso_image *image,
 		struct vm_special_mapping *vdso_mapping)
 {
+	const size_t area_size = image->size + VDSO_NR_PAGES * PAGE_SIZE;
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 	unsigned long text_start, addr = 0;
@@ -170,23 +135,20 @@ static int map_vdso(const struct vdso_image *image,
 	 * region is free.
 	 */
 	if (current->flags & PF_RANDOMIZE) {
-		addr = get_unmapped_area(NULL, 0,
-					 image->size - image->sym_vvar_start,
-					 0, 0);
+		addr = get_unmapped_area(NULL, 0, area_size, 0, 0);
 		if (IS_ERR_VALUE(addr)) {
 			ret = addr;
 			goto up_fail;
 		}
-		addr = vdso_addr(addr, image->size - image->sym_vvar_start);
+		addr = vdso_addr(addr, area_size);
 	}
-	addr = get_unmapped_area(NULL, addr,
-				 image->size - image->sym_vvar_start, 0, 0);
+	addr = get_unmapped_area(NULL, addr, area_size, 0, 0);
 	if (IS_ERR_VALUE(addr)) {
 		ret = addr;
 		goto up_fail;
 	}
 
-	text_start = addr - image->sym_vvar_start;
+	text_start = addr + VDSO_NR_PAGES * PAGE_SIZE;
 	current->mm->context.vdso = (void __user *)text_start;
 
 	/*
@@ -204,11 +166,7 @@ static int map_vdso(const struct vdso_image *image,
 		goto up_fail;
 	}
 
-	vma = _install_special_mapping(mm,
-				       addr,
-				       -image->sym_vvar_start,
-				       VM_READ|VM_MAYREAD,
-				       &vvar_mapping);
+	vma = vdso_install_vvar_mapping(mm, addr);
 
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);

-- 
2.53.0


