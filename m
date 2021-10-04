Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E664219FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:26:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNb0M17Ptz3cDh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:26:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ozwj5eo+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ozwj5eo+; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNMyl4Pf3z2yL7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:09:03 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 cs11-20020a17090af50b00b0019fe3df3dddso69532pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=Ozwj5eo+JQr13kbgISfT/YYcy0EwCY30LXLUlWlbVkJd67t6s5mPWeUrFyYkyLrScw
 QE30Lg2AZumU/Mp/g+pSA4HdJXE5l4IgxgYCrtImGnxcdEtEgn31D4eskl5WNWLfmoiP
 dwSqeOT1wboM4W0ANBUZwjRBI9rpiG7hFCcqlsROuhtqYyrXOjk7zuSd+Ijok4MTEt/8
 w4lb6EAAX7Fe0Frs8sNL9k/0JYK2UkkTdD1D0cj2HqZgpxjOjGHa7KywPAQ+vt5wkMcd
 Z+6A3E5K8CejOdX7iWB+K5ko0IFiqV343d0OD2eUzDncwhqD8kIy7on3eSNpIFI1BHle
 3woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+NqgXClATM2+U/6pmcAe6ttC1b34HIq6gozyTG/Fag=;
 b=Yu7Sb6HdxM4JXQYUJLfqU+/3vp6HN5/xpnwG3tpL2Zf0W9Hx8LkqUkzGXgrpTUZVwr
 YsS6TFieqAeJAynemfZ+juaPtTYNrw8bOfktYAD1JOsJfF1IdUVJxdPbu0fGepwc6st8
 tfmKf5p6wr8QAgKzjZi3jdYvovJNCHrUgwvwjj9gO6Kb1+EmnL8z8MvoDbSe0ayn3Dop
 sQrCMGsKYMO/aK2QrBo+vrRdmvXOQ3mpeEEj8OOjb6SUftf22MPWU2u0SYSwUik7BMtQ
 +kmTv6mSmFjFzZdKxC6ZzV789bH9kMYkyMB7K1IgEub/ugSmfXol4m9wRfuJxuz5Sx/Y
 p2AQ==
X-Gm-Message-State: AOAM531mJimIlhgR/ChOhz/4g9yBabJQYdFlPzt5vAvhSd+c0jRefFGx
 wgLUj3XS/sRLUzBWk92zJ6I=
X-Google-Smtp-Source: ABdhPJz9tTa1vY09/ksLF7xk0Y6tU/8x10h8zOlbMuBmOEpd9L/4e0/Z5IuE/XsKNuFAeKf6CCpFYg==
X-Received: by 2002:a17:902:b691:b029:12d:2b6:d116 with SMTP id
 c17-20020a170902b691b029012d02b6d116mr23418269pls.71.1633356541150; 
 Mon, 04 Oct 2021 07:09:01 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 p2sm15274135pgd.84.2021.10.04.07.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:09:00 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v2 5/8] PCI/DPC: Converge EDR and DPC Path of clearing AER
 registers
Date: Mon,  4 Oct 2021 19:36:31 +0530
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

