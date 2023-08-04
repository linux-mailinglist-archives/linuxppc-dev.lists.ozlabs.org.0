Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC58E76FD73
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 11:36:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHLFM6Rk3z3ddq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 19:36:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHLC04gmCz3cJR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 19:34:20 +1000 (AEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RHL952BZLzrS7v;
	Fri,  4 Aug 2023 17:32:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 17:33:45 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <peter.chen@kernel.org>, <gregkh@linuxfoundation.org>,
	<leoyang.li@nxp.com>, <b-liu@ti.com>, <valentina.manea.m@gmail.com>,
	<shuah@kernel.org>, <i@zenithal.me>, <stern@rowland.harvard.edu>,
	<u.kleine-koenig@pengutronix.de>, <aaro.koskinen@iki.fi>,
	<void0red@gmail.com>, <linux-usb@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH -next 5/5] USB: usbip: Remove an unnecessary NULL value
Date: Fri, 4 Aug 2023 17:32:53 +0800
Message-ID: <20230804093253.91647-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804093253.91647-1-ruanjinjie@huawei.com>
References: <20230804093253.91647-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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

The NULL initialization of the pointers assigned by kzalloc() first is
not necessary, because if the kzalloc() failed, the pointers will be
assigned NULL, otherwise it works as usual. so remove it.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/usb/usbip/vudc_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index 2bc428f2e261..8e42839e6060 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -489,7 +489,7 @@ static void vudc_device_unusable(struct usbip_device *ud)
 
 struct vudc_device *alloc_vudc_device(int devid)
 {
-	struct vudc_device *udc_dev = NULL;
+	struct vudc_device *udc_dev;
 
 	udc_dev = kzalloc(sizeof(*udc_dev), GFP_KERNEL);
 	if (!udc_dev)
-- 
2.34.1

