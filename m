Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15D76DB62
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 01:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGSXM0wskz3cBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 09:16:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.155.65.254; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 342 seconds by postgrey-1.37 at boromir; Wed, 02 Aug 2023 23:47:57 AEST
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGCwY1zsYz2y1b
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 23:47:56 +1000 (AEST)
X-QQ-mid: bizesmtp83t1690983695tkl1bdm6
Received: from dslab-main2-ubuntu.tail147f4.ts ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 02 Aug 2023 21:41:33 +0800 (CST)
X-QQ-SSF: 01200000000000804000000A0000000
X-QQ-FEAT: +ynUkgUhZJn7p/xtroOKoKamEOM95iSfLWNvyAoMRRihsQS51qgYDWZdy/pc0
	vNwyDDKSIlgg578ffugSztrUrp481RiJNo/fcXoOgX5i/W72A/eHa98j3QQ49vMcDKHQQ9D
	wmWOa/NB6hQ0LxeRGjeVLdrIoDeLh9MhqoKko579cpRRzVVm3aj5vM0MZn/jbndpl8iPqaP
	WQRlnfktyQd8HRDtkV4DzR2nyD99uoEURmWeXFMK/4StO86VeZISGu0z9br32PCWPz7GlNQ
	rPMaZBG/4cUu14UzzpmL/pHEnWbuxlH7fJXPX1ZGdBfWFUI4pKFIGmpo8d3nUFsU53tbtdY
	kCOp0Qz2qlmaqRufzyL8Au3q15ydZYaUgLMngJsY8/kFR2Zr0YUTAEBJgNMbA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13677686161433521607
From: Yuan Tan <tanyuan@tinylab.org>
To: npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc: pmac32: enable serial options by default in defconfig
Date: Wed,  2 Aug 2023 21:41:30 +0800
Message-Id: <bb7b5f9958b3e3a20f6573ff7ce7c5dc566e7e32.1690982937.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Mailman-Approved-At: Thu, 03 Aug 2023 09:15:55 +1000
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
Cc: linux@weissschuh.net, linux-kernel@vger.kernel.org, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu, tanyuan@tinylab.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Serial is a critical feature for logging and debuging, and the other
architectures enable serial by default.

Let's enable CONFIG_SERIAL_PMACZILOG and CONFIG_SERIAL_PMACZILOG_CONSOLE
by default.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
---
 arch/powerpc/configs/pmac32_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 019163c2571e..3aae79afb9d9 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -176,8 +176,9 @@ CONFIG_MOUSE_APPLETOUCH=y
 # CONFIG_SERIO_I8042 is not set
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIAL_8250=m
-CONFIG_SERIAL_PMACZILOG=m
+CONFIG_SERIAL_PMACZILOG=y
 CONFIG_SERIAL_PMACZILOG_TTYS=y
+CONFIG_SERIAL_PMACZILOG_CONSOLE=y
 CONFIG_NVRAM=y
 CONFIG_I2C_CHARDEV=m
 CONFIG_APM_POWER=y
-- 
2.34.1

