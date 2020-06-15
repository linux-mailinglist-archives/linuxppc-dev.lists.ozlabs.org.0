Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE931F9987
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:03:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ltMN6WvRzDqSq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:02:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lsNN293NzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 23:18:42 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49lsNH2FH0z9v1fq;
 Mon, 15 Jun 2020 15:18:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NR_hQvMIYXye; Mon, 15 Jun 2020 15:18:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49lsNH1Sjqz9v1fp;
 Mon, 15 Jun 2020 15:18:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B2A5F8B79B;
 Mon, 15 Jun 2020 15:18:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4aWsEOa-eJZ2; Mon, 15 Jun 2020 15:18:39 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C18C8B79A;
 Mon, 15 Jun 2020 15:18:39 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7F27E65B0E; Mon, 15 Jun 2020 13:18:39 +0000 (UTC)
Message-Id: <795158fc1d2b3dff3bf7347881947a887ea9391a.1592227105.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/ptdump: Fix build failure in hashpagetable.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 15 Jun 2020 13:18:39 +0000 (UTC)
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

H_SUCCESS is only defined when CONFIG_PPC_PSERIES is defined.

!= H_SUCCESS means != 0. Modify the test accordingly.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 65e701b2d2a8 ("powerpc/ptdump: drop non vital #ifdefs")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/ptdump/hashpagetable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index a2c33efc7ce8..5b8bd34cd3a1 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -258,7 +258,7 @@ static int pseries_find(unsigned long ea, int psize, bool primary, u64 *v, u64 *
 	for (i = 0; i < HPTES_PER_GROUP; i += 4, hpte_group += 4) {
 		lpar_rc = plpar_pte_read_4(0, hpte_group, (void *)ptes);
 
-		if (lpar_rc != H_SUCCESS)
+		if (lpar_rc)
 			continue;
 		for (j = 0; j < 4; j++) {
 			if (HPTE_V_COMPARE(ptes[j].v, want_v) &&
-- 
2.25.0

