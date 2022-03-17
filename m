Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686454DBD37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 03:50:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJs8B1X2zz3bVx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 13:50:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=meizu.com (client-ip=112.91.151.210; helo=mail.meizu.com;
 envelope-from=baihaowen@meizu.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Thu, 17 Mar 2022 13:31:36 AEDT
Received: from mail.meizu.com (edge07.meizu.com [112.91.151.210])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJrkJ2bl4z2x9g
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 13:31:36 +1100 (AEDT)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail11.meizu.com
 (172.16.1.15) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 17 Mar
 2022 10:30:07 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 17 Mar
 2022 10:30:04 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <benh@kernel.crashing.org>, <masahiroy@kernel.org>, <adobriyan@gmail.com>
Subject: [PATCH] macintosh: macio-adb: Fix warning comparing pointer to 0
Date: Thu, 17 Mar 2022 10:30:01 +0800
Message-ID: <1647484201-11738-1-git-send-email-baihaowen@meizu.com>
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
 drivers/macintosh/macio-adb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/macio-adb.c b/drivers/macintosh/macio-adb.c
index dc634c2..51afa46 100644
--- a/drivers/macintosh/macio-adb.c
+++ b/drivers/macintosh/macio-adb.c
@@ -97,7 +97,7 @@ int macio_init(void)
 	unsigned int irq;
 
 	adbs = of_find_compatible_node(NULL, "adb", "chrp,adb0");
-	if (adbs == 0)
+	if (!adbs)
 		return -ENXIO;
 
 	if (of_address_to_resource(adbs, 0, &r)) {
@@ -180,7 +180,7 @@ static int macio_send_request(struct adb_request *req, int sync)
 	req->reply_len = 0;
 
 	spin_lock_irqsave(&macio_lock, flags);
-	if (current_req != 0) {
+	if (current_req) {
 		last_req->next = req;
 		last_req = req;
 	} else {
@@ -210,7 +210,7 @@ static irqreturn_t macio_adb_interrupt(int irq, void *arg)
 	spin_lock(&macio_lock);
 	if (in_8(&adb->intr.r) & TAG) {
 		handled = 1;
-		if ((req = current_req) != 0) {
+		req = current_req;
+		if (req) {
 			/* put the current request in */
 			for (i = 0; i < req->nbytes; ++i)
 				out_8(&adb->data[i].r, req->data[i]);
-- 
2.7.4

