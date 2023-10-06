Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C78097BC0F4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 23:07:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K+hHR4em;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2LcC52tgz3vkn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 08:07:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K+hHR4em;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2LSX2dYmz30gH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 08:01:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2326AB82A6D;
	Fri,  6 Oct 2023 21:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AC47C433CA;
	Fri,  6 Oct 2023 21:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696626071;
	bh=rKBayCArcNg8lZTaG31OSaJdRRe2l56fXkDKNxC1Q/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K+hHR4emR30I5kyr1nGH7BUJPG8lOIppmYCZLjtvM3Y9DP81ucv4lhbMF22GXS6Zb
	 cS7hGbpWwvJeal2452DAq3h+o+GaC892L26We93SA7XCpPz+ezgcKtXSFintGGQi19
	 Sj0hD0O8bWh4JblFa8lXvvcQqROobhjJJg/q2+VZmoCwy/YtQ9BmjW9ymN2CQ/+VoH
	 cGnDlD2wZw6ysty7NdkbtsU+ozEjhVBGIguF4vgRF3N/kanXeeZi49D1nGD8UNM8a4
	 GgoNX/yKTxYYAFA55H6NzErivOeIyMbFg9yFxHT33OjwrnoprziMDitb939VLJf6G/
	 XTgDWsITR5jrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67402E94119;
	Fri,  6 Oct 2023 21:01:11 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 06 Oct 2023 16:01:06 -0500
Subject: [PATCH 3/7] powerpc/rtas: serialize ibm,get-vpd service with
 papr-vpd sequences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231006-papr-sys_rtas-vs-lockdown-v1-3-3a36bfb66e2e@linux.ibm.com>
References:  <20231006-papr-sys_rtas-vs-lockdown-v1-0-3a36bfb66e2e@linux.ibm.com>
In-Reply-To:  <20231006-papr-sys_rtas-vs-lockdown-v1-0-3a36bfb66e2e@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696626070; l=2480;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=TLQEPvXfc9R9GBYp7+/JmWBLObxsGORpqehfwb/txZ8=;
 b=UHaQGOqqHEUmH9IJF52wkgojMjEit0tdQ9iE5mO/lOPjb1DGUSFlv3zAvQp3dvCL3t3+UPsY1
 BiloGJ+MJfECcjL7ytTpDpunuuqe+zgDMhKktiqRcC1LPxbN/d13du3
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Take the papr-vpd driver's internal mutex when sys_rtas performs
ibm,get-vpd calls. This prevents sys_rtas(ibm,get-vpd) calls from
interleaving with sequences performed by the driver, ensuring that
such sequences are not disrupted.

However, it cannot prevent the driver from interleaving with sequences
that are initiated via sys_rtas, since control returns to user space
with each sys_rtas(ibm,get-vpd) call.

Emit a notice on first use of sys_rtas(ibm,get-vpd) encouraging users
to migrate to /dev/papr-vpd.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index eddc031c4b95..70ae118d2a13 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -37,6 +37,7 @@
 #include <asm/machdep.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
+#include <asm/papr-vpd.h>
 #include <asm/rtas-work-area.h>
 #include <asm/rtas.h>
 #include <asm/time.h>
@@ -1861,6 +1862,28 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 		goto copy_return;
 	}
 
+	if (token == rtas_function_token(RTAS_FN_IBM_GET_VPD)) {
+		/*
+		 * ibm,get-vpd potentially needs to be invoked
+		 * multiple times to obtain complete results.
+		 * Interleaved ibm,get-vpd sequences disrupt each
+		 * other.
+		 *
+		 * /dev/papr-vpd doesn't have this problem and users
+		 * do not need to be aware of each other to use it
+		 * safely.
+		 *
+		 * We can prevent this call from disrupting a
+		 * /dev/papr-vpd-initiated sequence in progress by
+		 * reaching into the driver to take its internal
+		 * lock. Unfortunately there is no way to prevent
+		 * interference in the other direction without
+		 * resorting to even worse hacks.
+		 */
+		pr_notice_once("Calling ibm,get-vpd via sys_rtas is allowed but deprecated. Use /dev/papr-vpd instead.\n");
+		papr_vpd_mutex_lock();
+	}
+
 	buff_copy = get_errorlog_buffer();
 
 	raw_spin_lock_irqsave(&rtas_lock, flags);
@@ -1870,6 +1893,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	do_enter_rtas(&rtas_args);
 	args = rtas_args;
 
+	if (token == rtas_function_token(RTAS_FN_IBM_GET_VPD))
+		papr_vpd_mutex_unlock();
+
 	/* A -1 return code indicates that the last command couldn't
 	   be completed due to a hardware error. */
 	if (be32_to_cpu(args.rets[0]) == -1)

-- 
2.41.0

