Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5181245FB66
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 02:43:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1DsC2FWvz3gdY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 12:43:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=nLVAIHxU;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1oZXQ7KM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=nLVAIHxU; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=1oZXQ7KM; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1DLB19Nyz3cSf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 12:19:46 +1100 (AEDT)
Message-ID: <20211126223824.914161382@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637975983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=HvFnLhSNQWkY7FyV6dqkmiDpk27hPnt+iT7sMKioVYY=;
 b=nLVAIHxU7zzvZDcgNYXA194SYdMrO6dCVMw9y6HDD/le7JD9C2QCF1wk/oqJx43iUEDnY1
 pgFSlnrN/ssoMHCXM1uIFRYGaPp1xqbZEnupYzQc1IY8qVYeNbHLiAjPWJl+M4yhP2RdYQ
 cCvlNNeLa1fK+j1OQO1an1R2IQT5f2TQuSGwBcLKRc/fbex/njb0MW28/CMYhqJTqy9tUY
 CVHodIwjaxn70G+E6gtde2Lz44MuDnM9t8twCu61Q+gLHHsjI5TqsEgLxYzGmGm3HlcIN3
 BEj3sWmPgxXgXz1yJGmpdxUJULqvf5Szc7KHc+NFChP1uqJQYAlM8cHG8IC6NA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637975983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=HvFnLhSNQWkY7FyV6dqkmiDpk27hPnt+iT7sMKioVYY=;
 b=1oZXQ7KMDPa4UCKNRSuXOGmdL7VQAHRxAH7SeUCdr1ZzVhtYvvJdA6oJ2iJPmpT4hzHWhx
 P5LB3i92rxk9FGCg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 14/22] PCI/MSI: Make msix_update_entries() smarter
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:19:42 +0100 (CET)
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

No need to walk the descriptors and check for each one whether the entries
pointer function argument is NULL. Do it once.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -642,8 +642,8 @@ static void msix_update_entries(struct p
 {
 	struct msi_desc *entry;
 
-	for_each_pci_msi_entry(entry, dev) {
-		if (entries) {
+	if (entries) {
+		for_each_pci_msi_entry(entry, dev) {
 			entries->vector = entry->irq;
 			entries++;
 		}

