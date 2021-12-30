Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515F48207D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 23:07:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JQ2SK3Pr8z3cR0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Dec 2021 09:07:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pEDv+2QI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=bigunclemax@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pEDv+2QI; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JPsF60xl2z2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Dec 2021 02:11:51 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id g11so55136126lfu.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Dec 2021 07:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=25gPE1M09oN8YrsQ7EedKvu1Nlub3NmgdpsF+z+nV2o=;
 b=pEDv+2QIhGyWVoakqtkOEPAge/rRZUZ4H7/dtqrlICetNG02IT8UgWsbOqU+EM4ya6
 pIsiLng+8FoQaBvcCpzdA4dbKMWkH+WckGl3R4HnYGPFDhCvhTfzATWRMQn1C9dLS+yM
 6K++jQrzn/WSDVAaPEToh7RqMo9Cb6o3JX0e0PJOaadsmyJGiRTWwdKrLNRsDvxPxcjH
 6n8+YVYxddQu/g4y3h7WRIztsqNF0KNykNTf/dK9GZPBncW+qgJdbVTnaUyU1zoIsvGt
 9UULvXumRTymp+9x/YPyXkO68GWa6tKOORPK6TY5Ry+Cobd3Yo/kU0w4PiXFaUOUXarA
 l6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=25gPE1M09oN8YrsQ7EedKvu1Nlub3NmgdpsF+z+nV2o=;
 b=jETc4gmQuin4ZOBEq+7f+rmeVX1TZAmRVghiebXOw/hdi5wfaRrQolnBEeIWAr6OKD
 5QSMg33JGRAi055kO/wYBxP9/goe48qy+xrD2clSjTvl/bDTpOihxajm8Lfvde2PuQ6z
 Kk0JXlFyo0skNSOMKabXf3jeO5ZjliO52u8RtDw3iUNr2jt82Pz0fCGj3vPogwtRmqp0
 8pm0pGZ7/zDzUECwjODLtYmbIopBU15txGBgS0WBe22w+OmRSckwRSIvLtn/gJ7cOWCl
 /nkQ1cX+8Rj76O7WucRHb6Q5KO+AhwDSx6/+NOQyy6vjsyFFtxX5RonjV/AjXXiOaQl+
 eRHg==
X-Gm-Message-State: AOAM5321fJtOjLWlTSU1oGn0OcBfodgq4YgrVkzn/UDDT3XK6bTm/tU4
 pIEYqEaXF1Ri8Cyb5IL+K6o=
X-Google-Smtp-Source: ABdhPJw/+ynSKnGXNZQ0sEEeoH7eFHBqPDdsjXpW3eYkqYPGV98hOjcDeDedrPDAavUPldcQ1xKOUQ==
X-Received: by 2002:ac2:51bc:: with SMTP id f28mr27486987lfk.222.1640877103736; 
 Thu, 30 Dec 2021 07:11:43 -0800 (PST)
Received: from localhost.localdomain ([185.6.236.169])
 by smtp.googlemail.com with ESMTPSA id l7sm1983392lfg.89.2021.12.30.07.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 07:11:43 -0800 (PST)
From: Maxim Kiselev <bigunclemax@gmail.com>
To: 
Subject: [PATCH] powerpc: dts: t104xrdb: fix phy type for FMAN 4/5
Date: Thu, 30 Dec 2021 18:11:21 +0300
Message-Id: <20211230151123.1258321-1-bigunclemax@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, fido_max@inbox.ru,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Maxim Kiselev <bigunclemax@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T1040RDB has two RTL8211E-VB phys which requires setting
of internal delays for correct work.

Changing the phy-connection-type property to `rgmii-id`
will fix this issue.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 arch/powerpc/boot/dts/fsl/t104xrdb.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
index 099a598c74c00..bfe1ed5be3374 100644
--- a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
@@ -139,12 +139,12 @@ pca9546@77 {
 		fman@400000 {
 			ethernet@e6000 {
 				phy-handle = <&phy_rgmii_0>;
-				phy-connection-type = "rgmii";
+				phy-connection-type = "rgmii-id";
 			};
 
 			ethernet@e8000 {
 				phy-handle = <&phy_rgmii_1>;
-				phy-connection-type = "rgmii";
+				phy-connection-type = "rgmii-id";
 			};
 
 			mdio0: mdio@fc000 {
-- 
2.32.0

