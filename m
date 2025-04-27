Return-Path: <linuxppc-dev+bounces-8058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7C4A9E2C5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 13:31:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zlkt76MCQz300F;
	Sun, 27 Apr 2025 21:31:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745753471;
	cv=none; b=GYQe0wMAexWc4tCEJvMWBMosw3IJ8N+cB4gV/64h56cw6WujyzZzcXbXoSTFa588usOhFM5J8VCl7caYKOxNPVCyilsjbb79UaFjOlQbueuMqMq7p0rubVE+R4QGNMitDbCwFnPXXXTSDvwGzteRF3yYv+oAY2gb+DQ8+FzJC6LlDb+YmNRb5A9w2318Ucg8sesG0Y4muTy5qBpjeC9BUreHWjNI2owcWOXcH/hXzmnR9rLIQLTr4Br7b4Eohps/7NmOxMivKPvejty+Eumrkt7ROsEJYmbi4QMhhONjr0CTSvnXQnP6KhgcVPZEqwSl/zregqOqebJqSbL9CABN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745753471; c=relaxed/relaxed;
	bh=ty5sP9LfN5etARY0VPfKAhrjkJpnP8lAKy+EsDHiRQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCaOj1Pmg2hL9330UOsfzVqOBuM1sCY9NVFozRxzkFMh69yJRiKgwJA7X+Dyr+mGE0ZEqjiNhyBHYNIeZxfRx5R3Xchyh18lmUYL4hVUR6wripetvQv2BHI283TjCFRZPCdUi/GfNpH40p/kaPDCLA1Hmw/e3Xg5wOW2aMwfOyZFSIxCFKj9ZliR2ZZJKaQZJxVGx2puuTsI24X/5ZpHRrK3H8k3jQMN9wYKjbAMepsraRKpB5N7G4ha9THZ0R+jJl7E3+p2mhPi5Yp8gA9Gv0YsdYd77HbbhjsKiI3/s5qtKs7MgZgj0qtlvwOkhQ8ERzJ4LeZGLML1JHf6ioRT8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DmqObJfS; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DmqObJfS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zlkt54zxjz2yqp
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 21:31:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56513A40155;
	Sun, 27 Apr 2025 11:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0FDFC4CEEF;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745753465;
	bh=nYEoUAOYWWe1YgrKh5F/Uu0ClKx/Vy3NGeA0qWcOwyo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DmqObJfSjvkHnlkZgErAaxvRjqcppPchhkfMe39U+sJFKtK5w4iCL7c9x6ObknXww
	 EicxT+HQ6/5+hvieORhsBZ6VkeAvE3cmMVSuS2BYhziV6O6weI/d1fVTmQbwz70NLE
	 48vX687s1P/ix4xLr1DYmXYTHIISIgTCdOyEDHiKA4B3doVmScS2ZGfQ6y2sUtw3V/
	 78HZvxM1AKJAblOgIsDdd72L8pp8ajiZArUk280ziOa8+71GyXLwYDvDeLq+YLX4td
	 iWjkjoxF8OsQAUcXmLzqSigRYE6rzwfbrj2ozFVFlSEJzHiUr+D4NWPRvOIlyXDA+a
	 gF8cpNsXhjBew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4935C369D1;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 27 Apr 2025 11:30:45 +0000
Subject: [PATCH v3 3/4] i2c: pasemi: Improve error recovery
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
Message-Id: <20250427-pasemi-fixes-v3-3-af28568296c0@svenpeter.dev>
References: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
In-Reply-To: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3408; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=RQjUShH7rfus6djDqHEQgJ89KeDc5Vm8l5ffHfaOO3w=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQwafaCnnKomj7TVR2fJPP2nrKIu1nnmY/XB6sRmL7W2Gl
 TN/u3zrKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAExk4wNGhrVvj6W+rlAuuXsr
 W8ns8tK0Hf2G+9n57Wq43vz8EOrK8Jjhf+CO+N5Tsxav/3Hhxfn8aVvfMWhIvs189/nVKb4s3op
 3F3kA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Hector Martin <marcan@marcan.st>

Add handling for all the missing error condition, and better recovery in
pasemi_smb_clear().

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 61 +++++++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index ee38e8a1e1f5d062384e85a2fd49d7da9257aacc..dad20ee0c6689eda309cb0374aa75b42669cbcdc 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -87,12 +87,31 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
 	reinit_completion(&smbus->irq_completion);
 }
 
-static void pasemi_smb_clear(struct pasemi_smbus *smbus)
+static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
 	unsigned int status;
+	int ret;
 
-	status = reg_read(smbus, REG_SMSTA);
+	/* First wait for the bus to go idle */
+	ret = readx_poll_timeout(ioread32, smbus->ioaddr + REG_SMSTA,
+				 status, !(status & (SMSTA_XIP | SMSTA_JAM)),
+				 USEC_PER_MSEC,
+				 USEC_PER_MSEC * PASEMI_TRANSFER_TIMEOUT_MS);
+
+	if (ret < 0) {
+		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
+		return -EIO;
+	}
+
+	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
+	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
+	    !(status & SMSTA_MTE))
+		pasemi_reset(smbus);
+
+	/* Clear the flags */
 	reg_write(smbus, REG_SMSTA, status);
+
+	return 0;
 }
 
 static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
@@ -130,9 +149,35 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 		}
 	}
 
+	/* Controller timeout? */
+	if (status & SMSTA_TOM) {
+		dev_err(smbus->dev, "Controller timeout, status 0x%08x\n", status);
+		return -EIO;
+	}
+
+	/* Peripheral timeout? */
+	if (status & SMSTA_MTO) {
+		dev_err(smbus->dev, "Peripheral timeout, status 0x%08x\n", status);
+		return -ETIME;
+	}
+
+	/* Still stuck in a transaction? */
+	if (status & SMSTA_XIP) {
+		dev_err(smbus->dev, "Bus stuck, status 0x%08x\n", status);
+		return -EIO;
+	}
+
+	/* Arbitration loss? */
+	if (status & SMSTA_MTA) {
+		dev_err(smbus->dev, "Arbitration loss, status 0x%08x\n", status);
+		return -EBUSY;
+	}
+
 	/* Got NACK? */
-	if (status & SMSTA_MTN)
+	if (status & SMSTA_MTN) {
+		dev_err(smbus->dev, "NACK, status 0x%08x\n", status);
 		return -ENXIO;
+	}
 
 	/* Clear XEN */
 	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
@@ -194,9 +239,9 @@ static int pasemi_i2c_xfer(struct i2c_adapter *adapter,
 	struct pasemi_smbus *smbus = adapter->algo_data;
 	int ret, i;
 
-	pasemi_smb_clear(smbus);
-
-	ret = 0;
+	ret = pasemi_smb_clear(smbus);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < num && !ret; i++)
 		ret = pasemi_i2c_xfer_msg(adapter, &msgs[i], (i == (num - 1)));
@@ -217,7 +262,9 @@ static int pasemi_smb_xfer(struct i2c_adapter *adapter,
 	addr <<= 1;
 	read_flag = read_write == I2C_SMBUS_READ;
 
-	pasemi_smb_clear(smbus);
+	err = pasemi_smb_clear(smbus);
+	if (err)
+		return err;
 
 	switch (size) {
 	case I2C_SMBUS_QUICK:

-- 
2.34.1



