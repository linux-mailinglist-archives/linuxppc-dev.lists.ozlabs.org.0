Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0DD4074B0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 04:38:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5xkP3qk7z3c9H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 12:38:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bluescreens.de (client-ip=2001:67c:2050::465:102;
 helo=mout-p-102.mailbox.org; envelope-from=cmr@bluescreens.de;
 receiver=<UNKNOWN>)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050::465:102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5xjQ52mPz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Sep 2021 12:37:30 +1000 (AEST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4H5xX5662jzQk95;
 Sat, 11 Sep 2021 04:29:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: "Christopher M. Riedl" <cmr@bluescreens.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 3/4] powerpc: Use WARN_ON and fix check in poking_init
Date: Fri, 10 Sep 2021 21:29:03 -0500
Message-Id: <20210911022904.30962-4-cmr@bluescreens.de>
In-Reply-To: <20210911022904.30962-1-cmr@bluescreens.de>
References: <20210911022904.30962-1-cmr@bluescreens.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9DE9826E
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
Cc: linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The latest kernel docs list BUG_ON() as 'deprecated' and that they
should be replaced with WARN_ON() (or pr_warn()) when possible. The
BUG_ON() in poking_init() warrants a WARN_ON() rather than a pr_warn()
since the error condition is deemed "unreachable".

Also take this opportunity to fix the failure check in the WARN_ON():
cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ...) returns a positive integer
on success and a negative integer on failure.

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>

---

v6:  * New to series - based on Christophe's relentless feedback in the
       crusade against BUG_ON()s :)
---
 arch/powerpc/lib/code-patching.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 8d0bb86125d5..e802e42c2789 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -126,16 +126,11 @@ static int text_area_cpu_down(unsigned int cpu)
 	return 0;
 }
 
-/*
- * Although BUG_ON() is rude, in this case it should only happen if ENOMEM, and
- * we judge it as being preferable to a kernel that will crash later when
- * someone tries to use patch_instruction().
- */
 void __init poking_init(void)
 {
-	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+	WARN_ON(cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 		"powerpc/text_poke:online", text_area_cpu_up,
-		text_area_cpu_down));
+		text_area_cpu_down) < 0);
 }
 
 /*
-- 
2.32.0

