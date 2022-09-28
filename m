Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A485EDAF8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:02:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MctqX4Nfdz3f4c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:02:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hLncl5wi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hLncl5wi;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MctnM5G4Hz3c42
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:00:23 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so1734949pjq.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hOXy/3B0e3cTGMIExCyp30h8nQPc8EN7HUScg4kF8wU=;
        b=hLncl5wigkp6LZxL1UHj5XXUDDZ7qtJq55Ge5vMbfW4Al2AGA2iQkMOvrdtdOf1VL2
         Rk/K/quMGIKxGPbpPAVJMtta7+wR+aeQCVaEZustg4IyVmieXUttW5qjciBXU//DM50q
         hGgVzPCREUx3DwaSPr8HwW088CPspOQqoZjpUpmyQMHz4xc+k6wRn2UheZ9k13pqJ4of
         S61hxLYNDw+33s1SeoYz6kEwxf25V4l4XlDghrJbkBTjFerJpQLwGBR528la4jpRrmBd
         c0uwJBogoeYHET4ns90XPd1dUcF8W6nI1xhKtZCRBBVuv2WRMWTiyUyYiZy/6E2YUYVj
         qoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hOXy/3B0e3cTGMIExCyp30h8nQPc8EN7HUScg4kF8wU=;
        b=5MJgkxOfloG9ZpO4S4r5FxQwR2TltRot0E65cTYQU/tbkfxfMITIhd7t/nCjNpqQGq
         /cmXm2U46T5sPgcvSo3dFcikltLFSa6rd3j26TFkSpO38VbuJ8O88P/ffhEWhDjUr0gY
         62k5Wn37dGFAEC+pD5w52ovhFAE3MDRdSrGPUsim1kId5m5rlY0dyc6H9/kip+Mg9u1o
         KfA/+o+DPWsyDLOGh1OV6ON3/dVfY7ZeTkDs0zwKzplMEeL/DiTr0pI5TsugokTT0hsF
         9aZXAsLC+4A6Eg3LcjscjH0IH4drbQQIaMTS2RtWXKdzS6/Yp0wXBKA6y+GseC56IYKo
         0KRQ==
X-Gm-Message-State: ACrzQf0yIZOVtzulOIB4KnJdt60P2CfiK2K1EFkbHjwjq7Seo8Rp2Wu9
	nmzq1iubzc2u0E08XFuOQtqCZA==
X-Google-Smtp-Source: AMsMyM4zzBvJpGNUwArQu+atMDproDm1I0tlw6EBKQ2GB2pfCmWCLWQxTIq8rmIlylXF+q8NzyS4Lg==
X-Received: by 2002:a17:90b:374f:b0:205:e255:e8de with SMTP id ne15-20020a17090b374f00b00205e255e8demr6980382pjb.8.1664362821737;
        Wed, 28 Sep 2022 04:00:21 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d50d00b00177efb56475sm1539524plg.85.2022.09.28.04.00.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:00:21 -0700 (PDT)
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
Subject: [PATCH v3 3/9] NTB: Remove pci_aer_clear_nonfatal_status() call
Date: Wed, 28 Sep 2022 18:59:40 +0800
Message-Id: <20220928105946.12469-4-chenzhuo.1@bytedance.com>
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

There is no need to clear error status during init code, so remove it.

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/ntb/hw/idt/ntb_hw_idt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 0ed6f809ff2e..fed03217289d 100644
--- a/drivers/ntb/hw/idt/ntb_hw_idt.c
+++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
@@ -2657,8 +2657,6 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
 	ret = pci_enable_pcie_error_reporting(pdev);
 	if (ret != 0)
 		dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
-	else /* Cleanup nonfatal error status before getting to init */
-		pci_aer_clear_nonfatal_status(pdev);
 
 	/* First enable the PCI device */
 	ret = pcim_enable_device(pdev);
-- 
2.30.1 (Apple Git-130)

