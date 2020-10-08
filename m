Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5922871B4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 11:38:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6R2q4YVkzDqW8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 20:38:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6QzF4k48zDqM6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 20:35:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C6Qz34GzYz9v0Jf;
 Thu,  8 Oct 2020 11:34:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Dxf-B-Usr2rW; Thu,  8 Oct 2020 11:34:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C6Qz33DdTz9v0Jb;
 Thu,  8 Oct 2020 11:34:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A4C818B830;
 Thu,  8 Oct 2020 11:34:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PPROgbo_lq6s; Thu,  8 Oct 2020 11:34:56 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 63F018B82F;
 Thu,  8 Oct 2020 11:34:56 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3C9D065DCA; Thu,  8 Oct 2020 09:34:56 +0000 (UTC)
Message-Id: <002585b74fd8d24b051b6445a7de1058c14afde6.1602149655.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] crypto: talitos - Fix return type of current_desc_hdr()
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Date: Thu,  8 Oct 2020 09:34:56 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

current_desc_hdr() returns a u32 but in fact this is a __be32,
leading to a lot of sparse warnings.

Change the return type to __be32 and ensure it is handled as
sure by the caller.

Fixes: 3e721aeb3df3 ("crypto: talitos - handle descriptor not found in error path")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/crypto/talitos.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 7c547352a862..f9f0d34d49f3 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -460,7 +460,7 @@ DEF_TALITOS2_DONE(ch1_3, TALITOS2_ISR_CH_1_3_DONE)
 /*
  * locate current (offending) descriptor
  */
-static u32 current_desc_hdr(struct device *dev, int ch)
+static __be32 current_desc_hdr(struct device *dev, int ch)
 {
 	struct talitos_private *priv = dev_get_drvdata(dev);
 	int tail, iter;
@@ -501,13 +501,13 @@ static u32 current_desc_hdr(struct device *dev, int ch)
 /*
  * user diagnostics; report root cause of error based on execution unit status
  */
-static void report_eu_error(struct device *dev, int ch, u32 desc_hdr)
+static void report_eu_error(struct device *dev, int ch, __be32 desc_hdr)
 {
 	struct talitos_private *priv = dev_get_drvdata(dev);
 	int i;
 
 	if (!desc_hdr)
-		desc_hdr = in_be32(priv->chan[ch].reg + TALITOS_DESCBUF);
+		desc_hdr = cpu_to_be32(in_be32(priv->chan[ch].reg + TALITOS_DESCBUF));
 
 	switch (desc_hdr & DESC_HDR_SEL0_MASK) {
 	case DESC_HDR_SEL0_AFEU:
-- 
2.25.0

