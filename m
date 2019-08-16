Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA48FCCF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 09:54:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468wZG4z2kzDrKh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 17:54:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="lvt/3NcS"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468wX907tVzDrJ7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 17:52:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 468wX40Bpwz9tyXd;
 Fri, 16 Aug 2019 09:52:20 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=lvt/3NcS; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xABwuLbzj_RA; Fri, 16 Aug 2019 09:52:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 468wX34sM3z9tyXb;
 Fri, 16 Aug 2019 09:52:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565941939; bh=NVZpQ45mQXEYG6C2v7/MpBMTIZomncVuSbE8wIXGvu4=;
 h=From:Subject:To:Cc:Date:From;
 b=lvt/3NcSJHrHfZ7jQKH+gkHhVhelh1T8NlQai+6/Rj7Gdf7KiFlWkuUgrUA/g47FJ
 O9W80bZamG82xGYj/lG80tupKGtP1+5KQzFAvspDMDjDJ41YCvU/w1a/X0rcIvKCna
 2JEKlxMu6yTnZ2rMV5nZdcy/M0PfNd/2AJ8Yf1pI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C79498B776;
 Fri, 16 Aug 2019 09:52:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id k_440nLP-DAb; Fri, 16 Aug 2019 09:52:20 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AD1EE8B754;
 Fri, 16 Aug 2019 09:52:20 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 993A86B6CD; Fri, 16 Aug 2019 07:52:20 +0000 (UTC)
Message-Id: <c6cea38f90480268d439ca44a645647e260fff09.1565941808.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32: Add warning on misaligned copy_page() or
 clear_page()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 16 Aug 2019 07:52:20 +0000 (UTC)
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

copy_page() and clear_page() expect page aligned destination, and
use dcbz instruction to clear entire cache lines based on the
assumption that the destination is cache aligned.

As shown during analysis of a bug in BTRFS filesystem, a misaligned
copy_page() can create bugs that are difficult to locate (see Link).

Add an explicit WARNING when copy_page() or clear_page() are called
with misaligned destination.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Erhard F. <erhard_f@mailbox.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=204371
---
 arch/powerpc/include/asm/page_32.h | 4 ++++
 arch/powerpc/kernel/misc_32.S      | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/page_32.h b/arch/powerpc/include/asm/page_32.h
index 683dfbc67ca8..d64dfe3ac712 100644
--- a/arch/powerpc/include/asm/page_32.h
+++ b/arch/powerpc/include/asm/page_32.h
@@ -40,6 +40,8 @@ typedef unsigned long long pte_basic_t;
 typedef unsigned long pte_basic_t;
 #endif
 
+#include <asm/bug.h>
+
 /*
  * Clear page using the dcbz instruction, which doesn't cause any
  * memory traffic (except to write out any cache lines which get
@@ -49,6 +51,8 @@ static inline void clear_page(void *addr)
 {
 	unsigned int i;
 
+	WARN_ON((unsigned long)addr & (L1_CACHE_BYTES - 1));
+
 	for (i = 0; i < PAGE_SIZE / L1_CACHE_BYTES; i++, addr += L1_CACHE_BYTES)
 		dcbz(addr);
 }
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index fe4bd321730e..02d90e1ebf65 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -452,7 +452,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
 	stwu	r9,16(r3)
 
 _GLOBAL(copy_page)
+	rlwinm	r5, r3, 0, L1_CACHE_BYTES - 1
 	addi	r3,r3,-4
+
+0:	twnei	r5, 0	/* WARN if r3 is not cache aligned */
+	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
+
 	addi	r4,r4,-4
 
 	li	r5,4
-- 
2.13.3

