Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D271367EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 08:08:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vDbK5CBXzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 18:08:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qEYy5xY7; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vDSh1sBTzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 18:02:27 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 2so654544pfg.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2020 23:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fpHLffcqEpzxW5/gpFck8ndmmjCnugGBmWJx3kdHLmE=;
 b=qEYy5xY7ZdocDNfTZsCr538yFAeB7ngWcQ+a5PdlD5SZAg6gvAuQRxlUn+EDbwZTks
 MQWo2awKCmzqDZZJ1Ex2fIBEQt2bo1LGHMnQtp+cf1GJ+xYFnuOGFE4veyYCs1zmsBYh
 2pGMEWHKU5alB5W8SuHLLYKA1PG292S/MJDcSft4HT7AG9UXiNBSdUXIN9AXBFzSA9Ym
 Q8EYxOcM+xxfITAnrAXaCiJ3SMakHu/PMzqCmYwpSfxWQTnbdh3RL7WKlF4ppB/DtRJZ
 c5IuTjYD/J1EffFMH5dYArNEh85J8WoSDuM2N8CRrVjgbTihRz4aSDNXrRpWscLsxVoF
 RiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fpHLffcqEpzxW5/gpFck8ndmmjCnugGBmWJx3kdHLmE=;
 b=gC0FEP4zTkvXYadrpGCVWd+8aS15k21SFA3kvOZBIujwO0KTTNKgiIcIZk1v4mlJim
 J8sOlanIaOoeKJVBa87EcDwTbVqi9n7WDZ/fDx63LZamugAOzMq0pQmIYXrTBtseXsVN
 orY9JpAwauUlKrPM9JxXWRaUpybJ0OzryKghk6iXg01r4VH2Kazh8rhUdwrMiMN+/z9a
 S6vJB9Xay6eAFsbfltlL3DTjoZx2frH9efCoijIn23oFOae7FOdLogDb/XCini4ZtIkx
 2AXmMT/oM4syQhCYEll5EWUudTz6tkdj+kDROYoG019fXFB64psckEYRR5/fSFAECany
 6rbw==
X-Gm-Message-State: APjAAAUpW1vLs0jgNwp6zHoSe0RP3esCbQPwKxM3Vj+337Kjz4d+seiL
 fDXOhje/ngndINkDv0eiV5wu+8smYEk=
X-Google-Smtp-Source: APXvYqyv1GstPh9j5iwuJAnrrXfWTLZKjPgz7rvEOOPNizOkiuXf2HAu1evgt2GFD0/lDRfC0jWO4g==
X-Received: by 2002:a62:7683:: with SMTP id r125mr2410168pfc.132.1578639745751; 
 Thu, 09 Jan 2020 23:02:25 -0800 (PST)
Received: from localhost.localdomain (ohallo2.lnk.telstra.net.
 [110.142.13.149])
 by smtp.gmail.com with ESMTPSA id n26sm1309791pgd.46.2020.01.09.23.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 23:02:25 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] powernv/pci: Remove dma_dev_setup() for NPU PHBs
Date: Fri, 10 Jan 2020 18:02:04 +1100
Message-Id: <20200110070207.439-3-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200110070207.439-1-oohall@gmail.com>
References: <20200110070207.439-1-oohall@gmail.com>
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

The pnv_pci_dma_dev_setup() only does something when:

1) There PHB contains VFs, or
2) The PHB defines a dma_dev_setup() callback in the pnv_phb structure.

Neither is true for NPU PHBs so there's no reason to set the callback.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 4374836..33d4039 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3620,7 +3620,6 @@ static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 };
 
 static const struct pci_controller_ops pnv_npu_ioda_controller_ops = {
-	.dma_dev_setup		= pnv_pci_dma_dev_setup,
 	.setup_msi_irqs		= pnv_setup_msi_irqs,
 	.teardown_msi_irqs	= pnv_teardown_msi_irqs,
 	.enable_device_hook	= pnv_pci_enable_device_hook,
-- 
2.9.5

