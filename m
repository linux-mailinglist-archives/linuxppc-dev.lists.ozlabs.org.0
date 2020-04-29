Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9921BD6C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 10:04:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Brdt2m9RzDqyf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 18:04:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.109.80; helo=2.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 2.mo177.mail-out.ovh.net (2.mo177.mail-out.ovh.net
 [178.33.109.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BrZK1vVWzDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 18:01:36 +1000 (AEST)
Received: from player714.ha.ovh.net (unknown [10.108.42.167])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id BD67C12A67A
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 09:51:39 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 7942911CA9174;
 Wed, 29 Apr 2020 07:51:31 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/3] powerpc/pci: unmap legacy INTx interrupts of passthrough
 IO adapters
Date: Wed, 29 Apr 2020 09:51:21 +0200
Message-Id: <20200429075122.1216388-3-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200429075122.1216388-1-clg@kaod.org>
References: <20200429075122.1216388-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3605975928489151409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedriedvgdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a passthrough IO adapter is removed from a pseries machine using
hash MMU and the XIVE interrupt mode, the POWER hypervisor, pHyp,
expects the guest OS to have cleared all page table entries related to
the adapter. If some are still present, the RTAS call which isolates
the PCI slot returns error 9001 "valid outstanding translations" and
the removal of the IO adapter fails.

INTx interrupt numbers need special care because Linux maps the
interrupts automatically in the Linux interrupt number space if they
are presented in the device tree node describing the IO adapter. These
interrupts are not un-mapped automatically and in case of an hot-plug
adapter, the PCI hot-plug layer needs to handle the cleanup to make
sure that all the page table entries of the XIVE ESB pages are
cleared.

Cc: "Oliver O'Halloran" <oohall@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/kernel/pci-hotplug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
index bf83f76563a3..9e9c6befd7ea 100644
--- a/arch/powerpc/kernel/pci-hotplug.c
+++ b/arch/powerpc/kernel/pci-hotplug.c
@@ -57,6 +57,8 @@ void pcibios_release_device(struct pci_dev *dev)
 	struct pci_controller *phb = pci_bus_to_host(dev->bus);
 	struct pci_dn *pdn = pci_get_pdn(dev);
 
+	irq_dispose_mapping(dev->irq);
+
 	eeh_remove_device(dev);
 
 	if (phb->controller_ops.release_device)
-- 
2.25.4

