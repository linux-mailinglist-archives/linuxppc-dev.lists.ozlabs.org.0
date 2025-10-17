Return-Path: <linuxppc-dev+bounces-13003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EECBE873C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 13:50:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp3663J3vz3ccf;
	Fri, 17 Oct 2025 22:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760701806;
	cv=none; b=Oyw5GuXpwAg1lIZp0vSnnTXFA+xToww3aloR2HhMwl3BCh9H27SgO21lzUhWE6bgEzLLXtb7Sl+/A6L/kOXyBWEG0/jpyTxdPT2OMCWslq5QSHNAfTDt3xEnm7FQsNltxWBf4rOdqiAHT9cOCB48PuBCU8B3/zj3qEtfDq89Cfylj6hEu7xvM82Y6ee4jdtc6z2Vy9J/d99fq0xREXZ2FsTWWD4f3tIFuLUzdCk1HCCZla84Sstbva93i2L1L45GHLQPf65wjIwFQzmLXsniwVMXJfpN3In3Uc/RVvjq8ZCm+HZKUqYIeXRFvCCE1PXD6odsZHrROT07+H7VoaaX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760701806; c=relaxed/relaxed;
	bh=NhP5yHSzkaDPWLqpuXBS/+D8hI4vZiLRSHobwsC9CXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cW49K9EF+PTxcg0/64yVwhbrXnaGblLRWlZGk8NDMPBM5v2rUyqi3mw0NugTuiZ2YQYz9jbSKM0SVAxlHgQPK70fdW01/TVKUdJGWi0vzkzk/BSWl1mEbDI/xNxww7qsfOpBjFW57nq5GkhIRwgZRCAhzoGMtF4v1+Hvocvpxhgz04jvH53bFvCvOTciXsG3S6pmmEBxO7QsP02iJVr2PlVtDMf1+8kcxWZ+iiN1TUjE5y8/LlfdpCKyHKKiXclBZNjP4DzCmGDghz0uAIhtaiNQXoF5BPwCCOI8ksDg+bfAhzIo8e1bZjW6oaek0hgEy7ewSwoWZ2LoUTUuRHChyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp3654Vr6z3cc0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 22:50:04 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cp17p1rPlz9sST;
	Fri, 17 Oct 2025 12:21:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wz6aRj1H0ZMr; Fri, 17 Oct 2025 12:21:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cp17p15gFz9sSS;
	Fri, 17 Oct 2025 12:21:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0C1888B776;
	Fri, 17 Oct 2025 12:21:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QD1FRUxErKgp; Fri, 17 Oct 2025 12:21:25 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E4BBD8B786;
	Fri, 17 Oct 2025 12:21:24 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Andre Almeida" <andrealmeid@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 02/10] uaccess: Add speculation barrier to copy_from_user_iter()
Date: Fri, 17 Oct 2025 12:20:58 +0200
Message-ID: <69e4b8d8a9bad08848945ae29573045a847755d6.1760529207.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1760529207.git.christophe.leroy@csgroup.eu>
References: <cover.1760529207.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=christophe.leroy@csgroup.eu; h=from:subject:message-id; bh=W82BJoxsF/uaSl8+888M/Hm7CO4JVyWj0vi85xuDhyA=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR8kpiUGdRbJfSwZ0vufBEP2SNqGTqSclcL1i5f4Fm+6 VxiXY1yRykLgxgXg6yYIsvx/9y7ZnR9Sc2fuksfZg4rE8gQBi5OAZjIvg6G/5mqF/9NO7cn2rA5 J7yV6+MjgaXLZ74usSgweu1hmTDX3I6RYbXwTGvZ+LiJU5O+d+y1mLv42uTIHXa2K2dbx9We03D 8wAUA
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
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
index a589935bf3025..896760bad455f 100644
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


