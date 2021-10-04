Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9429421A18
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:32:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNb7j5j59z3fWh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:32:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EJDTKmB+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EJDTKmB+; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNNVJ0FkKz2yPc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:32:55 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id e7so16728835pgk.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=EJDTKmB+cmlmsr0qIKuAtTN/kN6cR8NvESH2dE/tM4QMvhT+19A2eI1YW2jVOSY+FZ
 eiDjdPe9DjppdcR7db8XYN0/V/uedFNAuaLwvnEv321Y/Ij90byXHSCpyb+JuOND5Hdz
 YJQo2uGXJZrhDN8SKWrXEBQTVl0cVyR8cclU3PtMwvn2hpBlSBlD/s+fXuqwM8gs7ld/
 ol3BjZv+ZtKv9OB2xcbjxBJlRjgBwnjKjlmdIkpUcPD0F+8+XM8n+0im4gea4L/gm7hF
 jzePJqS/kVm33ThvcVCf5pSqNeySxMvtmKAqpw/qlF7MH10zQnXRvqeseglTqpgowhKq
 jZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=SKruA+zDBlHnRwsQFVl+QtUFY6sVMwBVVgZhNBOVmdsSWxF5zzseM8+VpVaR7XTtq/
 L43LiWfaodBUjWgBBPNbPYi04+Kt0rpNEz32jKQqcDEq79XcmHig67f8fuS/hggJsVug
 HQc/37cvRDtcBkCuEwE/Z6I01gCdbISGIOQqcCaukUQiXKz6l3aUH/ZTvxtqTsC2xTFK
 k8S6bTvSZnDVvFEXQYDEiKV9vmYkONAcpgH9jStvEnaGlgKx+XyZhipgdSGSCHUuFRoW
 V0xtPxTXRGOWoyrSr4Zfp5FpdOGqd9hkTIhhkcVHpqYVYKWRGXwYwGeJC3kwkn8c5Ksl
 y9XA==
X-Gm-Message-State: AOAM533l8btCkq3TxxOdQuo2/6aCdpnvAJdIwrkhe/wv8dFJ1j77MjMt
 C2QCsQFXS80GKHaaDsm49Ng=
X-Google-Smtp-Source: ABdhPJyNtlOm4ZKV7xBauAFvuyKhP0xBlVqGl0Lwgnj5beZB9aLsTPCzwRlA8XscSgq5TtTA4RK1Gg==
X-Received: by 2002:a65:44c4:: with SMTP id g4mr11266103pgs.254.1633357973671; 
 Mon, 04 Oct 2021 07:32:53 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 q3sm14489146pgf.18.2021.10.04.07.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:32:53 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v3 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER
 registers
Date: Mon,  4 Oct 2021 20:00:01 +0530
Message-Id: <14df904c301dc417485f5a7563053b81ab1d3c76.1633357368.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633357368.git.naveennaidu479@gmail.com>
References: <cover.1633357368.git.naveennaidu479@gmail.com>
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

