Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B09A25EC81E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:37:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McNzy51Blz3f3M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:37:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=IMIPIN6w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=IMIPIN6w;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McNyV6wGpz2yxQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:36:34 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so10469898pjl.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Q86dpO4MZD0CA12jM08xWGYyYtYWODVJgw7gnIuH5Tk=;
        b=IMIPIN6w3MO7MCbD7V3ThsGSRsp1g0IjueBKGf/11rJ6MD5qN4UR3XGmJipX9CK++6
         eiOchrYYinPyoOBn+0Y+rDP0uVRFImrpBNU1UDXtOMNUxPlRqmop3RFvpzPbyEybSG5F
         CRDPQ1enPFC99WOwYFVY2QZDmn8jSfY/zTlBpgKJUVPQ+lpJjVT0rmsBeR4eYvaQSxZK
         dvTm2obycBfI5P1tTJ+khPgiPLQGLeUoFr7m2HgOHrjHsPGgqHpQ2Yy3mDC88pmtuxyB
         YdSpANeZeOxf58GtYGN2R1FOht2o+Xmi4V/D1Ny4qiePO8a/2BpFtrT8iUKZBeNMTtOh
         RWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Q86dpO4MZD0CA12jM08xWGYyYtYWODVJgw7gnIuH5Tk=;
        b=GXJjKqKwBE1OT8B9LyLErZO5K38RqnUzbuvQo6QOSdzcsJWUX0xfHu7LT7uMjqzoZ7
         v/X49ByQRukGXdTdlMgMtXT2nJirta23dtic7C1b2PfcghjXrRmLxEZyvda7ev6D5uTe
         x1phMTKoExX+P9Hv6J7rG0pCBt/t7XHfzC1sIUJeOHXphBbRWjeyKH+vwauDcv5NxS6z
         xZwtkPO9eLtgkVjMfTebyDv3KBNl/QKzilDU6pNxK4o3A1BgZWMNllD0aImosuGuMbxy
         GPw66sKMxkZo+OUCwwpq6ujCgix0ie6iuomwq2ugCA8EWfWJHPT4RaN8VwjUGMj3x0/Y
         g5cg==
X-Gm-Message-State: ACrzQf0ff5GNtJs3lHX6lM3UoRSXcKi+fiMpXA8PVSSPl16lAfNfSUXM
	FvRwwIKqxOwf7WkG40wQ1zXgTQ==
X-Google-Smtp-Source: AMsMyM5RaT7WFGyUZHFYqoVH6SiLBpf6gppnLFccPidOBspFk2OpmdxZsinWDsz9SjngtrgXs1RPug==
X-Received: by 2002:a17:90b:17cf:b0:202:95a2:e310 with SMTP id me15-20020a17090b17cf00b0020295a2e310mr5447237pjb.76.1664292992706;
        Tue, 27 Sep 2022 08:36:32 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id w16-20020aa79a10000000b0053639773ad8sm1933087pfj.119.2022.09.27.08.36.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Sep 2022 08:36:32 -0700 (PDT)
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
Subject: [PATCH v2 2/9] PCI/DPC: Use pci_aer_clear_uncorrect_error_status() to clear uncorrectable error status
Date: Tue, 27 Sep 2022 23:35:17 +0800
Message-Id: <20220927153524.49172-3-chenzhuo.1@bytedance.com>
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

Use pci_aer_clear_nonfatal_status() in dpc_process_error(), which has
no functional changes.

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

