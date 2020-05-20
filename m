Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB81DAE6B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 11:13:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rn9G0gC7zDqWc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 19:13:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=chentao107@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rn7Q3S27zDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 19:11:45 +1000 (AEST)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6BCF348DF83988F62CA4;
 Wed, 20 May 2020 17:11:38 +0800 (CST)
Received: from huawei.com (10.67.174.156) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 20 May 2020
 17:11:28 +0800
From: Chen Tao <chentao107@huawei.com>
To: <jejb@linux.ibm.com>, <martin.petersen@oracle.com>
Subject: [PATCH -next] scsi: ibmvscsi: Make some functions static
Date: Wed, 20 May 2020 17:10:36 +0800
Message-ID: <20200520091036.247286-1-chentao107@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.156]
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
Cc: tyreld@linux.ibm.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, chentao107@huawei.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix the following warning:

drivers/scsi/ibmvscsi/ibmvscsi.c:2387:12: warning: symbol
'ibmvscsi_module_init' was not declared. Should it be static?
drivers/scsi/ibmvscsi/ibmvscsi.c:2409:13: warning: symbol
'ibmvscsi_module_exit' was not declared. Should it be static?

Signed-off-by: Chen Tao <chentao107@huawei.com>
---
 drivers/scsi/ibmvscsi/ibmvscsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 59f0f1030c54..44e64aa21194 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -2384,7 +2384,7 @@ static struct vio_driver ibmvscsi_driver = {
 static struct srp_function_template ibmvscsi_transport_functions = {
 };
 
-int __init ibmvscsi_module_init(void)
+static int __init ibmvscsi_module_init(void)
 {
 	int ret;
 
@@ -2406,7 +2406,7 @@ int __init ibmvscsi_module_init(void)
 	return ret;
 }
 
-void __exit ibmvscsi_module_exit(void)
+static void __exit ibmvscsi_module_exit(void)
 {
 	vio_unregister_driver(&ibmvscsi_driver);
 	srp_release_transport(ibmvscsi_transport_template);
-- 
2.22.0

