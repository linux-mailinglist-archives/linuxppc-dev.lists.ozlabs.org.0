Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7429B5EC856
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:41:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McP453h4xz3fNX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:41:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=NvRgdBCT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=NvRgdBCT;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McNzQ5Y5Sz3drP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:37:22 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id n7so691179plp.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=AFdCbuK2STwU1a0Nvf1lTDCDj1ToB//H9Q+bBUP1Qko=;
        b=NvRgdBCT61Gudxqofirgx5th8IhGdXVH8ploDF6qA3ooguYlkZg71QV76whvsg9N6l
         R4KzgPkWN0h5/4Wa+jfAUT3X64/ZrWIc657LewcLsRa8odQNcnMLsWGTFDRG8vyEoBXq
         TJavhn1JY3shjpKopxaVJH4TRh6fLbyxkkYpmDlWls5S86f+jRYvc4HcSKwwjuTZetKu
         nRDD15OmlhogeMrBS17ayxlWc9/04/Cg6th9rUmLkxtuPjumSS559ESr/I/y3Z9c7fIn
         wpKIHX66ByA5ce2JXGh+pHeaqv7pxm0/5tBguNnJcxWHUMej+FaDDZah39r9lluVzFcQ
         XCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=AFdCbuK2STwU1a0Nvf1lTDCDj1ToB//H9Q+bBUP1Qko=;
        b=nhwsuwruTV3nwwHiq8Qzsf/LIcqzbE7uNDZzaS+sWe+AKhCNczMHUtJ4s+XrpnnWXn
         qJP3Mu+k0TFyGIHH1Q8j0ykVsw0BftpJLTtS7My123aFFeIyQ1A87ec3jZwUpSFJIayC
         N5jDMHRwnQeG+lIv+QkTaGVe4N39foz5io+1+4fuWJKLzKR6bbU2L+C1EfkMCcO6anRC
         4c7h6LIRNsijzyYUoKbNPXEY+uhJhLf/wjkk6nxUPGQwOhgKmR9IRNKzlYzglyfDnyTf
         3GCw1Z5TLYFxIeopuDJV7hTOWsqs1lFwYMHxVHNTPM2w1qjZNrmyJBeSpilA9ckSfB4G
         HSsw==
X-Gm-Message-State: ACrzQf1Ji/Hba/MtKg3dZUJ5Ou6gL37mils9euqGXkPuKABMHtNwP+I5
	B6bNEi/sJ1mUy0NetEldioPmEg==
X-Google-Smtp-Source: AMsMyM5jyEmlaQH+Y1BsFMdvCalgfAKFQCnd9GdR1AeXlRDMfov29pS4+9anTO+gz3gmL+s4K9nTMQ==
X-Received: by 2002:a17:90a:6405:b0:203:6eaa:4999 with SMTP id g5-20020a17090a640500b002036eaa4999mr5266575pjj.8.1664293039489;
        Tue, 27 Sep 2022 08:37:19 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id w16-20020aa79a10000000b0053639773ad8sm1933087pfj.119.2022.09.27.08.37.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Sep 2022 08:37:19 -0700 (PDT)
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
Subject: [PATCH v2 8/9] PCI/ERR: Clear fatal status when pci_channel_io_frozen
Date: Tue, 27 Sep 2022 23:35:23 +0800
Message-Id: <20220927153524.49172-9-chenzhuo.1@bytedance.com>
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

When state is pci_channel_io_frozen in pcie_do_recovery(),
the severity is fatal and fatal status should be cleared.
So we add pci_aer_clear_fatal_status().

Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
---
 drivers/pci/pcie/err.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index f80b21244ef1..b46f1d36c090 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -241,7 +241,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	pci_walk_bridge(bridge, report_resume, &status);
 
 	pcie_clear_device_status(dev);
-	pci_aer_clear_nonfatal_status(dev);
+	if (state == pci_channel_io_frozen)
+		pci_aer_clear_fatal_status(dev);
+	else
+		pci_aer_clear_nonfatal_status(dev);
 
 	pci_info(bridge, "device recovery successful\n");
 	return status;
-- 
2.30.1 (Apple Git-130)

