Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C613501C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9ScF3sCNz3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 00:59:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Sbx32GXz3bmX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 00:59:21 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F9Sbn1nmCz9v07Q;
 Wed, 31 Mar 2021 15:59:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3rRmCpjMfqXX; Wed, 31 Mar 2021 15:59:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F9Sbn0llnz9v07K;
 Wed, 31 Mar 2021 15:59:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CE458B82A;
 Wed, 31 Mar 2021 15:59:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dLeeJDDL2ccw; Wed, 31 Mar 2021 15:59:18 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EAD958B829;
 Wed, 31 Mar 2021 15:59:17 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A10F867640; Wed, 31 Mar 2021 13:59:17 +0000 (UTC)
Message-Id: <469f37ab91984309eb68c0fb47e8438cdf5b6463.1617198956.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] selftests: timens: Fix gettime_perf to work on powerpc
To: Shuah Khan <shuah@kernel.org>, Andrei Vagin <avagin@gmail.com>,
 Dmitry Safonov <dima@arista.com>
Date: Wed, 31 Mar 2021 13:59:17 +0000 (UTC)
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

On powerpc:
- VDSO library is named linux-vdso32.so.1 or linux-vdso64.so.1
- clock_gettime is named __kernel_clock_gettime()

Ensure gettime_perf tries these names before giving up.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 tools/testing/selftests/timens/gettime_perf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/timens/gettime_perf.c b/tools/testing/selftests/timens/gettime_perf.c
index 7bf841a3967b..6b13dc277724 100644
--- a/tools/testing/selftests/timens/gettime_perf.c
+++ b/tools/testing/selftests/timens/gettime_perf.c
@@ -25,12 +25,20 @@ static void fill_function_pointers(void)
 	if (!vdso)
 		vdso = dlopen("linux-gate.so.1",
 			      RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
+	if (!vdso)
+		vdso = dlopen("linux-vdso32.so.1",
+			      RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
+	if (!vdso)
+		vdso = dlopen("linux-vdso64.so.1",
+			      RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
 	if (!vdso) {
 		pr_err("[WARN]\tfailed to find vDSO\n");
 		return;
 	}
 
 	vdso_clock_gettime = (vgettime_t)dlsym(vdso, "__vdso_clock_gettime");
+	if (!vdso_clock_gettime)
+		vdso_clock_gettime = (vgettime_t)dlsym(vdso, "__kernel_clock_gettime");
 	if (!vdso_clock_gettime)
 		pr_err("Warning: failed to find clock_gettime in vDSO\n");
 
-- 
2.25.0

