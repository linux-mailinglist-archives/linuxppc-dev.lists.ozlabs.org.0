Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B688937F960
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 16:08:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fgtmc5lzyz3062
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 00:08:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MXzdgqO2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MXzdgqO2; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgtm82cVXz2yYS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 00:08:07 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fgtm62S4hz9sWH; Fri, 14 May 2021 00:08:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620914886;
 bh=HxqVSVD+ewH8hKD9t/Jc5Niq1K9LzMMVvOJz/ZBEr2A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MXzdgqO2xXVgG5pbYsNH1Yn1r+qUWP7Eb1nrHhDYZP3e+mGETHGyYWFswiQ0tw7kl
 YzcmrTivoe7Gtb9EVewbYpskUQ8yxtNjKsPCkw60X0HpCF6BGfOyYG50vrDeUW7ShP
 aD7gK6CcMe4mqe8dXB/BsUUDtCZUh+e7gOnKmVg5J99NggKPdgKI2pdSRtXeYwLdvR
 zmgC0vwbrE8irTnPn8KG9tB1zlLsUY2J5b0RdMjlI66W1oGuRTiBjZ2dSO+SAi/K7X
 T1XuQLN9/vT50jjTHNwhBQ2+tR52efa02A1mdHESQYEB2fNRQCc5OGZ0FbjcPJX3zA
 tLxXORIO7jFcQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: Fix stf mitigation patching w/strict RWX &
 hash
Date: Fri, 14 May 2021 00:08:00 +1000
Message-Id: <20210513140800.1391706-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513140800.1391706-1-mpe@ellerman.id.au>
References: <20210513140800.1391706-1-mpe@ellerman.id.au>
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The stf entry barrier fallback is unsafe to execute in a semi-patched
state, which can happen when enabling/disabling the mitigation with
strict kernel RWX enabled and using the hash MMU.

See the previous commit for more details.

Fix it by changing the order in which we patch the instructions.

Note the stf barrier fallback is only used on Power6 or earlier.

Fixes: bd573a81312f ("powerpc/mm/64s: Allow STRICT_KERNEL_RWX again")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/lib/feature-fixups.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index b49bb41e3ec5..71032475aa40 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -150,17 +150,17 @@ static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
 
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-
-		if (types & STF_BARRIER_FALLBACK)
+		// See comment in do_entry_flush_fixups() RE order of patching
+		if (types & STF_BARRIER_FALLBACK) {
+			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
 			patch_branch((struct ppc_inst *)(dest + 1),
-				     (unsigned long)&stf_barrier_fallback,
-				     BRANCH_SET_LINK);
-		else
-			patch_instruction((struct ppc_inst *)(dest + 1),
-					  ppc_inst(instrs[1]));
-
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+				     (unsigned long)&stf_barrier_fallback, BRANCH_SET_LINK);
+		} else {
+			patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
+			patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+			patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		}
 	}
 
 	printk(KERN_DEBUG "stf-barrier: patched %d entry locations (%s barrier)\n", i,
-- 
2.25.1

