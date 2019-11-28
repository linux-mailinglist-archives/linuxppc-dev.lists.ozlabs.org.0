Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2218110C4AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 09:01:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NqpW3LBbzDr0X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 19:01:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="h88ZzfyI"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NqmL3lSKzDqtG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 18:59:29 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47NqmB61v1z9ty0T;
 Thu, 28 Nov 2019 08:59:22 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=h88ZzfyI; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id meBSBU5K6WRx; Thu, 28 Nov 2019 08:59:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47NqmB4d1Yz9ty0S;
 Thu, 28 Nov 2019 08:59:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574927962; bh=bXxBztW5NEcHfvFNCgqAzNMfqGx5TH9U7oF6whJQF44=;
 h=From:Subject:To:Cc:Date:From;
 b=h88ZzfyIM3y2pWCdwKDLZXeCeqTWRUg/ucdcwBiNtflSw4vAx0L/7nCQeIsm4pOUR
 TVGilhkXGftoi+AQt7TR8rpSrtlRmzskFP7OSitGbN5xWW/oZCJjBzCsQVbqmd5RMQ
 7p6Nrb5VcZiQm5HmRUcnyKX72wZd8XpwOAX1/Oak=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 605FA8B877;
 Thu, 28 Nov 2019 08:59:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Sln_taC7m6WY; Thu, 28 Nov 2019 08:59:23 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 468028B767;
 Thu, 28 Nov 2019 08:59:23 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0F69C6B81B; Thu, 28 Nov 2019 07:59:22 +0000 (UTC)
Message-Id: <d42fa9747df5afa41e67b08e374c98d3b40529c9.1574927918.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/fixmap: fix crash with HIGHMEM
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 28 Nov 2019 07:59:22 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit f2bb86937d86 ("powerpc/fixmap: don't clear fixmap area in
paging_init()") removed the clearing of fixmap area in order to
avoid clearing fixmapped areas set earlier.

However unlike all other users of fixmap which use __set_fixmap(),
HIGHMEM functions directly use __set_pte_at(). This means
the page table must pre-exist, otherwise the following crash
can be encoutered due to the lack of entry in the PGD.

Oops: Kernel access of bad area, sig: 11 [#1]
BE PAGE_SIZE=4K MMU=Hash PowerMac
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 5.4.0+ #2528
NIP:  c0144ce8 LR: c0144ccc CTR: 00000080
REGS: ef0b5aa0 TRAP: 0300   Not tainted  (5.4.0+)
MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 44282842  XER: 00000000
DAR: fffdf000 DSISR: 42000000
GPR00: c0144ccc ef0b5b58 ef0b0000 fffdf000 fffdf000 00000000 c0000f7c 00000000
GPR08: c0833000 fffdf000 00000000 ef1c53c9 24042842 00000000 00000000 00000000
GPR16: 00000000 00000000 ef7e7358 effe8160 00000000 c08a9660 c0851644 00000004
GPR24: c08c70a8 00002dc2 00000000 00000001 00000201 effe8160 effe8160 00000000
NIP [c0144ce8] prep_new_page+0x138/0x178
LR [c0144ccc] prep_new_page+0x11c/0x178
Call Trace:
[ef0b5b58] [c0144ccc] prep_new_page+0x11c/0x178 (unreliable)
[ef0b5b88] [c0147218] get_page_from_freelist+0x1fc/0xd88
[ef0b5c38] [c0148328] __alloc_pages_nodemask+0xd4/0xbb4
[ef0b5cf8] [c0142ba8] __vmalloc_node_range+0x1b4/0x2e0
[ef0b5d38] [c0142dd0] vzalloc+0x48/0x58
[ef0b5d58] [c0301c8c] check_partition+0x58/0x244
[ef0b5d78] [c02ffe80] blk_add_partitions+0x44/0x2cc
[ef0b5db8] [c01a32d8] bdev_disk_changed+0x68/0xfc
[ef0b5de8] [c01a4494] __blkdev_get+0x290/0x460
[ef0b5e28] [c02fdd40] __device_add_disk+0x480/0x4d8
[ef0b5e68] [c0810688] brd_init+0xc0/0x188
[ef0b5e88] [c0005194] do_one_initcall+0x40/0x19c
[ef0b5ee8] [c07dd4dc] kernel_init_freeable+0x164/0x230
[ef0b5f28] [c0005408] kernel_init+0x18/0x10c
[ef0b5f38] [c0014274] ret_from_kernel_thread+0x14/0x1c

Partially revert that commit to still clear the fixmap area dedicated
to HIGHMEM.

Fixes: f2bb86937d86 ("powerpc/fixmap: don't clear fixmap area in paging_init()")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/mem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index a39e6408bbc5..ad299e72ec30 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -239,6 +239,12 @@ void __init paging_init(void)
 	phys_addr_t top_of_ram = memblock_end_of_DRAM();
 
 #ifdef CONFIG_HIGHMEM
+	unsigned long v = __fix_to_virt(FIX_KMAP_END);
+	unsigned long end = __fix_to_virt(FIX_KMAP_BEGIN);
+
+	for (; v < end; v += PAGE_SIZE)
+		map_kernel_page(v, 0, __pgprot(0)); /* XXX gross */
+
 	map_kernel_page(PKMAP_BASE, 0, __pgprot(0));	/* XXX gross */
 	pkmap_page_table = virt_to_kpte(PKMAP_BASE);
 
-- 
2.13.3

