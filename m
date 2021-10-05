Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 355FF422F1F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 19:22:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP4Ch0Rlxz3c8n
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 04:22:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GlH/iBtQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GlH/iBtQ; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP4963pltz3c7P
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 04:20:26 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id u7so86537pfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Oct 2021 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=GlH/iBtQPycG2+vBjfYb9YFZT0YC56AKQ1tVIynYkTBrvjpWGLWo08OltcrmtvYqIB
 0jMRr3FkNUcmMQxd2pt/9uCc0CqGkPvYMwM0XNwKaTsh9ExY6AmpD7hjpNw6QuKFq5cS
 zwT6QC2ioPW/E4YzbKYad5iLMiCdSaCTyvyZqrFOz46tnl2GRqON1GXP/f3PnTd4TO7c
 1fj1xkFehbw0B1+H3i4vdBlg6AuCcyBAjoVxIo2XgxE7U5Yz867IPV3RNkAMknj9Hmyd
 ltNU6p9WNhu0nxcT7+cZlG/vUiVw2am4cK9x7rGAryS1t+2vkwdoy73GxJXeLNjNsBfo
 E1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=vgubVBMgx558omtnY0EFVX3bu/3LDLMYGLV8LZztf7hvM3WLWUPQ0C5sVtyTKRQTnt
 3TGqiv84IEYkxnWF4HeXtG4zP4PRb1nuJBiKwKZQWoW7RbUr9XZPdlugPFJZ5sQMPAZN
 qEBn9MQC1bQbB9KqVBVjObPFXQYZAwyrMWhAq7+26F7XHd0v0ZJdF5fSeEB6d8Biqh+v
 5V5XK1KHNNqEbiZp/zxL0xLmg3CbTRIlST+sHoXwP/sH3BuQaaiRcUtblyZoTVD2fpy1
 uHUAVSjBDWftDvUd3VjMLElbpcYeBCQOcCufsPion3IGiSDPlaC/Hvq1X3uUcrKZPlOe
 pbHg==
X-Gm-Message-State: AOAM531bHo8HDxgS+F6rJtLrbjPoYwy8zK0ejLzXOuqXA3uZkjMoBfSW
 pbKIj11K9bKuny6QMItfkWY=
X-Google-Smtp-Source: ABdhPJxWGXtU11U8vgjFgtp/AwHRz21P2apHXPFWNX+czZ73dNSiwz+WnMvQIpDfwIBfgeFjid5dvA==
X-Received: by 2002:a62:3802:0:b0:44c:776b:f555 with SMTP id
 f2-20020a623802000000b0044c776bf555mr6250036pfa.82.1633454424124; 
 Tue, 05 Oct 2021 10:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:f69:1127:b4ce:ef67:b718])
 by smtp.gmail.com with ESMTPSA id
 f25sm18476722pge.7.2021.10.05.10.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:20:23 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v4 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER
 registers
Date: Tue,  5 Oct 2021 22:48:12 +0530
Message-Id: <0a443323ab64ba8c0fc6caa03ca56ecd4d038ea3.1633453452.git.naveennaidu479@gmail.com>
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

