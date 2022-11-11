Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFE2625D1A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:33:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N81R662kcz3fBT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:33:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pZhlEC8H;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XzyeTFE4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pZhlEC8H;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XzyeTFE4;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80pN5KVJz3fL8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:05:16 +1100 (AEDT)
Message-ID: <20221111122015.691357406@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=ZT2wqZQe1H/I6Zbp9NC+LKW2/0gzRDmAQRTFrKQsKJ4=;
	b=pZhlEC8HQoltxfUbzgMXHkDfB0GRlxnLvSjN1dc3PiVBo8WSLYIF9ktMwc0XjNYb4kLS8+
	FqTCjJWZeq1j8WqGwul0V0shm019qcC15aTTmWrBmibPa4iyBaHln17GO+B7a+FZ7HzxkG
	0nigWZfumb9aUEbIyEZcIeoXLpiQyjkTbnipeH21yJ5xwmTxonq864TxZUl+LihVftel2x
	Ph1PWWqEcs7OLda5Ee6GdGF+KAXyt4i9XvX9Y9f9J76I48MVaA77REkSGiMVd5hEo8Wn9s
	7pMPZ0LZKwuqpeWH/NkpM1YFXBbaazZjlZyRkesNTxkBHo+2AUSp+C++9BSUwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=ZT2wqZQe1H/I6Zbp9NC+LKW2/0gzRDmAQRTFrKQsKJ4=;
	b=XzyeTFE4zXDDmgsFpNdLl62MN8+2pdKYw4Ip6qUuQqqfIw4P9A9EW8A7NpauZTzTWtO0LS
	F5TDeOWU93205LDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 36/39] PCI/MSI: Validate MSIX contiguous restriction early
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:55:12 +0100 (CET)
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With interrupt domains the sanity check for MSI-X vector validation can be
done _before_ any allocation happens. The sanity check only applies to the
allocation functions which have an 'entries' array argument. The entries
array is filled by the caller with the requested MSI-X indicies. Some drivers
have gaps in the index space which is not supported on all architectures.

The PCI/MSI irqdomain has a 'feature' bit to enforce this validation late
during the allocation phase.

Just do it right away before doing any other work along with the other
sanity checks on that array.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/msi.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -725,13 +725,17 @@ static int msix_capability_init(struct p
 	return ret;
 }
 
-static bool pci_msix_validate_entries(struct msix_entry *entries, int nvec, int hwsize)
+static bool pci_msix_validate_entries(struct pci_dev *dev, struct msix_entry *entries,
+				      int nvec, int hwsize)
 {
+	bool nogap;
 	int i, j;
 
 	if (!entries)
 		return true;
 
+	nogap = pci_msi_domain_supports(dev, MSI_FLAG_MSIX_CONTIGUOUS, DENY_LEGACY);
+
 	for (i = 0; i < nvec; i++) {
 		/* Entry within hardware limit? */
 		if (entries[i].entry >= hwsize)
@@ -742,6 +746,9 @@ static bool pci_msix_validate_entries(st
 			if (entries[i].entry == entries[j].entry)
 				return false;
 		}
+		/* Check for unsupported gaps */
+		if (nogap && entries[i].entry != i)
+			return false;
 	}
 	return true;
 }
@@ -773,7 +780,7 @@ int __pci_enable_msix_range(struct pci_d
 	if (hwsize < 0)
 		return hwsize;
 
-	if (!pci_msix_validate_entries(entries, nvec, hwsize))
+	if (!pci_msix_validate_entries(dev, entries, nvec, hwsize))
 		return -EINVAL;
 
 	/* PCI_IRQ_VIRTUAL is a horrible hack! */

