Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 928D27E25ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:45:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EBZ+1pjq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPCJy3JDRz3cCv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:45:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EBZ+1pjq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPCH92mfDz3bvB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:43:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 06C08CE0CFC;
	Mon,  6 Nov 2023 13:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 051AFC43391;
	Mon,  6 Nov 2023 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699278210;
	bh=X4uURiGlVqC1Y4tyXwkBDmQ7m7sN0GN7A4x3xoVnVNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EBZ+1pjqPtUYsdQq6CKPpYm1J7XPkEG0DeF2X1TEjs+GB+w0ozcnHBPmaJdElaUER
	 wyEL3PMg2tXRgGQBWzxx3X2f6pOzs9LxXrF0P+n+2a+aGy2wjre9B9mBTIPIk5B5CK
	 bnjUST2ZcaGA+vGG4/1ahAh20S8q9b1B8zVXQsXdwR5xDr3RPNQyAFUGcj5nXjXPdv
	 MGgviWO2FrH5VmG+rpVkzV92B1Y7BhP6g4lU9ksq80TYRvEs5xzjs1XQxKn1MICcOT
	 lDpdlUdjfebT36qTuzvCzh/PkfgVmA2ck9FoOLzYKnYKLi3jORDQRkt0GHfq3DR+8+
	 y7CyKygNjX07g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7221C4167D;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Nov 2023 07:42:59 -0600
Subject: [PATCH 7/7] powerpc/rtas: Remove 'extern' from function
 declarations in rtas.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-rtas-trivial-v1-7-61847655c51f@linux.ibm.com>
References: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
In-Reply-To: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699278208; l=5077;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=rcv1Hqd+co69W+eVAFgFZ0FbwMQnHfpsxvGHMqUUKM8=;
 b=3XjIQGNUOKZ3LWKpGXugSwfkx8LbnkeE+dLQkR2rfqcqV3XiPQ3CKWJMwpTi6Bq3YJIVAc8Fl
 mwC8aKwZnUAAVVKm0q+4oUmPrj6ZunhOR9QFTJupZbpZ+UNvW5dVHk5
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

This header occasionally gains new function declarations without the
leading extern in accordance with current style rules. Leaving the
legacy externs in place is making the header more difficult to read
over time because of the inconsistency. Remove them.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h | 52 ++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 1bed6be8ada3..6e32ad62e936 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -408,42 +408,42 @@ static inline bool rtas_function_implemented(const rtas_fn_handle_t handle)
 {
 	return rtas_function_token(handle) != RTAS_UNKNOWN_SERVICE;
 }
-extern int rtas_token(const char *service);
-extern int rtas_call(int token, int, int, int *, ...);
+int rtas_token(const char *service);
+int rtas_call(int token, int, int, int *, ...);
 void rtas_call_unlocked(struct rtas_args *args, int token, int nargs,
 			int nret, ...);
-extern void __noreturn rtas_restart(char *cmd);
-extern void rtas_power_off(void);
-extern void __noreturn rtas_halt(void);
-extern void rtas_os_term(char *str);
+void __noreturn rtas_restart(char *cmd);
+void rtas_power_off(void);
+void __noreturn rtas_halt(void);
+void rtas_os_term(char *str);
 void rtas_activate_firmware(void);
-extern int rtas_get_sensor(int sensor, int index, int *state);
-extern int rtas_get_sensor_fast(int sensor, int index, int *state);
-extern int rtas_get_power_level(int powerdomain, int *level);
-extern int rtas_set_power_level(int powerdomain, int level, int *setlevel);
-extern bool rtas_indicator_present(int token, int *maxindex);
-extern int rtas_set_indicator(int indicator, int index, int new_value);
-extern int rtas_set_indicator_fast(int indicator, int index, int new_value);
-extern void rtas_progress(char *s, unsigned short hex);
+int rtas_get_sensor(int sensor, int index, int *state);
+int rtas_get_sensor_fast(int sensor, int index, int *state);
+int rtas_get_power_level(int powerdomain, int *level);
+int rtas_set_power_level(int powerdomain, int level, int *setlevel);
+bool rtas_indicator_present(int token, int *maxindex);
+int rtas_set_indicator(int indicator, int index, int new_value);
+int rtas_set_indicator_fast(int indicator, int index, int new_value);
+void rtas_progress(char *s, unsigned short hex);
 int rtas_ibm_suspend_me(int *fw_status);
 int rtas_error_rc(int rtas_rc);
 
 struct rtc_time;
-extern time64_t rtas_get_boot_time(void);
-extern void rtas_get_rtc_time(struct rtc_time *rtc_time);
-extern int rtas_set_rtc_time(struct rtc_time *rtc_time);
+time64_t rtas_get_boot_time(void);
+void rtas_get_rtc_time(struct rtc_time *rtc_time);
+int rtas_set_rtc_time(struct rtc_time *rtc_time);
 
-extern unsigned int rtas_busy_delay_time(int status);
+unsigned int rtas_busy_delay_time(int status);
 bool rtas_busy_delay(int status);
 
-extern int early_init_dt_scan_rtas(unsigned long node,
+int early_init_dt_scan_rtas(unsigned long node,
 		const char *uname, int depth, void *data);
 
-extern void pSeries_log_error(char *buf, unsigned int err_type, int fatal);
+void pSeries_log_error(char *buf, unsigned int err_type, int fatal);
 
 #ifdef CONFIG_PPC_PSERIES
 extern time64_t last_rtas_event;
-extern int clobbering_unread_rtas_event(void);
+int clobbering_unread_rtas_event(void);
 int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
 #else
 static inline int clobbering_unread_rtas_event(void) { return 0; }
@@ -454,7 +454,7 @@ static inline int rtas_syscall_dispatch_ibm_suspend_me(u64 handle)
 #endif
 
 #ifdef CONFIG_PPC_RTAS_DAEMON
-extern void rtas_cancel_event_scan(void);
+void rtas_cancel_event_scan(void);
 #else
 static inline void rtas_cancel_event_scan(void) { }
 #endif
@@ -479,7 +479,7 @@ static inline void rtas_cancel_event_scan(void) { }
  *  for all rtas calls that require an error buffer argument.
  *  This includes 'check-exception' and 'rtas-last-error'.
  */
-extern int rtas_get_error_log_max(void);
+int rtas_get_error_log_max(void);
 
 /* Event Scan Parameters */
 #define EVENT_SCAN_ALL_EVENTS	0xf0000000
@@ -518,8 +518,8 @@ static inline u32 rtas_config_addr(int busno, int devfn, int reg)
 			(devfn << 8) | (reg & 0xff);
 }
 
-extern void rtas_give_timebase(void);
-extern void rtas_take_timebase(void);
+void rtas_give_timebase(void);
+void rtas_take_timebase(void);
 
 #ifdef CONFIG_PPC_RTAS
 static inline int page_is_rtas_user_buf(unsigned long pfn)
@@ -532,7 +532,7 @@ static inline int page_is_rtas_user_buf(unsigned long pfn)
 
 /* Not the best place to put pSeries_coalesce_init, will be fixed when we
  * move some of the rtas suspend-me stuff to pseries */
-extern void pSeries_coalesce_init(void);
+void pSeries_coalesce_init(void);
 void rtas_initialize(void);
 #else
 static inline int page_is_rtas_user_buf(unsigned long pfn) { return 0;}

-- 
2.41.0

