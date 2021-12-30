Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C331548207B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 23:06:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JQ2Qv4KdJz2ynD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Dec 2021 09:05:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lNa/u+Ek;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=bigunclemax@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lNa/u+Ek; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPlHx0gDNz2xMF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 21:43:54 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id g11so53707252lfu.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yg7RYwQR6VzpeYXfKgQCnzyp5pnZmL7af7luHvu61fc=;
 b=lNa/u+Ek5xQPIlUHU834NDKAfYUkbUPHHZifKo+AfSMUOXXltiU2wSjnbSmqGwNQzi
 lbmeQBwPjmgxwQmDg8ofdBazoDgb07z/cVG9Il9VLi6m4mAPzFI/boNNeL+UO52wqfsY
 agEdMEsefBBMh+SaMKdedflZJ9tNbU8FmxmOrqNQ8wcsYrA2EYc7cNHGscR3+G8WGGfT
 U/rM/japyp5ETxUeOMArNklQEagt+U3p2cjejB/bg6Ap+NNQQkcvdKUJK0Mk7bis3zwx
 023QBY7ZTVYp9noFR4IKlZAvP2rwvXHXTTUL7MQEQ5G+4e4LHWn4IGw2aIAEtNLlkuOF
 ScKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yg7RYwQR6VzpeYXfKgQCnzyp5pnZmL7af7luHvu61fc=;
 b=Ro+ueekD2ZN9Govb+FzyqDzrKffT77aGGAEMlL8081xdaRr+rb741O8SiYks9XG9v4
 QMgNpAsdcVb8zC9Vf+Rgkfd9pJNilzH5qHo2OP4vaW2orAHEqnI23lgH/nncNW25RkPH
 ZawjAjc7+HZThCBqn7URwuqPpbR2FaOt0SaxM5tmuz2AwjP8GULYypRiZytZrfqVnf43
 LJdJgGTNFmTnV1Rl4srB0XbjvG48zHamL1/B4IEL1OMMhAMZjyeR83Skha4OfE5EXqov
 k8dTJXzVJXYwe2cVMy+V7OYoxB+Wj+5trf78HhJx6Qd6dwdsHQVJW5hgK28+GTe9FsW+
 4aog==
X-Gm-Message-State: AOAM5336kkLsyBncvlsonXyQ5nDruNOIQRwwz6oPfTC0DIqnl9gHuFkl
 IbLfiI1fNxmtEk91mcI2wxE=
X-Google-Smtp-Source: ABdhPJzf2njYku29J1mLh79MjFff32ygDd5sAK2tIEx+v+Us0NJh3+fxkWemvyzuBDMPfMQpUSPprw==
X-Received: by 2002:a05:6512:1504:: with SMTP id
 bq4mr27433290lfb.27.1640861025294; 
 Thu, 30 Dec 2021 02:43:45 -0800 (PST)
Received: from localhost.localdomain ([185.6.236.169])
 by smtp.googlemail.com with ESMTPSA id u19sm1522644lje.56.2021.12.30.02.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 02:43:44 -0800 (PST)
From: Maxim Kiselev <bigunclemax@gmail.com>
To: 
Subject: [PATCH] powerpc: dts: t1040rdb: fix ports names for Seville Ethernet
 switch
Date: Thu, 30 Dec 2021 13:43:28 +0300
Message-Id: <20211230104329.677138-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 Dec 2021 09:05:26 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>,
 fido_max@inbox.ru, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Maxim Kiselev <bigunclemax@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix network interface names for the switch ports according to labels
that are written on the front panel of the board. They start from ETH3
and end at ETH10.

Fixes: e69eb0824d8c ("powerpc: dts: t1040rdb: add ports for Seville
Ethernet switch")
Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 arch/powerpc/boot/dts/fsl/t1040rdb.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb.dts b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
index af0c8a6f56138..b6733e7e65805 100644
--- a/arch/powerpc/boot/dts/fsl/t1040rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/t1040rdb.dts
@@ -119,7 +119,7 @@ &seville_port0 {
 	managed = "in-band-status";
 	phy-handle = <&phy_qsgmii_0>;
 	phy-mode = "qsgmii";
-	label = "ETH5";
+	label = "ETH3";
 	status = "okay";
 };
 
@@ -135,7 +135,7 @@ &seville_port2 {
 	managed = "in-band-status";
 	phy-handle = <&phy_qsgmii_2>;
 	phy-mode = "qsgmii";
-	label = "ETH7";
+	label = "ETH5";
 	status = "okay";
 };
 
@@ -151,7 +151,7 @@ &seville_port4 {
 	managed = "in-band-status";
 	phy-handle = <&phy_qsgmii_4>;
 	phy-mode = "qsgmii";
-	label = "ETH9";
+	label = "ETH7";
 	status = "okay";
 };
 
@@ -167,7 +167,7 @@ &seville_port6 {
 	managed = "in-band-status";
 	phy-handle = <&phy_qsgmii_6>;
 	phy-mode = "qsgmii";
-	label = "ETH11";
+	label = "ETH9";
 	status = "okay";
 };
 
-- 
2.32.0

