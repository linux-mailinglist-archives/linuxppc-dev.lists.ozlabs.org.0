Return-Path: <linuxppc-dev+bounces-4895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 743D1A06EF2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 08:20:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTGQG3XbDz30gv;
	Thu,  9 Jan 2025 18:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736407206;
	cv=none; b=Esmion7wYHwKNof2B1urv29mXXr2sMhgu9j6dXfqqmumuH/udRvP27TXKZPSqXHdzlodOENpU4hsCcE8C32RIfkLPoOVl5bo7YB0z/QQ1x6tauUNILZ9y1RnJvl/hzQNMqcTJk/KyMfwuC45bff0A0DrRt+m3JXtoGiemZxl8iZRWtajUKdpYCNFp2PucXoQYWc08lvCpwnTOX5akTAchyWJZJHSo1Yra8+LjBTFmlTMEu92JEo3G++Pb3EY/eiYsSYELiGMewB+/wDkj76v3ZaR032XZBYx3gyHhzgPg4O4ktLp4A4sKu/pOFoBZGvHOToPXQQNO2Z4M3efz7/pcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736407206; c=relaxed/relaxed;
	bh=Qa1FdIWdVXNz9JOGkdWOPzQlstOkRCvFaLMPQsCn1nY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Plo37OHVRgrxqjZ/OE3aTcFpxB/JumjfrnrCLGEiSx5nAeBnre//yUTsEpF8liVOeiXEbd0p2Q/mK6bk5/An9wjxRmxCCgYMc+4L3SRiWsFP67KHd4+au8S/fscEzJtosihrIoEYF6rPyyRc/FxVzQ2WDeyyymdwkgGFqIPJqmyfuJe7R9UiCGydLwsWZNh22QSa3knbEE7nT+AGFlEHO84U2unAKD2fismfnnSvrY7qfCASZ5RI584KGGQmr43jRIZSy7t+lA4RxArDzjGTex65QG+bkOpf2hjROGu6rGW8oYgty03gsVq0Y9IG492uAlV0pjFgrM72jK8dRkqGcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTGQF1jtvz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 18:20:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YTFnw6LVJz9sRs;
	Thu,  9 Jan 2025 07:52:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2h3jIhsljL5N; Thu,  9 Jan 2025 07:52:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YTFnm5G9Pz9sSq;
	Thu,  9 Jan 2025 07:51:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A34EA8B783;
	Thu,  9 Jan 2025 07:51:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id M-S0U1JqzR4O; Thu,  9 Jan 2025 07:51:56 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F7EA8B768;
	Thu,  9 Jan 2025 07:51:56 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mark Brown <broonie@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: fsl-spi: Remove display of virtual address
Date: Thu,  9 Jan 2025 07:51:45 +0100
Message-ID: <8a37a960ff084dfdb9233849c00714e9317ae6a5.1736405336.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736405504; l=917; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=XZ+TmCmIoTk93QwY0Hm3NJ2mY6ezenPMduW2uK/ZBAc=; b=YusKL3SFI3figWCbegHgaqV7ZBjGdUqRWCKXEvhTmrtQCognm2r22fC3dzoqhSUdfjN6Rz10C HmjjixNnzgzAmAqT6no73LmwOyv4G/NT+Fu0KH1PLgrlV5JxYvQrEFx
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The following appears in kernel log at boot:

	fsl_spi b01004c0.spi: at 0x(ptrval) (irq = 51), QE mode

This is useless, so remove the display of that virtual address and
display the MMIO address instead, just like serial core does.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/spi/spi-fsl-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-spi.c b/drivers/spi/spi-fsl-spi.c
index 856a4a9def66..2f2082652a1a 100644
--- a/drivers/spi/spi-fsl-spi.c
+++ b/drivers/spi/spi-fsl-spi.c
@@ -618,7 +618,7 @@ static struct spi_controller *fsl_spi_probe(struct device *dev,
 	if (ret < 0)
 		goto err_probe;
 
-	dev_info(dev, "at 0x%p (irq = %d), %s mode\n", reg_base,
+	dev_info(dev, "at MMIO %pa (irq = %d), %s mode\n", &mem->start,
 		 mpc8xxx_spi->irq, mpc8xxx_spi_strmode(mpc8xxx_spi->flags));
 
 	return host;
-- 
2.47.0


