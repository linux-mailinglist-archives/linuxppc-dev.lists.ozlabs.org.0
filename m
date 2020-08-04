Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 334B223B218
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 03:07:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLGnS3pR5zDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 11:07:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pjoBEqPL; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLGVn3qDFzDqSy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 10:54:41 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id g33so3747030pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 17:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TU3SRRU1yviRNCjMLAnsKlr/sUkaBRch6YksoB3RDVw=;
 b=pjoBEqPLaruyg/LZ6s/J23+vFMqLCUPA+pKWLP1lxSBpVGvfr6RIc7CaG5jSnwBbjT
 IvhrGm9e2JHp6MzQ9CaUxtICcPQf+v+j92IduA2RtVUfjFpq6pRzAPXDGcdzdS7NvoGF
 gzcAUEvhrWwTSli+rIA+0D+TfVf8wwJQnW/vbCFYNhWysAfL0Yln+B1ZxP3A2aTztLvW
 OMdxp6zc2uK8lSrmELIiN9nGKorYLkYSTNPQJo4I6kUOwaXcHJMpLFJtSo1quNJ0iRBW
 /OvNL6orO7+StsBsIo2hiRxnuVAsZCEV27jBNKZp5LMhmdYcxdkKB4smo9VlM7LYPybn
 LQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TU3SRRU1yviRNCjMLAnsKlr/sUkaBRch6YksoB3RDVw=;
 b=DUkArtbUHQY/+bRX6SguTFn4BvlIX5Tc+wpsTtFR1u9quEJb5gb7zFuH9+9IGOXsZr
 A/CdaoXDpsc2yjrULt7fkODBu3Yf7U0kVUtMEQjiWPQt52KMug2twWV9w4Y7LEjsVHfc
 wsSSv5iwbhKMr6C5It335aT2GchM8eZV4XuoV5Wk8Do6uOf45Y+jwotHIQ+zRGK3Oi9+
 Aqs6FTeLhR98oQfRXBCiZjCp4lqK82S4oDXRL+rJZMXYmXH4LNImY4uXVR4b4EjFIBUM
 onXFqVfTA9dThWT/JmxiwOm/U4ziUslmjFsoBOZNW2sJaYD+CbXIf80+wSpL1YzEhBZD
 HnAQ==
X-Gm-Message-State: AOAM531ZrHCyI6s/ImqF5zJxP/Y8tzVPu9BxsVpnRTakxp/D1Qe76Ela
 4JSRhuSBhR/BEgyacqsCEXYi0qwJ
X-Google-Smtp-Source: ABdhPJzSPrsFLBTSJ3rX0mfIPsICDI9SieEJJM+Vhteaorfkrep3T4ZSBc3IBUY6wIXHM9WUPzRKOQ==
X-Received: by 2002:a62:4c7:: with SMTP id 190mr3227823pfe.103.1596502478625; 
 Mon, 03 Aug 2020 17:54:38 -0700 (PDT)
Received: from localhost.ibm.com ([120.17.110.210])
 by smtp.gmail.com with ESMTPSA id 80sm10381327pfy.147.2020.08.03.17.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 17:54:38 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] powerpc/powernv/pci: Drop unused parent variable
Date: Tue,  4 Aug 2020 10:54:09 +1000
Message-Id: <20200804005410.146094-6-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804005410.146094-1-oohall@gmail.com>
References: <20200804005410.146094-1-oohall@gmail.com>
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

The "parent" variable in pnv_pci_ioda_configure_pe() isn't used for
anything anymore and can be dropped.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index c9c25fb0783c..6d48155bd885 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -894,7 +894,6 @@ int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 
 int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 {
-	struct pci_dev *parent;
 	uint8_t bcomp, dcomp, fcomp;
 	long rc, rid_end, rid;
 
@@ -904,7 +903,6 @@ int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 
 		dcomp = OPAL_IGNORE_RID_DEVICE_NUMBER;
 		fcomp = OPAL_IGNORE_RID_FUNCTION_NUMBER;
-		parent = pe->pbus->self;
 		if (pe->flags & PNV_IODA_PE_BUS_ALL)
 			count = resource_size(&pe->pbus->busn_res);
 		else
@@ -925,12 +923,6 @@ int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 		}
 		rid_end = pe->rid + (count << 8);
 	} else {
-#ifdef CONFIG_PCI_IOV
-		if (pe->flags & PNV_IODA_PE_VF)
-			parent = pe->parent_dev;
-		else
-#endif /* CONFIG_PCI_IOV */
-			parent = pe->pdev->bus->self;
 		bcomp = OpalPciBusAll;
 		dcomp = OPAL_COMPARE_RID_DEVICE_NUMBER;
 		fcomp = OPAL_COMPARE_RID_FUNCTION_NUMBER;
-- 
2.26.2

