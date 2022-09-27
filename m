Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C645EC829
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:39:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McP1J6Q02z3f8M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:39:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=nth9fZmj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=nth9fZmj;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McNyr2JlSz3c6k
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:36:52 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 8-20020a17090a0b8800b00205d8564b11so2042626pjr.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GtrGXWLBouj+Sq7t1MDlnSu3fAu+chMcYGINAYDQ4nQ=;
        b=nth9fZmjb+r5s7sisV2ZY4tLq5XMhILIGYTiuxB+lkuRYBEQxKmuRCEjDmL+PLjMEd
         YyMuleqtD/8IoDcafCAcB/zFmY0EBcNJsRqrWOa03oNv88O4IUt3xXwVVTa3ISqznc2L
         0FO+kQE9XbK5Hg7q6ItF02pluJwKtfOGk9H7Gs5mnoy1k1vJQuYzoIScux8coDQ2HTbr
         NTZmUh7EAHsXki3u30LAr3G/ltc4+7O3tlYvOI2JX/tjIM6mLzWCrFDmLu7KNGtf/aw2
         u8o9rF6MwG8srW3awuQQrnU4xJf/3QQlNXQ7xQIsWQBpu52ZVmxSYpKX1Jbl1a10w37J
         0CeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GtrGXWLBouj+Sq7t1MDlnSu3fAu+chMcYGINAYDQ4nQ=;
        b=59+3dBPKsgF7V1JgK8GzldbnVgZJ5QLW05yXDQYmLiZSYpE/tSEkuXDpb84UhbI4e2
         E8qpfmGr7ohgvvStg3ijwu3c15FTaNE97d6Zed4bDe5C/w0rN106abBLy4BR/V6GEGOO
         rZ/0Pmg+HQRgHblaZevah7IKO2PqYO/aIcpD5KXZWpjXylOO9htdnrv/u+gLcCcyKkPS
         I/zmczaiV3klxyfZEmEfuR+9r3aNRgJ27TTeKLpW/azIHN9idYHs1I7CVkS/t62TxmUk
         b48tTp2IC9SZMnz8JWIvx6uXO8yoA6MGWNuf8A/IHuhwrj8copTLJJnLZHHbFuSeYEVS
         rtOQ==
X-Gm-Message-State: ACrzQf1AR3p1EuGTcBs35HIOQy7jLNtBSyq5T/re6YKkD5+j7lmGpdDF
	vcRmZFdkPQUvYyZHcuhDIfiEfQ==
X-Google-Smtp-Source: AMsMyM6SWuyZeCem7UcnG3JJgfL8e+Z32COuvs/oTFSp7uz/nzVrvcAb/VCt8AD25s/e6WJzbBztYQ==
X-Received: by 2002:a17:902:ee54:b0:178:7040:f87c with SMTP id 20-20020a170902ee5400b001787040f87cmr28160150plo.8.1664293010016;
        Tue, 27 Sep 2022 08:36:50 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id w16-20020aa79a10000000b0053639773ad8sm1933087pfj.119.2022.09.27.08.36.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Sep 2022 08:36:49 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: bhelgaas@google.com,
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
Subject: [PATCH v2 4/9] scsi: lpfc: Change to use pci_aer_clear_uncorrect_error_status()
Date: Tue, 27 Sep 2022 23:35:19 +0800
Message-Id: <20220927153524.49172-5-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
References: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
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

Status bits for ERR_NONFATAL errors only are cleared in
pci_aer_clear_nonfatal_status(), but we want clear uncorrectable
error status in lpfc_aer_cleanup_state(), so we change to use
pci_aer_clear_uncorrect_error_status().

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

