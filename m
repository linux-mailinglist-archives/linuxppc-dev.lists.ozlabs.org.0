Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A467A42CEEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 00:59:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV7K01J5Xz2ywQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 09:59:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=phobos-20191101 header.b=KpYq53aV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=denx.de
 (client-ip=85.214.62.61; helo=phobos.denx.de; envelope-from=agust@denx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=KpYq53aV; 
 dkim-atps=neutral
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV7JK0gm3z2yMg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 09:59:11 +1100 (AEDT)
Received: from crub.agik.hopto.org (pd95f1d7c.dip0.t-ipconnect.de
 [217.95.29.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 962AF83637;
 Thu, 14 Oct 2021 00:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634165946;
 bh=SeAa2jyjc7PWtTZOmeNlHFKytMn9TpnrK/xPF2MC5dc=;
 h=From:To:Cc:Subject:Date:From;
 b=KpYq53aVHyNIf0rM4fDbMA5Rd5A09mj4fU5gKNf5uZg8iSPzBb4hbIeJtnf5goKdj
 TxifS5dsiJv7JRSDLSLF6wGCdb8klqm9Wy+mWtyrl7Gy7iPnRSQ4LnjKgzB+D3YrFK
 Ykm7RQrKrosqjbgAajlvd4Jk/amBhJx146c5i9/2TCi0cgl0UR+X/ujqzdS2Y0DhXj
 QSVJD5Hj7dclGuC7nFWGjHgJqlyXpXbyqA17kWJjknn3jUn+lSZXGae+pkRC/jniiS
 7BV3XQ2FkFXuupas1AYG6xNuS54wSoCL4eKKv0Y8SOBE8zJ/qV4NFE3cCFLLxNIJtB
 5N4APjRRapMqg==
From: Anatolij Gustschin <agust@denx.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/5200: dts: fix psc node warning
Date: Thu, 14 Oct 2021 00:59:04 +0200
Message-Id: <20211013225904.1548-1-agust@denx.de>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix build warning:
Warning (spi_bus_bridge): /soc5200@f0000000/psc@2000: node name for SPI buses should be 'spi'

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 arch/powerpc/boot/dts/motionpro.dts | 4 ++++
 arch/powerpc/boot/dts/o2d.dtsi      | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/motionpro.dts b/arch/powerpc/boot/dts/motionpro.dts
index 09f0eaa4ad49..cc217ddd50a0 100644
--- a/arch/powerpc/boot/dts/motionpro.dts
+++ b/arch/powerpc/boot/dts/motionpro.dts
@@ -19,6 +19,8 @@
 	label = "motionpro-readyled";
 };
 
+/delete-node/ &psc2;
+
 / {
 	model = "promess,motionpro";
 	compatible = "promess,motionpro";
@@ -35,6 +37,8 @@
 		// PSC2 in spi master mode 
 		psc@2200 {		// PSC2
 			compatible = "fsl,mpc5200b-psc-spi","fsl,mpc5200-psc-spi";
+			reg = <0x2200 0x100>;
+			interrupts = <2 2 0>;
 			cell-index = <1>;
 		};
 
diff --git a/arch/powerpc/boot/dts/o2d.dtsi b/arch/powerpc/boot/dts/o2d.dtsi
index 898fe08a9fd0..34a836a37084 100644
--- a/arch/powerpc/boot/dts/o2d.dtsi
+++ b/arch/powerpc/boot/dts/o2d.dtsi
@@ -15,6 +15,8 @@
 };
 &gpt1 { gpio-controller; };
 
+/delete-node/ &psc1;
+
 / {
 	model = "ifm,o2d";
 	compatible = "ifm,o2d";
@@ -29,8 +31,10 @@
 			status = "disabled";
 		};
 
-		psc@2000 {		// PSC1
+		spi@2000 {		// PSC1
 			compatible = "fsl,mpc5200b-psc-spi","fsl,mpc5200-psc-spi";
+			reg = <0x2000 0x100>;
+			interrupts = <2 1 0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			cell-index = <0>;
-- 
2.17.1

