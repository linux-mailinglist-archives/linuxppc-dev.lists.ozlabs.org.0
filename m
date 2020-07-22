Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 330CD228F3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:36:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBN2h45N8zDqfj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:36:28 +1000 (AEST)
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
 header.s=20161025 header.b=l9yXyWpk; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMqf1RYBzDqlf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:26:53 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id m16so332373pls.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 21:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=byHMiAlzO7u4iKQG/BMXOT3F6rzn48bCFSKg6YQSrYk=;
 b=l9yXyWpk5QYdr+3oUdY88RHOgBg+dbsy3so29Xl5OxAn7Vuez3ABQV7Xks9U1DV5a1
 Nf1hLm8G15gyH/GlGWud/0eSzj3bcbCRHuN90Zna1qOmpEkxbj1BMk2/VT6S5qcjcDC3
 S35pYYm9pxSrG5e8yq/3UligWx1NjmkzhEz4wCxVf7mJWORMqwxYPpKAsLDe5WqxcE3V
 MuGc3OtW1gat5aOCffuVztGBeRc3cf3eQlGRNAz7J5Zzi8ln9dNzGaaiqwAyds6V2Gsc
 IVdtD0nNl+/QAOqf5925GZe5bWhPiYOl+zPQplcCNnhpvECX+S17kDQrB6JMNdZSZgOD
 pbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=byHMiAlzO7u4iKQG/BMXOT3F6rzn48bCFSKg6YQSrYk=;
 b=AVNa5G/twYKnas1+SSk+KLyUood4PbRjY1jogvmX4kfvp3TtpoNjBpzUso9zmRxb2w
 Lq3WnRISiZX1P4f47zMtJ9b1nyKhlTzEda3sZFNev9/t6sT/iLXWUKSP5atA45WS1xDH
 IxSqukWXYqfffKuABQjeX3cmp10cWGieBQAMLVdodBdYRD3bg8u7x/lNOQSbdbErFgi1
 uZ+Bl87f09LmoS1IiWT8xjsWK1FxKliFa6tZQtr0Wd54e+dzLymO4B+mKHIFr4I+BzbZ
 4Cb1GNmMfsmTNSQZO7iTZRS/tzHyBvwSVPMWXh80SMhI65aUo82Of/gl1Jmj7g6D7aHs
 IY3g==
X-Gm-Message-State: AOAM531MPIWMQkWAjRx2wXqzQ58VgLRQl32Z5nOz3rD/IqggL23/iEjd
 DL3CvqUlUw0WiAxeVNjqWQPcrGC7fVM=
X-Google-Smtp-Source: ABdhPJy9WcwNEOva0DWa184FpWVeNYQXljEF+xywc8NDB40mts3Qe08ugqaIFo53Xuka8m5PHxqVHA==
X-Received: by 2002:a17:90b:916:: with SMTP id
 bo22mr8190598pjb.100.1595392009943; 
 Tue, 21 Jul 2020 21:26:49 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id d4sm20583709pgf.9.2020.07.21.21.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 21:26:49 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/14] powerpc/pseries: Stop using pdn->pe_number
Date: Wed, 22 Jul 2020 14:26:18 +1000
Message-Id: <20200722042628.1425880-4-oohall@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pci_dn->pe_number field is mainly used to track the IODA PE number of a
device on PowerNV. At some point it grew a user in the pseries SR-IOV
support which muddies the waters a bit, so remove it.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: no change
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index ace117f99d94..18a2522b9b5e 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -52,8 +52,6 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
 #ifdef CONFIG_PCI_IOV
 	if (pdev->is_virtfn) {
-		struct pci_dn *physfn_pdn;
-
 		pdn->device_id  =  pdev->device;
 		pdn->vendor_id  =  pdev->vendor;
 		pdn->class_code =  pdev->class;
@@ -63,8 +61,6 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 		 * completion from platform.
 		 */
 		pdn->last_allow_rc =  0;
-		physfn_pdn      =  pci_get_pdn(pdev->physfn);
-		pdn->pe_number  =  physfn_pdn->pe_num_map[pdn->vf_index];
 	}
 #endif
 	pseries_eeh_init_edev(pdn);
@@ -772,8 +768,8 @@ int pseries_send_allow_unfreeze(struct pci_dn *pdn,
 
 static int pseries_call_allow_unfreeze(struct eeh_dev *edev)
 {
+	int cur_vfs = 0, rc = 0, vf_index, bus, devfn, vf_pe_num;
 	struct pci_dn *pdn, *tmp, *parent, *physfn_pdn;
-	int cur_vfs = 0, rc = 0, vf_index, bus, devfn;
 	u16 *vf_pe_array;
 
 	vf_pe_array = kzalloc(RTAS_DATA_BUF_SIZE, GFP_KERNEL);
@@ -806,8 +802,10 @@ static int pseries_call_allow_unfreeze(struct eeh_dev *edev)
 			}
 		} else {
 			pdn = pci_get_pdn(edev->pdev);
-			vf_pe_array[0] = cpu_to_be16(pdn->pe_number);
 			physfn_pdn = pci_get_pdn(edev->physfn);
+
+			vf_pe_num = physfn_pdn->pe_num_map[edev->vf_index];
+			vf_pe_array[0] = cpu_to_be16(vf_pe_num);
 			rc = pseries_send_allow_unfreeze(physfn_pdn,
 							 vf_pe_array, 1);
 			pdn->last_allow_rc = rc;
-- 
2.26.2

