Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE407A0157
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmY5s5Ggzz3djf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 20:12:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tinylab.org (client-ip=43.154.54.12; helo=bg4.exmail.qq.com; envelope-from=tanyuan@tinylab.org; receiver=lists.ozlabs.org)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmY4f38wMz3dLP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 20:11:10 +1000 (AEST)
X-QQ-mid: bizesmtp77t1694686245toprk6my
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Sep 2023 18:10:43 +0800 (CST)
X-QQ-SSF: 00200000000000907000000A0000000
X-QQ-FEAT: 90EFqYDyPxCndpA0WRvVFYqpvXtcHlZQDh/Cqugp3yRLwsIQKAk9g47pYc9Mq
	LzXogfu7JCws6b9/mqtzszOrYBbN00lySF96Nv77eXK6ms2eKMZbtrsGC/yNBLTeB/j8vE/
	9MU9Q8R6X9d6CqkJ2d4jOjowcfkY1Cv1+z/g+zG9h/Q3ClbW79qBk5z/UGnbBleGXAxVbs/
	/ykAeXZgNtOIFjzssCRJmfUhqbMuicOLVSHPoPT7BQSs+5o5sASn7m7k0tyIT7LKTpme+TY
	MhZTK/Zf52Qtlcb4lizqApY9Q6K1k2fdc8OQFDQjgwFxb/kyPaZBUJ/IjtdFaNKqIoNZ+6t
	OyxQl5r7iYLBPUD1ApeLox61sqjQdFWS+B+bXLXW4k/bTa3l3KkJUsDSxmZ6w==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8036691533754414126
From: Yuan Tan <tanyuan@tinylab.org>
To: mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu
Subject: [PATCH v3 3/3] powerpc/config: Simplify pmac32_defconfig
Date: Thu, 14 Sep 2023 18:10:42 +0800
Message-Id: <73716a14e9a24bcea4ca6c454aae308c419933c6.1694685860.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694685860.git.tanyuan@tinylab.org>
References: <cover.1694685860.git.tanyuan@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, linux@weissschuh.net, linux-kernel@vger.kernel.org, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu, tanyuan@tinylab.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Simplify pmac32_defconfig with POWER_RESET dependences.

Regenerate pmac32_defconfig with 'make savedefconfig'.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
---
 arch/powerpc/configs/pmac32_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 11d489c2c3e0..17df965be099 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -138,7 +138,6 @@ CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_ZERO=m
 CONFIG_ADB=y
-CONFIG_ADB_CUDA=y
 CONFIG_ADB_PMU=y
 CONFIG_ADB_PMU_LED=y
 CONFIG_ADB_PMU_LED_DISK=y
@@ -180,6 +179,7 @@ CONFIG_SERIAL_PMACZILOG=y
 CONFIG_SERIAL_PMACZILOG_TTYS=y
 CONFIG_SERIAL_PMACZILOG_CONSOLE=y
 CONFIG_I2C_CHARDEV=m
+CONFIG_POWER_RESET=y
 CONFIG_APM_POWER=y
 CONFIG_BATTERY_PMU=y
 CONFIG_HWMON=m
-- 
2.34.1

