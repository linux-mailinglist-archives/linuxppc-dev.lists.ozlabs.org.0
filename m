Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 668F9240390
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 10:50:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ8mf1XVgzDqGT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 18:50:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ8kn3zqGzDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 18:48:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BQ8kV26qXz9tyjJ;
 Mon, 10 Aug 2020 10:48:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id P-CrVAPqBMYy; Mon, 10 Aug 2020 10:48:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BQ8kV0RwNz9tyjD;
 Mon, 10 Aug 2020 10:48:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 657618B7E8;
 Mon, 10 Aug 2020 10:48:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UHjAhuW1vj7f; Mon, 10 Aug 2020 10:48:23 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 475038B7F4;
 Mon, 10 Aug 2020 10:48:22 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 20CB765C27; Mon, 10 Aug 2020 08:48:22 +0000 (UTC)
Message-Id: <5ca1be21fa6ebf73203b45fd9aadd2bafb5e6b15.1597049145.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] recordmcount: Fix build failure on non arm64
To: Gregory Herrero <gregory.herrero@oracle.com>,
 Steven Rostedt (VMware) <rostedt@goodmis.org>,
 Catalin Marinas <catalin.marinas@arm.com>
Date: Mon, 10 Aug 2020 08:48:22 +0000 (UTC)
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
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit ea0eada45632 leads to the following build failure on powerpc:

  HOSTCC  scripts/recordmcount
scripts/recordmcount.c: In function 'arm64_is_fake_mcount':
scripts/recordmcount.c:440: error: 'R_AARCH64_CALL26' undeclared (first use in this function)
scripts/recordmcount.c:440: error: (Each undeclared identifier is reported only once
scripts/recordmcount.c:440: error: for each function it appears in.)
make[2]: *** [scripts/recordmcount] Error 1

Make sure R_AARCH64_CALL26 is always defined.

Fixes: ea0eada45632 ("recordmcount: only record relocation of type R_AARCH64_CALL26 on arm64.")
Cc: Gregory Herrero <gregory.herrero@oracle.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 scripts/recordmcount.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/recordmcount.c b/scripts/recordmcount.c
index e59022b3f125..b9c2ee7ab43f 100644
--- a/scripts/recordmcount.c
+++ b/scripts/recordmcount.c
@@ -42,6 +42,8 @@
 #define R_ARM_THM_CALL		10
 #define R_ARM_CALL		28
 
+#define R_AARCH64_CALL26	283
+
 static int fd_map;	/* File descriptor for file being modified. */
 static int mmap_failed; /* Boolean flag. */
 static char gpfx;	/* prefix for global symbol name (sometimes '_') */
-- 
2.25.0

