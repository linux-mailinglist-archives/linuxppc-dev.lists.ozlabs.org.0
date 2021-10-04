Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C864421A03
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:28:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNb3N1D6Dz3f63
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:28:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NUydINFe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NUydINFe; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNN2m2vR1z2yNK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:12:30 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 66so16241694pgc.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6pWZxY1yQdsUwMEG6Is0voI7d8xdXhwobuZZscOdeBw=;
 b=NUydINFeaaYz+i9WPJbGyeQUsYFP9zSERxwD1Jn6Zy3MiwxkpVvQ3g86oUYweoEXDn
 g7AO/boeGyjJTIfJs+jbcZvYQnaMw9L97HPI95jvHheem05IGEyontOjc0UTaTno4QTd
 fMOc4+ztxfQkYeEjO6chiS+rUMQKcVKzRBZHPqeoqq3ImqAXzW/9+m/Tps0r9Q9BujQ0
 HY/BmFj4rlxn+bOKAZY3EjI734hi0507/9dFVNHsFShpknbny5hjumwJL6CVQANs/7DF
 6tod9my1Q5SU43oRK2wEoF0yRZzbY754966s+x8u1QlbRbLLB4tutM5+B4uA0I4juRv3
 iq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6pWZxY1yQdsUwMEG6Is0voI7d8xdXhwobuZZscOdeBw=;
 b=AuwzQpK1gek/9XK+amF0Mif/FxIzwGnZ50SIkvyPYJBoOGBXTE42oXed0ofolFf1Ay
 XW6Wgxcw7DrVXxgdV0tDq+SCqkcIN6ZGkXaoTUXruT6O8NL6Xss5DdgUxJ11ehqiq8F5
 ATNWofjRzNr7Fd/EGUK49wdoRvrhz4rQCM4HX6UlPc2q6FVqRvCWoDiaCVVb+RiojBLn
 HFGcThFdw9O46tGrU5hoQsPrWB1wjiNPS7KZmG0Cg3G9Nu4xOGaTYBFcUeUbgqk+ezXU
 LQeNxrMo3ZbutwpVS96UYlQdFe3R5fmsaXFaTjsSXFR6iJM4PkyL5iOSsuFGPh+j0PV7
 IMNQ==
X-Gm-Message-State: AOAM531TgQi3BedNBpMabv8zwafAHnRf+s1W/eK3RdouEVQibOEmqWty
 OzVZunRNu/JBsrhfZgzWWyY=
X-Google-Smtp-Source: ABdhPJy637X8uWvHNOw8XJA6f1F6uN2R7daksnQfvQ4CYbdoIpgTFzTfpXCbIoBTqV1cSFppFJQK8w==
X-Received: by 2002:a62:1ac4:0:b0:44c:4c4e:1d3c with SMTP id
 a187-20020a621ac4000000b0044c4c4e1d3cmr10348659pfa.8.1633356747885; 
 Mon, 04 Oct 2021 07:12:27 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 mt5sm4266860pjb.12.2021.10.04.07.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:12:27 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v2 8/8] PCI/AER: Include DEVCTL in aer_print_error()
Date: Mon,  4 Oct 2021 19:42:05 +0530
Message-Id: <e39df4392e514bae8dbd373a3c92d994d8c2ae49.1633353468.git.naveennaidu479@gmail.com>
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

Print the contents of Device Control Register of the device which
detected the error. This might help in faster error diagnosis.

Sample output from dummy error injected by aer-inject:

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03.0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000, devctl=0x000f
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
index 91f91d6ab052..42cae01b6887 100644
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

