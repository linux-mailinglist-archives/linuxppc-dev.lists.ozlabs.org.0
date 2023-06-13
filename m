Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD172D8D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:54:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dZj9YXv6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgGSW5NGzz3bX2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 14:54:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dZj9YXv6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgGPl2mn2z300y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 14:52:27 +1000 (AEST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1a3897d9697so3892515fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 21:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686631943; x=1689223943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClJw9/1zbnChLX5rcqdFJDJ5R/5L3OV709VWwvngGsk=;
        b=dZj9YXv6puSefwqQ7Jw4pmW3nLqLL9TIhghM+2ObprTE+n8WoRy0A1WsTbMW8+R9kW
         AkGNk1K8e57wv+fMTzYJpTLQNdJBhErdrUoT9cSUd7ao3FbnMY6WFxb8+MtHzBkk/2sN
         9babyomFVg54XTHwgpvD//axDfuR7GwZLC0beWnEC2qQSi+NTdZVdBLeHY989GRHEHeV
         BTl4WJbtSiasOIACWM9ZLqDZV6PfWc5Gx9G0O4/r8TTyhfONGdQfVjq00Bz24w2WrooD
         08aqVyCBdHnsHNzUFVB+vnGK2/mykwvCtMi6pvGrACpE/SbinHtLAVl3Ie0aIi15LJMa
         PGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686631943; x=1689223943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ClJw9/1zbnChLX5rcqdFJDJ5R/5L3OV709VWwvngGsk=;
        b=DjxTbnlhRW9hkadTvhUO5PZ4Y7TwyeNSnC1qRJkUFlwYgg6XcprbguKpNgzgt4hi0Y
         Kcl2RQmAnrIy0PdqPUArGaVmRMx5GFbiIMYcef09vzkIXO7EdfgZAVNwxdlZ79DLvoyS
         x7lnXQJv6Hk7P9pLHkKQdmrU/9OWIij14uP8WDj0ynBQF6Jv+Fvt44r7q1n3KBp5VGH6
         vrvc6Y6g9jKv29nKv52vsUH0eQCisI/9zFnGKQ5T0QPe739ao1Thy9mL28ojUkhpVE+3
         e52eXTK75W/YQrlOAIg9uX12EU1Bgbj7L0klVYtVqWaCcfipeYVRGr4qx4G+MO/26/nj
         /GaQ==
X-Gm-Message-State: AC+VfDwenqLhrAemYDP+sPpyT55emxZfkXE0P9OQZj3Q6/hYjs84pAIc
	97+B/xhTidsr6WZmrWR/ET0PZ7l1tFY=
X-Google-Smtp-Source: ACHHUZ4gaiZzfv1ThCKcuTghoCj45l0sSiWy2aHvhoP0PWOYcVouQajOW+9ZGZgtM/mkQLCIl6e2uw==
X-Received: by 2002:a05:6808:211b:b0:399:de83:96f2 with SMTP id r27-20020a056808211b00b00399de8396f2mr7169403oiw.8.1686631942821;
        Mon, 12 Jun 2023 21:52:22 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id p10-20020a62ab0a000000b00625d84a0194sm7700916pff.107.2023.06.12.21.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 21:52:22 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/3] powerpc/pci: Remove MVE code
Date: Tue, 13 Jun 2023 14:22:01 +0930
Message-Id: <20230613045202.294451-3-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613045202.294451-1-joel@jms.id.au>
References: <20230613045202.294451-1-joel@jms.id.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With IODA1 support gone the OPAL calls to set MVE are dead code. Remove
them.

TODO: Do we have rules for removing unused OPAL APIs? Should we leave it
in opal.h? opal-call.c?

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/include/asm/opal.h            |  3 ---
 arch/powerpc/platforms/powernv/opal-call.c |  2 --
 arch/powerpc/platforms/powernv/pci-ioda.c  | 23 +---------------------
 3 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 726125a534de..a9b31cc258fc 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -112,9 +112,6 @@ int64_t opal_pci_set_pe(uint64_t phb_id, uint64_t pe_number, uint64_t bus_dev_fu
 			uint8_t pe_action);
 int64_t opal_pci_set_peltv(uint64_t phb_id, uint32_t parent_pe, uint32_t child_pe,
 			   uint8_t state);
-int64_t opal_pci_set_mve(uint64_t phb_id, uint32_t mve_number, uint32_t pe_number);
-int64_t opal_pci_set_mve_enable(uint64_t phb_id, uint32_t mve_number,
-				uint32_t state);
 int64_t opal_pci_get_xive_reissue(uint64_t phb_id, uint32_t xive_number,
 				  uint8_t *p_bit, uint8_t *q_bit);
 int64_t opal_pci_set_xive_reissue(uint64_t phb_id, uint32_t xive_number,
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index f812c74c61e5..021b0ec29e24 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -167,8 +167,6 @@ OPAL_CALL(opal_pci_map_pe_mmio_window,		OPAL_PCI_MAP_PE_MMIO_WINDOW);
 OPAL_CALL(opal_pci_set_phb_table_memory,	OPAL_PCI_SET_PHB_TABLE_MEMORY);
 OPAL_CALL(opal_pci_set_pe,			OPAL_PCI_SET_PE);
 OPAL_CALL(opal_pci_set_peltv,			OPAL_PCI_SET_PELTV);
-OPAL_CALL(opal_pci_set_mve,			OPAL_PCI_SET_MVE);
-OPAL_CALL(opal_pci_set_mve_enable,		OPAL_PCI_SET_MVE_ENABLE);
 OPAL_CALL(opal_pci_get_xive_reissue,		OPAL_PCI_GET_XIVE_REISSUE);
 OPAL_CALL(opal_pci_set_xive_reissue,		OPAL_PCI_SET_XIVE_REISSUE);
 OPAL_CALL(opal_pci_set_xive_pe,			OPAL_PCI_SET_XIVE_PE);
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 2c4e842c2749..c2af5a55a434 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -865,29 +865,8 @@ int pnv_ioda_configure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 	for (rid = pe->rid; rid < rid_end; rid++)
 		phb->ioda.pe_rmap[rid] = pe->pe_number;
 
-	/* Setup one MVTs on IODA1 */
-	if (phb->type != PNV_PHB_IODA1) {
-		pe->mve_number = 0;
-		goto out;
-	}
+	pe->mve_number = 0;
 
-	pe->mve_number = pe->pe_number;
-	rc = opal_pci_set_mve(phb->opal_id, pe->mve_number, pe->pe_number);
-	if (rc != OPAL_SUCCESS) {
-		pe_err(pe, "OPAL error %ld setting up MVE %x\n",
-		       rc, pe->mve_number);
-		pe->mve_number = -1;
-	} else {
-		rc = opal_pci_set_mve_enable(phb->opal_id,
-					     pe->mve_number, OPAL_ENABLE_MVE);
-		if (rc) {
-			pe_err(pe, "OPAL error %ld enabling MVE %x\n",
-			       rc, pe->mve_number);
-			pe->mve_number = -1;
-		}
-	}
-
-out:
 	return 0;
 }
 
-- 
2.39.2

