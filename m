Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B3B3C2DF0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 04:25:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GMDQr1VQpz3dYN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 12:25:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QsN8rvnd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QsN8rvnd; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GMDP44p95z3ccg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jul 2021 12:24:08 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A6B361413;
 Sat, 10 Jul 2021 02:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883846;
 bh=kHoNxcXkLQ7IZeRw/l1gGdNDWqkuAu2OTklmpYUs87A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QsN8rvndpypw4cCD5G00YUSvCibigulwfeUxD8EPUl9uUVnQPAGM81nSv16cWZBgF
 3AQHeZwTJZM+ti75gNlWIsloMojDRbNpOH0CUFkc/E3dHN641zTCyeKdgDJCrOouJg
 IZ9vr5A/aFs5WZUwCxaCQVHzrlAJrIkvoQMBOA3/ZmAJYOWhFziUp/CAYvoOmybbcL
 SY5HHfKhuMAIZmlwxe+txEL4ZjdcjdOb6gjp4R5NhvQS8Ax4m1U0g1wjxkowyIapIr
 yhya3oqMwO7rZqVHTNMgSdHnsQyS7r8ymSK/rc2Kxx6i2F4bOF2gcKGbXS3wxUxdrL
 p1as2ssZOcflA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 091/104] ASoC: fsl_xcvr: check return value after
 calling platform_get_resource_byname()
Date: Fri,  9 Jul 2021 22:21:43 -0400
Message-Id: <20210710022156.3168825-91-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022156.3168825-1-sashal@kernel.org>
References: <20210710022156.3168825-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Yang Yingliang <yangyingliang@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Yang Yingliang <yangyingliang@huawei.com>

[ Upstream commit a2f6ed4a44721d3a9fdf4da7e0743cb13866bf61 ]

It will cause null-ptr-deref if platform_get_resource_byname() returns NULL,
we need check the return value.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Link: https://lore.kernel.org/r/20210615013922.784296-10-yangyingliang@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_xcvr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 6dd0a5fcd455..dc7f914816c6 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1205,6 +1205,10 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 
 	rx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rxfifo");
 	tx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "txfifo");
+	if (!rx_res || !tx_res) {
+		dev_err(dev, "could not find rxfifo or txfifo resource\n");
+		return -EINVAL;
+	}
 	xcvr->dma_prms_rx.chan_name = "rx";
 	xcvr->dma_prms_tx.chan_name = "tx";
 	xcvr->dma_prms_rx.addr = rx_res->start;
-- 
2.30.2

