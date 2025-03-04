Return-Path: <linuxppc-dev+bounces-6716-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE78BA4F15B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 00:20:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6s996Krsz3btX;
	Wed,  5 Mar 2025 10:20:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741130413;
	cv=none; b=gy63H7FwMuQYNVKfR1Wqy0vVFI4ndo//JRtECwR1uF0/RTDgWFe8O3ITnzrCRV21OoOwCf4llfVSfQJaFrne2Kcx6UGW/OckkWm6xN+XPGstcMs1nhN5dwxNeREG7Fw28ELBM+Vt0xMkX7FbQtDwvGr63cAqRnL7/WasQxZ3w5l467Zoy8XWkTRMVVNhkLghvp/9KEobgYKMTGI2WK++beMr9qADNWG1aJ1O7anEHNVsf/PWNLQqBLYo1MScaiNXOl4AOIQodds5pdWKKDXQUuvOHFteJ+B9nWGfkrfVSf+QoTKbbN3cj6ocmSWMAxIdeT9z/pW9RcD43AWT/SZZbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741130413; c=relaxed/relaxed;
	bh=Nbw6yIg7e5jUPWkVanOP1Ree1vKFbJwEEf4jA24zjxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R5EnnGGOSQT7fj8UjxT+xvMmyPE0aWHagQeyKkGOnfPyi5xnkQFzNHWqReyFuIkP4p5mb7URTpPGl7sc3tdk0mRC2LUXG+mgO3d6dkBucATNTqfaPckbf7RPAqKimG3It2NjtpCuc66ZfKCyOxUpATK8pPxsmWyXAk+WmX0jjMvGb5yJRRVfSBpdImn3/PUOqRxm9A99nQoaYoFEXo9cxZjKYsipgCdaZSe9dWGxUq33Z0hWh6rfkCW1jLeu4kx5xHl4A9IvR1mLgHjs9mYlSi5AcaPIvoU7dS2qxBSm0wdYFbHcv/ayiOfwVOJggraBR3S6wpIlU30J5xyMX7cyNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6s992JPlz309v
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 10:20:13 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z6rkH4Tpfz9stK;
	Wed,  5 Mar 2025 00:00:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vg8UFazMBaqu; Wed,  5 Mar 2025 00:00:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z6rkH3gmRz9stJ;
	Wed,  5 Mar 2025 00:00:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 68B398B776;
	Wed,  5 Mar 2025 00:00:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WgqhTFqhzL8T; Wed,  5 Mar 2025 00:00:23 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A6868B763;
	Wed,  5 Mar 2025 00:00:22 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH] powerpc: Fix 'intra_function_call not a direct call' warning
Date: Wed,  5 Mar 2025 00:00:19 +0100
Message-ID: <88876fb4e412203452e57d1037a1341cf15ccc7b.1741128981.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741129219; l=2054; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=mhbNOqeaG3cayoZ0G+PBgg4dwi61tzwTHcEUa12auuE=; b=7N9scikoa+Nrpe1ZRdjcL9gPR/Fv9oP706Utkehsb5jpMtETPsmWna7UeuR2WrRZqNzuzxEPV Yl2xUJ9+RvLDFWnUJcyDqZ4beL9CAl/sTxFcq+8ZuShM/FEjsmx0abA
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The following build warning have been reported:

  arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: intra_function_call not a direct call
  arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call

This happens due to commit bb7f054f4de2 ("objtool/powerpc: Add support
for decoding all types of uncond branches") because that commit decodes
'bl .+4' as a normal instruction because that instruction is used by
clang instead of 'bcl 20,31,+.4' for relocatable code.

The solution is simply to remove the ANNOTATE_INTRA_FUNCTION_CALL
annotation now that the instruction is not seen as a function call
anymore.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/all/8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com
Fixes: bb7f054f4de2 ("objtool/powerpc: Add support for decoding all types of uncond branches")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/switch.S            | 1 -
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/powerpc/kernel/switch.S b/arch/powerpc/kernel/switch.S
index 608c0ce7cec6..59e3ee99db0e 100644
--- a/arch/powerpc/kernel/switch.S
+++ b/arch/powerpc/kernel/switch.S
@@ -39,7 +39,6 @@ flush_branch_caches:
 
 	// Flush the link stack
 	.rept 64
-	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 	b	1f
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index ea7ad200b330..83f7504349d2 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1524,14 +1524,12 @@ kvm_flush_link_stack:
 
 	/* Flush the link stack. On Power8 it's up to 32 entries in size. */
 	.rept 32
-	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 
 	/* And on Power9 it's up to 64. */
 BEGIN_FTR_SECTION
 	.rept 32
-	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-- 
2.47.0


