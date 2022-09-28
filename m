Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E195EDAEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:01:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mctpw2w7Lz3blj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:01:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=m+h1aSlR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=m+h1aSlR;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MctnD4mWlz3c46
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:00:16 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id ok12so282358pjb.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 04:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hqHsGeDKe0t7ifwT22YFmx420oJcPi+zdGlDsAhLUb0=;
        b=m+h1aSlRyOmyWLPEegkC4UTOP5mPnZb/u7MDJuDqO7L0oSlCnQoyJhUm3SWgCH00mF
         +4ujgBYFq2vlJ2WRylNv/WHQ5qJlHSfvxyY9LrO5aufZZS9Sc1omuaJhkAHcj0qBr8y6
         39gHedQoOOfGN/PofAoqNRkBKCo0PSVhB4/blu7M03tzfCb5REYVvITZevtJbJ8KQYbQ
         eRcN4dzRCZRBWc/f5UZFCe2JWbhiFs+jqRa7UzCLfrvuit8SQUOZVv6lzNOvsW7qAllk
         n1heNKwq4tOo4KNg/bito9QLe9QeNk63Rbrab/wZsmr9npT0K5U+1EVIP96nrXfB2KmT
         0FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hqHsGeDKe0t7ifwT22YFmx420oJcPi+zdGlDsAhLUb0=;
        b=x3BSTKBDkpCku0Xgy60lUb/GgP1jypWNaz3gtvVO32T5hp+v2M3z16nJrObVy7onOQ
         JBY9ApzIGvMxIzSnSawGIGXViermKu+P5amP7894QMRIZSBWbhqG2mqyVyBgwJ95wDBe
         x3AfSnXWml8xIdh+YVt+24x+Nbd4c11DVamO2nX9Tk6awSHanvBOQDRAkVFVpbJEIu/l
         VRls/UL0HrmCMzTYjMneM4caHZ+S59E+75sryopk3EFVnn+nUtkJkaFp06ukVMfgdS1C
         qq+EkwKygePOTS1U0x2LlOGNM6cUKu6Z7G7K8HSQYBL6vcvTpu2aCu7L38hOA4TvcjRb
         UiAw==
X-Gm-Message-State: ACrzQf2lZaX2FHhMPHRXD0QHO72bgnhpZEVASL/Z8C9a+jg7+2cP0zwt
	9xSq9hTulYGYwnXSBpBmdVE+Og==
X-Google-Smtp-Source: AMsMyM5C26cGEuhYulr7S2jFc6VQqD+oKgKzpNLlpxnRs14brLWhNpxe/xWjjleGrOws83qXpNbKMw==
X-Received: by 2002:a17:903:24e:b0:179:b755:b82f with SMTP id j14-20020a170903024e00b00179b755b82fmr29636731plh.34.1664362814279;
        Wed, 28 Sep 2022 04:00:14 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d50d00b00177efb56475sm1539524plg.85.2022.09.28.04.00.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:00:14 -0700 (PDT)
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
Subject: [PATCH v3 2/9] PCI/DPC: Use pci_aer_clear_uncorrect_error_status() to clear uncorrectable error status
Date: Wed, 28 Sep 2022 18:59:39 +0800
Message-Id: <20220928105946.12469-3-chenzhuo.1@bytedance.com>
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

pci_aer_clear_uncorrect_error_status() clears both fatal and non-fatal
errors. So use it in place of pci_aer_clear_nonfatal_status()
and pci_aer_clear_fatal_status().

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/pci/pcie/dpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 3e9afee02e8d..7942073fbb34 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -288,8 +288,7 @@ void dpc_process_error(struct pci_dev *pdev)
 		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
 		 aer_get_device_error_info(pdev, &info)) {
 		aer_print_error(pdev, &info);
-		pci_aer_clear_nonfatal_status(pdev);
-		pci_aer_clear_fatal_status(pdev);
+		pci_aer_clear_uncorrect_error_status(pdev);
 	}
 }
 
-- 
2.30.1 (Apple Git-130)

