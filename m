Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5775A7F7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 16:03:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHm9g1fTzz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 00:03:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=THxxbMkG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=cgel.zte@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=THxxbMkG;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHm920q38z2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 00:02:59 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id 145so14148267pfw.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=HUyOr5FedssBlryfN/1PxbuuG/tFo/uBwIYcDSDQTHM=;
        b=THxxbMkGuCNE0GYzQ8ouO8of8iFU/xAgUBv6p4Z90mDaOKDE2ZVQ5zycypjclwPJ+S
         H9CKfVBwJQJrFvI6fo3D/D6xQDHtqGlPUnP+GBfUJ7z8S5c/mbictcu3JnEdeK/hy1yN
         Qb3wqBj69bAEHUYHyrdKJhUBV7OHxxFl3CzlfUtFomJkr08bVTl7Ygst50z8sXvtXDhl
         yFAurEcm9JwBLtWZiyYmypiII+XU2HqKbpSUZXB9AZKRQALaQB3TKELXLiE3FkevANN2
         wYLe2D258jtkre94YubAmLrASqRSbkRQRju22h8zwesHeFdlyZT/7zWnljXLR/ydHCy3
         AjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=HUyOr5FedssBlryfN/1PxbuuG/tFo/uBwIYcDSDQTHM=;
        b=DELVsDP3dV0lGp6hP8dxOZ1EDz37DLR3tCMnHe94aT/BsqaP56jxLq7qxXvLBo+w/2
         bxiiOOuMGXQ/dfC1lA8IyP+2mH9/G4uhJBp0f5rJOs3lxotr4gLNDRnxlKg+2EeAd7WK
         Zx/ByacrYYx45M06zcnKuX8jmfmthXr38AwyATfxyZa4mbEvsrgUSvH6aZ4WU/9l0w5Q
         4SSwzfGD0hHCBAy31hYVa/x8XemiwHdcF1C3PIBPFlJ62HYeIcPkw+ITiN+9WuYtwnmL
         7krq0mPLDIggUg7QtAtt0tyGhpEsRQ/+Z8gGLalgtkl+R9Vp0eFBpZl+jZEMcWtwnnqA
         /lOQ==
X-Gm-Message-State: ACgBeo2E9xlh1F8vwmd21EWz+pUWkXJXNgigz+rM29nrQr8+ornRwCSA
	i+St98JExPJSAREcMAi+08c=
X-Google-Smtp-Source: AA6agR7GM1xECWvwtxoKU6cLB7gCxgRt26MgAjiTKqXX+f66bb9UdV8jR2Y/TQkqsHIo2jevz1kzTw==
X-Received: by 2002:a63:8a41:0:b0:42b:7450:4e81 with SMTP id y62-20020a638a41000000b0042b74504e81mr20604048pgd.341.1661954577723;
        Wed, 31 Aug 2022 07:02:57 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id d33-20020a630e21000000b0042c012adf30sm3393428pgl.2.2022.08.31.07.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:02:56 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: cui.jinpeng2@zte.com.cn
To: leitao@debian.org,
	nayna@linux.ibm.com,
	pfsmorigo@gmail.com
Subject: [PATCH linux-next] crypto: nx: remove redundant variable rc
Date: Wed, 31 Aug 2022 14:02:48 +0000
Message-Id: <20220831140248.303940-1-cui.jinpeng2@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: herbert@gondor.apana.org.au, Zeal Robot <zealci@zte.com.cn>, npiggin@gmail.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Jinpeng Cui <cui.jinpeng2@zte.com.cn>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>

Return value directly from set_msg_len() instead of
getting value from redundant variable rc.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
---
 drivers/crypto/nx/nx-aes-ccm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/crypto/nx/nx-aes-ccm.c b/drivers/crypto/nx/nx-aes-ccm.c
index 3793885f928d..c843f4c6f684 100644
--- a/drivers/crypto/nx/nx-aes-ccm.c
+++ b/drivers/crypto/nx/nx-aes-ccm.c
@@ -134,7 +134,6 @@ static int generate_b0(u8 *iv, unsigned int assoclen, unsigned int authsize,
 		       unsigned int cryptlen, u8 *b0)
 {
 	unsigned int l, lp, m = authsize;
-	int rc;
 
 	memcpy(b0, iv, 16);
 
@@ -148,9 +147,7 @@ static int generate_b0(u8 *iv, unsigned int assoclen, unsigned int authsize,
 	if (assoclen)
 		*b0 |= 64;
 
-	rc = set_msg_len(b0 + 16 - l, cryptlen, l);
-
-	return rc;
+	return set_msg_len(b0 + 16 - l, cryptlen, l);
 }
 
 static int generate_pat(u8                   *iv,
-- 
2.25.1

