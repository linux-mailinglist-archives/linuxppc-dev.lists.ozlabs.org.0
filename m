Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E7C45F98C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 02:24:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1DRl2sFYz3f30
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 12:24:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cmxuu0+S;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cZ5icEO1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=cmxuu0+S; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=cZ5icEO1; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1DK828Mlz30R8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 12:18:52 +1100 (AEDT)
Message-ID: <20211126223824.558746009@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=t8fdQf5v0Re3s6aU2w+RDhHEUcAYg2OEvsShj+q+pN4=;
 b=cmxuu0+S0CsZgYZ32HYbpri2Sd336Qg0Z/c81KGZv/d8VT2cx3pO+wemLvUEb8/rZzqWVq
 0Aee2el4uFtUTEwM4NevFSfRRWXl8VsohVUQkWOKC+PX0UQyocXwd13XzgnMnq75EbEPpc
 0XDH6VZ4F6aY7FGjwQjBxCJ7S/gKrxXo/ft3a22JYLKHH+h+Axgwy8gMgGdardXG7mD8wm
 3V4bu8HbHxltFdFVIZbZpYe1L772kd6xKP36Y2xY0IxJPYxSmaQFkKvdAoQKrvZZSPMg4i
 ILG/RGrZ7qSuIfwivCkd64S54zttW12a2Bqgv90Is3DfVoXms2CX5Xi+tguk7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=t8fdQf5v0Re3s6aU2w+RDhHEUcAYg2OEvsShj+q+pN4=;
 b=cZ5icEO1gkVwPGoTe3vcr7yZhvwpxdLRW5DA8ZhfyEhQ1AqnzzWnOcXhvMTVspkGXfUHDc
 LU+g5W5AGkvQPBCg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 08/22] PCI/sysfs: Use pci_irq_vector()
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:18:47 +0100 (CET)
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
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Megha Dey <megha.dey@intel.com>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

instead of fiddling with msi descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/pci-sysfs.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -62,11 +62,8 @@ static ssize_t irq_show(struct device *d
 	 * For MSI, show the first MSI IRQ; for all other cases including
 	 * MSI-X, show the legacy INTx IRQ.
 	 */
-	if (pdev->msi_enabled) {
-		struct msi_desc *desc = first_pci_msi_entry(pdev);
-
-		return sysfs_emit(buf, "%u\n", desc->irq);
-	}
+	if (pdev->msi_enabled)
+		return sysfs_emit(buf, "%u\n", pci_irq_vector(pdev, 0));
 #endif
 
 	return sysfs_emit(buf, "%u\n", pdev->irq);

