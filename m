Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1357E260E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:49:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=itAqlkW0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPCQW5vRPz3ckP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:49:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=itAqlkW0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPCHF0Zh0z3c6Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:43:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63E2C60E17;
	Mon,  6 Nov 2023 13:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7215C433CC;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699278209;
	bh=q7dGahbSw2aSGJr2512J7D29gSQwxcYyxusdtGkngpY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=itAqlkW0orDDy5jCBw7Caq5rkmvWy/7dFF1VB+NVIcbqiPeJ7aWk0OGf0MbZSsrA+
	 BRSNuftwRo9xNEOTVCfQdu8QOYguYLqt961PJdV1I0CYrO9FX7VfM92EZuPpjKWEfR
	 b3C+M1RpzB9/HkHN5rqpGZ6EnjmtxCCX3YJsF40I5/HMU+wmvIBEhc2P/6r/6O+tOy
	 aA8yJeuIg1zqExV/WBUFyJAaLv+z9wTtLghRdgOWJmfp4AwgqoAqtnbcDmPRDHE6IT
	 Y5ZdszNr6nr8ahdXFcp8fB+OPnYBKXshDPJOiOiB8t+z9YNtiKhRRaym8u+YLVqLTS
	 q/xiULOoZPTog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B29C4332F;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Nov 2023 07:42:57 -0600
Subject: [PATCH 5/7] powerpc/rtas: Move post_mobility_fixup() declaration
 to pseries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-rtas-trivial-v1-5-61847655c51f@linux.ibm.com>
References: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
In-Reply-To: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699278208; l=2039;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=m3ZzkHGGDWvMrkkWKHzTjH9qFn2BzZzK6cBbnUv6bSA=;
 b=mMuQDapjwwiefuk4Pl7ud4nzuWz5Fvvb7rf7Cq8mjZ08nkRYg3YIXIP5SXANW/XsPjrkoF8zO
 aMDhLJMAciXDYZy1Uzf/NGuOvF6wBSwMG4x0ayPcwPKUnFeKpAPPj6V
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

This is a pseries-specific function declaration that doesn't belong in
rtas.h. Move it to the pseries platform code and adjust
pseries/suspend.c accordingly.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h          | 1 -
 arch/powerpc/platforms/pseries/pseries.h | 1 +
 arch/powerpc/platforms/pseries/suspend.c | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index c6568a647cd0..2365668fc13e 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -444,7 +444,6 @@ extern void pSeries_log_error(char *buf, unsigned int err_type, int fatal);
 #ifdef CONFIG_PPC_PSERIES
 extern time64_t last_rtas_event;
 extern int clobbering_unread_rtas_event(void);
-extern void post_mobility_fixup(void);
 int rtas_syscall_dispatch_ibm_suspend_me(u64 handle);
 #else
 static inline int clobbering_unread_rtas_event(void) { return 0; }
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 8376f03f932a..bba4ad192b0f 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -55,6 +55,7 @@ extern int dlpar_detach_node(struct device_node *);
 extern int dlpar_acquire_drc(u32 drc_index);
 extern int dlpar_release_drc(u32 drc_index);
 extern int dlpar_unisolate_drc(u32 drc_index);
+extern void post_mobility_fixup(void);
 
 void queue_hotplug_event(struct pseries_hp_errorlog *hp_errlog);
 int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_errlog);
diff --git a/arch/powerpc/platforms/pseries/suspend.c b/arch/powerpc/platforms/pseries/suspend.c
index 5c43435472cc..382003dfdb9a 100644
--- a/arch/powerpc/platforms/pseries/suspend.c
+++ b/arch/powerpc/platforms/pseries/suspend.c
@@ -13,6 +13,7 @@
 #include <asm/mmu.h>
 #include <asm/rtas.h>
 #include <asm/topology.h>
+#include "pseries.h"
 
 static struct device suspend_dev;
 

-- 
2.41.0

