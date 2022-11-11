Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B28625C74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 15:07:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N80s72TYHz3dwd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 01:07:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=s/U6Zaar;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dp0qPLUF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=s/U6Zaar;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dp0qPLUF;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N80hJ6w9Zz3cMM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Nov 2022 01:00:00 +1100 (AEDT)
Message-ID: <20221111122013.653556720@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668174856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=coIIhyuiXnYLFo01pBIKB6JYTvWHpv/omCaoVJDpJVg=;
	b=s/U6Zaar7ls0H2qsLwsr8aiLFHuaVuhBicdGJQADmCq0O1hvJG7u/w86lF2pDffDWPTkcK
	gh8pG+58CQS0JvliEiWZUIO1OP4VoMfKp7GIDpkbtmTydLSos0uJJgDnN/82RrN+m008Kt
	pcwRsAEtTCkDN13TliZ7P5bqc8kQ5lCR1U2UuWXy9DlSHjPbnsBlUUYlCt04j2jwTsqa3m
	9GphyvrVWAYxNrMF8zid+S1JgBioKKpAd0OFleA65Swb5lIVMH3c8mMR4C+u/t0s9BUSSG
	xoJAFwa/EQettO0NoV+mbrN0EtHCiVpqcGAhEt6tg8oZ6PY6ayrjDrl4po72Xg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668174856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=coIIhyuiXnYLFo01pBIKB6JYTvWHpv/omCaoVJDpJVg=;
	b=dp0qPLUFHHtY136HpcXF3x8yJlJhKmtWn4q1Z9ZhO7otN+4+TDH5MHXbJ5zxxaIjm2DPmE
	huK/q0vb/nufNPDA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 01/39] PCI/MSI: Check for MSI enabled in __pci_msix_enable()
References: <20221111120501.026511281@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Nov 2022 14:54:15 +0100 (CET)
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

PCI/MSI and PCI/MSI-X are mutually exclusive, but the MSI-X enable code
lacks a check for already enabled MSI.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/msi.c |    5 +++++
 1 file changed, 5 insertions(+)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -935,6 +935,11 @@ static int __pci_enable_msix_range(struc
 	if (maxvec < minvec)
 		return -ERANGE;
 
+	if (dev->msi_enabled) {
+		pci_info(dev, "can't enable MSI-X (MSI already enabled)\n");
+		return -EINVAL;
+	}
+
 	if (WARN_ON_ONCE(dev->msix_enabled))
 		return -EINVAL;
 

