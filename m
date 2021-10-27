Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113CC43D6E8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 00:46:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfkMZ6mMKz3clp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 09:46:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr;
 envelope-from=linkmauve@linkmauve.fr; receiver=<UNKNOWN>)
Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net
 [82.65.109.163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfkLH4k4qz3bWq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 09:45:43 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id F2808F40CA4; Thu, 28 Oct 2021 00:35:23 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>
Subject: [PATCH v2 3/5] powerpc: wii.dts: Expose HW_SRNPROT on this platform
Date: Thu, 28 Oct 2021 00:35:13 +0200
Message-Id: <20211027223516.2031-4-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027223516.2031-1-linkmauve@linkmauve.fr>
References: <20211014220524.9988-1-linkmauve@linkmauve.fr>
 <20211027223516.2031-1-linkmauve@linkmauve.fr>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, linux-kernel@vger.kernel.org,
 rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Ash Logan <ash@heyquark.com>,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This Hollywood register isn’t properly understood, but can allow or
reject access to the SRAM, which we need to set for RTC usage if it
isn’t previously set correctly beforehand.

See https://wiibrew.org/wiki/Hardware/Hollywood_Registers#HW_SRNPROT

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 arch/powerpc/boot/dts/wii.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
index c5720fdd0686..34d9732d5910 100644
--- a/arch/powerpc/boot/dts/wii.dts
+++ b/arch/powerpc/boot/dts/wii.dts
@@ -175,6 +175,11 @@ PIC1: pic1@d800030 {
 			interrupts = <14>;
 		};
 
+		srnprot@d800060 {
+			compatible = "nintendo,hollywood-srnprot";
+			reg = <0x0d800060 0x4>;
+		};
+
 		GPIO: gpio@d8000c0 {
 			#gpio-cells = <2>;
 			compatible = "nintendo,hollywood-gpio";
-- 
2.33.1

