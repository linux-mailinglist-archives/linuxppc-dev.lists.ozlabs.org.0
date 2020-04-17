Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF59B1AD79E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 09:43:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493SkT2Q2dzDrCX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 17:43:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uXHhQGWs; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493SYW5QvXzDrRY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 17:35:27 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id t16so662497plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 00:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e1GZf1x6K4DfT00mFjvMndou7fU2diMYvGiobgYE6ko=;
 b=uXHhQGWsx67u+CShMT22CZenQp8NwpSEmPLDmn7wBGmWh49xJ0ZVxqbpjJaJm33X4i
 7Px+7BxOQF4eo4JS+jp9mYvj5uHKXUd+7vnNdEHfwLmyzShGPWlfYf3VJHmeqjmgtegw
 +9AyyNTPpBfOrsWTISMILFpQnh5s1Led27R5p04eANDxKj5I/E4l48FUQXCKT6I3VKwr
 i7S6FT0gTQ/fKKSU463hyoaV+Shv91zAOc3upu2kPgZ7eD7pgwEUTwqy8HUOd0n4Px73
 IVPHSTSMLCWUSX8sGr8Hu2NEKCEDuKja6tkZcflzrAD0QqwZGNvEEdbacu9LatkgarPH
 P5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e1GZf1x6K4DfT00mFjvMndou7fU2diMYvGiobgYE6ko=;
 b=Z64wlQZM33lyg7y5KMGbkkIx5kX+J14TaQ8+owKcjg3Dkv0ql1RckXskZLg73obYdh
 UDzIBSRVp3/ivNB9jRoyLnxN/qFk32Icdtr2pJT0oOz5U/LOUIb6TXQzK9IvybJM6ods
 adlVDODFtBcL+LFFhsogX7PuNvWszGNOk7na1rxzXKvvW7tf/v51QmGSHcgzccz8q7im
 KNg3zRXsM+iR2V18SV1md57kvQxM5SLbxfDtM77po85Ygr/b954WAuEVFkX/u3UnT4Hw
 UMNrXywp5jgtxaQ9ZmOva6xnRLg83CJxEby7LLQsX9gDUdudnA0fzzyGF9VZjSU6KGkB
 DaMA==
X-Gm-Message-State: AGi0PuaVsk6Uv8LjQj/q0e4HOH46moFce0eHLLUODawAprr9cwPD+pUa
 5bGevDfXKak+I4zznPp0sbNosB2m
X-Google-Smtp-Source: APiQypJfqfYf6r79mWhEaQ00rGRNOirKfV2jmnkA+6cAOJitiHHaXhhV7+k5p6IiCLT7I0OW505cRA==
X-Received: by 2002:a17:90a:8c96:: with SMTP id
 b22mr2831186pjo.25.1587108925334; 
 Fri, 17 Apr 2020 00:35:25 -0700 (PDT)
Received: from 192-168-1-13.tpgi.com.au (115-64-37-247.static.tpgi.com.au.
 [115.64.37.247])
 by smtp.gmail.com with ESMTPSA id mq18sm5272438pjb.6.2020.04.17.00.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 00:35:25 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc/powernv/pci: Reserve the root bus PE during init
Date: Fri, 17 Apr 2020 17:35:07 +1000
Message-Id: <20200417073508.30356-4-oohall@gmail.com>
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

Doing it once during boot rather than doing it on the fly and drop the janky
populated logic.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 26 +++++++++-----------------
 arch/powerpc/platforms/powernv/pci.h      |  1 -
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 2ba730c..05436a9 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1145,8 +1145,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
 	}
 
 	/* PE number for root bus should have been reserved */
-	if (pci_is_root_bus(bus) &&
-	    phb->ioda.root_pe_idx != IODA_INVALID_PE)
+	if (pci_is_root_bus(bus))
 		pe = &phb->ioda.pe_array[phb->ioda.root_pe_idx];
 
 	/* Check if PE is determined by M64 */
@@ -3224,15 +3223,6 @@ static void pnv_pci_configure_bus(struct pci_bus *bus)
 
 	dev_info(&bus->dev, "Configuring PE for bus\n");
 
-	/* The PE for root bus should be realized before any one else */
-	if (!phb->ioda.root_pe_populated) {
-		pe = pnv_ioda_setup_bus_PE(phb->hose->bus, false);
-		if (pe) {
-			phb->ioda.root_pe_idx = pe->pe_number;
-			phb->ioda.root_pe_populated = true;
-		}
-	}
-
 	/* Don't assign PE to PCI bus, which doesn't have subordinate devices */
 	if (list_empty(&bus->devices))
 		return;
@@ -3517,11 +3507,10 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
 	 * that it can be populated again in PCI hot add path. The PE
 	 * shouldn't be destroyed as it's the global reserved resource.
 	 */
-	if (phb->ioda.root_pe_populated &&
-	    phb->ioda.root_pe_idx == pe->pe_number)
-		phb->ioda.root_pe_populated = false;
-	else
-		pnv_ioda_free_pe(pe);
+	if (phb->ioda.root_pe_idx == pe->pe_number)
+		return;
+
+	pnv_ioda_free_pe(pe);
 }
 
 static void pnv_pci_release_device(struct pci_dev *pdev)
@@ -3629,6 +3618,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 	struct pnv_phb *phb;
 	unsigned long size, m64map_off, m32map_off, pemap_off;
 	unsigned long iomap_off = 0, dma32map_off = 0;
+	struct pnv_ioda_pe *root_pe;
 	struct resource r;
 	const __be64 *prop64;
 	const __be32 *prop32;
@@ -3796,7 +3786,9 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
 		phb->ioda.root_pe_idx = phb->ioda.reserved_pe_idx - 1;
 		pnv_ioda_reserve_pe(phb, phb->ioda.root_pe_idx);
 	} else {
-		phb->ioda.root_pe_idx = IODA_INVALID_PE;
+		/* otherwise just allocate one */
+		root_pe = pnv_ioda_alloc_pe(phb);
+		phb->ioda.root_pe_idx = root_pe->pe_number;
 	}
 
 	INIT_LIST_HEAD(&phb->ioda.pe_list);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 83d40a0..51c254f2 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -136,7 +136,6 @@ struct pnv_phb {
 		unsigned int		total_pe_num;
 		unsigned int		reserved_pe_idx;
 		unsigned int		root_pe_idx;
-		bool			root_pe_populated;
 
 		/* 32-bit MMIO window */
 		unsigned int		m32_size;
-- 
2.9.5

