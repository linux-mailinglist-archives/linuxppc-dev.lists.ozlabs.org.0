Return-Path: <linuxppc-dev+bounces-3751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6999C9E2C43
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 20:46:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2rkk4s1Bz30Qy;
	Wed,  4 Dec 2024 06:46:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733255198;
	cv=none; b=jpIRQMhSMG1KQAt4TCAn5gbcyPu+G1r7eLwsk15xgh8TAlRf6M56jJMJR+pbqGEdiXUydKSvc9SlfWRf/Q2cnXEPlzCZHzp9GJBxizm7R7wcwtRAvim6oT4vL7Hih2Tz0VKOaXy7tbqjBjLNHJ3kAPtl/bAC7OEnQJAxZbAzCL50EpsWJH6HteYVQldDQkPJ+urpUz4zM/8LK23VptWWdO8FOWQuLZpXoF/4BHzvmX41JruB/4tFKItqi5IfK5kwxENbi8Se780tSoqmT45Yxc0H0w5DW7BF5cE/29LAZ37RKQWcaBQAlZP/TREQbUJL706RHqFHfd1MQCK/Mh7Icg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733255198; c=relaxed/relaxed;
	bh=bsZY+wxPkbLZhEvhJbc0yKB/mjjJuhTg9lAuFRg+MrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I38Jqthdr9SgWZ215ca5cNe60puuxU/+CrclzBcY1m/Pa4TcWKKZ//iroaP6WKOMNcqiWKx1qCcCdBcnzASug2bVNTc4Rz4Xv3h1ZHM828W6ZyTSQ5pK9rfQfJifjjuzc7Om5wxw6xEMMv2Z3vPTcjJQBsvpGnCuPWjtTNZWOyLFPlLhHMG4d5V+pqJtyeSFaY7AaDuT4SHsw0n1wojwFWlL3iCFrbh50f+C/aChT3dHdk4XyxxpuyJxNPlGa7LKUKLyM7eV2KOHLxhnF4DtDDGrfQE+ZmiwuZAZkQfG0JpAUSl21piCWxxS57g4YG4xYQkE5DKYbnWjQNholWa6Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2rkk02JRz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 06:46:37 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y2rkT2frSz9stG;
	Tue,  3 Dec 2024 20:46:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UCG2vu4-nnmU; Tue,  3 Dec 2024 20:46:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y2rkT1jk9z9stD;
	Tue,  3 Dec 2024 20:46:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 212AB8B763;
	Tue,  3 Dec 2024 20:46:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7pxtHpRMStCP; Tue,  3 Dec 2024 20:46:25 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 50EC78B76C;
	Tue,  3 Dec 2024 20:46:24 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 1/4] static_call_inline: Provide trampoline address when updating sites
Date: Tue,  3 Dec 2024 20:44:49 +0100
Message-ID: <5efe0cffc38d6f69b1ec13988a99f1acff551abf.1733245362.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1733245362.git.christophe.leroy@csgroup.eu>
References: <cover.1733245362.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733255162; l=1424; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ayjJhvEnqmcVSyaBeb998Pk3PUd3CnrM4zKpciianxY=; b=02Xc17llbaI9+HAI9fOhqoUpXP83GAbmDUMspEMI0XYRDQgjtkrcMaERuxOP1mNS67iZtKewZ UgUC4pDJ0qpDkFH9z99XF7s8DNM0Zhc9ouFoi9BG6F7WIgo+TnQk8yj
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In preparation of support of inline static calls on powerpc, provide
trampoline address when updating sites, so that when the destination
function is too far for a direct function call, the call site is
patched with a call to the trampoline.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/x86/kernel/static_call.c | 2 +-
 kernel/static_call_inline.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/static_call.c b/arch/x86/kernel/static_call.c
index 4eefaac64c6c..00b2ea40cbef 100644
--- a/arch/x86/kernel/static_call.c
+++ b/arch/x86/kernel/static_call.c
@@ -158,7 +158,7 @@ void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 {
 	mutex_lock(&text_mutex);
 
-	if (tramp) {
+	if (tramp && !site) {
 		__static_call_validate(tramp, true, true);
 		__static_call_transform(tramp, __sc_insn(!func, true), func, false);
 	}
diff --git a/kernel/static_call_inline.c b/kernel/static_call_inline.c
index 5259cda486d0..7fefbb3d8074 100644
--- a/kernel/static_call_inline.c
+++ b/kernel/static_call_inline.c
@@ -206,7 +206,7 @@ void __static_call_update(struct static_call_key *key, void *tramp, void *func)
 				continue;
 			}
 
-			arch_static_call_transform(site_addr, NULL, func,
+			arch_static_call_transform(site_addr, tramp, func,
 						   static_call_is_tail(site));
 		}
 	}
-- 
2.47.0


