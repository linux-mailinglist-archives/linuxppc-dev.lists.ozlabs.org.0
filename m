Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 009775A9EDC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 20:19:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJTpQ03wSz3br9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 04:19:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Aehod6L+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Aehod6L+;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJTmn5ZRTz3bxL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 04:18:01 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id fa2so10242667pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 11:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3DXCPe1BdEtYuRHvCYZXZkquoUJcR5dxO1Uv98IS8Fo=;
        b=Aehod6L+M3ml0QOxN7x+0w3h0/6goHcKiCZebMRRRooSJP64c5JGUMmT0Xs0eXcJQX
         KAebQ+kqsEsjzxwwCuCi+sTSZ9ePGDRJ4Ke8LtzrvIc85ZUFTKXl6caEY+cTLN//OYSf
         0QqAgptsvqA+mNuSroupv9lAYWD/oiajx3bhNgTGjKE+5FJqGpp5hl75V/YPuX9vsEwJ
         H9pYqtwIfWdmAJsRJBDrKwHc/OkPFAj95m1JVMfBleKx9eJGlDea3htyn18Jqhle3msk
         1aFF1ndcoISes5UYjaPU1OELeWO86cea/I3zJ3XNGnx8Nc3DA33tRGi9jv4uXcMiqB7J
         p+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3DXCPe1BdEtYuRHvCYZXZkquoUJcR5dxO1Uv98IS8Fo=;
        b=4PMPLdGc892ilKuK209AgdvxgGmCWUXrDDcgAHCBWHUSkdhozL4wd0ZEGu0mjn2ksy
         mi0jdVzxyxp5wcTXAJ9QlyMGtB8HzXGypR4Q+pR5UTTtMcnKlQVbRUFhu1jwmCowehSW
         z/I2x2JwNkY/jmaNq+28wd37DiebW4giEgP1tAO/S/tLXsWzZgmipYfKuwY4y9oQlR8b
         tmbfAo5/YC/Pf0lND5XpkQlQjVA4W585jarCc/W30WRZS7uuoTCPQQT7DPpfQ3BDoCTd
         AOV9wAFoExWa8Lev0IZPzbQP9BowI/x3quj6l6yiNuOkynF2yH2trYiDqeyqAC+4mzzi
         LQZw==
X-Gm-Message-State: ACgBeo3PSiHKdL6aCGBlMZ6R9dBqn3xjqJn2gqmVDBUeh7YpeUHiXYLm
	jifXN3QvCSe+UmWubwI85CHUWw==
X-Google-Smtp-Source: AA6agR5k3r5xfxPxjuPBt32QIykPTxBunw1TVl9SKzFPTIijRtI9vvEivAH4/47P1EXXXpyDgDMWRQ==
X-Received: by 2002:a17:903:32d2:b0:172:f62a:2f33 with SMTP id i18-20020a17090332d200b00172f62a2f33mr31495269plr.16.1662056281071;
        Thu, 01 Sep 2022 11:18:01 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170903228d00b0017519b86996sm6320538plh.218.2022.09.01.11.17.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Sep 2022 11:18:00 -0700 (PDT)
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: fancer.lancer@gmail.com,
	jdmason@kudzu.us,
	dave.jiang@intel.com,
	allenbh@gmail.com,
	bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com,
	james.smart@broadcom.com,
	dick.kennedy@broadcom.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com
Subject: [PATCH 3/3] PCI/AER: Use pci_aer_raw_clear_status() to clear root port's AER error status
Date: Fri,  2 Sep 2022 02:16:34 +0800
Message-Id: <20220901181634.99591-4-chenzhuo.1@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20220901181634.99591-1-chenzhuo.1@bytedance.com>
References: <20220901181634.99591-1-chenzhuo.1@bytedance.com>
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

Statements clearing AER error status in aer_enable_rootport() has the
same function as pci_aer_raw_clear_status(). So we replace them, which
has no functional changes.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/pci/pcie/aer.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index d2996afa80f6..eb0193f279f2 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1287,12 +1287,7 @@ static void aer_enable_rootport(struct aer_rpc *rpc)
 				   SYSTEM_ERROR_INTR_ON_MESG_MASK);
 
 	/* Clear error status */
-	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
-	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, reg32);
-	pci_read_config_dword(pdev, aer + PCI_ERR_COR_STATUS, &reg32);
-	pci_write_config_dword(pdev, aer + PCI_ERR_COR_STATUS, reg32);
-	pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
-	pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, reg32);
+	pci_aer_raw_clear_status(pdev);
 
 	/*
 	 * Enable error reporting for the root port device and downstream port
-- 
2.30.1 (Apple Git-130)

