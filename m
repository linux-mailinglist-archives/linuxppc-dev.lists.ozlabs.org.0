Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F761AEA4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 02:52:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452MjV5x46zDqK5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 10:52:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=git.icu
 (client-ip=163.172.180.134; helo=git.icu; envelope-from=shawn@git.icu;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=git.icu
Received: from git.icu (git.icu [163.172.180.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452MhB4Sq0zDqCY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 10:51:22 +1000 (AEST)
Received: from localhost.localdomain (minicloud.parqtec.unicamp.br
 [143.106.167.126]) by git.icu (Postfix) with ESMTPSA id 5583D220850;
 Mon, 13 May 2019 00:51:15 +0000 (UTC)
From: Shawn Landden <shawn@git.icu>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RESEND] powerpc: add simd.h implementation specific to PowerPC
Date: Sun, 12 May 2019 21:51:04 -0300
Message-Id: <20190513005104.20140-1-shawn@git.icu>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a
In-Reply-To: <20190512165032.19942-1-shawn@git.icu>
References: <20190512165032.19942-1-shawn@git.icu>
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
Cc: Shawn Landden <shawn@git.icu>, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is safe to do SIMD in an interrupt on PowerPC.
Only disable when there is no SIMD available
(and this is a static branch).

Tested and works with the WireGuard (Zinc) patch I wrote that needs this.
Also improves performance of the crypto subsystem that checks this.

Re-sending because this linuxppc-dev didn't seem to accept it.

Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=203571
Signed-off-by: Shawn Landden <shawn@git.icu>
---
 arch/powerpc/include/asm/simd.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 arch/powerpc/include/asm/simd.h

diff --git a/arch/powerpc/include/asm/simd.h b/arch/powerpc/include/asm/simd.h
new file mode 100644
index 000000000..b3fecb95a
--- /dev/null
+++ b/arch/powerpc/include/asm/simd.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#include <asm/cpu_has_feature.h>
+
+/*
+ * may_use_simd - whether it is allowable at this time to issue SIMD
+ *                instructions or access the SIMD register file
+ *
+ * As documented in Chapter 6.2.1 Machine Status Save/Restore Registers
+ * of Power ISA (2.07 and 3.0), all registers are saved/restored in an interrupt.
+ */
+static inline bool may_use_simd(void)
+{
+	return !cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE);
+}
-- 
2.21.0.1020.gf2820cf01a

