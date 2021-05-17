Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B6F382688
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 10:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkBmG0klXz3bnb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 18:16:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=tanxiaofei@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk8dx46Kqz2yWR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 16:40:37 +1000 (AEST)
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fk8Zg3fDWz16R4L;
 Mon, 17 May 2021 14:37:47 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 14:40:31 +0800
Received: from localhost.localdomain (10.67.165.24) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 14:40:31 +0800
From: Xiaofei Tan <tanxiaofei@huawei.com>
To: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>
Subject: [PATCH 9/9] tty: hvc_console: Move open brace { on the previous line
Date: Mon, 17 May 2021 14:37:13 +0800
Message-ID: <1621233433-27094-10-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
References: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 17 May 2021 18:15:54 +1000
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
Cc: Xiaofei Tan <tanxiaofei@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linuxarm@openeuler.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix issues that open brace { should be on the previous line,
reported by checkpatch.pl.

Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
---
 drivers/tty/hvc/hvc_console.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index b6720b0..b96399e 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -140,8 +140,9 @@ static int hvc_flush(struct hvc_struct *hp)
  * static because kmalloc will not work during early console init.
  */
 static const struct hv_ops *cons_ops[MAX_NR_HVC_CONSOLES];
-static uint32_t vtermnos[MAX_NR_HVC_CONSOLES] =
-	{[0 ... MAX_NR_HVC_CONSOLES - 1] = -1};
+static uint32_t vtermnos[MAX_NR_HVC_CONSOLES] = {
+	[0 ... MAX_NR_HVC_CONSOLES - 1] = -1
+};
 
 /*
  * Console APIs, NOT TTY.  These APIs are available immediately when
-- 
2.8.1

