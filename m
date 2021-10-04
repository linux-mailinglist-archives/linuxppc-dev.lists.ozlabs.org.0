Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3A44219DE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:21:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZtS706Fz3cbC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:21:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=psisIvso;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=psisIvso; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNMdG4bL1z2xtf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 00:53:54 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 133so16622824pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=psisIvsoqqZTvAJJ5lZS9bVAzGPIXOqlASUu6Ft+XKdLqGhfIJqNLDB3IJY/rOhOn6
 W0emjIskVKKkuFOpMab0ECiJBjhbjT1iPghl9LbSO/wBM01uDStrHFDjsKEEPVjqD+L5
 D+yz0Ti1YGOvhSbCbGQCfOP+lKVLxj4FltbpE3mfhLLvI9pv/kUcPmp2sWNWOB4/GWjR
 to+BiHxENksQs39APHR5XyX9R6fMWxEj3/ghrXb2tb4ljex7JgLIFQlAaTdEGWw0Hj+x
 zuaz++vPpRgvUJ6rOV3iD+3LFFGEb7JL9+6P9G4NMNOLUKH7dFEdhikpbnkPjMN02Gxp
 W7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=5TYsEHxY7cjaIWqyGZmo/uUpRtP+Sf4KuChAjgpRsvOvqkRbQimfjD3m4c49v3xmxD
 tccab3NIAStGkD6by3Bvm75BPF5yh4ITZ+Ju4F300GUqzEb5yJ6OeY0vhdGLnbhM3Vs3
 JpT2jnSbLKaHyx2cJ41TWfuRlHhfSj1p67xEaGmjpSKNKbkBNzUGY2gq+rVDaPKMeg+X
 tmTexqxtcG3YjBOILFEMS5Fn20TqqpUJewUc1gxNzV4eLNKliejBILo/m5/YYYPDotYB
 OEFfip+jqZKN9HTixozmVdqzivnnRCRJYmpwrgnhoqa4ZcXl8lTRSisLvtAggMbY2acs
 To9Q==
X-Gm-Message-State: AOAM531TWWnyOZs1nUvsTvVocEee4z4bUJeEuCX/KhcFN9aj4leg4XKa
 QM5DBoEtAqnHRXn6JnHkXYA=
X-Google-Smtp-Source: ABdhPJwDSowptib1nJXhPUUJ3bBp3fd+JhzlaX7H/iuzO/TxYXwQ3yb5JSe0S6KbmH4lWdaEU10rQg==
X-Received: by 2002:a63:5c1b:: with SMTP id q27mr10744331pgb.284.1633355632829; 
 Mon, 04 Oct 2021 06:53:52 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 k17sm12209548pfu.82.2021.10.04.06.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:53:52 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER
 registers
Date: Mon,  4 Oct 2021 19:22:40 +0530
Message-Id: <14df904c301dc417485f5a7563053b81ab1d3c76.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633353468.git.naveennaidu479@gmail.com>
References: <cover.1633353468.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Oct 2021 09:16:56 +1100
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
Cc: Naveen Naidu <naveennaidu479@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the EDR path, AER registers are cleared *after* DPC error event is
processed. The process stack in EDR is:

  edr_handle_event()
    dpc_process_error()
    pci_aer_raw_clear_status()
    pcie_do_recovery()

But in DPC path, AER status registers are cleared *while* processing
the error. The process stack in DPC is:

  dpc_handler()
    dpc_process_error()
      pci_aer_clear_status()
    pcie_do_recovery()

In EDR path, AER status registers are cleared irrespective of whether
the error was an RP PIO or unmasked uncorrectable error. But in DPC, the
AER status registers are cleared only when it's an unmasked uncorrectable
error.

This leads to two different behaviours for the same task (handling of
DPC errors) in FFS systems and when native OS has control.

Bring the same semantics for clearing the AER status register in EDR
path and DPC path.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index faf4a1e77fab..68899a3db126 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -288,7 +288,6 @@ void dpc_process_error(struct pci_dev *pdev)
 		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
 		 aer_get_device_error_info(pdev, &info)) {
 		aer_print_error(pdev, &info);
-		pci_aer_clear_status(pdev);
 	}
 }
 
@@ -297,6 +296,7 @@ static irqreturn_t dpc_handler(int irq, void *context)
 	struct pci_dev *pdev = context;
 
 	dpc_process_error(pdev);
+	pci_aer_clear_status(pdev);
 
 	/* We configure DPC so it only triggers on ERR_FATAL */
 	pcie_do_recovery(pdev, pci_channel_io_frozen, dpc_reset_link);
-- 
2.25.1

