Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CFBDEFA4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 16:33:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xfJG310RzDqkR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 01:33:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.132.45; helo=newton.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=glider.be
X-Greylist: delayed 426 seconds by postgrey-1.36 at bilbo;
 Tue, 22 Oct 2019 01:30:39 AEDT
Received: from newton.telenet-ops.be (newton.telenet-ops.be [195.130.132.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xfFC53njzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 01:30:37 +1100 (AEDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 46xf4f2zW9zMrxCP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 16:23:14 +0200 (CEST)
Received: from ramsan ([84.194.98.4]) by xavier.telenet-ops.be with bizsmtp
 id GEPA2100Z05gfCL01EPAGy; Mon, 21 Oct 2019 16:23:13 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMYaU-0007oE-Ju; Mon, 21 Oct 2019 16:23:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iMYaU-0007K2-Gm; Mon, 21 Oct 2019 16:23:10 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/security: Fix debugfs data leak on 32-bit
Date: Mon, 21 Oct 2019 16:23:09 +0200
Message-Id: <20191021142309.28105-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
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
Cc: linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"powerpc_security_features" is "unsigned long", i.e. 32-bit or 64-bit,
depending on the platform (PPC_FSL_BOOK3E or PPC_BOOK3S_64).  Hence
casting its address to "u64 *", and calling debugfs_create_x64() is
wrong, and leaks 32-bit of nearby data to userspace on 32-bit platforms.

While all currently defined SEC_FTR_* security feature flags fit in
32-bit, they all have "ULL" suffixes to make them 64-bit constants.
Hence fix the leak by changing the type of "powerpc_security_features"
(and the parameter types of its accessors) to "u64".  This also allows
to drop the cast.

Fixes: 398af571128fe75f ("powerpc/security: Show powerpc_security_features in debugfs")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.

Alternatively, powerpc_security_features could be changed to u32.
However, that would require using debugfs_create_x32() instead of
debugfs_create_x64(), which would change the debugfs file formatting
from "0x%016llx" to "0x%08llx".
---
 arch/powerpc/include/asm/security_features.h | 8 ++++----
 arch/powerpc/kernel/security.c               | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/security_features.h b/arch/powerpc/include/asm/security_features.h
index 759597bf0fd867bd..a3e8ecd48dc7ffa0 100644
--- a/arch/powerpc/include/asm/security_features.h
+++ b/arch/powerpc/include/asm/security_features.h
@@ -9,7 +9,7 @@
 #define _ASM_POWERPC_SECURITY_FEATURES_H
 
 
-extern unsigned long powerpc_security_features;
+extern u64 powerpc_security_features;
 extern bool rfi_flush;
 
 /* These are bit flags */
@@ -24,17 +24,17 @@ void setup_stf_barrier(void);
 void do_stf_barrier_fixups(enum stf_barrier_type types);
 void setup_count_cache_flush(void);
 
-static inline void security_ftr_set(unsigned long feature)
+static inline void security_ftr_set(u64 feature)
 {
 	powerpc_security_features |= feature;
 }
 
-static inline void security_ftr_clear(unsigned long feature)
+static inline void security_ftr_clear(u64 feature)
 {
 	powerpc_security_features &= ~feature;
 }
 
-static inline bool security_ftr_enabled(unsigned long feature)
+static inline bool security_ftr_enabled(u64 feature)
 {
 	return !!(powerpc_security_features & feature);
 }
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 7cfcb294b11ca7be..2e9a7e20d05c5f79 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -16,7 +16,7 @@
 #include <asm/setup.h>
 
 
-unsigned long powerpc_security_features __read_mostly = SEC_FTR_DEFAULT;
+u64 powerpc_security_features __read_mostly = SEC_FTR_DEFAULT;
 
 enum count_cache_flush_type {
 	COUNT_CACHE_FLUSH_NONE	= 0x1,
@@ -108,7 +108,7 @@ device_initcall(barrier_nospec_debugfs_init);
 static __init int security_feature_debugfs_init(void)
 {
 	debugfs_create_x64("security_features", 0400, powerpc_debugfs_root,
-			   (u64 *)&powerpc_security_features);
+			   &powerpc_security_features);
 	return 0;
 }
 device_initcall(security_feature_debugfs_init);
-- 
2.17.1

