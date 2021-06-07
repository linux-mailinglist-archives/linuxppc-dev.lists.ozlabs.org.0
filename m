Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C733039D30B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 04:43:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FyyNs1dCSz3btT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 12:43:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=zou_wei@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FyyNX14STz2xvH
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 12:43:21 +1000 (AEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FyyJs5Db8z6vwS;
 Mon,  7 Jun 2021 10:40:13 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 10:43:12 +0800
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 7 Jun 2021 10:43:12 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <benh@kernel.crashing.org>, <aik@ozlabs.ru>, <rdunlap@infradead.org>,
 <unixbhaskar@gmail.com>, <mpe@ellerman.id.au>
Subject: [PATCH -next] macintosh: Use for_each_child_of_node() macro
Date: Mon, 7 Jun 2021 11:01:48 +0800
Message-ID: <1623034908-30525-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
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
Cc: Zou Wei <zou_wei@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use for_each_child_of_node() macro instead of open coding it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/macintosh/macio_asic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index 49af60b..f552c7c 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -474,7 +474,7 @@ static void macio_pci_add_devices(struct macio_chip *chip)
 	root_res = &rdev->resource[0];
 
 	/* First scan 1st level */
-	for (np = NULL; (np = of_get_next_child(pnode, np)) != NULL;) {
+	for_each_child_of_node(pnode, np) {
 		if (macio_skip_device(np))
 			continue;
 		of_node_get(np);
@@ -491,7 +491,7 @@ static void macio_pci_add_devices(struct macio_chip *chip)
 	/* Add media bay devices if any */
 	if (mbdev) {
 		pnode = mbdev->ofdev.dev.of_node;
-		for (np = NULL; (np = of_get_next_child(pnode, np)) != NULL;) {
+		for_each_child_of_node(pnode, np) {
 			if (macio_skip_device(np))
 				continue;
 			of_node_get(np);
@@ -504,7 +504,7 @@ static void macio_pci_add_devices(struct macio_chip *chip)
 	/* Add serial ports if any */
 	if (sdev) {
 		pnode = sdev->ofdev.dev.of_node;
-		for (np = NULL; (np = of_get_next_child(pnode, np)) != NULL;) {
+		for_each_child_of_node(pnode, np) {
 			if (macio_skip_device(np))
 				continue;
 			of_node_get(np);
-- 
2.6.2

