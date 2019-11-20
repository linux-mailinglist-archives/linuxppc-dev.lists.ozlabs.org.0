Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64423103142
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:46:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hlsy0ZHbzDqXb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:46:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jT5V9ysv"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlV62kjgzDqhD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:34 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id q26so13322349pfn.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WH/UIf34Bs6istfttrTyBnIno1PNslucaw5Z8YVmo0I=;
 b=jT5V9ysvY7ultapWLPTtFklJHdfPDY5MNxWRM1/TfkxE2ufcOBzKhi88edO89l/Hy+
 BN1Eup4d65rjoqHKuTiRxeejPhbzW/o+NiIjJGxI+u1M0lZgGDtF5NZgeE3PdRPy/hKU
 TcANx1mJdr5GgCoxM7UuZIaO/vTyXveIwFywEYgb6Q147xLW+wZSotyhSaw3B0dkeiyw
 jiaS66gI5I2rdbLIREBnTJhN94HQhT7sUIL4NbzIG2KHrw95RighVyRgTXAlFQKg5uRQ
 1W0CLkghBnVq0Ll6sULJwmGGDl6+XXiXjYknFDU5IfwG2bVLKbvRXSSuUWX6G04TrMcG
 aNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WH/UIf34Bs6istfttrTyBnIno1PNslucaw5Z8YVmo0I=;
 b=JSKZ9vKdLmpL2imfUxwT1uuizehoQ8apLpXnAaYfVwE4uBFkWkGm4o5arI9mI412xt
 NqXv32NrM+ineEZHCubPyjMd2QXTofgSCXHLwYfvZjdbQCEqZOHmFkAa1ORTvT9Nl5+B
 gu+atCI4SSzIkoIF2YpPHMrbEM5hAVA6qstYyLrq7RTZtS6XzXU7GkAm0dluF9+BSDMe
 bJCRmPo5urEdr7fPgLdtSKk+VqZxoy9Fo9jpMpSIZaw40DLsu+NACXgEq/TipqUVJLVM
 UPwuFv8SIwH3M2nGs6nSLNn/wv8R44+Yh9M40/7XVj6MQdYPfZDspaKdczyispfAH73E
 JDMA==
X-Gm-Message-State: APjAAAX3SvNMp+PJLSeCT6/XOwtVHLr1xyKc9sTFu5MAIungKDBf7U9S
 4zJWCqzqfiRGAFaF9v+xX7xatnu2
X-Google-Smtp-Source: APXvYqyMZsoClgTPqGKaf1HBT2fy0dYqPHBL5ZL550TmV2qvqVF08Pjht7t+UVK6YwV7OqgXdEuT8A==
X-Received: by 2002:a63:934d:: with SMTP id w13mr149062pgm.185.1574213371002; 
 Tue, 19 Nov 2019 17:29:31 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:30 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 08/46] powerpc/eeh: Calculate VF index rather than looking
 it up in pci_dn
Date: Wed, 20 Nov 2019 12:28:21 +1100
Message-Id: <20191120012859.23300-9-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Find the VF index based on the BDFN of the device rather than using a cached
value in the pci_dn. This is probably slower than looking up the cached value
in the pci_dn, but it's done infrequently (only in the EEH recovery path) and
it's just arithmatic.

We need this here because the functions to remove a VF are slightly
different to those which remove a physical PCI device.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh_driver.c | 44 +++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index a1eaffe868de..1cdeed464aed 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -457,12 +457,35 @@ static enum pci_ers_result eeh_report_failure(struct eeh_dev *edev,
 	return rc;
 }
 
+#ifdef CONFIG_PCI_IOV
+/* FIXME: this should probably go in drivers/pci/iov.c */
+static int eeh_find_vf_index(struct pci_dev *physfn, u16 vf_bdfn)
+{
+	u16 vf_bus, vf_devfn;
+	int i;
+
+	vf_bus = vf_bdfn >> 8;
+	vf_devfn = vf_bdfn & 0xff;
+
+	for (i = 0; i < pci_num_vf(physfn); i++) {
+		if (pci_iov_virtfn_bus(physfn, i) != vf_bus)
+			continue;
+		if (pci_iov_virtfn_devfn(physfn, i) != vf_devfn)
+			continue;
+		return i;
+	}
+
+	WARN_ON(1);
+	return -1;
+}
+
 static void *eeh_add_virt_device(struct eeh_dev *edev)
 {
-	struct pci_driver *driver;
 	struct pci_dev *dev = eeh_dev_to_pci_dev(edev);
+	struct pci_driver *driver;
+	int vf_index;
 
-	if (!(edev->physfn)) {
+	if (!edev->physfn) {
 		eeh_edev_warn(edev, "Not for VF\n");
 		return NULL;
 	}
@@ -476,11 +499,18 @@ static void *eeh_add_virt_device(struct eeh_dev *edev)
 		eeh_pcid_put(dev);
 	}
 
-#ifdef CONFIG_PCI_IOV
-	pci_iov_add_virtfn(edev->physfn, eeh_dev_to_pdn(edev)->vf_index);
-#endif
+	vf_index = eeh_find_vf_index(edev->physfn, edev->bdfn);
+	pci_iov_add_virtfn(edev->physfn, vf_index);
+
 	return NULL;
 }
+#else
+static void *eeh_add_virt_device(struct eeh_dev *edev)
+{
+	WARN_ON(1);
+	return NULL;
+}
+#endif
 
 static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
 {
@@ -521,9 +551,9 @@ static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
 
 	if (edev->physfn) {
 #ifdef CONFIG_PCI_IOV
-		struct pci_dn *pdn = eeh_dev_to_pdn(edev);
+		int vf_index = eeh_find_vf_index(edev->physfn, edev->bdfn);
 
-		pci_iov_remove_virtfn(edev->physfn, pdn->vf_index);
+		pci_iov_remove_virtfn(edev->physfn, vf_index);
 		edev->pdev = NULL;
 #endif
 		if (rmv_data)
-- 
2.21.0

