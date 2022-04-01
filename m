Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D154EF07C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 16:34:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVN3P4kLcz3cB8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 01:34:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YNg0SKnm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YNg0SKnm; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVN2n6q3wz2yMD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 01:33:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 94116B8250E;
 Fri,  1 Apr 2022 14:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4AEC36AE2;
 Fri,  1 Apr 2022 14:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823630;
 bh=b51VNEiKO+Fx8+RwLfJTXx0nWoth9Ssof+K5dUkMstw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YNg0SKnmx+6qETIZ8vX83XlA6GYxu2vCcDNmpoDEihTeT0P13UKF3g30pZksGB2Pp
 A8O3C+4ha+zNPkP1NZRlA0ZEJ1oaEtr/cJVUQqdXksqkQ6ueF7Vn0q+lM5YwE/OPK2
 yS2AMk7r0kRLlfg1dQnnWLSEUpNCMd+3kDrRLYkj4R69nfyEUMe1A4U8VydWn8gVS7
 gILgDlDX1lfzRNsH+Ew5+XKEuLHsnwtGVCRNBliy6nmXEGUpSq4/lewZ6URlqEMMfb
 FxMn5f0U7uH/BobBtgC3pc1TDzCW3eDX1YFY7afKF3qlRnQKNW1KG13T/IUg58ICS5
 +xiltyACc9EIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 018/109] powerpc: dts: t104xrdb: fix phy type for
 FMAN 4/5
Date: Fri,  1 Apr 2022 10:31:25 -0400
Message-Id: <20220401143256.1950537-18-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143256.1950537-1-sashal@kernel.org>
References: <20220401143256.1950537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Maxim Kochetkov <fido_max@inbox.ru>,
 robh+dt@kernel.org, Maxim Kiselev <bigunclemax@gmail.com>, krzk+dt@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Maxim Kiselev <bigunclemax@gmail.com>

[ Upstream commit 17846485dff91acce1ad47b508b633dffc32e838 ]

T1040RDB has two RTL8211E-VB phys which requires setting
of internal delays for correct work.

Changing the phy-connection-type property to `rgmii-id`
will fix this issue.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20211230151123.1258321-1-bigunclemax@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/boot/dts/fsl/t104xrdb.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi b/arch/powerpc/boot/dts/fsl/t104xrdb.dtsi
index 099a598c74c0..bfe1ed5be337 100644
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
2.34.1

