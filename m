Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 506901031C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:47:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HnDM1yH6zDqFM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:47:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cuuM6JiG"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlWV6s35zDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:46 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id 207so5114785pge.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ZmxxZuhux+fhtBuc/XdE4rABk5WcmVDI+laYAbcCQ4=;
 b=cuuM6JiGOc03w+IAJ6x3S1A4OYqMJzE5cHIcw+jla0ZT38cKbh8p0iXxEXiJopgYyV
 VogFMvJvsQPyqeoYyQS58tA7Q4dRHi/61szslyvwGsFKPyPjqgwqXGk/7aHJzrb6T8JU
 OmEp1+Q2hu53NiTleFz7dc6VEcM98cUDQuSiaV7SAMyrDnZzL9ZuxWjeeb+N8v4YZOCc
 Dy4rZ3KMJ01vLvSXVICbDCJi8dtvoJOgqemvZfthEB5IyNzh67QlffInwhk20QwzGwOC
 ZBtnvo1hU16blJcN0FrSE/ZxmbGOyE80Hzz4P9I0EYmV2FYEC0R/mc4l1dvLhiICJcBt
 /Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ZmxxZuhux+fhtBuc/XdE4rABk5WcmVDI+laYAbcCQ4=;
 b=YNjO+EiwcjdUdfLY5DUxw+yVSMbPgg8zfulciEDs30L9gm/0ZqRjBJWS3xcyaNXcjI
 NI7zx/sz3jxW0hVo9mQR0yLO4P2BGmihA91CZf9mXAtA2mI2XDaVlzvq7MrKDQ+MRxor
 HYmfdkqNB1ySbGESycSa61A+tpaNh9g3Ix0+uU7np/N7VFhvI1/d6S4ybs01hmB2OeEG
 XTkxa6IEa909Tw+wWia4o3PhLcM+9FwLnlZ7KeLtnxHdR2CLIk6Uv+jt++rX5k/GgpWW
 ooHUsjJDOYLD2aIj7Su0XVbeXYYkf3x7TTzsKdp7fXpnpUNcJT87+MFeJJhKV+cF7tC1
 Ui4g==
X-Gm-Message-State: APjAAAVFQiJCmLAr/Ab/YIit6CWSDSgt93ZqUPwos+tuFVB0kaFz32Sc
 RdecKM56vqqGYkBoZeFdESq/Qtvd
X-Google-Smtp-Source: APXvYqzkD74BKlm80E3yjXZMF5vlcQYpj76F+H9aCAm4UavFX0AL9PWMevdkwZmH90i8ND+Fxf2AMQ==
X-Received: by 2002:a62:7847:: with SMTP id t68mr794552pfc.140.1574213444909; 
 Tue, 19 Nov 2019 17:30:44 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:44 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 39/46] powernv/npu: Avoid pci_dn when mapping device_node
 to a pci_dev
Date: Wed, 20 Nov 2019 12:28:52 +1100
Message-Id: <20191120012859.23300-40-oohall@gmail.com>
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

There's no need to use the pci_dn to find a device_node from a pci_dev.
Just search for the node pointed to by the pci_dev's of_node pointer.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/npu-dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index 68bfaef44862..72d3749da02c 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -21,11 +21,11 @@
 
 static struct pci_dev *get_pci_dev(struct device_node *dn)
 {
-	struct pci_dn *pdn = PCI_DN(dn);
-	struct pci_dev *pdev;
+	struct pci_dev *pdev = NULL;
 
-	pdev = pci_get_domain_bus_and_slot(pci_domain_nr(pdn->phb->bus),
-					   pdn->busno, pdn->devfn);
+	for_each_pci_dev(pdev)
+		if (pdev->dev.of_node == dn)
+			break;
 
 	/*
 	 * pci_get_domain_bus_and_slot() increased the reference count of
-- 
2.21.0

