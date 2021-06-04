Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FA339B90B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 14:31:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxMZc6Mkvz2yxS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 22:31:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxMZD75dsz2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 22:31:14 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FxMZ65Xs1zBCns;
 Fri,  4 Jun 2021 14:31:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUvhFCORwV31; Fri,  4 Jun 2021 14:31:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FxMZ64GJ0zBCmY;
 Fri,  4 Jun 2021 14:31:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8856C8B8A2;
 Fri,  4 Jun 2021 14:31:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id T_jecGVNfPOv; Fri,  4 Jun 2021 14:31:10 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 40FEE8B885;
 Fri,  4 Jun 2021 14:31:10 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E48BF64BD9; Fri,  4 Jun 2021 12:31:09 +0000 (UTC)
Message-Id: <0ad62673d3e063f848e7c99d719bb966efd433e8.1622809833.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/selftests: Use gettid() instead of getppid() for
 null_syscall
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Shuah Khan <shuah@kernel.org>
Date: Fri,  4 Jun 2021 12:31:09 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

gettid() is 10% lighter than getppid(), use it for null_syscall selftest.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/testing/selftests/powerpc/benchmarks/null_syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/benchmarks/null_syscall.c b/tools/testing/selftests/powerpc/benchmarks/null_syscall.c
index 579f0215c6e7..9836838a529f 100644
--- a/tools/testing/selftests/powerpc/benchmarks/null_syscall.c
+++ b/tools/testing/selftests/powerpc/benchmarks/null_syscall.c
@@ -14,6 +14,7 @@
 #include <time.h>
 #include <sys/types.h>
 #include <sys/time.h>
+#include <sys/syscall.h>
 #include <signal.h>
 
 static volatile int soak_done;
@@ -121,7 +122,7 @@ static void do_null_syscall(unsigned long nr)
 	unsigned long i;
 
 	for (i = 0; i < nr; i++)
-		getppid();
+		syscall(__NR_gettid);
 }
 
 #define TIME(A, STR) \
-- 
2.25.0

