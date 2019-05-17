Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59488218FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 15:14:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4558082JmzzDqSR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 23:14:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4557wr2bY4zDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 23:11:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4557wr1HD4z8tPq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 23:11:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4557wr0sqfz9s9y; Fri, 17 May 2019 23:11:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=198.54.122.46; helo=new-02-2.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from NEW-02-2.privateemail.com (new-02-2.privateemail.com
 [198.54.122.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4557wq2yG1z9s9N
 for <linuxppc-dev@ozlabs.org>; Fri, 17 May 2019 23:11:53 +1000 (AEST)
Received: from MTA-09.privateemail.com (unknown [10.20.147.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-02.privateemail.com (Postfix) with ESMTPS id A1B0F6008E;
 Fri, 17 May 2019 13:11:50 +0000 (UTC)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 8CF2060041;
 Fri, 17 May 2019 09:11:50 -0400 (EDT)
Received: from wrwlf0000.attlocal.net (unknown [10.20.151.203])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 096BC60043;
 Fri, 17 May 2019 13:11:49 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v4] powerpc/64s: support nospectre_v2 cmdline option
Date: Fri, 17 May 2019 08:14:01 -0500
Message-Id: <20190517131400.20503-1-cmr@informatik.wtf>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: "Christopher M. Riedl" <cmr@informatik.wtf>,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for disabling the kernel implemented spectre v2 mitigation
(count cache flush on context switch) via the nospectre_v2 and
mitigations=off cmdline options.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v3->v4:
	add support for new mitigations=off cmdline option

 arch/powerpc/kernel/security.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index e1c9cf079503..88ae6a9bdf74 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -28,7 +28,7 @@ static enum count_cache_flush_type count_cache_flush_type = COUNT_CACHE_FLUSH_NO
 bool barrier_nospec_enabled;
 static bool no_nospec;
 static bool btb_flush_enabled;
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#if defined(CONFIG_PPC_FSL_BOOK3E) || defined(CONFIG_PPC_BOOK3S_64)
 static bool no_spectrev2;
 #endif
 
@@ -114,7 +114,7 @@ static __init int security_feature_debugfs_init(void)
 device_initcall(security_feature_debugfs_init);
 #endif /* CONFIG_DEBUG_FS */
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#if defined(CONFIG_PPC_FSL_BOOK3E) || defined(CONFIG_PPC_BOOK3S_64)
 static int __init handle_nospectre_v2(char *p)
 {
 	no_spectrev2 = true;
@@ -122,6 +122,9 @@ static int __init handle_nospectre_v2(char *p)
 	return 0;
 }
 early_param("nospectre_v2", handle_nospectre_v2);
+#endif /* CONFIG_PPC_FSL_BOOK3E || CONFIG_PPC_BOOK3S_64 */
+
+#ifdef CONFIG_PPC_FSL_BOOK3E
 void setup_spectre_v2(void)
 {
 	if (no_spectrev2 || cpu_mitigations_off())
@@ -399,7 +402,17 @@ static void toggle_count_cache_flush(bool enable)
 
 void setup_count_cache_flush(void)
 {
-	toggle_count_cache_flush(true);
+	bool enable = true;
+
+	if (no_spectrev2 || cpu_mitigations_off()) {
+		if (security_ftr_enabled(SEC_FTR_BCCTRL_SERIALISED)
+		    || security_ftr_enabled(SEC_FTR_COUNT_CACHE_DISABLED))
+			pr_warn("Spectre v2 mitigations not under software control, can't disable\n");
+
+		enable = false;
+	}
+
+	toggle_count_cache_flush(enable);
 }
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.21.0

