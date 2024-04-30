Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4E28B7579
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 14:11:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=NC7lA5mm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTJvW24Fwz3cTM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 22:11:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=NC7lA5mm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTJtj73w9z3c4v
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 22:10:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=V+732hzn1l15Eh
	TbXn3tkfLxL3DCfbD6/48+e8dQkGs=; b=NC7lA5mmCa8iyeQTDcuyxglnUmYDfO
	e+gXEdceVW1jtNvmiJb7dxHaTlqu6jwVijUEULxJSyu048MoqIRPR2y4ci7aN4Hx
	4xuGqKjg1xdWiXPwNA4pZG9atSmjIaXJsiIJp+XghabDOR4tjCAP+zvsJ9mlnm0c
	eQQseMtXBAIbrdOcfXqcWutpVGY9imomP90dymVPbdKoy4B9cdiU3UQFU2rT4hCt
	p5YDZsun2mHSCzDKjoOTrXcCqi55OIRs81ySfdFSExFC77VqyCOil4JH02XWq/1w
	iIxVnJGhJmzpQeKY9W2y+mmH3eMcI1/OSYoa+ot8KtGhh6prSKaB7oRA==
Received: (qmail 2626393 invoked from network); 30 Apr 2024 14:10:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Apr 2024 14:10:28 +0200
X-UD-Smtp-Session: l3s3148p1@I/N0QU8XZMtehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/1] ALSA: aoa: soundbus: i2sbus: pcm: use 'time_left' variable with wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 14:10:27 +0200
Message-ID: <20240430121028.30443-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Fix to the proper variable type 'unsigned long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 sound/aoa/soundbus/i2sbus/pcm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index 07df5cc0f2d7..98b812ffbde6 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -255,24 +255,24 @@ static void i2sbus_wait_for_stop(struct i2sbus_dev *i2sdev,
 {
 	unsigned long flags;
 	DECLARE_COMPLETION_ONSTACK(done);
-	long timeout;
+	unsigned long time_left;
 
 	spin_lock_irqsave(&i2sdev->low_lock, flags);
 	if (pi->dbdma_ring.stopping) {
 		pi->stop_completion = &done;
 		spin_unlock_irqrestore(&i2sdev->low_lock, flags);
-		timeout = wait_for_completion_timeout(&done, HZ);
+		time_left = wait_for_completion_timeout(&done, HZ);
 		spin_lock_irqsave(&i2sdev->low_lock, flags);
 		pi->stop_completion = NULL;
-		if (timeout == 0) {
+		if (time_left == 0) {
 			/* timeout expired, stop dbdma forcefully */
 			printk(KERN_ERR "i2sbus_wait_for_stop: timed out\n");
 			/* make sure RUN, PAUSE and S0 bits are cleared */
 			out_le32(&pi->dbdma->control, (RUN | PAUSE | 1) << 16);
 			pi->dbdma_ring.stopping = 0;
-			timeout = 10;
+			time_left = 10;
 			while (in_le32(&pi->dbdma->status) & ACTIVE) {
-				if (--timeout <= 0)
+				if (--time_left <= 0)
 					break;
 				udelay(1);
 			}
-- 
2.43.0

