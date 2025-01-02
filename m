Return-Path: <linuxppc-dev+bounces-4589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 869529FFE76
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:34:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgV5VXVz30ML;
	Fri,  3 Jan 2025 05:32:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842758;
	cv=none; b=n5lk1xm7xXAeSicS74vvRPJ/9CUHqT/DzbtlgyKmy/VF3zimNu2cO54qcRqxKBYSjsGb44QI7knGut+5iiQLZ+erj+byl1O2Q0CSyZcXt2kisesJcfDVALmm+VxTP01MkSOiHTVfF6VS7kvItj9Q824W7vKZlNmP4jWcFtBDrkqymC6o/jQmT0E4hjg0Z5wNgYDbnEK5tpHTe4G/gnFq7xts1eVeJf2iGPfj9mBpqGXSiFG6xxoI950uThKTKk2QCf0V/sTSgPXSgCNb1X7IHNULD8GIYftxte50zlMO5wJ+Z5wTOzrLvX4l5WhQWUzFOfoB5MmjJCORmQxbyKGiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842758; c=relaxed/relaxed;
	bh=ozhu2NYIoZMGV3JxwAIKt9CKHGigyb9SkDlWS05kVm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJD1U6CIIpWDxl/5JDKOYA2Bopu52FThSPEhXHk8i+2sUhyjL+Eww0NDaISvvYulTVNNFCCjINnZQMNV+55g+2LV2zSngHXZk9ynbKadRr4j+wDSc3a22RofITTlRVCqYMzticG8UPSaIn+FpAo3jWtUftg5/+5GM/PVjbPatGYP2XrejTGfEPWzrgWGkDGXEValqKNRm4ONQ3YKuW+a7PAVLGMnAJZKClJegbLAPoacWzEH3wRmfaMkKEY/jb0fOf/eWpEU1ANscxASWlF9SmArc5vw3O1Q0s2WaAMgT+jdjnpf5UfPaU5wAN/4W5/L4jd600K6YdTl3ar72tlLJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WHj33gmC; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WHj33gmC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgQ5SNRz30TL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5454E5C60BA;
	Thu,  2 Jan 2025 18:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0F0FC4CEDF;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=CtMO4XDv+FCIXowgX0+Oc7/qErBmyMlcIzYO5eJynzc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WHj33gmC+AtDrAMJ7ROFrVMnsV8dcBYosyrcRl+u8eXsp8LYctHBcRCbekA6il3AA
	 Zmz4p7xj/1MWRIakbKLSXkgJB8gWdAsBAtV2YUFjKDrr3iYTcRhDWzWdngOuicduTE
	 +a94DBdMosQ1VlOfjXyyFPP9qUVDtHuiHkQwWjuL14BW7EyiHjMfP3H1CzpuKwGKhK
	 aym9kZzBFNdzVipbMZ5mQVpiWsJwdXPz61pWLSZWSLQVMwtX/Y9EZwijXpGHt/XaG+
	 QZOoFiEDqsiHW5pLeAIMQ1uNPwQOdLaGkxU5PPwf+j960/gJiImKIrpzbLJu72kR45
	 CP7wBBj9snYVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E51E77198;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:59 +0100
Subject: [PATCH 18/19] powerpc: mpc83xx_defconfig: Enable NWAPP2 board
 features
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-18-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=2040;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=8cjjERboXjwasKowHGhF3NwI7IcXjBOlMpP4+b1yNfY=;
 b=pENUUbNIQp734t9sjGGUCevEG+k3KlEAjIRAbzlvB7faecKhTzZv1xTfwPphoY/E0Xtaqb7jX
 SI7pMQIuWWGCaweTUM4hr3VB+RhS5KSrkYoFXwVlQxu0zFovaY2QLde
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,UPPERCASE_50_75 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

These features are required (or at least helpful) for running Linux on
the LANCOM NWAPP2 board:

- GPIO restart/watchdog are required for operation
- The MPC83xx-internal watchdog is optional
- LEDs are nice to have
- ATH9K is on a removable mini-PCIe card
- ATH803X is the Ethernet PHY installed on the board

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/configs/mpc83xx_defconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/powerpc/configs/mpc83xx_defconfig b/arch/powerpc/configs/mpc83xx_defconfig
index 525a4f6ae1ff7b51e365668b430fa46ce4938f19..40dc455517defd42c7dd8a5414531eced79831f2 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -30,6 +30,9 @@ CONFIG_SYN_COOKIES=y
 CONFIG_INET_ESP=y
 # CONFIG_IPV6 is not set
 CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIEAER=y
+CONFIG_PCI_MSI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FW_LOADER is not set
@@ -54,6 +57,7 @@ CONFIG_GIANFAR=y
 CONFIG_DAVICOM_PHY=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MARVELL_PHY=y
+CONFIG_AT803X_PHY=y
 CONFIG_VITESSE_PHY=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
@@ -64,7 +68,17 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MPC=y
+CONFIG_SPI=y
+CONFIG_SPI_FSL_SPI=y
+CONFIG_GPIO_MPC8XXX=y
+CONFIG_GPIO_74X164=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_WATCHDOG=y
+CONFIG_GPIO_WATCHDOG=y
+CONFIG_GPIO_WATCHDOG_ARCH_INITCALL=y
+CONFIG_8xxx_WDT=y
+CONFIG_REGULATOR=y
 CONFIG_HID_A4TECH=y
 CONFIG_HID_BELKIN=y
 CONFIG_HID_CHERRY=y
@@ -82,6 +96,13 @@ CONFIG_USB=y
 CONFIG_USB_MON=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_FSL=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_CLASS_MULTICOLOR=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_GROUP_MULTICOLOR=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_DS1374=y

-- 
2.45.2



