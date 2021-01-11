Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0E52F1B8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 17:54:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF0DN0hdwzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 03:54:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF0Bf5x4wzDqSQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 03:52:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DF0BS3lSXz9tySV;
 Mon, 11 Jan 2021 17:52:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dNkOVLFC7gay; Mon, 11 Jan 2021 17:52:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DF0BS2xVmz9tyST;
 Mon, 11 Jan 2021 17:52:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B78E8B79E;
 Mon, 11 Jan 2021 17:52:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JV9njlin5Dbq; Mon, 11 Jan 2021 17:52:53 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C0EA8B78E;
 Mon, 11 Jan 2021 17:52:53 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 98DA766970; Mon, 11 Jan 2021 16:52:52 +0000 (UTC)
Message-Id: <77cb8f5e668a2f6e00ea6e90d5f4f37763957b5b.1610383963.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] powerpc/vdso: fix clock_gettime_fallback for vdso32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 schwab@linux-m68k.org
Date: Mon, 11 Jan 2021 16:52:52 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andreas Schwab <schwab@linux-m68k.org>

The second argument of __kernel_clock_gettime64 points to a struct
__kernel_timespec, with 64-bit time_t, so use the clock_gettime64 syscall
in the fallback function for the 32-bit vdso.  Similarily,
clock_getres_fallback should use the clock_getres_time64 syscall, though
it isn't yet called from the 32-bit vdso.

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
[chleroy: Moved into the #ifdef CONFIG_VDSO32 block]
Fixes: d0e3fc69d00d ("powerpc/vdso: Provide __kernel_clock_gettime64() on vdso32")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 27 +++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index 7a215cc5da77..3ecddd9c6302 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -102,22 +102,22 @@ int gettimeofday_fallback(struct __kernel_old_timeval *_tv, struct timezone *_tz
 	return do_syscall_2(__NR_gettimeofday, (unsigned long)_tv, (unsigned long)_tz);
 }
 
+#ifdef CONFIG_VDSO32
+
+#define BUILD_VDSO32		1
+
 static __always_inline
 int clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 {
-	return do_syscall_2(__NR_clock_gettime, _clkid, (unsigned long)_ts);
+	return do_syscall_2(__NR_clock_gettime64, _clkid, (unsigned long)_ts);
 }
 
 static __always_inline
 int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 {
-	return do_syscall_2(__NR_clock_getres, _clkid, (unsigned long)_ts);
+	return do_syscall_2(__NR_clock_getres_time64, _clkid, (unsigned long)_ts);
 }
 
-#ifdef CONFIG_VDSO32
-
-#define BUILD_VDSO32		1
-
 static __always_inline
 int clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
 {
@@ -129,6 +129,21 @@ int clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
 {
 	return do_syscall_2(__NR_clock_getres, _clkid, (unsigned long)_ts);
 }
+
+#else
+
+static __always_inline
+int clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
+{
+	return do_syscall_2(__NR_clock_gettime, _clkid, (unsigned long)_ts);
+}
+
+static __always_inline
+int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
+{
+	return do_syscall_2(__NR_clock_getres, _clkid, (unsigned long)_ts);
+}
+
 #endif
 
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
-- 
2.25.0

