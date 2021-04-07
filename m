Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA2E356C97
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 14:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFklF42ghz3c8t
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 22:50:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=yukuai3@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFkkw0JLVz3c1v
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 22:50:15 +1000 (AEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFkgb6wHyzPnHR;
 Wed,  7 Apr 2021 20:47:23 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 20:50:02 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>
Subject: [PATCH] tty: hvc: make symbol 'hvc_udbg_dev' static
Date: Wed, 7 Apr 2021 20:58:26 +0800
Message-ID: <20210407125826.4139130-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
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
Cc: yukuai3@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, zhangxiaoxu5@huawei.com, yi.zhang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sparse tool complains as follows:

drivers/tty/hvc/hvc_udbg.c:20:19: warning:
 symbol 'hvc_udbg_dev' was not declared. Should it be static?

This symbol is not used outside of hvc_udbg.c, so this
commit marks it static.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/tty/hvc/hvc_udbg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/hvc/hvc_udbg.c b/drivers/tty/hvc/hvc_udbg.c
index a4c9913f76a0..ff0dcc56413c 100644
--- a/drivers/tty/hvc/hvc_udbg.c
+++ b/drivers/tty/hvc/hvc_udbg.c
@@ -17,7 +17,7 @@
 
 #include "hvc_console.h"
 
-struct hvc_struct *hvc_udbg_dev;
+static struct hvc_struct *hvc_udbg_dev;
 
 static int hvc_udbg_put(uint32_t vtermno, const char *buf, int count)
 {
-- 
2.25.4

