Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9925EA672
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 14:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbjD41xzfz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 22:45:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 965 seconds by postgrey-1.36 at boromir; Mon, 26 Sep 2022 22:45:36 AEST
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbjCh5wTkz2xYn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 22:45:32 +1000 (AEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mbhm341XGz1P6x8;
	Mon, 26 Sep 2022 20:25:07 +0800 (CST)
Received: from huawei.com (10.67.175.83) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 20:29:20 +0800
From: ruanjinjie <ruanjinjie@huawei.com>
To: <Roy.Pledge@nxp.com>, <leoyang.li@nxp.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next] soc: fsl: dpio: Add __init/__exit annotations to module init/exit func
Date: Mon, 26 Sep 2022 20:25:27 +0800
Message-ID: <20220926122527.1338917-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
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
Cc: ruanjinjie@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add missing __init/__exit annotations to module init/exit funcs

Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
---
 drivers/soc/fsl/dpio/dpio-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
index 5a2edc48dd79..534e91dd929c 100644
--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -326,7 +326,7 @@ static struct fsl_mc_driver dpaa2_dpio_driver = {
 	.match_id_table = dpaa2_dpio_match_id_table
 };
 
-static int dpio_driver_init(void)
+static int __init dpio_driver_init(void)
 {
 	if (!zalloc_cpumask_var(&cpus_unused_mask, GFP_KERNEL))
 		return -ENOMEM;
@@ -335,7 +335,7 @@ static int dpio_driver_init(void)
 	return fsl_mc_driver_register(&dpaa2_dpio_driver);
 }
 
-static void dpio_driver_exit(void)
+static void __exit dpio_driver_exit(void)
 {
 	free_cpumask_var(cpus_unused_mask);
 	fsl_mc_driver_unregister(&dpaa2_dpio_driver);
-- 
2.25.1

