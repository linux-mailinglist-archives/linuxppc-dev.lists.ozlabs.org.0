Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A69BA26BCF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 08:26:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Brqql6P3ZzDqN1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 16:26:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=miaoqinglang@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrqjP517fzDqMW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 16:20:57 +1000 (AEST)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9333F9C127C521A72810;
 Wed, 16 Sep 2020 14:20:54 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 16 Sep 2020 14:20:46 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Tyrel Datwyler
 <tyreld@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH -next] PCI: rpadlpar: use for_each_child_of_node() and
 for_each_node_by_name
Date: Wed, 16 Sep 2020 14:21:28 +0800
Message-ID: <20200916062128.190819-1-miaoqinglang@huawei.com>
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use for_each_child_of_node() and for_each_node_by_name macro
instead of open coding it.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/pci/hotplug/rpadlpar_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
index f979b7098..0a3c80ba6 100644
--- a/drivers/pci/hotplug/rpadlpar_core.c
+++ b/drivers/pci/hotplug/rpadlpar_core.c
@@ -40,13 +40,13 @@ static DEFINE_MUTEX(rpadlpar_mutex);
 static struct device_node *find_vio_slot_node(char *drc_name)
 {
 	struct device_node *parent = of_find_node_by_name(NULL, "vdevice");
-	struct device_node *dn = NULL;
+	struct device_node *dn;
 	int rc;
 
 	if (!parent)
 		return NULL;
 
-	while ((dn = of_get_next_child(parent, dn))) {
+	for_each_child_of_node(parent, dn) {
 		rc = rpaphp_check_drc_props(dn, drc_name, NULL);
 		if (rc == 0)
 			break;
@@ -60,10 +60,10 @@ static struct device_node *find_vio_slot_node(char *drc_name)
 static struct device_node *find_php_slot_pci_node(char *drc_name,
 						  char *drc_type)
 {
-	struct device_node *np = NULL;
+	struct device_node *np;
 	int rc;
 
-	while ((np = of_find_node_by_name(np, "pci"))) {
+	for_each_node_by_name(np, "pci") {
 		rc = rpaphp_check_drc_props(np, drc_name, drc_type);
 		if (rc == 0)
 			break;
-- 
2.23.0

