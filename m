Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B824103139
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:40:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HllD2hz1zDqfD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:40:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QkHjPxS2"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlTx6n98zDqhS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:25 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id ay6so12986994plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5xvhSgvwuo1MlctGt2uVz7nXO1XUbklcDl75eTUy1Wc=;
 b=QkHjPxS27xDZgS+hp1ZXCF9Rg74h9jCsoZRAZr1ji8qj51zLvIP46/LwE4cwC17osR
 U7NlwTXUMMGZV3JWUTiBEUPyDj/4qm5hGyGdXxdJxHMxRs8Bwb9xxofDhmseMyjomHBE
 1WyMJvkvPSzmgCd3458TQk09wod55CRvG3S87U2vg+3jUxxMz3SHkidOVjILxSisn1Kz
 AMlpWuNEZ/JZnJ7nS3ns4Z4iKl0ZS22IVwhs70F1TfQE/iPtLnd/48+cuzhhLUlF1BVx
 +ciJbkcewsrsjeX4TO0ti4Pb6U/crChRMSwuPAf+t6SJ2zcyor/vS189lsuqwxp9b8Q1
 EJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5xvhSgvwuo1MlctGt2uVz7nXO1XUbklcDl75eTUy1Wc=;
 b=bz1J6oDRkUcQG5rumUzo/shmfL/WxMkWR0qPOZnQsPV+WdpMZGRqbK1UUwR1ibGFXm
 qEPUHN6SCvyAcEGSXxDhh00mZ0LjJM9GYItxWqtt6Hk4ekyaZqIx/tg1lgf2Jh8Z7TzI
 9BUXiWVlxO9Xmgr60eKz3V8B5Nx/keVPbm4+ce4gZFKkPdiceJYFobi9z70PMz0ypCib
 Cs2RWcEhSPZCF9xgo7m7tFnLfSjhPkfustN1QiabxtHiTuXVJar/KU9PFd7Tnft5n0nJ
 6GtFOIjmC7C7XR8zIP0pjs/fzvlma64rBjZytwpy8K7i1ZJdvEQ0beqXCXMkXwsvjvbc
 NwNg==
X-Gm-Message-State: APjAAAXIExmWnkai4UkmgljfnScrOiJsDyhjs0lDYIRE0jf3nczBPvK5
 Kjrfic6CpZ/Kt/4Xk6yXi3XaEB72
X-Google-Smtp-Source: APXvYqw7U1B4ieww9lz96oGRiNIS/6RCJMulcjJfQTOEWVTJsBDo0bh7RRLxJGEfEe29Yb2oNUq7yw==
X-Received: by 2002:a17:902:aa06:: with SMTP id
 be6mr208978plb.317.1574213363673; 
 Tue, 19 Nov 2019 17:29:23 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:23 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 05/46] powernv/pci: Remove the pnv_phb dma_dev_setup
 callback
Date: Wed, 20 Nov 2019 12:28:18 +1100
Message-Id: <20191120012859.23300-6-oohall@gmail.com>
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

This is only ever set for IODA PHBs. The only call site is in
pnv_pci_dma_dev_setup(), which is also only used by normal IODA PHBs, so remove
the callback in favour of a direct call.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 4 +---
 arch/powerpc/platforms/powernv/pci.h      | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index c2b3a5a13004..45f974258766 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3656,8 +3656,7 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
 	}
 #endif /* CONFIG_PCI_IOV */
 
-	if (phb && phb->dma_dev_setup)
-		phb->dma_dev_setup(phb, pdev);
+	pnv_pci_ioda_dma_dev_setup(phb, pdev);
 }
 
 void pnv_pci_dma_bus_setup(struct pci_bus *bus)
@@ -3940,7 +3939,6 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 		hose->controller_ops = pnv_npu_ocapi_ioda_controller_ops;
 		break;
 	default:
-		phb->dma_dev_setup = pnv_pci_ioda_dma_dev_setup;
 		hose->controller_ops = pnv_pci_ioda_controller_ops;
 	}
 
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index f23145575048..3c33a0c91a69 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -108,7 +108,6 @@ struct pnv_phb {
 	int (*msi_setup)(struct pnv_phb *phb, struct pci_dev *dev,
 			 unsigned int hwirq, unsigned int virq,
 			 unsigned int is_64, struct msi_msg *msg);
-	void (*dma_dev_setup)(struct pnv_phb *phb, struct pci_dev *pdev);
 	int (*init_m64)(struct pnv_phb *phb);
 	int (*get_pe_state)(struct pnv_phb *phb, int pe_no);
 	void (*freeze_pe)(struct pnv_phb *phb, int pe_no);
-- 
2.21.0

