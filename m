Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B7FD98
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 18:13:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tmmZ66MTzDq7F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 02:13:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="eDN5GMSx"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tmkc2stTzDqKs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 02:12:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44tmkQ2KjPz9v9PT;
 Tue, 30 Apr 2019 18:11:58 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=eDN5GMSx; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id MaxABZu7I_Cm; Tue, 30 Apr 2019 18:11:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44tmkQ0zj6z9tykx;
 Tue, 30 Apr 2019 18:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556640718; bh=WThvMg35+cMW5Y7q2WlLGNaSdHo7IteuweRcj0Q4fHw=;
 h=From:Subject:To:Cc:Date:From;
 b=eDN5GMSxe5O4145L0Q12Qaw5uC1yFI+UUZBqjOzReLM6UDTAZKPKUjeGI2xukh+gw
 DboDWAsGrsEfsIdFgbKrJIxKfHDPf/PSfmMm+FrVnklzOkO8neLAV0o4ILu+pONvlw
 0vgWG1KYG0WmnbwgiHLlAcEm8YNmdjX1d+Ur1N7k=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BDDF88B8F1;
 Tue, 30 Apr 2019 18:11:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5pFLDNQb9zEw; Tue, 30 Apr 2019 18:11:59 +0200 (CEST)
Received: from po16846vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C7908B8DF;
 Tue, 30 Apr 2019 18:11:59 +0200 (CEST)
Received: by po16846vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3E7A767271; Tue, 30 Apr 2019 16:11:59 +0000 (UTC)
Message-Id: <09733bd9d90f2ab9dfee9838442e0bea01df194d.1556640535.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2] powerpc/32s: fix BATs setting with CONFIG_STRICT_KERNEL_RWX
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Serge Belyshev <belyshev@depni.sinp.msu.ru>,
 Segher Boessenkool <segher@kernel.crashing.org>
Date: Tue, 30 Apr 2019 16:11:59 +0000 (UTC)
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

Serge reported some crashes with CONFIG_STRICT_KERNEL_RWX enabled
on a book3s32 machine.

Analysis shows two issues:
- BATs addresses and sizes are not properly aligned.
- There is a gap between the last address covered by BATs and the
first address covered by pages.

Memory mapped with DBATs:
0: 0xc0000000-0xc07fffff 0x00000000 Kernel RO coherent
1: 0xc0800000-0xc0bfffff 0x00800000 Kernel RO coherent
2: 0xc0c00000-0xc13fffff 0x00c00000 Kernel RW coherent
3: 0xc1400000-0xc23fffff 0x01400000 Kernel RW coherent
4: 0xc2400000-0xc43fffff 0x02400000 Kernel RW coherent
5: 0xc4400000-0xc83fffff 0x04400000 Kernel RW coherent
6: 0xc8400000-0xd03fffff 0x08400000 Kernel RW coherent
7: 0xd0400000-0xe03fffff 0x10400000 Kernel RW coherent

Memory mapped with pages:
0xe1000000-0xefffffff  0x21000000       240M        rw       present           dirty  accessed

This patch fixes both issues. With the patch, we get the following
which is as expected:

Memory mapped with DBATs:
0: 0xc0000000-0xc07fffff 0x00000000 Kernel RO coherent
1: 0xc0800000-0xc0bfffff 0x00800000 Kernel RO coherent
2: 0xc0c00000-0xc0ffffff 0x00c00000 Kernel RW coherent
3: 0xc1000000-0xc1ffffff 0x01000000 Kernel RW coherent
4: 0xc2000000-0xc3ffffff 0x02000000 Kernel RW coherent
5: 0xc4000000-0xc7ffffff 0x04000000 Kernel RW coherent
6: 0xc8000000-0xcfffffff 0x08000000 Kernel RW coherent
7: 0xd0000000-0xdfffffff 0x10000000 Kernel RW coherent

Memory mapped with pages:
0xe0000000-0xefffffff  0x20000000       256M        rw       present           dirty  accessed

Reported-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
Fixes: 63b2bc619565 ("powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX")
Cc: stable@vger.kernel.org
Acked-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 v2: Added comment to explain block_size() function as recommended by Segher.

 arch/powerpc/mm/ppc_mmu_32.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/ppc_mmu_32.c b/arch/powerpc/mm/ppc_mmu_32.c
index bf1de3ca39bc..afd8dcb11432 100644
--- a/arch/powerpc/mm/ppc_mmu_32.c
+++ b/arch/powerpc/mm/ppc_mmu_32.c
@@ -98,10 +98,20 @@ static int find_free_bat(void)
 	return -1;
 }
 
+/*
+ * This function calculates the size of the larger block usable to map the
+ * beginning of an area based on the start address and size of that area:
+ * - max block size is 8M on 601 and 256 on other 6xx.
+ * - base address must be aligned to the block size. So the maximum block size
+ *   is identified by the lowest bit set to 1 in the base address (for instance
+ *   if base is 0x16000000, max size is 0x02000000).
+ * - block size has to be a power of two. This is calculated by finding the
+ *   highest bit set to 1.
+ */
 static unsigned int block_size(unsigned long base, unsigned long top)
 {
 	unsigned int max_size = (cpu_has_feature(CPU_FTR_601) ? 8 : 256) << 20;
-	unsigned int base_shift = (fls(base) - 1) & 31;
+	unsigned int base_shift = (ffs(base) - 1) & 31;
 	unsigned int block_shift = (fls(top - base) - 1) & 31;
 
 	return min3(max_size, 1U << base_shift, 1U << block_shift);
@@ -157,7 +167,7 @@ static unsigned long __init __mmu_mapin_ram(unsigned long base, unsigned long to
 
 unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 {
-	int done;
+	unsigned long done;
 	unsigned long border = (unsigned long)__init_begin - PAGE_OFFSET;
 
 	if (__map_without_bats) {
@@ -169,10 +179,10 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		return __mmu_mapin_ram(base, top);
 
 	done = __mmu_mapin_ram(base, border);
-	if (done != border - base)
+	if (done != border)
 		return done;
 
-	return done + __mmu_mapin_ram(border, top);
+	return __mmu_mapin_ram(border, top);
 }
 
 void mmu_mark_initmem_nx(void)
-- 
2.13.3

