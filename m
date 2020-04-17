Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603D1AD791
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 09:39:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Sf02cjtzDrQG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 17:39:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vXIIi7Ja; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493SYS2mhKzDrRn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 17:35:23 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id h69so702531pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cXXSxNdwsH6WZm2vWU/HSWjER389AtaM1XFk99LxGdY=;
 b=vXIIi7Jay+xrjHwA007/N8GAJyiZdTpBptgfGps5pbi+ena5ZY6dcIcZy6FoGX234H
 dj+esGm+3GrszdryqFjbCU+15bfnpdS6CTjPIGR2SCuQ+YPhCGenzgXdi/S1fQqTuHof
 zQPygXLR2e+uCK5yTGTE8g8hWIjAoNevcGpfjeazLrmkatd2k8PUVLzVkQ19hY9Wo9U6
 /unOSpMzr6Bas9/57lk1T33TN3XmkydAqbnv7QVEv/lbawZTtn48GTPqioBoaYTJOEct
 vf7gTr7aduUhyjOkS7lru/rLl8iCdBApqc1TFNyyKBru0t+eHUDk0mQdZxSlPtxaRZe/
 NpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cXXSxNdwsH6WZm2vWU/HSWjER389AtaM1XFk99LxGdY=;
 b=OGktY3VBZ+PmclEAppH4OWR/bGjbcpMh2qBhbLursU2T6/JeAqOJF+3RjRb1+dtaL4
 ibK6NF0P2tSFeH6zrdNS5X46mK0pDybTORgUQrEdywiQ3+kOP23Bim6yWsHUJ7u07DQX
 Srq3nU/I6PmEzm49grw0mNI3gc4Jz0/K4jbVPQ0Ejn7AnT+5b5hXuHCqBUHIfvdvG9xN
 0jtwcuXCt09F0YEd7GQNbZM95swzHkZyoqDGFPJNcnOFCU9KqTKGADPx0wohHIShDw09
 baUEqVjW3z5ewiP9hF0SE9Lg/exWJjJWevu5L05FtwGKelKAnJ6UnPKjGGd9PV4bmeBs
 qpYQ==
X-Gm-Message-State: AGi0PuYNpy2pGNjxhiGIoeWZUeKxR7y+VADcdplGI9RV8X/VMpetcdam
 nEGcFNGczJpxy5HOKwtIx2aGec9/
X-Google-Smtp-Source: APiQypK0xeuWdk6us1rrg7H3Z6iOhD20iFv66tlem6X2IPmDtXypbSMa/xR8U7Z1FRANUzbzhfD7OA==
X-Received: by 2002:a63:e909:: with SMTP id i9mr1735069pgh.370.1587108921649; 
 Fri, 17 Apr 2020 00:35:21 -0700 (PDT)
Received: from 192-168-1-13.tpgi.com.au (115-64-37-247.static.tpgi.com.au.
 [115.64.37.247])
 by smtp.gmail.com with ESMTPSA id mq18sm5272438pjb.6.2020.04.17.00.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 00:35:21 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/powernv/pci: Add helper to find ioda_pe from BDFN
Date: Fri, 17 Apr 2020 17:35:05 +1000
Message-Id: <20200417073508.30356-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200417073508.30356-1-oohall@gmail.com>
References: <20200417073508.30356-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For each PHB we maintain a reverse-map that can be used to find the
PE that a BDFN is currently mapped to. Add a helper for doing this
lookup so we can check if a PE has been configured without looking
at pdn->pe_number.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 10 ++++++++++
 arch/powerpc/platforms/powernv/pci.h      |  1 +
 2 files changed, 11 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 8ae8836..934cbee 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -660,6 +660,16 @@ static int pnv_ioda_get_pe_state(struct pnv_phb *phb, int pe_no)
 	return state;
 }
 
+struct pnv_ioda_pe *pnv_pci_bdfn_to_pe(struct pnv_phb *phb, u16 bdfn)
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
index fc05f9b..83d40a0 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -208,6 +208,7 @@ extern int pnv_eeh_phb_reset(struct pci_controller *hose, int option);
 
 extern int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type);
 extern void pnv_teardown_msi_irqs(struct pci_dev *pdev);
+extern struct pnv_ioda_pe *pnv_pci_bdfn_to_pe(struct pnv_phb *phb, u16 bdfn);
 extern struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev);
 extern void pnv_set_msi_irq_chip(struct pnv_phb *phb, unsigned int virq);
 extern unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
-- 
2.9.5

