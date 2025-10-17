Return-Path: <linuxppc-dev+bounces-13032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D5EBEBE9A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Oct 2025 00:20:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpK516rPFz3cZ9;
	Sat, 18 Oct 2025 09:20:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760739605;
	cv=none; b=eWbrzoM22HoRWCbV6zYF/kWKaaJFB6vKUQHgDp+UsLKW55Ig0mxsdjkcubSUpE18I7n8DkWeNWzRa6VVHMU8iCNKQodMYJaShwQ/RJatUp9VqkY5MHVleXowTMKbYZ1HPrc2Zmhmd8pwcFQzPrGp3+EGoT4Qw7PwpdzmFbYun47Cwioh+yebt8xCJ6DLqUyzjr11SYisXqJPQK/mPem6DSsxnb/BsYNjrWS9MTjcYh0dQIQ0b/q87lqFUehhJ5tAdSJKlJKbozLsO0q6IlQMbuv2gmzvcTkSv80u9B4c0jAVNPfhzzesy3w4Lfcj1rEzrCBRE3Luk4LBCEL1wcE4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760739605; c=relaxed/relaxed;
	bh=fb/jf9XpEZHzpFOZsyVpWj6fs62Tl+Oi8BgvpPUct6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1u9Nge5+bZ60dUOTPVu1QsM9pCZ4PcZxdsfjdapL9t2BgaRtyE9pMwBLylNzuMTxozWFml5++cFdr5UkIErMNJy0ZGH3CEaRCBlVO+XpHMVbvEJiYEs5j9/mW9e9bcaLEyUYbLeLPWlEjvKzFX3w0fO7fdAIkIJvpNYBL1yURPsZdZCExy6F6Cz6xs4AB5nAFGiqQ7ARLJQ8wFg0sdl9caWtIaqsN4zK+q9iAG5fB2wZ/DtG6AvRZZSWjuWcgGehwD1/iQN9jIQNZSswSGTHmBYVvNK5v5Nf/dH4HjrRLWoDPRHpg/Bp7zWNDFSQoPJeXmOlB7QBQXupsaF1s6cXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cpK5118yPz3cZ0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 09:20:04 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cp17n17Mlz9sSK;
	Fri, 17 Oct 2025 12:21:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kRVCKsionrA6; Fri, 17 Oct 2025 12:21:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cp17n0Pcsz9sSH;
	Fri, 17 Oct 2025 12:21:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E3A848B776;
	Fri, 17 Oct 2025 12:21:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Jnja7wOONEjS; Fri, 17 Oct 2025 12:21:24 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C5C1F8B780;
	Fri, 17 Oct 2025 12:21:23 +0200 (CEST)
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
Subject: [PATCH v3 01/10] iter: Avoid barrier_nospec() in copy_from_user_iter()
Date: Fri, 17 Oct 2025 12:20:57 +0200
Message-ID: <09c7c1c9515a2c0b2e1a059a4a5e32a9afe31704.1760529207.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1326; i=christophe.leroy@csgroup.eu; h=from:subject:message-id; bh=CInTZPEi9ILbXu4UpfN2lm4dHyQfqcOZ4rC45zzBAr0=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR8kpjkJLj5Jud2ppKEBQcSri1LDDpe3F0ocnlh7mMLJ pMQjqk7OkpZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBEulYz/OHjur5ulURd7NlJ Zhtvq0ZmLne5e+yarr2/0I3kMzKOzh8Y/ucIVFowKD2e8P3YR+XNpks2pjIfUDy1dN/PWbYNG1W 3P+UGAA==
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
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
index 2fe66a6b8789e..a589935bf3025 100644
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


