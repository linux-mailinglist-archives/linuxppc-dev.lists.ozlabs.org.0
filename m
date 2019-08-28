Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 161699F8DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 05:44:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JBSS2yBKzDqyh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 13:44:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JBQj01G0zDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 13:42:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46JBQh3NNgz8sxl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 13:42:52 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46JBQh31b6z9sN6; Wed, 28 Aug 2019 13:42:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=68.65.122.29; helo=mta-09-4.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from MTA-09-4.privateemail.com (mta-09-4.privateemail.com
 [68.65.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46JBQg4vhPz9sBF
 for <linuxppc-dev@ozlabs.org>; Wed, 28 Aug 2019 13:42:50 +1000 (AEST)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 342226003F;
 Tue, 27 Aug 2019 23:42:47 -0400 (EDT)
Received: from wrwlf0000.attlocal.net (unknown [10.20.151.235])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id C00F560034;
 Wed, 28 Aug 2019 03:42:46 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org,
	kernel-hardening@lists.openwall.com
Subject: [PATCH v5 1/2] powerpc/xmon: Allow listing and clearing breakpoints
 in read-only mode
Date: Tue, 27 Aug 2019 22:46:12 -0500
Message-Id: <20190828034613.14750-2-cmr@informatik.wtf>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190828034613.14750-1-cmr@informatik.wtf>
References: <20190828034613.14750-1-cmr@informatik.wtf>
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Read-only mode should not prevent listing and clearing any active
breakpoints.

Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
---
 arch/powerpc/xmon/xmon.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index d0620d762a5a..a98a354d46ac 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1045,10 +1045,6 @@ cmds(struct pt_regs *excp)
 			set_lpp_cmd();
 			break;
 		case 'b':
-			if (xmon_is_ro) {
-				printf(xmon_ro_msg);
-				break;
-			}
 			bpt_cmds();
 			break;
 		case 'C':
@@ -1317,11 +1313,16 @@ bpt_cmds(void)
 	struct bpt *bp;
 
 	cmd = inchar();
+
 	switch (cmd) {
 #ifndef CONFIG_PPC_8xx
 	static const char badaddr[] = "Only kernel addresses are permitted for breakpoints\n";
 	int mode;
 	case 'd':	/* bd - hardware data breakpoint */
+		if (xmon_is_ro) {
+			printf(xmon_ro_msg);
+			break;
+		}
 		if (!ppc_breakpoint_available()) {
 			printf("Hardware data breakpoint not supported on this cpu\n");
 			break;
@@ -1349,6 +1350,10 @@ bpt_cmds(void)
 		break;
 
 	case 'i':	/* bi - hardware instr breakpoint */
+		if (xmon_is_ro) {
+			printf(xmon_ro_msg);
+			break;
+		}
 		if (!cpu_has_feature(CPU_FTR_ARCH_207S)) {
 			printf("Hardware instruction breakpoint "
 			       "not supported on this cpu\n");
@@ -1407,7 +1412,7 @@ bpt_cmds(void)
 			break;
 		}
 		termch = cmd;
-		if (!scanhex(&a)) {
+		if (xmon_is_ro || !scanhex(&a)) {
 			/* print all breakpoints */
 			printf("   type            address\n");
 			if (dabr.enabled) {
-- 
2.23.0

