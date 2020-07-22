Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D888322919F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:06:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRMl07k3zDqvt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:06:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NfEEZdqn; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9Y0qtFzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:37 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id o1so494077plk.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fgHhEh2oykE77A38LJ/db5x8IRjZ9TjDd+AV3bNcM54=;
 b=NfEEZdqndS0HIxaUlBmqwNq3y4r+rCdAdrNMkCDQsAyevIMTW2/GULm8uP/ubHL8SN
 nYGg5aRQI9D80ozJFVNkTQydht4m79SLGMkJZrBIF6oKWTqqDXeziKElucesy3OJo7gc
 G5YFSRVvvJ3GDbAMJnEF5gQRPmuFHlDxJd7p1/Qy/jIhCFRTf7bRtkFdmbSAYsAnvrk3
 Zi4fnYgLwJSEqLEA0nS4IIHcEFK5+9VKKTKsJAWF4/OCxaLnwj7LPMLqR9tnV5R+Gkup
 8jVmVYiTWCQEhb2RdqUd5Jr1LyoQXacXSzpMYpP1ciDWMNr5nBekofpNgC5l+OK7N3m+
 JbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fgHhEh2oykE77A38LJ/db5x8IRjZ9TjDd+AV3bNcM54=;
 b=LfV30OjHVTN4LUh+162Y2+gOK7+FHYuenvcgZ0DqhaJcAqSCUSP6cQKSl0As3j0IH6
 +o69EU2ttrMDNkXLiRn7EGbAc/NxwFvp3bNkTb0ynv5tvPPV4jVFLEc5LL5zYJKhh+ny
 jaPKf9LAF5a2oxVVXbAg7hBXW0YD7+scntzyaRyNeCIL2ykSq8pi2D378NcjrIwPD1XT
 ENi4JPBbMMuzcq5pyGzhcQYaUxw5v4Vs1bsF6YwmYAbX3xrj3o6BheQQjgr99ldesOYa
 4QAsIoQgYRXo88XoegauQFudCviee8VB5KMRk/0qO4qm3/CU/rIxiduKXJHzfD83kYvN
 XNzQ==
X-Gm-Message-State: AOAM531SjhavM5CcKgkpo2bwXYeIHJKD3uUtrJQ0qNp8Tt8BSoBiSO2O
 NGuKsAyE5siAryh+m9oum+hB2ym8GFo=
X-Google-Smtp-Source: ABdhPJwG+X9pHnzBZwbgKnzfDYD2l9MiDF+KwA7ZMpbLVECNj2WMQJRDbNe9FQ7pbE+yHbVtUHh+Tw==
X-Received: by 2002:a17:902:7241:: with SMTP id
 c1mr26291905pll.79.1595401054666; 
 Tue, 21 Jul 2020 23:57:34 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:34 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/16] powerpc/powernv/pci: Initialise M64 for IODA1 as a
 1-1 window
Date: Wed, 22 Jul 2020 16:57:03 +1000
Message-Id: <20200722065715.1432738-4-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722065715.1432738-1-oohall@gmail.com>
References: <20200722065715.1432738-1-oohall@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We pre-configure the m64 window for IODA1 as a 1-1 segment-PE mapping,
similar to PHB3. Currently the actual mapping of segments occurs in
pnv_ioda_pick_m64_pe(), but we can move it into pnv_ioda1_init_m64() and
drop the IODA1 specific code paths in the PE setup / teardown.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: no changes
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

