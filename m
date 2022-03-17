Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B28454DC293
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 10:25:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK1vv4gZRz30hh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 20:25:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=meizu.com (client-ip=157.122.146.251; helo=mail.meizu.com;
 envelope-from=baihaowen@meizu.com; receiver=<UNKNOWN>)
Received: from mail.meizu.com (edge05.meizu.com [157.122.146.251])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK1vT468mz2yHZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 20:24:59 +1100 (AEDT)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail12.meizu.com
 (172.16.1.108) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 17 Mar
 2022 17:24:51 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 17 Mar
 2022 17:24:50 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <benh@kernel.crashing.org>, <masahiroy@kernel.org>, <adobriyan@gmail.com>
Subject: [PATCH] macintosh: macio-adb: Fix warning comparing pointer to 0
Date: Thu, 17 Mar 2022 17:24:49 +0800
Message-ID: <1647509089-4280-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)
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
 drivers/macintosh/macio-adb.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/macio-adb.c b/drivers/macintosh/macio-adb.c
index dc634c2..b7d287a 100644
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
@@ -210,7 +210,8 @@ static irqreturn_t macio_adb_interrupt(int irq, void *arg)
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

