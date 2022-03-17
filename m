Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB174DBD3A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 03:50:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJs8c0zjhz3bjR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 13:50:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=meizu.com (client-ip=14.29.68.187; helo=mail.meizu.com;
 envelope-from=baihaowen@meizu.com; receiver=<UNKNOWN>)
X-Greylist: delayed 66 seconds by postgrey-1.36 at boromir;
 Thu, 17 Mar 2022 13:34:03 AEDT
Received: from mail.meizu.com (unknown [14.29.68.187])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJrn75q2Bz2yK2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 13:34:02 +1100 (AEDT)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 17 Mar
 2022 10:32:42 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 17 Mar
 2022 10:32:40 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <benh@kernel.crashing.org>, <masahiroy@kernel.org>, <adobriyan@gmail.com>
Subject: [PATCH] macintosh: windfarm_pm81: Fix warning comparing pointer to 0
Date: Thu, 17 Mar 2022 10:32:39 +0800
Message-ID: <1647484359-12402-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
X-Mailman-Approved-At: Thu, 17 Mar 2022 13:50:15 +1100
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
Cc: Haowen Bai <baihaowen@meizu.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Avoid pointer type value compared with 0 to make code clear.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/macintosh/windfarm_pm81.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/windfarm_pm81.c b/drivers/macintosh/windfarm_pm81.c
index 82c67a4..1dfced5 100644
--- a/drivers/macintosh/windfarm_pm81.c
+++ b/drivers/macintosh/windfarm_pm81.c
@@ -400,7 +400,7 @@ static void wf_smu_create_cpu_fans(void)
 
 	/* First, locate the PID params in SMU SBD */
 	hdr = smu_get_sdb_partition(SMU_SDB_CPUPIDDATA_ID, NULL);
-	if (hdr == 0) {
+	if (!hdr) {
 		printk(KERN_WARNING "windfarm: CPU PID fan config not found "
 		       "max fan speed\n");
 		goto fail;
@@ -704,7 +704,7 @@ static int wf_init_pm(void)
 	const struct smu_sdbp_header *hdr;
 
 	hdr = smu_get_sdb_partition(SMU_SDB_SENSORTREE_ID, NULL);
-	if (hdr != 0) {
+	if (hdr) {
 		struct smu_sdbp_sensortree *st =
 			(struct smu_sdbp_sensortree *)&hdr[1];
 		wf_smu_mach_model = st->model_id;
-- 
2.7.4

