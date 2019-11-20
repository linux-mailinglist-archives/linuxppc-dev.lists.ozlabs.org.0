Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 766FB103153
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:57:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hm6b3nB6zDqGM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 12:57:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lMgA3Ju/"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVN0g69zDqgs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:48 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id j12so12972282plt.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfPmQCeEzkzW040YZQCrhhQllpNuJOIyP7QbkBppQAU=;
 b=lMgA3Ju/BizZSJxe9Svj4tDte75HSTEvLRFnBEUKFhujn3iMT6Sch0Ms5D+/7AUsl+
 8AhzHEFa4LDR74lS5ZnM/ATvWBJEW9WwH8uA0YORedKtuS5+ErxJ+4PH5hPHqrhfTUtN
 R8o34gypm6rgi2F/rclpNiQQjASifH796KcG9ZKRKsMH5ajXRZfTIKgt59NJ/HDYvU9F
 T+1Pq02QM0CJVs7dt7o8PCoHWaFUwE0P3XL7F0zEBV9elE/3mRF+WDcXbTk75lDbwkuv
 d9LeMqQePzAwwmbPEfgdthODfnY/7Y2USJWKDsRVkqt7kSQkhLCnBtaUgfrMcm94NNad
 MT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfPmQCeEzkzW040YZQCrhhQllpNuJOIyP7QbkBppQAU=;
 b=mrvqc+Bq/4UjLsHXDhCgApmNSFrMTCWuygO5u2YBS4n5qHYv2UJZ0861Tfn3T7LE6d
 6V+j1WsE7IEuqcHlLW3GC/b4CfWV+4pZjSw35soe7yifk7pwQ1gT/skE3UQJV81jCIjk
 AqFBLTVS4HWAhruMCfz9cMruGoG7gv9JGl2/SIjfKSfpZqSOaVLOJP72NRaEbI04pLJd
 ZvvFcQxDXJtqJSeof1SPXgc7kIziSQFqgH/r49uX2AgxOUhjckZU2/+OIp5TYxQh+qPM
 3212KmIF7QoyNgZRMcLLdAkAcm9075xbKqIdpbyEewyLAwVDr3j/5i5qVgetzwM5vXLd
 ThOQ==
X-Gm-Message-State: APjAAAXbflvm5+Y9NaMZ5VeyTyH542lk/8ks2MZaYZX/rw+MecVkpcpC
 4WHGuPpb2RthbEgTZb/jRXJBEs3k
X-Google-Smtp-Source: APXvYqz+2Zn4p+8r4qSR0BkdgXfrKYGPixLgEEzUtDNDVBt3hxwwtFF8iulkytkMzBHgBkW1ctADhQ==
X-Received: by 2002:a17:90a:2942:: with SMTP id
 x2mr643260pjf.119.1574213385684; 
 Tue, 19 Nov 2019 17:29:45 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:45 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 14/46] powernv/eeh: Remove un-necessary call to
 eeh_add_device_early()
Date: Wed, 20 Nov 2019 12:28:27 +1100
Message-Id: <20191120012859.23300-15-oohall@gmail.com>
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

eeh_add_device_early() is used to initialise the EEH state for a PCI device
based on the contents of it's devicetree node. It doesn't do anything
unless EEH_FLAG_PROBE_MODE_DEVTREE is set and that only happens on pseries.

Remove the call to eeh_add_device_early() in the powernv code to squash
another pci_dn usage.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 5250c4525544..aa2935a08464 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -40,13 +40,10 @@ static int eeh_event_irq = -EINVAL;
 
 void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
 {
-	struct pci_dn *pdn = pci_get_pdn(pdev);
-
-	if (!pdn || eeh_has_flag(EEH_FORCE_DISABLED))
+	if (eeh_has_flag(EEH_FORCE_DISABLED))
 		return;
 
 	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
-	eeh_add_device_early(pdn);
 	eeh_add_device_late(pdev);
 }
 
-- 
2.21.0

