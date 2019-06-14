Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEAA45249
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 05:01:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Q53n5L5nzDrQt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 13:01:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 45Q51l0QWKzDrCP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 12:59:53 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 0E00EAE807F0;
 Thu, 13 Jun 2019 22:59:18 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/pci/of: Parse unassigned resources
Date: Fri, 14 Jun 2019 12:59:16 +1000
Message-Id: <20190614025916.123589-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pseries platform uses the PCI_PROBE_DEVTREE method of PCI probing
which is basically reading "assigned-addresses" of every PCI device.
However if the property is missing or zero sized, then there is
no fallback of any kind and the PCI resources remain undiscovered, i.e.
pdev->resource[] array is empty.

This adds a fallback which parses the "reg" property in pretty much same
way except it marks resources as "unset" which later makes Linux assign
those resources with proper addresses.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

This is an attempts to boot linux directly under QEMU without slof/rtas;
the aim is to use petitboot instead and let the guest kernel configure
devices.

QEMU does not allocate resources, it creates correct "reg" and zero length
"assigned-addresses" (which is probably a bug on its own) which is
normally populated by SLOF later but not during this exercise.

---
 arch/powerpc/kernel/pci_of_scan.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
index 64ad92016b63..cfe6ec3c6aaf 100644
--- a/arch/powerpc/kernel/pci_of_scan.c
+++ b/arch/powerpc/kernel/pci_of_scan.c
@@ -82,10 +82,18 @@ static void of_pci_parse_addrs(struct device_node *node, struct pci_dev *dev)
 	const __be32 *addrs;
 	u32 i;
 	int proplen;
+	bool unset = false;
 
 	addrs = of_get_property(node, "assigned-addresses", &proplen);
 	if (!addrs)
 		return;
+	if (!addrs || !proplen) {
+		addrs = of_get_property(node, "reg", &proplen);
+		if (!addrs || !proplen)
+			return;
+		unset = true;
+	}
+
 	pr_debug("    parse addresses (%d bytes) @ %p\n", proplen, addrs);
 	for (; proplen >= 20; proplen -= 20, addrs += 5) {
 		flags = pci_parse_of_flags(of_read_number(addrs, 1), 0);
@@ -110,6 +118,8 @@ static void of_pci_parse_addrs(struct device_node *node, struct pci_dev *dev)
 			continue;
 		}
 		res->flags = flags;
+		if (unset)
+			res->flags |= IORESOURCE_UNSET;
 		res->name = pci_name(dev);
 		region.start = base;
 		region.end = base + size - 1;
-- 
2.17.1

