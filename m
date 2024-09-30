Return-Path: <linuxppc-dev+bounces-1698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC0298AFA6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 00:11:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHZzf2c1vz2xMQ;
	Tue,  1 Oct 2024 08:11:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:1800:120:4::f00:11"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727708930;
	cv=none; b=PLzeHy6xBnp+t8ygCANW34Z+2zJB54WwXNFrhRwx43rw8JZrobdspnNAZ1t66VXydLfiMZ0/Kvcb0LtEngraRkL40oXS5GHXbcDWb1Kd1lXMRdcpEzFJPvllHBUFyegmxoKrC5xVjS8lp3QnxJnImD4XOEysGfwNzJ4WaA0EpzLOj3SeMizYRzqemFHZV+0ReNQb25AlFmIVbkrmJanP33PgAS5oAXTLRiNtpVd96iBwP5xQveB6zY4bbt6QBus2BzNwtQQsV7T/jwa7FUARwW5MzIS2oe42q5UxFem8o9FCXh5eRX31iAmSFOXk52pE/q2e/WHYnJQXrMS7WTpocA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727708930; c=relaxed/relaxed;
	bh=3v2n15fuRXu8yFTBL0ZAJ/mu4EO8nwPGK3Xc8xqXrfI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Um0cU9jcW0YVqvQPfI4cJRSGXOG5gT51P7yrjGWNek1rOR3T7eQENtITnBV37tdz0ENPHW2EfVEPnHcty3YcMnBdBsQzFyFKQRxszSo+c7HH4pJxENPcu876SUKDOPCcUUbRwxJ7QsU1t2gx+CMjenMCb+m2DAEAHOTssPWO9fIzSyCZZAMPw5xYtwjt/GQP+s9m3gazbUX68P47CAg6Qyrv3gOkeCSoGRx0wn1MrctHb1wCwxaBKbG+PvaSs1POaMbsYIIJm83gjM9sQKasyoN40elDo/jFtDA6XkdGPxumk/h7L0cZB946rjTGzWlBf3nTsXp/krRr54WOcT1t5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=2a02:1800:120:4::f00:11; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=gauss.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=gauss.telenet-ops.be (client-ip=2a02:1800:120:4::f00:11; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [IPv6:2a02:1800:120:4::f00:11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHPbj42H6z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 01:08:47 +1000 (AEST)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4XHPbV2wtZz4xCRW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 17:08:38 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:99bb:7ad4:7fac:370a])
	by albert.telenet-ops.be with cmsmtp
	id Jf8b2D00E4pGYif06f8biQ; Mon, 30 Sep 2024 17:08:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svI0h-000wdt-PO;
	Mon, 30 Sep 2024 17:08:35 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svI0p-000acd-68;
	Mon, 30 Sep 2024 17:08:35 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: fsl: cpm1: qmc: Do not use IS_ERR_VALUE() on error pointers
Date: Mon, 30 Sep 2024 17:08:31 +0200
Message-Id: <8b113596b2c8cdda6655346232cc603efdeb935a.1727708905.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ppc64_book3e_allmodconfig:

    drivers/soc/fsl/qe/qmc.c: In function ‘qmc_qe_init_resources’:
    include/linux/err.h:28:49: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
       28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
	  |                                                 ^
    include/linux/compiler.h:77:45: note: in definition of macro ‘unlikely’
       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
	  |                                             ^
    drivers/soc/fsl/qe/qmc.c:1764:13: note: in expansion of macro ‘IS_ERR_VALUE’
     1764 |         if (IS_ERR_VALUE(info)) {
	  |             ^~~~~~~~~~~~

IS_ERR_VALUE() is only meant for pointers.  Fix this by checking for a
negative error value instead, which matches the documented behavior of
devm_qe_muram_alloc() aka devm_cpm_muram_alloc().
While at it, remove the unneeded print in case of a memory allocation
failure, and propagate the returned error code.

Fixes: eb680d563089e55b ("soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) implementation")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/soc/fsl/qe/qmc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 3dffebb48b0daced..659c579d751d7240 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1761,10 +1761,9 @@ static int qmc_qe_init_resources(struct qmc *qmc, struct platform_device *pdev)
 	 */
 	info = devm_qe_muram_alloc(qmc->dev, UCC_SLOW_PRAM_SIZE + 2 * 64,
 				   ALIGNMENT_OF_UCC_SLOW_PRAM);
-	if (IS_ERR_VALUE(info)) {
-		dev_err(qmc->dev, "cannot allocate MURAM for PRAM");
-		return -ENOMEM;
-	}
+	if (info < 0)
+		return info;
+
 	if (!qe_issue_cmd(QE_ASSIGN_PAGE_TO_DEVICE, qmc->qe_subblock,
 			  QE_CR_PROTOCOL_UNSPECIFIED, info)) {
 		dev_err(qmc->dev, "QE_ASSIGN_PAGE_TO_DEVICE cmd failed");
-- 
2.34.1


