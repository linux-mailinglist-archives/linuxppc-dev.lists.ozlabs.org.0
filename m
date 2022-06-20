Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4AB552016
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 17:14:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRY884zfgz3cd5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 01:14:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=fvhvw7BS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.113; helo=m15113.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=fvhvw7BS;
	dkim-atps=neutral
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRY7T1nYyz3cgJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 01:13:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FzbEm
	dFdPL73KnSUrc2WOTvSmbGHmx084UiTS3b2xYw=; b=fvhvw7BSyi5V3Q6YO6IDw
	uI7VmE/xGn8ZUgXJxDtmNHo/PJ+Bhw/UHnR6VkHMfJNdgnp+/zWYiWXIt/jM6ez/
	/SK4iXEp83pWZKLQngO9cRvQVhR05jHm39iAwNOmZ8ntSDzC0CH+WqTk4l5P8k0f
	yiHjZckWFv2avhsuhFWXyQ=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp3 (Coremail) with SMTP id DcmowAA305RCjrBiduIVDw--.52838S2;
	Mon, 20 Jun 2022 23:12:02 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	clg@kaod.org,
	christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc/pasemi: Fix refcount leak bug
Date: Mon, 20 Jun 2022 23:12:02 +0800
Message-Id: <20220620151202.4075170-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowAA305RCjrBiduIVDw--.52838S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr48WF15Cry7ur4DKF15urg_yoW3JrbEy3
	97uan7AayfGrsrJa9Fva1rGr1UC395Wr4UKr1I93W2v3W3Aay7KFnxJrW8G3y5ury2vrW3
	Can3JayDZa4SyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjjg4PUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAMmF2JVj813ngAAsW
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In pas_pci_init(), we need one of_node_put() for of_find_node_by_path()
to keep refcount balance.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/pasemi/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pasemi/pci.c b/arch/powerpc/platforms/pasemi/pci.c
index 55f0160910bf..4b371fb0d9aa 100644
--- a/arch/powerpc/platforms/pasemi/pci.c
+++ b/arch/powerpc/platforms/pasemi/pci.c
@@ -282,6 +282,7 @@ void __init pas_pci_init(void)
 	pci_set_flags(PCI_SCAN_ALL_PCIE_DEVS);
 
 	np = of_find_compatible_node(root, NULL, "pasemi,rootbus");
+	of_node_put(root);
 	if (np) {
 		res = pas_add_bridge(np);
 		of_node_put(np);
-- 
2.25.1

