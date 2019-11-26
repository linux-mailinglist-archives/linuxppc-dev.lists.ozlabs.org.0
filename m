Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1471710A388
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 18:45:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MrsP6pFXzDqWH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 04:45:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="twpQAMdj"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MrqF09HYzDqBb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 04:43:34 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47Mrq56Ldsz9ty2b;
 Tue, 26 Nov 2019 18:43:29 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=twpQAMdj; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kXcPbgiquUQG; Tue, 26 Nov 2019 18:43:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47Mrq55GWNz9ty2Y;
 Tue, 26 Nov 2019 18:43:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1574790209; bh=Nm8voP3roRsSJAwpWrKFutNy5/buSvyuxten1tQ9gTY=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=twpQAMdj6a4+f20pV4DPDuYjHyRUb/LjKbcEh4ouigrnW0V8x6XCySPnGgAeK0EST
 k4aCausfd1kvRKYBzfgdeKiKY4V2CLEREHbBDsD2Vknlgau3FDGYx2ekGuZzdnhDhH
 UIYAEfaPuxzUib/oq0qgEKSghZqmoU9mG2yg7Ybc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 69C578B81A;
 Tue, 26 Nov 2019 18:43:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AG6IN_c4oP0K; Tue, 26 Nov 2019 18:43:31 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 021B08B825;
 Tue, 26 Nov 2019 18:43:30 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B1F0A6B76D; Tue, 26 Nov 2019 17:43:30 +0000 (UTC)
Message-Id: <081e3b4e3a17a8ec9fdac46b505e3a29ca15f209.1574790198.git.christophe.leroy@c-s.fr>
In-Reply-To: <05105deeaf63bc02151aea2cdeaf525534e0e9d4.1574790198.git.christophe.leroy@c-s.fr>
References: <05105deeaf63bc02151aea2cdeaf525534e0e9d4.1574790198.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 2/2] selftests/powerpc: enable range tests on 8xx in
 ptrace-hwbreak.c selftest
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ravi.bangoria@linux.ibm.com
Date: Tue, 26 Nov 2019 17:43:30 +0000 (UTC)
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

8xx is now able to support any range length so range tests can be enabled.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v2: new
---
 tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
index 7deedbc16b0b..fc477dfe86a2 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
@@ -455,9 +455,8 @@ run_tests(pid_t child_pid, struct ppc_debug_info *dbginfo, bool dawr)
 	if (dbginfo->features & PPC_DEBUG_FEATURE_DATA_BP_RANGE) {
 		test_sethwdebug_exact(child_pid);
 
-		if (!is_8xx)
-			test_sethwdebug_range_aligned(child_pid);
-		if (dawr && !is_8xx) {
+		test_sethwdebug_range_aligned(child_pid);
+		if (dawr || is_8xx) {
 			test_sethwdebug_range_unaligned(child_pid);
 			test_sethwdebug_range_unaligned_dar(child_pid);
 			test_sethwdebug_dawr_max_range(child_pid);
-- 
2.13.3

