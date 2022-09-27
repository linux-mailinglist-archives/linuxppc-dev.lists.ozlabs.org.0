Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656955EC825
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:38:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McP0f0Jxhz3f3g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:38:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hpOlDxF3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=hpOlDxF3;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McNyg2D01z3cLb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:36:43 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 129so8313113pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pu5CUxxvzQDPV1MrZt0eySYk5qcgDQDMRS6x862FR3M=;
        b=hpOlDxF35EkFZOgnZUEUpb7bfMeNXlEs/6zeqAK6eTGvVycSXxN5mhIMc9S8WfoaF/
         cwWs267qASx0e+WT1TwXng5S9nSyp1dRWH7rUpDXZLoP8jh/myCkq/Dpt9Ocv61bMCrX
         KCVkGQ/DsIqrtNOayppyBxQYmf/6pDTp8loAtnshKT2GVLI7NiICfkvNXNmQwARXA4ba
         w7biRtQ/LR4lB7JOHBHhVgKhVaVGPDngj0vRuIKmH6akrigtDtDlTjL6PpQqW/lzhXea
         fBVQ0A2O0oriv/fWIVwEeR77bbp0SvmTpT9sZNgGsqs2ciLylmpapoYCcXrGggb+tFGz
         ksig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pu5CUxxvzQDPV1MrZt0eySYk5qcgDQDMRS6x862FR3M=;
        b=apGbY08hRFJKiOdfq0Ian4ovOMlHL3ZWzNpKZ3afdusx2EDCle5Wp/1GoMXbROCfji
         21yuR+boUpXIrbAt/NJV8ZQxQVogAUmTYZ2x1kN98oF/N7CL6nOYFU4VjQsyFYAVuslL
         WCMf9i21YusZn9UVJbhUqgqIOufgAoD3oK0TkgpPMvshgc3FFk7ELP5E90A2XWdD29bl
         t2t4ALzdcbTmrIdy8QfCuntNkpBtyMLgLMZco5Hg8knXETMLI5ktGbkGOMHgBRO4DLn1
         oy+tY/mICTP3CH42mUVB2gCHiRUhDVdMbJFkBrlato8xlW6tebwArdGxry2/CTYUwRyv
         ZCAg==
X-Gm-Message-State: ACrzQf3D3Lvjnq+LRkg4bvz1KCN6xUCXgfb90GcCnxr0op06etU4726v
	2EfCQ84JmKw8jMTq5waqyQarJQ==
X-Google-Smtp-Source: AMsMyM5Rm9HIrz8bymvsH/euOjrFQJ4/XBJHdRa6nFHuOBrWJvQLmhDheo/pfwZ79K47Gzo473rdQw==
X-Received: by 2002:aa7:8c4e:0:b0:54e:fa98:5031 with SMTP id e14-20020aa78c4e000000b0054efa985031mr29740531pfd.44.1664293002852;
        Tue, 27 Sep 2022 08:36:42 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id w16-20020aa79a10000000b0053639773ad8sm1933087pfj.119.2022.09.27.08.36.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Sep 2022 08:36:42 -0700 (PDT)
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
Subject: [PATCH v2 3/9] NTB: Change to use pci_aer_clear_uncorrect_error_status()
Date: Tue, 27 Sep 2022 23:35:18 +0800
Message-Id: <20220927153524.49172-4-chenzhuo.1@bytedance.com>
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
error status in idt_init_pci(), so we change to use
pci_aer_clear_uncorrect_error_status().

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/ntb/hw/idt/ntb_hw_idt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 0ed6f809ff2e..d5f0aa87f817 100644
--- a/drivers/ntb/hw/idt/ntb_hw_idt.c
+++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
@@ -2657,8 +2657,8 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
 	ret = pci_enable_pcie_error_reporting(pdev);
 	if (ret != 0)
 		dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
-	else /* Cleanup nonfatal error status before getting to init */
-		pci_aer_clear_nonfatal_status(pdev);
+	else /* Cleanup uncorrectable error status before getting to init */
+		pci_aer_clear_uncorrect_error_status(pdev);
 
 	/* First enable the PCI device */
 	ret = pcim_enable_device(pdev);
-- 
2.30.1 (Apple Git-130)

