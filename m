Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C44F91BDA00
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 12:44:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BwBT3MtNzDqxF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 20:44:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=wangxiongfeng2@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 927 seconds by postgrey-1.36 at bilbo;
 Wed, 29 Apr 2020 20:22:23 AEST
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bvhb0m6pzDq6k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 20:22:22 +1000 (AEST)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3B04ED5A3D1979CF669D;
 Wed, 29 Apr 2020 18:06:48 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Wed, 29 Apr 2020 18:06:41 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <geoff@infradead.org>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <wangxiongfeng2@huawei.com>
Subject: [PATCH] powerpc/ps3: Move static keyword to the front of declaration
Date: Wed, 29 Apr 2020 18:00:48 +0800
Message-ID: <1588154448-56759-1-git-send-email-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 29 Apr 2020 20:42:35 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the static keyword to the front of declaration of 'vuart_bus_priv',
and resolve the following compiler warning that can be seen when
building with warnings enabled (W=1):

drivers/ps3/ps3-vuart.c:867:1: warning: ‘static’ is not at beginning of declaration [-Wold-style-declaration]
 } static vuart_bus_priv;
 ^

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/ps3/ps3-vuart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ps3/ps3-vuart.c b/drivers/ps3/ps3-vuart.c
index ddaa5ea..8e80e09 100644
--- a/drivers/ps3/ps3-vuart.c
+++ b/drivers/ps3/ps3-vuart.c
@@ -858,13 +858,13 @@ static int ps3_vuart_handle_port_interrupt(struct ps3_system_bus_device *dev)
 	return 0;
 }
 
-struct vuart_bus_priv {
+static struct vuart_bus_priv {
 	struct ports_bmp *bmp;
 	unsigned int virq;
 	struct mutex probe_mutex;
 	int use_count;
 	struct ps3_system_bus_device *devices[PORT_COUNT];
-} static vuart_bus_priv;
+} vuart_bus_priv;
 
 /**
  * ps3_vuart_irq_handler - first stage interrupt handler
-- 
1.7.12.4

