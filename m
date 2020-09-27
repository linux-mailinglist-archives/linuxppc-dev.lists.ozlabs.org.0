Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B492A27A01B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 11:24:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzgGF2QrSzDqT5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Sep 2020 19:24:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bzg4p6DRYzDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 19:16:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bzg4c2PmKz9vCy2;
 Sun, 27 Sep 2020 11:16:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OvIQZTNXh6gz; Sun, 27 Sep 2020 11:16:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bzg4c1XKlz9vCxw;
 Sun, 27 Sep 2020 11:16:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 873FB8B771;
 Sun, 27 Sep 2020 11:16:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3FYPV4w7pxpa; Sun, 27 Sep 2020 11:16:20 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 43B938B75B;
 Sun, 27 Sep 2020 11:16:20 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2890365DE8; Sun, 27 Sep 2020 09:16:20 +0000 (UTC)
Message-Id: <472734be0d9991eee320a06824219a5b2663736b.1601197618.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1601197618.git.christophe.leroy@csgroup.eu>
References: <cover.1601197618.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 03/30] powerpc/vdso: Rename syscall_map_32/64 to simplify
 vdso_setup_syscall_map()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun, 27 Sep 2020 09:16:20 +0000 (UTC)
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

Today vdso_data structure has:
- syscall_map_32[] and syscall_map_64[] on PPC64
- syscall_map_32[] on PPC32

On PPC32, syscall_map_32[] is populated using sys_call_table[].

On PPC64, syscall_map_64[] is populated using sys_call_table[]
and syscal_map_32[] is populated using compat_sys_call_table[].

To simplify vdso_setup_syscall_map(),
- On PPC32 rename syscall_map_32[] into syscall_map[],
- On PPC64 rename syscall_map_64[] into syscall_map[],
- On PPC64 rename syscall_map_32[] into compat_syscall_map[].

That way, syscall_map[] gets populated using sys_call_table[] and
compat_syscall_map[] gets population using compat_sys_call_table[].

Also define an empty compat_syscall_map[] on PPC32 to avoid ifdefs.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso_datapage.h |  7 ++++---
 arch/powerpc/kernel/asm-offsets.c        |  6 ++++--
 arch/powerpc/kernel/vdso.c               | 12 ++----------
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index c4d320504d26..3d996db05acd 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -79,8 +79,8 @@ struct vdso_arch_data {
 	__u32 icache_block_size;		/* L1 i-cache block size     */
 	__u32 dcache_log_block_size;		/* L1 d-cache log block size */
 	__u32 icache_log_block_size;		/* L1 i-cache log block size */
-   	__u32 syscall_map_64[SYSCALL_MAP_SIZE]; /* map of syscalls  */
-   	__u32 syscall_map_32[SYSCALL_MAP_SIZE]; /* map of syscalls */
+	__u32 syscall_map[SYSCALL_MAP_SIZE];	/* Map of syscalls  */
+	__u32 compat_syscall_map[SYSCALL_MAP_SIZE];	/* Map of compat syscalls */
 
 	struct vdso_data data[CS_BASES];
 };
@@ -92,7 +92,8 @@ struct vdso_arch_data {
  */
 struct vdso_arch_data {
 	__u64 tb_ticks_per_sec;		/* Timebase tics / sec		0x38 */
-   	__u32 syscall_map_32[SYSCALL_MAP_SIZE]; /* map of syscalls */
+	__u32 syscall_map[SYSCALL_MAP_SIZE]; /* Map of syscalls */
+	__u32 compat_syscall_map[0];	/* No compat syscalls on PPC32 */
 	struct vdso_data data[CS_BASES];
 };
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 684260186dbf..e48043087208 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -399,13 +399,15 @@ int main(void)
 	/* datapage offsets for use by vdso */
 	OFFSET(VDSO_DATA_OFFSET, vdso_arch_data, data);
 	OFFSET(CFG_TB_TICKS_PER_SEC, vdso_arch_data, tb_ticks_per_sec);
-	OFFSET(CFG_SYSCALL_MAP32, vdso_arch_data, syscall_map_32);
 #ifdef CONFIG_PPC64
 	OFFSET(CFG_ICACHE_BLOCKSZ, vdso_arch_data, icache_block_size);
 	OFFSET(CFG_DCACHE_BLOCKSZ, vdso_arch_data, dcache_block_size);
 	OFFSET(CFG_ICACHE_LOGBLOCKSZ, vdso_arch_data, icache_log_block_size);
 	OFFSET(CFG_DCACHE_LOGBLOCKSZ, vdso_arch_data, dcache_log_block_size);
-	OFFSET(CFG_SYSCALL_MAP64, vdso_arch_data, syscall_map_64);
+	OFFSET(CFG_SYSCALL_MAP64, vdso_arch_data, syscall_map);
+	OFFSET(CFG_SYSCALL_MAP32, vdso_arch_data, compat_syscall_map);
+#else
+	OFFSET(CFG_SYSCALL_MAP32, vdso_arch_data, syscall_map);
 #endif
 
 #ifdef CONFIG_BUG
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index b0332c609104..6d106fcafb9e 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -643,19 +643,11 @@ static void __init vdso_setup_syscall_map(void)
 	unsigned int i;
 
 	for (i = 0; i < NR_syscalls; i++) {
-#ifdef CONFIG_PPC64
 		if (sys_call_table[i] != (unsigned long)&sys_ni_syscall)
-			vdso_data->syscall_map_64[i >> 5] |=
-				0x80000000UL >> (i & 0x1f);
+			vdso_data->syscall_map[i >> 5] |= 0x80000000UL >> (i & 0x1f);
 		if (IS_ENABLED(CONFIG_COMPAT) &&
 		    compat_sys_call_table[i] != (unsigned long)&sys_ni_syscall)
-			vdso_data->syscall_map_32[i >> 5] |=
-				0x80000000UL >> (i & 0x1f);
-#else /* CONFIG_PPC64 */
-		if (sys_call_table[i] != (unsigned long)&sys_ni_syscall)
-			vdso_data->syscall_map_32[i >> 5] |=
-				0x80000000UL >> (i & 0x1f);
-#endif /* CONFIG_PPC64 */
+			vdso_data->compat_syscall_map[i >> 5] |= 0x80000000UL >> (i & 0x1f);
 	}
 }
 
-- 
2.25.0

