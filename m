Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13A1031CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:54:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HnMz6vj4zDqq7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:54:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sAbP3G/N"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlWf2bHHzDqg3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:54 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id r4so13340576pfl.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lkMYjP0Ca6/xR4Bbh9Xq6AEs7SF2d64+wjimXkJnMl4=;
 b=sAbP3G/NCujOe25qPAz0TLBAyuvOFDwXmh3PBbSL7pPBeOR8UwHqrqCef9gloMbsiz
 3aUsw7VSZ1tpRiIrZaaDuuUmBhT2NTu+aMBiEMnepSJ5OKRUtRWbmVaOpgjfbxGpFeTz
 LdEu/B8wM171bAeicaEROuWCdugdN5pD4w762hth9msEkXjNh4KnVfRYGiidpmHbSTi6
 ZToafsAq8WHVrHFVCXMZ62TU9C1pnTnS1wcnBL39xWRYYJ5L+htyb4AK2aRvc34MBvYc
 6PxjUzVdoIx/rifN4gneJEr4ipwmcgxTlhyyyTr2bilH+UqQxsYnsKWUVDVhuTB5fWrT
 uiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lkMYjP0Ca6/xR4Bbh9Xq6AEs7SF2d64+wjimXkJnMl4=;
 b=NPORChFrjAx3JWpMcUMyUXvompP8FA03RyEfW4iSxTJgYjY1vzCtewt7kyoGvUzaHj
 jgq4WGnFu39AiUVbrKbEKCHUcmNbTiS3+s5W6BbMyd92vdT1Hr3ICJa4N0P4WY+agR0Q
 xOukKZUcKKBKXX3soIPrxIoZdv4uu1FO4BxLxZbofuyROLcv+9WaEhGVOyygjKlx9Bfl
 Zu76Z+EbDw7bZVCVeASVsQ43oiOTBVoErBjzOMU6U2NuVq60B8VevdML8mse6rIMJT2d
 Qd+qgDl6rWgkg/L8xWB5woHxSyVjti15HDRjjJHlv25Eq+PFAvDpJK3e8ywi+CjZZKis
 Lf/w==
X-Gm-Message-State: APjAAAVhIo94UDTG+rvR6roAKnlJiJEl25f3QNrSGZp9sQR2N2h9i2lW
 jTX8yQSjuYJcMMvdbrrInZuhBvgS
X-Google-Smtp-Source: APXvYqx5/AtcmTY5C8M9jT5uJ7mK1yXeMaelBUBc3w8nhjeztmobzn8ToW4wse1l1xeyUIKY/IPU1A==
X-Received: by 2002:a62:1c08:: with SMTP id c8mr781945pfc.212.1574213451588;
 Tue, 19 Nov 2019 17:30:51 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:51 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 42/46] powernv/pci: Don't clear pdn->pe_number in
 pnv_pci_release_device
Date: Wed, 20 Nov 2019 12:28:55 +1100
Message-Id: <20191120012859.23300-43-oohall@gmail.com>
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

Nothing looks at it anymore.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index d3e375d71cdc..45d940730c30 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3541,9 +3541,7 @@ static void pnv_ioda_release_pe(struct pnv_ioda_pe *pe)
 
 static void pnv_pci_release_device(struct pci_dev *pdev)
 {
-	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
 	struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
-	struct pci_dn *pdn = pci_get_pdn(pdev);
 
 	/* The VF PE state is torn down when sriov_disable() is called */
 	if (pdev->is_virtfn)
@@ -3560,16 +3558,6 @@ static void pnv_pci_release_device(struct pci_dev *pdev)
 	if (pdev->is_physfn)
 		kfree(pdev->dev.archdata.iov_data);
 
-	/*
-	 * PCI hotplug can happen as part of EEH error recovery. The @pdn
-	 * isn't removed and added afterwards in this scenario. We should
-	 * set the PE number in @pdn to an invalid one. Otherwise, the PE's
-	 * device count is decreased on removing devices while failing to
-	 * be increased on adding devices. It leads to unbalanced PE's device
-	 * count and eventually make normal PCI hotplug path broken.
-	 */
-	pdn->pe_number = IODA_INVALID_PE;
-
 	WARN_ON(--pe->device_count < 0);
 	if (pe->device_count == 0)
 		pnv_ioda_release_pe(pe);
-- 
2.21.0

