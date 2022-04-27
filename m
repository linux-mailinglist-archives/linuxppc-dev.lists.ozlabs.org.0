Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AFA511312
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 09:56:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpB0V4G9Xz3cS4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 17:56:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=ISwvpTkT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=ISwvpTkT; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp9xD3Sqsz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 17:53:52 +1000 (AEST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C1B55221D4;
 Wed, 27 Apr 2022 09:53:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1651046024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MWEUJ65xXWxsOJoEBYb6OiJI9nm2vcZAzwPP79rJezw=;
 b=ISwvpTkTdIjkH410nQc3wKfzj5HuNCcoV6P66P38iTcySXiCcerHt70giJyG2GQ5O1z6a7
 lEBreCV41bbcHA5i4ZrRVrNE1jAxVRV0HlKth63PW9VPzQzDA24h4CCbFJHx35T2oI27x5
 Tkf8Ov2C9+ylnCxcF4Fq+RhlTi49EiM=
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 0/4] dt-bindings: convert freescale extirq and scfg schemas
Date: Wed, 27 Apr 2022 09:53:34 +0200
Message-Id: <20220427075338.1156449-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
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
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Michael Walle <michael@walle.cc>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The first two patches will be resend to the soc tree once the schema is
approved/picked up.

Please note, I'm still getting these weird "is too short" errors for
for interrupt-map entries, but it seems to work for you, so.. ;)

Michael Walle (4):
  ARM: dts: ls1021a: reduce the interrupt-map-mask
  arm64: dts: freescale: reduce the interrup-map-mask
  dt-bindings: interrupt-controller: fsl,ls-extirq: convert to YAML
  dt-bindings: fsl: convert fsl,layerscape-scfg to YAML

 .../arm/freescale/fsl,layerscape-scfg.txt     |  19 ---
 .../interrupt-controller/fsl,ls-extirq.txt    |  53 --------
 .../interrupt-controller/fsl,ls-extirq.yaml   | 118 ++++++++++++++++++
 .../bindings/soc/fsl/fsl,layerscape-scfg.yaml |  58 +++++++++
 arch/arm/boot/dts/ls1021a.dtsi                |   2 +-
 .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi |   2 +-
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   2 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   2 +-
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi |   2 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi |   2 +-
 10 files changed, 182 insertions(+), 78 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-scfg.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml

-- 
2.30.2

