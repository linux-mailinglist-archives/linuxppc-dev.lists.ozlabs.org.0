Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4CD23BBE0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 16:18:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLcL50tMjzDqWK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 00:18:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=wanghai38@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLcFy6tLqzDqG1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 00:14:42 +1000 (AEST)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8C271A78127EB8E234D3;
 Tue,  4 Aug 2020 21:58:36 +0800 (CST)
Received: from huawei.com (10.175.113.133) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 4 Aug 2020
 21:58:31 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <qiang.zhao@nxp.com>, <leoyang.li@nxp.com>
Subject: [PATCH -next] soc: fsl: qe: Remove unnessesary check in
 ucc_set_tdm_rxtx_clk
Date: Tue, 4 Aug 2020 21:56:44 +0800
Message-ID: <20200804135644.58878-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.113.133]
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix smatch warning:

drivers/soc/fsl/qe/ucc.c:526
 ucc_set_tdm_rxtx_clk() warn: unsigned 'tdm_num' is never less than zero.

'tdm_num' is u32 type, never less than zero.

Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/soc/fsl/qe/ucc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/ucc.c b/drivers/soc/fsl/qe/ucc.c
index cac0fb7693a0..21dbcd787cd5 100644
--- a/drivers/soc/fsl/qe/ucc.c
+++ b/drivers/soc/fsl/qe/ucc.c
@@ -523,7 +523,7 @@ int ucc_set_tdm_rxtx_clk(u32 tdm_num, enum qe_clock clock,
 
 	qe_mux_reg = &qe_immr->qmx;
 
-	if (tdm_num > 7 || tdm_num < 0)
+	if (tdm_num > 7)
 		return -EINVAL;
 
 	/* The communications direction must be RX or TX */
-- 
2.17.1

