Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F22153E5CD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 18:58:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH0700kHDz3bkw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 02:58:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YONWZn/E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab; helo=madras.collabora.co.uk; envelope-from=dmitry.osipenko@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YONWZn/E;
	dkim-atps=neutral
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH06P0rrsz2yRK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 02:57:46 +1000 (AEST)
Received: from dimapc.. (109-252-138-163.dynamic.spd-mgts.ru [109.252.138.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 60BFF6601C72;
	Mon,  6 Jun 2022 17:57:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654534658;
	bh=FIM8GIMepvfnT4TQY6iQ3wpMknXZhv7KK8TRc4lbx5s=;
	h=From:To:Cc:Subject:Date:From;
	b=YONWZn/EaULMwx0P2lLlZ6TNlQne7C9taGsOhCqpOvnf/WD5a+7HtSra1qVT8PzO5
	 ojtHkBlPKFJ7IswrQoiHmRsp4hGCVBCGLefXiJ5hX46H848bwPCdDFxkw0hC0II95d
	 mFLlTR17jOKfrUYCPn0q905VuZ2WfEErlUGYqbDAGHPpMXexGYXEFjCR3rGDff7bW5
	 Mmko2QII3kn72nAvQLANVJimNKekHDYoDJUT7AJ+VKfHd/SOAvwHqAC53na/UYrxqg
	 SuRCTnfA0MEreVTueWYbJZaA6NpF6flNj1j+5Tyd5gEfPQc9Kgit/hIBKsUcDJ3S8/
	 BALJPxR8zhZPw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1] kernel/reboot: Fix powering off using a non-syscall code paths
Date: Mon,  6 Jun 2022 19:56:40 +0300
Message-Id: <20220606165640.634811-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are other methods of powering off machine than the reboot syscall.
Previously we missed to coved those methods and it created power-off
regression for some machines, like the PowerPC e500. Fix this problem
by moving the legacy sys-off handler registration to the latest phase
of power-off process and making the kernel_can_power_off() to check the
legacy pm_power_off presence.

Tested-by: Michael Ellerman <mpe@ellerman.id.au> # ppce500
Reported-by: Michael Ellerman <mpe@ellerman.id.au> # ppce500
Fixes: da007f171fc9 ("kernel/reboot: Change registration order of legacy power-off handler")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 kernel/reboot.c | 46 ++++++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 3b19b123efec..b5a71d1ff603 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -320,6 +320,7 @@ static struct sys_off_handler platform_sys_off_handler;
 static struct sys_off_handler *alloc_sys_off_handler(int priority)
 {
 	struct sys_off_handler *handler;
+	gfp_t flags;
 
 	/*
 	 * Platforms like m68k can't allocate sys_off handler dynamically
@@ -330,7 +331,12 @@ static struct sys_off_handler *alloc_sys_off_handler(int priority)
 		if (handler->cb_data)
 			return ERR_PTR(-EBUSY);
 	} else {
-		handler = kzalloc(sizeof(*handler), GFP_KERNEL);
+		if (system_state > SYSTEM_RUNNING)
+			flags = GFP_ATOMIC;
+		else
+			flags = GFP_KERNEL;
+
+		handler = kzalloc(sizeof(*handler), flags);
 		if (!handler)
 			return ERR_PTR(-ENOMEM);
 	}
@@ -440,7 +446,7 @@ void unregister_sys_off_handler(struct sys_off_handler *handler)
 {
 	int err;
 
-	if (!handler)
+	if (IS_ERR_OR_NULL(handler))
 		return;
 
 	if (handler->blocking)
@@ -615,7 +621,23 @@ static void do_kernel_power_off_prepare(void)
  */
 void do_kernel_power_off(void)
 {
+	struct sys_off_handler *sys_off = NULL;
+
+	/*
+	 * Register sys-off handlers for legacy PM callback. This allows
+	 * legacy PM callbacks temporary co-exist with the new sys-off API.
+	 *
+	 * TODO: Remove legacy handlers once all legacy PM users will be
+	 *       switched to the sys-off based APIs.
+	 */
+	if (pm_power_off)
+		sys_off = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+						   SYS_OFF_PRIO_DEFAULT,
+						   legacy_pm_power_off, NULL);
+
 	atomic_notifier_call_chain(&power_off_handler_list, 0, NULL);
+
+	unregister_sys_off_handler(sys_off);
 }
 
 /**
@@ -626,7 +648,8 @@ void do_kernel_power_off(void)
  */
 bool kernel_can_power_off(void)
 {
-	return !atomic_notifier_call_chain_is_empty(&power_off_handler_list);
+	return !atomic_notifier_call_chain_is_empty(&power_off_handler_list) ||
+		pm_power_off;
 }
 EXPORT_SYMBOL_GPL(kernel_can_power_off);
 
@@ -661,7 +684,6 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 		void __user *, arg)
 {
 	struct pid_namespace *pid_ns = task_active_pid_ns(current);
-	struct sys_off_handler *sys_off = NULL;
 	char buffer[256];
 	int ret = 0;
 
@@ -686,21 +708,6 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 	if (ret)
 		return ret;
 
-	/*
-	 * Register sys-off handlers for legacy PM callback. This allows
-	 * legacy PM callbacks temporary co-exist with the new sys-off API.
-	 *
-	 * TODO: Remove legacy handlers once all legacy PM users will be
-	 *       switched to the sys-off based APIs.
-	 */
-	if (pm_power_off) {
-		sys_off = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
-						   SYS_OFF_PRIO_DEFAULT,
-						   legacy_pm_power_off, NULL);
-		if (IS_ERR(sys_off))
-			return PTR_ERR(sys_off);
-	}
-
 	/* Instead of trying to make the power_off code look like
 	 * halt when pm_power_off is not set do it the easy way.
 	 */
@@ -758,7 +765,6 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 		break;
 	}
 	mutex_unlock(&system_transition_mutex);
-	unregister_sys_off_handler(sys_off);
 	return ret;
 }
 
-- 
2.35.3

