Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E516C4153
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 04:56:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhF500nllz3cMb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 14:56:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=VHZUoNF2;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=D6NpSrCp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=VHZUoNF2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=D6NpSrCp;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhF3y1mr7z3bfp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 14:55:09 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 0D1E33200962;
	Tue, 21 Mar 2023 23:55:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 21 Mar 2023 23:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1679457304; x=1679543704; bh=26SP22EC99
	IRsALQ80DRfYgH2Xkd5IAzoVsWyZ1WOWw=; b=VHZUoNF2KlIpz/2HpAnpVvZ13u
	ADyNqr4xmzecOYwKcBwsQo42Y5yTf7+7arwIOiYKrARK7+YYX1+03iBnpup9lxz1
	saho1a4knGhnH0cxCNmVCwDT/El9L4/sTmHu59Vz0x/rh9xOmCO/oH2SotR2C8lt
	dRvAPfyeDUIcuUN5PP1MoLzHFXMYg8boMomREVkjl18Ej+TfqZB+mOrlV01vhY65
	0leBRCrHVNgNk2fpMZ18lyqvgUhkjSVHw+c4DqYmhmkdtWbkUrUvOqenzXR3+Usz
	wKNYAUgq/f4QFXkqZqLNiVqrnAq6QYOIiz2CPTjc0JUJG6DXY0oZzQAf/vXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679457304; x=1679543704; bh=26SP22EC99IRs
	ALQ80DRfYgH2Xkd5IAzoVsWyZ1WOWw=; b=D6NpSrCp7Nq1UNd9uG57toVtfxsI2
	yk4Hl7U1TnkAbyS6kz+YJRRYV2n71rMPkiYJWbPpxN3w49Q4nj87mtVWB1wxpBvN
	eZdPfdslYoDq52EezKAT4Sn4X7B3pH9n0KREYz2OE//zw6MwyNzNeV58oTzfVTZd
	3eMPtcuETDxYMPQIPEWes2brF6iiBuyFkBM0+qcwbr9eD5CWxy2tBfqobnK18Dgg
	jO7w2dt4eBL6g55ecOls1aP7t4OQVrnywAmpjwntZpW39F4bMrUl+Ck2P2lS8J0S
	+aFU87wHTLerNZ49wcIcR04ZM0I4veMRzkFU3pgG7YWyB9bmbPlsSrfNQ==
X-ME-Sender: <xms:F3waZGEBzeWcTixDZ6W_fVzdYymVDxn3VmDIwfaTPNF0TqgVI8ZQLg>
    <xme:F3waZHXY6LLRIaLSElXWjxGdh0dW9Yz6Un-qxJwJXv1IeA5rq5M4Rb9rkJOWtOaDv
    Eg1bPpCxTbauztfaA>
X-ME-Received: <xmr:F3waZAKg2VjAnTi7JcRSEwSGoc1XuR6gfYumuH7vgeAUMeSv8WEw9nJnD73YpWPQm4EDycYTTE8ynr2N5MnE5cix1-vmd-CuACF887bhkrNBVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeguddgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddt
    necuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhushhsvg
    hllhdrtggtqeenucggtffrrghtthgvrhhnpedvgeduteejgfevveevuddtieegleeuffev
    hfefueehueffkefhffehgeehjefhtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:F3waZAFZJt3TYxSoAl_riY4aDmL4cpF2Ht6wSkpvWVtB39KNHSjt1g>
    <xmx:F3waZMWPesSCrsYnVi_qmDFu0TiEdEr8WnrWcYifdLQRqB_-lnzHGg>
    <xmx:F3waZDPR3KUwnemRDaljBJSJn3XygRMpwmPOrkx-PZ9hhSgQcc-rKw>
    <xmx:GHwaZGdKdyapeuL0z9PiKFneBZgyKXHm1MvqhEJWNb5nKZRfKUkklg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 23:55:01 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/iommu: Fix notifiers being shared by PCI and VIO buses
Date: Wed, 22 Mar 2023 14:53:22 +1100
Message-Id: <20230322035322.328709-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.39.2
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
Cc: ajd@linux.ibm.com, Nageswara R Sastry <rnsastry@linux.ibm.com>, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fail_iommu_setup() registers the fail_iommu_bus_notifier struct to both
PCI and VIO buses.  struct notifier_block is a linked list node, so this
causes any notifiers later registered to either bus type to also be
registered to the other since they share the same node.

This causes issues in (at least) the vgaarb code, which registers a
notifier for PCI buses.  pci_notify() ends up being called on a vio
device, converted with to_pci_dev() even though it's not a PCI device,
and finally makes a bad access in vga_arbiter_add_pci_device() as
discovered with KASAN:

 BUG: KASAN: slab-out-of-bounds in vga_arbiter_add_pci_device+0x60/0xe00
 Read of size 4 at addr c000000264c26fdc by task swapper/0/1

 Call Trace:
 [c000000263607520] [c000000010f7023c] dump_stack_lvl+0x1bc/0x2b8 (unreliable)
 [c000000263607560] [c00000000f142a64] print_report+0x3f4/0xc60
 [c000000263607640] [c00000000f142144] kasan_report+0x244/0x698
 [c000000263607740] [c00000000f1460e8] __asan_load4+0xe8/0x250
 [c000000263607760] [c00000000ff4b850] vga_arbiter_add_pci_device+0x60/0xe00
 [c000000263607850] [c00000000ff4c678] pci_notify+0x88/0x444
 [c0000002636078b0] [c00000000e94dfc4] notifier_call_chain+0x104/0x320
 [c000000263607950] [c00000000e94f050] blocking_notifier_call_chain+0xa0/0x140
 [c000000263607990] [c0000000100cb3b8] device_add+0xac8/0x1d30
 [c000000263607aa0] [c0000000100ccd98] device_register+0x58/0x80
 [c000000263607ad0] [c00000000e84247c] vio_register_device_node+0x9ac/0xce0
 [c000000263607ba0] [c0000000126c95d8] vio_bus_scan_register_devices+0xc4/0x13c
 [c000000263607bd0] [c0000000126c96e4] __machine_initcall_pseries_vio_device_init+0x94/0xf0
 [c000000263607c00] [c00000000e69467c] do_one_initcall+0x12c/0xaa8
 [c000000263607cf0] [c00000001268b8a8] kernel_init_freeable+0xa48/0xba8
 [c000000263607dd0] [c00000000e695f24] kernel_init+0x64/0x400
 [c000000263607e50] [c00000000e68e0e4] ret_from_kernel_thread+0x5c/0x64

Fix this by creating separate notifier_block structs for each bus type.

Fixes: d6b9a81b2a45 ("powerpc: IOMMU fault injection")
Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/kernel/iommu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index ee95937bdaf1..6f1117fe3870 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -171,17 +171,26 @@ static int fail_iommu_bus_notify(struct notifier_block *nb,
 	return 0;
 }
 
-static struct notifier_block fail_iommu_bus_notifier = {
+/*
+ * PCI and VIO buses need separate notifier_block structs, since they're linked
+ * list nodes.  Sharing a notifier_block would mean that any notifiers later
+ * registered for PCI buses would also get called by VIO buses and vice versa.
+ */
+static struct notifier_block fail_iommu_pci_bus_notifier = {
+	.notifier_call = fail_iommu_bus_notify
+};
+
+static struct notifier_block fail_iommu_vio_bus_notifier = {
 	.notifier_call = fail_iommu_bus_notify
 };
 
 static int __init fail_iommu_setup(void)
 {
 #ifdef CONFIG_PCI
-	bus_register_notifier(&pci_bus_type, &fail_iommu_bus_notifier);
+	bus_register_notifier(&pci_bus_type, &fail_iommu_pci_bus_notifier);
 #endif
 #ifdef CONFIG_IBMVIO
-	bus_register_notifier(&vio_bus_type, &fail_iommu_bus_notifier);
+	bus_register_notifier(&vio_bus_type, &fail_iommu_vio_bus_notifier);
 #endif
 
 	return 0;
-- 
2.39.2

