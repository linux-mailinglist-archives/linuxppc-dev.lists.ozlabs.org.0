Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B6318332B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 15:32:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dWWl6l90zDqTM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 01:32:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=chenzhou10@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dWRz11L9zDqDx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 01:29:31 +1100 (AEDT)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 08370A387A1824FBB9C2;
 Thu, 12 Mar 2020 22:11:53 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Mar 2020 22:11:44 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <paulus@samba.org>, <mpe@ellerman.id.au>, <tyreld@linux.ibm.com>,
 <bhelgaas@google.com>
Subject: [PATCH -next] PCI: rpaphp: remove set but not used variable 'value'
Date: Thu, 12 Mar 2020 22:04:12 +0800
Message-ID: <20200312140412.32373-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
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
Cc: chenzhou10@huawei.com, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/pci/hotplug/rpaphp_core.c: In function is_php_type:
drivers/pci/hotplug/rpaphp_core.c:291:16: warning:
	variable value set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/pci/hotplug/rpaphp_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index e408e40..5d871ef 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -288,11 +288,10 @@ EXPORT_SYMBOL_GPL(rpaphp_check_drc_props);
 
 static int is_php_type(char *drc_type)
 {
-	unsigned long value;
 	char *endptr;
 
 	/* PCI Hotplug nodes have an integer for drc_type */
-	value = simple_strtoul(drc_type, &endptr, 10);
+	simple_strtoul(drc_type, &endptr, 10);
 	if (endptr == drc_type)
 		return 0;
 
-- 
2.7.4

