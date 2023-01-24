Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D27678ECC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 04:06:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1Bhb6zn2z3chJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 14:06:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.49; helo=mail-oa1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1Bft3Yz7z3bh6;
	Tue, 24 Jan 2023 14:05:25 +1100 (AEDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-15f97c478a8so16211932fac.13;
        Mon, 23 Jan 2023 19:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/AFIBZBlVMlUymjRHheiMpee3m76POsDggSk1UWmhI=;
        b=HKDX+Nbsib0VgpJRWQKxx0r43HZ9CS7iDl+5HPo3oT8I5Esogz5LLbtT4LachlHVIL
         pLAimP30o2wBAwNOsnc/AfZrMqMCppYSGzVpqOEEFE7jKjbkYSFD0dyWbjchM4ic91bT
         HH/Qj6ZOsusJLNrYVmMZMVZrf9cYvfbRCtrRQuJP/0isKW9c0Q66uRTHoMID4rWiY/Z3
         WqGqvO3hqaX2Z1AkkHvjDmN1UNcxDYhPrmtr0sNyGncrCAVWDb/BFOLWbvDPHeSHbvq3
         XhusSXME9o7PUoYec+sqho1LZybVfXaYcBnQqNvt9nGxnt2A1nwNwif4V4OFBsdg+m67
         NAPQ==
X-Gm-Message-State: AFqh2kr9juG7ud7HZEsF9j1sw3tDUMGPqzRJuMjcJXljimGxE999j4e0
	Rjne/LBeWkr9yIfeL6QtGw==
X-Google-Smtp-Source: AMrXdXtLjF7KETuY0Xd3Nk9VYIhUHuC3c+T3ChWZB5joiQamOBF0Q4wxZ7GtxK4IzYtccz//wXwirA==
X-Received: by 2002:a05:6870:4508:b0:154:3fcb:bc20 with SMTP id e8-20020a056870450800b001543fcbbc20mr14559591oao.17.1674529522783;
        Mon, 23 Jan 2023 19:05:22 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t12-20020a056870e74c00b0013bc95650c8sm230827oak.54.2023.01.23.19.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 19:05:22 -0800 (PST)
Received: (nullmailer pid 3266344 invoked by uid 1000);
	Tue, 24 Jan 2023 03:05:20 -0000
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jan 2023 21:05:17 -0600
Subject: [PATCH v3 3/5] dt-bindings: usb: Convert OMAP OHCI/EHCI bindings
 to schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230110-dt-usb-v3-3-5af0541fcf8c@kernel.org>
References: <20230110-dt-usb-v3-0-5af0541fcf8c@kernel.org>
In-Reply-To: <20230110-dt-usb-v3-0-5af0541fcf8c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Lee Jones <lee@kernel.org>
X-Mailer: b4 0.12-dev
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The OMAP OHCI and EHCI USB host bindings follow the generic binding, so
add the compatibles and remove the old txt binding docs.

The examples in omap-usb-host.txt don't match actual users, so update
them dropping the fallback compatible.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v3:
 - Fix document references to generic-ehci.yaml and generic-ohci.yaml (0-day)
v2:
 - New patch
---
 .../devicetree/bindings/mfd/omap-usb-host.txt      |  8 +++---
 .../devicetree/bindings/usb/ehci-omap.txt          | 31 ----------------------
 .../devicetree/bindings/usb/generic-ehci.yaml      |  1 +
 .../devicetree/bindings/usb/generic-ohci.yaml      |  4 ++-
 .../devicetree/bindings/usb/ohci-omap3.txt         | 15 -----------
 5 files changed, 8 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/omap-usb-host.txt b/Documentation/devicetree/bindings/mfd/omap-usb-host.txt
index aa1eaa59581b..a0d8c30c2631 100644
--- a/Documentation/devicetree/bindings/mfd/omap-usb-host.txt
+++ b/Documentation/devicetree/bindings/mfd/omap-usb-host.txt
@@ -64,8 +64,8 @@ Required properties if child node exists:
 Properties for children:
 
 The OMAP HS USB Host subsystem contains EHCI and OHCI controllers.
-See Documentation/devicetree/bindings/usb/ehci-omap.txt and
-Documentation/devicetree/bindings/usb/ohci-omap3.txt.
+See Documentation/devicetree/bindings/usb/generic-ehci.yaml and
+Documentation/devicetree/bindings/usb/generic-ohci.yaml.
 
 Example for OMAP4:
 
@@ -78,14 +78,14 @@ usbhshost: usbhshost@4a064000 {
 	ranges;
 
 	usbhsohci: ohci@4a064800 {
-		compatible = "ti,ohci-omap3", "usb-ohci";
+		compatible = "ti,ohci-omap3";
 		reg = <0x4a064800 0x400>;
 		interrupt-parent = <&gic>;
 		interrupts = <0 76 0x4>;
 	};
 
 	usbhsehci: ehci@4a064c00 {
-		compatible = "ti,ehci-omap", "usb-ehci";
+		compatible = "ti,ehci-omap";
 		reg = <0x4a064c00 0x400>;
 		interrupt-parent = <&gic>;
 		interrupts = <0 77 0x4>;
diff --git a/Documentation/devicetree/bindings/usb/ehci-omap.txt b/Documentation/devicetree/bindings/usb/ehci-omap.txt
deleted file mode 100644
index d77e11a975a2..000000000000
--- a/Documentation/devicetree/bindings/usb/ehci-omap.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-OMAP HS USB EHCI controller
-
-This device is usually the child of the omap-usb-host
-Documentation/devicetree/bindings/mfd/omap-usb-host.txt
-
-Required properties:
-
-- compatible: should be "ti,ehci-omap"
-- reg: should contain one register range i.e. start and length
-- interrupts: description of the interrupt line
-
-Optional properties:
-
-- phys: list of phandles to PHY nodes.
-  This property is required if at least one of the ports are in
-  PHY mode i.e. OMAP_EHCI_PORT_MODE_PHY
-
-To specify the port mode, see
-Documentation/devicetree/bindings/mfd/omap-usb-host.txt
-
-Example for OMAP4:
-
-usbhsehci: ehci@4a064c00 {
-	compatible = "ti,ehci-omap";
-	reg = <0x4a064c00 0x400>;
-	interrupts = <0 77 0x4>;
-};
-
-&usbhsehci {
-	phys = <&hsusb1_phy 0 &hsusb3_phy>;
-};
diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 994818cb6044..2d382ae424da 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -74,6 +74,7 @@ properties:
           - const: usb-ehci
       - enum:
           - generic-ehci
+          - ti,ehci-omap
           - usb-ehci
 
   reg:
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 8492d809ba40..a9ba7257b884 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -46,7 +46,9 @@ properties:
               - ingenic,jz4740-ohci
               - snps,hsdk-v1.0-ohci
           - const: generic-ohci
-      - const: generic-ohci
+      - enum:
+          - generic-ohci
+          - ti,ohci-omap3
       - items:
           - enum:
               - cavium,octeon-6335-ohci
diff --git a/Documentation/devicetree/bindings/usb/ohci-omap3.txt b/Documentation/devicetree/bindings/usb/ohci-omap3.txt
deleted file mode 100644
index ce8c47cff6d0..000000000000
--- a/Documentation/devicetree/bindings/usb/ohci-omap3.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-OMAP HS USB OHCI controller (OMAP3 and later)
-
-Required properties:
-
-- compatible: should be "ti,ohci-omap3"
-- reg: should contain one register range i.e. start and length
-- interrupts: description of the interrupt line
-
-Example for OMAP4:
-
-usbhsohci: ohci@4a064800 {
-	compatible = "ti,ohci-omap3";
-	reg = <0x4a064800 0x400>;
-	interrupts = <0 76 0x4>;
-};

-- 
2.39.0

