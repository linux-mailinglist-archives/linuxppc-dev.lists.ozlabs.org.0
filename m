Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C87EB581
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 18:26:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O9KE+NSo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVCsF2M8qz3ckk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 04:26:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O9KE+NSo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVCmP6yQCz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 04:22:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A5340B8163D;
	Tue, 14 Nov 2023 17:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 968D8C433CD;
	Tue, 14 Nov 2023 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699982561;
	bh=rOukakbzH8ZuhVCvMX2b1dE7Wb0D6lFIhYzlEAboMTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O9KE+NSoY7fzH26duo+NdY/vjWyz3cjISAO8shSISw9shkDzJnlEXH2sDGy9/wgUE
	 WlggfoSws27haBKKn53N3BurjGb+7h6lMEisXOam4WHnlfLE1JU0ddvo7qlWvSbcoN
	 rip21DIy36rHjFHPISWy5wr6/0s/qg9fbgXK8eKMvj3GHzWqOzzvTLfBg0OkRqgIOr
	 kJmAQyfp/2Zz9CQo7XPD8vPHfYjyjCc/AEW14bfU36lJLQuOfoh4Puui6r3wrEhZNB
	 B+IwSdznCDLu9IO0HTTMLFLW4SaSotDhqr+ZDtbZVy4ATD3rYwlSTPCLighm0YCmBT
	 lHDDhhh7jsqag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84399C4332F;
	Tue, 14 Nov 2023 17:22:41 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 14 Nov 2023 11:22:29 -0600
Subject: [PATCH v2 5/5] powerpc/rtas: Remove 'extern' from function
 declarations in rtas.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-rtas-trivial-v2-5-59cbab208d57@linux.ibm.com>
References: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
In-Reply-To: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699982560; l=5303;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=W1pmrckgvXaV7scDxfyovJBdFxs1rv/eCucEhYnbW/k=;
 b=x0jVKkdmU5ycE0e5Xcu3974tfmfvZj7iPhoWE/oi57pUUhhdB4+NBRcOq6dqT1GlIUNrdL19d
 bb3ZK0yTHZsDLoUFp5EVn0XHMjDrRZKEK4AcRXuPRvHWg6lkngyDdZe
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

This header occasionally gains new function declarations without the
leading extern in accordance with current style rules. Leaving the
legacy externs in place is making the header more difficult to read
over time because of the inconsistency. Remove them, fixing up
checkpatch issues with unnamed parameters (rtas_call) and bracket
alignment (early_init_dt_scan_rtas) that get raised as a result of
touching the code.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h | 53 ++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 1bed6be8ada3..a7110ed52e25 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -408,42 +408,41 @@ static inline bool rtas_function_implemented(const rtas_fn_handle_t handle)
 {
 	return rtas_function_token(handle) != RTAS_UNKNOWN_SERVICE;
 }
-extern int rtas_token(const char *service);
-extern int rtas_call(int token, int, int, int *, ...);
+int rtas_token(const char *service);
+int rtas_call(int token, int nargs, int nret, int *outputs, ...);
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
-		const char *uname, int depth, void *data);
+int early_init_dt_scan_rtas(unsigned long node, const char *uname, int depth, void *data);
 
-extern void pSeries_log_error(char *buf, unsigned int err_type, int fatal);
+void pSeries_log_error(char *buf, unsigned int err_type, int fatal);
 
 #ifdef CONFIG_PPC_PSERIES
 extern time64_t last_rtas_event;
-extern int clobbering_unread_rtas_event(void);
+int clobbering_unread_rtas_event(void);
 int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
 #else
 static inline int clobbering_unread_rtas_event(void) { return 0; }
@@ -454,7 +453,7 @@ static inline int rtas_syscall_dispatch_ibm_suspend_me(u64 handle)
 #endif
 
 #ifdef CONFIG_PPC_RTAS_DAEMON
-extern void rtas_cancel_event_scan(void);
+void rtas_cancel_event_scan(void);
 #else
 static inline void rtas_cancel_event_scan(void) { }
 #endif
@@ -479,7 +478,7 @@ static inline void rtas_cancel_event_scan(void) { }
  *  for all rtas calls that require an error buffer argument.
  *  This includes 'check-exception' and 'rtas-last-error'.
  */
-extern int rtas_get_error_log_max(void);
+int rtas_get_error_log_max(void);
 
 /* Event Scan Parameters */
 #define EVENT_SCAN_ALL_EVENTS	0xf0000000
@@ -518,8 +517,8 @@ static inline u32 rtas_config_addr(int busno, int devfn, int reg)
 			(devfn << 8) | (reg & 0xff);
 }
 
-extern void rtas_give_timebase(void);
-extern void rtas_take_timebase(void);
+void rtas_give_timebase(void);
+void rtas_take_timebase(void);
 
 #ifdef CONFIG_PPC_RTAS
 static inline int page_is_rtas_user_buf(unsigned long pfn)
@@ -532,7 +531,7 @@ static inline int page_is_rtas_user_buf(unsigned long pfn)
 
 /* Not the best place to put pSeries_coalesce_init, will be fixed when we
  * move some of the rtas suspend-me stuff to pseries */
-extern void pSeries_coalesce_init(void);
+void pSeries_coalesce_init(void);
 void rtas_initialize(void);
 #else
 static inline int page_is_rtas_user_buf(unsigned long pfn) { return 0;}

-- 
2.41.0

