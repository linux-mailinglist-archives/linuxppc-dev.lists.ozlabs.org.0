Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 414BA13C0A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 13:23:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yRLC0wFdzDqMC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 23:22:59 +1100 (AEDT)
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
 header.s=mail header.b=h+HvZlR3; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yRG94ggqzDqFS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 23:19:28 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47yRFz3h5Dz9tygB;
 Wed, 15 Jan 2020 13:19:19 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=h+HvZlR3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 25GzTzroursl; Wed, 15 Jan 2020 13:19:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47yRFz2VhGz9tyg9;
 Wed, 15 Jan 2020 13:19:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579090759; bh=KIOCAQ9Fe6n/GOOCwPq4VJ8I0eJP/U15j5u9PAAJKbw=;
 h=From:Subject:To:Cc:Date:From;
 b=h+HvZlR39pQWj8WY7PhUkqgnh36w4wxZPoR1IB4CB0HoI9A+01i+b7KezbVEt960O
 Nsaohe6ktSrSNyHLKRcqHNTJjfPIxwAFqKmhkIbitLMXZu3sVGlF++CuaUn2HrWTiK
 0mvmtrPC8XcESgtNujtaLSS5b98guM9oWpQzoGnE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A6B18B7FE;
 Wed, 15 Jan 2020 13:19:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fG6a9xL6mZpN; Wed, 15 Jan 2020 13:19:20 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 775908B774;
 Wed, 15 Jan 2020 13:19:20 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4738864A1F; Wed, 15 Jan 2020 12:19:20 +0000 (UTC)
Message-Id: <0eddeeb64c97b8b5ce0abd74e88d2cc0303e49c6.1579090596.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH vdsotest] Use vdso wrapper for gettimeofday()
To: Nathan Lynch <nathan_lynch@mentor.com>
Date: Wed, 15 Jan 2020 12:19:20 +0000 (UTC)
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
Cc: Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To properly handle errors returned by gettimeofday(), the
DO_VDSO_CALL() macro has to be used, otherwise vdsotest
misinterpret VDSO function return on error.

This has gone unnoticed until now because the powerpc VDSO
gettimeofday() always succeed, but while porting powerpc to
generic C VDSO, the following has been encountered:

gettimeofday(valid, UINTPTR_MAX) (VDSO): unexpected return value 14, expected -1
gettimeofday(valid, UINTPTR_MAX) (VDSO): exited with status 1, expected 0
gettimeofday(valid, page (PROT_NONE)) (VDSO): unexpected return value 14, expected -1
gettimeofday(valid, page (PROT_NONE)) (VDSO): exited with status 1, expected 0
gettimeofday(valid, page (PROT_READ)) (VDSO): unexpected return value 14, expected -1
gettimeofday(valid, page (PROT_READ)) (VDSO): exited with status 1, expected 0
gettimeofday(UINTPTR_MAX, valid) (VDSO): unexpected return value 14, expected -1
gettimeofday(UINTPTR_MAX, valid) (VDSO): exited with status 1, expected 0
gettimeofday(UINTPTR_MAX, NULL) (VDSO): unexpected return value 14, expected -1
gettimeofday(UINTPTR_MAX, NULL) (VDSO): exited with status 1, expected 0
gettimeofday(UINTPTR_MAX, UINTPTR_MAX) (VDSO): unexpected return value 14, expected -1
gettimeofday(UINTPTR_MAX, UINTPTR_MAX) (VDSO): exited with status 1, expected 0
gettimeofday(UINTPTR_MAX, page (PROT_NONE)) (VDSO): unexpected return value 14, expected -1
gettimeofday(UINTPTR_MAX, page (PROT_NONE)) (VDSO): exited with status 1, expected 0
gettimeofday(UINTPTR_MAX, page (PROT_READ)) (VDSO): unexpected return value 14, expected -1
gettimeofday(UINTPTR_MAX, page (PROT_READ)) (VDSO): exited with status 1, expected 0
gettimeofday(page (PROT_NONE), valid) (VDSO): unexpected return value 14, expected -1
gettimeofday(page (PROT_NONE), valid) (VDSO): exited with status 1, expected 0
gettimeofday(page (PROT_NONE), NULL) (VDSO): unexpected return value 14, expected -1
gettimeofday(page (PROT_NONE), NULL) (VDSO): exited with status 1, expected 0
Failure threshold (10) reached; stopping test.
gettimeofday(page (PROT_NONE), UINTPTR_MAX) (VDSO): unexpected return value 14, expected -1
gettimeofday(page (PROT_NONE), UINTPTR_MAX) (VDSO): exited with status 1, expected 0
Failure threshold (10) reached; stopping test.
gettimeofday(page (PROT_NONE), page (PROT_NONE)) (VDSO): unexpected return value 14, expected -1
gettimeofday(page (PROT_NONE), page (PROT_NONE)) (VDSO): exited with status 1, expected 0
Failure threshold (10) reached; stopping test.
gettimeofday(page (PROT_NONE), page (PROT_READ)) (VDSO): unexpected return value 14, expected -1
gettimeofday(page (PROT_NONE), page (PROT_READ)) (VDSO): exited with status 1, expected 0
Failure threshold (10) reached; stopping test.
gettimeofday(page (PROT_READ), valid) (VDSO): unexpected return value 14, expected -1
gettimeofday(page (PROT_READ), valid) (VDSO): exited with status 1, expected 0
Failure threshold (10) reached; stopping test.
gettimeofday(page (PROT_READ), NULL) (VDSO): unexpected return value 14, expected -1
gettimeofday(page (PROT_READ), NULL) (VDSO): exited with status 1, expected 0
Failure threshold (10) reached; stopping test.
gettimeofday(page (PROT_READ), UINTPTR_MAX) (VDSO): unexpected return value 14, expected -1
gettimeofday(page (PROT_READ), UINTPTR_MAX) (VDSO): exited with status 1, expected 0
Failure threshold (10) reached; stopping test.
gettimeofday(page (PROT_READ), page (PROT_NONE)) (VDSO): unexpected return value 14, expected -1
gettimeofday(page (PROT_READ), page (PROT_NONE)) (VDSO): exited with status 1, expected 0
Failure threshold (10) reached; stopping test.
gettimeofday(page (PROT_READ), page (PROT_READ)) (VDSO): unexpected return value 14, expected -1
gettimeofday(page (PROT_READ), page (PROT_READ)) (VDSO): exited with status 1, expected 0
Failure threshold (10) reached; stopping test.
gettimeofday/abi: 18 failures/inconsistencies encountered

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 src/gettimeofday.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/src/gettimeofday.c b/src/gettimeofday.c
index c50ecea..472f372 100644
--- a/src/gettimeofday.c
+++ b/src/gettimeofday.c
@@ -54,11 +54,16 @@ static void gettimeofday_syscall_nofail(struct timeval *tv, struct timezone *tz)
 		error(EXIT_FAILURE, errno, "SYS_gettimeofday");
 }
 
+static int gettimeofday_vdso_wrapper(struct timeval *tv, struct timezone *tz)
+{
+	return DO_VDSO_CALL(gettimeofday_vdso, int, 2, tv, tz);
+}
+
 static void gettimeofday_vdso_nofail(struct timeval *tv, struct timezone *tz)
 {
 	int err;
 
-	err = gettimeofday_vdso(tv, tz);
+	err = gettimeofday_vdso_wrapper(tv, tz);
 	if (err)
 		error(EXIT_FAILURE, errno, "gettimeofday");
 }
@@ -153,7 +158,7 @@ static void gettimeofday_bench(struct ctx *ctx, struct bench_results *res)
 	struct timeval tv;
 
 	if (vdso_has_gettimeofday()) {
-		BENCH(ctx, gettimeofday_vdso(&tv, NULL),
+		BENCH(ctx, gettimeofday_vdso_wrapper(&tv, NULL),
 		      &res->vdso_interval);
 	}
 
@@ -196,7 +201,7 @@ static void do_gettimeofday(void *arg, struct syscall_result *res)
 	if (args->force_syscall)
 		err = gettimeofday_syscall_wrapper(args->tv, args->tz);
 	else
-		err = gettimeofday_vdso(args->tv, args->tz);
+		err = gettimeofday_vdso_wrapper(args->tv, args->tz);
 	record_syscall_result(res, err, errno);
 }
 
-- 
2.13.3

