Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3272E4AB20D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Feb 2022 21:27:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsLRd61zqz3bTH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 07:27:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256 header.s=mail header.b=pSRVUIiV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cutebit.org (client-ip=185.8.165.127; helo=hutie.ust.cz;
 envelope-from=povik+lin@cutebit.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=pSRVUIiV; dkim-atps=neutral
X-Greylist: delayed 359 seconds by postgrey-1.36 at boromir;
 Fri, 04 Feb 2022 21:05:56 AEDT
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqrlS0qPCz2xWx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 21:05:55 +1100 (AEDT)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1643968784; bh=HuUso6bEMXsKcUMes12+B/JL6MuAREtSTqsS7Va9Yk0=;
 h=From:To:Cc:Subject:Date;
 b=pSRVUIiVwm0AXy91+5lijVS54FRSb2o9brQR9V7QClMK29mhiL9ZXtFeTutwu9zSJ
 7afb2w59owbu7AHcFPPp1RtExaFC2VLtI5oPJkV6mo/E9MOEvzSxfxdRVDS9m6UEUO
 5kueD++/ApYD6EItRf65B1YfsP/oYiDaG0/cM57g=
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] i2c: pasemi: Drop I2C classes from platform driver variant
Date: Fri,  4 Feb 2022 10:59:14 +0100
Message-Id: <20220204095914.5678-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-Mailman-Approved-At: Mon, 07 Feb 2022 07:26:52 +1100
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 linuxppc-dev@lists.ozlabs.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop I2C device-probing classes from platform variant of the PASemi
controller as it is only used on platforms where I2C devices should
be instantiated in devicetree. (The I2C_CLASS_DEPRECATED flag is not
raised as up to this point no devices relied on the old behavior.)

Fixes: d88ae2932df0 ("i2c: pasemi: Add Apple platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
I am sending v2 as some people got their copy in v1 encrypted with
their WKD keys (by accident). I changed email provider since.

 drivers/i2c/busses/i2c-pasemi-core.c | 1 -
 drivers/i2c/busses/i2c-pasemi-pci.c  | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 4e161a4089d8..7728c8460dc0 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -333,7 +333,6 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 	smbus->adapter.owner = THIS_MODULE;
 	snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
 		 "PA Semi SMBus adapter (%s)", dev_name(smbus->dev));
-	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
 	smbus->adapter.algo = &smbus_algorithm;
 	smbus->adapter.algo_data = smbus;
 
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index 1ab1f28744fb..cfc89e04eb94 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -56,6 +56,7 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 	if (!smbus->ioaddr)
 		return -EBUSY;
 
+	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
 	error = pasemi_i2c_common_probe(smbus);
 	if (error)
 		return error;
-- 
2.33.0

