Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C9C5FEF5F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 15:57:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mpnxv692Hz3chT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 00:57:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rZa23zvH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rZa23zvH;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpnrJ3V42z3drM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 00:52:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DA108B82355;
	Fri, 14 Oct 2022 13:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCBCC433D7;
	Fri, 14 Oct 2022 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755532;
	bh=pBh+PKuK//OgSe36JRn1Cfl4rfyNKhi8umyVj3qBs/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rZa23zvH+fEdyLPU9uGUklfd8bdc0+vG7B/JA+vr/3K3aufTILoFIjkGGnGm76AyW
	 dahSs2CAWQKkXSUJN+pTYnuetRxTIv896Urq8kxgAflWl9KUkSOk7RIEuxkB2kqOb/
	 KOwqCUax0HyHwt4MptZD6grI8ciIhovPJNa/SJq8hhOhjc5yYfpCzoL6Rx7BLclv6G
	 EKt69sbjwBLRFqSMG5vfS04Ha8skRPU49nBng/wpUv7VjTSaPumObUd2MxIKoRMVBR
	 Y393rODzOXMlYuESplLs4p13a54uWq88sb437VueeYk8yol4co/8/VpVAPODGqlVBT
	 JoUUdOUzv3EMA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 09/11] powerpc/rtas: block error injection when locked down
Date: Fri, 14 Oct 2022 09:51:35 -0400
Message-Id: <20221014135139.2109024-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135139.2109024-1-sashal@kernel.org>
References: <20221014135139.2109024-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: mortonm@chromium.org, mcgrof@kernel.org, Sasha Levin <sashal@kernel.org>, lucien.xin@gmail.com, Paul Moore <paul@paul-moore.com>, jmorris@namei.org, serge@hallyn.com, Nathan Lynch <nathanl@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com, ldufour@linux.ibm.com, brauner@kernel.org, omosnace@redhat.com, sourabhjain@linux.ibm.com, linux-security-module@vger.kernel.org, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

[ Upstream commit b8f3e48834fe8c86b4f21739c6effd160e2c2c19 ]

The error injection facility on pseries VMs allows corruption of
arbitrary guest memory, potentially enabling a sufficiently privileged
user to disable lockdown or perform other modifications of the running
kernel via the rtas syscall.

Block the PAPR error injection facility from being opened or called
when locked down.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Acked-by: Paul Moore <paul@paul-moore.com> (LSM)
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220926131643.146502-3-nathanl@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/rtas.c | 25 ++++++++++++++++++++++++-
 include/linux/security.h   |  1 +
 security/security.c        |  1 +
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 693133972294..c2540d393f1c 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -23,6 +23,7 @@
 #include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/reboot.h>
+#include <linux/security.h>
 #include <linux/syscalls.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
@@ -464,6 +465,9 @@ void rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 	va_end(list);
 }
 
+static int ibm_open_errinjct_token;
+static int ibm_errinjct_token;
+
 int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 {
 	va_list list;
@@ -476,6 +480,16 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
 		return -1;
 
+	if (token == ibm_open_errinjct_token || token == ibm_errinjct_token) {
+		/*
+		 * It would be nicer to not discard the error value
+		 * from security_locked_down(), but callers expect an
+		 * RTAS status, not an errno.
+		 */
+		if (security_locked_down(LOCKDOWN_RTAS_ERROR_INJECTION))
+			return -1;
+	}
+
 	if ((mfmsr() & (MSR_IR|MSR_DR)) != (MSR_IR|MSR_DR)) {
 		WARN_ON_ONCE(1);
 		return -1;
@@ -1227,6 +1241,14 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	if (block_rtas_call(token, nargs, &args))
 		return -EINVAL;
 
+	if (token == ibm_open_errinjct_token || token == ibm_errinjct_token) {
+		int err;
+
+		err = security_locked_down(LOCKDOWN_RTAS_ERROR_INJECTION);
+		if (err)
+			return err;
+	}
+
 	/* Need to handle ibm,suspend_me call specially */
 	if (token == rtas_token("ibm,suspend-me")) {
 
@@ -1325,7 +1347,8 @@ void __init rtas_initialize(void)
 #ifdef CONFIG_RTAS_ERROR_LOGGING
 	rtas_last_error_token = rtas_token("rtas-last-error");
 #endif
-
+	ibm_open_errinjct_token = rtas_token("ibm,open-errinjct");
+	ibm_errinjct_token = rtas_token("ibm,errinjct");
 	rtas_syscall_filter_init();
 }
 
diff --git a/include/linux/security.h b/include/linux/security.h
index 7bd0c490703d..0ca55306f1eb 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -122,6 +122,7 @@ enum lockdown_reason {
 	LOCKDOWN_XMON_WR,
 	LOCKDOWN_BPF_WRITE_USER,
 	LOCKDOWN_DBG_WRITE_KERNEL,
+	LOCKDOWN_RTAS_ERROR_INJECTION,
 	LOCKDOWN_INTEGRITY_MAX,
 	LOCKDOWN_KCORE,
 	LOCKDOWN_KPROBES,
diff --git a/security/security.c b/security/security.c
index 4b95de24bc8d..11e2c8757275 100644
--- a/security/security.c
+++ b/security/security.c
@@ -60,6 +60,7 @@ const char *const lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1] = {
 	[LOCKDOWN_XMON_WR] = "xmon write access",
 	[LOCKDOWN_BPF_WRITE_USER] = "use of bpf to write user RAM",
 	[LOCKDOWN_DBG_WRITE_KERNEL] = "use of kgdb/kdb to write kernel RAM",
+	[LOCKDOWN_RTAS_ERROR_INJECTION] = "RTAS error injection",
 	[LOCKDOWN_INTEGRITY_MAX] = "integrity",
 	[LOCKDOWN_KCORE] = "/proc/kcore access",
 	[LOCKDOWN_KPROBES] = "use of kprobes",
-- 
2.35.1

