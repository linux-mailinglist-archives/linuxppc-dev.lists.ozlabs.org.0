Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750A656256
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Dec 2022 12:59:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ngbt1480fz3c4x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Dec 2022 22:59:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qQZGAToo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qQZGAToo;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ngbs40pVXz2xdx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Dec 2022 22:58:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BD005B80D19;
	Mon, 26 Dec 2022 11:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53192C433D2;
	Mon, 26 Dec 2022 11:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672055889;
	bh=wSULAFQ9o5Qp1ccx8+zFcSC7eqa2jblW+biQlW4dd/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qQZGATooaviZFEzyHo6BhgpTzbgiQvZ3C+MdkxcjwL86SBfGoTwvj709nXOGCuQOZ
	 PrWV/ykpvtM+Pvf9xI4MiyoYs2ChMDqNvO4cW6NNV8yhEkwfSppjiVBj/kEaE81st5
	 8XLNa+GSNckqD38g2ALoU0XBYAUSYXIyHOoCkp5ritRa6vG8iBg7ycGvuH53cQBnNl
	 0IbVpB2NEeC5+27UuzP8hPRfQQs7QfvKgXNFo4RbekuFnUVeS1/27c0k+qhPp3LmZh
	 GhJAlsvmLNuovjJMWK0LAGNmYr3BuK0eUkwHbQfBnhiY1IOvjz7MJt0xcbSwDyUZbt
	 zYD/nAkxvbl7g==
Received: by pali.im (Postfix)
	id CE4AA77D; Mon, 26 Dec 2022 12:58:06 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v4 3/3] powerpc: dts: turris1x.dts: Set lower priority for CPLD syscon-reboot
Date: Mon, 26 Dec 2022 12:45:13 +0100
Message-Id: <20221226114513.4569-3-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221226114513.4569-1-pali@kernel.org>
References: <20220820102925.29476-1-pali@kernel.org>
 <20221226114513.4569-1-pali@kernel.org>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Due to CPLD firmware bugs, set CPLD syscon-reboot priority level to 64
(between rstcr and watchdog) to ensure that rstcr's global-utilities reset
method which is preferred stay as default one, and to ensure that CPLD
syscon-reboot is more preferred than watchdog reset method.

Fixes: 0531a4abd1c6 ("powerpc: dts: turris1x.dts: Add CPLD reboot node")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/boot/dts/turris1x.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
index e9cda34a140e..c9b619f6ed5c 100644
--- a/arch/powerpc/boot/dts/turris1x.dts
+++ b/arch/powerpc/boot/dts/turris1x.dts
@@ -367,11 +367,34 @@
 			};
 
 			reboot@d {
+				/*
+				 * CPLD firmware which manages system reset and
+				 * watchdog registers has bugs. It does not
+				 * autoclear system reset register after change
+				 * and watchdog ignores reset line on immediate
+				 * succeeding reset cycle triggered by watchdog.
+				 * These bugs have to be workarounded in U-Boot
+				 * bootloader. So use system reset via syscon as
+				 * a last resort because older U-Boot versions
+				 * do not have workaround for watchdog.
+				 *
+				 * Reset method via rstcr's global-utilities
+				 * (the preferred one) has priority level 128,
+				 * watchdog has priority level 0 and default
+				 * syscon-reboot priority level is 192.
+				 *
+				 * So define syscon-reboot with custom priority
+				 * level 64 (between rstcr and watchdog) because
+				 * rstcr should stay as default preferred reset
+				 * method and reset via watchdog is more broken
+				 * than system reset via syscon.
+				 */
 				compatible = "syscon-reboot";
 				reg = <0x0d 0x01>;
 				offset = <0x0d>;
 				mask = <0x01>;
 				value = <0x01>;
+				priority = <64>;
 			};
 
 			led-controller@13 {
-- 
2.20.1

