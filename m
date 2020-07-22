Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5722A246
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 00:16:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBqZC1dl1zDr4Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 08:16:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AGQDHPvH; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBj5F3gCyzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 03:24:46 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id n22so3083574ejy.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 10:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkjRjgqmL9cSG9e/Flla8rZThIqv1kD45KaUMdt112E=;
 b=AGQDHPvHM8zufKwGgOsKli2uXLvFTiN2RfHhyglp5Y+ezUK3B4LwfNCm298BkBTCb+
 AjzP2W77WbuPxgJ72AOeHLIJRhLdfPGA71EZtWztpbKHDtxGr8x2U8dtmXcL0XOmVC0p
 gpCzzhQXgCbUDiSnuKdCO4XXteBU0ruDrB6kzxPogReG1rYujCFBzQUAynw71CKuCFZu
 2GTsFelCVs4biVZ4YPnKl6AlvCOj88y0GImybPcdDDMRylJnbt+9vYDUdkKKcTAokkj5
 cwcbhnUolcLdoaULWwmnfF+Kk+k4rUT7nnZyQ5nltLeXiC+1fM6D0P7R2yt6wmf1tlud
 uAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkjRjgqmL9cSG9e/Flla8rZThIqv1kD45KaUMdt112E=;
 b=S8JZQyE+vF1rfgEHLqn5q9z87mRh2jxG8Zuylr5K41dxrAK65QUY1EoeIXshjJ223C
 6uyAGBpRC9Tcq0kffcw+l2oAPdfO624SJsKQWhDKqq9c6X2nJgaHOFXUle/CNXborif4
 1Inhi9ajVMt1b1x1d2jMO9JKSWAfZ6Vm1J4qM+3Ku3Obx5/kYKHwKEaLYM/Gbf0YzYcf
 6KtETJWr1Ltt9LlcyJ7APzRAdZcWo+8Rob1WFilwHpj6/5STdNRZPGvogZKI3sKWoxyx
 qIvax7bqiLsOmKu51PbD3vuIXYVi0rMTF4VCoXoEH/iMMixfl0L+/g3WQCPBcpHsVRe3
 ov3A==
X-Gm-Message-State: AOAM533mZeS4U74XVnlOBD1RL0t5N5h8KBgbrX/SXjRdXckYlHzs75hO
 +BTa5QZ+uXt8R1d+S0pE1JY=
X-Google-Smtp-Source: ABdhPJxnnRi1Q6Spyx54hWbixVxvTLOnzK7/JDNXb7ja9hltyn+X7XnRO6znLoGbFJqK6fc2Usydpg==
X-Received: by 2002:a17:906:430b:: with SMTP id
 j11mr611733ejm.270.1595438683625; 
 Wed, 22 Jul 2020 10:24:43 -0700 (PDT)
Received: from localhost.localdomain ([188.25.219.134])
 by smtp.gmail.com with ESMTPSA id bt26sm311517edb.17.2020.07.22.10.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 10:24:43 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: robh+dt@kernel.org, shawnguo@kernel.org, mpe@ellerman.id.au,
 devicetree@vger.kernel.org
Subject: [PATCH devicetree 3/4] powerpc: dts: t1040rdb: put SGMII PHY under
 &mdio0 label
Date: Wed, 22 Jul 2020 20:24:21 +0300
Message-Id: <20200722172422.2590489-4-olteanv@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722172422.2590489-1-olteanv@gmail.com>
References: <20200722172422.2590489-1-olteanv@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Jul 2020 08:08:49 +1000
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
Cc: madalin.bucur@oss.nxp.com, linux-kernel@vger.kernel.org,
 radu-andrei.bulie@nxp.com, fido_max@inbox.ru, paulus@samba.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We're going to add 8 more PHYs in a future patch. It is easier to follow
the hardware description if we don't need to fish for the path of the
MDIO controllers inside the SoC and just use the labels.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
 arch/powerpc/boot/dts/fsl/t1040rdb.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
index 65ff34c49025..40d7126dbe90 100644
--- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
@@ -59,12 +59,6 @@ ethernet@e4000 {
 				phy-handle = <&phy_sgmii_2>;
 				phy-connection-type = "sgmii";
 			};
-
-			mdio@fc000 {
-				phy_sgmii_2: ethernet-phy@3 {
-					reg = <0x03>;
-				};
-			};
 		};
 	};
 
@@ -76,3 +70,9 @@ cpld@3,0 {
 };
 
 #include "t1040si-post.dtsi"
+
+&mdio0 {
+	phy_sgmii_2: ethernet-phy@3 {
+		reg = <0x3>;
+	};
+};
-- 
2.25.1

