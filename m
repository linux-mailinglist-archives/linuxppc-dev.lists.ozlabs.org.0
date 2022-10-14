Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 331D85FF584
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 23:39:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mq0C41CzKz3f0b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 08:39:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=omp.ru (client-ip=90.154.21.10; helo=mx01.omp.ru; envelope-from=s.shtylyov@omp.ru; receiver=<UNKNOWN>)
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mq0B016wkz3drM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 08:38:15 +1100 (AEDT)
Received: from localhost.localdomain (178.176.75.138) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Sat, 15 Oct
 2022 00:23:09 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Oleg Nesterov <oleg@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 10/13] powerpc: ptrace: user_regset_copyin_ignore() always returns 0
Date: Sat, 15 Oct 2022 00:22:32 +0300
Message-ID: <20221014212235.10770-11-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20221014212235.10770-1-s.shtylyov@omp.ru>
References: <20221014212235.10770-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [178.176.75.138]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/14/2022 21:00:39
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 173137 [Oct 14 2022]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 500 500 6cc86d8f5638d79810308830d98d6b6279998c49
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 	omp.ru:7.1.1;127.0.0.199:7.1.2;178.176.75.138:7.7.3;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.75.138
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/14/2022 21:03:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/14/2022 3:23:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
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
Cc: Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

user_regset_copyin_ignore() always returns 0, so checking its result seems
pointless -- don't do this anymore...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 arch/powerpc/kernel/ptrace/ptrace-tm.c   | 10 +++++-----
 arch/powerpc/kernel/ptrace/ptrace-view.c | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-tm.c b/arch/powerpc/kernel/ptrace/ptrace-tm.c
index 44045363a903..210ea834e603 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-tm.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-tm.c
@@ -170,9 +170,9 @@ int tm_cgpr_set(struct task_struct *target, const struct user_regset *regset,
 					 (PT_MAX_PUT_REG + 1) * sizeof(reg));
 
 	if (PT_MAX_PUT_REG + 1 < PT_TRAP && !ret)
-		ret = user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
-						(PT_MAX_PUT_REG + 1) * sizeof(reg),
-						PT_TRAP * sizeof(reg));
+		user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+					  (PT_MAX_PUT_REG + 1) * sizeof(reg),
+					  PT_TRAP * sizeof(reg));
 
 	if (!ret && count > 0) {
 		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &reg,
@@ -183,8 +183,8 @@ int tm_cgpr_set(struct task_struct *target, const struct user_regset *regset,
 	}
 
 	if (!ret)
-		ret = user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
-						(PT_TRAP + 1) * sizeof(reg), -1);
+		user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+					  (PT_TRAP + 1) * sizeof(reg), -1);
 
 	return ret;
 }
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 076d867412c7..ca0bf8da48fd 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -267,9 +267,9 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
 					 (PT_MAX_PUT_REG + 1) * sizeof(reg));
 
 	if (PT_MAX_PUT_REG + 1 < PT_TRAP && !ret)
-		ret = user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
-						(PT_MAX_PUT_REG + 1) * sizeof(reg),
-						PT_TRAP * sizeof(reg));
+		user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+					  (PT_MAX_PUT_REG + 1) * sizeof(reg),
+					  PT_TRAP * sizeof(reg));
 
 	if (!ret && count > 0) {
 		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &reg,
@@ -280,8 +280,8 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
 	}
 
 	if (!ret)
-		ret = user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
-						(PT_TRAP + 1) * sizeof(reg), -1);
+		user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+					  (PT_TRAP + 1) * sizeof(reg), -1);
 
 	return ret;
 }
-- 
2.26.3

