Return-Path: <linuxppc-dev+bounces-5930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8659CA2B88B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 03:00:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypxy81NQMz30Sw;
	Fri,  7 Feb 2025 13:00:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738893632;
	cv=none; b=XMz3v66mUP8IyVBFcOoRHN+TlI9gpv5mpNDBOhJyGgNxRnUHjcuI0z7EwvIv4760c1iMKBD3L7m2mdWh63Sa+RJaA6NuahRO1cUT6vBjSMATdtsYoYJ/gxkN4SIisrLuZyZJMVMhOwkiwhAeSC04PloEWzvizOvDzm8rdtXXxVZlLWMJ7ONxJG3a4VrNDPlFCUpfYQ+7vb7RUYDtvuZ4XySlMNTGPAi6p57iyOO0TltcTfAOITqxftzPsk/nSf8RUOU0Wxv1hkyKAHR/S/ax2X6SdvoQDOkL2ryVtcPDjzgML3606xlWkVvNpDr4daX31QmK12SeT4OeP+bKIX7TRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738893632; c=relaxed/relaxed;
	bh=PTkeh7Lg3Tg0USbnDo/INU8GjWxzN8MTA7FhsJ/9ELk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yre5hCFrAV6vUgsHR+Ow0yqiX/XcThXLM+9OQC49aG5aMq3c0hbC8dEF6PYdV39Fg7xrUFonJE9DmDVye81XGyOdAx1YBCexE1Zj/6wBJWUOeM9u+WsNbV3lFNw6z2e7/RAKR4/W7G8uTA0Q2fh101XdLYkBhd+H6TjTwL6B29XSXzt4YSrU+4GDNqu/3XkHlN4ARhyrJ004OTNw2KiJC4rpifwM/DTdCFlp8UXeUIRXEoQR/8z0Kp639AIamwdR0Jx9jFB3wonSrhr2ruuTMTdhG1BF5D4yzlTsfJFDfE7NBnM+fEfpZvG4MKMfE4LKODRslmIRyJVVzRVct1bjHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypxy72lgJz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 13:00:31 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YpxPN4fb4z11Pg3;
	Fri,  7 Feb 2025 09:35:36 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id F249D180064;
	Fri,  7 Feb 2025 09:39:56 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Feb
 2025 09:39:54 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <robh@kernel.org>, <saravanak@google.com>, <justin.chen@broadcom.com>,
	<florian.fainelli@broadcom.com>, <andrew+netdev@lunn.ch>, <kuba@kernel.org>,
	<o.rempel@pengutronix.de>, <kory.maincent@bootlin.com>,
	<jacopo+renesas@jmondi.org>, <kieran.bingham+renesas@ideasonboard.com>,
	<laurent.pinchart+renesas@ideasonboard.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <olteanv@gmail.com>,
	<davem@davemloft.net>, <taras.chornyi@plvision.eu>, <edumazet@google.com>,
	<pabeni@redhat.com>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <arm-scmi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <chenjun102@huawei.com>,
	<zhangzekun11@huawei.com>
Subject: [PATCH 9/9] regulator: scmi: Use of_find_node_by_name_balanced() to find device_node
Date: Fri, 7 Feb 2025 09:31:17 +0800
Message-ID: <20250207013117.104205-10-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20250207013117.104205-1-zhangzekun11@huawei.com>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Instead of directly using of_node_get() before of_find_node_by_name()
to balance the refcount of the device_node, using wraper function
of_find_node_by_name_balanced() to make code logic a bit simplier.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/regulator/scmi-regulator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/regulator/scmi-regulator.c b/drivers/regulator/scmi-regulator.c
index 9df726f10ad1..11f75c13bdf0 100644
--- a/drivers/regulator/scmi-regulator.c
+++ b/drivers/regulator/scmi-regulator.c
@@ -339,8 +339,7 @@ static int scmi_regulator_probe(struct scmi_device *sdev)
 	 * plausible SCMI Voltage Domain number, all belonging to this SCMI
 	 * platform instance node (handle->dev->of_node).
 	 */
-	of_node_get(handle->dev->of_node);
-	np = of_find_node_by_name(handle->dev->of_node, "regulators");
+	np = of_find_node_by_name_balanced(handle->dev->of_node, "regulators");
 	for_each_child_of_node_scoped(np, child) {
 		ret = process_scmi_regulator_of_node(sdev, ph, child, rinfo);
 		/* abort on any mem issue */
-- 
2.22.0


