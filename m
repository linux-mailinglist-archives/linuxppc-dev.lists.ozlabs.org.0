Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6722A12979C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 15:40:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hMSy5nB0zDqCc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 01:40:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="vogtJFcg"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hMGg73vXzDqKj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 01:31:07 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hMGV4xxlz9txhh;
 Mon, 23 Dec 2019 15:30:58 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=vogtJFcg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RmEcF54nG6aG; Mon, 23 Dec 2019 15:30:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hMGV2XJ3z9txhg;
 Mon, 23 Dec 2019 15:30:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577111458; bh=B8Yu9pIP98J6v2ZJy2Ayu+97WIEYkB26j/iWHxqbNSc=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=vogtJFcgdzO5SlcK8lUrocAWAD0fW79yjfeeJL3JhePqFA65XxnHiKjuN7b1f/sRP
 B2R+msNiaHffrQRkMd42gAPAQ750iuE3zzcD/BmKrHFX82vV+jtH6f9p3+RZsBG7uy
 tNI4wng0WUaJ8a1btnKEAq4NbmvbFRlPCxZnVUUA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 745088B7AB;
 Mon, 23 Dec 2019 15:31:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iO5cqfr7b5RU; Mon, 23 Dec 2019 15:31:03 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DAFA8B7A1;
 Mon, 23 Dec 2019 15:31:03 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 484EC637D4; Mon, 23 Dec 2019 14:31:03 +0000 (UTC)
Message-Id: <de073962c1a5911343e13c183fbbdef0fe95449e.1577111365.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577111363.git.christophe.leroy@c-s.fr>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 02/10] lib: vdso: move call to fallback out of common
 code.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
 luto@kernel.org
Date: Mon, 23 Dec 2019 14:31:03 +0000 (UTC)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc, VDSO functions and syscalls cannot be implemented in C
because the Linux kernel ABI requires that CR[SO] bit is set in case
of error and cleared when no error.

As this cannot be done in C, C VDSO functions and syscall'based
fallback need a trampoline in ASM.

By moving the fallback calls out of the common code, arches like
powerpc can implement both the call to C VDSO and the fallback call
in a single trampoline function.

The two advantages are:
- No need play back and forth with CR[SO] and negative return value.
- No stack frame is required in VDSO C functions for the fallbacks.

The performance improvement is significant on powerpc.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/arm/vdso/vgettimeofday.c            | 28 +++++++++++++++---
 arch/arm64/kernel/vdso/vgettimeofday.c   | 21 ++++++++++++--
 arch/arm64/kernel/vdso32/vgettimeofday.c | 35 ++++++++++++++++++++---
 arch/mips/vdso/vgettimeofday.c           | 49 +++++++++++++++++++++++++++-----
 arch/x86/entry/vdso/vclock_gettime.c     | 42 +++++++++++++++++++++++----
 lib/vdso/gettimeofday.c                  | 31 ++++----------------
 6 files changed, 156 insertions(+), 50 deletions(-)

diff --git a/arch/arm/vdso/vgettimeofday.c b/arch/arm/vdso/vgettimeofday.c
index 1976c6f325a4..5451afb715e6 100644
--- a/arch/arm/vdso/vgettimeofday.c
+++ b/arch/arm/vdso/vgettimeofday.c
@@ -10,25 +10,45 @@
 int __vdso_clock_gettime(clockid_t clock,
 			 struct old_timespec32 *ts)
 {
-	return __cvdso_clock_gettime32(clock, ts);
+	int ret = __cvdso_clock_gettime32(clock, ts);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_gettime32_fallback(clock, &ts);
 }
 
 int __vdso_clock_gettime64(clockid_t clock,
 			   struct __kernel_timespec *ts)
 {
-	return __cvdso_clock_gettime(clock, ts);
+	int ret = __cvdso_clock_gettime(clock, ts);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_gettime_fallback(clock, ts);
 }
 
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
-	return __cvdso_gettimeofday(tv, tz);
+	int ret = __cvdso_gettimeofday(tv, tz);
+
+	if (likely(!ret))
+		return ret;
+
+	return gettimeofday_fallback(tv, tz);
 }
 
 int __vdso_clock_getres(clockid_t clock_id,
 			struct old_timespec32 *res)
 {
-	return __cvdso_clock_getres_time32(clock_id, res);
+	int ret = __cvdso_clock_getres_time32(clock_id, res);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_getres32_fallback(clock, res);
 }
 
 /* Avoid unresolved references emitted by GCC */
diff --git a/arch/arm64/kernel/vdso/vgettimeofday.c b/arch/arm64/kernel/vdso/vgettimeofday.c
index 747635501a14..62694876b216 100644
--- a/arch/arm64/kernel/vdso/vgettimeofday.c
+++ b/arch/arm64/kernel/vdso/vgettimeofday.c
@@ -11,17 +11,32 @@
 int __kernel_clock_gettime(clockid_t clock,
 			   struct __kernel_timespec *ts)
 {
-	return __cvdso_clock_gettime(clock, ts);
+	int ret = __cvdso_clock_gettime(clock, ts);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_gettime_fallback(clock, ts);
 }
 
 int __kernel_gettimeofday(struct __kernel_old_timeval *tv,
 			  struct timezone *tz)
 {
-	return __cvdso_gettimeofday(tv, tz);
+	int ret = __cvdso_gettimeofday(tv, tz);
+
+	if (likely(!ret))
+		return ret;
+
+	return gettimeofday_fallback(tv, tz);
 }
 
 int __kernel_clock_getres(clockid_t clock_id,
 			  struct __kernel_timespec *res)
 {
-	return __cvdso_clock_getres(clock_id, res);
+	int ret =  __cvdso_clock_getres(clock_id, res);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_getres_fallback(clock, res);
 }
diff --git a/arch/arm64/kernel/vdso32/vgettimeofday.c b/arch/arm64/kernel/vdso32/vgettimeofday.c
index 54fc1c2ce93f..6770d2bedd1f 100644
--- a/arch/arm64/kernel/vdso32/vgettimeofday.c
+++ b/arch/arm64/kernel/vdso32/vgettimeofday.c
@@ -11,37 +11,64 @@
 int __vdso_clock_gettime(clockid_t clock,
 			 struct old_timespec32 *ts)
 {
+	int ret;
+
 	/* The checks below are required for ABI consistency with arm */
 	if ((u32)ts >= TASK_SIZE_32)
 		return -EFAULT;
 
-	return __cvdso_clock_gettime32(clock, ts);
+	ret = __cvdso_clock_gettime32(clock, ts);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_gettime32_fallback(clock, &ts);
 }
 
 int __vdso_clock_gettime64(clockid_t clock,
 			   struct __kernel_timespec *ts)
 {
+	int ret;
+
 	/* The checks below are required for ABI consistency with arm */
 	if ((u32)ts >= TASK_SIZE_32)
 		return -EFAULT;
 
-	return __cvdso_clock_gettime(clock, ts);
+	ret = __cvdso_clock_gettime(clock, ts);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_gettime_fallback(clock, ts);
 }
 
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
-	return __cvdso_gettimeofday(tv, tz);
+	int ret = __cvdso_gettimeofday(tv, tz);
+
+	if (likely(!ret))
+		return ret;
+
+	return gettimeofday_fallback(tv, tz);
 }
 
 int __vdso_clock_getres(clockid_t clock_id,
 			struct old_timespec32 *res)
 {
+	int ret;
+	struct __kernel_timespec ts;
+
 	/* The checks below are required for ABI consistency with arm */
 	if ((u32)res >= TASK_SIZE_32)
 		return -EFAULT;
 
-	return __cvdso_clock_getres_time32(clock_id, res);
+	ret = __cvdso_clock_getres_time32(clock_id, res);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_getres32_fallback(clock, res);
 }
 
 /* Avoid unresolved references emitted by GCC */
diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
index 6ebdc37c89fc..02758c58454c 100644
--- a/arch/mips/vdso/vgettimeofday.c
+++ b/arch/mips/vdso/vgettimeofday.c
@@ -14,25 +14,45 @@
 int __vdso_clock_gettime(clockid_t clock,
 			 struct old_timespec32 *ts)
 {
-	return __cvdso_clock_gettime32(clock, ts);
+	int ret = __cvdso_clock_gettime32(clock, ts);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_gettime32_fallback(clock, ts);
 }
 
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
-	return __cvdso_gettimeofday(tv, tz);
+	int ret = __cvdso_gettimeofday(tv, tz);
+
+	if (likely(!ret))
+		return ret;
+
+	return gettimeofday_fallback(tv, tz);
 }
 
 int __vdso_clock_getres(clockid_t clock_id,
 			struct old_timespec32 *res)
 {
-	return __cvdso_clock_getres_time32(clock_id, res);
+	int ret = __cvdso_clock_getres_time32(clock_id, res);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_getres32_fallback(clock, res);
 }
 
 int __vdso_clock_gettime64(clockid_t clock,
 			   struct __kernel_timespec *ts)
 {
-	return __cvdso_clock_gettime(clock, ts);
+	int ret = __cvdso_clock_gettime(clock, ts);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_gettime_fallback(clock, ts);
 }
 
 #else
@@ -40,19 +60,34 @@ int __vdso_clock_gettime64(clockid_t clock,
 int __vdso_clock_gettime(clockid_t clock,
 			 struct __kernel_timespec *ts)
 {
-	return __cvdso_clock_gettime(clock, ts);
+	int ret = __cvdso_clock_gettime(clock, ts);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_gettime_fallback(clock, ts);
 }
 
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
 {
-	return __cvdso_gettimeofday(tv, tz);
+	int ret = __cvdso_gettimeofday(tv, tz);
+
+	if (likely(!ret))
+		return ret;
+
+	return gettimeofday_fallback(tv, tz);
 }
 
 int __vdso_clock_getres(clockid_t clock_id,
 			struct __kernel_timespec *res)
 {
-	return __cvdso_clock_getres(clock_id, res);
+	int ret =  __cvdso_clock_getres(clock_id, res);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_getres_fallback(clock, res);
 }
 
 #endif
diff --git a/arch/x86/entry/vdso/vclock_gettime.c b/arch/x86/entry/vdso/vclock_gettime.c
index 7d70935b6758..fde511cfe284 100644
--- a/arch/x86/entry/vdso/vclock_gettime.c
+++ b/arch/x86/entry/vdso/vclock_gettime.c
@@ -19,7 +19,12 @@ extern __kernel_old_time_t __vdso_time(__kernel_old_time_t *t);
 
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 {
-	return __cvdso_gettimeofday(tv, tz);
+	int ret = __cvdso_gettimeofday(tv, tz);
+
+	if (likely(!ret))
+		return ret;
+
+	return gettimeofday_fallback(tv, tz);
 }
 
 int gettimeofday(struct __kernel_old_timeval *, struct timezone *)
@@ -40,7 +45,12 @@ extern int __vdso_clock_getres(clockid_t clock, struct __kernel_timespec *res);
 
 int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
 {
-	return __cvdso_clock_gettime(clock, ts);
+	int ret = __cvdso_clock_gettime(clock, ts);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_gettime_fallback(clock, ts);
 }
 
 int clock_gettime(clockid_t, struct __kernel_timespec *)
@@ -49,7 +59,12 @@ int clock_gettime(clockid_t, struct __kernel_timespec *)
 int __vdso_clock_getres(clockid_t clock,
 			struct __kernel_timespec *res)
 {
-	return __cvdso_clock_getres(clock, res);
+	int ret =  __cvdso_clock_getres(clock_id, res);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_getres_fallback(clock, res);
 }
 int clock_getres(clockid_t, struct __kernel_timespec *)
 	__attribute__((weak, alias("__vdso_clock_getres")));
@@ -61,7 +76,12 @@ extern int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res);
 
 int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
 {
-	return __cvdso_clock_gettime32(clock, ts);
+	int ret = __cvdso_clock_gettime32(clock, ts);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_gettime32_fallback(clock, ts);
 }
 
 int clock_gettime(clockid_t, struct old_timespec32 *)
@@ -69,7 +89,12 @@ int clock_gettime(clockid_t, struct old_timespec32 *)
 
 int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts)
 {
-	return __cvdso_clock_gettime(clock, ts);
+	int ret = __cvdso_clock_gettime(clock, ts);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_gettime_fallback(clock, ts);
 }
 
 int clock_gettime64(clockid_t, struct __kernel_timespec *)
@@ -77,7 +102,12 @@ int clock_gettime64(clockid_t, struct __kernel_timespec *)
 
 int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res)
 {
-	return __cvdso_clock_getres_time32(clock, res);
+	int ret = __cvdso_clock_getres_time32(clock, res);
+
+	if (likely(!ret))
+		return ret;
+
+	return clock_getres32_fallback(clock, res);
 }
 
 int clock_getres(clockid_t, struct old_timespec32 *)
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 59189ed49352..4618e274f1d5 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -16,9 +16,6 @@
  * - __arch_get_vdso_data(): to get the vdso datapage.
  * - __arch_get_hw_counter(): to get the hw counter based on the
  *   clock_mode.
- * - gettimeofday_fallback(): fallback for gettimeofday.
- * - clock_gettime_fallback(): fallback for clock_gettime.
- * - clock_getres_fallback(): fallback for clock_getres.
  */
 #ifdef ENABLE_COMPAT_VDSO
 #include <asm/vdso/compat_gettimeofday.h>
@@ -110,23 +107,14 @@ __cvdso_clock_gettime_common(clockid_t clock, struct __kernel_timespec *ts)
 static __maybe_unused int
 __cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
 {
-	int ret = __cvdso_clock_gettime_common(clock, ts);
-
-	if (unlikely(ret))
-		return clock_gettime_fallback(clock, ts);
-	return 0;
+	return __cvdso_clock_gettime_common(clock, ts);
 }
 
 static __maybe_unused int
 __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
 {
 	struct __kernel_timespec ts;
-	int ret;
-
-	ret = __cvdso_clock_gettime_common(clock, &ts);
-
-	if (unlikely(ret))
-		return clock_gettime32_fallback(clock, res);
+	int ret = __cvdso_clock_gettime_common(clock, &ts);
 
 	if (likely(!ret)) {
 		res->tv_sec = ts.tv_sec;
@@ -144,7 +132,7 @@ __cvdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 		struct __kernel_timespec ts;
 
 		if (do_hres(&vd[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
-			return gettimeofday_fallback(tv, tz);
+			return -1;
 
 		tv->tv_sec = ts.tv_sec;
 		tv->tv_usec = (u32)ts.tv_nsec / NSEC_PER_USEC;
@@ -218,23 +206,14 @@ int __cvdso_clock_getres_common(clockid_t clock, struct __kernel_timespec *res)
 
 int __cvdso_clock_getres(clockid_t clock, struct __kernel_timespec *res)
 {
-	int ret = __cvdso_clock_getres_common(clock, res);
-
-	if (unlikely(ret))
-		return clock_getres_fallback(clock, res);
-	return 0;
+	return __cvdso_clock_getres_common(clock, res);
 }
 
 static __maybe_unused int
 __cvdso_clock_getres_time32(clockid_t clock, struct old_timespec32 *res)
 {
 	struct __kernel_timespec ts;
-	int ret;
-
-	ret = __cvdso_clock_getres_common(clock, &ts);
-
-	if (unlikely(ret))
-		return clock_getres32_fallback(clock, res);
+	int ret = __cvdso_clock_getres_common(clock, &ts);
 
 	if (likely(!ret && res)) {
 		res->tv_sec = ts.tv_sec;
-- 
2.13.3

