Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 343EF10312E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:35:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hlcv2k91zDqC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:35:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YrB4fsgf"; 
 dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlTq0mrwzDqfS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:18 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id ep1so3433276pjb.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cd/IhyIHOwa5Dm8bei0HDxMoIs8X0t2aOScohPykdxs=;
 b=YrB4fsgfAPTYT1qcCf9otQsmX8oY3jFR8AVKu1bwEzjVGp4l2xN/hv1EbJe5yj48PE
 CpBm7XuVEN8hVYMVEQsf7S3hYvZkMeL2P2tstVETdX/pZYsVoFpH6wcRZrBjtS5y9ANO
 26OJrK+sZUHmbesWsGaPeHGxLlIcCYluw6WRFf2doUSfgOP88STOsu6dVYneQ8SjNwxQ
 ZfHalr2kb7j5YZ/A80/F//wyzb06PsB7MWyQZm3Kd3RDWFdx6AmDyH39U7LyJb5ayeRr
 slTiKDnTZYO9Z5Ud3Vq0CgPiFm2xXUHXQ4O7jyalbrL0ezN/o+d2m71XR6RdT9tomI32
 Fzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cd/IhyIHOwa5Dm8bei0HDxMoIs8X0t2aOScohPykdxs=;
 b=pSWM75Dbq3nVxEAciQ2FZ7PoQNhMZ38H9YRG8YOluapbF5nxWJwDxEBsMoTyyvtWXA
 sdG+LJ3n8tGmDLv0eSURi6Yb793UxNuzCw2cKzuLvmw4u+cs4l1jIilrVNvwjTxEj3a3
 LEMaWX+scgudHPF7+Z1uf8X0DZoEZUlRvqtV9GI+tspiDUgI7tU0U1KJCw9oyyHBvAum
 PKOmpBRAV/6tuTRcWhmBQO+H1o3+xO8EgSLPwV2JDocON5cWfd3ucXfOByhsfNFFmwRg
 MyHKaISI4c8ZTeaxhdruYZ5DDLO9ynT/vfKw2wO35G0nXJxqfJHpRifwrouwYxrzYltg
 OjWg==
X-Gm-Message-State: APjAAAXDu1FXB9bqcJpbVj7crS4YY6Bq04fkFwugm1LMlCwBrd4pzFot
 RO7iHwVnTauCz7CJKh2At4h0ljGQ
X-Google-Smtp-Source: APXvYqxVq+LBmfwA0l1TqHrk8wC4w8V8Kx5emTdbDMVmE+Wj3VdSxL7dqTDC15W13LITgkFxQcaacA==
X-Received: by 2002:a17:90b:f0c:: with SMTP id
 br12mr657131pjb.67.1574213356839; 
 Tue, 19 Nov 2019 17:29:16 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:16 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 02/46] powernv/pci: Add helper to find ioda_pe from BDFN
Date: Wed, 20 Nov 2019 12:28:15 +1100
Message-Id: <20191120012859.23300-3-oohall@gmail.com>
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

Linux has a look-up table for mapping BDFNs to PEs which is updated when we
call into OPAL to update the PHB's internally BDFN<->PE mapping. We can use
this table to the PE for a device without needing to use the cached value
inside the pci_dn.

We'd like to get rid of pci_dn eventually so this patch adds adds a helper
to find the ioda_pe of a BDFN based on the table. This is different to the
existing helper which takes a pci_dev directly because there are some
contexts (e.g. EEH recovery) where we need to check for an existing PE
assignment when no corresponding pci_dev exists.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 10 ++++++++++
 arch/powerpc/platforms/powernv/pci.h      |  1 +
 2 files changed, 11 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index fdacf98555e9..65b5b121ebad 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -660,6 +660,16 @@ static int pnv_ioda_get_pe_state(struct pnv_phb *phb, int pe_no)
 	return state;
 }
 
+struct pnv_ioda_pe *__pnv_ioda_get_pe(struct pnv_phb *phb, u16 bdfn)
+{
+	int pe_number = phb->ioda.pe_rmap[bdfn];
+
+	if (pe_number == IODA_INVALID_PE)
+		return NULL;
+
+	return &phb->ioda.pe_array[pe_number];
+}
+
 struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev)
 {
 	struct pci_controller *hose = pci_bus_to_host(dev->bus);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index f914f0b14e4e..01a01739c03e 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -193,6 +193,7 @@ extern void pnv_pci_dma_dev_setup(struct pci_dev *pdev);
 extern void pnv_pci_dma_bus_setup(struct pci_bus *bus);
 extern int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type);
 extern void pnv_teardown_msi_irqs(struct pci_dev *pdev);
+extern struct pnv_ioda_pe *__pnv_ioda_get_pe(struct pnv_phb *phb, u16 bdfn);
 extern struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev);
 extern void pnv_set_msi_irq_chip(struct pnv_phb *phb, unsigned int virq);
 extern unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
-- 
2.21.0

