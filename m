Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC576FD64
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 11:34:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHLBw3tZBz3cQr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 19:34:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHLBP1vDKz3btp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 19:33:47 +1000 (AEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RHL766VQZz1Z1Sc;
	Fri,  4 Aug 2023 17:30:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 17:33:43 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <peter.chen@kernel.org>, <gregkh@linuxfoundation.org>,
	<leoyang.li@nxp.com>, <b-liu@ti.com>, <valentina.manea.m@gmail.com>,
	<shuah@kernel.org>, <i@zenithal.me>, <stern@rowland.harvard.edu>,
	<u.kleine-koenig@pengutronix.de>, <aaro.koskinen@iki.fi>,
	<void0red@gmail.com>, <linux-usb@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH -next 2/5] USB: misc: Remove unnecessary NULL values
Date: Fri, 4 Aug 2023 17:32:50 +0800
Message-ID: <20230804093253.91647-3-ruanjinjie@huawei.com>
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
 drivers/usb/misc/cypress_cy7c63.c | 2 +-
 drivers/usb/misc/cytherm.c        | 2 +-
 drivers/usb/misc/usbsevseg.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/cypress_cy7c63.c b/drivers/usb/misc/cypress_cy7c63.c
index 14faec51d7a5..cecd7693b741 100644
--- a/drivers/usb/misc/cypress_cy7c63.c
+++ b/drivers/usb/misc/cypress_cy7c63.c
@@ -203,7 +203,7 @@ ATTRIBUTE_GROUPS(cypress);
 static int cypress_probe(struct usb_interface *interface,
 			 const struct usb_device_id *id)
 {
-	struct cypress *dev = NULL;
+	struct cypress *dev;
 	int retval = -ENOMEM;
 
 	/* allocate memory for our device state and initialize it */
diff --git a/drivers/usb/misc/cytherm.c b/drivers/usb/misc/cytherm.c
index 3e3802aaefa3..918833b471ea 100644
--- a/drivers/usb/misc/cytherm.c
+++ b/drivers/usb/misc/cytherm.c
@@ -304,7 +304,7 @@ static int cytherm_probe(struct usb_interface *interface,
 			 const struct usb_device_id *id)
 {
 	struct usb_device *udev = interface_to_usbdev(interface);
-	struct usb_cytherm *dev = NULL;
+	struct usb_cytherm *dev;
 	int retval = -ENOMEM;
 
 	dev = kzalloc (sizeof(struct usb_cytherm), GFP_KERNEL);
diff --git a/drivers/usb/misc/usbsevseg.c b/drivers/usb/misc/usbsevseg.c
index c3114d9bd128..546deff754ba 100644
--- a/drivers/usb/misc/usbsevseg.c
+++ b/drivers/usb/misc/usbsevseg.c
@@ -305,7 +305,7 @@ static int sevseg_probe(struct usb_interface *interface,
 	const struct usb_device_id *id)
 {
 	struct usb_device *udev = interface_to_usbdev(interface);
-	struct usb_sevsegdev *mydev = NULL;
+	struct usb_sevsegdev *mydev;
 	int rc = -ENOMEM;
 
 	mydev = kzalloc(sizeof(struct usb_sevsegdev), GFP_KERNEL);
-- 
2.34.1

