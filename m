Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B03C4EB3A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 20:44:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSdlk1Jm6z2yn2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 05:44:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256 header.s=mail header.b=MK0FFNR/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=cutebit.org (client-ip=2a03:3b40:fe:f0::1; helo=hutie.ust.cz;
 envelope-from=povik+lin@cutebit.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=MK0FFNR/; dkim-atps=neutral
X-Greylist: delayed 329 seconds by postgrey-1.36 at boromir;
 Wed, 30 Mar 2022 05:44:14 AEDT
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSdl20HrKz2x9V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 05:44:13 +1100 (AEDT)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1648579115; bh=MNw6TZjQg12ilqVca1Iyk/1Sr/JwKEtEFZo4CqiuRdA=;
 h=From:To:Cc:Subject:Date;
 b=MK0FFNR/dSMhYqsYkSiQpNIza2jECdZ01Sz1FG5KrRdcROhl1cEAdsLSEG4wXdfeM
 eEMzqSrFbkDtDZ9SN0WP0Wmg5wGWgEy3BVWpFBv37e0G916tpdI4G+MZ3CvqY2yZzb
 ovpC3Ak2hp3f1boVZ3YgYRmmBggUEat5PHwD2+Dw=
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] i2c: pasemi: Wait for write xfers to finish
Date: Tue, 29 Mar 2022 20:38:17 +0200
Message-Id: <20220329183817.21656-1-povik+lin@cutebit.org>
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
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 Paul Mackerras <paulus@samba.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Jean Delvare <khali@linux-fr.org>, Janne Grunau <j@jannau.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wait for completion of write transfers before returning from the driver.
At first sight it may seem advantageous to leave write transfers queued
for the controller to carry out on its own time, but there's a couple of
issues with it:

 * Driver doesn't check for FIFO space.

 * The queued writes can complete while the driver is in its I2C read
   transfer path which means it will get confused by the raising of
   XEN (the 'transaction ended' signal). This can cause a spurious
   ENODATA error due to premature reading of the MRXFIFO register.

Adding the wait fixes some unreliability issues with the driver. There's
some efficiency cost to it (especially with pasemi_smb_waitready doing
its polling), but that will be alleviated once the driver receives
interrupt support.

Fixes: beb58aa39e6e ("i2c: PA Semi SMBus driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---

Tested on Apple's t8103 chip. To my knowledge the PA Semi controller
in its pre-Apple occurences behaves the same as far as this patch is
concerned.

 drivers/i2c/busses/i2c-pasemi-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 7728c8460dc0..9028ffb58cc0 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -137,6 +137,12 @@ static int pasemi_i2c_xfer_msg(struct i2c_adapter *adapter,
 
 		TXFIFO_WR(smbus, msg->buf[msg->len-1] |
 			  (stop ? MTXFIFO_STOP : 0));
+
+		if (stop) {
+			err = pasemi_smb_waitready(smbus);
+			if (err)
+				goto reset_out;
+		}
 	}
 
 	return 0;
-- 
2.33.0

