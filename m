Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD280F41A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 18:10:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oJI1KbRO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqQ9j0Tv8z3vdP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 04:10:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oJI1KbRO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqPzd1v2hz3bvX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 04:02:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DBB6618EA;
	Tue, 12 Dec 2023 17:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7629BC43397;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702400520;
	bh=TI/CARq7+us3OgoX1GKMH1qza6g+XMyPQjPHZYm2e2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oJI1KbROdGXBJoLa7iLscvy9NOV86B2uPCKOxyQtW1ZvfdnA6WA/AgIztwyjvid41
	 3lAZaYfSgOohofo2ZrSTG2vjo7ZSW4tGRo35hjC2WJk+8UjnnC9tFyDizuBa/N+f/C
	 3AaH7IgIta6q9PqHZ8N3hDUt1QahRV0B27jtBkqGs8rjYwn8AQ85VU5na4w/e0mQ5h
	 etRGZwgFEMP7XK7hztVmmDLWsosv+br4gry6zinFsXDPYeAxCWNeVaWfVlNZ+F9hUm
	 6tDs4B0VNnaMXQRvrzmgBOOdfGLcZjNtnwlzKGOQrMkCbRTBkT9CgTG+lPOUo3kqZl
	 E9/Q0G/bRYAJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657DDC4332F;
	Tue, 12 Dec 2023 17:02:00 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 12 Dec 2023 11:01:53 -0600
Subject: [PATCH v6 06/13] powerpc/rtas: Facilitate high-level call
 sequences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id:  <20231212-papr-sys_rtas-vs-lockdown-v6-6-e9eafd0c8c6c@linux.ibm.com>
References:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
In-Reply-To:  <20231212-papr-sys_rtas-vs-lockdown-v6-0-e9eafd0c8c6c@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702400518; l=10843;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=t9ThGGqhBwDjwYP1nJoz9AB2kSN/GhOrXb1u2hPJCU4=;
 b=6i+ZDa6r6lY6k9JBkLAb0lS3FgN276GQg3Skslk2qvCfLmvpX7mkJqxTXV+uisn3ajvRVhohO
 PJaCQr9W5CYBJAGfTIs0iOnYr6Pp60LOACUXoGB1bE1zMSIdkSOSxfu
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, "Aneesh Kumar K.V \(IBM\)" <aneesh.kumar@kernel.org>, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
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
users, somehow. Preferably without adding more function-specific hacks
to sys_rtas(). This is a prerequisite for adding an in-kernel call
sequence of ibm,get-vpd, which is in a change to follow.

Note that it has never been feasible for the kernel to prevent
sys_rtas()-based sequences from being disrupted because control
returns to user space on every call. sys_rtas()-based users of these
functions have always been, and continue to be, responsible for
coordinating their call sequences with other users, even those which
may invoke the RTAS functions through less direct means than
sys_rtas(). This is an unavoidable consequence of exposing
sequence-based RTAS functions through sys_rtas().

* Add an optional mutex member to struct rtas_function.

* Statically define a mutex for each RTAS function with known call
  sequence serialization requirements, and assign its address to the
  .lock member of the corresponding function table entry, along with
  justifying commentary.

* In sys_rtas(), if the table entry for the RTAS function being
  called has a populated lock member, acquire it before taking
  rtas_lock and entering RTAS.

* Kernel-based RTAS call sequences are expected to access the
  appropriate mutex explicitly by name. For example, a user of the
  ibm,activate-firmware RTAS function would do:

        int token = rtas_function_token(RTAS_FN_IBM_ACTIVATE_FIRMWARE);
        int fwrc;

        mutex_lock(&rtas_ibm_activate_firmware_lock);

        do {
                fwrc = rtas_call(token, 0, 1, NULL);
        } while (rtas_busy_delay(fwrc));

        mutex_unlock(&rtas_ibm_activate_firmware_lock);

There should be no perceivable change introduced here except that
concurrent callers of the same RTAS function via sys_rtas() may block
on a mutex instead of spinning on rtas_lock.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h |  3 ++
 arch/powerpc/kernel/rtas.c      | 83 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 08d19e6904f7..9bb2210c8d44 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -3,6 +3,7 @@
 #define _POWERPC_RTAS_H
 #ifdef __KERNEL__
 
+#include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <asm/page.h>
 #include <asm/rtas-types.h>
@@ -512,6 +513,8 @@ extern char rtas_data_buf[RTAS_DATA_BUF_SIZE];
 /* RMO buffer reserved for user-space RTAS use */
 extern unsigned long rtas_rmo_buf;
 
+extern struct mutex rtas_ibm_get_vpd_lock;
+
 #define GLOBAL_INTERRUPT_QUEUE 9005
 
 /**
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index ca5bb0b994ac..4d28983e8b1d 100644
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
@@ -70,14 +71,33 @@ struct rtas_filter {
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
+ * Per-function locks for sequence-based RTAS functions.
+ */
+static DEFINE_MUTEX(rtas_ibm_activate_firmware_lock);
+static DEFINE_MUTEX(rtas_ibm_get_dynamic_sensor_state_lock);
+static DEFINE_MUTEX(rtas_ibm_get_indices_lock);
+static DEFINE_MUTEX(rtas_ibm_lpar_perftools_lock);
+static DEFINE_MUTEX(rtas_ibm_physical_attestation_lock);
+static DEFINE_MUTEX(rtas_ibm_set_dynamic_indicator_lock);
+DEFINE_MUTEX(rtas_ibm_get_vpd_lock);
+
 static struct rtas_function rtas_function_table[] __ro_after_init = {
 	[RTAS_FNIDX__CHECK_EXCEPTION] = {
 		.name = "check-exception",
@@ -125,6 +145,13 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 			.buf_idx1 = -1, .size_idx1 = -1,
 			.buf_idx2 = -1, .size_idx2 = -1,
 		},
+		/*
+		 * PAPR+ as of v2.13 doesn't explicitly impose any
+		 * restriction, but this typically requires multiple
+		 * calls before success, and there's no reason to
+		 * allow sequences to interleave.
+		 */
+		.lock = &rtas_ibm_activate_firmware_lock,
 	},
 	[RTAS_FNIDX__IBM_CBE_START_PTCAL] = {
 		.name = "ibm,cbe-start-ptcal",
@@ -196,6 +223,13 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 			.buf_idx1 = 1, .size_idx1 = -1,
 			.buf_idx2 = -1, .size_idx2 = -1,
 		},
+		/*
+		 * PAPR+ v2.13 R1–7.3.19–3 is explicit that the OS
+		 * must not call ibm,get-dynamic-sensor-state with
+		 * different inputs until a non-retry status has been
+		 * returned.
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
+		 * PAPR+ v2.13 R1–7.3.17–2 says that the OS must not
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
+		 * PAPR+ v2.13 R1–7.3.20–4 indicates that sequences
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
+		 * PAPR+ v2.13 R1–7.3.26–6 says the OS should allow
+		 * only one call sequence in progress at a time.
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
+		 * PAPR+ v2.13 7.3.3.4.1 indicates that concurrent
+		 * sequences of ibm,platform-dump are allowed if they
+		 * are operating on different dump tags. So leave the
+		 * lock pointer unset for now. This may need
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
+		 * PAPR+ v2.13 R1–7.3.18–3 says the OS must not call
+		 * this function with different inputs until a
+		 * non-retry status has been returned.
+		 */
+		.lock = &rtas_ibm_set_dynamic_indicator_lock,
 	},
 	[RTAS_FNIDX__IBM_SET_EEH_OPTION] = {
 		.name = "ibm,set-eeh-option",
@@ -1888,6 +1959,15 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 
 	buff_copy = get_errorlog_buffer();
 
+	/*
+	 * If this function has a mutex assigned to it, we must
+	 * acquire it to avoid interleaving with any kernel-based uses
+	 * of the same function. Kernel-based sequences acquire the
+	 * appropriate mutex explicitly.
+	 */
+	if (func->lock)
+		mutex_lock(func->lock);
+
 	raw_spin_lock_irqsave(&rtas_lock, flags);
 	cookie = lockdep_pin_lock(&rtas_lock);
 
@@ -1903,6 +1983,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	lockdep_unpin_lock(&rtas_lock, cookie);
 	raw_spin_unlock_irqrestore(&rtas_lock, flags);
 
+	if (func->lock)
+		mutex_unlock(func->lock);
+
 	if (buff_copy) {
 		if (errbuf)
 			log_error(errbuf, ERR_TYPE_RTAS_LOG, 0);

-- 
2.41.0

