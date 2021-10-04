Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48428421A01
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNb1v0jwNz3cJX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:27:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Si7JSd/K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Si7JSd/K; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNMyz3Wy8z2yM7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:09:15 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id w11so11163527plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GUEhHrxHzVocYPRDueBy4ZqExPBHlS+x/5Sx/kTwk+s=;
 b=Si7JSd/KCOLunLi8xM0VLOx2PfEG1rYw8Zg126ccHtdjh+YTOhxwYlmk3G+Z+iOuCf
 MHWlQfDnN9L3IAYokhBuv6RzMXNEwGLY39mOQKAm8xzjypeTvKVCQTCx8KM/NezRyTGI
 TSa03Y3eVG7e/CJ/pJUta1TShaEHhnDHumTQlJwYJCf3Q/8DVlgTE815cyGKa8qtRTXc
 AlfIFxKrM1KIkTARnCET6lxWANzMKgN1pEKjXGsMgdHENp5Cl8NwGBRFQCzr1Myh4Isq
 Ut5lkCVNfJF0Ebmmzx6NwBkhmaW5aH0OLSSbRBazBfBfQ9eZBBVpn0zOlK0pEBRJiJnb
 iP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GUEhHrxHzVocYPRDueBy4ZqExPBHlS+x/5Sx/kTwk+s=;
 b=uK9HXXD1hUf/HDVJGD5aq+3JehLMfBKgbI9qxRwVp6DIooiC3jAnXOdqkNRhzTSk6N
 8ZCVwWMoqDoR9RHGXkECBnpZyU8dJjMKPbIFGTpTUpKQ+lzPux7T+F9YMKatQbMtRnUT
 U+tgsqF7xwo2Q9EVGqYIMXTkn6nB/eLrcLh29G3AWiTkU1IQeD86tT+apa5IDSv9acrR
 JYEDQcU71k5Je5o4CKF4qkAEgjpVgw7/SDdrRG5uFvoRizxfoALD7dFman88w+c57SDa
 /s8aMXNQhSpNY7Dwjcnf1bIbaV0hYh5j5XUur3/rXNlHR22brpS8NZKlwCuedXNLlA3v
 K+5g==
X-Gm-Message-State: AOAM532tY59qNhl/zxLkgtf8ZsUEnOsMl2wKPU+oAbkLPBnrBJAee4Ve
 MVD3iMDnrn590HKK/LWlHwg=
X-Google-Smtp-Source: ABdhPJzZI+MfrURo1cZfuN3jk5UmArmhStUAiLlG7jckDZv+60lz4zNDTU5W6sSrwZ9tVHHecR8OSQ==
X-Received: by 2002:a17:902:7ec8:b0:13b:9d7a:6396 with SMTP id
 p8-20020a1709027ec800b0013b9d7a6396mr23741711plb.86.1633356552819; 
 Mon, 04 Oct 2021 07:09:12 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 p2sm15274135pgd.84.2021.10.04.07.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:09:12 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v2 7/8] PCI/ERR: Remove redundant clearing of AER register in
 pcie_do_recovery()
Date: Mon,  4 Oct 2021 19:36:33 +0530
Message-Id: <2360908d0f8406ed63a17a733c4d1defb49ee3d3.1633353468.git.naveennaidu479@gmail.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pcie_do_recovery() is shared across the following paths:
 - ACPI APEI
 - Native AER path
 - EDR
 - DPC

ACPI APEI
==========

  ghes_handle_aer()
    aer_recover_queue()
      kfifo_in_spinlocked(aer_recover_ring)

  aer_recover_work_func()
    while (kfifo_get(aer_recover_ring))
      pcie_do_recovery()

In this path the system firmware clears the AER registers before
handing off the record to the OS in ghes_handle_aer()

Native AER
==========

 aer_irq()
   aer_add_err_devices_to_queue()
     kfifo_put(&rpc->aer_fifo, *e_dev)
     clear_error_source_aer_registers()   <---- AER registers are cleard

 aer_isr()
   aer_isr_one_error()
    handle_error_source()
      pcie_do_recovery()

The AER registers are cleared during the handling of IRQ, i.e before we
the recovery starts.

DPC
=====

  dpc_handler()
    dpc_process_error()
    pci_aer_clear_status()       <---- AER registers are cleared
    pcie_do_recovery()

EDR
====

  edr_handle_event()
    dpc_process_error()
    pci_aer_raw_clear_status()  <---- AER registers are cleared
    pcie_do_recovery()

In all the above paths, the AER registers are cleared before
pcie_do_recovery(). The non fatal status AER registers are again cleared
in pcie_do_recovery(). This is redundant.

Remove redundant clearing of AER register in pcie_do_recovery()

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/err.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index b576aa890c76..fe04b0ae22f4 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -231,14 +231,11 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	/*
 	 * If we have native control of AER, clear error status in the device
-	 * that detected the error.  If the platform retained control of AER,
-	 * it is responsible for clearing this status.  In that case, the
-	 * signaling device may not even be visible to the OS.
+	 * that detected the error.
 	 */
-	if (host->native_aer || pcie_ports_native) {
+	if (host->native_aer || pcie_ports_native)
 		pcie_clear_device_status(dev);
-		pci_aer_clear_nonfatal_status(dev);
-	}
+
 	pci_info(bridge, "device recovery successful\n");
 	return status;
 
-- 
2.25.1

