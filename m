Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F31BAEC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 09:55:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cGpg0yHPzDqLw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 17:55:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cGmn4RLtzDqHX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 17:54:15 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4FB45B150;
 Mon, 23 Sep 2019 07:54:12 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 rebased] powerpc/fadump: when fadump is supported register
 the fadump sysfs files.
Date: Mon, 23 Sep 2019 09:54:06 +0200
Message-Id: <20190923075406.5854-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Michal Suchanek <msuchanek@suse.de>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Currently it is not possible to distinguish the case when fadump is
supported by firmware and disabled in kernel and completely unsupported
using the kernel sysfs interface. User can investigate the devicetree
but it is more reasonable to provide sysfs files in case we get some
fadumpv2 in the future.

With this patch sysfs files are available whenever fadump is supported
by firmware.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Acked-by: Hari Bathini <hbathini@linux.ibm.com>
---
v2: move the sysfs initialization earlier to avoid condition nesting
rebase: on top of the powernv fadump support
---
 arch/powerpc/kernel/fadump.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index ed59855430b9..cdcdea6c6453 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1466,16 +1466,20 @@ static void fadump_init_files(void)
  */
 int __init setup_fadump(void)
 {
-	if (!fw_dump.fadump_enabled)
-		return 0;
-
-	if (!fw_dump.fadump_supported) {
+	if (!fw_dump.fadump_supported && fw_dump.fadump_enabled) {
 		printk(KERN_ERR "Firmware-assisted dump is not supported on"
 			" this hardware\n");
-		return 0;
 	}
 
+	if (!fw_dump.fadump_supported)
+		return 0;
+
+	fadump_init_files();
 	fadump_show_config();
+
+	if (!fw_dump.fadump_enabled)
+		return 1;
+
 	/*
 	 * If dump data is available then see if it is valid and prepare for
 	 * saving it to the disk.
@@ -1492,8 +1496,6 @@ int __init setup_fadump(void)
 	else if (fw_dump.reserve_dump_area_size)
 		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
 
-	fadump_init_files();
-
 	return 1;
 }
 subsys_initcall(setup_fadump);
-- 
2.23.0

