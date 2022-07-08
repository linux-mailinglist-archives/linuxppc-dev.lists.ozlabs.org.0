Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4D556BE7C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 19:33:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfgPF29Qpz3fD5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 03:33:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfgMZ6CHgz3cKm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 03:32:26 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LfgMH12n6z9tM2;
	Fri,  8 Jul 2022 19:32:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0nxTJTKzkPDW; Fri,  8 Jul 2022 19:32:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LfgMF35gVz9tMB;
	Fri,  8 Jul 2022 19:32:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 566998B7A9;
	Fri,  8 Jul 2022 19:32:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nn8jgeTnKP0l; Fri,  8 Jul 2022 19:32:09 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.202])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C41FE8B763;
	Fri,  8 Jul 2022 19:32:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 268HW5If1000748
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 8 Jul 2022 19:32:05 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 268HW5xw1000747;
	Fri, 8 Jul 2022 19:32:05 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        sv@linux.ibm.com, agust@denx.de, jpoimboe@kernel.org,
        peterz@infradead.org, jbaron@akamai.com, rostedt@goodmis.org,
        ardb@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com
Subject: [PATCH v2 6/7] static_call_inline: Provide trampoline address when updating sites
Date: Fri,  8 Jul 2022 19:31:25 +0200
Message-Id: <5dbe60ab94ea25eb1c1fa08ac3a2d20e870c7969.1657301423.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657301423.git.christophe.leroy@csgroup.eu>
References: <cover.1657301423.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657301483; l=1420; s=20211009; h=from:subject:message-id; bh=LdcW+ZAOPWXfSsYDnKAYak5rrWIQXhfyKBvHGFcZat8=; b=wwcSGXnhV+OCjyh/+73EWsRT+VSwy/wqTX5zY6arEvzh1+Logg7S6kmRsGFkKMcle+R0Ijx71yeF AjVw/I7HDP0v+6tXyDT9fDO3TggUBuEMGg9wAcM6SrDXhZmLNu/u
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: chenzhongjin@huawei.com, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation of support of inline static calls on powerpc, provide
trampoline address when updating sites, so that if the destination
function is too far for a direct function call, the call site will
be patched with a call to the trampoline.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/x86/kernel/static_call.c | 2 +-
 kernel/static_call_inline.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/static_call.c b/arch/x86/kernel/static_call.c
index aa72cefdd5be..4db30b0ea71c 100644
--- a/arch/x86/kernel/static_call.c
+++ b/arch/x86/kernel/static_call.c
@@ -102,7 +102,7 @@ void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 {
 	mutex_lock(&text_mutex);
 
-	if (tramp) {
+	if (tramp && !site) {
 		__static_call_validate(tramp, true, true);
 		__static_call_transform(tramp, __sc_insn(!func, true), func);
 	}
diff --git a/kernel/static_call_inline.c b/kernel/static_call_inline.c
index dc5665b62814..b5de9d92fa4e 100644
--- a/kernel/static_call_inline.c
+++ b/kernel/static_call_inline.c
@@ -195,7 +195,7 @@ void __static_call_update(struct static_call_key *key, void *tramp, void *func)
 				continue;
 			}
 
-			arch_static_call_transform(site_addr, NULL, func,
+			arch_static_call_transform(site_addr, tramp, func,
 						   static_call_is_tail(site));
 		}
 	}
-- 
2.36.1

