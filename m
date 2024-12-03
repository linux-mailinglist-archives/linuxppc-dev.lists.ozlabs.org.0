Return-Path: <linuxppc-dev+bounces-3753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690CB9E2C46
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 20:46:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2rkv2Hhwz30T9;
	Wed,  4 Dec 2024 06:46:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733255207;
	cv=none; b=j8ZQ/nPZJSjbuXF3nWchn63f7AamWQ3h4286XtHsZtRR6gvXbNMRapvwPoBwNF6s1Uyk09H0rwbo7lOoQuwA5cZfsb/kaO7vUPufsckWvsEBxBFjbygHoI3/u8uJhI3j6B4l3+d6eDvsyosKcnYOQipCouTQhLVkCL9SsdWWruF/nGiwT9Ry42YEIex2/p/Y/Dx1pqZrfSIipLOwj5rDXRvRgrSc3XGA0AZ3C1nJVij+xC0D+BkfNOQUtxs5qpWprSK7r44Za/Gx4jU0IqkhOZGtQ+GTJ/jlh0yOXwsnIp3n7hDENNW80dvU6INe5dPMkQUIyCVsdg/WT/r8VJfcQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733255207; c=relaxed/relaxed;
	bh=aAAI3uJMB1FubERG5GitD/PvY+f9G/J5Gfd8KGH42BY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awk/IEXaTjUIDPxIpjwOmgkSiyvPVgQxATBUF5ywN5EujwVBaMGvSgEfdxGmBY4on8eM+TQ2E0ESun2QNhu9WnMZEpAwZpMjE4NosueiZ+I2KRaXlwsZIFxzyZ8h+SMZPWRw69vmPGGRZqI393SihE1IX/mlOzNFY0r0Lo6JGnQpFK/iitTwLNWUGMAJgQq3ND2BmvxOAxF13k8wNrmlYcsztHGRGn2kpnRaSoFikqHgipqK/XDHqgvGf7iXYhZrt3biKYo+4Z8exhAD96lr09KWLprE51VwRnCcVt3ZA3ZsZO3ynWnRib82VC0zx3ivUAcInMmIcjXBiec0t/riOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2rkt4bTYz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 06:46:46 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y2rkX2QyNz9stL;
	Tue,  3 Dec 2024 20:46:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwoS2xF3MyfF; Tue,  3 Dec 2024 20:46:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y2rkV5pZyz9stJ;
	Tue,  3 Dec 2024 20:46:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B26FB8B763;
	Tue,  3 Dec 2024 20:46:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Rf4C0-DpdxVp; Tue,  3 Dec 2024 20:46:26 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E48148B76C;
	Tue,  3 Dec 2024 20:46:25 +0100 (CET)
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
Subject: [PATCH v4 3/4] powerpc: Prepare arch_static_call_transform() for supporting inline static calls
Date: Tue,  3 Dec 2024 20:44:51 +0100
Message-ID: <7a8b9245e773307c315c2548a4c6cad570ac2648.1733245362.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733255162; l=2238; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=w7NfWT76IPUH9paNfP5yUZDDBPDoYj5iPurgT8mFaks=; b=UOFid3geEIRWDqJio8hU372DJOg+8AyEgiUGBUMnBXwKYm/SVRPlnDeDmt1++gQNbOeuTqlfr sf+HWoDWPi6ADxLk81h3DPc5/BrTjlhwlf1wNxG/vL53eylhLICuWGI
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Reorganise arch_static_call_transform() in order to ease the support
of inline static calls in following patch:
- remove 'target' to nhide whether it is a 'return 0' or not.
- Don't bail out if 'tramp' is NULL, just do nothing until next patch.

Note that 'target' was 'tramp + PPC_SCT_RET0', is_short was perforce
true. So in the 'if (func && !is_short)' leg, target was perforce
equal to 'func'.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/static_call.c | 36 ++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/static_call.c b/arch/powerpc/kernel/static_call.c
index 7cfd0710e757..1b106fbcc567 100644
--- a/arch/powerpc/kernel/static_call.c
+++ b/arch/powerpc/kernel/static_call.c
@@ -8,26 +8,32 @@ void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 {
 	int err;
 	bool is_ret0 = (func == __static_call_return0);
-	unsigned long target = (unsigned long)(is_ret0 ? tramp + PPC_SCT_RET0 : func);
-	bool is_short = is_offset_in_branch_range((long)target - (long)tramp);
-
-	if (!tramp)
-		return;
+	unsigned long _tramp = (unsigned long)tramp;
+	unsigned long _func = (unsigned long)func;
+	unsigned long _ret0 = _tramp + PPC_SCT_RET0;
+	bool is_short = is_offset_in_branch_range((long)func - (long)(site ? : tramp));
 
 	mutex_lock(&text_mutex);
 
-	if (func && !is_short) {
-		err = patch_ulong(tramp + PPC_SCT_DATA, target);
-		if (err)
-			goto out;
+	if (tramp) {
+		if (func && !is_short) {
+			err = patch_ulong(tramp + PPC_SCT_DATA, _func);
+			if (err)
+				goto out;
+		}
+
+		if (!func)
+			err = patch_instruction(tramp, ppc_inst(PPC_RAW_BLR()));
+		else if (is_ret0)
+			err = patch_branch(tramp, _ret0, 0);
+		else if (is_short)
+			err = patch_branch(tramp, _func, 0);
+		else
+			err = patch_instruction(tramp, ppc_inst(PPC_RAW_NOP()));
+	} else {
+		err = 0;
 	}
 
-	if (!func)
-		err = patch_instruction(tramp, ppc_inst(PPC_RAW_BLR()));
-	else if (is_short)
-		err = patch_branch(tramp, target, 0);
-	else
-		err = patch_instruction(tramp, ppc_inst(PPC_RAW_NOP()));
 out:
 	mutex_unlock(&text_mutex);
 
-- 
2.47.0


