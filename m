Return-Path: <linuxppc-dev+bounces-12340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA0B7FBCC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:06:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSd1hh4z3ddR;
	Thu, 18 Sep 2025 00:02:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117745;
	cv=none; b=l6iTwOw91LAIW99tCUejyhvxgdWkls7oXQaCb7tFh0Ir5sHCIVuMC1fjkKIaEO0BoaawOyq1q4Ndpa0pAVzHHiYiApGvoBgrzEurxrn7YS5kul1dpYw6BZ3vjqLPhYrut8iE5+sxqFJ20NH2TOEWoilguFbjmqDWQlzLkO7W5opOa8hQ5NNEF6xBiBiE00OXpJeV+VdfiOizkKoh6nLn129MKKNNTlK0p5qX6zC0HC6R1vS+YpLte70ziOnXxKsu43DWsE2uTaloZDfmblH6TJwa1nzcwJROr3ulidPN7BgUDikb3KeYt8ZKxl/rMsdbSvdUaOFXSrSTUi+oWpavDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117745; c=relaxed/relaxed;
	bh=j+biOGKKguDUuRUAhQ0+dLthYNe28/1HU1RGsMJffvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQnOhHbel4sPEx1avFAi7HSkQNHi1TDXDudOu3y3CQ6ZbXPHLsW3Vsohc935eHX/hF004XrUiFjR/mqV/i9VuZ5wMv/BfbYLV5GafewD8YvrmHl3LkggRRd4T+K/WEgXTIkh2SnzSYU1kqeodcOndqRdhxXBfU0Dt5pttXjoGpM1XSCmg+Ru812CT2qbM//ANXetdB+saDdmxLtEznGL2srEAPU1Qrwtf8P3RV4/F5JeMvlW7KvDBHnNTTjUBXCz5fHdoJUY26IwZ+ZtQWUn8NOhZnDrUPDMyl8L+8B5QJmOeTv1LtkPqjr9P8j3Pv/KtCgcCiGkdO+YZj30lNU49g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q/ql4mj7; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+t6hmZOf; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q/ql4mj7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+t6hmZOf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSc4qYhz303F
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:24 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+biOGKKguDUuRUAhQ0+dLthYNe28/1HU1RGsMJffvw=;
	b=Q/ql4mj7Oqha+n1+zWFMHqf6AN0NJY+yf8D5vjlijtUN7GKN76OsAHWTo+9VOy/rJHZ2IT
	4CYpfHnWdwKUM6nnKJFUpm6cpWO8kXH0qekaujtfqB+aCcrZkcxWkxzhqNXvxq6+fj0gIo
	RUKT/fQAG1ob6HEmhcZl4wuTdlo6E7wWmVmiw3iAZz+HC29hRnAmUMCqNQSh5L/l9zq1+F
	B0snSBWJgyLP//MeSZJdvLKbCEp3knyRLar+vKpkyeuXtXDCyAO84fQR1EAQsd7aoN2JM5
	LKc46ePgxXh9T9KfnzDphlGm1SnT/VASy/e640MqttQAG+3jCvBZ8f78IKHFMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+biOGKKguDUuRUAhQ0+dLthYNe28/1HU1RGsMJffvw=;
	b=+t6hmZOfY/qlclhLwxtdQbKthvuYmaF5Oc4VwtZI8vjD3ivseTq1MjM9W5AWz+ifnnvfs1
	VODjJJD3lU6k/XCg==
Date: Wed, 17 Sep 2025 16:00:36 +0200
Subject: [PATCH v3 34/36] sparc64: vdso: Implement clock_gettime64()
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-34-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=3230;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zMIzJ15FbxyFeuQIxSk4GNU8RIcZLfNhISbA3hu5yNQ=;
 b=9BbtDwHAenbMghoU6tM/Syy/OgZuKlkxcwIxGWN87y87xZOmS4MtwmZNMkF8EXZ9HCyqVMysv
 eVjBlZHre0vACPgZ5sMHt1rPiS2p/7jwHLAT08LAfIpGHsUqzEYgjgq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

To be y2038-safe, 32-bit userspace needs to explicitly call the 64-bit safe
time APIs.

Implement clock_gettime64() in the 32-bit vDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/sparc/include/asm/vdso/gettimeofday.h | 20 ++++++++++++++++++--
 arch/sparc/vdso/vclock_gettime.c           |  8 ++++++++
 arch/sparc/vdso/vdso32/vdso32.lds.S        |  2 ++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/vdso/gettimeofday.h b/arch/sparc/include/asm/vdso/gettimeofday.h
index a35875fba45470ba961a7df3ae52bc17d2a4a4a0..b0c80c8a28bb71e16398ab38904ba826457ac71d 100644
--- a/arch/sparc/include/asm/vdso/gettimeofday.h
+++ b/arch/sparc/include/asm/vdso/gettimeofday.h
@@ -101,6 +101,8 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode, const struct vd
 	"f48", "f50", "f52", "f54", "f56", "f58", "f60", "f62",		\
 	"cc", "memory"
 
+#ifdef CONFIG_SPARC64
+
 static __always_inline
 long clock_gettime_fallback(clockid_t clock, struct __kernel_timespec *ts)
 {
@@ -113,7 +115,20 @@ long clock_gettime_fallback(clockid_t clock, struct __kernel_timespec *ts)
 	return o0;
 }
 
-#ifndef CONFIG_SPARC64
+#else /* !CONFIG_SPARC64 */
+
+static __always_inline
+long clock_gettime_fallback(clockid_t clock, struct __kernel_timespec *ts)
+{
+	register long num __asm__("g1") = __NR_clock_gettime64;
+	register long o0 __asm__("o0") = clock;
+	register long o1 __asm__("o1") = (long) ts;
+
+	__asm__ __volatile__(SYSCALL_STRING : "=r" (o0) : "r" (num),
+			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
+	return o0;
+}
+
 static __always_inline
 long clock_gettime32_fallback(clockid_t clock, struct old_timespec32 *ts)
 {
@@ -125,7 +140,8 @@ long clock_gettime32_fallback(clockid_t clock, struct old_timespec32 *ts)
 			     "0" (o0), "r" (o1) : SYSCALL_CLOBBERS);
 	return o0;
 }
-#endif
+
+#endif /* CONFIG_SPARC64 */
 
 static __always_inline
 long gettimeofday_fallback(struct __kernel_old_timeval *tv, struct timezone *tz)
diff --git a/arch/sparc/vdso/vclock_gettime.c b/arch/sparc/vdso/vclock_gettime.c
index 093a7ff4dafce1cf0af5af4c303bef86e159858a..1d9859392e4cfd285349cf9155ca1fc25d3a7b41 100644
--- a/arch/sparc/vdso/vclock_gettime.c
+++ b/arch/sparc/vdso/vclock_gettime.c
@@ -48,4 +48,12 @@ int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
 int clock_gettime(clockid_t, struct old_timespec32 *)
 	__weak __alias(__vdso_clock_gettime);
 
+int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts)
+{
+	return __cvdso_clock_gettime(clock, ts);
+}
+
+int clock_gettime64(clockid_t, struct __kernel_timespec *)
+	__weak __alias(__vdso_clock_gettime64);
+
 #endif
diff --git a/arch/sparc/vdso/vdso32/vdso32.lds.S b/arch/sparc/vdso/vdso32/vdso32.lds.S
index 53575ee154c492f9503efdd8f995ac2a035203c7..a14e4f77e6f2222b855df27cc7a0d0a4f98bd4ac 100644
--- a/arch/sparc/vdso/vdso32/vdso32.lds.S
+++ b/arch/sparc/vdso/vdso32/vdso32.lds.S
@@ -17,6 +17,8 @@ VERSION {
 	global:
 		clock_gettime;
 		__vdso_clock_gettime;
+		clock_gettime64;
+		__vdso_clock_gettime64;
 		gettimeofday;
 		__vdso_gettimeofday;
 	local: *;

-- 
2.51.0


