Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C51066C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 08:05:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K6rX0KknzDr7m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 18:05:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="GYPjoCmr"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K5LJ49XJzDr0P
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 16:57:28 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76E542070A;
 Fri, 22 Nov 2019 05:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574402246;
 bh=CcGoJg+UihYBaV8Tf12lR+9gsdgjxSjD2C2kvFXqYcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GYPjoCmrfY0mpOMwmS8Btj+SlQtVk2zbDR7MgOvSOxHyczhGkGSIKlfYGIjK5agIV
 26xyicKy3VLpLYOZCeCBpPDtlcb66I9ZyPLiWV4LXLm6ebWq1b50n0wJpIOvPsXVpD
 pKjSal1gDr8jNkfwYNsUu9ubpHZrOTgkBLHfjnTQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 090/127] net/wan/fsl_ucc_hdlc: Avoid double free
 in ucc_hdlc_probe()
Date: Fri, 22 Nov 2019 00:55:08 -0500
Message-Id: <20191122055544.3299-89-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122055544.3299-1-sashal@kernel.org>
References: <20191122055544.3299-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Peng Hao <peng.hao2@zte.com.cn>,
 netdev@vger.kernel.org, Wen Yang <wen.yang99@zte.com.cn>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wen Yang <wen.yang99@zte.com.cn>

[ Upstream commit 40752b3eae29f8ca2378e978a02bd6dbeeb06d16 ]

This patch fixes potential double frees if register_hdlc_device() fails.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Reviewed-by: Peng Hao <peng.hao2@zte.com.cn>
CC: Zhao Qiang <qiang.zhao@nxp.com>
CC: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index 18b648648adb2..289dff262948d 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -1114,7 +1114,6 @@ static int ucc_hdlc_probe(struct platform_device *pdev)
 	if (register_hdlc_device(dev)) {
 		ret = -ENOBUFS;
 		pr_err("ucc_hdlc: unable to register hdlc device\n");
-		free_netdev(dev);
 		goto free_dev;
 	}
 
-- 
2.20.1

