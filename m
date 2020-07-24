Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FB922C6E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 15:44:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCr5W4LwczDq8g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 23:43:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqTV5lmdzF0dY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:16:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=biDelgjl; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCqTT73wjz9sSt; Fri, 24 Jul 2020 23:16:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqTT3kNsz9sSy; Fri, 24 Jul 2020 23:16:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595596573;
 bh=CbsqKkEn4vrFG+m2BF7Vu4CO6D3PrzF/OHYt+JnctDQ=;
 h=From:To:Cc:Subject:Date:From;
 b=biDelgjlQ1imHSHW9SB9ceFOEW5BC2gp91n+BJ1QW5jjcLhOMR5NGEfOotMgHZQE3
 NekT0LBSAXWzshCVuB506BuoCTee3p7w598zbgMXwdTe9Eg1ECI9IOTYWUW1ZKdN5d
 DDLN0cFRmNtLKfIPDjXGJphmyhMM0g5T8aH0kWRcDwI5cpHd3MRocnnvjjZwuOXgtP
 +MgLfkrmKQDOfq74TmByyIgePKot8J3Fjzsr8Y28i58tjKD3puNVwnr2GsADALmlDH
 ryFXKuKgO9s9O1BmhKml8PHhAvPVzl7lZoqkz/FY6uMOwPo72luT/hzqHxcDZMKBh/
 ULbMr1o1JDY5Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/sstep: Fix incorrect CONFIG symbol in scv handling
Date: Fri, 24 Jul 2020 23:16:09 +1000
Message-Id: <20200724131609.1640533-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: christophe.leroy@c-s.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When I "fixed" the ppc64e build in Nick's recent patch, I typoed the
CONFIG symbol, resulting in one that doesn't exist. Fix it to use the
correct symbol.

Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: 7fa95f9adaee ("powerpc/64s: system call support for scv/rfscv instructions")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/lib/sstep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 4194119eff82..c58ea9e787cb 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3382,7 +3382,7 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 		regs->msr = MSR_KERNEL;
 		return 1;
 
-#ifdef CONFIG_PPC64_BOOK3S
+#ifdef CONFIG_PPC_BOOK3S_64
 	case SYSCALL_VECTORED_0:	/* scv 0 */
 		regs->gpr[9] = regs->gpr[13];
 		regs->gpr[10] = MSR_KERNEL;
-- 
2.25.1

