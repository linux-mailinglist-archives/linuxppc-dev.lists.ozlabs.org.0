Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 446806CB1D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 00:32:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Plncr0sM8z3f6w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 09:32:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.174; helo=mail-oi1-f174.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlnbL1qp3z3fV6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 09:31:10 +1100 (AEDT)
Received: by mail-oi1-f174.google.com with SMTP id bk5so7596878oib.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 15:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679956268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3T4tQPH6yseYq9tiKoc4A725qEg2InFFgK6PxJmKvk=;
        b=1QJIJs9GSii9OHTMNqw/ZyY7foXGButa/Oktp2EOkTddZS2mkaYuH1SF5ivA8I3H0c
         gRBklPuZ/+A2IPhrfrsyhISwh+dI5oiumucxXys4kRaofXMbCChxF2HtrBiKue0LjHiu
         2BE2Ni6TRX3y4Le5M6BHd1TSTkwanTDx4KBT1jMvEhSVN1HjuoOgqpZKyIjoHH13hSIH
         aLUpzoQBQg62yOUkJFc5XWo6rLyGNRCGIXj2d8aZuNhLH6S3DYcRA4WuHGRa1hz4LZGE
         r2BCOZ+n1eA0IYpMs8Qqew0QqYJuWS4ICJCq2jwbYOVzhP2pI6VX8cTA4Ui37TDeVh6q
         cFcQ==
X-Gm-Message-State: AAQBX9dkbDDZAlk7QCwgVaWPj3JoTqHS3qDQPh9jZ8PoEYWxcX4nLPL4
	PErtlqSHSoz6ECcIjxPDhOOEQWvMsw==
X-Google-Smtp-Source: AKy350Zk9fdx957ft/lyOlvqpU79gtOtq2UNqXZUoynnWg3RzYArt60S35ZSNIz1Ifyt7mV6ni1VUw==
X-Received: by 2002:a05:6808:305:b0:388:f4de:b656 with SMTP id i5-20020a056808030500b00388f4deb656mr2981361oie.27.1679956267718;
        Mon, 27 Mar 2023 15:31:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z6-20020a4aae06000000b0051763d6497fsm11625480oom.38.2023.03.27.15.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 15:31:07 -0700 (PDT)
Received: (nullmailer pid 820323 invoked by uid 1000);
	Mon, 27 Mar 2023 22:31:06 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: fsl_rio: Use of_iomap()
Date: Mon, 27 Mar 2023 17:31:02 -0500
Message-Id: <20230327223103.820229-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace of_address_to_resource()+ioremap() with a call to of_iomap()
which does both of those steps.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/sysdev/fsl_rio.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index c8f044d62fe2..f8e492ee54cc 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -450,7 +450,6 @@ int fsl_rio_setup(struct platform_device *dev)
 	int rc = 0;
 	const u32 *dt_range, *cell, *port_index;
 	u32 active_ports = 0;
-	struct resource regs, rmu_regs;
 	struct device_node *np, *rmu_node;
 	int rlen;
 	u32 ccsr;
@@ -465,17 +464,7 @@ int fsl_rio_setup(struct platform_device *dev)
 		return -ENODEV;
 	}
 
-	rc = of_address_to_resource(dev->dev.of_node, 0, &regs);
-	if (rc) {
-		dev_err(&dev->dev, "Can't get %pOF property 'reg'\n",
-				dev->dev.of_node);
-		return -EFAULT;
-	}
-	dev_info(&dev->dev, "Of-device full name %pOF\n",
-			dev->dev.of_node);
-	dev_info(&dev->dev, "Regs: %pR\n", &regs);
-
-	rio_regs_win = ioremap(regs.start, resource_size(&regs));
+	rio_regs_win = of_iomap(dev->dev.of_node, 0);
 	if (!rio_regs_win) {
 		dev_err(&dev->dev, "Unable to map rio register window\n");
 		rc = -ENOMEM;
@@ -509,15 +498,9 @@ int fsl_rio_setup(struct platform_device *dev)
 		rc = -ENOENT;
 		goto err_rmu;
 	}
-	rc = of_address_to_resource(rmu_node, 0, &rmu_regs);
-	if (rc) {
-		dev_err(&dev->dev, "Can't get %pOF property 'reg'\n",
-				rmu_node);
-		of_node_put(rmu_node);
-		goto err_rmu;
-	}
+	rmu_regs_win = of_iomap(rmu_node, 0);
+
 	of_node_put(rmu_node);
-	rmu_regs_win = ioremap(rmu_regs.start, resource_size(&rmu_regs));
 	if (!rmu_regs_win) {
 		dev_err(&dev->dev, "Unable to map rmu register window\n");
 		rc = -ENOMEM;
-- 
2.39.2

