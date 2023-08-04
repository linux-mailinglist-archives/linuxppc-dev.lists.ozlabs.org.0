Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE4876FD6B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 11:35:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHLD21Vfrz3dHn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 19:35:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHLBP1qS2z3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 19:33:47 +1000 (AEST)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RHL9030ykz1KC70;
	Fri,  4 Aug 2023 17:32:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 17:33:40 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <peter.chen@kernel.org>, <gregkh@linuxfoundation.org>,
	<leoyang.li@nxp.com>, <b-liu@ti.com>, <valentina.manea.m@gmail.com>,
	<shuah@kernel.org>, <i@zenithal.me>, <stern@rowland.harvard.edu>,
	<u.kleine-koenig@pengutronix.de>, <aaro.koskinen@iki.fi>,
	<void0red@gmail.com>, <linux-usb@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH -next 0/5] usb: Remove many unnecessary NULL values
Date: Fri, 4 Aug 2023 17:32:48 +0800
Message-ID: <20230804093253.91647-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

Ruan Jinjie (5):
  usb: gadget: udc: Remove unnecessary NULL values
  USB: misc: Remove unnecessary NULL values
  usb: chipidea: udc: Remove an unnecessary NULL value
  usb: musb: Remove an unnecessary NULL value
  USB: usbip: Remove an unnecessary NULL value

 drivers/usb/chipidea/udc.c            | 2 +-
 drivers/usb/gadget/udc/fsl_udc_core.c | 2 +-
 drivers/usb/gadget/udc/mv_u3d_core.c  | 4 ++--
 drivers/usb/gadget/udc/mv_udc_core.c  | 2 +-
 drivers/usb/misc/cypress_cy7c63.c     | 2 +-
 drivers/usb/misc/cytherm.c            | 2 +-
 drivers/usb/misc/usbsevseg.c          | 2 +-
 drivers/usb/musb/musb_gadget.c        | 2 +-
 drivers/usb/usbip/vudc_dev.c          | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.34.1

