Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B10C1F9460
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 12:12:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lnFK4nWRzDqcv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 20:12:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=refactormyself@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LROVgM3U; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ll2Q0g7pzDqGY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 18:32:45 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id b82so5192715wmb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LITx0hRUIi2s0zyE1t9RreKX12TROzF0jbPsYEw7a6g=;
 b=LROVgM3UbJsunBVTDQc6YnuCBFFfAkZvrZXlxcwnUE8Y5GVCb7hTTl/WDNhOZy+6Xu
 EaGowoNKFFiyujkvYmfaAGxdQPKziOwvy+LQzF3eBQb9l96HzHbmpfaVgHHnPADSWE2H
 I6Cet/NvMy8f/JfrVkwqIR5JbuOgl4gJBb48gK/f/Tgn/4rImbWs36a2vJtRYiuQ5S4C
 hj9jr1We9pK/qchTQGJYh/Y7VJKlyohhmh3H1wobfz8Pa80zCSQppsxmZdoatZCQSPMX
 1HLURZqPWoo+gKsZ6+ptU30rJmOO6mBKLhB7E8fSt7K5HOMQ+cddKgmHu8dtWVYLduFz
 3x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LITx0hRUIi2s0zyE1t9RreKX12TROzF0jbPsYEw7a6g=;
 b=W38YO2SPDMdrNdKY1msa1Pl9MSaxZBFBbVuYSglm4uNQJ35E0lTtEMBfENHK3Y3gD0
 JHB2Rr/zCMXjGrWTp3gs+AVp8FhriOhNIj6F9rAoSu37/v+e9pMT7sTcAujwhHxYBH3e
 xKgN9+UyNRJzty5Gga/a6TW4IRk8gWbuZLQPNwRlBihMm9UYtE1bXfzxgyHw+aSLbDug
 ZYL8+zREXzIWhN0BfIWZVRmPJwjaRk8n7W639HooYmlBv3dN0HwzIh9zudl00PtVho4N
 m+1M0IgNuVWk4lHi18jDqDIF7mZ/QgZjHxY6WBC1qDM5HnTyQAHPJEhi6r09MmvplCsM
 fDMg==
X-Gm-Message-State: AOAM531M17B7WMEaOEAEN1KjiZ6MMuw3ku73au0abJZtREIRdA7jpi79
 pONVnDL3JI1Jlh5z9aT37vg=
X-Google-Smtp-Source: ABdhPJw04FZmglvBQAYa1v3ByqfYKXiOGDZXpDs1UTQSt8C8BmZt7jyni4XR4+j0NGd7DZy+4KCTMw==
X-Received: by 2002:a1c:678a:: with SMTP id
 b132mr11656022wmc.122.1592209961579; 
 Mon, 15 Jun 2020 01:32:41 -0700 (PDT)
Received: from net.saheed (54006BB0.dsl.pool.telekom.hu. [84.0.107.176])
 by smtp.gmail.com with ESMTPSA id z206sm21954745wmg.30.2020.06.15.01.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 01:32:41 -0700 (PDT)
From: refactormyself@gmail.com
To: helgaas@kernel.org
Subject: [PATCH v2 6/8] PCI/AER: Convert PCIBIOS_* errors to generic -E* errors
Date: Mon, 15 Jun 2020 09:32:23 +0200
Message-Id: <20200615073225.24061-7-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
References: <20200615073225.24061-1-refactormyself@gmail.com>
X-Mailman-Approved-At: Mon, 15 Jun 2020 20:10:47 +1000
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Bolarinwa Olayemi Saheed <refactormyself@gmail.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 skhan@linuxfoundation.org, bjorn@helgaas.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

pci_enable_pcie_error_reporting() return PCIBIOS_ error codes which were
passed on down the call heirarchy from PCIe capability accessors.

PCIBIOS_ error codes have positive values. Passing on these values is
inconsistent with functions which return only a negative value on failure.

Before passing on the return value of PCIe capability accessors, call
pcibios_err_to_errno() to convert any positive PCIBIOS_ error codes to
negative generic error values.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
---
 drivers/pci/pcie/aer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index f4274d301235..95d480a52078 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -349,13 +349,17 @@ bool aer_acpi_firmware_first(void)
 
 int pci_enable_pcie_error_reporting(struct pci_dev *dev)
 {
+	int rc;
+
 	if (pcie_aer_get_firmware_first(dev))
 		return -EIO;
 
 	if (!dev->aer_cap)
 		return -EIO;
 
-	return pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);
+	rc = pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);
+
+	return pcibios_err_to_errno(rc);
 }
 EXPORT_SYMBOL_GPL(pci_enable_pcie_error_reporting);
 
-- 
2.18.2

