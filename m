Return-Path: <linuxppc-dev+bounces-11227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C34B326B6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Aug 2025 05:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c834F5G14z3d9K;
	Sat, 23 Aug 2025 13:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755921037;
	cv=none; b=KoyGBoYXIPcVWFHdAHcCm8Uqe/AJX9avl55h71uZoqKUyuDeTVwuDKiNC074I/Q0E7GeAJaNoyWTwkYtG6s0cvobQRMy17mVwY0FnDytM3S1rFOLGKak7UKChCukZXXvmT1sIGXaki7DuW1uByX8W3bXIaj2BEIIJd+13Zd6yHYAUrzCDAV4AY9FMy1ApfAaBP8xBenND9nq0kmnb4oVlyeW0DQ1K05wF2IwWGF7nRH17Pa6PGpP+UcdIRTcmFE/v7AoimxH6M9cwkWDKkFgXstEfmwKPa0+fhxcWn3SZBaiMgiWUTW1ee0GEHZYYztHMwxLrxmcugnOZWa/rDOIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755921037; c=relaxed/relaxed;
	bh=cMQwBnBBP5+VROS/fzRmjMjvBPSMHFQ5vje/ziRMtMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0567J4sqkvVKW+BwqfPd726z6/Xi9fkESg3s+by9a3NBP8on1M/1NsuTsnHYQaZktvgHqYDMhBg2TKkeOU4JP9DLkhZlPkU2UctUD3Tv8T2NsL1m1rTnCzrmsy6JG9TcYk2a3QoQhhgP2FWAzi0/NIBlSzb8WQtLncXyYzqJ+poNt2GFnMBksD3GRuKvSWYA9GBxOTuQCsY/ByKBYZbtSJXGvPxm6+eqrPPi9cffBF4spiY+zJoxkowpscSF7/ZgaT8dbL5QMt/YDG5djtiJwcKB+USLNGfraFa9TD8JCvhWOsCOdHsif+zrzBs1ZRSXBYL0/r/Fdfn0iHnwMKfsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c834D6x44z3d94
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 13:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c7bGl4ldxz9sSH;
	Fri, 22 Aug 2025 11:58:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MzYiAzePFXF; Fri, 22 Aug 2025 11:58:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c7bGl3zRbz9sSC;
	Fri, 22 Aug 2025 11:58:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6EE2F8B775;
	Fri, 22 Aug 2025 11:58:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Mz748sD3BeoZ; Fri, 22 Aug 2025 11:58:07 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 78E258B780;
	Fri, 22 Aug 2025 11:58:06 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Andre Almeida" <andrealmeid@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-block@vger.kernel.org
Subject: [PATCH v2 01/10] iter: Avoid barrier_nospec() in copy_from_user_iter()
Date: Fri, 22 Aug 2025 11:57:57 +0200
Message-ID: <9aa2e04f1c80d45151e2c3d06a45b6a4f29ff576.1755854833.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1755854833.git.christophe.leroy@csgroup.eu>
References: <cover.1755854833.git.christophe.leroy@csgroup.eu>
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
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755856678; l=1324; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=btOGI5kT/X4BbGkbG9xKSloQXaxXSRXRdA+8gWVdMNQ=; b=U0aP36j9qq2Z+EzK6fHDU51410l7VDxWduQrkADDOwWueGyv0Sg4bw5dV64YBIg/yRboGmHiq A0ibcHLG9K8DbJhbI+wPLCKPMFbswE9LEUkmxBSkb4CSYHqbanY0rSP
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Following patch will add missing barrier_nospec() to
copy_from_user_iter().

Avoid it for architectures supporting masked user
accesses, the same way as done for copy_from_user() by
commit 0fc810ae3ae1 ("x86/uaccess: Avoid barrier_nospec()
in 64-bit copy_from_user()")

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: New in v2
---
 lib/iov_iter.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index f9193f952f49..48bd0cbce8c2 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -49,12 +49,16 @@ size_t copy_from_user_iter(void __user *iter_from, size_t progress,
 
 	if (should_fail_usercopy())
 		return len;
-	if (access_ok(iter_from, len)) {
-		to += progress;
-		instrument_copy_from_user_before(to, iter_from, len);
-		res = raw_copy_from_user(to, iter_from, len);
-		instrument_copy_from_user_after(to, iter_from, len, res);
-	}
+	if (can_do_masked_user_access())
+		iter_from = mask_user_address(iter_from);
+	else if (!access_ok(iter_from, len))
+		return res;
+
+	to += progress;
+	instrument_copy_from_user_before(to, iter_from, len);
+	res = raw_copy_from_user(to, iter_from, len);
+	instrument_copy_from_user_after(to, iter_from, len, res);
+
 	return res;
 }
 
-- 
2.49.0


