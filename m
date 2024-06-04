Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A5D8FBB33
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 20:06:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O4BjjGL1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtz6h6s1Lz3cZ7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 04:06:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O4BjjGL1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mwalle@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vtt9J03pHz3cRB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 00:22:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8F3C61313;
	Tue,  4 Jun 2024 14:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9A7C4AF08;
	Tue,  4 Jun 2024 14:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717510978;
	bh=Rza3AQe0a3SXtORn/8/XtydHawqSRh9ZUCHPjhrTxJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O4BjjGL1G/gcalPFiBU93TwzEpLqHUyyQtI/rjPQJSp2+wZia1/c13dv54hfduGdX
	 TdDNiJStVtMBMcGFVMramwz6q4qIvXr3orkEIDBt3PYeu1WHXy9OT7e/zqHB0DCLtx
	 9P7tt2wm5dWjRKwH66Tkd4ELsjHP7O3cCiArtSZvCrP63tvbRVei+hHE2LAUOYmMsW
	 5F/j0aYOayvSAF6DYMXNOrIgEuHcefS5b+x+n00Jd7/89dxs3H8Se8XaSbasyJQTUy
	 eQJgOt5VdIwHKhJDoVqKPH+iFxgo5E2Aua2NPKjf+kWpriBjwW9wHx4yvIhAzyEoLT
	 v4QhcXDE1uQyQ==
From: Michael Walle <mwalle@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [RFC PATCH 2/2] dt-bindings: memory: fsl: replace maintainer
Date: Tue,  4 Jun 2024 16:22:49 +0200
Message-Id: <20240604142249.1957762-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240604142249.1957762-1-mwalle@kernel.org>
References: <20240604142249.1957762-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 05 Jun 2024 03:59:10 +1000
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
Cc: devicetree@vger.kernel.org, Michael Walle <mwalle@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Li Yang's mail address is bouncing, replace it with Shawn Guo's one.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
This is marked as an RFC because it is more of a question for Shawn if
he is willing to take over the maintainership.
---
 .../devicetree/bindings/memory-controllers/fsl/fsl,ifc.yaml     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/fsl,ifc.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl/fsl,ifc.yaml
index 3be1db30bf41..d1c3421bee10 100644
--- a/Documentation/devicetree/bindings/memory-controllers/fsl/fsl,ifc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/fsl,ifc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: FSL/NXP Integrated Flash Controller
 
 maintainers:
-  - Li Yang <leoyang.li@nxp.com>
+  - Shawn Guo <shawnguo@kernel.org>
 
 description: |
   NXP's integrated flash controller (IFC) is an advanced version of the
-- 
2.39.2

