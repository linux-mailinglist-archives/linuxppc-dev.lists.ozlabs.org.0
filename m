Return-Path: <linuxppc-dev+bounces-4580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F869FFE65
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:33:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgP1Hf7z30Qb;
	Fri,  3 Jan 2025 05:32:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842752;
	cv=none; b=cTV0AQSY+xOd/S7TAML4mguzgXPd7oxS/tIhiubxKETcDFtIPBGeB5VmvGMUAGUNZRjIb8EFhVyKOqKtLgHXaxCm5zZKvvgvC8p4ArWrEWPnlSjxo0y8K4Pjf9lnoFN1plOpO3oIByrMJc4pRfb5yD4EieZGZYHiDLRqj1vlKSrZr+fZbDn93m6HfUO1z8aU9zjFzSTr7/V2MuUY5GHFyqccvNXOUUdkUfcRtw+PkomnsRLb67xZk4f2q9g6DdhBieOdyLFQcX2DN+yKXXq795MmFiwF8AEaCsaInngFgaoK4qkNtx+K1t6IK4z8LUo3u34ryyjUc0+BJxIiGQW09A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842752; c=relaxed/relaxed;
	bh=ljp0L3/x2X+irCUss9JtDG3mYBJnIDirvyHaphpJDrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2J90DdJVE3ro6sRVwxes0eMfnJ6WdBYNvgI+H8LpzToJa2vlQJ4ICjVwlQldfW+4H237A/gBYrDYLtl7JkQrTUWEaoNS8hXyZSuXlx1LjqFwg7Jg1aAGQwbTi5QaB4x+nJ0FmASKP4Z/UFlYIUbmuqXLCDaTnHqafkggppqnNw3EssNb5PbZr3NQoqOZBklygIYDnAwNtRpCbdM9h17Gk5yTz3k/go2OIgEoITubpDe99FJvZNZABlO7hOxn/RqpI7p35ksNx4r/0AEiXVoE4zWMa2Y2bjilFDRFzaLOZNgHMCqL7eIh+bdb1ItQFONoV3bouEYa7JdE4TjXAXbqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ELWALujH; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ELWALujH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgJ3l6Xz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D534A413F6;
	Thu,  2 Jan 2025 18:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71A21C4CEE1;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=1Wx3N1Rj294zXt2qu+m1lv0sm+YnNLnpQlLBVACfYCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ELWALujH8LgLxmg4iYqiMaRA5sCuqBlh7J4ZRAEQ+4H7QZ7xUvjbbUQqXz4NC0Fe+
	 +K38z2zfltFuZXL46+38751hE/DPVPBeNsbO92sZDyMdQ5+IxhlA1XFt7jH5fp0KQg
	 TfRxIHZaFC38RiNC8++m2GawccjD+K2x3s4B5y+FTiq6qBS29kMy2tcAnHkZTYtflS
	 64PE5uhrq3fcih0s5zlqT7/40xMlA07T9PQSIhZKqv4bqkuC0Ma7O20m6k3A3/jIqG
	 udJI43dqZiiNEpeGUWG8ucVkbnU3+VMm4PGfveWPXJk2ST8rRPPllj96hPrV90V6HW
	 kzVph8Zz1zFuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C03E77188;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:54 +0100
Subject: [PATCH 13/19] gpio: mpc8xxx: Add MPC8314 support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-13-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=815;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=IzujOZGh0Kdf7MR+FJDNa5Xge4jQ4IpjSUXuri6ZMCE=;
 b=Bg2Rwn5IPjZBCymZj2nPxRzynUvjtK0um3nebcnWTTRob7hfmVj+4hlVA6truDJxyBTZK1mYV
 E2XU37nLAAqCiLpCLQ1oQAs3PvepM7Q7YTnN9sKE6no/AuaZzWCsdZ7
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

GPIO input, output, and interrupts have been tested on a MPC8314E board.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 drivers/gpio/gpio-mpc8xxx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 24417c3247b0a832ad15fe93e9ba0339eac3b883..0cd4c36ae8aaf075a54795810d5eea755325d771 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -285,6 +285,7 @@ static const struct mpc8xxx_gpio_devtype mpc8xxx_gpio_devtype_default = {
 };
 
 static const struct of_device_id mpc8xxx_gpio_ids[] = {
+	{ .compatible = "fsl,mpc8314-gpio", },
 	{ .compatible = "fsl,mpc8349-gpio", },
 	{ .compatible = "fsl,mpc8572-gpio", .data = &mpc8572_gpio_devtype, },
 	{ .compatible = "fsl,mpc8610-gpio", },

-- 
2.45.2



