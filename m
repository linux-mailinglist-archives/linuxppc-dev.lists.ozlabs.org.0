Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F511031B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:42:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hn5q1JPQzDqq8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:42:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a3aSVWA2"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlWN4vTwzDqg3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:40 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id s5so13335317pfh.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p440ekzN6TqXWdQ7LLj3Fue1KhAiLu6MRI0SMCG63mM=;
 b=a3aSVWA2iPezUwWWeB3CMgnytlE8XjHD7+r4QxuTifDcCczZGBMuumvfxyvfJukWMq
 dGx8LG+O4hgpkHluRszG4F5Ik17rMX5urHk7H122Tp8slPuam4CdwlB1aHYBh5qEFzL0
 UfJz37XfGtd/a2jL54YOxvDO7Wld32seJfxzDeb36uCFtPHgJexKcdFAdgI5Qad1cLOH
 V2MlUbmumrn3k/tig+kEUf6V6cLcWwtuEFG3ai4qtC3ZqJRyWkjn5IzERWyLhdoL30O2
 9GU3m/xMMM+Jzxj8+Drm0CTs+iIfT+NeqxawyZc7vDABxlJaM7AFGTEqthCNQ/789k2B
 oNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p440ekzN6TqXWdQ7LLj3Fue1KhAiLu6MRI0SMCG63mM=;
 b=XpYNhWFUHOouLFfrX/pQ/ts05rFKpfdaL3g03zWD2RSf1vVEImIbSBIIRyHWjjRhkI
 JC2uyXHFKh6SsWIoV3c+7jM/lENwYZVgVxFdEWri3StLQviHXim6KOZFYKclt08Bw37R
 qjH6Dw6kcN2avF5sT07KQH3OTHdkCRWaCY/fhWNjr1wSwN5ezYf+EKqhbPetPbGlfuy+
 Tljxyrrwz11VCU7x8vq8RqC/grEgipdjIaGAsT0qg7u5zTepMUMHDHZwC9Mj6kKNkrV/
 bfB8V/X3VJ8IKaG8GFPZpOLBcUGkfUy2QazSeN/JLXrq7lnY0GWoEQIUKaVvAfzeVQjI
 kq5w==
X-Gm-Message-State: APjAAAWQ/wZb9tkW74ltPdUlm9G4wjPlDDjvlwM5/sDSKhpto1rz8lcP
 MK5iebqrQltBYCTpQ32rmw893Vt2
X-Google-Smtp-Source: APXvYqwU2ZemD0FtvDPn2HIREBz1vllDtQ2c2zBOiAmV9HCdm3L+9HLcdshUNbAdGvsiqYLdusSnTg==
X-Received: by 2002:a63:1042:: with SMTP id 2mr174005pgq.59.1574213437609;
 Tue, 19 Nov 2019 17:30:37 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:37 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 36/46] powernv/npu: Remove open-coded PE lookup for GPU
 device
Date: Wed, 20 Nov 2019 12:28:49 +1100
Message-Id: <20191120012859.23300-37-oohall@gmail.com>
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

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/npu-dma.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index b95b9e3c4c98..68bfaef44862 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -97,25 +97,16 @@ EXPORT_SYMBOL(pnv_pci_get_npu_dev);
 static struct pnv_ioda_pe *get_gpu_pci_dev_and_pe(struct pnv_ioda_pe *npe,
 						  struct pci_dev **gpdev)
 {
-	struct pnv_phb *phb;
-	struct pci_controller *hose;
 	struct pci_dev *pdev;
 	struct pnv_ioda_pe *pe;
-	struct pci_dn *pdn;
 
 	pdev = pnv_pci_get_gpu_dev(npe->pdev);
 	if (!pdev)
 		return NULL;
 
-	pdn = pci_get_pdn(pdev);
-	if (WARN_ON(!pdn || pdn->pe_number == IODA_INVALID_PE))
-		return NULL;
-
-	hose = pci_bus_to_host(pdev->bus);
-	phb = hose->private_data;
-	pe = &phb->ioda.pe_array[pdn->pe_number];
+	pe = pnv_ioda_get_pe(pdev);
 
-	if (gpdev)
+	if (pe && pdev)
 		*gpdev = pdev;
 
 	return pe;
-- 
2.21.0

