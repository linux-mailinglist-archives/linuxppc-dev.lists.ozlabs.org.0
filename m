Return-Path: <linuxppc-dev+bounces-12835-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06573BD7B3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:52:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4Zf2B1kz3dVB;
	Tue, 14 Oct 2025 17:49:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424570;
	cv=none; b=bqs7ECEfe0+kOPAsU6Wyc0XZFftUzqwIFA1PI8/M+hOxIfdZ+HHnVAcRLC6ewR+w4Z79WnsfXN34eekfDJXAhIQ4pKSZp26fkilKLxweGTmwDDyYFBbQd3x1RKfm/OQ0K/sfit7MQyyThyIID0x4FsAsErkQCnnRHzi9WAU/FMLWOSYl/riHdN7ow97ZxInGpNsReLfYUotOtXdf6G/1otSx2F+3TXmAG2f38uxDTp3t55EQLXo+AhAPku6yWyYSbRxVY9Sn82Pq4TqkT6OvUh7rp2Ag7W7TpsuXSUV5z3g6W0HrWRY+xTDgQjPMWXmokbSFIQ9GYd5raFMG/v3YXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424570; c=relaxed/relaxed;
	bh=1o80+pTTZok9t083p85VuG7odpUuHMCDXyiNCCOOgcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kz3wVJEEOhggHDJrrgXlaLyqo2yBye0mhsnDa29I4hiLw1wr1BKLMSASKShhTy9FlRfuFlzOmQRId2raiLFpQkBnOSX7zrdBE0MsB9M0XyDzjozIPawXYJqi0Jdy0EaDOBFpzLRhAIVTh7GVtQdfV1qmqI6CvAUsxMJsikGtqqVOPfmr1dTGAn6+KJA1644DEzymEherp2MVV+8wH7tgbQJXN3lfPd9BAKTjWRRw0jy+CLEalaWpk/SaI99HmHeGARw4JliUGM5ZDEs3J4ZrmbKDUbbqV2YmrmtxrU6ZOv9m9k0xdHegfU/OtFztSJr6xyABmAGqcQLcl76dTIWJQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BqO+8kjW; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bWqduEVL; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BqO+8kjW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bWqduEVL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4Zd51W5z3dT8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:29 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1o80+pTTZok9t083p85VuG7odpUuHMCDXyiNCCOOgcQ=;
	b=BqO+8kjWHCR6zCWLnuLp8TBffuiNNk2o4z8XJBD1zsT+hKlLBuR4Ds23Akwb2k4rS6aQcZ
	rWJF1S4SYT+MnYW2C4UFrd26YVfBJgEW50/eHnJENt0TNNlyGU0tXCuqRIAmbkm4x/LT2y
	K6hYAvqYXlYGT2/YH2DHCefDQlRBgMCFLNm28CeuWWTE/515vZi92VYYbYgEf/l+TaHPyI
	ab13YPCeOeRh1IUiaUeQMzL7cT3HW0PdvwLnm39eDxyC7/pNv0TmA0AahsScyzYIagqOE1
	OILaW9h/fvQ5CY7cIlMVOSvnidTaQe56ZV29hVGo8LoL9Y9GKHYgM5w++uVIHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1o80+pTTZok9t083p85VuG7odpUuHMCDXyiNCCOOgcQ=;
	b=bWqduEVLNczz4F48vryqgyDVHrVvRvoPOGZreD66cRvumYpLfzMCYoRmjsjZhyQ3kvJc14
	SKcE6cic25YREsBg==
Date: Tue, 14 Oct 2025 08:49:14 +0200
Subject: [PATCH v4 28/35] sparc64: vdso: Move hardware counter read into
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
Message-Id: <20251014-vdso-sparc64-generic-2-v4-28-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
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
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=5859;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=T690CgHOC0+pGW9MJ3oWsROYo+v+vkE9Ah57C6iq4Fo=;
 b=0yzvwTJA6GgpGp1SBU5hjMMbwI0rwFtzhk3rbqNm7Q3E5smIOQctJjpH5qPmYL0U5gSh0Otoq
 +k3EW+C3pjtCBeg+w19G/8t+DLF/1cFsPPwLBt0Or2jUp+S42F6oqj/
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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
index 0000000000000000000000000000000000000000..31f6505d3ab5dde9e02eca6da9182e5fb91031c4
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
index 643608bffe13d904c5f77edd585b2e58277491fb..16ac80982a00b9f965453b89a0cc111312baa9b2 100644
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
2.51.0


