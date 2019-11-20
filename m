Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B9E103CB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 14:57:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J4560xyVzDqDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 00:57:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="j8Juw7SA"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J3kW3kt5zDqC8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 00:41:23 +1100 (AEDT)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7865D224FC;
 Wed, 20 Nov 2019 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574257279;
 bh=sQh4Zt8A1arLPOqnpOUwICeXnrQlFAcd5K4SPGrn8Ro=;
 h=From:To:Cc:Subject:Date:From;
 b=j8Juw7SAFLG44sxbN2azVdvyzhHMSenYIPESRF5HakSp6ds0bFnzRqXRv3lhQletN
 uvXeO71xpX5IIwPWZzLktxM/VvKZI43J6fabIFvqHeN7/niwuey9Vj6J6a7SecHyVA
 iEPs+BXFfK/KTDONFNpKRj5XAdiSSbDOh9zmEupk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] macintosh: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:41:15 +0800
Message-Id: <20191120134115.14918-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: linuxppc-dev@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/macintosh/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index 574e122ae105..cbd46c1c5bf7 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -178,7 +178,7 @@ config THERM_ADT746X
 	depends on I2C && I2C_POWERMAC && PPC_PMAC && !PPC_PMAC64
 	help
 	  This driver provides some thermostat and fan control for the
-          iBook G4, and the ATI based aluminium PowerBooks, allowing slightly
+	  iBook G4, and the ATI based aluminium PowerBooks, allowing slightly
 	  better fan behaviour by default, and some manual control.
 
 config WINDFARM
@@ -214,7 +214,7 @@ config WINDFARM_PM91
 	select I2C_POWERMAC
 	help
 	  This driver provides thermal control for the PowerMac9,1
-          which is the recent (SMU based) single CPU desktop G5
+	  which is the recent (SMU based) single CPU desktop G5
 
 config WINDFARM_PM112
 	tristate "Support for thermal management on PowerMac11,2"
@@ -242,7 +242,7 @@ config PMAC_RACKMETER
 	depends on PPC_PMAC
 	help
 	  This driver provides some support to control the front panel
-          blue LEDs "vu-meter" of the XServer macs.
+	  blue LEDs "vu-meter" of the XServer macs.
 
 config SENSORS_AMS
 	tristate "Apple Motion Sensor driver"
-- 
2.17.1

