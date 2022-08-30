Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA7E5A7150
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 01:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHN8z0qjkz3chc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 09:01:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DCQd396Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DCQd396Y;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHN7n448Bz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 09:00:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BFC1661604;
	Tue, 30 Aug 2022 23:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C239C433D6;
	Tue, 30 Aug 2022 23:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661900434;
	bh=WsFP+jr/JWJOetQbqvy3jJUBEs3QY1vpJJXVmKgr98I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DCQd396YFLgvuF4XThnikjVixCDiSZOaINBCx35IpPqiz5QbcT7s26bFCXwG0c21e
	 PXYKnc9IzRbYzQLOu4MHgp3h7yMs2KlNhf3ctwmo+y+NjN6n+VV/418wj5hCxyxRU8
	 anvOsHeViJNMXcuVXZqZGz2Y0rbQ86vampAqqeUm/jL8Td0ydG0famYqt05Say96n2
	 tvzCiQ0wM72LNF0wRA7nz36tYg5K2577ZzpDQKqpctjzxxue5JOkhKRfWgWmMwUH8W
	 87dXenm3LoEKrhWxMRzObcGi1TAJYg6TIj2Zl4qpC1OW/KSFDP5WQbks1FIIYPKQlW
	 7Qtad5T7pPRQw==
Received: by pali.im (Postfix)
	id 72ECD834; Wed, 31 Aug 2022 01:00:31 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/3] power: reset: syscon-reboot: Add support for specifying priority
Date: Wed, 31 Aug 2022 01:00:11 +0200
Message-Id: <20220830230012.9429-2-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220830230012.9429-1-pali@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220830230012.9429-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Read new optional device tree property priority for specifying priority
level of reset handler. Default value is 192 as before.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 drivers/power/reset/syscon-reboot.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/power/reset/syscon-reboot.c b/drivers/power/reset/syscon-reboot.c
index 510e363381ca..45e34e6885f7 100644
--- a/drivers/power/reset/syscon-reboot.c
+++ b/drivers/power/reset/syscon-reboot.c
@@ -44,6 +44,7 @@ static int syscon_reboot_probe(struct platform_device *pdev)
 	struct syscon_reboot_context *ctx;
 	struct device *dev = &pdev->dev;
 	int mask_err, value_err;
+	int priority;
 	int err;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -57,6 +58,9 @@ static int syscon_reboot_probe(struct platform_device *pdev)
 			return PTR_ERR(ctx->map);
 	}
 
+	if (of_property_read_s32(pdev->dev.of_node, "priority", &priority))
+		priority = 192;
+
 	if (of_property_read_u32(pdev->dev.of_node, "offset", &ctx->offset))
 		return -EINVAL;
 
@@ -77,7 +81,7 @@ static int syscon_reboot_probe(struct platform_device *pdev)
 	}
 
 	ctx->restart_handler.notifier_call = syscon_restart_handle;
-	ctx->restart_handler.priority = 192;
+	ctx->restart_handler.priority = priority;
 	err = register_restart_handler(&ctx->restart_handler);
 	if (err)
 		dev_err(dev, "can't register restart notifier (err=%d)\n", err);
-- 
2.20.1

