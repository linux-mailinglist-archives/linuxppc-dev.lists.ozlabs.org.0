Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF3359AD32
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 12:30:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8vzG1GRlz3cCy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 20:30:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hKibc8kv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hKibc8kv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8vyh0Nfpz3bd6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 20:30:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A61C461027;
	Sat, 20 Aug 2022 10:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF3FC433D6;
	Sat, 20 Aug 2022 10:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660991415;
	bh=5Sem2MQf+IZyyC+DHcRKkeVWonfrn1+/FxE8deI3vSk=;
	h=From:To:Cc:Subject:Date:From;
	b=hKibc8kvdqgNmlTp9kiYFyYjoqFM+L8jEsJGJhvwqG7vrMIgI2qL/0S5yuxYUd6EW
	 Q8dlCXC92YU9ZTtV33FrCbLqdJfUUuZzcIPCCArWCoKFSUB1qIEvOlulG5GUIKvTOA
	 bCy/VhB83GoZzO+0EKAxElV7S8elnVqa9CiTuIE+Uo30kA6MYUoXRVZOz42SS+os0S
	 cJKWKxorl62ZSjJjotc5hVfZae89Lwh6fL/ZdzUsUQgjTHZ4jthSKSHlWeTXhwUZAN
	 pYRYJMmX/fX+RWcfG2ImisOxzxun6kTMcGDZC457RaYqe4s1jtiaSeFbKn6Jr162t7
	 fkL9QeItCIDkw==
Received: by pali.im (Postfix)
	id C7E995D0; Sat, 20 Aug 2022 12:30:11 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/3] dt-bindings: reset: syscon-reboot: Add priority property
Date: Sat, 20 Aug 2022 12:29:23 +0200
Message-Id: <20220820102925.29476-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
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

This new optional priority property allows to specify custom priority level
of reset device. Default level was always 192.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 .../devicetree/bindings/power/reset/syscon-reboot.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
index da2509724812..d905133aab27 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
@@ -42,6 +42,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: The reset value written to the reboot register (32 bit access).
 
+  priority:
+    $ref: /schemas/types.yaml#/definitions/sint32
+    description: Priority level of this syscon reset device. Default 192.
+
 required:
   - compatible
   - offset
-- 
2.20.1

