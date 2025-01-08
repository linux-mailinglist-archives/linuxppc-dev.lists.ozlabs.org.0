Return-Path: <linuxppc-dev+bounces-4837-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F8A058A6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 11:50:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSl7G4T4Tz30W4;
	Wed,  8 Jan 2025 21:50:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736333418;
	cv=none; b=AGUiADrTLzdQbRZ2c4/zgs8hZIEpUB42bNOHEHBycDMxHY0RTkaRXLHrf8mGJcTrwbEKL1tYPIjrX5L67IDk8e2IU7gpD/2+CaRX2wMEyydarSTaKbTwh+98opL5qAo53IKsvfERAEDngkHdPKD5Ejr5teRVb2AGJpI7A1tztueTATlulfF3DMwuQvywDgnyKYYSmUEKTYtcDTOc1NH9wm/po/3Edk1sJL9oO4piZrECLyDJwLIDBgNDaK/ldj80pzV3hMMBVQuQCGfA5H9q0zuCvqJk/1zZsqEzlEbPRokkgQFEBoYj7uHHTA4rrWAyWBZWP611qejXssKd6TnW1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736333418; c=relaxed/relaxed;
	bh=enDPqdy+waKqCZA1m5JBxNBm/i8mTHWHH4FS1eU+uTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FB7YnYz9385mwOBKxhVlSwhBiGjgFCV5uHrhHUmROFouRTR8985A0a3M5vsTF7A39ux/Cl2eaSkwL2gSCgQYrs9AH2fx9f3ZwK8PrsjADl603Sa+PnL3KnMO0doLOqq5SiuVVakyU8mD4ISzL5N4kkhhJX8MmVUGYtGOrG2Y9pYtbocuipkVqv4xwU9EwVY67219kB0FdAt2g+OV/5jKiBL1MOx0blXDe/XH6xnVMpkvAfflZt/CtN9i1T8V3MDpSftuZaa7Xupy1BVhk+ziGR4hMMYzMLOwfYU+UNJZ/+6DpqbaYBW2wXUTO0iJx3TVpY4nQrNvmV0/8h5g8sK1GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSl7F4G0gz30V2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 21:50:16 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YSkm86Lg3z9sRy;
	Wed,  8 Jan 2025 11:33:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e--y99sG2Jfn; Wed,  8 Jan 2025 11:33:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YSkm85cBwz9sRs;
	Wed,  8 Jan 2025 11:33:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AD3848B768;
	Wed,  8 Jan 2025 11:33:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 6bLrWfcbqmCF; Wed,  8 Jan 2025 11:33:44 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 529B38B767;
	Wed,  8 Jan 2025 11:33:44 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/vmlinux: Remove etext, edata and end
Date: Wed,  8 Jan 2025 11:33:44 +0100
Message-ID: <d1686d36cdd6b9d681e7ee4dd677c386d43babb1.1736332415.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736332424; l=1833; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Ec8kHO58KIDe8CkEYOZ3DpmTBBq0s9B0cs0op2w11bg=; b=XXqtHVK8Df9/x/6YWS10nAklPWrHyTqv87Xqp21Is6AH796OIg066dKRgaQYv10HPHhZbxQGT xI5idU2B/D8DxRm6V5gUZmT6fdD3JkDvhGVDrV9Wz6qEHqgcy2/W3iN
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

etext is not used anymore since commit 843a1ffaf6f2 ("powerpc/mm: use
core_kernel_text() helper")

edata and end have not been used since the merge of arch/ppc/ and
arch/ppc64/

Remove the three and remove macro PROVIDE32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/vmlinux.lds.S     | 9 ---------
 arch/powerpc/kvm/book3s_32_mmu_host.c | 2 --
 2 files changed, 11 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index b4c9decc7a75..de6ee7d35cff 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -1,10 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifdef CONFIG_PPC64
-#define PROVIDE32(x)	PROVIDE(__unused__##x)
-#else
-#define PROVIDE32(x)	PROVIDE(x)
-#endif
-
 #define BSS_FIRST_SECTIONS *(.bss.prominit)
 #define EMITS_PT_NOTE
 #define RO_EXCEPTION_TABLE_ALIGN	0
@@ -127,7 +121,6 @@ SECTIONS
 
 	. = ALIGN(PAGE_SIZE);
 	_etext = .;
-	PROVIDE32 (etext = .);
 
 	/* Read-only data */
 	RO_DATA(PAGE_SIZE)
@@ -394,7 +387,6 @@ SECTIONS
 
 	. = ALIGN(PAGE_SIZE);
 	_edata  =  .;
-	PROVIDE32 (edata = .);
 
 /*
  * And finally the bss
@@ -404,7 +396,6 @@ SECTIONS
 
 	. = ALIGN(PAGE_SIZE);
 	_end = . ;
-	PROVIDE32 (end = .);
 
 	DWARF_DEBUG
 	ELF_DETAILS
diff --git a/arch/powerpc/kvm/book3s_32_mmu_host.c b/arch/powerpc/kvm/book3s_32_mmu_host.c
index 5b7212edbb13..c7e4b62642ea 100644
--- a/arch/powerpc/kvm/book3s_32_mmu_host.c
+++ b/arch/powerpc/kvm/book3s_32_mmu_host.c
@@ -125,8 +125,6 @@ static u32 *kvmppc_mmu_get_pteg(struct kvm_vcpu *vcpu, u32 vsid, u32 eaddr,
 	return (u32*)pteg;
 }
 
-extern char etext[];
-
 int kvmppc_mmu_map_page(struct kvm_vcpu *vcpu, struct kvmppc_pte *orig_pte,
 			bool iswrite)
 {
-- 
2.47.0


