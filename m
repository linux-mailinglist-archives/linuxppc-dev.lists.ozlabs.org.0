Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DC34DD3AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 04:43:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKVGk6db2z3bWq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 14:43:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZUzPRFih;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKVFd6bJJz30Fw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 14:42:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZUzPRFih; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KKVFc4VkFz4xgw;
 Fri, 18 Mar 2022 14:42:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1647574948;
 bh=fs1sfM1a0WNHqLNDF0WpkvwVg0RSgcctpUPM+L4RiqQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ZUzPRFihDwA6sknIdgqN2K2HtQoygiXqKpeL2i/M1BIYHnOrk17CW20VJfcvZd9qW
 Nx9yxlXSwmEJ3RGegBwZ+j4z2KN1DKT7fWCSF7aYQLEpWe+uzxbHefR4FqcDWdOIMu
 FFcq7Y1cvO3rCIA20FWj6YJk4lw+G5U1MlD57z5Z5n156HMrdSrJDv5gALD6uE81tz
 GodQIt30ILS6c8GGspgwFztG4cVXAe6Mz3lPn9TE6pZJxooTRB7vkVqXJgPRRQ2xf8
 ed9Cn8WEb5v8+U6nLUfrmvm949TlWJ41LWm/26szbkRmrKSCTj02KxQUdXCTZ+qBip
 v5YO2mtYx88PA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/pseries: Fix use after free in remove_phb_dynamic()
Date: Fri, 18 Mar 2022 14:42:19 +1100
Message-Id: <20220318034219.1188008-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: zdai@linux.ibm.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In remove_phb_dynamic() we use &phb->io_resource, after we've called
device_unregister(&host_bridge->dev). But the unregister may have freed
phb, because pcibios_free_controller_deferred() is the release function
for the host_bridge.

If there are no outstanding references when we call device_unregister()
then phb will be freed out from under us.

This has gone mainly unnoticed, but with slub_debug and page_poison
enabled it can lead to a crash:

  PID: 7574   TASK: c0000000d492cb80  CPU: 13  COMMAND: "drmgr"
   #0 [c0000000e4f075a0] crash_kexec at c00000000027d7dc
   #1 [c0000000e4f075d0] oops_end at c000000000029608
   #2 [c0000000e4f07650] __bad_page_fault at c0000000000904b4
   #3 [c0000000e4f076c0] do_bad_slb_fault at c00000000009a5a8
   #4 [c0000000e4f076f0] data_access_slb_common_virt at c000000000008b30
   Data SLB Access [380] exception frame:
   R0:  c000000000167250    R1:  c0000000e4f07a00    R2:  c000000002a46100
   R3:  c000000002b39ce8    R4:  00000000000000c0    R5:  00000000000000a9
   R6:  3894674d000000c0    R7:  0000000000000000    R8:  00000000000000ff
   R9:  0000000000000100    R10: 6b6b6b6b6b6b6b6b    R11: 0000000000008000
   R12: c00000000023da80    R13: c0000009ffd38b00    R14: 0000000000000000
   R15: 000000011c87f0f0    R16: 0000000000000006    R17: 0000000000000003
   R18: 0000000000000002    R19: 0000000000000004    R20: 0000000000000005
   R21: 000000011c87ede8    R22: 000000011c87c5a8    R23: 000000011c87d3a0
   R24: 0000000000000000    R25: 0000000000000001    R26: c0000000e4f07cc8
   R27: c00000004d1cc400    R28: c0080000031d00e8    R29: c00000004d23d800
   R30: c00000004d1d2400    R31: c00000004d1d2540
   NIP: c000000000167258    MSR: 8000000000009033    OR3: c000000000e9f474
   CTR: 0000000000000000    LR:  c000000000167250    XER: 0000000020040003
   CCR: 0000000024088420    MQ:  0000000000000000    DAR: 6b6b6b6b6b6b6ba3
   DSISR: c0000000e4f07920     Syscall Result: fffffffffffffff2
   [NIP  : release_resource+56]
   [LR   : release_resource+48]
   #5 [c0000000e4f07a00] release_resource at c000000000167258  (unreliable)
   #6 [c0000000e4f07a30] remove_phb_dynamic at c000000000105648
   #7 [c0000000e4f07ab0] dlpar_remove_slot at c0080000031a09e8 [rpadlpar_io]
   #8 [c0000000e4f07b50] remove_slot_store at c0080000031a0b9c [rpadlpar_io]
   #9 [c0000000e4f07be0] kobj_attr_store at c000000000817d8c
  #10 [c0000000e4f07c00] sysfs_kf_write at c00000000063e504
  #11 [c0000000e4f07c20] kernfs_fop_write_iter at c00000000063d868
  #12 [c0000000e4f07c70] new_sync_write at c00000000054339c
  #13 [c0000000e4f07d10] vfs_write at c000000000546624
  #14 [c0000000e4f07d60] ksys_write at c0000000005469f4
  #15 [c0000000e4f07db0] system_call_exception at c000000000030840
  #16 [c0000000e4f07e10] system_call_vectored_common at c00000000000c168

To avoid it, we can take a reference to the host_bridge->dev until we're
done using phb. Then when we drop the reference the phb will be freed.

Fixes: 2dd9c11b9d4d ("powerpc/pseries: use pci_host_bridge.release_fn() to kfree(phb)")
Reported-by: David Dai <zdai@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/pci_dlpar.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
index 90c9d3531694..4ba824568119 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -78,6 +78,9 @@ int remove_phb_dynamic(struct pci_controller *phb)
 
 	pseries_msi_free_domains(phb);
 
+	/* Keep a reference so phb isn't freed yet */
+	get_device(&host_bridge->dev);
+
 	/* Remove the PCI bus and unregister the bridge device from sysfs */
 	phb->bus = NULL;
 	pci_remove_bus(b);
@@ -101,6 +104,7 @@ int remove_phb_dynamic(struct pci_controller *phb)
 	 * the pcibios_free_controller_deferred() callback;
 	 * see pseries_root_bridge_prepare().
 	 */
+	put_device(&host_bridge->dev);
 
 	return 0;
 }
-- 
2.34.1

