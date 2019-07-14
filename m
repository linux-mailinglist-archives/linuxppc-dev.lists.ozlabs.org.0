Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D168160
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 00:01:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45n0xL4CspzDqV1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 08:01:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.208.67; helo=mail-ed1-f67.google.com;
 envelope-from=valentin.longchamp@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=longchamp.me
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45myLz0MfjzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 06:05:11 +1000 (AEST)
Received: by mail-ed1-f67.google.com with SMTP id d4so13432476edr.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2019 13:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WCgrDWHA/LoE5zh4CQj2K7+JH9FLJqVbdVrySmSeBL0=;
 b=jbwLjgdn3/eKjl7Oh4j6zhNykHLhThZgVBNTdXlSOpp2qa68FAYRtm9wND/gPnLxIs
 49oFCeEKXPyMiqWi+Besju57O+cmvTAcmW5IVUTzUslpJRGKnoxpTSPCTlf8SowpSKFd
 ++AjyTDte6wUzGGalWanYN6kPxp77oPAgxHoCygm1baz1lCizBMY4zkNv497uY87X/40
 gh6bmnT3lBon9/OlTUKjX/gJVq39sfVj/isrwLGezuxwVoMfWCRMntFaBha1cTbNrfJP
 HwuUxqXo06RlhDwVFlRx7ZybEj/azZLXUbnqj2KYF8V5plZOJTUiBaNccI1B6AdB/Qtu
 rRrg==
X-Gm-Message-State: APjAAAWq255VmilcmLsnBR4nY2sZ6Kqmh/TaLodAop4wykvH0aZMPEbU
 wl4tmeNP2al+76KQwunw1xLzmXvHor0=
X-Google-Smtp-Source: APXvYqwsBEFDqpkshGpPD//dWoqDKbLKu/y7GIMpTaCZti/u6ptNudQ9mvgj6RhqQGXYrxlgVt9GxQ==
X-Received: by 2002:a17:906:1981:: with SMTP id g1mr1820959ejd.0.1563134707066; 
 Sun, 14 Jul 2019 13:05:07 -0700 (PDT)
Received: from localhost.localdomain (xdsl-31-164-29-146.adslplus.ch.
 [31.164.29.146])
 by smtp.gmail.com with ESMTPSA id h10sm4710358ede.93.2019.07.14.13.05.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 13:05:06 -0700 (PDT)
From: Valentin Longchamp <valentin@longchamp.me>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/kmcent2: update the ethernet devices' phy properties
Date: Sun, 14 Jul 2019 22:05:01 +0200
Message-Id: <20190714200501.1276-1-valentin@longchamp.me>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jul 2019 07:58:15 +1000
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
Cc: Valentin Longchamp <valentin@longchamp.me>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Change all phy-connection-type properties to phy-mode that are better
supported by the fman driver.

Use the more readable fixed-link node for the 2 sgmii links.

Change the RGMII link to rgmii-id as the clock delays are added by the
phy.

Signed-off-by: Valentin Longchamp <valentin@longchamp.me>
---
 arch/powerpc/boot/dts/fsl/kmcent2.dts | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/kmcent2.dts b/arch/powerpc/boot/dts/fsl/kmcent2.dts
index 48b7f9797124..c3e0741cafb1 100644
--- a/arch/powerpc/boot/dts/fsl/kmcent2.dts
+++ b/arch/powerpc/boot/dts/fsl/kmcent2.dts
@@ -210,13 +210,19 @@
 
 		fman@400000 {
 			ethernet@e0000 {
-				fixed-link = <0 1 1000 0 0>;
-				phy-connection-type = "sgmii";
+				phy-mode = "sgmii";
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			ethernet@e2000 {
-				fixed-link = <1 1 1000 0 0>;
-				phy-connection-type = "sgmii";
+				phy-mode = "sgmii";
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			ethernet@e4000 {
@@ -229,7 +235,7 @@
 
 			ethernet@e8000 {
 				phy-handle = <&front_phy>;
-				phy-connection-type = "rgmii";
+				phy-mode = "rgmii-id";
 			};
 
 			mdio0: mdio@fc000 {
-- 
2.17.1

