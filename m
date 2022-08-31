Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A2E5A78D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 10:19:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHcXv2xR7z3dp8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 18:19:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ay5bfd7L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ay5bfd7L;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHcW408vdz3bjX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 18:18:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 677A4B81FB0;
	Wed, 31 Aug 2022 08:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD68C433D6;
	Wed, 31 Aug 2022 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661933882;
	bh=xyFTl9ErRj77KZSCzkjC/ob/fuCmtgD6a+3LQbWto7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ay5bfd7LGGe8NQPLlBqSLhJ/QcXkrb9ovh2q2UjSlrlkbG9p0oWIijI+BdlmxbZ6i
	 vvfvgsFre8UzMPBcjiYKmbdoRpV9D4PWIPLicSS6dhxh0hEeu2jLbFSTcWA/Cl7m3K
	 5Hez9Bb1F9pRgOAsx4YTt6EoJf/2w2WiwN9VZ3bhG4uN7exzRG7vmWkxCy0mkqFGXh
	 eDiHpnO593CMMbHkQ39txUpdLcO1URUBYnQg6ws4zFQabukw8NQvERJZu+NwWqHM0M
	 vPzHHP2r84QepfGuxT0Dz+fpKfgL6ZWBpfCYhfUg4Hr3CpkHDmv+pbSQK/cFqSDlgp
	 G0CDEv2SIt93Q==
Received: by pali.im (Postfix)
	id B89B7855; Wed, 31 Aug 2022 10:17:59 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 1/3] dt-bindings: reset: syscon-reboot: Add priority property
Date: Wed, 31 Aug 2022 10:17:13 +0200
Message-Id: <20220831081715.14673-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220820102925.29476-1-pali@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
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
of reset device. Prior this change priority level was hardcoded to 192 and
not possible to specify or change. Specifying other value is needed for
some boards. Default level when not specified stays at 192 as before.

Signed-off-by: Pali Rohár <pali@kernel.org>

---
Changes in v3:
* Add explanation into commit message

Changes in v2:
* Change sint32 to int32
* Add default
---
 .../devicetree/bindings/power/reset/syscon-reboot.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
index da2509724812..4c8b0d0a0111 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot.yaml
@@ -42,6 +42,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: The reset value written to the reboot register (32 bit access).
 
+  priority:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description: Priority level of this syscon reset device.
+    default: 192
+
 required:
   - compatible
   - offset
-- 
2.20.1

