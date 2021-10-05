Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D715C422F10
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 19:21:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP4BH5sczz3btR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 04:21:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EqpIK1vT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EqpIK1vT; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP48m2DcTz3bjC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 04:20:08 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so116769pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Oct 2021 10:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0szOl/Q5keJYQjPtxy9YApfb7ftHWXnTXQ4eoRdC7oM=;
 b=EqpIK1vTXdHM2T3qpKt7B5M72W9yNHp47Ooa5AzhsBqv/LSEr3GylhgEQKGtBbz8aF
 ISkGnHZ77zRoof4FGCAdApmHRV4hxmhkzizSs9NOl/xyHgjEVdTwam86QBgOsUuIcb+J
 MRHmgyoMWSbW56wDErgWeTtD9EB7ErJcD/LDcXR+l+fKPPqx6LUqgKtZ1BGRPPxEfttB
 kQrD7xtiMRRpIOJPGyXtAAcyb0Dvj+ucWvAf6Q9eOTvEiUobNqdLsz4r2NvwflOVZ198
 NleQppPNm4L6lTW5T4nON1Qwp7V7Q6OaU8CaF6s1ggbc5qjIvX2Jv1y2Vhsnc9PenK3Y
 6EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0szOl/Q5keJYQjPtxy9YApfb7ftHWXnTXQ4eoRdC7oM=;
 b=KUbw9pR6FSXSyXcWmHYfHpcy8YzsYUMbvfjlQDLIztChlzq/AIOFhCllj1bnhtpIIf
 ZwycAEzN2z9VGxQFGKsa9yLUq+xoXKPfBYPpPxkcZycE0o5wgpCxNQGNy01k5iMW488q
 yzFLhceGChEPZR9TCjIqRt0O6A4+1d+/iKMacDlJO9YjANRjd3sjGgcQgtD/+/07hJ1w
 eeZPJ9A0rbW1Esf4OZtSGFQvnRM33v1YvHMIZ2XOAh4NFI3iMI0E6FMY6Z5qDkWaQ7Fn
 l1tmSKu2wHzELpPdTuewFxO2+983jV+S8zLcLMfd5Xm5kxD7GFo/hCBRBP56H4b4Jn6B
 NOfg==
X-Gm-Message-State: AOAM530de7DfSP0jnVQEkfUwbX9GEWF5sOQ2TNsHIYSvGOlZXPTwGpsW
 cVlThrLQJAMArND5x8FcsPo=
X-Google-Smtp-Source: ABdhPJzQlgbJ2vipxR8pOXATO00s5SdfAkVzILUymzDybhDIw7JfAUJP3lpRvmIhgSc/zwSufi+TBw==
X-Received: by 2002:a17:90a:19d2:: with SMTP id
 18mr5145011pjj.27.1633454406293; 
 Tue, 05 Oct 2021 10:20:06 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:f69:1127:b4ce:ef67:b718])
 by smtp.gmail.com with ESMTPSA id
 f25sm18476722pge.7.2021.10.05.10.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:20:05 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v4 3/8] PCI/DPC: Initialize info->id in dpc_process_error()
Date: Tue,  5 Oct 2021 22:48:10 +0530
Message-Id: <5ebe87f18339d7567c1d91203e7c5d31f4e65c52.1633453452.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633453452.git.naveennaidu479@gmail.com>
References: <cover.1633453452.git.naveennaidu479@gmail.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the dpc_process_error() path, info->id isn't initialized before being
passed to aer_print_error(). In the corresponding AER path, it is
initialized in aer_isr_one_error().

The error message shown during Coverity Scan is:

  Coverity #1461602
  CID 1461602 (#1 of 1): Uninitialized scalar variable (UNINIT)
  8. uninit_use_in_call: Using uninitialized value info.id when calling aer_print_error.

Initialize the "info->id" before passing it to aer_print_error()

Fixes: 8aefa9b0d910 ("PCI/DPC: Print AER status in DPC event handling")
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index c556e7beafe3..df3f3a10f8bc 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -262,14 +262,14 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 
 void dpc_process_error(struct pci_dev *pdev)
 {
-	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
+	u16 cap = pdev->dpc_cap, status, reason, ext_reason;
 	struct aer_err_info info;
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
-	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
+	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
 
 	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
-		 status, source);
+		 status, info.id);
 
 	reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
 	ext_reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT) >> 5;
-- 
2.25.1

