Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5DA5697DC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 04:19:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldg8W5tbMz3cBS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 12:19:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=nfschina.com (client-ip=2400:dd01:100f:2:72e2:84ff:fe10:5f45; helo=mail.nfschina.com; envelope-from=zeming@nfschina.com; receiver=<UNKNOWN>)
X-Greylist: delayed 213 seconds by postgrey-1.36 at boromir; Thu, 07 Jul 2022 11:57:52 AEST
Received: from mail.nfschina.com (unknown [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldfgh1wQnz2ypn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 11:57:52 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 32A341E80D82;
	Thu,  7 Jul 2022 09:51:54 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-_bRMq-4aja; Thu,  7 Jul 2022 09:51:51 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zeming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id 583761E80D74;
	Thu,  7 Jul 2022 09:51:51 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: benh@kernel.crashing.org
Subject: [PATCH] macintosh/ams/ams: Add header file macro definition
Date: Thu,  7 Jul 2022 09:53:52 +0800
Message-Id: <20220707015352.3391-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Thu, 07 Jul 2022 12:19:04 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Li zeming <zeming@nfschina.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add header file macro definition.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 drivers/macintosh/ams/ams.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/macintosh/ams/ams.h b/drivers/macintosh/ams/ams.h
index 935bdd9cd9a6..5ec5547f151b 100644
--- a/drivers/macintosh/ams/ams.h
+++ b/drivers/macintosh/ams/ams.h
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _AMS_H
+#define _AMS_H
+
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/kthread.h>
@@ -69,3 +72,4 @@ extern int ams_i2c_init(struct device_node *np);
 
 extern int ams_input_init(void);
 extern void ams_input_exit(void);
+#endif
-- 
2.18.2

