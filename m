Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DE3422F27
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 19:24:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP4G15bYwz3c5b
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 04:24:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=psgJCp6X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=psgJCp6X; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP4BQ6l8nz3cDp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 04:21:34 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id e7so17790pgk.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Oct 2021 10:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8KHMqaM1V3DuTRnE2HWYRtLECuoot+YO1EBfUwWqTQQ=;
 b=psgJCp6X1yB83VVSO7eBoBiGgR2hLAh9hXsh/pvHeYNpO9ILUMqx8zmygPefPR++LN
 37nY1zg6A1xjUPlJ4ST/RxSfmI6+pYI1rVL23SNpOWJ8ThgLh+AiKfCRzcmNb/5SEFMx
 nSe55aFdaSygqdPMdu6mDZHknajlF/MtETA9yH6qhuAcmxm36cLFcFxVIOjmAs9lKvkb
 XdzLP5cPIFdFqOdbM+QP4834U/fjH2M0vu9VcBmH/8OHg7Ut4gsuW9gxQrWE55B5C41D
 LeKDmyRn1H3w/vD45HFVJRREhj+Rjv1xDZuqXwzx9K8xKV8DvlIMt+PrL2yhw8rmApiH
 LqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8KHMqaM1V3DuTRnE2HWYRtLECuoot+YO1EBfUwWqTQQ=;
 b=6eWY/gOZphA9tOIH5ZEYsVEMovrhQ87EdxlofbA2IZqeUmKxbifTUmlXvsJNTcIYuO
 w8dyBfsW4s3ItR6NRcX/4dKsME8QF1ptg5Vr3G9ZdvmoF6KSCuOpXekoR0Guy/nokBWa
 IRNgDeyDegQaT5hhmpd9ysJdMUIUJcLRAY1embLqeAcZtrFKkJegHTATKec6sggPtml/
 PL8t52hmS/uqzrMxlGmDylCSfBAOHSlRUspeaNzXnbE/XNlzh+ghyDJFfyl0CuM4F6C8
 Lati4OoeN2rOEfb9MpeYFURpGbTdZfthfxoFoQiYjD7rWi5bBNh5obhfLL1Tg+LgQmOt
 duDw==
X-Gm-Message-State: AOAM532D2XI6YMpRvFAeQFGCD+/lssb2wT/CYE79Aa6ycnyo+Ojcn1iO
 r7QN/PRgMDpF28XLGJiTEsg=
X-Google-Smtp-Source: ABdhPJyXbn7O+swbM9D8yH4827BLXqU74mQatvY986DG0V0KKiyfLQiRw50GqimEA4wIGTeafWQ/3g==
X-Received: by 2002:aa7:9e9a:0:b0:447:a1be:ee48 with SMTP id
 p26-20020aa79e9a000000b00447a1beee48mr32003271pfq.48.1633454492516; 
 Tue, 05 Oct 2021 10:21:32 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:f69:1127:b4ce:ef67:b718])
 by smtp.gmail.com with ESMTPSA id
 f25sm18476722pge.7.2021.10.05.10.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:21:32 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v4 8/8] PCI/AER: Include DEVCTL in aer_print_error()
Date: Tue,  5 Oct 2021 22:48:16 +0530
Message-Id: <18cad894ac3210af806104b3b4fa6a8cf1554ac8.1633453452.git.naveennaidu479@gmail.com>
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

Print the contents of Device Control Register of the device which
detected the error. This might help in faster error diagnosis.

Sample output from dummy error injected by aer-inject:

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03.0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000, devctl=0x000f <-- devctl added to the error log
  pcieport 0000:00:03.0:    [ 6] BadTLP

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pci.h      |  2 ++
 drivers/pci/pcie/aer.c | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index eb88d8bfeaf7..48ed7f91113b 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -437,6 +437,8 @@ struct aer_err_info {
 	u32 status;		/* COR/UNCOR Error Status */
 	u32 mask;		/* COR/UNCOR Error Mask */
 	struct aer_header_log_regs tlp;	/* TLP Header */
+
+	u16 devctl;
 };
 
 /* Preliminary AER error information processed from Root port */
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index d3937f5384e4..fdeef9deb016 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -729,8 +729,8 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 		   aer_error_severity_string[info->severity],
 		   aer_error_layer[layer], aer_agent_string[agent]);
 
-	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
-		   dev->vendor, dev->device, info->status, info->mask);
+	pci_printk(level, dev, "  device [%04x:%04x] error status/mask=%08x/%08x, devctl=%#06x\n",
+		   dev->vendor, dev->device, info->status, info->mask, info->devctl);
 
 	__aer_print_error(dev, info);
 
@@ -1083,6 +1083,12 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 	if (!aer)
 		return 0;
 
+	/*
+	 * Cache the value of Device Control Register now, because later the
+	 * device might not be available
+	 */
+	pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &info->devctl);
+
 	if (info->severity == AER_CORRECTABLE) {
 		pci_read_config_dword(dev, aer + PCI_ERR_COR_STATUS,
 			&info->status);
-- 
2.25.1

