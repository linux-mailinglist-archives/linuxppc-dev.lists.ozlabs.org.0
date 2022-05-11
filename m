Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6910A522A51
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 05:21:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KygDm2gDrz3brk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 13:21:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=zhengbin13@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KygDM44Kqz3bcj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 13:21:20 +1000 (AEST)
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kyg8x6TzszGpm6;
 Wed, 11 May 2022 11:18:25 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemi500015.china.huawei.com
 (7.221.188.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 11:21:13 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <haren@linux.ibm.com>, <gregkh@linuxfoundation.org>, <npiggin@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] powerpc/pseries/vas: Call misc_deregister if sysfs init
 fails
Date: Wed, 11 May 2022 11:35:07 +0800
Message-ID: <20220511033507.2745992-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500015.china.huawei.com (7.221.188.92)
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
Cc: zhengbin13@huawei.com, gaochao49@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Undo effects of misc_register if sysfs init fails after
misc_register.

Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 arch/powerpc/platforms/pseries/vas-sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/platforms/pseries/vas-sysfs.c
index ec65586cbeb3..89ed64d61da7 100644
--- a/arch/powerpc/platforms/pseries/vas-sysfs.c
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -248,6 +248,7 @@ int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps)
 	pseries_vas_kobj = kobject_create_and_add("vas0",
 					&vas_miscdev.this_device->kobj);
 	if (!pseries_vas_kobj) {
+		misc_deregister(&vas_miscdev);
 		pr_err("Failed to create VAS sysfs entry\n");
 		return -ENOMEM;
 	}
@@ -259,6 +260,7 @@ int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps)
 		if (!gzip_caps_kobj) {
 			pr_err("Failed to create VAS GZIP capability entry\n");
 			kobject_put(pseries_vas_kobj);
+			misc_deregister(&vas_miscdev);
 			return -ENOMEM;
 		}
 	}
--
2.31.1

