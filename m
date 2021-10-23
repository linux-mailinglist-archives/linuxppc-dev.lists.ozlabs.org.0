Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B4438394
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 13:51:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hc01G6s7pz3dYd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 22:51:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbzxK2Nq0z2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 22:48:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4Hbzwb1M1mz9s2s;
 Sat, 23 Oct 2021 13:47:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nwG5ZYNeWEkC; Sat, 23 Oct 2021 13:47:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by pegase1.c-s.fr (Postfix) with ESMTPS id 4HbzwT0Zmzz9s3C;
 Sat, 23 Oct 2021 13:47:21 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19NBlLG5441196
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 23 Oct 2021 13:47:21 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19NBlLAI441195;
 Sat, 23 Oct 2021 13:47:21 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 10/10] powerpc/fsl_booke: Enable STRICT_KERNEL_RWX
Date: Sat, 23 Oct 2021 13:47:15 +0200
Message-Id: <9737138f02a2bd0de7513ec53b24f8995794af77.1634983809.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <33e7fe0f6134c58e044eb63d3925cd34aa120104.1634983809.git.christophe.leroy@csgroup.eu>
References: <33e7fe0f6134c58e044eb63d3925cd34aa120104.1634983809.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634989633; l=3260; s=20211009;
 h=from:subject:message-id; bh=gC9WcPB8AxP2j0GGRgGuunOL05xj+RMJfTkLVCsfTeE=;
 b=dKBZBIlYfbmQxaENpv/6xsRv3pKN4Nsp63djz3MRXTeSle3y26Zd4no9orD8mUT7PtHzPvSjK50p
 /R2bTDBZCArCExJ+eOSXDOgZXYp9gcFTlTt4LQLnpDUF+rUsOH2V
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable STRICT_KERNEL_RWX on fsl_booke.

For that, we need additional TLBCAMs dedicated to linear mapping,
based on the alignment of _sinittext.

By default, up to 768 Mbytes of memory are mapped.
It uses 3 TLBCAMs of size 256 Mbytes.

With a data alignment of 16, we need up to 9 TLBCAMs:
  16/16/16/16/64/64/64/256/256

With a data alignment of 4, we need up to 12 TLBCAMs:
  4/4/4/4/16/16/16/64/64/64/256/256

With a data alignment of 1, we need up to 15 TLBCAMs:
  1/1/1/1/4/4/4/16/16/16/64/64/64/256/256

By default, set a 16 Mbytes alignment as a compromise between memory
usage and number of TLBCAMs. This can be adjusted manually when needed.

For the time being, it doens't work when the base is randomised.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: No change
---
 arch/powerpc/Kconfig | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6b9f523882c5..939a47642a9c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -139,6 +139,7 @@ config PPC
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx || 40x) && !HIBERNATION
+	select ARCH_HAS_STRICT_KERNEL_RWX	if FSL_BOOKE && !HIBERNATION && !RANDOMIZE_BASE
 	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX && !PPC_BOOK3S_32
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
@@ -778,7 +779,8 @@ config DATA_SHIFT_BOOL
 	bool "Set custom data alignment"
 	depends on ADVANCED_OPTIONS
 	depends on STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE
-	depends on PPC_BOOK3S_32 || (PPC_8xx && !PIN_TLB_DATA && !STRICT_KERNEL_RWX)
+	depends on PPC_BOOK3S_32 || (PPC_8xx && !PIN_TLB_DATA && !STRICT_KERNEL_RWX) || \
+		   FSL_BOOKE
 	help
 	  This option allows you to set the kernel data alignment. When
 	  RAM is mapped by blocks, the alignment needs to fit the size and
@@ -791,11 +793,13 @@ config DATA_SHIFT
 	default 24 if STRICT_KERNEL_RWX && PPC64
 	range 17 28 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
 	range 19 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_8xx
+	range 20 24 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_FSL_BOOKE
 	default 22 if STRICT_KERNEL_RWX && PPC_BOOK3S_32
 	default 18 if (DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
 	default 23 if STRICT_KERNEL_RWX && PPC_8xx
 	default 23 if (DEBUG_PAGEALLOC || KFENCE) && PPC_8xx && PIN_TLB_DATA
 	default 19 if (DEBUG_PAGEALLOC || KFENCE) && PPC_8xx
+	default 24 if STRICT_KERNEL_RWX && FSL_BOOKE
 	default PPC_PAGE_SHIFT
 	help
 	  On Book3S 32 (603+), DBATs are used to map kernel text and rodata RO.
@@ -1123,7 +1127,10 @@ config LOWMEM_CAM_NUM_BOOL
 config LOWMEM_CAM_NUM
 	depends on FSL_BOOKE
 	int "Number of CAMs to use to map low memory" if LOWMEM_CAM_NUM_BOOL
-	default 3
+	default 3 if !STRICT_KERNEL_RWX
+	default 9 if DATA_SHIFT >= 24
+	default 12 if DATA_SHIFT >= 22
+	default 15
 
 config DYNAMIC_MEMSTART
 	bool "Enable page aligned dynamic load address for kernel"
-- 
2.31.1

