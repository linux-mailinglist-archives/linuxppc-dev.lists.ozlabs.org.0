Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA2017CD79
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 11:11:03 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ZKxr6nHczDr63
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 21:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=VA8mEknU; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ZKw82PygzDr0t
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 21:09:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48ZKw04l91z9tyJV;
 Sat,  7 Mar 2020 11:09:20 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VA8mEknU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 32DtUaR_qY3G; Sat,  7 Mar 2020 11:09:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48ZKw03V1zz9tyJT;
 Sat,  7 Mar 2020 11:09:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1583575760; bh=QF5moGMgYbnR8ZU8yFqiJqUSMgosscuIMeqnvY3R3MA=;
 h=From:Subject:To:Cc:Date:From;
 b=VA8mEknU+jpXH6BiQrTOc8wox0jcH31NzFYTXDaCnZ6ny3nweAZS6E6S6D/N3zmBy
 M9A9AWT58xSzxji9J7FKFCk/K2cDJnXJvkJsqCdubq+yK7erUZDPHnW4j5iCEL6sgI
 r474TiPxz9rPb5IxEtFxAUaR2OYx9DePZg+UfEfY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 995CC8B785;
 Sat,  7 Mar 2020 11:09:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DwWifxh8Ip9Y; Sat,  7 Mar 2020 11:09:16 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5CD438B776;
 Sat,  7 Mar 2020 11:09:16 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1682365494; Sat,  7 Mar 2020 10:09:15 +0000 (UTC)
Message-Id: <b1177cdfc6af74a3e277bba5d9e708c4b3315ebe.1583575707.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32: Fix missing NULL pmd check in virt_to_kpte()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ndesaulniers@google.com
Date: Sat,  7 Mar 2020 10:09:15 +0000 (UTC)
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

Commit 2efc7c085f05 ("powerpc/32: drop get_pteptr()"),
replaced get_pteptr() by virt_to_kpte(). But virt_to_kpte() lacks a
NULL pmd check and returns an invalid non NULL pointer when there
is no page table.

Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Fixes: 2efc7c085f05 ("powerpc/32: drop get_pteptr()")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/pgtable.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index b80bfd41828d..b1f1d5339735 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -54,7 +54,9 @@ static inline pmd_t *pmd_ptr_k(unsigned long va)
 
 static inline pte_t *virt_to_kpte(unsigned long vaddr)
 {
-	return pte_offset_kernel(pmd_ptr_k(vaddr), vaddr);
+	pmd_t *pmd = pmd_ptr_k(vaddr);
+
+	return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
 }
 #endif
 
-- 
2.25.0

