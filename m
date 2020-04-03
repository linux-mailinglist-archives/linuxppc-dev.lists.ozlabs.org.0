Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D386A19D106
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 09:17:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48trqX64JXzDrff
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 18:17:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48trmR0hBMzDrg8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 18:15:02 +1100 (AEDT)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9D9B696038D0380CBFD1;
 Fri,  3 Apr 2020 15:14:59 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Fri, 3 Apr 2020
 15:14:50 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <gregkh@linuxfoundation.org>, <jslaby@suse.com>,
 <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] tty: hvc: remove hvcs_driver_string
Date: Fri, 3 Apr 2020 15:13:25 +0800
Message-ID: <20200403071325.3721-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
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
Cc: Jason Yan <yanaijie@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No users of hvcs_driver_string, remove it. This fixes the following gcc
warning:

drivers/tty/hvc/hvcs.c:199:19: warning: ‘hvcs_driver_string’ defined but
not used [-Wunused-const-variable=]
 static const char hvcs_driver_string[]
                   ^~~~~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/tty/hvc/hvcs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index ee0604cd9c6b..55105ac38f89 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -196,8 +196,6 @@ module_param(hvcs_parm_num_devs, int, 0);
 
 static const char hvcs_driver_name[] = "hvcs";
 static const char hvcs_device_node[] = "hvcs";
-static const char hvcs_driver_string[]
-	= "IBM hvcs (Hypervisor Virtual Console Server) Driver";
 
 /* Status of partner info rescan triggered via sysfs. */
 static int hvcs_rescan_status;
-- 
2.17.2

