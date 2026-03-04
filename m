Return-Path: <linuxppc-dev+bounces-17675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGuDNDrkp2nqlQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:50:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0EF1FBE43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:50:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQlDh1pYPz3cLg;
	Wed, 04 Mar 2026 18:49:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772610564;
	cv=none; b=h3/DbO10fxfMgZF2biicqbNsw9YryTjqc1VR0OlAik34ZTSnSgFlgbJynHHxncukS0QtGKJlJbrcU72B2Xert/Z2DULIapxNg2OAc5839cOt+qp9PEfRHM5xDEMmUog6MtzTJUKYoTRF0/wHYt1LD2Y/JWPmm650RVb0H4dOLTuD1xlaEmNrJ88D47QrIdxb/RonqljvwA7dM+u3/pjuwYyRIJciHvMzdZKnK1+CqGMGWeE4o98VTK7jBTuo/Az2Fvz1x4QOq+wXrteG7/7JfVOCqrXmZ9/ThSNtal5O0I8CtO63Gb/WypkYP48eHcqigGDrxkloKeSweKXXNXszow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772610564; c=relaxed/relaxed;
	bh=Zf2qbDBP4Rbfr8gWlm8vuMp/lDs4tV3BMFz0tN5t62w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMiR4nL2n54c97gDUDo9+WYMRutVoMd30y5ONDPkvh20uns88eb7WRoR0eAcPbuXsYl+f5GIOogEVR25nEn6hlNd2KKFMKpZrXb8h5kHeqTCL1r447vSbex/S+bqPNMSlrz7rPCxsPlSpGSqxtgJhqjEhlitU8Wx5wznNy9oe9+uaeRctLAdeDyQCjWJuMTWIk/2dQmqUxs0uLfa1APmjbonP8QbLBfE9K9IqOibhntH2ZYTwErbcPI4tyrZaJUp49aDn3ZxjybiAYU4z2Yl4PQ8IsIGjc0DTLJ3Qtg2UmX69dAgFSlWs1S7xUCAnHBLwN3/lVpXqxx5Ts4mbFddFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nL3IhNBj; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6D5nz8Q3; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nL3IhNBj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6D5nz8Q3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQlDf6RRDz3cKF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 18:49:22 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zf2qbDBP4Rbfr8gWlm8vuMp/lDs4tV3BMFz0tN5t62w=;
	b=nL3IhNBjMzUpb5GIKujWlvXCIVmZSTky9OK2l7R7fDStAvJVCHaEEN2lcY8lvHO/kL90P8
	54sx2EAcysRucx4g3td3AjYoazGBoPoeMuC+TAodl4hp2TcBOxVprEF8UfsLbtEb6FS9kC
	1U6bLZKf2FUVRGPgwBCCOGF6yg4U5UYr21bd35K5GrQCJFT/Itk42R1mhiC6Q8GSFOlfAL
	eVTkFY/hiNdRfqlUycppV9sK/4xhO2YGNbSCu0erDkrrqa02fh7DsPcW6utQFTnHea8qo6
	5HC3UAYz0vMHlNJKphOFbtLY0sZtM81KMBk/qUF64go+D8VhRCZAnrf6Eds4qw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zf2qbDBP4Rbfr8gWlm8vuMp/lDs4tV3BMFz0tN5t62w=;
	b=6D5nz8Q3Ow4OVULKJZbjyIg5uuId/6kI4vZ2SFwVhHC0UES/fLeoBL2H5CDoxIcEUJFIrv
	nT/s2ixQCBU1PlAQ==
Date: Wed, 04 Mar 2026 08:49:04 +0100
Subject: [PATCH v6 07/14] sparc64: vdso: Move hardware counter read into
 header
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
Message-Id: <20260304-vdso-sparc64-generic-2-v6-7-d8eb3b0e1410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=5747;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=roUXzzNbiJdsgUipGHjJJRN08Pu92Rqf9mHloTCOApQ=;
 b=J7hNztAWYDj7nWWHrBBIJ7kJZ+LwMuyXs2BVDKKzyTNjj10l4InJ9WoWWrnvPjxSAYSNPkfEc
 z7Jpyd0jIZaDP/HXurOPWcD3Zh05zs2WZeVJ8CLBI2+rJrFh6ETD7c8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 1F0EF1FBE43
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
	TAGGED_FROM(0.00)[bounces-17675-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,gaisler.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

The generic vDSO libraries expected the architecture glue around hardware
counter reading in asm/vdso/gettimeofday.h. To prepare the adoption of the
generic library, move the existing functions there.

While at it, perform some trivial alignment with the generic vDSO library:
* Drop 'notrace', as the functions are __always_inline anyways
* Use the same parameter types
* Use the same function names

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/vdso/gettimeofday.h | 78 ++++++++++++++++++++++++++++++
 arch/sparc/vdso/vclock_gettime.c           | 70 ++-------------------------
 2 files changed, 82 insertions(+), 66 deletions(-)

diff --git a/arch/sparc/include/asm/vdso/gettimeofday.h b/arch/sparc/include/asm/vdso/gettimeofday.h
new file mode 100644
index 000000000000..31f6505d3ab5
--- /dev/null
+++ b/arch/sparc/include/asm/vdso/gettimeofday.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2006 Andi Kleen, SUSE Labs.
+ */
+
+#ifndef _ASM_SPARC_VDSO_GETTIMEOFDAY_H
+#define _ASM_SPARC_VDSO_GETTIMEOFDAY_H
+
+#include <linux/types.h>
+#include <asm/vvar.h>
+
+#ifdef	CONFIG_SPARC64
+static __always_inline u64 vdso_shift_ns(u64 val, u32 amt)
+{
+	return val >> amt;
+}
+
+static __always_inline u64 vread_tick(void)
+{
+	u64	ret;
+
+	__asm__ __volatile__("rd %%tick, %0" : "=r" (ret));
+	return ret;
+}
+
+static __always_inline u64 vread_tick_stick(void)
+{
+	u64	ret;
+
+	__asm__ __volatile__("rd %%asr24, %0" : "=r" (ret));
+	return ret;
+}
+#else
+static __always_inline u64 vdso_shift_ns(u64 val, u32 amt)
+{
+	u64 ret;
+
+	__asm__ __volatile__("sllx %H1, 32, %%g1\n\t"
+			     "srl %L1, 0, %L1\n\t"
+			     "or %%g1, %L1, %%g1\n\t"
+			     "srlx %%g1, %2, %L0\n\t"
+			     "srlx %L0, 32, %H0"
+			     : "=r" (ret)
+			     : "r" (val), "r" (amt)
+			     : "g1");
+	return ret;
+}
+
+static __always_inline u64 vread_tick(void)
+{
+	register unsigned long long ret asm("o4");
+
+	__asm__ __volatile__("rd %%tick, %L0\n\t"
+			     "srlx %L0, 32, %H0"
+			     : "=r" (ret));
+	return ret;
+}
+
+static __always_inline u64 vread_tick_stick(void)
+{
+	register unsigned long long ret asm("o4");
+
+	__asm__ __volatile__("rd %%asr24, %L0\n\t"
+			     "srlx %L0, 32, %H0"
+			     : "=r" (ret));
+	return ret;
+}
+#endif
+
+static __always_inline u64 __arch_get_hw_counter(struct vvar_data *vvar)
+{
+	if (likely(vvar->vclock_mode == VCLOCK_STICK))
+		return vread_tick_stick();
+	else
+		return vread_tick();
+}
+
+#endif /* _ASM_SPARC_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/sparc/vdso/vclock_gettime.c b/arch/sparc/vdso/vclock_gettime.c
index 643608bffe13..16ac80982a00 100644
--- a/arch/sparc/vdso/vclock_gettime.c
+++ b/arch/sparc/vdso/vclock_gettime.c
@@ -19,6 +19,7 @@
 #include <asm/unistd.h>
 #include <asm/timex.h>
 #include <asm/clocksource.h>
+#include <asm/vdso/gettimeofday.h>
 #include <asm/vvar.h>
 
 #ifdef	CONFIG_SPARC64
@@ -85,73 +86,10 @@ notrace static long vdso_fallback_gettimeofday(struct __kernel_old_timeval *tv,
 	return o0;
 }
 
-#ifdef	CONFIG_SPARC64
-notrace static __always_inline u64 __shr64(u64 val, int amt)
-{
-	return val >> amt;
-}
-
-notrace static __always_inline u64 vread_tick(void)
-{
-	u64	ret;
-
-	__asm__ __volatile__("rd %%tick, %0" : "=r" (ret));
-	return ret;
-}
-
-notrace static __always_inline u64 vread_tick_stick(void)
-{
-	u64	ret;
-
-	__asm__ __volatile__("rd %%asr24, %0" : "=r" (ret));
-	return ret;
-}
-#else
-notrace static __always_inline u64 __shr64(u64 val, int amt)
-{
-	u64 ret;
-
-	__asm__ __volatile__("sllx %H1, 32, %%g1\n\t"
-			     "srl %L1, 0, %L1\n\t"
-			     "or %%g1, %L1, %%g1\n\t"
-			     "srlx %%g1, %2, %L0\n\t"
-			     "srlx %L0, 32, %H0"
-			     : "=r" (ret)
-			     : "r" (val), "r" (amt)
-			     : "g1");
-	return ret;
-}
-
-notrace static __always_inline u64 vread_tick(void)
-{
-	register unsigned long long ret asm("o4");
-
-	__asm__ __volatile__("rd %%tick, %L0\n\t"
-			     "srlx %L0, 32, %H0"
-			     : "=r" (ret));
-	return ret;
-}
-
-notrace static __always_inline u64 vread_tick_stick(void)
-{
-	register unsigned long long ret asm("o4");
-
-	__asm__ __volatile__("rd %%asr24, %L0\n\t"
-			     "srlx %L0, 32, %H0"
-			     : "=r" (ret));
-	return ret;
-}
-#endif
-
 notrace static __always_inline u64 vgetsns(struct vvar_data *vvar)
 {
 	u64 v;
-	u64 cycles;
-
-	if (likely(vvar->vclock_mode == VCLOCK_STICK))
-		cycles = vread_tick_stick();
-	else
-		cycles = vread_tick();
+	u64 cycles = __arch_get_hw_counter(vvar);
 
 	v = (cycles - vvar->clock.cycle_last) & vvar->clock.mask;
 	return v * vvar->clock.mult;
@@ -168,7 +106,7 @@ notrace static __always_inline int do_realtime(struct vvar_data *vvar,
 		ts->tv_sec = vvar->wall_time_sec;
 		ns = vvar->wall_time_snsec;
 		ns += vgetsns(vvar);
-		ns = __shr64(ns, vvar->clock.shift);
+		ns = vdso_shift_ns(ns, vvar->clock.shift);
 	} while (unlikely(vvar_read_retry(vvar, seq)));
 
 	ts->tv_sec += __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
@@ -188,7 +126,7 @@ notrace static __always_inline int do_monotonic(struct vvar_data *vvar,
 		ts->tv_sec = vvar->monotonic_time_sec;
 		ns = vvar->monotonic_time_snsec;
 		ns += vgetsns(vvar);
-		ns = __shr64(ns, vvar->clock.shift);
+		ns = vdso_shift_ns(ns, vvar->clock.shift);
 	} while (unlikely(vvar_read_retry(vvar, seq)));
 
 	ts->tv_sec += __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);

-- 
2.53.0


