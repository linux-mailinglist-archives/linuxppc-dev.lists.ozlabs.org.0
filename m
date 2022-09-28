Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D5B5EDB06
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:02:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MctrB5fR6z3f7Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:02:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=wC+q4gRa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=wC+q4gRa;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MctnW3Rk0z3bwQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:00:31 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 78so11854665pgb.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 04:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TvC/ALrxAJSA8jgElYrPaDlRpGjWvJ+S5PU3u9AGQW0=;
        b=wC+q4gRayIrrojd5NNz/4k7eSkzCZifqS791bKfvn1KPZjMCq4khGbNFBM+HJO9Moh
         SDZIxqn2z1ZKYCLxC+8vBo+XConeT223VVXe2zkEJ3WNxA47YbRu87WrN1Xu0y76Y4XU
         WHH7KC6eNBVqibeF+Y+M7JWgrw0pPmjVRDWLSvzU2XUb5Jm/cJSyUSwvOmgOhPEiNOTS
         jHAY5J9OTHvpi4EMLOq6zkJ+Al16ABpJ0+awGZonyn0TdixlwEhZzu/OtcwnRHT2Chr/
         tyDl8tzD+WlEFr9PKwgHpJyh5RB/1G1+t7YHi3WFxpkjrrCGfOTY216lm4YjBX6ZrOfK
         bqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TvC/ALrxAJSA8jgElYrPaDlRpGjWvJ+S5PU3u9AGQW0=;
        b=MonYTBblPwi2IgMg7EyquoW3ckSGnno08LgbuZ0lMKG8I2Izbxkz7KTV38IHnN5l+k
         btQvN+iFdmpzPxKV2CSdq4x6nxxAg4g4MUx5jSCg5YDcrM+F1wQpZ/DZFgkiIj1L+Pc0
         RT++0xHhZb+l/Ls8+IXM2Nowf6tUhu3OBR4JiW8cjxFneOHGReEjMVelf75mBRWmXtDG
         U1kA9wineSE3RR4Q5FhT/Mzq+5wh12VTHhXaqoyCOg7TW9qedEqwUjjQ4HglfrDHh+dw
         BsCPCpOKRZWd6+6pGxw6ru3DxpPqPNkBF/+/28u6vR4EwsnRgr7a+KMfhl33kFYfYtnO
         wFhg==
X-Gm-Message-State: ACrzQf2jooT3lmIp9I843wSAlnCVkQn/lWl2iXQjiMsT9dH9p1ap1Oo4
	9FdjviKwuFBlX0SvOwDhn+JBCQ==
X-Google-Smtp-Source: AMsMyM7bWfktbsleKoDwZH3+i0nno4js4FOHZ9d6s4pKKsRup/J0ok5b6UIhDd+31p7y1B8DxaaKWg==
X-Received: by 2002:a63:4408:0:b0:439:befa:3d47 with SMTP id r8-20020a634408000000b00439befa3d47mr27860398pga.64.1664362829108;
        Wed, 28 Sep 2022 04:00:29 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d50d00b00177efb56475sm1539524plg.85.2022.09.28.04.00.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:00:28 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: sathyanarayanan.kuppuswamy@linux.intel.com,
	bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com,
	fancer.lancer@gmail.com,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	james.smart@broadcom.com,
	dick.kennedy@broadcom.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Subject: [PATCH v3 4/9] scsi: lpfc: Change to use pci_aer_clear_uncorrect_error_status()
Date: Wed, 28 Sep 2022 18:59:41 +0800
Message-Id: <20220928105946.12469-5-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
References: <20220928105946.12469-1-chenzhuo.1@bytedance.com>
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
Cc: linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org, chenzhuo.1@bytedance.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

lpfc_aer_cleanup_state() requires clearing both fatal and non-fatal
uncorrectable error status. But using pci_aer_clear_nonfatal_status()
will only clear non-fatal error status. To clear both fatal and
non-fatal error status, use pci_aer_clear_uncorrect_error_status().

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/scsi/lpfc/lpfc_attr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
index 09cf2cd0ae60..d835cc0ba153 100644
--- a/drivers/scsi/lpfc/lpfc_attr.c
+++ b/drivers/scsi/lpfc/lpfc_attr.c
@@ -4689,7 +4689,7 @@ static DEVICE_ATTR_RW(lpfc_aer_support);
  * Description:
  * If the @buf contains 1 and the device currently has the AER support
  * enabled, then invokes the kernel AER helper routine
- * pci_aer_clear_nonfatal_status() to clean up the uncorrectable
+ * pci_aer_clear_uncorrect_error_status() to clean up the uncorrectable
  * error status register.
  *
  * Notes:
@@ -4715,7 +4715,7 @@ lpfc_aer_cleanup_state(struct device *dev, struct device_attribute *attr,
 		return -EINVAL;
 
 	if (phba->hba_flag & HBA_AER_ENABLED)
-		rc = pci_aer_clear_nonfatal_status(phba->pcidev);
+		rc = pci_aer_clear_uncorrect_error_status(phba->pcidev);
 
 	if (rc == 0)
 		return strlen(buf);
-- 
2.30.1 (Apple Git-130)

