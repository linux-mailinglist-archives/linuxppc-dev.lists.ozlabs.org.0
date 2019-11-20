Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BC7103184
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:23:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hmhq2KCWzDqpJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:23:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S8Le2eph"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlW04CyLzDqfC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:20 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id d7so12988825pls.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8bZk5fsNuJgY6F2YPm+4cY87/KPa/88Ir7LN0RHoHHs=;
 b=S8Le2ephhEPMNPhkYeo6/ZIyu4uqiyQye3y3WvK/1w4WarRQ8M16tbh5ozKihadtB1
 dcSkWXu49Vq2narJzd5jvEGLm5DJkVqw9IZVS8oW8NHhSorWhbinAWv4VNithaRe0MeR
 fqQH+UQiiQGfRVVL1w/1m0CJK//zFadZONwy8uRD0SgUjsc1LaSJKwaG1n5GcazO0ii4
 v2galP6WorPDj9JcD6+le4SH4vzxTEUtMU0BzvcMSd7vSXpVMs0/0lYiyEzfbo23raOM
 aok/Lh+wQNVUcjd3XrndUm9ZsNm+KTmMGAzFU2E1aPUCb6ndYewRg0wehls+TzPki2wm
 dObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8bZk5fsNuJgY6F2YPm+4cY87/KPa/88Ir7LN0RHoHHs=;
 b=D4C8iEOle2BxxY+sENjvumoJTbRnUKYBw0aMcInPuItvORsaC6PxGQwsLJS0kdQJs9
 X3RBguwIniFK0WxxrvmH43a8N5+Y/LRxB8qe5yqs8TCOb+EymlmL88aIv79rPWyTHFms
 UMmhrzSlghOSRqz26P5cHhGEmquHxDmiXkhCP3G2gj1Tf8gbJPimoV38gQkcTLvcJy4k
 CdKWGOY3XVF0Vjy4YwOx15+oawth/RHPPp8mIKrplUgZOkLAb6nskgD7LywRXdE7TUqh
 NZhcBiUZ84xQIpdERj0GUrTTqpaKGsep+cnED79LI9WWTz3Nl/X0u2B/iNnFp0sQTMOd
 yzWg==
X-Gm-Message-State: APjAAAXSQpaw0PDD7Q6hbpmPJ8h9tfbkkT02NNKswOFLtE2194+IgU8L
 cgEccRQVVN1m6Am5MHOva3Wi45sc
X-Google-Smtp-Source: APXvYqzwxQIWMzhN5Bi02IGp7KRQYuc//EgMBKf93wX0MTCCes4u26OERN6BFLjbwKEFrJyjlHioBg==
X-Received: by 2002:a17:902:ac88:: with SMTP id
 h8mr205373plr.299.1574213415681; 
 Tue, 19 Nov 2019 17:30:15 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:15 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 27/46] powernv/pci: Clear reserved PE freezes
Date: Wed, 20 Nov 2019 12:28:40 +1100
Message-Id: <20191120012859.23300-28-oohall@gmail.com>
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

When we scan an empty slot the PHB gets an Unsupported Request from the
downstream bridge when there's no device present at that BDFN.  Some older
PHBs (p7-IOC) don't allow further config space accesses while the PE is
frozen, so clear it here without bothering with the diagnostic log.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 36eea4bb514c..5b1f4677cdce 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -642,6 +642,19 @@ static void pnv_pci_config_check_eeh(struct pnv_phb *phb, u16 bdfn)
 	if (fstate == OPAL_EEH_STOPPED_MMIO_FREEZE ||
 	    fstate == OPAL_EEH_STOPPED_DMA_FREEZE  ||
 	    fstate == OPAL_EEH_STOPPED_MMIO_DMA_FREEZE) {
+
+		/*
+		 * Scanning an empty slot will result in a freeze on the reserved PE.
+		 *
+		 * Some old and bad PHBs block config space access to frozen PEs in
+		 * addition to MMIOs, so unfreeze it here.
+		 */
+		if (pe_no == phb->ioda.reserved_pe_idx) {
+			phb->unfreeze_pe(phb, phb->ioda.reserved_pe_idx,
+					 OPAL_EEH_ACTION_CLEAR_FREEZE_ALL);
+			return;
+		}
+
 		/*
 		 * If PHB supports compound PE, freeze it for
 		 * consistency.
-- 
2.21.0

