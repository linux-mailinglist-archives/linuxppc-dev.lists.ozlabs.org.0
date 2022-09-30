Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 239905F0BD4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 14:40:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf8vN0Zk5z3cdT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 22:40:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T0EDgfQg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T0EDgfQg;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf8tk3JF4z3c29
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 22:39:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EE68EB828D5;
	Fri, 30 Sep 2022 12:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842DAC433D6;
	Fri, 30 Sep 2022 12:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664541560;
	bh=tEozaHb1EwOmstcpCIwRRiZp1C/9JrsLwcpTdb1k3X8=;
	h=From:To:Cc:Subject:Date:From;
	b=T0EDgfQgvmYBLSv9OrSpIhvmkwN+cWf/8vnijeB9huu7k23C/E2npmMu5p0yqlJDv
	 7zbLhr/LsNqRWQTGiwiffhTTay64/BnX5D1QgpKMUiSP7mt/IzNqs+lVptZ6UsS/rq
	 pBl4lccFcMZgFH/egtOFkxwL49p2szeq16mQDZlkNc1JoF1DzOs2CKvZbhOuF67Ubw
	 nXkFFnDSlEjsNwbgxxRZYe4LyTtxxzPtprtEsNi4iBkZFym/8D/0FKhQHEBODt0pGS
	 b2oATA/+7srrbyvYnUbW811ftd0J/tq8c14dH2PZzPlUJbga04YvjcaniyUtW7wEMF
	 K+eYli43Ks7DA==
Received: by pali.im (Postfix)
	id A685D93F; Fri, 30 Sep 2022 14:39:17 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: dts: turris1x.dts: Add channel labels for temperature sensor
Date: Fri, 30 Sep 2022 14:39:01 +0200
Message-Id: <20220930123901.10251-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>, Josef Schlehofer <josef.schlehofer@nic.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Channel 0 of SA56004ED chip refers to internal SA56004ED chip sensor (chip
itself is located on the board) and channel 1 of SA56004ED chip refers to
external sensor which is connected to temperature diode of the P2020 CPU.

Fixes: 54c15ec3b738 ("powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
With this change userspace 'sensors' applications prints labels:

    $ sensors
    sa56004-i2c-0-4c
    Adapter: MPC adapter (i2c@3000)
    board:        +34.2°C  (low  =  +0.0°C, high = +70.0°C)
                           (crit = +85.0°C, hyst = +75.0°C)
    cpu:          +58.9°C  (low  =  +0.0°C, high = +70.0°C)
                           (crit = +85.0°C, hyst = +75.0°C)

And without this change it prints just generic tempX names:

    $ sensors
    sa56004-i2c-0-4c
    Adapter: MPC adapter (i2c@3000)
    temp1:        +43.0°C  (low  =  +0.0°C, high = +70.0°C)
                           (crit = +85.0°C, hyst = +75.0°C)
    temp2:        +63.4°C  (low  =  +0.0°C, high = +70.0°C)
                           (crit = +85.0°C, hyst = +75.0°C)
---
 arch/powerpc/boot/dts/turris1x.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
index 4033c554b06a..5b5278c32e43 100644
--- a/arch/powerpc/boot/dts/turris1x.dts
+++ b/arch/powerpc/boot/dts/turris1x.dts
@@ -69,6 +69,20 @@
 				interrupt-parent = <&gpio>;
 				interrupts = <12 IRQ_TYPE_LEVEL_LOW>, /* GPIO12 - ALERT pin */
 					     <13 IRQ_TYPE_LEVEL_LOW>; /* GPIO13 - CRIT pin */
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* Local temperature sensor (SA56004ED internal) */
+				channel@0 {
+					reg = <0>;
+					label = "board";
+				};
+
+				/* Remote temperature sensor (D+/D- connected to P2020 CPU Temperature Diode) */
+				channel@1 {
+					reg = <1>;
+					label = "cpu";
+				};
 			};
 
 			/* DDR3 SPD/EEPROM */
-- 
2.20.1

