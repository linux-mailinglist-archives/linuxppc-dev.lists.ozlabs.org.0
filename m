Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA2F439CE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 19:05:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdLtC7122z3dhV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 04:05:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Km6qa7as;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Km6qa7as; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdLqG5xbhz2ypX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 04:02:34 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso5458460pjc.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 10:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cqjk8A2jWPq0oF4j9f9pzp1s4umWD0fjXGGtRVK6pjI=;
 b=Km6qa7as2zKj4ahv0p9FX7MpcWGD6tjOML1ZhOUQeUR0KuKrOM/Y0B/OyJfcY7k+wV
 vxBWCUFtyHAC9xpI7R+JpBoHX7mIBWtExK6dpDNOvdxr8x585+K1/QoH1n9W51ljXFIe
 Ime4psXupDQ8xMItucMuFoc8wY9NLuiKaSBK9NCeCLy4GpEaqcgSw4MigLRUmPBvRKBV
 zeGByhYX/WSCf8Rw50ZVEGRzOm1ClghUP3ygjo8N7vdrD6cgqrTBfTZqpLCwQ5gg2s9A
 hpWhkVoMpqIKr+Z8t1u0lgEIc0EPdLIJCebjyg1jYoq/0ks0XSKGoaFxjA2/LD1Bz+gE
 HU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cqjk8A2jWPq0oF4j9f9pzp1s4umWD0fjXGGtRVK6pjI=;
 b=FIye1kv3mfVFnEGAmKIe1lVLzSE+zoLebGM9Yvn1xFYp0FTGeTlaCP7LY8Dtwsit5s
 IAZqG+NMKQFLxzphSRmpEJlpAFFFXDa14rx8BY3XQCI1TWnex3cY+RtPXRbl+I7Tyb5u
 w9xAXVClE+9VYY9DQSnoSj4P9dZIlLsbgbVQ00+B1xAVA8V4aWK15vN5ZKs8itceM3xs
 Uy62L/cOz9T7yWxanXcq6Nenex5a4eyQ9pPFZ3hJDtE6ufZcSxksx04NnaMxTTb9Nyyo
 gfxzS1gvgOu7xuPMwFDyoKwyKLwbWuT9B9J3jLYgKRTSSHG/vWWJQUp6rQBgEqE08nDL
 U7GQ==
X-Gm-Message-State: AOAM530SYq6pZ6PyM3ojgWS6nrczftTQ4ak9uShLijOwdgiVDNYAHqjn
 glbYW3fbyUhcZ3t4nBHJ/1A=
X-Google-Smtp-Source: ABdhPJwvg9sfWgMNprK2Vf152fcQgXoPVYpKGuP89MlymuNgLLjfTAnceEvjffU47QWeOG5XuHfFZw==
X-Received: by 2002:a17:90b:1bcc:: with SMTP id
 oa12mr21825917pjb.212.1635181351786; 
 Mon, 25 Oct 2021 10:02:31 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:df8b:7255:8580:2394:764c])
 by smtp.gmail.com with ESMTPSA id
 g18sm5100858pfj.67.2021.10.25.10.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:02:31 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v5 5/5] PCI/AER: Include DEVCTL in aer_print_error()
Date: Mon, 25 Oct 2021 22:31:04 +0530
Message-Id: <656b4eab7fae68de86bb0a52568fb93822833828.1635179600.git.naveennaidu479@gmail.com>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Naveen Naidu <naveennaidu479@gmail.com>, skhan@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Print the contents of Device Control Register of the device which
detected the error. This might help in faster error diagnosis.

It is easy to test this by using aer-inject:

  $ aer-inject -s 00:03:0 corr-err-file

The content of the corr-err-file is as below:

  AER
  COR_STATUS BAD_TLP
  HEADER_LOG 0 1 2 3

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

