Return-Path: <linuxppc-dev+bounces-3449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0259D3DBA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 15:39:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtkWP6w3Cz2xwH;
	Thu, 21 Nov 2024 01:38:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732095948;
	cv=none; b=aChIXISSp3+XM9NxXKnJWAGmvhxCjr3gCqh7WanlMIkCXO0aSYVfTa5l/35PuWX+Q+fC4L6MFSMbm6bogSIGhzCUeTHu2ctUK0S5UCMWMH15+zcHa0WQhtvjlmxeclh9I8i5TTrIIZtMPPMeBU57HMubOCG2MyQl54v0Dg9iIz6c32WazIcVgXlWFKz291oLGMu2D6yflI2tMEGx1rXVQ8b7lkHPpk/ykNKnFWokwc4Gtllvz15y32Y/jWjSJRLnYAz/2vD4gZKATQ7lee9O/pI8LhRG8ZPYwzhXtDjC4NRDCpCLjRS45+cYUvfHHg8hPebrrwSmd7VBx+cIlh/jlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732095948; c=relaxed/relaxed;
	bh=GGhdz/ZoJn9zYBTtIYG8XTNmrEdkwq5yWoruGzdKP64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bsqb3S3JYIEraRie/GDk6rKDX0SJh+fZEX2NPOs4OW/riND7Z44miOiyqyHq9Sqkvp0OdB4Sj0jxV1w6mhQM7v+9yF7sKeJ1508GZu0Zfh3RCmhZrn6hXQXH8ErWVUBITFo9+j0ZeCv0/1pOqoajM0Gmp9jYPa17uOiGK7bAA9ATqU1mnzbsukMrwHvLeR/7oecd0/EwxDuldiXgIgdTP8XeKVbtBtuPsKR3PRfWE8dlnifCQKAkvgFX+v2nSHgQ1vu7VBtYdilLNiEPXY8MDXVsdfbd6z6AR4bIaAM+B6KGx4DxwXx0qU99J9OxpdVNV2o8iEGtb5UwmY523z1a3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=xiaopei01@kylinos.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 366 seconds by postgrey-1.37 at boromir; Wed, 20 Nov 2024 20:45:46 AEDT
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xtc1Q3cTMz2xsM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 20:45:46 +1100 (AEDT)
X-UUID: 30a5f3d4a72311efa216b1d71e6e1362-20241120
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_C_CI, GTI_FG_IT, GTI_RG_INFO, GTI_C_BU, AMN_T1
	AMN_GOOD, AMN_C_TI, AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:95d4111d-5746-4350-a786-7c58a076b5da,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-INFO: VERSION:1.1.38,REQID:95d4111d-5746-4350-a786-7c58a076b5da,IP:0,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:20
X-CID-META: VersionHash:82c5f88,CLOUDID:28b95fb47be3158f0464a97d339d7408,BulkI
	D:241120173827N644GAJ1,BulkQuantity:0,Recheck:0,SF:66|841|38|17|19|102,TC:
	nil,Content:0,EDM:5,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 30a5f3d4a72311efa216b1d71e6e1362-20241120
X-User: xiaopei01@kylinos.cn
Received: from xiaopei-pc.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 406220667; Wed, 20 Nov 2024 17:38:25 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: herve.codina@bootlin.com,
	qiang.zhao@nxp.com,
	christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	xiaopeitux@foxmail.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] soc: fsl: cpm1: qmc: Fix qmc_probe() warn missing error code ret
Date: Wed, 20 Nov 2024 17:38:20 +0800
Message-Id: <82d8c18da160b9e0a73c5c5e2eb25ad2831cc6f9.1732095360.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bac2dc94-1bf3-4dcf-b776-cd78ef992d28@suswa.mountain>
References: <bac2dc94-1bf3-4dcf-b776-cd78ef992d28@suswa.mountain>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

platform_get_irq() may failed,but ret still equals to 0,
will cacuse qmc_probe() return 0 but fail.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202411051350.KNy6ZIWA-lkp@intel.com/
Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/soc/fsl/qe/qmc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 19cc581b06d0..a78768cd6007 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -2004,8 +2004,10 @@ static int qmc_probe(struct platform_device *pdev)
 
 	/* Set the irq handler */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	if (irq < 0) {
+		ret = -EINVAL;
 		goto err_exit_xcc;
+	}
 	ret = devm_request_irq(qmc->dev, irq, qmc_irq_handler, 0, "qmc", qmc);
 	if (ret < 0)
 		goto err_exit_xcc;
-- 
2.34.1


