Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3692176FFEF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 14:05:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHPYn1K8qz3cT8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 22:05:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=lizetao1@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1147 seconds by postgrey-1.37 at boromir; Fri, 04 Aug 2023 19:41:11 AEST
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHLLv0H9gz2yTv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 19:41:10 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RHKvP3Cxcz1KCGF;
	Fri,  4 Aug 2023 17:20:49 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 17:21:53 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <Roy.Pledge@nxp.com>, <leoyang.li@nxp.com>
Subject: [PATCH -next] soc: fsl: dpio: Remove redundant initialization owner in dpaa2_dpio_driver
Date: Fri, 4 Aug 2023 17:21:25 +0800
Message-ID: <20230804092125.81901-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 04 Aug 2023 22:05:22 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, lizetao1@huawei.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The fsl_mc_driver_register() will set "THIS_MODULE" to driver.owner when
register a fsl_mc_driver driver, so it is redundant initialization to set
driver.owner in dpaa2_dpio_driver statement. Remove it for clean code.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/soc/fsl/dpio/dpio-driver.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/dpio-driver.c
index 9e3fddd8f5a9..6be4f1caafcb 100644
--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -312,7 +312,6 @@ static const struct fsl_mc_device_id dpaa2_dpio_match_id_table[] = {
 static struct fsl_mc_driver dpaa2_dpio_driver = {
 	.driver = {
 		.name		= KBUILD_MODNAME,
-		.owner		= THIS_MODULE,
 	},
 	.probe		= dpaa2_dpio_probe,
 	.remove		= dpaa2_dpio_remove,
-- 
2.34.1

