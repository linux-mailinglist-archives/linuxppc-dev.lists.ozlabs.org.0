Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17422A24D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 00:20:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBqf35kXKzDqvy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 08:20:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d0fnGmpq; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBj5H2LlbzDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 03:24:48 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id b15so2246649edy.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 10:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IwiK0U+Dhjv5R+D7L68/33/y00cq8SjNmUGfjDZfVnI=;
 b=d0fnGmpqyawQ6ZYxmbsWP6gl4hH8VZ6oUxfyea9jfSgAlL1mLymyW1fokoRJvAxg+H
 nlvajnhjmIzmBmnwyvX5fIjTcEWEPB4zIn0sYqns8vUqTWhFpX9fkQV21VFg7foAKeJm
 KLb48FjP3k9d5Q6Bq0GxgeCjC04cq0vnYj/KDJP94v7UEGtsQdSIaLDi3vOQlC5aVhEV
 qFj9sYBIjqlkHNfabEpR2Yp6ukw/GsWQfMrQHeUwKFlbmgdWiKpyQMmbC2CWDrSEVp+M
 zMyn/VPPsXBwVsmG+3TBI6HR3KTrdmUNyXEaSut29/0TdDxDrCyqwPa9oGLlBijDxvnA
 omsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IwiK0U+Dhjv5R+D7L68/33/y00cq8SjNmUGfjDZfVnI=;
 b=AT50+QB0I3sskakoa3tB+24tKsy7GdgKFTV4j8c0mJkMi42mgkuZwwaZLZiIdX7Btj
 9VQ7r4ywmQN6ECd1IFt8oI5hIfsYvGGfzFnxuBySD9YfeLmAP9n6ZoCZcK3RkKc65eNv
 r5ZRnA1sCmQoXE6rs4rccmU4y1lVUOy8ZlkhUVTyCF3gUgDQ6kGbo+E6JwlB5kgVR9KB
 7nqGBGAWS3PRRCxPskoaM/XJeYhj3V/0TVKlgGy3kTBVGuGbFkM9KsACFNIJa740gg5g
 bSAaWP4xdKu041wNFoS0uqj6vyZLIC5rID/UNj0ysb6i18HZ2vE4KDbQT1dKyxQYlgJI
 nf/g==
X-Gm-Message-State: AOAM531tuYkOroyb2UcXBzaPSDM5mQjZbzDPGG5jDYS5xEsZQXPe4y9H
 8s6E/V83aJZC7aSCvqqw2Dg=
X-Google-Smtp-Source: ABdhPJwN32en1tjwVds6TL6SW0e/xdD/1wt15akze77kDflk28RHrFyCzGDTRIFEKftNULw8jz/XBQ==
X-Received: by 2002:a50:d55b:: with SMTP id f27mr514751edj.312.1595438684854; 
 Wed, 22 Jul 2020 10:24:44 -0700 (PDT)
Received: from localhost.localdomain ([188.25.219.134])
 by smtp.gmail.com with ESMTPSA id bt26sm311517edb.17.2020.07.22.10.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 10:24:44 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: robh+dt@kernel.org, shawnguo@kernel.org, mpe@ellerman.id.au,
 devicetree@vger.kernel.org
Subject: [PATCH devicetree 4/4] powerpc: dts: t1040rdb: add ports for Seville
 Ethernet switch
Date: Wed, 22 Jul 2020 20:24:22 +0300
Message-Id: <20200722172422.2590489-5-olteanv@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722172422.2590489-1-olteanv@gmail.com>
References: <20200722172422.2590489-1-olteanv@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Jul 2020 08:08:50 +1000
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

Define the network interface names for the switch ports and hook them up
to the 2 QSGMII PHYs that are onboard.

A conscious decision was taken to go along with the numbers that are
written on the front panel of the board and not with the hardware
numbers of the switch chip ports. The 2 are shifted by 4.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
 arch/powerpc/boot/dts/fsl/t1040rdb.dts | 111 +++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
index 40d7126dbe90..28ee06a1706d 100644
--- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
@@ -75,4 +75,115 @@ &mdio0 {
 	phy_sgmii_2: ethernet-phy@3 {
 		reg = <0x3>;
 	};
+
+	/* VSC8514 QSGMII PHY */
+	phy_qsgmii_0: ethernet-phy@4 {
+		reg = <0x4>;
+	};
+
+	phy_qsgmii_1: ethernet-phy@5 {
+		reg = <0x5>;
+	};
+
+	phy_qsgmii_2: ethernet-phy@6 {
+		reg = <0x6>;
+	};
+
+	phy_qsgmii_3: ethernet-phy@7 {
+		reg = <0x7>;
+	};
+
+	/* VSC8514 QSGMII PHY */
+	phy_qsgmii_4: ethernet-phy@8 {
+		reg = <0x8>;
+	};
+
+	phy_qsgmii_5: ethernet-phy@9 {
+		reg = <0x9>;
+	};
+
+	phy_qsgmii_6: ethernet-phy@a {
+		reg = <0xa>;
+	};
+
+	phy_qsgmii_7: ethernet-phy@b {
+		reg = <0xb>;
+	};
+};
+
+&seville_port0 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_0>;
+	phy-mode = "qsgmii";
+	/* ETH4 written on chassis */
+	label = "swp4";
+	status = "okay";
+};
+
+&seville_port1 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_1>;
+	phy-mode = "qsgmii";
+	/* ETH5 written on chassis */
+	label = "swp5";
+	status = "okay";
+};
+
+&seville_port2 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_2>;
+	phy-mode = "qsgmii";
+	/* ETH6 written on chassis */
+	label = "swp6";
+	status = "okay";
+};
+
+&seville_port3 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_3>;
+	phy-mode = "qsgmii";
+	/* ETH7 written on chassis */
+	label = "swp7";
+	status = "okay";
+};
+
+&seville_port4 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_4>;
+	phy-mode = "qsgmii";
+	/* ETH8 written on chassis */
+	label = "swp8";
+	status = "okay";
+};
+
+&seville_port5 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_5>;
+	phy-mode = "qsgmii";
+	/* ETH9 written on chassis */
+	label = "swp9";
+	status = "okay";
+};
+
+&seville_port6 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_6>;
+	phy-mode = "qsgmii";
+	/* ETH10 written on chassis */
+	label = "swp10";
+	status = "okay";
+};
+
+&seville_port7 {
+	managed = "in-band-status";
+	phy-handle = <&phy_qsgmii_7>;
+	phy-mode = "qsgmii";
+	/* ETH11 written on chassis */
+	label = "swp11";
+	status = "okay";
+};
+
+&seville_port8 {
+	ethernet = <&enet0>;
+	status = "okay";
 };
-- 
2.25.1

