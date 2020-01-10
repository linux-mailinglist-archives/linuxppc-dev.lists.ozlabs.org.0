Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A8A1367E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 08:06:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vDY06Qb8zDq7W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 18:06:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Wf0xTo1G; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vDSd5nh7zDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 18:02:25 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id d5so567532pjz.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2020 23:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d833LbKBMRnCxGEojYyR4If7NkfJgWm6DAuzL3whwIE=;
 b=Wf0xTo1GZdVVoUY1gX8R6PXMIDhUd5+bfWF6am085yx+Wa/w+yQq7wKc479+4Xb4WQ
 W3y+YV03oaZyTdY9T6Au1rvElZSCKESb1NV9+ITYgQcc0AEnMSAR+S8iIsZROLSGwDCU
 uUHoiJ5vStEh4cWsLJLjLG24ARbjaLRdt3v/5q1yKFynKonywC9jj7pAXC+hdCvGwyan
 luKJ2BXHXbKoz8amiUfAixjnSfcv1c68otKNCQieVo50jbyzqrBs5v2G27CTOwnGp2zL
 K2PevWY9q+GiZFhYVnmcVVQ3lRyazLdhTCqyGIJucW+1Ru7PPn+iQPIpzgfj/MnnbdJG
 KEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d833LbKBMRnCxGEojYyR4If7NkfJgWm6DAuzL3whwIE=;
 b=AZg2L+y8lxQSjDEPvIm0hwibK7+a8Jbjsi1vRAVVzwKgxT3PR22JYA/C6vuJqK80x7
 Y91gD3hzStl87BH7BOY2hk0QUCS5V1Yfn+jcMU5q6lU35QesTvBwjHrVpawVpuurhBWh
 IIrko0AtNPTypSDGU+yb8517+BoDCTda7OhoM62bO9pRxg36HYFCG1GZ6rI8lPQgapt+
 awGWvisyX6HNEErfbU36njkp/RkIcP/MSAU4clqx63bhAYF4YGIbRstHawSFzvhyJDeY
 znUsvuBn3iHyjqEP07fx4dhAPSMT8Q6uD0mqswxu6yNXLSrcqcZuYpk33YbltBH3TGyt
 FmBQ==
X-Gm-Message-State: APjAAAUZwLf+iA3gLh8nakKdFDIM7IBb5RH6Vs91vAQLaW5f401HyIgn
 pwr2BJ+dEyGMqnO9aropgoNa/FdDrcU=
X-Google-Smtp-Source: APXvYqyoMR8BrDLrtzWe+bJWN4diJb1JG6NCPd3YvW8RaG9O8jkLqmFYFzPx8IyRgz51CTA3o9Rviw==
X-Received: by 2002:a17:90b:30d7:: with SMTP id
 hi23mr2906817pjb.5.1578639743521; 
 Thu, 09 Jan 2020 23:02:23 -0800 (PST)
Received: from localhost.localdomain (ohallo2.lnk.telstra.net.
 [110.142.13.149])
 by smtp.gmail.com with ESMTPSA id n26sm1309791pgd.46.2020.01.09.23.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 23:02:23 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] powerpc/pci: Fold pcibios_setup_device() into
 pcibios_bus_add_device()
Date: Fri, 10 Jan 2020 18:02:03 +1100
Message-Id: <20200110070207.439-2-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pcibios_bus_add_device() is the only caller of pcibios_setup_device().
Fold them together since there's no real reason to keep them separate.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/pci-common.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index f8a59d7..c6c0341 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -958,7 +958,7 @@ void pcibios_setup_bus_self(struct pci_bus *bus)
 		phb->controller_ops.dma_bus_setup(bus);
 }
 
-static void pcibios_setup_device(struct pci_dev *dev)
+void pcibios_bus_add_device(struct pci_dev *dev)
 {
 	struct pci_controller *phb;
 	/* Fixup NUMA node as it may not be setup yet by the generic
@@ -979,15 +979,9 @@ static void pcibios_setup_device(struct pci_dev *dev)
 	pci_read_irq_line(dev);
 	if (ppc_md.pci_irq_fixup)
 		ppc_md.pci_irq_fixup(dev);
-}
-
-void pcibios_bus_add_device(struct pci_dev *pdev)
-{
-	/* Perform platform-specific device setup */
-	pcibios_setup_device(pdev);
 
 	if (ppc_md.pcibios_bus_add_device)
-		ppc_md.pcibios_bus_add_device(pdev);
+		ppc_md.pcibios_bus_add_device(dev);
 }
 
 int pcibios_add_device(struct pci_dev *dev)
-- 
2.9.5

