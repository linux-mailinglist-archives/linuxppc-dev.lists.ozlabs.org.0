Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF04DBD3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 03:52:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJsBH1xRDz3cfj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 13:52:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=meizu.com (client-ip=157.122.146.251; helo=mail.meizu.com;
 envelope-from=baihaowen@meizu.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Thu, 17 Mar 2022 13:46:06 AEDT
Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJs322t06z2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 13:46:06 +1100 (AEDT)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 17 Mar
 2022 10:44:50 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 17 Mar
 2022 10:44:49 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <benh@kernel.crashing.org>, <masahiroy@kernel.org>, <adobriyan@gmail.com>
Subject: [PATCH] macintosh: smu: Fix warning comparing pointer to 0
Date: Thu, 17 Mar 2022 10:44:48 +0800
Message-ID: <1647485088-16068-1-git-send-email-baihaowen@meizu.com>
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
 drivers/macintosh/smu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index a4fbc3f..d72d073 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -1087,7 +1087,7 @@ static int smu_open(struct inode *inode, struct file *file)
 	unsigned long flags;
 
 	pp = kzalloc(sizeof(struct smu_private), GFP_KERNEL);
-	if (pp == 0)
+	if (!pp)
 		return -ENOMEM;
 	spin_lock_init(&pp->lock);
 	pp->mode = smu_file_commands;
@@ -1254,7 +1254,7 @@ static __poll_t smu_fpoll(struct file *file, poll_table *wait)
 	__poll_t mask = 0;
 	unsigned long flags;
 
-	if (pp == 0)
+	if (!pp)
 		return 0;
 
 	if (pp->mode == smu_file_commands) {
@@ -1277,7 +1277,7 @@ static int smu_release(struct inode *inode, struct file *file)
 	unsigned long flags;
 	unsigned int busy;
 
-	if (pp == 0)
+	if (!pp)
 		return 0;
 
 	file->private_data = NULL;
-- 
2.7.4

