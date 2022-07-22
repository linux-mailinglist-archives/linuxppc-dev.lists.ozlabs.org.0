Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA757DD7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 11:31:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq42Z4HhQz3dpl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 19:31:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=X/zFVBe4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=123.126.97.2; helo=mail-m972.mail.163.com; envelope-from=williamsukatube@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=X/zFVBe4;
	dkim-atps=neutral
Received: from mail-m972.mail.163.com (mail-m972.mail.163.com [123.126.97.2])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq41q2k9yz3c1p
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 19:31:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ziL0e
	DO+Itprb1jVyXzk432mqBLHi0A8HJSQe35XEnE=; b=X/zFVBe41Y0YfBHGZegYs
	wYUKRLbDDxZ+9aR6NbLN1mXUlqNtMBUkvw/+FgFFuTCHKflUFKIU3Jc5gVXBQDkX
	P/ROprVSwK0EpS0rhBTYffeh6nZeK03Zk2nc2At9SIzuLhovr3fcxjvUV1CqulyV
	hVjkjaNDPaV6lfAKaFMQSM=
Received: from localhost.localdomain (unknown [123.58.221.99])
	by smtp2 (Coremail) with SMTP id GtxpCgDHafRNbtpiOJJjQg--.3043S2;
	Fri, 22 Jul 2022 17:30:54 +0800 (CST)
From: williamsukatube@163.com
To: qiang.zhao@nxp.com,
	leoyang.li@nxp.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: fsl: qe: Add check for platform_driver_register
Date: Fri, 22 Jul 2022 17:30:51 +0800
Message-Id: <20220722093051.2939076-1-williamsukatube@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GtxpCgDHafRNbtpiOJJjQg--.3043S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr4DCF47Gry3ZFyDur15urg_yoWDJrX_Cw
	4rW3W7Xr4kWF93GF17tw43Z3s29FsYvrnaqa10qasxta4xJw47Xan8ZF43C3WkXrs5XFWD
	GrnxZrySkw13WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5MMKtUUUUU==
X-Originating-IP: [123.58.221.99]
X-CM-SenderInfo: xzlozx5dpv3yxdwxuvi6rwjhhfrp/1tbiNw5Gg1WBo2SbIQAAsV
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
Cc: Hacash Robot <hacashRobot@santino.com>, William Dean <williamsukatube@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: William Dean <williamsukatube@gmail.com>

As platform_driver_register() could fail, it should be better
to deal with the return value in order to maintain the code
consisitency.

Fixes: be7ecbd240b2f ("soc: fsl: qe: convert QE interrupt controller to platform_device")
Reported-by: Hacash Robot <hacashRobot@santino.com>
Signed-off-by: William Dean <williamsukatube@gmail.com>
---
 drivers/soc/fsl/qe/qe_ic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index bbae3d39c7be..f17de6000ff2 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -481,7 +481,6 @@ static struct platform_driver qe_ic_driver =
 
 static int __init qe_ic_of_init(void)
 {
-	platform_driver_register(&qe_ic_driver);
-	return 0;
+	return platform_driver_register(&qe_ic_driver);
 }
 subsys_initcall(qe_ic_of_init);
-- 
2.25.1

