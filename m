Return-Path: <linuxppc-dev+bounces-8056-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04FDA9E2BE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 13:31:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zlkt70WCxz2xRs;
	Sun, 27 Apr 2025 21:31:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745753470;
	cv=none; b=ehpLihUTwLwb/3WMbfaymKTwfqZ6KspBBAPqM1LCboYCA5vVJFnK+4898qz3nPzVHkrN02M61MEOGfzXYcvpA+vWFueNQu6rS2NiONP7KldgNlVoMbY1hGfqxJhwD0G7/JkA7Zg2EdB+3QjCiV7iMbhcDX/U2h0/iQy2WybMCNccaGf6zY221aR8WBHllf1/wKPKPC4BssNx+QE2WF6diLthQUBGYTB9b4341XKfeAPcd69bpsTtjyh3k+LQ/RbOZiywmh5spFJAn4M3yNfmS0HFkg1N23C2nzjrY8Bit6wFAxuC1FFys9stWOCAojn0rrZv4whvVL/PEZq2xn2QPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745753470; c=relaxed/relaxed;
	bh=fL05gORsxok+msUyXLgoEfbclxBIDnZpZXVNz5j6TQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IL1QqS1XlPTEH8qC5oe72Kh/nz82hw/e9RTeQA8WzVu1EePPkJzORQC+uaJ3u+9W6rmH4EJ5IqmrJy85Ga5bUze+i6qNJCGeIgeiUwUn80VZkd/dTD4wEv1imE8YMGlpmPAGaAp9hqA8+f++3YVPuFC36qyEiGKBpFs5ri3dqf690CEXVl7Fk32fQ3mYr5HaY/8XiZe8xnY4byZEtAlnlXtBr+1F6x0J4vugHbSH1UdTXyx2Z1gEAgVknSNC/oCk3aFFiskRICf2kDO8Q9VEW1FXEPWqD5X8vtHgMP93fHxi+ILDPaM2zy4BzRCRAkGZk8sCSVWY5qXX31kcRRr0zQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vi2nZBoA; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Vi2nZBoA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+sven.svenpeter.dev@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zlkt459Ybz2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 21:31:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 577D9614AB;
	Sun, 27 Apr 2025 11:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A38FFC4AF09;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745753465;
	bh=S4z7nos27hI/7ufS5vv7byZtBgt3zdHjyqnqgydLOG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vi2nZBoAXHz+LdW2JtLmRp9St4kEW0p4FCErubxlBkI3niI306TAyfRK1NiBzuqvh
	 b1F485McK+a3DR1skKEoxB3RAK0yYfiSHo3HlLH1tfM2elkEHCiKF7pQd1TN6JP17k
	 N6xJEdLDIouhCspG0b1TPNX3SpB3ZC49cyoDOprPxgU9sjEnW15Q/Hsicuv5hMKK7H
	 P7qIqbSf24fiDUMhPmvg/OFrY+8TLVobzFGmIrZIa5dAp3vrqW5Unn9xC0kOAfhodN
	 ce9WKbCsRNMYZQT/v5G3hEmvXdPQRL/2/kccayOMuIk0ntEhCyq9ShbGQkbDiUQFoq
	 lnDKbriZUHFlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965B5C369DC;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 27 Apr 2025 11:30:44 +0000
Subject: [PATCH v3 2/4] i2c: pasemi: Improve timeout handling
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
Message-Id: <20250427-pasemi-fixes-v3-2-af28568296c0@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3201; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=Ymd7PRyxpRzDKy8qH3xCi40gQpZYxfTSb89hsdr26SY=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQwafaPG+qs01Hw2ePLjJX2BzQCNpflYco5LOcgN2DZczZ
 zJtrKQ7SlkYxDgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABN5K8XIsG/1rvhWyy0vUh/M
 jb89KW4Fh03/nk3WU1kWRIaYHnxy1ovhr+CLAw/XWKlEqOteFl6cpj+n7eCHmIete9hyXmx8oLD
 xGhcA
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

From: Sven Peter <sven@svenpeter.dev>

The hardware (supposedly) has a 25ms timeout for clock stretching
and the driver uses 100ms which should be plenty.
The interrupt path however misses handling for errors while waiting for
the completion and the polling path uses an open-coded readx_poll_timeout.
Note that we drop reg_write(smbus, REG_SMSTA, status) while fixing those
issues here which will be done anyway whenever the next transaction starts
via pasemi_smb_clear.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 41 +++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 3f5571a90c1d268ea2a9d95285f1a5e47f0481ff..ee38e8a1e1f5d062384e85a2fd49d7da9257aacc 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -52,6 +53,12 @@
 #define CTL_UJM		BIT(8)
 #define CTL_CLK_M	GENMASK(7, 0)
 
+/*
+ * The hardware (supposedly) has a 25ms timeout for clock stretching, thus
+ * use 100ms here which should be plenty.
+ */
+#define PASEMI_TRANSFER_TIMEOUT_MS	100
+
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
 	dev_dbg(smbus->dev, "smbus write reg %x val %08x\n", reg, val);
@@ -90,20 +97,36 @@ static void pasemi_smb_clear(struct pasemi_smbus *smbus)
 
 static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 {
-	int timeout = 100;
 	unsigned int status;
 
 	if (smbus->use_irq) {
 		reinit_completion(&smbus->irq_completion);
 		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
-		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
+		int ret = wait_for_completion_timeout(
+				&smbus->irq_completion,
+				msecs_to_jiffies(PASEMI_TRANSFER_TIMEOUT_MS));
 		reg_write(smbus, REG_IMASK, 0);
 		status = reg_read(smbus, REG_SMSTA);
+
+		if (ret < 0) {
+			dev_err(smbus->dev,
+				"Completion wait failed with %d, status 0x%08x\n",
+				ret, status);
+			return ret;
+		} else if (ret == 0) {
+			dev_err(smbus->dev, "Timeout, status 0x%08x\n", status);
+			return -ETIME;
+		}
 	} else {
-		status = reg_read(smbus, REG_SMSTA);
-		while (!(status & SMSTA_XEN) && timeout--) {
-			msleep(1);
-			status = reg_read(smbus, REG_SMSTA);
+		int ret = readx_poll_timeout(
+				ioread32, smbus->ioaddr + REG_SMSTA,
+				status, status & SMSTA_XEN,
+				USEC_PER_MSEC,
+				USEC_PER_MSEC * PASEMI_TRANSFER_TIMEOUT_MS);
+
+		if (ret < 0) {
+			dev_err(smbus->dev, "Timeout, status 0x%08x\n", status);
+			return -ETIME;
 		}
 	}
 
@@ -111,12 +134,6 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 	if (status & SMSTA_MTN)
 		return -ENXIO;
 
-	if (timeout < 0) {
-		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
-		reg_write(smbus, REG_SMSTA, status);
-		return -ETIME;
-	}
-
 	/* Clear XEN */
 	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
 

-- 
2.34.1



