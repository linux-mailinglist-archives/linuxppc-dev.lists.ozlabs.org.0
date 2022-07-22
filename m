Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A4557DB79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 09:45:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq1gN2X18z3dqC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 17:45:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=H6wJGJMC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=123.126.97.1; helo=mail-m971.mail.163.com; envelope-from=williamsukatube@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=H6wJGJMC;
	dkim-atps=neutral
X-Greylist: delayed 960 seconds by postgrey-1.36 at boromir; Fri, 22 Jul 2022 13:35:40 AEST
Received: from mail-m971.mail.163.com (mail-m971.mail.163.com [123.126.97.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lpw7c5rQ1z306l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 13:35:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7cumI
	2k40Wf2jTZSpS1C8fFLwUssOL1MQc8JznRXgeA=; b=H6wJGJMC7WvNEDD8YHhXS
	mnYfVaUXUQdPVRhEaZjlPTlZirNDOK5hho/V12T9YVD34wRkF3vpbz1q3kLRXO74
	q6ZSWP05WxZcubn4KUCPz34HZqs+NNVCDuJWUPgvnMQxim+Lro5oodXGSyRUOI1J
	ZXsgl5MsAYmXsarcSb/8yw=
Received: from localhost.localdomain (unknown [123.58.221.99])
	by smtp1 (Coremail) with SMTP id GdxpCgCXvZQzF9piBKLzPg--.1899S2;
	Fri, 22 Jul 2022 11:19:16 +0800 (CST)
From: williamsukatube@163.com
To: ran.wang_1@nxp.com,
	balbi@kernel.org,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: phy: check the return value of ioremap() in usb_otg_start()
Date: Fri, 22 Jul 2022 11:19:13 +0800
Message-Id: <20220722031913.2925655-1-williamsukatube@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GdxpCgCXvZQzF9piBKLzPg--.1899S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWrZrW3uFW8Jw13XFW7CFg_yoWfuwb_AF
	1rWFyxWrWkGF15Kr17Jryfua4DKw4qvr98XF4vqr98tw1jvF18Xr93Za93WFyUXrWrJFWD
	Gwn8ZFW8ZF1xWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5uxRDUUUUU==
X-Originating-IP: [123.58.221.99]
X-CM-SenderInfo: xzlozx5dpv3yxdwxuvi6rwjhhfrp/1tbiNxRGg1WBo2GhmQAAsI
X-Mailman-Approved-At: Fri, 22 Jul 2022 17:44:34 +1000
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
Cc: Hacash Robot <hacashRobot@santino.com>, gregkh@linuxfoundation.org, William Dean <williamsukatube@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: William Dean <williamsukatube@gmail.com>

The function ioremap() in usb_otg_start() can fail, so
its return value should be checked.

Fixes: 0807c500a1a6d ("USB: add Freescale USB OTG Transceiver driver")
Reported-by: Hacash Robot <hacashRobot@santino.com>
Signed-off-by: William Dean <williamsukatube@gmail.com>
---
 drivers/usb/phy/phy-fsl-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 972704262b02..21b3b2d57358 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -855,6 +855,8 @@ int usb_otg_start(struct platform_device *pdev)
 	 * with host/device */
 
 	usb_dr_regs = ioremap(res->start, sizeof(struct usb_dr_mmap));
+	if (!usb_dr_regs)
+		return -ENOMEM;
 	p_otg->dr_mem_map = (struct usb_dr_mmap *)usb_dr_regs;
 	pdata->regs = (void *)usb_dr_regs;
 
-- 
2.25.1

