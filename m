Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F4439CBF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 19:03:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdLrn6Zl1z3cmQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 04:03:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A406sfTr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=A406sfTr; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdLq40VGjz2yg8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 04:02:23 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id r2so11530375pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 10:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IP7bg1XxqK5dXg//yE9NcJiabkbw2qPuKs1z85ZWNME=;
 b=A406sfTrXh8GMkSFquNuEPUPbjXrxLZbOVCF4bYpKdMv8ShllAqdbJdQb04lVxhhHC
 NKkoeX83bwle+wOS3SOVstoXdO16KEasww9oDGJfCUsjGE+DjaeiNTYWvT74nieEka1N
 K9m4PrHtdH1pmfWFdizj9JYhifV5yhsxqg5B2nEfXZTlzb1FIiswefawc0O2iMM8q21n
 2VdIMqT36zQmkVdUYJLMaFyxVljy8JP/WNfT9KkTRKj1UPdytBECAF68jGLrlBj6FB57
 L5pp6txUxHnZJtWsBWKRJm57CWn0g/mevx9sY+YHInLJ4anBMRAhda4Zyo/IHjmIQ/dr
 23eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IP7bg1XxqK5dXg//yE9NcJiabkbw2qPuKs1z85ZWNME=;
 b=DH7FeQPNWzF/jIl1UhqkUM/yIraGT/330U9ruvk3ebZFqrdrd1yO/zbFDR1+FrnWvA
 8hGFiCtRwaAKVscWXt3bS1ct407Ig1MV0Nm+eG7/xeGw3kA9Dekc4V2gvNv2C3g2sSBR
 RIQTlCtuAFAEbygt/aSinXCWSo43gkisDR8BAhR/U/+U6nNgf9dKXh82fDFQt0dBuH+/
 egBPJlIuEt7IfGHZggf5rejdz+/x9jfdsqk+r44LcYTY/7lxb5XNNgGrOa+cSK06x6xr
 S+L1PvffmKwLO9mAvZoUvK5EOYAaI9qkzzHVNBSCAJjqbMyWQV1Eg9N6FXogFVs/gva4
 xwhA==
X-Gm-Message-State: AOAM5307ucml0wkYvK6cjIVhQp55aO8lfxW66EcCvoisuOMp/sqk3vyL
 HNe1lPeTYWWcGYp+KN4y9dA=
X-Google-Smtp-Source: ABdhPJwVXGCGM66S42ZGCsnkfum3D4CcEQwiQH5P2pomnEuWRSCqLNJFiZU0F8DC/4n6/2A7JXHjoA==
X-Received: by 2002:a63:2a88:: with SMTP id
 q130mr14468449pgq.169.1635181341692; 
 Mon, 25 Oct 2021 10:02:21 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:df8b:7255:8580:2394:764c])
 by smtp.gmail.com with ESMTPSA id
 g18sm5100858pfj.67.2021.10.25.10.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:02:21 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v5 3/5] PCI/DPC: Initialize info.id in dpc_process_error()
Date: Mon, 25 Oct 2021 22:31:02 +0530
Message-Id: <b486768a365ccef665b52fd9a1a2132006ab0f92.1635179600.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635179600.git.naveennaidu479@gmail.com>
References: <cover.1635179600.git.naveennaidu479@gmail.com>
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
Cc: Oza Pawandeep <poza@codeaurora.org>, linux-pci@vger.kernel.org,
 Sinan Kaya <okaya@kernel.org>, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 Keith Busch <kbusch@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the dpc_process_error() path, info.id isn't initialized before being
passed to aer_print_error(). In the corresponding AER path, it is
initialized in aer_isr_one_error().

The error message shown during Coverity Scan is:

  Coverity #1461602
  CID 1461602 (#1 of 1): Uninitialized scalar variable (UNINIT)
  8. uninit_use_in_call: Using uninitialized value info.id when calling aer_print_error.

Also Per PCIe r5.0, sec 7.9.15.5, the Source ID is defined only when the
Trigger Reason indicates ERR_NONFATAL or ERR_FATAL. Initialize the
"info.id" based on the trigger reason before passing it to
aer_print_error()

Fixes: 8aefa9b0d910 ("PCI/DPC: Print AER status in DPC event handling")
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index c556e7beafe3..6fa1b1eb4671 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -262,16 +262,24 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 
 void dpc_process_error(struct pci_dev *pdev)
 {
-	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
+	u16 cap = pdev->dpc_cap, status, reason, ext_reason;
 	struct aer_err_info info;
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
-	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
+	reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
+
+	/*
+	 * Per PCIe r5.0, sec 7.9.15.5, the Source ID is defined only when the
+	 * Trigger Reason indicates ERR_NONFATAL or ERR_FATAL.
+	 */
+	if (reason == 1 || reason == 2)
+		pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &info.id);
+	else
+		info.id = 0;
 
 	pci_info(pdev, "containment event, status:%#06x source:%#06x\n",
-		 status, source);
+		 status, info.id);
 
-	reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN) >> 1;
 	ext_reason = (status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT) >> 5;
 	pci_warn(pdev, "%s detected\n",
 		 (reason == 0) ? "unmasked uncorrectable error" :
-- 
2.25.1

