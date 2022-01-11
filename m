Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 954DE48B0BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 16:23:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYDwX33Y1z3bZ0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 02:23:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=INzUaxbs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=bigunclemax@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=INzUaxbs; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYDvs6wmHz2yN3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 02:22:31 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id o15so4468875lfo.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 07:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cncrSO47/dxTzJw3Hb5sh69Ee7OGFih0UXbfWgWwSJM=;
 b=INzUaxbs+mQkRHXZ3Rm8t5IcTWwb7Ttgsd2lsFxj+3puCEgShGJ0o5N8h+LeD5oqs6
 BXj7XrJsHA7hYzT7uvnh/FUw8AMAeR0ojO21krTbQBXET4hJW6vN8NEgB4jA6LxpgrDp
 T+68zNf/+79dLsXrgzXERjegzbxSyOfhrgt6am4M1Ch0AR6r1pMeGopdqiUiTh2z2mP1
 NZ7tg485kbdCj0u47JspHihG6tsi51a/xU1hlomF4Ye97TFDRGFa2MtP2Gab5YMC/rOc
 V4ikzOuYRM7AHIxYfrLRKkqCaaKtM+1Cm1Wl/K/ougAKzo56p80a1iyLRoWhoIRd8f0y
 39og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cncrSO47/dxTzJw3Hb5sh69Ee7OGFih0UXbfWgWwSJM=;
 b=YpNeMx/iGlY2UPZ3C2YMifamNayycep91qfIKgxFVfiaP7xBA8QqgdeZYTLvn7qDGu
 DIX515NTIpwYyo81F3JSKgLMwWsdwJr1zlIET8w6+lUh0JV78e8VVozRmNbvAduDvo8I
 204ZELk2J76WkmfpSttsnSxlVJ6h9CIjK1q8QNnFTkFF9fbK8EPWkeihC1rn41w0j7Cc
 oJIJlju1+TqsAoiom0da07JTgPYa5qRhJhPrYJt88WtAqfQRWaCN2v0KjtPbJmmIKqOI
 rmnNrCwU8NohpNrW7exCggdkpYGzLF7Ejcwmrn2i/8WwSTBYIRjqrtukd+vWLJ3zKAQ0
 H1Yw==
X-Gm-Message-State: AOAM531qKg3KH8bqOBr5aGCSt1Ha1EVl/nF9+zpFjiA6F1tgywDA1A1r
 PvQ7R/SlEfMMhwhQRkhQeMM=
X-Google-Smtp-Source: ABdhPJxX/U3rRogB45yH/QpmqrxN1k+9JvMQn9qTByOMINqb/Vp4CeaQ2UCpubIXd5aMyGDnZ207KA==
X-Received: by 2002:a2e:a16f:: with SMTP id u15mr3225184ljl.510.1641914546089; 
 Tue, 11 Jan 2022 07:22:26 -0800 (PST)
Received: from localhost.localdomain ([185.6.236.169])
 by smtp.googlemail.com with ESMTPSA id bi16sm1363069lfb.81.2022.01.11.07.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 07:22:25 -0800 (PST)
From: Maxim Kiselev <bigunclemax@gmail.com>
To: vladimir.oltean@nxp.com
Subject: [PATCH] powerpc: dts: add device tree for T1040RDB-REV-A
Date: Tue, 11 Jan 2022 18:22:04 +0300
Message-Id: <20220111152204.3524442-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111131355.djuyn6bbirqtsama@skbuf>
References: <20220111131355.djuyn6bbirqtsama@skbuf>
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
Cc: andrew@lunn.ch, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fido_max@inbox.ru, robh+dt@kernel.org, paulus@samba.org, bigunclemax@gmail.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On board rev A, the network interface labels for the switch ports
written on the front panel are different than on rev B and later.

This patch introduces a separate device tree for rev A.
The main device tree is supposed to cover rev B and later.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts | 185 +++++++++++++++++++
 1 file changed, 185 insertions(+)
 create mode 100644 arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts

diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts b/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
new file mode 100644
index 0000000000000..f74486ba1d45f
--- /dev/null
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
@@ -0,0 +1,185 @@
+/*
+ * T1040RDB Device Tree Source
+ *
+ * Copyright 2014 - 2015 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *     * Redistributions of source code must retain the above copyright
+ *	 notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyright
+ *	 notice, this list of conditions and the following disclaimer in the
+ *	 documentation and/or other materials provided with the distribution.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *	 names of its contributors may be used to endorse or promote products
+ *	 derived from this software without specific prior written permission.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") as published by the Free Software
+ * Foundation, either version 2 of that License or (at your option) any
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor "AS IS" AND ANY
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/include/ "t104xsi-pre.dtsi"
+/include/ "t104xrdb.dtsi"
+
+/ {
+	model = "fsl,T1040RDB-REV-A";
+	compatible = "fsl,T1040RDB-REV-A";
+
+	aliases {
+		phy_sgmii_2 = &phy_sgmii_2;
+	};
+
+	soc@ffe000000 {
+		fman@400000 {
+			ethernet@e0000 {
+				fixed-link = <0 1 1000 0 0>;
+				phy-connection-type = "sgmii";
+			};
+
+			ethernet@e2000 {
+				fixed-link = <1 1 1000 0 0>;
+				phy-connection-type = "sgmii";
+			};
+
+			ethernet@e4000 {
+				phy-handle = <&phy_sgmii_2>;
+				phy-connection-type = "sgmii";
+			};
+
+			mdio@fc000 {
+				phy_sgmii_2: ethernet-phy@3 {
+					reg = <0x03>;
+				};
+
+				/* VSC8514 QSGMII PHY */
+				phy_qsgmii_0: ethernet-phy@4 {
+					reg = <0x4>;
+				};
+
+				phy_qsgmii_1: ethernet-phy@5 {
+					reg = <0x5>;
+				};
+
+				phy_qsgmii_2: ethernet-phy@6 {
+					reg = <0x6>;
+				};
+
+				phy_qsgmii_3: ethernet-phy@7 {
+					reg = <0x7>;
+				};
+
+				/* VSC8514 QSGMII PHY */
+				phy_qsgmii_4: ethernet-phy@8 {
+					reg = <0x8>;
+				};
+
+				phy_qsgmii_5: ethernet-phy@9 {
+					reg = <0x9>;
+				};
+
+				phy_qsgmii_6: ethernet-phy@a {
+					reg = <0xa>;
+				};
+
+				phy_qsgmii_7: ethernet-phy@b {
+					reg = <0xb>;
+				};
+			};
+		};
+	};
+
+	ifc: localbus@ffe124000 {
+		cpld@3,0 {
+			compatible = "fsl,t1040rdb-cpld";
+		};
+	};
+};
+
+#include "t1040si-post.dtsi"
+
+&seville_switch {
+	status = "okay";
+};
+
+&seville_port0 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_0>;
+	phy-mode = "qsgmii";
+	label = "ETH5";
+	status = "okay";
+};
+
+&seville_port1 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_1>;
+	phy-mode = "qsgmii";
+	label = "ETH4";
+	status = "okay";
+};
+
+&seville_port2 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_2>;
+	phy-mode = "qsgmii";
+	label = "ETH7";
+	status = "okay";
+};
+
+&seville_port3 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_3>;
+	phy-mode = "qsgmii";
+	label = "ETH6";
+	status = "okay";
+};
+
+&seville_port4 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_4>;
+	phy-mode = "qsgmii";
+	label = "ETH9";
+	status = "okay";
+};
+
+&seville_port5 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_5>;
+	phy-mode = "qsgmii";
+	label = "ETH8";
+	status = "okay";
+};
+
+&seville_port6 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_6>;
+	phy-mode = "qsgmii";
+	label = "ETH11";
+	status = "okay";
+};
+
+&seville_port7 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_7>;
+	phy-mode = "qsgmii";
+	label = "ETH10";
+	status = "okay";
+};
+
+&seville_port8 {
+	ethernet = <&enet0>;
+	status = "okay";
+};
-- 
2.32.0

