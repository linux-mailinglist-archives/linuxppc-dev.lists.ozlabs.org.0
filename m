Return-Path: <linuxppc-dev+bounces-6391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD15AA40BE5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2025 23:46:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z0htk2wwrz2yVT;
	Sun, 23 Feb 2025 09:46:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740231527;
	cv=none; b=bXmwgAl/WzOQ4iK42/O1Jh7aWk1ocJcrx03mi9lnOr0cOXMKKLX7tsGW6uKHAWfQjVgVn0FKE3YX6FkPsfAiVDIooVwwYGkGKrDa3VHrrhMdRelHCAXziTkcrjVxRMoQCH6yGO7OtsQ/6WfA0Yop8uFDRNq/65WomvkJwRkekxYLv/+pIprj6z/HCqNtoCIMhX7+EOAtrHV7EIdpPMEInQ0QQ2lhg9kZQkIDOqTNT18bB7r/OjDqaSjVywV8GQMwVdxc7vxFmuNV7ei4x0IvUscUnXvZKRaWgybjeRAy0YS4gSGneUnweLRSWKCB3YcCFKCCTH67/0x1wmY7ZU4OyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740231527; c=relaxed/relaxed;
	bh=CLXAfmXaGriUIRefxyaQBd27LIBV1HDxn0UO9rquAAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZALYIe/CfUmKk6XImSw5Xb+WFXtIUyWBJ2t89byCL8rpEnulUtqkJqv+680hoM66kSBnnIpDXywcXM4qRp5eLRgUbeUGWioP7l4ZB9hUDxbEGuYXsfO90I5GkJxYgm9nO3rtzD50LVTnHex6bDnoqQW2/cgeFUKE8BZVnwZ2ZMOMLorVykniDhXeG6JS6WCvcMYJGuV1RdFtG1ed2q7qu5dARMBhTe3olFgZY5lARSdGBLWUQSvCR/KEeMEFEdHyIOcvs+8ManKGleDuk/qMZ5UhJM4h1Fg57XVuRUMlfVBGnxQz/SZT4dAvuUWfNjcWoifMZ/ZkeCVX7itR2cakg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B0yifpRA; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B0yifpRA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z0Skt3K0zz2ytQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Feb 2025 00:38:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F05675C57DC;
	Sat, 22 Feb 2025 13:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63EAAC4CEE8;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=stV9tpnov4yN5EBBC898RB20QY2wQygLqqMwvyDN5Eo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B0yifpRAfaIfxTZ/0+9c3+UJ6qN5Dz2MYeH33+yGul4+clHOoYOKj7b62QejMT/8g
	 S2CYW0YgBcPqT15Iel2fnamnYJtolkQujb5QiIQsPTkZdjqLWXT7CU4ksITzjNvJme
	 3d4WC6R1R5DAgSMl2jSpFMrFEJJBtx0cnCv/iiaAk1XbvL4U+/1lDEIgAQ3UBcvPw3
	 njE1qDOjvXAQliL9xTzqGJZOjKRdSCHxoWzDjLva1JB9wYfEweoMyEP4bsx9JsX2qP
	 d6ZJpK0fstVTAsVJaPQsaRyx+bQOaO0r7zTn6AnlWTFK8XsWNWrUJuxSIBDSlNgPIs
	 12puhG4AUFbeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EF4C021B5;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 13:38:34 +0000
Subject: [PATCH 2/4] i2c: pasemi: Improve error recovery
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
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-pasemi-fixes-v1-2-d7ea33d50c5e@svenpeter.dev>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4391; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=FOQIV4q7QbwGt8D9/MCWC8cZNMpith++DiclVxlmaig=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOyzHXHGYEMRdvvZQdf+b35HAG7jV1fXEBv+3epzBOj
 Pfwu3K+o5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRhpmMDGfYv3fz+dwVN3j+
 47OXaKGTUe2hyf/CpdvNZfxfSR8pY2Rk6BTTbD4r61F6tmjvwZU3dq5/MKWRSXnxd41XE9lvpYp
 PZwYA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Hector Martin <marcan@marcan.st>

The hardware (supposedly) has a 25ms timeout for clock stretching
and the driver uses 100ms which should be plenty. The error
reocvery itself is however lacking.

Add handling for all the missing error condition, and better recovery in
pasemi_smb_clear(). Also move the timeout to a #define since it's used
in multiple places now.

Signed-off-by: Hector Martin <marcan@marcan.st>
[sven: adjusted commit message after splitting the commit into two]
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 70 +++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index bd128ab2e2eb..770b86b92a10 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -52,6 +52,8 @@
 #define CTL_UJM		BIT(8)
 #define CTL_CLK_M	GENMASK(7, 0)
 
+#define TRANSFER_TIMEOUT_MS	100
+
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
 	dev_dbg(smbus->dev, "smbus write reg %x val %08x\n", reg, val);
@@ -80,23 +82,45 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
 	reinit_completion(&smbus->irq_completion);
 }
 
-static void pasemi_smb_clear(struct pasemi_smbus *smbus)
+static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
 	unsigned int status;
+	int timeout = TRANSFER_TIMEOUT_MS;
 
 	status = reg_read(smbus, REG_SMSTA);
+
+	/* First wait for the bus to go idle */
+	while ((status & (SMSTA_XIP | SMSTA_JAM)) && timeout--) {
+		msleep(1);
+		status = reg_read(smbus, REG_SMSTA);
+	}
+
+	if (timeout < 0) {
+		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
+		return -EIO;
+	}
+
+	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
+	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
+		!(status & SMSTA_MTE))
+		pasemi_reset(smbus);
+
+	/* Clear the flags */
 	reg_write(smbus, REG_SMSTA, status);
+
+	return 0;
 }
 
 static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 {
-	int timeout = 100;
+	int timeout = TRANSFER_TIMEOUT_MS;
 	unsigned int status;
 
 	if (smbus->use_irq) {
 		reinit_completion(&smbus->irq_completion);
-		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
-		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
+		/* XEN should be set when a transaction terminates, whether due to error or not */
+		reg_write(smbus, REG_IMASK, SMSTA_XEN);
+		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(timeout));
 		reg_write(smbus, REG_IMASK, 0);
 		status = reg_read(smbus, REG_SMSTA);
 	} else {
@@ -107,16 +131,36 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 		}
 	}
 
-	/* Got NACK? */
-	if (status & SMSTA_MTN)
-		return -ENXIO;
+	/* Controller timeout? */
+	if (status & SMSTA_TOM) {
+		dev_warn(smbus->dev, "Controller timeout, status 0x%08x\n", status);
+		return -EIO;
+	}
 
-	if (timeout < 0) {
-		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
-		reg_write(smbus, REG_SMSTA, status);
+	/* Peripheral timeout? */
+	if (status & SMSTA_MTO) {
+		dev_warn(smbus->dev, "Peripheral timeout, status 0x%08x\n", status);
 		return -ETIME;
 	}
 
+	/* Still stuck in a transaction? */
+	if (status & SMSTA_XIP) {
+		dev_warn(smbus->dev, "Bus stuck, status 0x%08x\n", status);
+		return -EIO;
+	}
+
+	/* Arbitration loss? */
+	if (status & SMSTA_MTA) {
+		dev_warn(smbus->dev, "Arbitration loss, status 0x%08x\n", status);
+		return -EBUSY;
+	}
+
+	/* Got NACK? */
+	if (status & SMSTA_MTN) {
+		dev_warn(smbus->dev, "NACK, status 0x%08x\n", status);
+		return -ENXIO;
+	}
+
 	/* Clear XEN */
 	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
 
@@ -177,7 +221,8 @@ static int pasemi_i2c_xfer(struct i2c_adapter *adapter,
 	struct pasemi_smbus *smbus = adapter->algo_data;
 	int ret, i;
 
-	pasemi_smb_clear(smbus);
+	if (pasemi_smb_clear(smbus))
+		return -EIO;
 
 	ret = 0;
 
@@ -200,7 +245,8 @@ static int pasemi_smb_xfer(struct i2c_adapter *adapter,
 	addr <<= 1;
 	read_flag = read_write == I2C_SMBUS_READ;
 
-	pasemi_smb_clear(smbus);
+	if (pasemi_smb_clear(smbus))
+		return -EIO;
 
 	switch (size) {
 	case I2C_SMBUS_QUICK:

-- 
2.34.1



