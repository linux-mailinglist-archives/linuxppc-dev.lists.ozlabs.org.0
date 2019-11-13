Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D3FA5E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 03:25:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CT410g13zF4j0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 13:25:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="pcg1bHC1"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CSMD2XQJzF1tk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 12:53:44 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F383222CD;
 Wed, 13 Nov 2019 01:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573610022;
 bh=NouXRorkRrtpgDixB7XImri5OC4Rykp1q93l1bDDyYU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pcg1bHC1Z2DASpuAe678wbG2I95Unqb1w9un7phbNKO6BxJc1VJDvUtmilQLwuDWa
 VrXdwHKfg6tVDkQFCw+w0ww9bZvtEyqxZW28/RW4xNoTZ6d5Cnhc9myoO6V86E3cuF
 vIMp9VR0FulJ4JVnAx8J54XQbn0vdmZbF/kWBLOM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 122/209] soc: fsl: bman_portals: defer probe
 after bman's probe
Date: Tue, 12 Nov 2019 20:48:58 -0500
Message-Id: <20191113015025.9685-122-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015025.9685-1-sashal@kernel.org>
References: <20191113015025.9685-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

[ Upstream commit e0940b34c40e95d1879691d2474d182c57aae0de ]

A crash in bman portal probing could not be triggered (as is the case
with qman portals) but it does make calls [1] into the bman driver so
lets make sure the bman portal probing happens after bman's.

[1]  bman_p_irqsource_add() (in bman) called by:
       init_pcfg() called by:
         bman_portal_probe()

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Signed-off-by: Li Yang <leoyang.li@nxp.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/fsl/qbman/bman_portal.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/bman_portal.c b/drivers/soc/fsl/qbman/bman_portal.c
index 2f71f7df3465a..f9edd28894fda 100644
--- a/drivers/soc/fsl/qbman/bman_portal.c
+++ b/drivers/soc/fsl/qbman/bman_portal.c
@@ -91,7 +91,15 @@ static int bman_portal_probe(struct platform_device *pdev)
 	struct device_node *node = dev->of_node;
 	struct bm_portal_config *pcfg;
 	struct resource *addr_phys[2];
-	int irq, cpu;
+	int irq, cpu, err;
+
+	err = bman_is_probed();
+	if (!err)
+		return -EPROBE_DEFER;
+	if (err < 0) {
+		dev_err(&pdev->dev, "failing probe due to bman probe error\n");
+		return -ENODEV;
+	}
 
 	pcfg = devm_kmalloc(dev, sizeof(*pcfg), GFP_KERNEL);
 	if (!pcfg)
-- 
2.20.1

