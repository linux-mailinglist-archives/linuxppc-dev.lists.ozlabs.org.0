Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDBA21AED1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:39:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B320T71K2zDqHG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:39:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xj/TAvqh; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31gC313ZzDrJp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:07 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id j18so4558101wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S1H3gB/KR+iz/Hy/dmxzeNuiOgdKb2h5srkyvNUzkD8=;
 b=Xj/TAvqhLTMndwNTD6VfgJn6S8Rb7hv47O9tyzrwsIwdr0lV4WEBx0ERCgePW5Dl++
 RJ1pkCr7A3mHfAvwqtjdVRrfMmnBwPj0bYh/u1Wu4FAv/iBmqqL8n8VR9TBlppfcfeFl
 OJ/TTicafXgKEQsxJuXPv60YNu7Hl6TFVovdGA/3u67iQzVMSKVOn6iSN7mm+ZySEpow
 0nk8FceHabKHUrMD6XW28DBzVLR/eV2vzYYhMVjc5gGwI2tGwGURx/jhoTgQR3C2NJ0Y
 fheK78A/W+6r/BFP8U6f+CLjIuGV3Jx8d07JBhqb2XtaYoUVEM0wGaoKb9uSI0MuG5aR
 6lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S1H3gB/KR+iz/Hy/dmxzeNuiOgdKb2h5srkyvNUzkD8=;
 b=td6NV+h08Pg8B33cxSCe465FL24yRVQ4UWgYct6NnXY3pyBtJKsm+R3tY+nSLuBaAJ
 zcMCmaNMUdnSFTkCokou5TmolWZ5Ky7UfdSDnBHvfWcq4kiYyHxFA4FxpaN5iH9ozUiQ
 z+UWfqPR9cb/u/rfdO8/UbMUmeQ0yqTObhRLTShq6HD/usQO58+AuCasJT1J/s4x9Ccd
 hDcYRs82f7j5vbM21q5Ljn3pYrg1fA91jnQu7e699U1gsC/55twM91Tp6iuaEvqYC+P2
 LYkP5X3jiysWwZkNid5IyQ5l8T5AED6G5uXQ4jqr9LNbOsjJIxx9g5nF1uuLlYMOOAoR
 o/Rg==
X-Gm-Message-State: AOAM533YV0Rv1awjdiBsVZtgEDO8Jv1zsotxcvz7TzmgRkn01HoBfeTv
 OjUhG17BYt1Ow2tzVlT0eaA//+0IsCs=
X-Google-Smtp-Source: ABdhPJwLSZzecx3eAk1EB5YUp+JRuT2xPMSDTLISb5rIOKPyuBxpm5H63TMSR/L+4ossijdMZ0KFtg==
X-Received: by 2002:a1c:7416:: with SMTP id p22mr3346847wmc.32.1594358644330; 
 Thu, 09 Jul 2020 22:24:04 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:24:03 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/15] powerpc/powernv/pci: Initialise M64 for IODA1 as a 1-1
 window
Date: Fri, 10 Jul 2020 15:23:29 +1000
Message-Id: <20200710052340.737567-5-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710052340.737567-1-oohall@gmail.com>
References: <20200710052340.737567-1-oohall@gmail.com>
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

We pre-configure the m64 window for IODA1 as a 1-1 segment-PE mapping,
similar to PHB3. Currently the actual mapping of segments occurs in
pnv_ioda_pick_m64_pe(), but we can move it into pnv_ioda1_init_m64() and
drop the IODA1 specific code paths in the PE setup / teardown.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 55 +++++++++++------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index bb9c1cc60c33..8fb17676d914 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -311,6 +311,28 @@ static int pnv_ioda1_init_m64(struct pnv_phb *phb)
 		}
 	}
 
+	for (index = 0; index < phb->ioda.total_pe_num; index++) {
+		int64_t rc;
+
+		/*
+		 * P7IOC supports M64DT, which helps mapping M64 segment
+		 * to one particular PE#. However, PHB3 has fixed mapping
+		 * between M64 segment and PE#. In order to have same logic
+		 * for P7IOC and PHB3, we enforce fixed mapping between M64
+		 * segment and PE# on P7IOC.
+		 */
+		rc = opal_pci_map_pe_mmio_window(phb->opal_id,
+				index, OPAL_M64_WINDOW_TYPE,
+				index / PNV_IODA1_M64_SEGS,
+				index % PNV_IODA1_M64_SEGS);
+		if (rc != OPAL_SUCCESS) {
+			pr_warn("%s: Error %lld mapping M64 for PHB#%x-PE#%x\n",
+				__func__, rc, phb->hose->global_number,
+				index);
+			goto fail;
+		}
+	}
+
 	/*
 	 * Exclude the segments for reserved and root bus PE, which
 	 * are first or last two PEs.
@@ -402,26 +424,6 @@ static struct pnv_ioda_pe *pnv_ioda_pick_m64_pe(struct pci_bus *bus, bool all)
 			pe->master = master_pe;
 			list_add_tail(&pe->list, &master_pe->slaves);
 		}
-
-		/*
-		 * P7IOC supports M64DT, which helps mapping M64 segment
-		 * to one particular PE#. However, PHB3 has fixed mapping
-		 * between M64 segment and PE#. In order to have same logic
-		 * for P7IOC and PHB3, we enforce fixed mapping between M64
-		 * segment and PE# on P7IOC.
-		 */
-		if (phb->type == PNV_PHB_IODA1) {
-			int64_t rc;
-
-			rc = opal_pci_map_pe_mmio_window(phb->opal_id,
-					pe->pe_number, OPAL_M64_WINDOW_TYPE,
-					pe->pe_number / PNV_IODA1_M64_SEGS,
-					pe->pe_number % PNV_IODA1_M64_SEGS);
-			if (rc != OPAL_SUCCESS)
-				pr_warn("%s: Error %lld mapping M64 for PHB#%x-PE#%x\n",
-					__func__, rc, phb->hose->global_number,
-					pe->pe_number);
-		}
 	}
 
 	kfree(pe_alloc);
@@ -3354,14 +3356,8 @@ static void pnv_ioda_free_pe_seg(struct pnv_ioda_pe *pe,
 		if (map[idx] != pe->pe_number)
 			continue;
 
-		if (win == OPAL_M64_WINDOW_TYPE)
-			rc = opal_pci_map_pe_mmio_window(phb->opal_id,
-					phb->ioda.reserved_pe_idx, win,
-					idx / PNV_IODA1_M64_SEGS,
-					idx % PNV_IODA1_M64_SEGS);
-		else
-			rc = opal_pci_map_pe_mmio_window(phb->opal_id,
-					phb->ioda.reserved_pe_idx, win, 0, idx);
+		rc = opal_pci_map_pe_mmio_window(phb->opal_id,
+				phb->ioda.reserved_pe_idx, win, 0, idx);
 
 		if (rc != OPAL_SUCCESS)
 			pe_warn(pe, "Error %lld unmapping (%d) segment#%d\n",
@@ -3380,8 +3376,7 @@ static void pnv_ioda_release_pe_seg(struct pnv_ioda_pe *pe)
 				     phb->ioda.io_segmap);
 		pnv_ioda_free_pe_seg(pe, OPAL_M32_WINDOW_TYPE,
 				     phb->ioda.m32_segmap);
-		pnv_ioda_free_pe_seg(pe, OPAL_M64_WINDOW_TYPE,
-				     phb->ioda.m64_segmap);
+		/* M64 is pre-configured by pnv_ioda1_init_m64() */
 	} else if (phb->type == PNV_PHB_IODA2) {
 		pnv_ioda_free_pe_seg(pe, OPAL_M32_WINDOW_TYPE,
 				     phb->ioda.m32_segmap);
-- 
2.26.2

