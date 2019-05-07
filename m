Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBA1163DF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 14:43:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yzmk3hpDzDqM2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 22:43:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yzks6bvYzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 22:41:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44yzkr2hPJz8tPT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 22:41:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44yzkr1yBzz9sBp; Tue,  7 May 2019 22:41:56 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 44yzkq5t1wz9sB8
 for <linuxppc-dev@ozlabs.org>; Tue,  7 May 2019 22:41:54 +1000 (AEST)
Received: from MTA-07-1.privateemail.com (unknown [10.20.147.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-02.privateemail.com (Postfix) with ESMTPS id 3D424607AA;
 Tue,  7 May 2019 12:41:52 +0000 (UTC)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 2578460051;
 Tue,  7 May 2019 08:41:52 -0400 (EDT)
Received: from wrwlf0000.attlocal.net (unknown [10.20.151.207])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 9E86260049;
 Tue,  7 May 2019 12:41:51 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3] powerpc/64s: support nospectre_v2 cmdline option
Date: Tue,  7 May 2019 07:43:55 -0500
Message-Id: <20190507124355.25684-1-cmr@informatik.wtf>
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
Cc: "Christopher M. Riedl" <cmr@informatik.wtf>, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for disabling the kernel implemented spectre v2 mitigation
(count cache flush on context switch) via the nospectre_v2 cmdline
option.

Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v2->v3:
	Address mpe's nitpick

 arch/powerpc/kernel/security.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index b33bafb8fcea..7005c50a991b 100644
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
 
@@ -106,7 +106,7 @@ static __init int barrier_nospec_debugfs_init(void)
 device_initcall(barrier_nospec_debugfs_init);
 #endif /* CONFIG_DEBUG_FS */
 
-#ifdef CONFIG_PPC_FSL_BOOK3E
+#if defined(CONFIG_PPC_FSL_BOOK3E) || defined(CONFIG_PPC_BOOK3S_64)
 static int __init handle_nospectre_v2(char *p)
 {
 	no_spectrev2 = true;
@@ -114,6 +114,9 @@ static int __init handle_nospectre_v2(char *p)
 	return 0;
 }
 early_param("nospectre_v2", handle_nospectre_v2);
+#endif /* CONFIG_PPC_FSL_BOOK3E || CONFIG_PPC_BOOK3S_64 */
+
+#ifdef CONFIG_PPC_FSL_BOOK3E
 void setup_spectre_v2(void)
 {
 	if (no_spectrev2)
@@ -391,7 +394,17 @@ static void toggle_count_cache_flush(bool enable)
 
 void setup_count_cache_flush(void)
 {
-	toggle_count_cache_flush(true);
+	bool enable = true;
+
+	if (no_spectrev2) {
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

