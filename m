Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCA47EFDD6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 06:17:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XE+3pTnB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXMV20dQMz3dDt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 16:17:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XE+3pTnB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXMQR15CHz3cP5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 16:14:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4BA96B80B69;
	Sat, 18 Nov 2023 05:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AEB5C433C7;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700284470;
	bh=Ycw8IQdyc5vzsnwTYCfqIVSppdBDvxZJFwlkdpBfM40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XE+3pTnB5HX5uuoPY9rUT15ibMx0Pj/iCzmxdrLVPSlQUojn5EVtk79HkcP6ONHMU
	 32KpibE5cU+tkC3c8PTcPrP1zgklR4jsEhnXdssOYZoGu+2/x57fxeRYtlZJQwTlzk
	 FGnn23h8F3TkU4XMrhUB5pJrfBC6bL6hssNniui14caHDH+5jBGrcW0YHp/uMFg1aZ
	 O9wzt0PFEiMtS+izmIsRE9Zu3bY5CdQeJkGC2mV7GY96qnlUguSWVk1n5VbOthNdyd
	 A4SS4qlnkr2evyIFSqla3w09pI4+kRKnIbWWpHJ9PCcLzydNHh5TbfV4FtWLAyZdPe
	 v9YtPITwnulLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BC6C54E76;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 17 Nov 2023 23:14:23 -0600
Subject: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id:  <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
References:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
In-Reply-To:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700284468; l=11630;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=5zJx0uxYOr94bhqnXzAuT/0uMw0qlg86YWLZmkL1sVE=;
 b=DiJ2YRZRhMA+2UHbi0xI7BEyJ2wWdhgXzYDFve63UmSjit9Qf86soW0z6BqrQul7DmaU2VaV5
 GMZJYY2YQEIAm9/CcK/JtEGZrgAVCZcsXy/e2oPOWH5zc+w5yL+YQKt
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

On RTAS platforms there is a general restriction that the OS must not
enter RTAS on more than one CPU at a time. This low-level
serialization requirement is satisfied by holding a spin
lock (rtas_lock) across most RTAS function invocations.

However, some pseries RTAS functions require multiple successive calls
to complete a logical operation. Beginning a new call sequence for such a
function may disrupt any other sequences of that function already in
progress. Safe and reliable use of these functions effectively
requires higher-level serialization beyond what is already done at the
level of RTAS entry and exit.

Where a sequence-based RTAS function is invoked only through
sys_rtas(), with no in-kernel users, there is no issue as far as the
kernel is concerned. User space is responsible for appropriately
serializing its call sequences. (Whether user space code actually
takes measures to prevent sequence interleaving is another matter.)
Examples of such functions currently include ibm,platform-dump and
ibm,get-vpd.

But where a sequence-based RTAS function has both user space and
in-kernel uesrs, there is a hazard. Even if the in-kernel call sites
of such a function serialize their sequences correctly, a user of
sys_rtas() can invoke the same function at any time, potentially
disrupting a sequence in progress.

So in order to prevent disruption of kernel-based RTAS call sequences,
they must serialize not only with themselves but also with sys_rtas()
users, somehow. Preferably without adding global locks or adding more
function-specific hacks to sys_rtas(). This is a prerequisite for
adding an in-kernel call sequence of ibm,get-vpd, which is in a change
to follow.

Note that it has never been feasible for the kernel to prevent
sys_rtas()-based sequences from being disrupted because control
returns to user space on every call. sys_rtas()-based users of these
functions have always been, and continue to be, responsible for
coordinating their call sequences with other users, even those which
may invoke the RTAS functions through less direct means than
sys_rtas(). This is an unavoidable consequence of exposing
sequence-based RTAS functions through sys_rtas().

* Add new rtas_function_lock() and rtas_function_unlock() APIs for use
  with sequence-based RTAS functions.

* Add an optional per-function mutex to struct rtas_function. When this
  member is set, kernel-internal callers of the RTAS function are
  required to guard their call sequences with rtas_function_lock() and
  rtas_function_unlock(). This requirement will be enforced in a later
  change, after all affected call sites are updated.

* Populate the lock members of function table entries where
  serialization of call sequences is known to be necessary, along with
  justifying commentary.

* In sys_rtas(), acquire the per-function mutex when it is present.

There should be no perceivable change introduced here except that
concurrent callers of the same RTAS function via sys_rtas() may block
on a mutex instead of spinning on rtas_lock. Changes to follow will
add rtas_function_lock()/unlock() pairs to kernel-based call
sequences.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |   2 +
 arch/powerpc/kernel/rtas.c      | 101 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 101 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index b73010583a8d..9a20caba6858 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -421,6 +421,8 @@ static inline bool rtas_function_implemented(const rtas_fn_handle_t handle)
 {
 	return rtas_function_token(handle) != RTAS_UNKNOWN_SERVICE;
 }
+void rtas_function_lock(rtas_fn_handle_t handle);
+void rtas_function_unlock(rtas_fn_handle_t handle);
 extern int rtas_token(const char *service);
 extern int rtas_service_present(const char *service);
 extern int rtas_call(int token, int, int, int *, ...);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 1fc0b3fffdd1..52f2242d0c28 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -18,6 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/lockdep.h>
 #include <linux/memblock.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/reboot.h>
@@ -70,14 +71,34 @@ struct rtas_filter {
  *                            ppc64le, and we want to keep it that way. It does
  *                            not make sense for this to be set when @filter
  *                            is NULL.
+ * @lock: Pointer to an optional dedicated per-function mutex. This
+ *        should be set for functions that require multiple calls in
+ *        sequence to complete a single operation, and such sequences
+ *        will disrupt each other if allowed to interleave. Users of
+ *        this function are required to hold the associated lock for
+ *        the duration of the call sequence. Add an explanatory
+ *        comment to the function table entry if setting this member.
  */
 struct rtas_function {
 	s32 token;
 	const bool banned_for_syscall_on_le:1;
 	const char * const name;
 	const struct rtas_filter *filter;
+	struct mutex *lock;
 };
 
+/*
+ * Per-function locks. Access these through the
+ * rtas_function_lock/unlock APIs, not directly.
+ */
+static DEFINE_MUTEX(rtas_ibm_activate_firmware_lock);
+static DEFINE_MUTEX(rtas_ibm_get_dynamic_sensor_state_lock);
+static DEFINE_MUTEX(rtas_ibm_get_indices_lock);
+static DEFINE_MUTEX(rtas_ibm_get_vpd_lock);
+static DEFINE_MUTEX(rtas_ibm_lpar_perftools_lock);
+static DEFINE_MUTEX(rtas_ibm_physical_attestation_lock);
+static DEFINE_MUTEX(rtas_ibm_set_dynamic_indicator_lock);
+
 static struct rtas_function rtas_function_table[] __ro_after_init = {
 	[RTAS_FNIDX__CHECK_EXCEPTION] = {
 		.name = "check-exception",
@@ -125,6 +146,13 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 			.buf_idx1 = -1, .size_idx1 = -1,
 			.buf_idx2 = -1, .size_idx2 = -1,
 		},
+		/*
+		 * PAPR doesn't explicitly impose any restriction, but
+		 * this typically requires multiple calls before
+		 * success, and there's no reason to allow sequences
+		 * to interleave.
+		 */
+		.lock = &rtas_ibm_activate_firmware_lock,
 	},
 	[RTAS_FNIDX__IBM_CBE_START_PTCAL] = {
 		.name = "ibm,cbe-start-ptcal",
@@ -196,6 +224,12 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 			.buf_idx1 = 1, .size_idx1 = -1,
 			.buf_idx2 = -1, .size_idx2 = -1,
 		},
+		/*
+		 * PAPR+ R1–7.3.19–3 is explicit that the OS must not
+		 * call ibm,get-dynamic-sensor-state with different
+		 * inputs until a non-retry status has been returned.
+		 */
+		.lock = &rtas_ibm_get_dynamic_sensor_state_lock,
 	},
 	[RTAS_FNIDX__IBM_GET_INDICES] = {
 		.name = "ibm,get-indices",
@@ -203,6 +237,12 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 			.buf_idx1 = 2, .size_idx1 = 3,
 			.buf_idx2 = -1, .size_idx2 = -1,
 		},
+		/*
+		 * PAPR+ R1–7.3.17–2 says that the OS must not
+		 * interleave ibm,get-indices call sequences with
+		 * different inputs.
+		 */
+		.lock = &rtas_ibm_get_indices_lock,
 	},
 	[RTAS_FNIDX__IBM_GET_RIO_TOPOLOGY] = {
 		.name = "ibm,get-rio-topology",
@@ -220,6 +260,11 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 			.buf_idx1 = 0, .size_idx1 = -1,
 			.buf_idx2 = 1, .size_idx2 = 2,
 		},
+		/*
+		 * PAPR+ R1–7.3.20–4 indicates that sequences
+		 * should not be allowed to interleave.
+		 */
+		.lock = &rtas_ibm_get_vpd_lock,
 	},
 	[RTAS_FNIDX__IBM_GET_XIVE] = {
 		.name = "ibm,get-xive",
@@ -239,6 +284,11 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 			.buf_idx1 = 2, .size_idx1 = 3,
 			.buf_idx2 = -1, .size_idx2 = -1,
 		},
+		/*
+		 * PAPR+ R1–7.3.26–6 says the OS should allow only one
+		 * call sequence in progress at a time.
+		 */
+		.lock = &rtas_ibm_lpar_perftools_lock,
 	},
 	[RTAS_FNIDX__IBM_MANAGE_FLASH_IMAGE] = {
 		.name = "ibm,manage-flash-image",
@@ -277,6 +327,14 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 			.buf_idx1 = 0, .size_idx1 = 1,
 			.buf_idx2 = -1, .size_idx2 = -1,
 		},
+		/*
+		 * This follows a sequence-based pattern similar to
+		 * ibm,get-vpd et al. Since PAPR+ restricts
+		 * interleaving call sequences for other functions of
+		 * this style, assume the restriction applies here,
+		 * even though it's not explicit in the spec.
+		 */
+		.lock = &rtas_ibm_physical_attestation_lock,
 	},
 	[RTAS_FNIDX__IBM_PLATFORM_DUMP] = {
 		.name = "ibm,platform-dump",
@@ -284,6 +342,13 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 			.buf_idx1 = 4, .size_idx1 = 5,
 			.buf_idx2 = -1, .size_idx2 = -1,
 		},
+		/*
+		 * PAPR+ 7.3.3.4.1 indicates that concurrent sequences
+		 * of ibm,platform-dump are allowed if they are
+		 * operating on different dump tags. So leave
+		 * the lock pointer unset for now. This may need
+		 * reconsideration if kernel-internal users appear.
+		 */
 	},
 	[RTAS_FNIDX__IBM_POWER_OFF_UPS] = {
 		.name = "ibm,power-off-ups",
@@ -326,6 +391,12 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 			.buf_idx1 = 2, .size_idx1 = -1,
 			.buf_idx2 = -1, .size_idx2 = -1,
 		},
+		/*
+		 * PAPR+ R1–7.3.18–3 says the OS must not call this
+		 * function with different inputs until a non-retry
+		 * status has been returned.
+		 */
+		.lock = &rtas_ibm_set_dynamic_indicator_lock,
 	},
 	[RTAS_FNIDX__IBM_SET_EEH_OPTION] = {
 		.name = "ibm,set-eeh-option",
@@ -556,9 +627,9 @@ static int __init rtas_token_to_function_xarray_init(void)
 }
 arch_initcall(rtas_token_to_function_xarray_init);
 
-static const struct rtas_function *rtas_token_to_function(s32 token)
+static struct rtas_function *rtas_token_to_function(s32 token)
 {
-	const struct rtas_function *func;
+	struct rtas_function *func;
 
 	if (WARN_ONCE(token < 0, "invalid token %d", token))
 		return NULL;
@@ -581,6 +652,28 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
 	return NULL;
 }
 
+static void __rtas_function_lock(struct rtas_function *func)
+{
+	if (func && func->lock)
+		mutex_lock(func->lock);
+}
+
+static void __rtas_function_unlock(struct rtas_function *func)
+{
+	if (func && func->lock)
+		mutex_unlock(func->lock);
+}
+
+void rtas_function_lock(const rtas_fn_handle_t handle)
+{
+	__rtas_function_lock(rtas_function_lookup(handle));
+}
+
+void rtas_function_unlock(const rtas_fn_handle_t handle)
+{
+	__rtas_function_unlock(rtas_function_lookup(handle));
+}
+
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
@@ -1885,6 +1978,8 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 
 	buff_copy = get_errorlog_buffer();
 
+	__rtas_function_lock(rtas_token_to_function(token));
+
 	raw_spin_lock_irqsave(&rtas_lock, flags);
 	cookie = lockdep_pin_lock(&rtas_lock);
 
@@ -1900,6 +1995,8 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	lockdep_unpin_lock(&rtas_lock, cookie);
 	raw_spin_unlock_irqrestore(&rtas_lock, flags);
 
+	__rtas_function_unlock(rtas_token_to_function(token));
+
 	if (buff_copy) {
 		if (errbuf)
 			log_error(errbuf, ERR_TYPE_RTAS_LOG, 0);

-- 
2.41.0

