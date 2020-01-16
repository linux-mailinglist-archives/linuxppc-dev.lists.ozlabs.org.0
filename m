Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F117913FACB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 21:44:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zGQV1WNrzDqpf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 07:44:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=q8PPO1w+; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zBl04mZtzDqdl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:58:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47zBkt5hw8z9v4gT;
 Thu, 16 Jan 2020 18:58:30 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=q8PPO1w+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3vr6hJqYZ03C; Thu, 16 Jan 2020 18:58:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47zBkt4ZGwz9v3tS;
 Thu, 16 Jan 2020 18:58:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579197510; bh=90rYnxXVFFg2sXpFnbUxoLCrPtKnV80e/n61mFcxEBc=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=q8PPO1w+1lOZ9BFbvHd2xLc8pEsoo0PK8+cnSqrAMszVf5sVlLevxWnQBIm4PCeN0
 wtszmC7/INZ2hQvhA2/rGKslHRX/QFmC5x1VAt53ungT6uFVpqJD+3LVjbz6pmvNfV
 ybgqR0FaYNXWTem+g9hPbp2XaErP4bD1hkXg1kyM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 308758B82D;
 Thu, 16 Jan 2020 18:58:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kEt9T_zHLnzb; Thu, 16 Jan 2020 18:58:32 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B07E88B82A;
 Thu, 16 Jan 2020 18:58:31 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 894DC64A33; Thu, 16 Jan 2020 17:58:31 +0000 (UTC)
Message-Id: <027645df415c27a91921247df46976beed6f2133.1579196675.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1579196675.git.christophe.leroy@c-s.fr>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v4 07/11] powerpc/vdso: provide vdso data pointer from the
 ASM caller.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 nathanl@linux.ibm.com, arnd@arndb.de, tglx@linutronix.de,
 vincenzo.frascino@arm.com, luto@kernel.org
Date: Thu, 16 Jan 2020 17:58:31 +0000 (UTC)
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

__arch_get_vdso_data() clobbers the link register, requiring
the caller to save it.

As the ASM calling function already has to set a stack frame and
saves the link register before calling the C vdso function,
retriving the vdso data pointer there is lighter.

The improvement is significant:

Before:
gettimeofday:    vdso: 1212 nsec/call
clock-getres-realtime-coarse:    vdso: 714 nsec/call
clock-gettime-realtime-coarse:    vdso: 784 nsec/call
clock-getres-realtime:    vdso: 714 nsec/call

After:
gettimeofday:    vdso: 1094 nsec/call
getcpu:    vdso: not tested
clock-getres-realtime-coarse:    vdso: 545 nsec/call
clock-gettime-realtime-coarse:    vdso: 584 nsec/call
clock-getres-realtime:    vdso: 545 nsec/call

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 10 +---------
 arch/powerpc/kernel/vdso32/gettimeofday.S    |  3 +++
 arch/powerpc/kernel/vdso32/vgettimeofday.c   | 19 +++++++++++--------
 arch/powerpc/kernel/vdso64/gettimeofday.S    |  3 +++
 arch/powerpc/kernel/vdso64/vgettimeofday.c   | 19 +++++++++++--------
 5 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index c2cafd85d3cb..0a247f9b9af9 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -6,7 +6,6 @@
 
 #include <asm/time.h>
 #include <asm/unistd.h>
-#include <asm/vdso_datapage.h>
 #include <uapi/linux/time.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1
@@ -73,14 +72,7 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode)
 	return get_tb();
 }
 
-void *__get_datapage(void);
-
-static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
-{
-	struct vdso_arch_data *vdso_data = __get_datapage();
-
-	return vdso_data->data;
-}
+const struct vdso_data *__arch_get_vdso_data(void);
 
 /*
  * powerpc specific delta calculation.
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index ba0bd64b3da3..0d43878e462c 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -9,6 +9,7 @@
 #include <asm/processor.h>
 #include <asm/ppc_asm.h>
 #include <asm/vdso.h>
+#include <asm/vdso_datapage.h>
 #include <asm/asm-offsets.h>
 #include <asm/unistd.h>
 
@@ -18,6 +19,7 @@
 	stwu	r1, -16(r1)
 	mflr	r0
 	stw	r0, 20(r1)
+	get_datapage	r5, VDSO_DATA_OFFSET
 	bl	\funct
 	lwz	r0, 20(r1)
 	cmpwi	r3, 0
@@ -79,6 +81,7 @@ V_FUNCTION_BEGIN(__kernel_time)
 	stwu	r1, -16(r1)
 	mflr	r0
 	stw	r0, 20(r1)
+	get_datapage	r4, VDSO_DATA_OFFSET
 	bl	__c_kernel_time
 	lwz	r0, 20(r1)
 	crclr	cr0*4+so
diff --git a/arch/powerpc/kernel/vdso32/vgettimeofday.c b/arch/powerpc/kernel/vdso32/vgettimeofday.c
index 4ed1bf2ae30e..9bdc3c435846 100644
--- a/arch/powerpc/kernel/vdso32/vgettimeofday.c
+++ b/arch/powerpc/kernel/vdso32/vgettimeofday.c
@@ -5,22 +5,25 @@
 #include <linux/time.h>
 #include <linux/types.h>
 
-int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
+int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
+			     const struct vdso_data *vd)
 {
-	return __cvdso_clock_gettime32(clock, ts);
+	return __cvdso_clock_gettime32_data(vd, clock, ts);
 }
 
-int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
+int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
+			    const struct vdso_data *vd)
 {
-	return __cvdso_gettimeofday(tv, tz);
+	return __cvdso_gettimeofday_data(vd, tv, tz);
 }
 
-int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res)
+int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
+			    const struct vdso_data *vd)
 {
-	return __cvdso_clock_getres_time32(clock_id, res);
+	return __cvdso_clock_getres_time32_data(vd, clock_id, res);
 }
 
-time_t __c_kernel_time(time_t *time)
+time_t __c_kernel_time(time_t *time, const struct vdso_data *vd)
 {
-	return __cvdso_time(time);
+	return __cvdso_time_data(vd, time);
 }
diff --git a/arch/powerpc/kernel/vdso64/gettimeofday.S b/arch/powerpc/kernel/vdso64/gettimeofday.S
index 22f4f1f73bbc..f61c53eb6600 100644
--- a/arch/powerpc/kernel/vdso64/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso64/gettimeofday.S
@@ -9,6 +9,7 @@
 #include <asm/processor.h>
 #include <asm/ppc_asm.h>
 #include <asm/vdso.h>
+#include <asm/vdso_datapage.h>
 #include <asm/asm-offsets.h>
 #include <asm/unistd.h>
 
@@ -18,6 +19,7 @@
 	mflr	r0
 	std	r0, 16(r1)
 	stdu	r1, -128(r1)
+	get_datapage	r5, VDSO_DATA_OFFSET
 	bl	\funct
 	addi	r1, r1, 128
 	ld	r0, 16(r1)
@@ -79,6 +81,7 @@ V_FUNCTION_BEGIN(__kernel_time)
 	mflr	r0
 	std	r0, 16(r1)
 	stdu	r1, -128(r1)
+	get_datapage	r4, VDSO_DATA_OFFSET
 	bl	__c_kernel_time
 	addi	r1, r1, 128
 	ld	r0, 16(r1)
diff --git a/arch/powerpc/kernel/vdso64/vgettimeofday.c b/arch/powerpc/kernel/vdso64/vgettimeofday.c
index 407c6a7ed4e2..cd80867c501c 100644
--- a/arch/powerpc/kernel/vdso64/vgettimeofday.c
+++ b/arch/powerpc/kernel/vdso64/vgettimeofday.c
@@ -5,22 +5,25 @@
 #include <linux/time.h>
 #include <linux/types.h>
 
-int __c_kernel_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
+int __c_kernel_clock_gettime(clockid_t clock, struct __kernel_timespec *ts,
+			     const struct vdso_data *vd)
 {
-	return __cvdso_clock_gettime(clock, ts);
+	return __cvdso_clock_gettime_data(vd, clock, ts);
 }
 
-int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
+int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
+			    const struct vdso_data *vd)
 {
-	return __cvdso_gettimeofday(tv, tz);
+	return __cvdso_gettimeofday_data(vd, tv, tz);
 }
 
-int __c_kernel_clock_getres(clockid_t clock_id, struct __kernel_timespec *res)
+int __c_kernel_clock_getres(clockid_t clock_id, struct __kernel_timespec *res,
+			    const struct vdso_data *vd)
 {
-	return __cvdso_clock_getres(clock_id, res);
+	return __cvdso_clock_getres_data(vd, clock_id, res);
 }
 
-time_t __c_kernel_time(time_t *time)
+time_t __c_kernel_time(time_t *time, const struct vdso_data *vd)
 {
-	return __cvdso_time(time);
+	return __cvdso_time_data(vd, time);
 }
-- 
2.13.3

