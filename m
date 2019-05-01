Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A744E1045D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 05:44:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v45X42xgzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 13:44:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 44v43k5mPKzDqHZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 13:42:58 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id CC6EFAE80053;
 Tue, 30 Apr 2019 23:42:25 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] prom_init: Fetch flatten device tree from the system
 firmware
Date: Wed,  1 May 2019 13:42:21 +1000
Message-Id: <20190501034221.18437-1-aik@ozlabs.ru>
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
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the moment, on 256CPU + 256 PCI devices guest, it takes the guest
about 8.5sec to fetch the entire device tree via the client interface
as the DT is traversed twice - for strings blob and for struct blob.
Also, "getprop" is quite slow too as SLOF stores properties in a linked
list.

However, since [1] SLOF builds flattened device tree (FDT) for another
purpose. [2] adds a new "fdt-fetch" client interface for the OS to fetch
the FDT.

This tries the new method; if not supported, this falls back to
the old method.

There is a change in the FDT layout - the old method produced
(reserved map, strings, structs), the new one receives only strings and
structs from the firmware and adds the final reserved map to the end,
so it is (fw reserved map, strings, structs, reserved map).
This still produces the same unflattened device tree.

This merges the reserved map from the firmware into the kernel's reserved
map. At the moment SLOF generates an empty reserved map so this does not
change the existing behaviour in regard of reservations.

This supports only v17 onward as only that version provides dt_struct_size
which works as "fdt-fetch" only produces v17 blobs.

If "fdt-fetch" is not available, the old method of fetching the DT is used.

[1] https://git.qemu.org/?p=SLOF.git;a=commitdiff;h=e6fc84652c9c00
[2] https://git.qemu.org/?p=SLOF.git;a=commit;h=ecda95906930b80

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/prom_init.c | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index f33ff4163a51..72e7a602b68e 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2457,6 +2457,48 @@ static void __init flatten_device_tree(void)
 		prom_panic("Can't allocate initial device-tree chunk\n");
 	mem_end = mem_start + room;
 
+	hdr = (void *) mem_start;
+	if (!call_prom_ret("fdt-fetch", 2, 1, NULL, mem_start,
+				room - sizeof(mem_reserve_map)) &&
+			hdr->version >= 17) {
+		u32 size;
+		struct mem_map_entry *fwrmap;
+
+		/* Fixup the boot cpuid */
+		hdr->boot_cpuid_phys = cpu_to_be32(prom.cpu);
+
+		/*
+		 * Store the struct and strings addresses, mostly
+		 * for consistency, only dt_header_start actually matters later.
+		 */
+		dt_header_start = mem_start;
+		dt_string_start = mem_start + be32_to_cpu(hdr->off_dt_strings);
+		dt_string_end = dt_string_start +
+			be32_to_cpu(hdr->dt_strings_size);
+		dt_struct_start = mem_start + be32_to_cpu(hdr->off_dt_struct);
+		dt_struct_end = dt_struct_start +
+			be32_to_cpu(hdr->dt_struct_size);
+
+		/*
+		 * Calculate the reserved map location (which we put
+		 * at the blob end) and update total size.
+		 */
+		fwrmap = (void *)(mem_start + be32_to_cpu(hdr->off_mem_rsvmap));
+		hdr->off_mem_rsvmap = hdr->totalsize;
+		size = be32_to_cpu(hdr->totalsize);
+		hdr->totalsize = cpu_to_be32(size + sizeof(mem_reserve_map));
+
+		/* Merge reserved map from firmware to ours */
+		for ( ; fwrmap->size; ++fwrmap)
+			reserve_mem(be64_to_cpu(fwrmap->base),
+					be64_to_cpu(fwrmap->size));
+
+		rsvmap = (u64 *)(mem_start + size);
+
+		prom_debug("Fetched DTB: %d bytes to @%lx\n", size, mem_start);
+		goto finalize_exit;
+	}
+
 	/* Get root of tree */
 	root = call_prom("peer", 1, 1, (phandle)0);
 	if (root == (phandle)0)
@@ -2504,6 +2546,7 @@ static void __init flatten_device_tree(void)
 	/* Version 16 is not backward compatible */
 	hdr->last_comp_version = cpu_to_be32(0x10);
 
+finalize_exit:
 	/* Copy the reserve map in */
 	memcpy(rsvmap, mem_reserve_map, sizeof(mem_reserve_map));
 
-- 
2.17.1

