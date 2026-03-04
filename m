Return-Path: <linuxppc-dev+bounces-17677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEa7CErkp2mrlAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:50:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3235E1FBE83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:50:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQlDj5dBWz3cJy;
	Wed, 04 Mar 2026 18:49:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772610565;
	cv=none; b=jyRQEG5sET6wd+cY92bYGjuA0/ZVC4dGeOhajapsOffdd2TIH6eBLy7ImAbLu+cnj68gzAjIXLtAJhZ1FaW5jXrK+cYOwpqEbPpvQ74JZBfeRP3Zg9eUkdby1FQOz0ZUpieGOAAdV2H0mBPJmXMaJFhy1pjoM7JmcvoRNvqUy4D4eFsIqL7DMehvVPjL0q8pcQiN4ln+E72Zmr0ekxiQqVfIBiV6j4ga8BHEd4bPLIMRNRalDYDtwRvXiu7QfO2HTEzD2IellEc0g2ah1o1IbWfTtVYd5yD6PW3jBWuRyH/1GUI7U1csLinClw+ezlxSlx+nx5Chy9LltM4v8n0OpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772610565; c=relaxed/relaxed;
	bh=dOGRWkHDcYVtXCcTa6XxM4usZU9BvkbApITgqAaSzaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FyY724Gs4Gaz0C7a1/4cVHyV7VRwaSTb4LGG0s5x6vAxusjkikaPVHS2u4IuSQmtW8pW26+dXIXFoJeEpNJp0VzsgGwiTaWdSh9b5/PuWo+UaOzgDnKv9DH4D66o4jcIKyt3NylLU0tYRmn/2qTfhXoqQ/fh5QqANbyAHBSETS+fLlKqwfVWuIGo5sGFDdMGNyYnWgjhkxxGy+vjG9Hf4e0MEIDTIH6/UzoatrRXG6+/W/6kQ9zP3Ch9YXLY0oJ7w2KUXUYIkLlnTHg33+k2IdnxPEq+x3GRbzhI/Rlq+iCD5MXq6jm8koelgiwybffecBQ64kGwlbrC+Rnth757oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wiCyttYo; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FJeHc+1i; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wiCyttYo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FJeHc+1i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQlDg3Mplz3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 18:49:23 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOGRWkHDcYVtXCcTa6XxM4usZU9BvkbApITgqAaSzaE=;
	b=wiCyttYolNhFCk2j/A+nV0T5JmhEMPorFYrOffh+5h0uHM9QrddKGYEFEtVIPcvk0tBk/4
	vYgibRgonxuVyumO3l7IP8EYE0BpGmxaTvW2Q8RUeRNGwDE2GcujV55veY/39Ca7YTYihT
	0dj4rz1b1upBV9G47Q1R557EvIvSF7o95wvs4w0WRYIAHP+fGAYfFQYMstciTqwMOWf+Q7
	vzOVL3Zt6MujOovzWPOlkAcZWc6asXhxgcUDCBMp/6lVeG/dUUkghait2l/KfhnVc+3Kvc
	tQM5jYR+VOIy9GnJcB+cqLw1QMjSJ6MRMjpCy56NrzK9TSfdTb+omr9ypneqtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dOGRWkHDcYVtXCcTa6XxM4usZU9BvkbApITgqAaSzaE=;
	b=FJeHc+1ihNU3KzNjh/d89q7PboZula4KKrXnoF7QWCjc4/bcmhcDt7Cxp+a3oCw1ZZFe/1
	IFJD+g/GO+zH/1Cg==
Date: Wed, 04 Mar 2026 08:49:05 +0100
Subject: [PATCH v6 08/14] sparc64: vdso: Move syscall fallbacks into header
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
Message-Id: <20260304-vdso-sparc64-generic-2-v6-8-d8eb3b0e1410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=5732;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mF0xT1nMmq2VU96z4YeK9I0yROL7jorDu1erdPLy5+4=;
 b=WwGW2YokahSYTp0hAg9DTRGVqu55WUq498rMi5ZMXPY7nWBiI7VirvBPboEi/ZhBMnI6p8DY6
 DKDCRDtkuIbAdU7DGlkfqZb34wcdFILd2lTSZ7soPT05p/hzjEaag14
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 3235E1FBE83
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
	TAGGED_FROM(0.00)[bounces-17677-lists,linuxppc-dev=lfdr.de];
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
index 31f6505d3ab5..429dc080568f 100644
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
index 16ac80982a00..e768c0b84b34 100644
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
2.53.0


