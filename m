Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6300228F69
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:52:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBNPY51bMzDqtZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:52:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VZSevDfz; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMqy0ZfhzDqlm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:27:10 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id a14so521192pfi.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X4Wyot5C0k8A9lcP99ZMDKVuKX34ZcTDRVaJqTq/ndw=;
 b=VZSevDfzl8NpHQRmBo/dNWF3mvq7My1x/5nLcDFgxLfCjOGtyjcar1mJwtawfnM0H1
 QgesHAwc8RH7n5inh4zbphvfktTgESbVTD3aZjT2AqwIIxw8+BUFLP5LTu8tGFIXjJCB
 3ObAe1DaqnIdSc2gFHJZ4TIK29NbRFph/LcFISybxDpjz6hBhikX9m4cL8cDJdDnT1xD
 Zjb8djY9Q97bRljQ7xNeVJq651EEDarC1MPov2wJRVG0RNL8xJSzq3GEIh5+Bquch7i3
 HRadZjUixjpXWOlQLzdSCFqd4d90Vy13REDwJedDr/GZvD8FNHKX/m1VTJI+6/f7c4R6
 5vFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X4Wyot5C0k8A9lcP99ZMDKVuKX34ZcTDRVaJqTq/ndw=;
 b=GgDM/vmpsOaCKpf4ybNcxCyMXK1RgiDbhOahjiTkZzKPELN2fa9/o4GY3bpFkL29wU
 /xkrx7Jg1uv9FOG6HqL9+fzJZZD0qrdiDB9g8u339+L3af+j8mGRTiVc63DE8ekXqm94
 +9XAwxJpWCzVC19wOUumy3tAcflk2SVDvIDP5GVYmnGpFcWvPoKmUhabvzJFpE+Vife1
 J/ICkRm0Ks+If7XZxI9NoPRlDt/yEXVqYwzfpY0utxbyI3Usg1QLDb09mkEb+N0THEDy
 yZtf29Qul9Icio9uTFN74Pg9t3eMkF1hTAM3vWkIh9e+OLS9ohHbMtjj0TmZ29JqOqsp
 FXPQ==
X-Gm-Message-State: AOAM533eatmgEntm44ll0rDLnkQjijt1WIiRUn/3yhCjzp8YJIlPsxi6
 IC20OWE37q9eG8Q9s0CUB2yIkb9036s=
X-Google-Smtp-Source: ABdhPJwIIxesKzJR8rv4LMmU5BpB8Xji24FGJQJTrvoabr4P/KzHYCvpWOBVZjg/tL4fRYllFUIXlA==
X-Received: by 2002:a62:346:: with SMTP id 67mr27438653pfd.111.1595392028052; 
 Tue, 21 Jul 2020 21:27:08 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id d4sm20583709pgf.9.2020.07.21.21.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 21:27:07 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 13/14] powerpc/eeh: Drop pdn use in eeh_pe_tree_insert()
Date: Wed, 22 Jul 2020 14:26:27 +1000
Message-Id: <20200722042628.1425880-13-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722042628.1425880-1-oohall@gmail.com>
References: <20200722042628.1425880-1-oohall@gmail.com>
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

This is mostly just to make the subsequent diffs less noisy. No functional
changes.

One thing that needs calling out is the removal of the "config_addr"
variable and replacing it with edev->bdfn. The contents of edev->bdfn are
the same, however it's worth pointing out that what RTAS calls a
"config_addr" isn't the same as the bdfn. The config_addr is supposed to
be: <bus><devfn><reg> with each field being an 8 bit number. Various parts
of the EEH code use BDFN and "config_addr" as interchangeable quantities
even though they aren't really.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: no changes
---
 arch/powerpc/kernel/eeh_pe.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 97bf09db2ecd..898205829a8f 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -366,9 +366,8 @@ static struct eeh_pe *eeh_pe_get_parent(struct eeh_dev *edev)
  */
 int eeh_pe_tree_insert(struct eeh_dev *edev)
 {
+	struct pci_controller *hose = edev->controller;
 	struct eeh_pe *pe, *parent;
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-	int config_addr = (pdn->busno << 8) | (pdn->devfn);
 
 	/* Check if the PE number is valid */
 	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr) {
@@ -382,7 +381,7 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
 	 * PE should be composed of PCI bus and its subordinate
 	 * components.
 	 */
-	pe = eeh_pe_get(pdn->phb, edev->pe_config_addr, config_addr);
+	pe = eeh_pe_get(hose, edev->pe_config_addr, edev->bdfn);
 	if (pe) {
 		if (pe->type & EEH_PE_INVALID) {
 			list_add_tail(&edev->entry, &pe->edevs);
@@ -416,15 +415,15 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
 
 	/* Create a new EEH PE */
 	if (edev->physfn)
-		pe = eeh_pe_alloc(pdn->phb, EEH_PE_VF);
+		pe = eeh_pe_alloc(hose, EEH_PE_VF);
 	else
-		pe = eeh_pe_alloc(pdn->phb, EEH_PE_DEVICE);
+		pe = eeh_pe_alloc(hose, EEH_PE_DEVICE);
 	if (!pe) {
 		pr_err("%s: out of memory!\n", __func__);
 		return -ENOMEM;
 	}
 	pe->addr	= edev->pe_config_addr;
-	pe->config_addr	= config_addr;
+	pe->config_addr	= edev->bdfn;
 
 	/*
 	 * Put the new EEH PE into hierarchy tree. If the parent
@@ -434,10 +433,10 @@ int eeh_pe_tree_insert(struct eeh_dev *edev)
 	 */
 	parent = eeh_pe_get_parent(edev);
 	if (!parent) {
-		parent = eeh_phb_pe_get(pdn->phb);
+		parent = eeh_phb_pe_get(hose);
 		if (!parent) {
 			pr_err("%s: No PHB PE is found (PHB Domain=%d)\n",
-				__func__, pdn->phb->global_number);
+				__func__, hose->global_number);
 			edev->pe = NULL;
 			kfree(pe);
 			return -EEXIST;
-- 
2.26.2

