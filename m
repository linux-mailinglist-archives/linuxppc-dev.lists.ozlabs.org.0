Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB4A5AA8BE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 09:31:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJqNW1xTQz309Y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 17:31:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XN0dQyhR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=cgel.zte@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XN0dQyhR;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJqMs38x9z2xfv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 17:31:03 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id z3-20020a17090abd8300b001fd803e34f1so4721665pjr.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 00:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=otQ8hHJCbd4mIOyYrBE6xrrNXinh9eOjKzRA60c/oYE=;
        b=XN0dQyhR+ApCIk1hP+qHX//4vn/ePtcWzh5jgq81LbY1nrxTyKx1ksEnAkk9oe14sA
         R+NNsU/hGHKPLDCQ+02ymsuA4+MFfY2OKNO5Tde8QTSM4Hpm5gorpDko5WoF+JsgeauD
         nsq2mw8zbLfHCsJr0C8iqhgLAq1DVb1KzPLs4cv4rilR9FUfYBXrqRtZXYriu/O3N+eC
         VvhmpP0SuHGlcKdld7SV5DRUA5M0ot5oacWqwoVvFFFg5Gi3qlG8Y01RNk7XTOlD0S7s
         /Vm0+zBpHQx9WiK7MMNbQQDF92640tMS7emfaKGVHfBpDKT9n1fKIcuiT8+LxndQVL9j
         qf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=otQ8hHJCbd4mIOyYrBE6xrrNXinh9eOjKzRA60c/oYE=;
        b=Inm8hMZntN3JdFqbJZrn2ax1GDR2/hE9UtQ1/t0GLihwefCJfMbVfu8HJm0dS+vpxf
         PsJt8UJVo6NX3q6USD6ztCSJwiJPD6jxPEL+Cw9DohY/ETrFkKcq82FELguMv4vgU8/m
         QuwDKTg+HB2cu61RC6A6OhI+uoZfh7XEmfwth64yzuklHgCSp1VVp2Rgt7H9rR8GxM3L
         Sbvg9TGnb2jdA0/g6oBJ2FfZevxo/EX0RyZM2DuBWgxX+tQdso2/fp9vQoL8AuEi919d
         pOlsWwsnOo7Au7Om1Yhoq4e1APjAfj3qf8/pH4QXQb4fv1tgATh/uNV89CC9iLQw42Qd
         Y3nw==
X-Gm-Message-State: ACgBeo1JrLwmg5M3DXJrlOOHAEEjIGgnW6MGjn2/PPNji1RIPlYFP1gR
	MJY0kLwwbkscwEz/VLXJ9NU=
X-Google-Smtp-Source: AA6agR7frwvs4z2Xkd/cDUv8GhGmoyWx3SbAYicBTSYaAPmO5qpNaPu0PYo4CMFbrUNVJaCX/fDt6w==
X-Received: by 2002:a17:902:ef50:b0:170:9f15:b998 with SMTP id e16-20020a170902ef5000b001709f15b998mr34703564plx.102.1662103860438;
        Fri, 02 Sep 2022 00:31:00 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id n13-20020a170903110d00b0016d72804664sm862528plh.205.2022.09.02.00.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 00:31:00 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: herbert@gondor.apana.org.au
Subject: [PATCH linux-next] crypto: nx - Remove the unneeded result variable
Date: Fri,  2 Sep 2022 07:30:55 +0000
Message-Id: <20220902073055.319464-1-ye.xingchen@zte.com.cn>
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
Cc: Zeal Robot <zealci@zte.com.cn>, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, pfsmorigo@gmail.com, npiggin@gmail.com, ye xingchen <ye.xingchen@zte.com.cn>, leitao@debian.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value set_msg_len() directly instead of storing it in another
redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
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
