Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47517944294
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 07:15:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WvQSEXjc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZHGj1DqHz3dFx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 15:15:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WvQSEXjc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=paweldembicki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZHG05BBRz3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 15:14:46 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52efa16aad9so9538082e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 22:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722489280; x=1723094080; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwe1CFr7XDtc90/o/bWkFlT5zGqIJ/h6TtZLaOU7lZo=;
        b=WvQSEXjcVvF6b+ZivTMfdUDq65Il1Bp7qOF3cfd2dy3EuDSvC2IncQ1yqrxBj9nWSb
         2x0VCReCj4vV38LMS+eC9CRD38h8SiTUQhZ1MBE22a/GY82CVM0o73NyXZIa1P8Ebn4O
         sMkc63U/FQsj8nMPue5P3njOrRvvq6Nak+QKgbwAcfu2UmQXVlt2DjYklwaojiX+1THS
         d+ohfFzAfo8cJRUOe4Hmey1kTKpGKCKakeSubXIWFNYGxB/z1y7Pqc7bxQMNPN9EQAIF
         XZiJ6EIsCZ08Ew2d/GgLkNzoQPhSc48L6dse4HTCeLcYLXFJJ/8WDdk7UNPBwR9ZmBc7
         s/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722489280; x=1723094080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dwe1CFr7XDtc90/o/bWkFlT5zGqIJ/h6TtZLaOU7lZo=;
        b=Wo888fv1KdgRh60U63UVIwPLUd8t+eC4k12b/H4fTjszW3arUnkxS9pQ0tMLbHzgRo
         FiT8FwSoxPJx30LqxhpohD5LxSM5x9Oljz2eXy5eSkCVjNMJ0jcqLKr8wx2Wsq1XyJBZ
         2/TodaRMp5rKR6XG/NIopTj533t/s5cJ8DTIPZFNWF0c07RJEh56VLiPayzTKr+9o0Jh
         DJRizKp9AEaf+ZBJ+XD8N43HiR4rALCRH5wmY0H3SfRPe3yIT7kZg4v8klHYsNXXaAgh
         ol7N02aH1UQ9+4/8s5dkROU0RkN0C2s4CljLltbBhlklMKLG21DwgOzYtdASuO3wJA38
         uUhQ==
X-Gm-Message-State: AOJu0Yzb3iUNHMj/Z1dS7ZNfo6oVwbHzZBhNsMmPQ5C0Hv7i1fU4Rlj9
	7LtNItz3vahxaqAnj88iSwtrH1yd9Miqh2lXGbs/q5KlDUGs5IFyV8oXjpQ7
X-Google-Smtp-Source: AGHT+IGpNCSVm6hYkMRgsT/z/Oa2FjemtIZEfC7W2b0eQB93+x4euJWk0w43mBqDph9ZoRI7njDGeg==
X-Received: by 2002:a19:2d54:0:b0:52e:fa5f:b6b1 with SMTP id 2adb3069b0e04-530b61f81bamr444856e87.60.1722489279571;
        Wed, 31 Jul 2024 22:14:39 -0700 (PDT)
Received: from WBEC325.dom.lan ([185.188.71.122])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd0c4csm2474129e87.72.2024.07.31.22.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 22:14:39 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: dtc: update P2020RDB dts
Date: Thu,  1 Aug 2024 07:14:01 +0200
Message-Id: <20240801051402.584652-1-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Pawel Dembicki <paweldembicki@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

P2020RDB contains multiple peripherals, which isn't added to
devicetree:
  - Switch: Microchip VSC7385
  - PMIC: Renesas ZL2006
  - Temperature sensor: Analog Devices ADT7461
  - Two eeproms: 24C256 and 24C01
  - GPIO expander: NXP PCA9557
  - reset gpios of Ethernet PHYs

This commit adds it.

Some refreshments was done:
  - fixed link in ethernet-node
  - platform drivers nodes names
  - added 'gpio0' label in pq3-gpio-0.dtsi

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
---
 arch/powerpc/boot/dts/fsl/p2020rdb.dts    | 85 +++++++++++++++++++++--
 arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi |  2 +-
 2 files changed, 81 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/p2020rdb.dts b/arch/powerpc/boot/dts/fsl/p2020rdb.dts
index 3acd3890b397..d563d37b91f1 100644
--- a/arch/powerpc/boot/dts/fsl/p2020rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/p2020rdb.dts
@@ -6,6 +6,7 @@
  */
 
 /include/ "p2020si-pre.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "fsl,P2020RDB";
@@ -33,7 +34,7 @@ lbc: localbus@ffe05000 {
 			  0x1 0x0 0x0 0xffa00000 0x00040000
 			  0x2 0x0 0x0 0xffb00000 0x00020000>;
 
-		nor@0,0 {
+		nor@0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "cfi-flash";
@@ -79,7 +80,7 @@ partition@f00000 {
 			};
 		};
 
-		nand@1,0 {
+		nand@1 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "fsl,p2020-fcm-nand",
@@ -128,11 +129,49 @@ partition@1100000 {
 			};
 		};
 
-		L2switch@2,0 {
+		ethernet-switch@2 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-			compatible = "vitesse-7385";
+			compatible = "vitesse,vsc7385";
 			reg = <0x2 0x0 0x20000>;
+			reset-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					label = "lan1";
+				};
+				port@2 {
+					reg = <2>;
+					label = "lan2";
+				};
+				port@3 {
+					reg = <3>;
+					label = "lan3";
+				};
+				port@4 {
+					reg = <4>;
+					label = "lan4";
+				};
+				vsc: port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&enet0>;
+					phy-mode = "rgmii";
+					rx-internal-delay-ps = <1400>;
+					tx-internal-delay-ps = <2000>;
+
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+						pause;
+					};
+				};
+			};
+
 		};
 
 	};
@@ -141,12 +180,39 @@ soc: soc@ffe00000 {
 		ranges = <0x0 0x0 0xffe00000 0x100000>;
 
 		i2c@3000 {
+			temperature-sensor@4c {
+				compatible = "adi,adt7461";
+				reg = <0x4c>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c256";
+				reg = <0x50>;
+			};
+
 			rtc@68 {
 				compatible = "dallas,ds1339";
 				reg = <0x68>;
 			};
 		};
 
+		i2c@3100 {
+			pmic@11 {
+				compatible = "zl2006";
+				reg = <0x11>;
+			};
+
+			gpio@18 {
+				compatible = "nxp,pca9557";
+				reg = <0x18>;
+			};
+
+			eeprom@52 {
+				compatible = "atmel,24c01";
+				reg = <0x52>;
+			};
+		};
+
 		spi@7000 {
 			flash@0 {
 				#address-cells = <1>;
@@ -200,11 +266,15 @@ mdio@24520 {
 			phy0: ethernet-phy@0 {
 				interrupts = <3 1 0 0>;
 				reg = <0x0>;
+				reset-gpios = <&gpio0 14 GPIO_ACTIVE_LOW>;
 			};
+
 			phy1: ethernet-phy@1 {
 				interrupts = <3 1 0 0>;
 				reg = <0x1>;
+				reset-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
 			};
+
 			tbi-phy@2 {
 				device_type = "tbi-phy";
 				reg = <0x2>;
@@ -232,8 +302,13 @@ ptp_clock@24e00 {
 		};
 
 		enet0: ethernet@24000 {
-			fixed-link = <1 1 1000 0 0>;
 			phy-connection-type = "rgmii-id";
+
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+				pause;
+			};
 		};
 
 		enet1: ethernet@25000 {
diff --git a/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi b/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi
index a1b48546b02d..5181117ea6b5 100644
--- a/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi
+++ b/arch/powerpc/boot/dts/fsl/pq3-gpio-0.dtsi
@@ -32,7 +32,7 @@
  * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-gpio-controller@fc00 {
+gpio0: gpio-controller@fc00 {
 	#gpio-cells = <2>;
 	compatible = "fsl,pq3-gpio";
 	reg = <0xfc00 0x100>;
-- 
2.34.1

