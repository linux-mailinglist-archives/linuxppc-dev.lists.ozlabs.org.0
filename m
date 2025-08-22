Return-Path: <linuxppc-dev+bounces-11226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A61AFB3255E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Aug 2025 01:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7x4k3CVWz3cnT;
	Sat, 23 Aug 2025 09:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755904838;
	cv=none; b=Pt/MRRo/ouOW4rNI3TE3uHXV2ePY3QgHCGJjOYkJKfrHgwxrhs7SpdqlDoNqaCXD356aYp4mIdIQkbe5WY8wZUhjzMduCm165cQQDhce9Dz0T6yUPasB885FchzDUvuAfsGOlx9ZiuzzCvcN1BiOwNRR0m+iW+6cmr542KTOdnIlcdPhZOQoqIXN+uMf6+7bFyIx4UFVXjJn5GMMmfbrI0+t2Idd7DHU9rgC60+Ht1HAHf+qmWOaKJnga0Q4nPjoMKw3V83/D3a6Lh0WTQ1071TqtYnxYrBA7ppbAXe1F43OtpH+lAXcbOXghebGJ529poL2DE+HolKWrDkK5wAG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755904838; c=relaxed/relaxed;
	bh=zeGGKSxmF7i3vYkKfI2pzpK4m5vG9ZbzD3DnVV/u23c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Khtz7vaOTsa6Caw4USeWkVuxOPrGAgIyns6xuAxfTrwvIzZ07gB/U4hkpNGy+5x3cDsUsw32/PdppysVPRtJTkDcWZP/KOa5STsytES04cmVcm4Vx1+w3C3oVq55dTD0d/jO767JUAE3FzdUDPjfyElj3TLVhTFpTCvlBitPHPNCnOZokRAYYUrha3niP4O2GaII6zW7YvzGYIYFF+3fuxxXJ8wnjtOhuRsHi+/mI2UwyUV7pLxD6zJI1p7cAImItzFbELnklhONUO+PkvJ6QO5PKtAQa4cTigzXrbo3FVb9K4lnWHhTpIIyURrfx9owCL/GmHANFLWlCSe+F74KMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7x4j4fzzz3cky
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 09:20:37 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c7bGm4MbWz9sSN;
	Fri, 22 Aug 2025 11:58:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1R7C9v1g2tlo; Fri, 22 Aug 2025 11:58:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c7bGm3cnpz9sSL;
	Fri, 22 Aug 2025 11:58:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 687F58B775;
	Fri, 22 Aug 2025 11:58:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 260MbcVDPASD; Fri, 22 Aug 2025 11:58:08 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 754DD8B781;
	Fri, 22 Aug 2025 11:58:07 +0200 (CEST)
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
Subject: [PATCH v2 02/10] uaccess: Add speculation barrier to copy_from_user_iter()
Date: Fri, 22 Aug 2025 11:57:58 +0200
Message-ID: <82b9c88e63a6f1f5926e39471364168b345d84cc.1755854833.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755856678; l=1419; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=XwlsUHUFJUpz+VqDmhFyhZF843JW5vLl0ICFNZPjHwg=; b=OMJi7NtS5t9H8b/LM9QX7LNwGLYVRhm3b1ohh2Ifek1Ac+dVg5W2gO7XbDwDHd3D5fgUdFcH6 CiFpzXB8IzvDR8zy+bYW8ctsDTYL16XT29wlRQ8tKvZye/dJFBYy7QM
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The results of "access_ok()" can be mis-speculated.  The result is that
you can end speculatively:

	if (access_ok(from, size))
		// Right here

For the same reason as done in copy_from_user() by
commit 74e19ef0ff80 ("uaccess: Add speculation barrier to
copy_from_user()"), add a speculation barrier to copy_from_user_iter().

See commit 74e19ef0ff80 ("uaccess: Add speculation barrier to
copy_from_user()") for more details.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 lib/iov_iter.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 48bd0cbce8c2..8d08b3435174 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -49,11 +49,19 @@ size_t copy_from_user_iter(void __user *iter_from, size_t progress,
 
 	if (should_fail_usercopy())
 		return len;
-	if (can_do_masked_user_access())
+	if (can_do_masked_user_access()) {
 		iter_from = mask_user_address(iter_from);
-	else if (!access_ok(iter_from, len))
-		return res;
+	} else {
+		if (!access_ok(iter_from, len))
+			return res;
 
+		/*
+		 * Ensure that bad access_ok() speculation will not
+		 * lead to nasty side effects *after* the copy is
+		 * finished:
+		 */
+		barrier_nospec();
+	}
 	to += progress;
 	instrument_copy_from_user_before(to, iter_from, len);
 	res = raw_copy_from_user(to, iter_from, len);
-- 
2.49.0


