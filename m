Return-Path: <linuxppc-dev+bounces-6604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA420A4B29D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Mar 2025 16:34:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5QwL3VbJz3048;
	Mon,  3 Mar 2025 02:34:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.26
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740929650;
	cv=none; b=gBuqgHLVQ79ojxweQzRdD3YKaOiCtHDInhABCDeqFtsOplHqVp31fkFSIeM1LtE/OItR4UWENBR0S/NeTgrEBR6bnlre1tZsUjSmJBCok6cBZTIf8sA4Kp8T87VghbaATR77/u/Nr136gTcp5xLHRN91wF0IDCs4OcOgstx17KMaCVTMzHwe9vXbY7e2bw035WQh1f+WQfIDnla0OnArqIUOAdfzW2pmEf8KD0hoC+/hHU9nMfBPcZ2qyWdTvd2xVSGy+YGAKEUww+m1fk5nGIeOlh7M8ucosmL3nmLYzOT1cS51xWUTZPJpX+BjvkVVDzX625It063YEx6P8EH+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740929650; c=relaxed/relaxed;
	bh=KMpJ1cgSZnZMApMOU4s4omcRGFI4bQ1HNYVgjZASNXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lgg8fdi+awTCnXa63uGG82lOFmUNiIcrk3CKgHR/Z0Tr/pfVbFENl4TU6b3Srw9q0S+RaAlzrjSaUyyL5v+q7u1iYLQ2HiZmv9xjhl9RMc1QMHTML/tYscIzDUcVBIVp890jlf9kujN0jQ/FquHNIc1QOxbdhgan/HFsY1d9uMBSUMaJ3lDclHx1gIMOVHnwoBOmMa9erEKkk0sqWaX85JPYS4M9NBszFKdjeLN1yOX16ET2q4Dy+Wdnn6be+QXUD5/khSkhrCCutWEdKApx/MnNwm+GA3i7nafvD3Hq/QCWm71w9uA+d7O8QoHoij3EbADfwn0iN4a9gZ7cyOrmRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=Dx0/ybMq; dkim-atps=neutral; spf=pass (client-ip=80.12.242.26; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=Dx0/ybMq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.26; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5QwK4zbTz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 02:34:09 +1100 (AEDT)
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id okmqtJVk70yWRokn6t9OJ1; Sun, 02 Mar 2025 15:59:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740927581;
	bh=KMpJ1cgSZnZMApMOU4s4omcRGFI4bQ1HNYVgjZASNXo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Dx0/ybMqwXj8mbrXBHEK6pjr9gGi0LI4qtj1udzo9LebLiYUEKhR/IgPOG24dEoDK
	 NOIYY2bkElFeMi2bSqs4/EFCCw/gpEQ3g1jT6Mb2xQlxMZmBTGo0Ofu5OtDD1y6w4C
	 fEcfOBYRKV53Ji6SqTgbCSGVyshsgKXRCJVBEXY9Ycj719ran9PVo92lb6wJig9xPW
	 6rVY+E5CHdfrG0/yl95P6J9CbGOrOmcQqF60QKIHFOuQza5S/xR2vKmw9v2Jf/rc/A
	 JxRFbkpP0e1ORq8zuo0i+vRnEFfBKWtIpQ1e6bd6Vdj9w4b5x4A97CsoVm7HcNpzwm
	 m8aS0h8jNJxyw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Mar 2025 15:59:41 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] powerpc: gpio_mdio: Use devm_of_mdiobus_register()
Date: Sun,  2 Mar 2025 15:59:16 +0100
Message-ID: <639cf94e5b5f0f9532b65a34844165b889934d52.1740926808.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740926808.git.christophe.jaillet@wanadoo.fr>
References: <cover.1740926808.git.christophe.jaillet@wanadoo.fr>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use devm_of_mdiobus_register() in order to remove the now empty .remove()
function.

Doing so dev_set_drvdata() is now also unneeded. Remove it as well.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is compile tested only.
---
 arch/powerpc/platforms/pasemi/gpio_mdio.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/gpio_mdio.c b/arch/powerpc/platforms/pasemi/gpio_mdio.c
index 2c54f5f063b7..6712ccb84c0a 100644
--- a/arch/powerpc/platforms/pasemi/gpio_mdio.c
+++ b/arch/powerpc/platforms/pasemi/gpio_mdio.c
@@ -234,10 +234,8 @@ static int gpio_mdio_probe(struct platform_device *ofdev)
 	priv->mdio_pin = *prop;
 
 	new_bus->parent = dev;
-	dev_set_drvdata(dev, new_bus);
-
-	err = of_mdiobus_register(new_bus, np);
 
+	err = devm_of_mdiobus_register(dev, new_bus, np);
 	if (err != 0) {
 		pr_err("%s: Cannot register as MDIO bus, err %d\n",
 				new_bus->name, err);
@@ -247,16 +245,6 @@ static int gpio_mdio_probe(struct platform_device *ofdev)
 	return 0;
 }
 
-
-static void gpio_mdio_remove(struct platform_device *dev)
-{
-	struct mii_bus *bus = dev_get_drvdata(&dev->dev);
-
-	mdiobus_unregister(bus);
-
-	dev_set_drvdata(&dev->dev, NULL);
-}
-
 static const struct of_device_id gpio_mdio_match[] =
 {
 	{
@@ -269,7 +257,6 @@ MODULE_DEVICE_TABLE(of, gpio_mdio_match);
 static struct platform_driver gpio_mdio_driver =
 {
 	.probe		= gpio_mdio_probe,
-	.remove		= gpio_mdio_remove,
 	.driver = {
 		.name = "gpio-mdio-bitbang",
 		.of_match_table = gpio_mdio_match,
-- 
2.48.1


