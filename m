Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6CC356C92
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 14:49:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFkkL5QhBz3bwC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 22:49:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=yukuai3@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFkk16xDMz302q
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 22:49:29 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FFkfh15VnzpW23;
 Wed,  7 Apr 2021 20:46:36 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 20:49:15 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <benh@kernel.crashing.org>
Subject: [PATCH] windfarm: make symbol 'wf_thread' static
Date: Wed, 7 Apr 2021 20:57:38 +0800
Message-ID: <20210407125738.4138480-1-yukuai3@huawei.com>
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

drivers/macintosh/windfarm_core.c:59:20: warning:
 symbol 'wf_thread' was not declared. Should it be static?

This symbol is not used outside of windfarm_core.c, so this
commit marks it static.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/macintosh/windfarm_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/windfarm_core.c b/drivers/macintosh/windfarm_core.c
index 77612303841e..07f91ec1f960 100644
--- a/drivers/macintosh/windfarm_core.c
+++ b/drivers/macintosh/windfarm_core.c
@@ -56,7 +56,7 @@ static BLOCKING_NOTIFIER_HEAD(wf_client_list);
 static int wf_client_count;
 static unsigned int wf_overtemp;
 static unsigned int wf_overtemp_counter;
-struct task_struct *wf_thread;
+static struct task_struct *wf_thread;
 
 static struct platform_device wf_platform_device = {
 	.name	= "windfarm",
-- 
2.25.4

