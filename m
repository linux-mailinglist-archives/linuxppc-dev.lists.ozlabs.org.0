Return-Path: <linuxppc-dev+bounces-12843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D86BD7B83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:53:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4Zp22qFz3f3g;
	Tue, 14 Oct 2025 17:49:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424578;
	cv=none; b=gsCe963MqVA5j9igZUViwWv64Af5PohRFU7NoL15s/+1ulE62rEJI5IU/ENrlIB65M1zSUStqxUhGnurxqjovT9TzXX9izZHhbOoOSZyP7sPXwFoWuWE+QCVo16oiuny15cDsZ0DrrCGLuUA/RfFAXj6jGPBZ/cvt0f2T6gz+jo9RRD3OZj3B9qAo8U1SNXACwfDpoNiWCpXabR2xso2HSi3P+cPsT1FNOY7e1tz8bWATZDuhZ4u85KuJ0HGKMAz1gGTL4gnDMKO/te5MR1iiRMCLVh0OtyEUXOqykzmwtQIQnPqOS4m/UE7iLHsA36M5LhPYg7wbKUqX/6UHNS2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424578; c=relaxed/relaxed;
	bh=OR5Q4ZuRkIA741qF/DuLi5z3bNd2XCtlxY+P3oghy5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DykohPqzp80Q5wccq6e1IqB5gTyTrbYSiW+FyzV8QkhboGLsahJ4Ry0nHLsXRTyO+yEZujvuTPkEux8Vf24AQ2IMcBHxhCArGK7AC8i9Uip3nWx3+zFS9kqD9EvoVNqYMzk9x3CpEBESZMlYIJTvmOR3NEVs6BpqaL8S6Ij89UWUt1lgHo+EIWz4ZWYsg2sOBgimSz3suwjQt/UzpuomYGmgv9A7m6bU8X0IJyUen6WzpKeHJjH7NaRe3XmkFNR1k0RKdNsPYvyhRZEWdw8rWxF+bBg0IrJfsghLwTTU9oWcowRUzU8gMcIpWBO6Ny0Xq6U93VpVhuezr/vDWQrskg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vOoxNAOI; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XzDMbTmh; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vOoxNAOI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XzDMbTmh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4Zn4H1Sz3dx0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:37 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OR5Q4ZuRkIA741qF/DuLi5z3bNd2XCtlxY+P3oghy5c=;
	b=vOoxNAOIOkPtLK2Gs2EYlcx/T6V88XBROauQuxOTsSOXMK+Y6kzwIhvy3/jWrpuW1S5lPL
	KBWnjfyE/3pB1N3+E4p2688vm8zCGlXWQtVNJuwi6uhImcIWrYDEDnNPclgYn/zrMrtQD5
	A5SVuO0oGy/cG1FCJG1PZFdcYkEeVa8F7dUdCjNXAUHkfmW9OfEyCWK2cmK9jBh+O+owMN
	ZEK3i0NzNgFW1fqzXEyzFPnWYxtZgsrQeTAyOM8EFqvBlmR78Ix2og97ttYKm8IOe5Ko8r
	56SV0Si0lDhUd3A/tjT/8NOXC4la0FxXrcXaPBDI8x/+F9N+japSZF3p+b6RlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OR5Q4ZuRkIA741qF/DuLi5z3bNd2XCtlxY+P3oghy5c=;
	b=XzDMbTmhdTy1yfzkEoPt+uhA82Qn3qiMel7AQ2xO4ZQVzR0alYnKUK/WSBjO4f7wYsr5fh
	qGk1gFKLI1Lk2hBw==
Date: Tue, 14 Oct 2025 08:49:15 +0200
Subject: [PATCH v4 29/35] sparc64: vdso: Move syscall fallbacks into header
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
Message-Id: <20251014-vdso-sparc64-generic-2-v4-29-e0607bf49dea@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=5844;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=54fVsevF6wJL94FjT3o2LBMAQrSAU/5OtqL2hTA5L+g=;
 b=ZffNKFwKaA+stbCVpIgoFsS3FlacbBDVNHcY87CY59NC3DdJDgUnlHzLWFA4unTTem27rYS0G
 laK7Y+RNIFCDAfCFvkTo8l5vng9UhFy1zbfTZv61v/2XhG2a6rBz7jc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic vDSO libraries expected the syscall fallbacks in
asm/vdso/gettimeofday.h. To prepare the adoption of the generic library,
move the existing functions there.

While at it, rename them so they match what the generic library expects.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/vdso/gettimeofday.h | 50 +++++++++++++++++++++++++++++
 arch/sparc/vdso/vclock_gettime.c           | 51 ++----------------------------
 2 files changed, 52 insertions(+), 49 deletions(-)

diff --git a/arch/sparc/include/asm/vdso/gettimeofday.h b/arch/sparc/include/asm/vdso/gettimeofday.h
index 31f6505d3ab5dde9e02eca6da9182e5fb91031c4..429dc080568f59145cc0bc696060adeb60ac177a 100644
--- a/arch/sparc/include/asm/vdso/gettimeofday.h
+++ b/arch/sparc/include/asm/vdso/gettimeofday.h
@@ -6,6 +6,9 @@
 #ifndef _ASM_SPARC_VDSO_GETTIMEOFDAY_H
 #define _ASM_SPARC_VDSO_GETTIMEOFDAY_H
 
+#include <uapi/linux/time.h>
+#include <uapi/linux/unistd.h>
+
 #include <linux/types.h>
 #include <asm/vvar.h>
 
@@ -75,4 +78,51 @@ static __always_inline u64 __arch_get_hw_counter(struct vvar_data *vvar)
 		return vread_tick();
 }
 
+#ifdef	CONFIG_SPARC64
+#define SYSCALL_STRING							\
+	"ta	0x6d;"							\
+	"bcs,a	1f;"							\
+	" sub	%%g0, %%o0, %%o0;"					\
+	"1:"
+#else
+#define SYSCALL_STRING							\
+	"ta	0x10;"							\
+	"bcs,a	1f;"							\
+	" sub	%%g0, %%o0, %%o0;"					\
+	"1:"
+#endif
+
+#define SYSCALL_CLOBBERS						\
+	"f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7",			\
+	"f8", "f9", "f10", "f11", "f12", "f13", "f14", "f15",		\
+	"f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",		\
+	"f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",		\
+	"f32", "f34", "f36", "f38", "f40", "f42", "f44", "f46",		\
+	"f48", "f50", "f52", "f54", "f56", "f58", "f60", "f62",		\
+	"cc", "memory"
+
+static __always_inline
+long clock_gettime_fallback(clockid_t clock, struct __kernel_old_timespec *ts)
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
+static __always_inline
+long gettimeofday_fallback(struct __kernel_old_timeval *tv, struct timezone *tz)
+{
+	register long num __asm__("g1") = __NR_gettimeofday;
+	register long o0 __asm__("o0") = (long) tv;
+	register long o1 __asm__("o1") = (long) tz;
+
+	__asm__ __volatile__(SYSCALL_STRING : "=r" (o0) : "r" (num),
+			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
+	return o0;
+}
+
 #endif /* _ASM_SPARC_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/sparc/vdso/vclock_gettime.c b/arch/sparc/vdso/vclock_gettime.c
index 16ac80982a00b9f965453b89a0cc111312baa9b2..e768c0b84b3420deab2f74335892d40a5b515ee7 100644
--- a/arch/sparc/vdso/vclock_gettime.c
+++ b/arch/sparc/vdso/vclock_gettime.c
@@ -13,38 +13,13 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/time.h>
 #include <linux/string.h>
 #include <asm/io.h>
-#include <asm/unistd.h>
 #include <asm/timex.h>
 #include <asm/clocksource.h>
 #include <asm/vdso/gettimeofday.h>
 #include <asm/vvar.h>
 
-#ifdef	CONFIG_SPARC64
-#define SYSCALL_STRING							\
-	"ta	0x6d;"							\
-	"bcs,a	1f;"							\
-	" sub	%%g0, %%o0, %%o0;"					\
-	"1:"
-#else
-#define SYSCALL_STRING							\
-	"ta	0x10;"							\
-	"bcs,a	1f;"							\
-	" sub	%%g0, %%o0, %%o0;"					\
-	"1:"
-#endif
-
-#define SYSCALL_CLOBBERS						\
-	"f0", "f1", "f2", "f3", "f4", "f5", "f6", "f7",			\
-	"f8", "f9", "f10", "f11", "f12", "f13", "f14", "f15",		\
-	"f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",		\
-	"f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",		\
-	"f32", "f34", "f36", "f38", "f40", "f42", "f44", "f46",		\
-	"f48", "f50", "f52", "f54", "f56", "f58", "f60", "f62",		\
-	"cc", "memory"
-
 /*
  * Compute the vvar page's address in the process address space, and return it
  * as a pointer to the vvar_data.
@@ -64,28 +39,6 @@ notrace static __always_inline struct vvar_data *get_vvar_data(void)
 	return (struct vvar_data *) ret;
 }
 
-notrace static long vdso_fallback_gettime(long clock, struct __kernel_old_timespec *ts)
-{
-	register long num __asm__("g1") = __NR_clock_gettime;
-	register long o0 __asm__("o0") = clock;
-	register long o1 __asm__("o1") = (long) ts;
-
-	__asm__ __volatile__(SYSCALL_STRING : "=r" (o0) : "r" (num),
-			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
-	return o0;
-}
-
-notrace static long vdso_fallback_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
-{
-	register long num __asm__("g1") = __NR_gettimeofday;
-	register long o0 __asm__("o0") = (long) tv;
-	register long o1 __asm__("o1") = (long) tz;
-
-	__asm__ __volatile__(SYSCALL_STRING : "=r" (o0) : "r" (num),
-			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
-	return o0;
-}
-
 notrace static __always_inline u64 vgetsns(struct vvar_data *vvar)
 {
 	u64 v;
@@ -184,7 +137,7 @@ __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
 	/*
 	 * Unknown clock ID ? Fall back to the syscall.
 	 */
-	return vdso_fallback_gettime(clock, ts);
+	return clock_gettime_fallback(clock, ts);
 }
 int
 clock_gettime(clockid_t, struct __kernel_old_timespec *)
@@ -220,7 +173,7 @@ __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 		}
 		return 0;
 	}
-	return vdso_fallback_gettimeofday(tv, tz);
+	return gettimeofday_fallback(tv, tz);
 }
 int
 gettimeofday(struct __kernel_old_timeval *, struct timezone *)

-- 
2.51.0


