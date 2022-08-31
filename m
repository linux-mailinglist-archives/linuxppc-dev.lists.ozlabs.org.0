Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5105A78CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 10:19:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHcXD1g81z3cdd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 18:19:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=knBS0dcQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=knBS0dcQ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHcW20sbXz3bZB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 18:18:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 73FC2619A3;
	Wed, 31 Aug 2022 08:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF711C433B5;
	Wed, 31 Aug 2022 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661933883;
	bh=WsFP+jr/JWJOetQbqvy3jJUBEs3QY1vpJJXVmKgr98I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=knBS0dcQjfKc48i5QOsOfeww8pren3brLTDhKgTT6U1NIdB98mm/E6fqo79/kSArQ
	 9977S8a3XBPCTrgKoTnavYuK5yUxeTzVQ6tDQP8ipn8fIpRGRnuT6OrDTOsHAyQYYn
	 4L6lrdOwK7HyPh0CMbOsCOZOynmN4YCO8mIiYLFud4IMQo9DsQuPVEQktrpNCOqQ/R
	 EzaXXWyX115uRC4g9e3JLi5bP5vpOT3Txjrz10hybLLKk/5BVd7uATyVdDU8fPKA4I
	 +wyNKqrcjb3ynP3/hDpqVTYUluKMx2VQyoB2+dog/TGYceCM4nYj96u3dgddmjQeM2
	 Waf+uwNFzptCg==
Received: by pali.im (Postfix)
	id 1F81D127C; Wed, 31 Aug 2022 10:18:00 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 2/3] power: reset: syscon-reboot: Add support for specifying priority
Date: Wed, 31 Aug 2022 10:17:14 +0200
Message-Id: <20220831081715.14673-2-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220831081715.14673-1-pali@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
 <20220831081715.14673-1-pali@kernel.org>
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

