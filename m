Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 103085A9602
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 13:49:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJK8v72jcz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 21:49:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJK852vF0z2xZT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 21:49:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MJK7t224Sz9spF;
	Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UXtK-XKVhThw; Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MJK7t1H6Dz9sp7;
	Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A9BC8B788;
	Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0HcmlL4WpmWA; Thu,  1 Sep 2022 13:48:58 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.131])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A38408B764;
	Thu,  1 Sep 2022 13:48:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 281Bmrbb1768893
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 1 Sep 2022 13:48:53 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 281Bmr1r1768892;
	Thu, 1 Sep 2022 13:48:53 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        sv@linux.ibm.com, bgray@linux.ibm.com, agust@denx.de,
        jpoimboe@kernel.org, peterz@infradead.org, jbaron@akamai.com,
        rostedt@goodmis.org, ardb@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com
Subject: [PATCH v3 4/6] static_call_inline: Provide trampoline address when updating sites
Date: Thu,  1 Sep 2022 13:48:23 +0200
Message-Id: <b1441fba3cae8dc7a4def90cbcfd7e62100ff392.1662032631.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1662032631.git.christophe.leroy@csgroup.eu>
References: <cover.1662032631.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662032901; l=1424; s=20211009; h=from:subject:message-id; bh=iaPcJGPBr+7akkSMZQpha0PF06ZbrAuI+md5r5d1jpw=; b=E+g03r66AuQfuqcIEQa/zGKgc3BR8wBKX/EgJIH/iZ3A6OcPnCufDNUKfhNp1CiTnnTvD6ZkSSAk YYU4wVGSCeYNz1/tr+7SbwpMJelF+Y3Lzt0Xfsj1TIqFHf6xP4uj
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
trampoline address when updating sites, so that when the destination
function is too far for a direct function call, the call site is
patched with a call to the trampoline.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/x86/kernel/static_call.c | 2 +-
 kernel/static_call_inline.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/static_call.c b/arch/x86/kernel/static_call.c
index aaaba85d6d7f..1c0072272214 100644
--- a/arch/x86/kernel/static_call.c
+++ b/arch/x86/kernel/static_call.c
@@ -113,7 +113,7 @@ void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 {
 	mutex_lock(&text_mutex);
 
-	if (tramp) {
+	if (tramp && !site) {
 		__static_call_validate(tramp, true, true);
 		__static_call_transform(tramp, __sc_insn(!func, true), func, false);
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
2.37.1

