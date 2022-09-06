Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1567E5ADCC0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 03:04:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MM6bP09lpz303N
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 11:04:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cPb6o8mE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MM6Zm1NNcz2xTb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 11:03:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cPb6o8mE;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MM6Zh2Wqfz4xD3;
	Tue,  6 Sep 2022 11:03:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662426204;
	bh=2tS8IVZeip4eZMbhArN21gk/eQ3gBWUWsk5eqLjtGYM=;
	h=From:To:Subject:Date:From;
	b=cPb6o8mEolnPe5YsS/arCIsdJNEHt5drR+w2/iUqMeQK+yD91Vzyys9O2k/7bXLys
	 bIDf7+gs3TDAMp37JCUrv6AUu2nt+8+y8diVQUcEE2v+t5j/uO+3dY8CEe4sT3QKwO
	 rDn7V5203TgVM8FJ3/a1AH4UO3SJGoork4mPUhgAqx4vOVaSZa8zVhK6SRf2TP5sW7
	 /binqudqqOxK1rUIQ8dW40XyRiP7k2p/8DN/RHhkuAnUCl/wxiMehQemGzCaY2wTeE
	 yhCUG9vPoixBEKOdtyHoGTMTo1glAyAfAWblvwdPgjKSzzlq7OZp5yvj97DL9xNVFT
	 D+azNeUaA0qrw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/pasemi: Use of_root in pas_pci_init()
Date: Tue,  6 Sep 2022 11:03:13 +1000
Message-Id: <20220906010313.1296714-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently in pas_pci_init() a reference to the root node is leaked due
to a missing of_node_put(). Instead just use of_root directly.

Note that converting to of_find_compatible_node(NULL, ...) would
not be entirely equivalent, because that would check the compatible
property of the root node, whereas using of_root skips checking the root
node and start the search at the first child of the root.

Reported-by: Liang He <windhl@126.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pasemi/pci.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/pci.c b/arch/powerpc/platforms/pasemi/pci.c
index 55f0160910bf..f27d31414737 100644
--- a/arch/powerpc/platforms/pasemi/pci.c
+++ b/arch/powerpc/platforms/pasemi/pci.c
@@ -270,18 +270,12 @@ static int __init pas_add_bridge(struct device_node *dev)
 
 void __init pas_pci_init(void)
 {
-	struct device_node *np, *root;
+	struct device_node *np;
 	int res;
 
-	root = of_find_node_by_path("/");
-	if (!root) {
-		pr_crit("pas_pci_init: can't find root of device tree\n");
-		return;
-	}
-
 	pci_set_flags(PCI_SCAN_ALL_PCIE_DEVS);
 
-	np = of_find_compatible_node(root, NULL, "pasemi,rootbus");
+	np = of_find_compatible_node(of_root, NULL, "pasemi,rootbus");
 	if (np) {
 		res = pas_add_bridge(np);
 		of_node_put(np);
-- 
2.37.2

