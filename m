Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2795176FD6D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 11:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHLDf0z5Gz3d8B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 19:35:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHLBP1MY6z30Py
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 19:33:47 +1000 (AEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RHL8C0NySzVjwb;
	Fri,  4 Aug 2023 17:31:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 17:33:41 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <peter.chen@kernel.org>, <gregkh@linuxfoundation.org>,
	<leoyang.li@nxp.com>, <b-liu@ti.com>, <valentina.manea.m@gmail.com>,
	<shuah@kernel.org>, <i@zenithal.me>, <stern@rowland.harvard.edu>,
	<u.kleine-koenig@pengutronix.de>, <aaro.koskinen@iki.fi>,
	<void0red@gmail.com>, <linux-usb@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH -next 1/5] usb: gadget: udc: Remove unnecessary NULL values
Date: Fri, 4 Aug 2023 17:32:49 +0800
Message-ID: <20230804093253.91647-2-ruanjinjie@huawei.com>
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
 drivers/usb/gadget/udc/fsl_udc_core.c | 2 +-
 drivers/usb/gadget/udc/mv_u3d_core.c  | 4 ++--
 drivers/usb/gadget/udc/mv_udc_core.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 5265ca418cde..ee5705d336e3 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -671,7 +671,7 @@ static int fsl_ep_disable(struct usb_ep *_ep)
 static struct usb_request *
 fsl_alloc_request(struct usb_ep *_ep, gfp_t gfp_flags)
 {
-	struct fsl_req *req = NULL;
+	struct fsl_req *req;
 
 	req = kzalloc(sizeof *req, gfp_flags);
 	if (!req)
diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
index 3473048a85f5..2a421f0ff931 100644
--- a/drivers/usb/gadget/udc/mv_u3d_core.c
+++ b/drivers/usb/gadget/udc/mv_u3d_core.c
@@ -665,7 +665,7 @@ static int  mv_u3d_ep_disable(struct usb_ep *_ep)
 static struct usb_request *
 mv_u3d_alloc_request(struct usb_ep *_ep, gfp_t gfp_flags)
 {
-	struct mv_u3d_req *req = NULL;
+	struct mv_u3d_req *req;
 
 	req = kzalloc(sizeof *req, gfp_flags);
 	if (!req)
@@ -1779,7 +1779,7 @@ static void mv_u3d_remove(struct platform_device *dev)
 
 static int mv_u3d_probe(struct platform_device *dev)
 {
-	struct mv_u3d *u3d = NULL;
+	struct mv_u3d *u3d;
 	struct mv_usb_platform_data *pdata = dev_get_platdata(&dev->dev);
 	int retval = 0;
 	struct resource *r;
diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/udc/mv_udc_core.c
index 79db74e2040b..d888dcda2bc8 100644
--- a/drivers/usb/gadget/udc/mv_udc_core.c
+++ b/drivers/usb/gadget/udc/mv_udc_core.c
@@ -595,7 +595,7 @@ static int  mv_ep_disable(struct usb_ep *_ep)
 static struct usb_request *
 mv_alloc_request(struct usb_ep *_ep, gfp_t gfp_flags)
 {
-	struct mv_req *req = NULL;
+	struct mv_req *req;
 
 	req = kzalloc(sizeof *req, gfp_flags);
 	if (!req)
-- 
2.34.1

