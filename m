Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 247AD123D34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 03:42:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cznB1BQXzDqW3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 13:42:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=chenzhou10@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 938 seconds by postgrey-1.36 at bilbo;
 Wed, 18 Dec 2019 13:27:44 AEDT
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47czSJ6HLFzDq62
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 13:27:40 +1100 (AEDT)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 536DBF6D6215E6402132;
 Wed, 18 Dec 2019 10:11:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Wed, 18 Dec 2019 10:11:46 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <benh@kernel.crashing.org>, <paulus@samba.org>, <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/setup_64: use DEFINE_DEBUGFS_ATTRIBUTE to define
 fops_rfi_flush
Date: Wed, 18 Dec 2019 10:08:42 +0800
Message-ID: <20191218020842.186446-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 18 Dec 2019 13:40:42 +1100
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
Cc: chenzhou10@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use DEFINE_DEBUGFS_ATTRIBUTE rather than DEFINE_SIMPLE_ATTRIBUTE for
debugfs files.

Semantic patch information:
Rationale: DEFINE_SIMPLE_ATTRIBUTE + debugfs_create_file()
imposes some significant overhead as compared to
DEFINE_DEBUGFS_ATTRIBUTE + debugfs_create_file_unsafe().

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 arch/powerpc/kernel/setup_64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 6104917..4b9fbb2 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -956,11 +956,11 @@ static int rfi_flush_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_rfi_flush, rfi_flush_get, rfi_flush_set, "%llu\n");
 
 static __init int rfi_flush_debugfs_init(void)
 {
-	debugfs_create_file("rfi_flush", 0600, powerpc_debugfs_root, NULL, &fops_rfi_flush);
+	debugfs_create_file_unsafe("rfi_flush", 0600, powerpc_debugfs_root, NULL, &fops_rfi_flush);
 	return 0;
 }
 device_initcall(rfi_flush_debugfs_init);
-- 
2.7.4

