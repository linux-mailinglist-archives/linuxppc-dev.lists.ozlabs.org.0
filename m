Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE4A10318D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:29:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmqT2BTzzDqpC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:29:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NShj/gab"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlW60Q9WzDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:25 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id b1so2985846pgq.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqQ6+eH81I+/Bbm2/FvJnokTqKFKJb0bi7VMguIvx8A=;
 b=NShj/gabARtFCE2G0VD/DwHd5/ofSZ58b1q3y2uV+Es8LLGCWZJewGHNNv+s9ogf5j
 876dhkp9Dqcjmq8bvj7LED9hga1cehmubQjI/12xCO0QD2p32m7/RYtedc3SqurF57zK
 5mL59MxSibTMWAve9kUretD2ZH3L3iIF2m83zVLIUuo2ATeEOTJxCIKOyU65HPL6yOyq
 L4qkHowjGbBL0+e7cNe7diug20Xj2umAUpI7dPi+LVWJzySa4uQknbKixLztA96678Ln
 +4Gw/Ig/rLl3WaK1vgWqtWQiwUXu9ovvkl8c+TDvkDOQ4zW7PQie3zqE2er8dUoV+TRX
 0svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqQ6+eH81I+/Bbm2/FvJnokTqKFKJb0bi7VMguIvx8A=;
 b=Y0GfUzRgbJ3sAtdQKFZ/vLzGsv4HVrk5vVKQlcd3CdvvublHtLd4t7JSr/LX46ilym
 rYjH+ovEu9q97g6FmEwfrdbFsV6GSvbQbudRxv5jZRSQSGPb0GPUMxSxRNCPpqwFJuSt
 viZsfdvcG53S7zzDPrsoxr7w6NgtLEXQo/e360/7rA77zpwZAJm0EirUVFoNs0R/57kH
 yM9k7k5FFn6Z1qEbvXk8Ks4STbk4Oc9C8+WhGWFhfCxr0wqMemsQb7dhrNKUCQy9Pq/K
 LiWtyIH941reVndjo/oBU35QqINEGznPtjFc8h+X2il8EkleSFpu8fJqShupF9EwfQus
 oXNg==
X-Gm-Message-State: APjAAAVKpI+mvLM418QzYD/AXQkjXvDxjE52Y2C35ZiOAbN3Z8LAo+0K
 BzBgeEZzSBLXEElWK0djIIbTijLL
X-Google-Smtp-Source: APXvYqxehicwp/u49e1gTI70FpHJ0O9xwdSLC9uqdaln3131DM+h9UI9FqYw6clrAFllEIZYyoPM9A==
X-Received: by 2002:a63:1464:: with SMTP id 36mr138564pgu.445.1574213423214;
 Tue, 19 Nov 2019 17:30:23 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:22 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 30/46] powernv/pci: Remove open-coded PE lookup in PELT-V
 teardown
Date: Wed, 20 Nov 2019 12:28:43 +1100
Message-Id: <20191120012859.23300-31-oohall@gmail.com>
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
 arch/powerpc/platforms/powernv/pci-ioda.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 5bd7c1b058da..d4b5ee926222 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -853,11 +853,13 @@ static int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe)
 
 	/* Release from all parents PELT-V */
 	while (parent) {
-		struct pci_dn *pdn = pci_get_pdn(parent);
-		if (pdn && pdn->pe_number != IODA_INVALID_PE) {
-			rc = opal_pci_set_peltv(phb->opal_id, pdn->pe_number,
-						pe->pe_number, OPAL_REMOVE_PE_FROM_DOMAIN);
-			/* XXX What to do in case of error ? */
+		struct pnv_ioda_pe *parent_pe = pnv_ioda_get_pe(parent);
+
+		if (parent_pe) {
+			rc = opal_pci_set_peltv(phb->opal_id,
+						parent_pe->pe_number,
+						pe->pe_number,
+						OPAL_REMOVE_PE_FROM_DOMAIN);
 		}
 		parent = parent->bus->self;
 	}
-- 
2.21.0

