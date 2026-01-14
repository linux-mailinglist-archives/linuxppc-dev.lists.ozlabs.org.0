Return-Path: <linuxppc-dev+bounces-15684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC2D1CD07
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 08:26:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drd2h3c6Hz2xpm;
	Wed, 14 Jan 2026 18:26:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768375580;
	cv=none; b=AONJJDw1RAsieBsc+Zst1Osatkhtg6INSRQ+a3Nnoz0n7Tk4/KwORd4Cn7TNEFkdM37GwA6MsDo4Omk2ElXqxaAXPDdxepMoKtVj0AQKNNpY9QwSxUNfsSt14209cxQFfcnKh84uSoH2zstRwaa1H87SV9XBzAYR6+uIjuUym3p6bjtou5BiW+i666H8r9QdK1x3lkyGF0PprcxkvhzkYwSbCj5nj+J7ZZzg7Rbccp40p0nYZhlE1ZZiZghwuqETz8no9ex8GP3DbK8CoLYat7Kgy4ecio9k3yOLRwdtsFNWsuJKjcJoQz+/wMSSR4x0rB2Do+zpx++Cf2pgBAzseg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768375580; c=relaxed/relaxed;
	bh=ZNfW6fCJn3/7zRW9ZKkcVeSEbV0IWfCasJe1y+WFrk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cad5CPAVXFomXKU35eU0ot/zkCrmMBBdlOWpPuG1lOmjUL+aJZPpAJxzXfKxejaMVf6TCZtyMXv108+YTAC7GcbKpw7oUzEWQ5ajKKg6cefaRJ1j2YgCU0gjtnnKNRrQ+uK+8h57r/65KQwr3a7Fldd7F53VTsjRn5ZHK1frRRVJ+NnOBUxZq3TbSrxfb+weDBiWPfl3mBSYS6T39JdAl/j/5S7oYfsaxQcCpQHwW8BE+gAOG68iUplvluhfcB6pAEvkFn8Qbz8uTDJxbOtLcSnByjqyj+5TX90LCU4f/8mIHtOl1Hl57VvLHq/9VsONnpTRbwmYPxnjAjUwPbbb7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YS+Yueel; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=m0r8Rn4S; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YS+Yueel;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=m0r8Rn4S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drd2g3SCSz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 18:26:19 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768375574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZNfW6fCJn3/7zRW9ZKkcVeSEbV0IWfCasJe1y+WFrk4=;
	b=YS+YueelaNxBRCDeORwRFVvGVVt39VrPHYZ6WgmNmBXzBZ6gwZ1e0Kex228U5cm5XhbQz/
	iq2BDg33eO19NKIf2q+s8ugbr46mYI0R6XpDJGJHjpc5F5NlT2uD9zOVqmnsGXFZIvimqo
	0oamTq8WYG0l5B17qv5bXO0qv9g3s+ilM0KTC6brWDOeK1GGWl/Zyc50dCtmLXy+U8tQEK
	SA0nyVz+DUouGTY4ZhFX5Ev2znN8NPHt9VXxARx1JTxN93ubdubONNRueJVZ1+0NlqKLla
	D2AyeV81VITMV1yhBULLfoh8ETmSEjgllbj9M+VNlke9vHSfbnOfrfnisZVdJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768375574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZNfW6fCJn3/7zRW9ZKkcVeSEbV0IWfCasJe1y+WFrk4=;
	b=m0r8Rn4Sf9U4xoSQDTooAH5siLDeNt9m4AAVqOY7DUDOJzSU22Iq6RRVMNJhKEKt4QeFRC
	9FBPjNjK8gVjb6Dw==
Date: Wed, 14 Jan 2026 08:26:05 +0100
Subject: [PATCH] powerpc/vdso: Provide clock_getres_time64()
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
Message-Id: <20260114-vdso-powerpc-align-v1-1-acf09373d568@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAxFZ2kC/x3MTQqAIBBA4avErBvwJ6S6SrSwnGogVBQqCO+et
 PwW772QKTFlGJsXEl2cOfgK2TawHtbvhOyqQQllhJQaL5cDxnBTiivak3eP1NOgjemcVQvUMCb
 a+Pmn01zKB5Pf9lZkAAAA
X-Change-ID: 20260113-vdso-powerpc-align-e8e93664da2b
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768375572; l=3584;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=O0kt2kF37a6pM7CkVXq0/fhz7df+ATaG10dREhHdPFU=;
 b=n8LaS2ivdOjDUFXegMaHsAePSXK4aiMyqfl6QHpKYUMvmFsZ7URYFZBsPtVtcFRfY7eIGZAH+
 yGpd0VcIrGCDcrNikPk8l7cmSxtd6avttr2twi3ynxGaHzPubF8fMlW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

For consistency with __vdso_clock_gettime64() there should also be a
64-bit variant of clock_getres(). This will allow the extension of
CONFIG_COMPAT_32BIT_TIME to the vDSO and finally the removal of 32-bit
time types from the kernel and UAPI.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Based on tip/timers/vdso.

This was missed in the original vdso_getres_time64() series as powerpc
does not use include/vdso/gettime.h.
---
 arch/powerpc/include/asm/vdso/gettimeofday.h |  2 ++
 arch/powerpc/kernel/vdso/gettimeofday.S      | 12 ++++++++++++
 arch/powerpc/kernel/vdso/vdso32.lds.S        |  1 +
 arch/powerpc/kernel/vdso/vgettimeofday.c     |  6 ++++++
 4 files changed, 21 insertions(+)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index ab3df12c8d94..8ea397e26ad0 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -135,6 +135,8 @@ int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
 			       const struct vdso_time_data *vd);
 int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
 			    const struct vdso_time_data *vd);
+int __c_kernel_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec *res,
+				   const struct vdso_time_data *vd);
 #endif
 int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
 			    const struct vdso_time_data *vd);
diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
index 79c967212444..1c8e51691bf8 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -103,6 +103,18 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
 	cvdso_call __c_kernel_clock_getres
 V_FUNCTION_END(__kernel_clock_getres)
 
+/*
+ * Exact prototype of clock_getres_time64()
+ *
+ * int __kernel_clock_getres(clockid_t clock_id, struct __timespec64 *res);
+ *
+ */
+#ifndef __powerpc64__
+V_FUNCTION_BEGIN(__kernel_clock_getres_time64)
+	cvdso_call __c_kernel_clock_getres_time64
+V_FUNCTION_END(__kernel_clock_getres_time64)
+#endif
+
 
 /*
  * Exact prototype of time()
diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index 72a1012b8a20..3f384a2526ae 100644
--- a/arch/powerpc/kernel/vdso/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
@@ -124,6 +124,7 @@ VERSION
 		__kernel_clock_gettime;
 		__kernel_clock_gettime64;
 		__kernel_clock_getres;
+		__kernel_clock_getres_time64;
 		__kernel_time;
 		__kernel_get_tbfreq;
 		__kernel_sync_dicache;
diff --git a/arch/powerpc/kernel/vdso/vgettimeofday.c b/arch/powerpc/kernel/vdso/vgettimeofday.c
index 6f5167d81af5..3c194e1ab562 100644
--- a/arch/powerpc/kernel/vdso/vgettimeofday.c
+++ b/arch/powerpc/kernel/vdso/vgettimeofday.c
@@ -35,6 +35,12 @@ int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
 {
 	return __cvdso_clock_getres_time32_data(vd, clock_id, res);
 }
+
+int __c_kernel_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec *res,
+				   const struct vdso_time_data *vd)
+{
+	return __cvdso_clock_getres_data(vd, clock_id, res);
+}
 #endif
 
 int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,

---
base-commit: 0e55e7636697077abceb2301d7d2718d75c34389
change-id: 20260113-vdso-powerpc-align-e8e93664da2b

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


