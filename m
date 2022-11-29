Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678D663B772
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 02:53:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLljM1rstz3cJq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 12:53:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=zhengyongjun3@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLlhl3TSYz3bbb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 12:52:39 +1100 (AEDT)
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NLlgp04XCzHwFv;
	Tue, 29 Nov 2022 09:51:49 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 29 Nov
 2022 09:52:30 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <qiang.zhao@nxp.com>, <leoyang.li@nxp.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] soc: fsl: qe: Fix refcount leak in par_io_of_config
Date: Tue, 29 Nov 2022 01:50:12 +0000
Message-ID: <20221129015012.61847-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500013.china.huawei.com (7.221.188.120)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on error path.
Add missing of_node_put() to avoid refcount leak.

Fixes: 986585385131 ("[POWERPC] Add QUICC Engine (QE) infrastructure")
Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/soc/fsl/qe/qe_io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/fsl/qe/qe_io.c b/drivers/soc/fsl/qe/qe_io.c
index a5e2d0e5ab51..e26836315167 100644
--- a/drivers/soc/fsl/qe/qe_io.c
+++ b/drivers/soc/fsl/qe/qe_io.c
@@ -159,11 +159,13 @@ int par_io_of_config(struct device_node *np)
 	pio_map = of_get_property(pio, "pio-map", &pio_map_len);
 	if (pio_map == NULL) {
 		printk(KERN_ERR "pio-map is not set!\n");
+		of_node_put(pio);
 		return -1;
 	}
 	pio_map_len /= sizeof(unsigned int);
 	if ((pio_map_len % 6) != 0) {
 		printk(KERN_ERR "pio-map format wrong!\n");
+		of_node_put(pio);
 		return -1;
 	}

--
2.17.1

