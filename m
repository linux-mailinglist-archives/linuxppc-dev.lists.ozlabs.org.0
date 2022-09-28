Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 109135EDB1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 13:05:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mctvc6QFwz3fPL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 21:05:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=FHnm2AaD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=FHnm2AaD;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mctp63pqzz3cfT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 21:01:02 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id bh13so11897547pgb.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 04:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8Z/ugyVP4SSiBNTqiEXPWybAg+NaSbXcSQ5EW7ChSt4=;
        b=FHnm2AaDgGGL3Qb4S5rvtHWuJoHeyMlhpER41MQux4jSSHMRLmSauxip2U8Ls1Dd+Y
         19x3//5jQZghMH2wT1Gw9kAIothGyal7qXRDEfQmW+eZEnJwwIr6prp5dMhpipz8eGFX
         1MvRVNMEPcMMj1ZUz797NlbPTWYbgcHrYvxxJErlM36QkHTtLH55iGoTR9CKNc9+qxuC
         Jzc8mdsAQjxdzZsdZ5rdbM//fGbWf75NhkKFVlQTDRy4xtMVB9EbLMCogwmPXICPTXhj
         WtcORu4EtFGUkcjXR6FH4O8OTeKcf18OfFNznmBsUNtZx+rl204eixa8gkxPN5E//vcE
         b/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8Z/ugyVP4SSiBNTqiEXPWybAg+NaSbXcSQ5EW7ChSt4=;
        b=ZkM9QB61RkpBJCUG0Tlh9rKZ5tbzywCZAj6GLQicRIsI6YXRPh7gi+EzYhKqI5DZZE
         fXyRxV8qNH0QndT3LEi8WICx83KlSOeh6GafpFZvsOn+33LD1RVAzrdf6Q1VRWDRkQCG
         0LxMpcoNQvgLci2ROBfs4uORt+Qv1e0qoDCy5+q/apCZXiAVs/x5/1bd3hG06at9BShK
         fDQ6+ZhlwWg/SB3IRHlh/FVTix2Aqeu9j0KJJq/K2DZtmCuRVedQ0KeJpIFemFoEJhtM
         aQOP95PCT4RIsAv3rGrSkovj3L0zaVUJTkHC8mnXwQj2aAhUYTwuNgVKofjbbVSeyhB0
         WpcQ==
X-Gm-Message-State: ACrzQf3CoO5TWA2o9M2yh6HAlA+zew8WKM8EiQfQ3Q/hnPRUxlpv5Vkm
	tPYhUF65pOKP8DwGNjpV1OTOag==
X-Google-Smtp-Source: AMsMyM4ofQZRkpGFxs4XD0rXBl1JIn4/vMVBWhueuGH3CSuShGbXwzXsRpudhK5toT82OfIWlzxVcg==
X-Received: by 2002:a65:6d8d:0:b0:43c:9bcd:41ab with SMTP id bc13-20020a656d8d000000b0043c9bcd41abmr16631977pgb.303.1664362859624;
        Wed, 28 Sep 2022 04:00:59 -0700 (PDT)
Received: from C02F63J9MD6R.bytedance.net ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902d50d00b00177efb56475sm1539524plg.85.2022.09.28.04.00.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:00:59 -0700 (PDT)
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
Subject: [PATCH v3 8/9] PCI/ERR: Clear fatal error status when pci_channel_io_frozen
Date: Wed, 28 Sep 2022 18:59:45 +0800
Message-Id: <20220928105946.12469-9-chenzhuo.1@bytedance.com>
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

When state is pci_channel_io_frozen in pcie_do_recovery(), the
severity is fatal and fatal error status should be cleared.
So add pci_aer_clear_fatal_status().

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

