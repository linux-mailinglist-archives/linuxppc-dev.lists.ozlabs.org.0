Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8056B80B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 19:32:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb4y15rKWz3cdT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 05:32:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sia3eX1j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sia3eX1j;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb4v90gnSz3brQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 05:29:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B702B811E0;
	Mon, 13 Mar 2023 18:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B4BC433EF;
	Mon, 13 Mar 2023 18:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678732175;
	bh=Wkc8ouE8preZxxsKKr+mW1QCYOu2NrmhAiEHH6XrvJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sia3eX1jTyd6HFboYPForq+DFhgzXjzHJFJ3CKNpgDiTkRxSnzdvetgUuSrR3REvZ
	 rxPHW7vLDroW30cVO3GV2OI7dbkenunW4WplYf0LDGfmbf5owZQ6HmMIcuI8Tm6pBz
	 7qjswwHmKBucIQRmxi1knQDyNLlUJx+AHYzUWOZg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 13/36] powerpc/powernv: move to use bus_get_dev_root()
Date: Mon, 13 Mar 2023 19:28:55 +0100
Message-Id: <20230313182918.1312597-13-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313182918.1312597-1-gregkh@linuxfoundation.org>
References: <20230313182918.1312597-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991; i=gregkh@linuxfoundation.org; h=from:subject; bh=Wkc8ouE8preZxxsKKr+mW1QCYOu2NrmhAiEHH6XrvJ8=; b=owGbwMvMwCRo6H6F97bub03G02pJDCn82RWCF9Rn1zBn9X5d7J6Rft93Kr+jnp/wnO+Vhd8UB VeobDLsiGVhEGRikBVTZPmyjefo/opDil6Gtqdh5rAygQxh4OIUgIlsWsgwP9NjR1XwN4/5VgsS ll189TA8doHhEob5OXZX70gzLd+byRTa9f3E230vXay9AQ==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
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
Cc: rafael@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Julia Lawall <Julia.Lawall@inria.fr>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Nicholas Piggin <npiggin@gmail.com>, Liang He <windhl@126.com>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Direct access to the struct bus_type dev_root pointer is going away soon
so replace that with a call to bus_get_dev_root() instead, which is what
it is there for.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Liang He <windhl@126.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Note, this is a patch that is a prepatory cleanup as part of a larger
series of patches that is working on resolving some old driver core
design mistakes.  It will build and apply cleanly on top of 6.3-rc2 on
its own, but I'd prefer if I could take it through my driver-core tree
so that the driver core changes can be taken through there for 6.4-rc1.

 arch/powerpc/platforms/powernv/idle.c    |  9 +++++++--
 arch/powerpc/platforms/powernv/subcore.c | 10 ++++++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 841cb7f31f4f..6dfe8d611164 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1464,14 +1464,19 @@ static int __init pnv_init_idle_states(void)
 			power7_fastsleep_workaround_entry = false;
 			power7_fastsleep_workaround_exit = false;
 		} else {
+			struct device *dev_root;
 			/*
 			 * OPAL_PM_SLEEP_ENABLED_ER1 is set. It indicates that
 			 * workaround is needed to use fastsleep. Provide sysfs
 			 * control to choose how this workaround has to be
 			 * applied.
 			 */
-			device_create_file(cpu_subsys.dev_root,
-				&dev_attr_fastsleep_workaround_applyonce);
+			dev_root = bus_get_dev_root(&cpu_subsys);
+			if (dev_root) {
+				device_create_file(dev_root,
+						   &dev_attr_fastsleep_workaround_applyonce);
+				put_device(dev_root);
+			}
 		}
 
 		update_subcore_sibling_mask();
diff --git a/arch/powerpc/platforms/powernv/subcore.c b/arch/powerpc/platforms/powernv/subcore.c
index 7e98b00ea2e8..428532a69762 100644
--- a/arch/powerpc/platforms/powernv/subcore.c
+++ b/arch/powerpc/platforms/powernv/subcore.c
@@ -415,7 +415,9 @@ static DEVICE_ATTR(subcores_per_core, 0644,
 
 static int subcore_init(void)
 {
+	struct device *dev_root;
 	unsigned pvr_ver;
+	int rc = 0;
 
 	pvr_ver = PVR_VER(mfspr(SPRN_PVR));
 
@@ -435,7 +437,11 @@ static int subcore_init(void)
 
 	set_subcores_per_core(1);
 
-	return device_create_file(cpu_subsys.dev_root,
-				  &dev_attr_subcores_per_core);
+	dev_root = bus_get_dev_root(&cpu_subsys);
+	if (dev_root) {
+		rc = device_create_file(dev_root, &dev_attr_subcores_per_core);
+		put_device(dev_root);
+	}
+	return rc;
 }
 machine_device_initcall(powernv, subcore_init);
-- 
2.39.2

